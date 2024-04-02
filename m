Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451F13173C
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071128; cv=none; b=r35iLfQxh/m2/nApPYKtHfcC3Yd6q6Dtn9UXFT1zwcwp7eofmrn3KlvigSLYxRlJyXdleEyXDkqXC+rXTCFUqvQ1dohfSQsUTFSzGcCCt0jlW1jmkLTFvkMBTtGyPoK4SDtfCuQeiTF1o8zCft1mvui4DKrTklWBYku53sss+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071128; c=relaxed/simple;
	bh=49ld4xJDHyZWnbGo+NFQDCKqv0fbH2lyVV3hubBlVwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IRV80m6DdhiWA/IOMTF9aWCPhcwYaSOujrjaXC9qxB5JS5aAJtPTp3YYXY9X2pq2q6iwbqynJ1NDyFSSgQRKuN+6pjn0NXpLuwwkktOnzDzWoKPrtnJ642vkNRfHH/KwFMsclxQgVR7016bW1o6KMR5AjKI+X3kRifR5WqBtxj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHrhkiD0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHrhkiD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071127; x=1743607127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=49ld4xJDHyZWnbGo+NFQDCKqv0fbH2lyVV3hubBlVwQ=;
  b=IHrhkiD0oLHXlXgMkR2KHWz18Wi8BBLOyE7qWUR+fkXINlvsZJSIpTHQ
   tJ9jRJBeGfb98WJ67GbYcDddccvd3Vu0F4orvM1I6lRU77HlK1gMLb3zY
   wD1qnaoCcNzXdHDT+LiFCVVAwbXZFqE2Ux1mgy+2HMZRK65hVbm3v3VRU
   TD8MiRK7ulg9HkUlJtJ3ZtuLM+krUI9ZrmgqJHITGxPJPglumdqUQ+nwV
   eNzJgpjJMEewFQkJW9KKnBSN2J5wiWHDfWZdJfAWPR+HU/KZw+1tv4kjX
   4pTcT9AbFDtWiheHRWOY4dTz8NirkSetGXKOC+KnEOW11vM4XwvmRp59L
   g==;
X-CSE-ConnectionGUID: rbGPA6LlSYigPvpZEOqqIw==
X-CSE-MsgGUID: cPRwadZASJKtmO3o0OzaLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730141"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:45 -0700
X-CSE-ConnectionGUID: vqu8mBJnTEqoCOWdzxkO7Q==
X-CSE-MsgGUID: tkvqeGYSQGebpCJPTkW9cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796534"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/17] ASoC: SOF: Intel: hda: Clear Soundwire node ID during BE DAI hw_free
Date: Tue,  2 Apr 2024 10:18:23 -0500
Message-Id: <20240402151828.175002-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When an xrun happens, the BE DAI hw_params doesn't get invoked before
the stream restarts with a prepare. In this case, clearing the node ID
when the DAI widget is freed and unprepared will result in an error when
it is re-initialized. In order to avoid this, move the code to clear the
node ID to the BE DAI hw_free op to keep it balanced with the BE DAI
hw_params.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c     | 24 ++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.c |  4 ----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ae1a38f20bdb..2c64c25d6f3b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -31,6 +31,7 @@
 #include "../sof-audio.h"
 #include "../sof-pci-dev.h"
 #include "../ops.h"
+#include "../ipc4-topology.h"
 #include "hda.h"
 #include "telemetry.h"
 
@@ -150,8 +151,31 @@ static int sdw_params_stream(struct device *dev,
 	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_PARAMS, &data);
 }
 
+static int sdw_params_free(struct device *dev, struct sdw_intel_stream_free_data *free_data)
+{
+	struct snd_soc_dai *d = free_data->dai;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, free_data->substream->stream);
+	struct snd_sof_dev *sdev = widget_to_sdev(w);
+
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+		struct snd_sof_widget *swidget = w->dobj.private;
+		struct snd_sof_dai *dai = swidget->private;
+		struct sof_ipc4_copier_data *copier_data;
+		struct sof_ipc4_copier *ipc4_copier;
+
+		ipc4_copier = dai->private;
+		copier_data = &ipc4_copier->data;
+
+		/* clear the node ID */
+		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+	}
+
+	return 0;
+}
+
 struct sdw_intel_ops sdw_callback = {
 	.params_stream = sdw_params_stream,
+	.free_stream = sdw_params_free,
 };
 
 static int sdw_ace2x_params_stream(struct device *dev,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 6b9b16f3157e..e0e4f356275f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1296,7 +1296,6 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 		}
 
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
-			struct sof_ipc4_copier_data *copier_data = &ipc4_copier->data;
 			struct sof_ipc4_alh_configuration_blob *blob;
 			unsigned int group_id;
 
@@ -1306,9 +1305,6 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 					   ALH_MULTI_GTW_BASE;
 				ida_free(&alh_group_ida, group_id);
 			}
-
-			/* clear the node ID */
-			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		}
 	}
 
-- 
2.40.1

