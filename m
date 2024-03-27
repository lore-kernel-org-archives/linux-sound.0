Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB01311BB
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556680; cv=none; b=M99uY1y8Y9yyIEgPKjlpunp5VKpv0rKP1ezRaUexItMP40He1NMrdboxAO+fZKD1zdIZC9EkfpyRVCojlC1JadPYXnNuqqyI2RABREUIx4RPZ3b0vjryqe74UNucNDZ0x6eckXkHq46R9OEi5ShAbskdhOzhtnWkGIRD33+e7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556680; c=relaxed/simple;
	bh=Ir7vtaKEGyf7DswIMMovVREmiqNtlXRIc3iQIBZQ54k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ff1KVkMFO2kbsbj5G8C+0QXOZU0un8UCf+2v5puBcqwg2E5xXLJ1wPk0BFKL/8R7KcgUBeMIk7qHXbixANQvyPrSZXlrjaGv2KZDxB6zBUhu9Eb8lwpbJuS2OTyfOX/3Cc5D1EZ04Ig7BLMutm9VpOnYkgpk8uCxPfvs4dXtByY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PySk6zaE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PySk6zaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556677; x=1743092677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ir7vtaKEGyf7DswIMMovVREmiqNtlXRIc3iQIBZQ54k=;
  b=PySk6zaEVI2UQCiOhXjmfLiUgdsb7EZKF5fXfLIJCMDC+qlwKBgw5JMJ
   irdmjBeiiRVHqguOpIlvR6w9QBQbaA9EPoqzIgnx979O5ig9SfmzHzzHu
   RWRBNPIj4BV74k2iE7mNgF+rBKsovHGh8CJcf26T56/k99Ue34xaTKH0R
   8CgM0BRAKSrRXjeHm7MwFg4pt6ngVX5r2Fhxe+npyiCwc4PZ1HWJzhSfH
   HkVfWzLuNIA5myF1YFxCly405iZKjvDHwvP8VkRHnVwN0XJXqcpjwjCs3
   /6fXVkelKadxc+UhiK54gxiTFDyThFamLF4mpUz9l256emfID2DR/INK+
   Q==;
X-CSE-ConnectionGUID: UY/J9RXgSpeejhewuVrU+w==
X-CSE-MsgGUID: C5E+6Ku/QLivnOtvUOwC6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221558"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821328"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/18] ASoC: Intel: sof_rt5682: mach cleanup for mtl boards
Date: Wed, 27 Mar 2024 11:24:04 -0500
Message-Id: <20240327162408.63953-15-pierre-louis.bossart@linux.intel.com>
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
boards with/without speaker amplifier. All other mtl_rt5682_def
entries become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 40 +++++++------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 0125e81af9e1..7f422848a3ba 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -21,14 +21,9 @@ static const struct snd_soc_acpi_codecs mtl_max98360a_amp = {
 	.codecs = {"MX98360A"}
 };
 
-static const struct snd_soc_acpi_codecs mtl_rt1019p_amp = {
-	.num_codecs = 1,
-	.codecs = {"RTL1019"}
-};
-
 static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs mtl_essx_83x6 = {
@@ -41,11 +36,6 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
-static const struct snd_soc_acpi_codecs mtl_rt5650_amp = {
-	.num_codecs = 1,
-	.codecs = {"10EC5650"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
@@ -61,13 +51,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_max98360a_amp,
 		.sof_tplg_filename = "sof-mtl-max98360a-rt5682.tplg",
 	},
-	{
-		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_rt1019p_amp,
-		.sof_tplg_filename = "sof-mtl-rt1019-rt5682.tplg",
-	},
 	{
 		.comp_ids = &mtl_essx_83x6,
 		.drv_name = "mtl_es83x6_c1_h02",
@@ -83,13 +66,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
-	{
-		.id = "10EC5650",
-		.drv_name = "mtl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_rt5650_amp,
-		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
-	},
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
@@ -100,6 +76,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = RT5650_ACPI_HID,
+		.drv_name = "mtl_rt5682_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	{
+		.comp_ids = &mtl_rt5682_rt5682s_hp,
+		.drv_name = "mtl_rt5682_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
-- 
2.40.1

