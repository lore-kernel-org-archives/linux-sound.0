Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236E1BAEDA
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761964; cv=none; b=R8zIHzrIT7u0RhnCXY0M22IPjuO4xrySSz+y+Pgaak6GMm8uEtald3Re+QDKTHb6jsC6SSAlLqbjPVg9D41Rp05aIqXzXi4Os3Ig7pytr+FoDVU5hLUFKK5Lbk9mgf051CVjKeH0dAI86gO5h5L01AARhZZ6IgpyLfK/kZNJVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761964; c=relaxed/simple;
	bh=LlW3KEo2/oGjxRJrsaksJVpTotQd0KVu179YH7KjAHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSU7MjwAd3Nmnsz1FvffPPJhVhR/RCPnD/kgVqViBR7QYr55UeImSHWUfk9r7MZ6DS2tn+Gq+6ljGyTM+kmmR8C+pf3EapaawTjtK/f2qBvYZ1LE+sopnXSxwg8jEogT7QOdiyUS/GfRez38BhxpVGe2WEJOnXGHdi4zLoK6AHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQ4z2TXx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQ4z2TXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761962; x=1756297962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LlW3KEo2/oGjxRJrsaksJVpTotQd0KVu179YH7KjAHY=;
  b=aQ4z2TXx6yRLZa0EFmWQ0J5MbL5xA8MfybCPxPFrFa7WjubmRIJX+jUP
   7Dal/l8ckyL9Ms0m8ZAZ0a1fw/C5BTrJt0IAgQ+pPwstFHvhRT7ER4IU0
   +uBOqhJ0cE6EjNVIGiXsOHpmk7T7ffyuN6mf9ml2d9Vc9gowpnJGZcRKX
   H6WyZRpxlm1Fdfq951THVyN8/6iBV7ZY1/DAR3HnwfgS340jTJmHueyfU
   zHeUvdp6udJ5SiXwCRDQN131iFzoH3ynR/KxJXGNdzrgWk8VEfmc+u1Vr
   9wEOOIZBxgAul2/tjtKPfaiew+NrpoGec+wVexfa+0zr1kQgUyLMpj8hr
   Q==;
X-CSE-ConnectionGUID: dWvvczBHSyea7LY/5KfMPw==
X-CSE-MsgGUID: mFHja1GoR6ajGRiJfmlpNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235498"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235498"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:42 -0700
X-CSE-ConnectionGUID: 44B7cdR0S4K57stQJH1PoA==
X-CSE-MsgGUID: ExsOyI8XQ1WphzP0V3W2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676779"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 05/17] ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach
Date: Tue, 27 Aug 2024 20:32:03 +0800
Message-ID: <20240827123215.258859-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Remove SDW mach's topology name fixup code and use the code in
hda_machine_select() to fixup its topology file name. No functional
change in this commit.

Compared with I2S/HDA mach, SDW mach always fixup topology file name
with dmic num without using DMIC quirk flag and pass topology name
with file extension to SOF driver. Therefore, we add extra code to
remove file extension if it exists.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 166 +++++++++++---------------------------
 1 file changed, 46 insertions(+), 120 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 128687b24bf5..2f24b5abc91b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -511,6 +511,8 @@ static int check_dmic_num(struct snd_sof_dev *sdev)
 	if (nhlt)
 		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
 
+	dev_info(sdev->dev, "DMICs detected in NHLT tables: %d\n", dmic_num);
+
 	/* allow for module parameter override */
 	if (dmic_num_override != -1) {
 		dev_dbg(sdev->dev,
@@ -558,82 +560,6 @@ static int check_nhlt_ssp_mclk_mask(struct snd_sof_dev *sdev, int ssp_num)
 	return intel_nhlt_ssp_mclk_mask(nhlt, ssp_num);
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
-
-static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
-				   const char *sof_tplg_filename,
-				   const char *idisp_str,
-				   const char *dmic_str)
-{
-	const char *tplg_filename = NULL;
-	char *filename, *tmp;
-	const char *split_ext;
-
-	filename = kstrdup(sof_tplg_filename, GFP_KERNEL);
-	if (!filename)
-		return NULL;
-
-	/* this assumes a .tplg extension */
-	tmp = filename;
-	split_ext = strsep(&tmp, ".");
-	if (split_ext)
-		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
-					       "%s%s%s.tplg",
-					       split_ext, idisp_str, dmic_str);
-	kfree(filename);
-
-	return tplg_filename;
-}
-
-static int dmic_detect_topology_fixup(struct snd_sof_dev *sdev,
-				      const char **tplg_filename,
-				      const char *idisp_str,
-				      int *dmic_found,
-				      bool tplg_fixup)
-{
-	const char *dmic_str;
-	int dmic_num;
-
-	/* first check for DMICs (using NHLT or module parameter) */
-	dmic_num = check_dmic_num(sdev);
-
-	switch (dmic_num) {
-	case 1:
-		dmic_str = "-1ch";
-		break;
-	case 2:
-		dmic_str = "-2ch";
-		break;
-	case 3:
-		dmic_str = "-3ch";
-		break;
-	case 4:
-		dmic_str = "-4ch";
-		break;
-	default:
-		dmic_num = 0;
-		dmic_str = "";
-		break;
-	}
-
-	if (tplg_fixup) {
-		const char *default_tplg_filename = *tplg_filename;
-		const char *fixed_tplg_filename;
-
-		fixed_tplg_filename = fixup_tplg_name(sdev, default_tplg_filename,
-						      idisp_str, dmic_str);
-		if (!fixed_tplg_filename)
-			return -ENOMEM;
-		*tplg_filename = fixed_tplg_filename;
-	}
-
-	dev_info(sdev->dev, "DMICs detected in NHLT tables: %d\n", dmic_num);
-	*dmic_found = dmic_num;
-
-	return 0;
-}
-#endif
-
 static int hda_init_caps(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
@@ -1199,45 +1125,10 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 			break;
 	}
 	if (mach && mach->link_mask) {
-		int dmic_num = 0;
-		bool tplg_fixup;
-		const char *tplg_filename;
-
 		mach->mach_params.links = mach->links;
 		mach->mach_params.link_mask = mach->link_mask;
 		mach->mach_params.platform = dev_name(sdev->dev);
 
-		if (pdata->tplg_filename) {
-			tplg_fixup = false;
-		} else {
-			tplg_fixup = true;
-			tplg_filename = mach->sof_tplg_filename;
-		}
-
-		/*
-		 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
-		 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
-		 * if all conditions are true:
-		 * a) 2 or fewer links are used by SoundWire
-		 * b) the NHLT table reports the presence of microphones
-		 */
-		if (hweight_long(mach->link_mask) <= 2) {
-			int ret;
-
-			ret = dmic_detect_topology_fixup(sdev, &tplg_filename, "",
-							 &dmic_num, tplg_fixup);
-			if (ret < 0)
-				return NULL;
-		}
-		if (tplg_fixup)
-			pdata->tplg_filename = tplg_filename;
-		mach->mach_params.dmic_num = dmic_num;
-
-		dev_dbg(sdev->dev,
-			"SoundWire machine driver %s topology %s\n",
-			mach->drv_name,
-			pdata->tplg_filename);
-
 		return mach;
 	}
 
@@ -1294,6 +1185,19 @@ static int check_tplg_quirk_mask(struct snd_soc_acpi_mach *mach)
 	return 0;
 }
 
+static char *remove_file_ext(const char *tplg_filename)
+{
+	char *filename, *tmp;
+
+	filename = kstrdup(tplg_filename, GFP_KERNEL);
+	if (!filename)
+		return NULL;
+
+	/* remove file extension if exist */
+	tmp = filename;
+	return strsep(&tmp, ".");
+}
+
 struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
@@ -1306,6 +1210,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	const char *tplg_suffix;
 	bool amp_name_valid;
 	bool i2s_mach_found = false;
+	bool sdw_mach_found = false;
 
 	/* Try I2S or DMIC if it is supported */
 	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC))) {
@@ -1319,8 +1224,11 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	 * try SoundWire if it is supported
 	 */
 	if (!mach && !HDA_EXT_CODEC(bus->codec_mask) &&
-	    (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+	    (interface_mask & BIT(SOF_DAI_INTEL_ALH))) {
 		mach = hda_sdw_machine_select(sdev);
+		if (mach)
+			sdw_mach_found = true;
+	}
 
 	/*
 	 * Choose HDA generic machine driver if mach is NULL.
@@ -1335,15 +1243,20 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	 * name string if quirk flag is set.
 	 */
 	if (mach) {
-		bool add_extension = false;
 		bool tplg_fixup = false;
+		bool dmic_fixup = false;
 
 		/*
 		 * If tplg file name is overridden, use it instead of
 		 * the one set in mach table
 		 */
 		if (!sof_pdata->tplg_filename) {
-			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			/* remove file extension if it exists */
+			tplg_filename = remove_file_ext(mach->sof_tplg_filename);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
 			tplg_fixup = true;
 		}
 
@@ -1361,8 +1274,25 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		/* report to machine driver if any DMICs are found */
 		mach->mach_params.dmic_num = check_dmic_num(sdev);
 
+		if (sdw_mach_found) {
+			/*
+			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
+			 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
+			 * if all conditions are true:
+			 * a) 2 or fewer links are used by SoundWire
+			 * b) the NHLT table reports the presence of microphones
+			 */
+			if (hweight_long(mach->link_mask) <= 2)
+				dmic_fixup = true;
+			else
+				mach->mach_params.dmic_num = 0;
+		} else {
+			if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER)
+				dmic_fixup = true;
+		}
+
 		if (tplg_fixup &&
-		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER &&
+		    dmic_fixup &&
 		    mach->mach_params.dmic_num) {
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s%d%s",
@@ -1374,7 +1304,6 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 				return NULL;
 
 			sof_pdata->tplg_filename = tplg_filename;
-			add_extension = true;
 		}
 
 		if (mach->link_mask) {
@@ -1414,7 +1343,6 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 				return NULL;
 
 			sof_pdata->tplg_filename = tplg_filename;
-			add_extension = true;
 
 			mclk_mask = check_nhlt_ssp_mclk_mask(sdev, ssp_num);
 
@@ -1453,7 +1381,6 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 				return NULL;
 
 			sof_pdata->tplg_filename = tplg_filename;
-			add_extension = true;
 		}
 
 
@@ -1475,10 +1402,9 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 				return NULL;
 
 			sof_pdata->tplg_filename = tplg_filename;
-			add_extension = true;
 		}
 
-		if (tplg_fixup && add_extension) {
+		if (tplg_fixup) {
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s",
 						       sof_pdata->tplg_filename,
-- 
2.43.0

