Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuBZJEpE"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9076010C3
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262395; x=1732798395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lqQiFIs0p9s2KrlZP8z+iUyiVQdSrOyJh+D15uaRyLY=;
  b=OuBZJEpEpkcCgolTsNXZDsh05+3iE2xoF3ddZuR/3fwmQhvjxd7F4Zzj
   eiOlgkz+bWQG+X6lZi9x/ssZ6fyE+IBDnTqvRDLk6smFtNkILz1OXuDpm
   XJn3iXjvQHl3Fm9UuGKTJDMgIUu7UrtoLiGXBFRccI8DatZuU4ZQ9rkLZ
   9Pwsl/LVIxSyJ12eLxjAfEHDwYkeSqw+TH9D/7ay8OGR9r4sM859Cr0P6
   ld1Ywg5Jw8Uhm6ZJgGDCMP+s9FpOZMNtkWfTpPwosKscUKWTwMvNpRoqk
   bq/VYnpAFOBYKBKMngn1jY+3KWy3CQ+Q67hpmFvFctIblclOJji39hvCd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022957"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174646"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 10/13] ASoC: SOF: sof-pci-dev: Rely on core to create the file paths
Date: Wed, 29 Nov 2023 14:53:24 +0200
Message-ID: <20231129125327.23708-11-peter.ujfalusi@linux.intel.com>
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
 sound/soc/sof/sof-pci-dev.c | 115 ++++++------------------------------
 1 file changed, 17 insertions(+), 98 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index becc85b27d51..aab5c900cecf 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -233,120 +233,39 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	sof_pdata->desc = desc;
 	sof_pdata->dev = dev;
 
-	sof_pdata->ipc_type = desc->ipc_default;
+	path_override = &sof_pdata->ipc_file_profile_base;
 
 	if (sof_pci_ipc_type < 0) {
-		sof_pdata->ipc_type = desc->ipc_default;
-	} else {
-		dev_info(dev, "overriding default IPC %d to requested %d\n",
-			 desc->ipc_default, sof_pci_ipc_type);
-		if (sof_pci_ipc_type >= SOF_IPC_TYPE_COUNT) {
-			dev_err(dev, "invalid request value %d\n", sof_pci_ipc_type);
-			ret = -EINVAL;
-			goto out;
-		}
-		if (!(BIT(sof_pci_ipc_type) & desc->ipc_supported_mask)) {
-			dev_err(dev, "invalid request value %d, supported mask is %#x\n",
-				sof_pci_ipc_type, desc->ipc_supported_mask);
-			ret = -EINVAL;
-			goto out;
-		}
-		sof_pdata->ipc_type = sof_pci_ipc_type;
-	}
-
-	if (fw_filename) {
-		sof_pdata->fw_filename = fw_filename;
-
-		dev_dbg(dev, "Module parameter used, changed fw filename to %s\n",
-			sof_pdata->fw_filename);
+		path_override->ipc_type = desc->ipc_default;
+	} else if (sof_pci_ipc_type < SOF_IPC_TYPE_COUNT) {
+		path_override->ipc_type = sof_pci_ipc_type;
 	} else {
-		sof_pdata->fw_filename = desc->default_fw_filename[sof_pdata->ipc_type];
+		dev_err(dev, "Invalid IPC type requested: %d\n", sof_pci_ipc_type);
+		ret = -EINVAL;
+		goto out;
 	}
 
-	/*
-	 * for platforms using the SOF community key, change the
-	 * default path automatically to pick the right files from the
-	 * linux-firmware tree. This can be overridden with the
-	 * fw_path kernel parameter, e.g. for developers.
-	 */
-
-	/* alternate fw and tplg filenames ? */
-	if (fw_path) {
-		sof_pdata->fw_filename_prefix = fw_path;
-
-		dev_dbg(dev,
-			"Module parameter used, changed fw path to %s\n",
-			sof_pdata->fw_filename_prefix);
-
-	} else if (dmi_check_system(community_key_platforms) && sof_dmi_use_community_key) {
-		sof_pdata->fw_filename_prefix =
-			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
-				       sof_pdata->desc->default_fw_path[sof_pdata->ipc_type],
-				       "community");
-
-		dev_dbg(dev,
-			"Platform uses community key, changed fw path to %s\n",
-			sof_pdata->fw_filename_prefix);
-	} else {
-		sof_pdata->fw_filename_prefix =
-			sof_pdata->desc->default_fw_path[sof_pdata->ipc_type];
-	}
+	path_override->fw_path = fw_path;
+	path_override->fw_name = fw_filename;
+	path_override->fw_lib_path = lib_path;
+	path_override->tplg_path = tplg_path;
 
-	if (lib_path) {
-		sof_pdata->fw_lib_prefix = lib_path;
-
-		dev_dbg(dev, "Module parameter used, changed fw_lib path to %s\n",
-			sof_pdata->fw_lib_prefix);
-
-	} else if (sof_pdata->desc->default_lib_path[sof_pdata->ipc_type]) {
-		if (dmi_check_system(community_key_platforms) && sof_dmi_use_community_key) {
-			sof_pdata->fw_lib_prefix =
-				devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
-					sof_pdata->desc->default_lib_path[sof_pdata->ipc_type],
-					"community");
-
-			dev_dbg(dev,
-				"Platform uses community key, changed fw_lib path to %s\n",
-				sof_pdata->fw_lib_prefix);
-		} else {
-			sof_pdata->fw_lib_prefix =
-				sof_pdata->desc->default_lib_path[sof_pdata->ipc_type];
-		}
+	if (dmi_check_system(community_key_platforms) &&
+	    sof_dmi_use_community_key) {
+		path_override->fw_path_postfix = "community";
+		path_override->fw_lib_path_postfix = "community";
 	}
 
-	if (tplg_path)
-		sof_pdata->tplg_filename_prefix = tplg_path;
-	else
-		sof_pdata->tplg_filename_prefix =
-			sof_pdata->desc->default_tplg_path[sof_pdata->ipc_type];
-
 	/*
 	 * the topology filename will be provided in the machine descriptor, unless
 	 * it is overridden by a module parameter or DMI quirk.
 	 */
 	if (tplg_filename) {
-		sof_pdata->tplg_filename = tplg_filename;
-
-		dev_dbg(dev, "Module parameter used, changed tplg filename to %s\n",
-			sof_pdata->tplg_filename);
+		path_override->tplg_name = tplg_filename;
 	} else {
 		dmi_check_system(sof_tplg_table);
 		if (sof_dmi_override_tplg_name)
-			sof_pdata->tplg_filename = sof_dmi_override_tplg_name;
-	}
-
-	path_override = &sof_pdata->ipc_file_profile_base;
-	path_override->ipc_type = sof_pdata->ipc_type;
-	path_override->fw_path = fw_path;
-	path_override->fw_name = fw_filename;
-	path_override->fw_lib_path = lib_path;
-	path_override->tplg_path = tplg_path;
-	path_override->tplg_name = sof_pdata->tplg_filename;
-
-	if (dmi_check_system(community_key_platforms) &&
-	    sof_dmi_use_community_key) {
-		path_override->fw_path_postfix = "community";
-		path_override->fw_lib_path_postfix = "community";
+			path_override->tplg_name = sof_dmi_override_tplg_name;
 	}
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
-- 
2.43.0

