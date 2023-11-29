Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2kSR1YC"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F6210E0
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262384; x=1732798384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sYLfqhSfdwPusKgPVDUZjtWRIRsMeQ3oJLzattU+fQI=;
  b=a2kSR1YC/qJqRbh7jyV/CsJv8E7v1GgruwqjuZaQDjIEYNLxCv3FqVtz
   MjeR2w8PWbrp0PtMDI/R+B1NmdGx+JI+GYHBWV0OgDA3cuLYo9X+J866/
   8/OXuBKkPybAy5XzKTjG+1yXcA8BLBPN1aaUBDcqGFsTP7imoTiBjHFx7
   Jp05piJb64UcERDowCTZu2RmginfzU3FxlPiFVCZ7xbfZxPkGjgn5byj3
   fweSlxWrKrjonm3MhsCQxx/N6Qu1uLCt7oUL+0qUN6Nw2fUFHdscR1u6y
   wxl1v+VUMWaLP+4qJkNfQDqOZ8SbddBXQocbeFMdUmUwdTlkJenM7ir5+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022908"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174623"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:02 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 05/13] ASoC: SOF: sof-of-dev: Save the default IPC type and path overrides
Date: Wed, 29 Nov 2023 14:53:19 +0200
Message-ID: <20231129125327.23708-6-peter.ujfalusi@linux.intel.com>
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

Store the default IPC type and the firmware and topology path overrides to
ipc_file_profile_base

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-of-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 432b511bf8c4..7b58f45790f7 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -99,6 +99,10 @@ int sof_of_probe(struct platform_device *pdev)
 	else
 		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
+	sof_pdata->ipc_file_profile_base.ipc_type = desc->ipc_default;
+	sof_pdata->ipc_file_profile_base.fw_path = fw_path;
+	sof_pdata->ipc_file_profile_base.tplg_path = tplg_path;
+
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_of_probe_complete;
 
-- 
2.43.0

