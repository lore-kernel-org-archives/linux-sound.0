Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF321A263E
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142616; cv=none; b=Xza5jDePg7x5tefp9kpM9y2o51hhWc5pNvHjXY2+eij0JfY8unxFu9V9gjQlk+6mVc+0+7PKbaOPhP2DL5RII7BKxRoaCTqNRrfjGYA8mGyBha4tyBKB1ZPBU41S60hAMBR8RL0G9X3CKOEW/8mVd115UVGaRL79RO8QDU9U5TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142616; c=relaxed/simple;
	bh=G1T6fGo/525oLZSKNzVFmMxTU/Cry1bigfolNU5BPZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4w/lgJHiAlAlqlQGcAFALLc3DKwEONB/tgEUfTLMwaTiZR805F9Xd12dGecy3yQJU+Udz4E7FRGXB++AVkRcOEvh1VbXn8v1Uo7RNSrDPPyXgS5hUqFGH/t1FAwBkTl/TWPWE26BKFzDKhKd6R3BcNMVS1BcKt1JoueIHwVCXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGIM1nvK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGIM1nvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142615; x=1757678615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1T6fGo/525oLZSKNzVFmMxTU/Cry1bigfolNU5BPZA=;
  b=gGIM1nvKOUFL8xpE9HWzSziVzd6L7OtQAqbUwL7OvBof0e/H4nF99UZP
   3BbvB8x6ppk/nJeYeRc68vGadYWwOhhMHmwkYzCmLAd8WMoynnvpzykHk
   bb80A9ttohiiPXKskK7OoZQuw6RFKAFPpjvlCSo3Na6KC+2KcStC1nwDc
   /QXAff9wOND8hHCcXwBisBmJFagBejRtuhB471o2/YpK6x7awfUQksGb2
   CW532zDc0RUJ0CjiZDYe5nm6oxaOSwqJv9o2uv8VqouxYtDb7cQpMfrGI
   mADJLupYhZoiWh6oecllZofI/HfLFAoicBlPOvYUPP/XcdOeEeyDukWI0
   w==;
X-CSE-ConnectionGUID: oyPpfxpOTM+RbaEGFZs1ew==
X-CSE-MsgGUID: pq6TSxQJQ4m22siu3gmBrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812795"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:34 -0700
X-CSE-ConnectionGUID: WAzGqDKMRcaPPcNrwTTJgQ==
X-CSE-MsgGUID: RZWdwF6MSaq3SozUzTo6dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459200"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 6/7] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for ARL.
Date: Thu, 12 Sep 2024 20:03:07 +0800
Message-ID: <20240912120308.134762-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Added match table entry on arl machines to support HDMI-In capture
with rt5682 I2S audio codec. also added the respective quirk
configuration in rt5682 machine driver.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  7 +++++++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 23a40b913290..bc581fea0e3a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -870,6 +870,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "arl_rt5682_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(1) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 9936a4b4eee7..c13afff84923 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -7,6 +7,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
@@ -289,6 +290,11 @@ static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
+static const struct snd_soc_acpi_codecs arl_rt5682_hp = {
+	.num_codecs = 2,
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
+};
+
 static const struct snd_soc_acpi_codecs arl_lt6911_hdmi = {
 	.num_codecs = 1,
 	.codecs = {"INTC10B0"}
@@ -310,6 +316,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
 			SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 			SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.comp_ids = &arl_rt5682_hp,
+		.drv_name = "arl_rt5682_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &arl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-arl-rt5682-ssp1-hdmi-ssp02.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
-- 
2.43.0

