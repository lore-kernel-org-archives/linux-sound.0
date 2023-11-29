Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPH24AeO"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67652AF
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262399; x=1732798399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7o5Df0wGKeyYfnVIG1saGTKWLSJETSw4n9hnQZo8JuU=;
  b=iPH24AeOrkwBbbdvt2XXuvGLKvmpOHuJEh8h63GMpI4PpY0s9wPJbO4j
   sdn5B/3dzZpfS0QAtBJkp3vEEvLlbwxSJoxdeCfTWMCa5+eaIs6JIMRyq
   32NYvh45PzvNuGssV6qSSo0tr6CicqkGiGH6W17C+RadpiuV1nDOaG5+B
   6iVrXIWcaF3jQp4b8dYeTxtZBVhweGRv0c6ngPiK0hXNYiP5B5vBFt8A+
   akFXxJWpDB9KVfuFzA1Qg06f41k6/BX04Pq8fMQEx9y3C7o5+rAVPQrk0
   BhlIENkPeCrDwjV0+ZfLIowwH52g4bg3iOV3+9blsHnIQMcLUdwULMmfs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022964"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174647"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 11/13] ASoC: SOF: core: Add helper for initialization of paths, ops
Date: Wed, 29 Nov 2023 14:53:25 +0200
Message-ID: <20231129125327.23708-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sof_init_environment() as a helper function to contain path and ops
initialization.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 56 +++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index f1a083de9f9e..a2e9506e0f85 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -265,6 +265,38 @@ static int sof_select_ipc_and_paths(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int sof_init_environment(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	ret = sof_select_ipc_and_paths(sdev);
+	if (ret)
+		return ret;
+
+	/* init ops, if necessary */
+	ret = sof_ops_init(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* check all mandatory ops */
+	if (!sof_ops(sdev) || !sof_ops(sdev)->probe) {
+		dev_err(sdev->dev, "missing mandatory ops\n");
+		sof_ops_free(sdev);
+		return -EINVAL;
+	}
+
+	if (!sdev->dspless_mode_selected &&
+	    (!sof_ops(sdev)->run || !sof_ops(sdev)->block_read ||
+	     !sof_ops(sdev)->block_write || !sof_ops(sdev)->send_msg ||
+	     !sof_ops(sdev)->load_firmware || !sof_ops(sdev)->ipc_msg_data)) {
+		dev_err(sdev->dev, "missing mandatory DSP ops\n");
+		sof_ops_free(sdev);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  *			FW Boot State Transition Diagram
  *
@@ -503,31 +535,11 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 		}
 	}
 
-	ret = sof_select_ipc_and_paths(sdev);
+	/* Initialize loadable file paths and check the environment validity */
+	ret = sof_init_environment(sdev);
 	if (ret)
 		return ret;
 
-	/* init ops, if necessary */
-	ret = sof_ops_init(sdev);
-	if (ret < 0)
-		return ret;
-
-	/* check all mandatory ops */
-	if (!sof_ops(sdev) || !sof_ops(sdev)->probe) {
-		sof_ops_free(sdev);
-		dev_err(dev, "missing mandatory ops\n");
-		return -EINVAL;
-	}
-
-	if (!sdev->dspless_mode_selected &&
-	    (!sof_ops(sdev)->run || !sof_ops(sdev)->block_read ||
-	     !sof_ops(sdev)->block_write || !sof_ops(sdev)->send_msg ||
-	     !sof_ops(sdev)->load_firmware || !sof_ops(sdev)->ipc_msg_data)) {
-		sof_ops_free(sdev);
-		dev_err(dev, "missing mandatory DSP ops\n");
-		return -EINVAL;
-	}
-
 	INIT_LIST_HEAD(&sdev->pcm_list);
 	INIT_LIST_HEAD(&sdev->kcontrol_list);
 	INIT_LIST_HEAD(&sdev->widget_list);
-- 
2.43.0

