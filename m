Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC0322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723034; cv=none; b=NXwJvFIe/Rd8sENpTVBVJLvSPA9ikA0GM+oYDQ4t4MAO01IgDVzlxtLI8JdYIBAGqXXdqQ7hYHk6fVXSAl+bthPvR3dlMDtftL/xAKnYXqyixqwAD1yrHr6RtRO7GXsW3ZRpIo3OZvcoui/uTmroasNRMwxjeap2SqVhxcMWoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723034; c=relaxed/simple;
	bh=BUIzXtdsJwciPGmXwG9tb9lsQ7YTcdAEF4kgC5NdsnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhyIt4W++IE6T/oLsakmfo3VU14GWoIQ+78bu6RpedBhS8zu2ptf21TI4w5zbJAF1+glp7C4G8TjeOkVbK6RCKw5Xgu9+wMOBY9YtyuCIWQo+soHeTz7gigz7QnpUfp5Qry5i8usheSX4GUyHYbZJUo8Xw6AvXr9vzczGi3ztCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=if7tL2Y1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="if7tL2Y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723033; x=1756259033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BUIzXtdsJwciPGmXwG9tb9lsQ7YTcdAEF4kgC5NdsnE=;
  b=if7tL2Y1rnd6yzFEuudhSDEAjg9/OBdYVAd7ZkJ5TkAVgqbwjM5Cs3KL
   ikZDnt7Iwsf3MjDjyOftz24mdQMS2xuG0RNoiNC+PgTcOlAiKUNyUvhVE
   D9NmcQqm6+pqkVWQSSeRGP7TybbfvvJNvrzWQtFPZYgNMRyx1y1+HQnKZ
   cXxEwYKltwpbN4utl7WShmEow1t2zTDllUvk8QO7sQVOkcakRtGmiyP5y
   KjDqM5I+4RV9fxPmtL4xVpWaHAHqBKyX+uwW3S/hNbOW6fjYmeTqT1OSz
   1F2QWXBLFXrm0zEreptNdBN11fm5rkqpS2usstx45IHkQhCggUhRU7+NC
   A==;
X-CSE-ConnectionGUID: GN7zCxizQpGBhSgmPo5Kmg==
X-CSE-MsgGUID: 0L4itS1bSOiiy2gFuBj+rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984874"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984874"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:53 -0700
X-CSE-ConnectionGUID: kTLiLaJVT4SRFaUI1OCY4g==
X-CSE-MsgGUID: 6HFMuIFTR8ifZudlWqC1Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427791"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:43:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 04/16] ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
Date: Tue, 27 Aug 2024 09:43:16 +0800
Message-ID: <20240827014329.6542-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move I2S mach's topology name fixup code to the end of machine driver
enumeration flow so HDA mach could also use same code to fixup its
topology file name as well. No functional change in this commit.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-hda-match.c   | 12 +--
 sound/soc/sof/intel/hda.c                     | 84 ++++++++++---------
 2 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-hda-match.c b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
index 007ccd8a60e5..e93336e27beb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hda-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
@@ -13,16 +13,8 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_hda_machines[] = {
 	{
 		/* .id is not used in this file */
 		.drv_name = "skl_hda_dsp_generic",
-
-		/* .fw_filename is dynamically set in skylake driver */
-
-		.sof_tplg_filename = "sof-hda-generic.tplg",
-
-		/*
-		 * .machine_quirk and .quirk_data are not used here but
-		 * can be used if we need a more complicated machine driver
-		 * combining HDA+other device (e.g. DMIC).
-		 */
+		.sof_tplg_filename = "sof-hda-generic", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
 	{},
 };
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 5a40b8fbbbd3..128687b24bf5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -558,7 +558,7 @@ static int check_nhlt_ssp_mclk_mask(struct snd_sof_dev *sdev, int ssp_num)
 	return intel_nhlt_ssp_mclk_mask(nhlt, ssp_num);
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *sof_tplg_filename,
@@ -1045,10 +1045,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 	struct snd_soc_acpi_mach *hda_mach;
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const char *tplg_filename;
-	const char *idisp_str;
-	int dmic_num = 0;
 	int codec_num = 0;
-	int ret;
 	int i;
 
 	/* codec detection */
@@ -1071,33 +1068,30 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 		 *  - one external HDAudio codec
 		 */
 		if (!*mach && codec_num <= 2) {
-			bool tplg_fixup;
+			bool tplg_fixup = false;
 
 			hda_mach = snd_soc_acpi_intel_hda_machines;
 
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
 
-			if (codec_num == 1 && HDA_IDISP_CODEC(bus->codec_mask))
-				idisp_str = "-idisp";
-			else
-				idisp_str = "";
-
-			/* topology: use the info from hda_machines */
-			if (pdata->tplg_filename) {
-				tplg_fixup = false;
-				tplg_filename = pdata->tplg_filename;
-			} else {
+			/*
+			 * topology: use the info from hda_machines since tplg file name
+			 * is not overwritten
+			 */
+			if (!pdata->tplg_filename)
 				tplg_fixup = true;
-				tplg_filename = hda_mach->sof_tplg_filename;
+
+			if (tplg_fixup &&
+			    codec_num == 1 && HDA_IDISP_CODEC(bus->codec_mask)) {
+				tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+							       "%s-idisp",
+							       hda_mach->sof_tplg_filename);
+				if (!tplg_filename)
+					return;
+
+				hda_mach->sof_tplg_filename = tplg_filename;
 			}
-			ret = dmic_detect_topology_fixup(sdev, &tplg_filename, idisp_str, &dmic_num,
-							 tplg_fixup);
-			if (ret < 0)
-				return;
-
-			hda_mach->mach_params.dmic_num = dmic_num;
-			pdata->tplg_filename = tplg_filename;
 
 			if (codec_num == 2 ||
 			    (codec_num == 1 && !HDA_IDISP_CODEC(bus->codec_mask))) {
@@ -1311,11 +1305,35 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	const char *tplg_filename;
 	const char *tplg_suffix;
 	bool amp_name_valid;
+	bool i2s_mach_found = false;
 
 	/* Try I2S or DMIC if it is supported */
-	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC)))
+	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC))) {
 		mach = snd_soc_acpi_find_machine(desc->machines);
+		if (mach)
+			i2s_mach_found = true;
+	}
 
+	/*
+	 * If I2S fails and no external HDaudio codec is detected,
+	 * try SoundWire if it is supported
+	 */
+	if (!mach && !HDA_EXT_CODEC(bus->codec_mask) &&
+	    (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		mach = hda_sdw_machine_select(sdev);
+
+	/*
+	 * Choose HDA generic machine driver if mach is NULL.
+	 * Otherwise, set certain mach params.
+	 */
+	hda_generic_machine_select(sdev, &mach);
+	if (!mach)
+		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
+
+	/*
+	 * Fixup tplg file name by appending dmic num, ssp num, codec/amplifier
+	 * name string if quirk flag is set.
+	 */
 	if (mach) {
 		bool add_extension = false;
 		bool tplg_fixup = false;
@@ -1349,7 +1367,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s%d%s",
 						       sof_pdata->tplg_filename,
-						       "-dmic",
+						       i2s_mach_found ? "-dmic" : "-",
 						       mach->mach_params.dmic_num,
 						       "ch");
 			if (!tplg_filename)
@@ -1479,22 +1497,6 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		}
 	}
 
-	/*
-	 * If I2S fails and no external HDaudio codec is detected,
-	 * try SoundWire if it is supported
-	 */
-	if (!mach && !HDA_EXT_CODEC(bus->codec_mask) &&
-	    (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
-		mach = hda_sdw_machine_select(sdev);
-
-	/*
-	 * Choose HDA generic machine driver if mach is NULL.
-	 * Otherwise, set certain mach params.
-	 */
-	hda_generic_machine_select(sdev, &mach);
-	if (!mach)
-		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
-
 	return mach;
 }
 
-- 
2.43.0

