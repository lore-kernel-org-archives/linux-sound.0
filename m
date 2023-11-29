Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBwD9AJQ"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0AC10C3
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262391; x=1732798391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwkJ4JpFAhafLWsA+PodhPkUe4hcZqJFbYrmTFDkhBU=;
  b=FBwD9AJQeByT2LuAopNWp+2Egnihy84T0SaWGsJ4L9MWKDgT2PfFVwM7
   c5RJzcuiDAEWkYgkKgB0o9xXM3jX95SaX4vJcSiz+XmPBLk84UIBzhHNI
   nMlMxyY13/uiNykp3iFIW5/+yvpimrb4P2SaD8ipYkkKhn0Bf5X2XQQhh
   8kq3F9V30ua3xTeCyuOWAKO3UOSvwHWwmz+7xHHyvG9Jfh5f5tsJpurZB
   9v1FZQc+NpxVlngPl7IKf3Q6rh3XXbOgRb0Aoo0KFOv/49BaalsZW5m+y
   ORv3UVZetblS1Ob28B5gUdu0I0u0mic9fEA85OW/Hs4U6wCfGkkGQ8TCn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022945"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174643"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 08/13] ASoC: SOF: sof-acpi-dev: Rely on core to create the file paths
Date: Wed, 29 Nov 2023 14:53:22 +0200
Message-ID: <20231129125327.23708-9-peter.ujfalusi@linux.intel.com>
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

The core is now using the information from ipc_file_profile_base to create
the paths for the loadable files, no need to set it in here anymore.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 87c0c2edc4c9..2977f0a63fba 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -74,18 +74,6 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC_TYPE_3];
-
-	/* alternate fw and tplg filenames ? */
-	if (fw_path)
-		sof_pdata->fw_filename_prefix = fw_path;
-	else
-		sof_pdata->fw_filename_prefix = desc->default_fw_path[SOF_IPC_TYPE_3];
-
-	if (tplg_path)
-		sof_pdata->tplg_filename_prefix = tplg_path;
-	else
-		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
 	sof_pdata->ipc_file_profile_base.ipc_type = desc->ipc_default;
 	sof_pdata->ipc_file_profile_base.fw_path = fw_path;
-- 
2.43.0

