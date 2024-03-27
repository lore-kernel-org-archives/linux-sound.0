Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A201311A2
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556677; cv=none; b=H8QU2A0eAXwYLLmHDZsXkW4ei3XLZxuQDXQMdJwa/mi5g9CZrz9z4HaUUyt92VLA2amov713y7tm4iQ7eliVl/JpO3ghkxuVvgjvIrNWA6SsBMPkHknl9NFE01Pn4dtoKQb5RL6vQDUsP3ICguwGdv6HBB+tCvkgUGtgvVZCwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556677; c=relaxed/simple;
	bh=L/rMKeb7bryjkvewzg2n9FkK/ylWO2IYooTwSLchRGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Psio9Yh1nxPhJ3SivalcfEoGHkhZHxCFEM2tQnu0KNJOFjSDJOdkB6Uai/cKPHIHJNhwScS/UlhnTEz+swVsG5bykhM4MxQWTAbt6FSUu2QUj+9bzitw8b5XxWLi6igEMalhKDlW7W8ypo/MigQsmw0/yOmNZdO/S+gHko6mu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUYK1mf4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUYK1mf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556676; x=1743092676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L/rMKeb7bryjkvewzg2n9FkK/ylWO2IYooTwSLchRGY=;
  b=RUYK1mf4Wr8Pg7hZEXIwZkaF+5sGjtVJaTHaEIjmBgUgjdV8qpuaiNos
   Ll8UbzOoMtNo6haILCL2+9BKy60IVXxNu3k7xn5/Upcom3V7m/w+H58FE
   JDduItwcUyppqLkUZu0EQqcp7ehOAPzRLIo71vRhhRg2ipYcel+T5m9Af
   p/475e2Fwl+dgrSlWW+AtwuQKUFE+pBSrfAsP8XkGHHmV7IgFTWzDlOwa
   4vMc/+Hcbn4cdQw/0Hs0zlRJG4AI1BVTw00QEXDpxsdEogZr0G6wj5y1Q
   ubFYYwdj6KQYgivKsIwG6U+iG0LfazPFkuzqvBHh/SbF0nftZqZct3eEr
   w==;
X-CSE-ConnectionGUID: tfVwICpHQSaj56lWkbwC2g==
X-CSE-MsgGUID: LPaWZIxBR7qxm756J+SG1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221545"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821313"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/18] ASoC: Intel: sof_rt5682: mach cleanup for adl boards
Date: Wed, 27 Mar 2024 11:24:02 -0500
Message-Id: <20240327162408.63953-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add two common entries in enumeration table for all rt5682/rt5650
boards with/without speaker amplifier. All other adl_rt5682_def
entries become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 71 ++++---------------
 1 file changed, 15 insertions(+), 56 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index f8b8864b5ec6..9ac9310dd2be 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -448,11 +448,6 @@ static const struct snd_soc_acpi_link_adr adl_chromebook_base[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_codecs adl_max98373_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98373"}
-};
-
 static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -465,7 +460,7 @@ static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
 
 static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
@@ -473,29 +468,12 @@ static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
 	.codecs = {"RTL1019"}
 };
 
-static const struct snd_soc_acpi_codecs adl_max98390_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98390"}
-};
-
 static const struct snd_soc_acpi_codecs adl_lt6911_hdmi = {
 	.num_codecs = 1,
 	.codecs = {"INTC10B0"}
 };
 
-static struct snd_soc_acpi_codecs adl_rt5650_amp = {
-	.num_codecs = 1,
-	.codecs = {"10EC5650"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98373_amp,
-		.sof_tplg_filename = "sof-adl-max98373-rt5682.tplg",
-	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_mx98357_rt5682",
@@ -503,13 +481,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_max98357a_amp,
 		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
 	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
-	},
 	{
 		.id = "10508825",
 		.drv_name = "adl_rt1019p_8825",
@@ -517,20 +488,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-nau8825.tplg",
 	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_rt1019p_amp,
-		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
-	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98390_amp,
-		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
-	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_rt5682_c1_h02",
@@ -538,11 +495,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_lt6911_hdmi,
 		.sof_tplg_filename = "sof-adl-rt5682-ssp1-hdmi-ssp02.tplg",
 	},
-	{
-		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682_def",
-		.sof_tplg_filename = "sof-adl-rt5682.tplg",
-	},
 	{
 		.id = "10134242",
 		.drv_name = "adl_mx98360a_cs4242",
@@ -565,13 +517,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
-	{
-		.id = "10EC5650",
-		.drv_name = "adl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_rt5650_amp,
-		.sof_tplg_filename = "sof-adl-rt5650.tplg",
-	},
 	{
 		.id = "DLGS7219",
 		.drv_name = "adl_da7219_def",
@@ -589,6 +534,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = RT5650_ACPI_HID,
+		.drv_name = "adl_rt5682_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	{
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_rt5682_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "CSC3541",
-- 
2.40.1

