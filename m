Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8D1C683
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613885; cv=none; b=EKPLWIw6BYCtpBRybJdbembLJ7xKCc3NuE3Sy+ts+wSxdvBzjUeiW3G0nT6Xy5UWz7EdMpKYvKD9q26kMX+++EfOlPu0HVyVY4wziKWknmviypRQ4+wK/KRJC3samX61wjr0NDP6eTJsQ1PTijBevtoZowoG7PUYONVJa0DKAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613885; c=relaxed/simple;
	bh=N/8wSTpxIopupD0FMq35rE3w0VnqN680DFwWLAQ9A4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0xxlcqgXOMcLXxlscW3T+Vm7zVwXoU/6nguWeUZrt/4FvvrgaZyQRJfGFRWgc5grKe8ZdfYAZpTFU+L/sIpGbxGYo57yN+u7w7eMjLIiSsw0mMQfokjvV+mzYWNVq/XU+JtIF1OiD4+mW6kOZYHcQvZohEG1tAgzTDc7Kd03Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHlHDHrq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHlHDHrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613884; x=1780149884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N/8wSTpxIopupD0FMq35rE3w0VnqN680DFwWLAQ9A4A=;
  b=kHlHDHrqdUzMQVcuoRQwYcgB35ymDn6sjXAeyAI+/ZL0nK1zLoZr05/u
   rwjfZ2Kn4Ye0YEfHlTu7F05zXnfVZadU0E1MWBg11EIYJPd1PVk6Fd5JG
   Qm5fXPOltA+LMdPB6H7ushDswDz6Bk3beb1MyDcdn75JKQtxtn3UMaMoQ
   2XOQgRKd61RiHQ8pMftKLNVxojzcgtTq3KWocTziN59WaIXGDprr7Nta8
   Qu+vCBC6qfzxcaCEpshGqeXd2c8ENjSFXTApMy32cvFlWkiFQwmqEPuNK
   f3rNR0mnJmlMmhY+WhBmnjuSShdkU0xH+8BzMmvJH/OTFsD+I1KtLiVz/
   Q==;
X-CSE-ConnectionGUID: gNZOn8HBRVejlEg1RjX36A==
X-CSE-MsgGUID: Bab2HB5eSaivdxnXE8ENEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53336538"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53336538"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:04:44 -0700
X-CSE-ConnectionGUID: 72MltAlhR52IxLWBC7xu8w==
X-CSE-MsgGUID: W0Un5UReSfmFg4CUXEhrwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144357400"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 07:04:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ASoC: codecs: rt5640: Drop dummy register names
Date: Fri, 30 May 2025 16:21:18 +0200
Message-Id: <20250530142120.2944095-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530142120.2944095-1-cezary.rojewski@intel.com>
References: <20250530142120.2944095-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Registers 0xfa and 0xfb represent "General Control 1" and "General
Control 2" respectively.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5640.c | 38 +++++++++++++++++++-------------------
 sound/soc/codecs/rt5640.h |  6 +++---
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 21a18012b4c0..265b30856faf 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -193,7 +193,7 @@ static bool rt5640_volatile_register(struct device *dev, unsigned int reg)
 	case RT5640_PRIV_DATA:
 	case RT5640_PGM_REG_ARR1:
 	case RT5640_PGM_REG_ARR3:
-	case RT5640_DUMMY2:
+	case RT5640_GCTL2:
 	case RT5640_VENDOR_ID:
 	case RT5640_VENDOR_ID1:
 	case RT5640_VENDOR_ID2:
@@ -325,8 +325,8 @@ static bool rt5640_readable_register(struct device *dev, unsigned int reg)
 	case RT5640_HP_CALIB2:
 	case RT5640_SV_ZCD1:
 	case RT5640_SV_ZCD2:
-	case RT5640_DUMMY1:
-	case RT5640_DUMMY2:
+	case RT5640_GCTL1:
+	case RT5640_GCTL2:
 	case RT5640_DUMMY3:
 	case RT5640_VENDOR_ID:
 	case RT5640_VENDOR_ID1:
@@ -423,7 +423,7 @@ static const struct snd_kcontrol_new rt5640_snd_controls[] = {
 	SOC_DOUBLE_TLV("ADC Capture Volume", RT5640_ADC_DIG_VOL,
 			RT5640_L_VOL_SFT, RT5640_R_VOL_SFT,
 			127, 0, adc_vol_tlv),
-	SOC_DOUBLE("Mono ADC Capture Switch", RT5640_DUMMY1,
+	SOC_DOUBLE("Mono ADC Capture Switch", RT5640_GCTL1,
 		RT5640_M_MONO_ADC_L_SFT, RT5640_M_MONO_ADC_R_SFT, 1, 1),
 	SOC_DOUBLE_TLV("Mono ADC Capture Volume", RT5640_ADC_DATA,
 			RT5640_L_VOL_SFT, RT5640_R_VOL_SFT,
@@ -1969,7 +1969,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 			snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
 				RT5640_PWR_FV1 | RT5640_PWR_FV2,
 				RT5640_PWR_FV1 | RT5640_PWR_FV2);
-			snd_soc_component_update_bits(component, RT5640_DUMMY1,
+			snd_soc_component_update_bits(component, RT5640_GCTL1,
 						0x1, 0x1);
 			snd_soc_component_update_bits(component, RT5640_MICBIAS,
 						0x0030, 0x0030);
@@ -1979,7 +1979,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_OFF:
 		snd_soc_component_write(component, RT5640_DEPOP_M1, 0x0004);
 		snd_soc_component_write(component, RT5640_DEPOP_M2, 0x1100);
-		snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x1, 0);
+		snd_soc_component_update_bits(component, RT5640_GCTL1, 0x1, 0);
 		snd_soc_component_write(component, RT5640_PWR_DIG1, 0x0000);
 		snd_soc_component_write(component, RT5640_PWR_DIG2, 0x0000);
 		snd_soc_component_write(component, RT5640_PWR_VOL, 0x0000);
@@ -2328,12 +2328,12 @@ static void rt5640_jack_work(struct work_struct *work)
 			jack_type |= SND_JACK_MICROPHONE;
 
 		/* headphone jack */
-		val = snd_soc_component_read(component, RT5640_DUMMY2);
+		val = snd_soc_component_read(component, RT5640_GCTL2);
 		hda_hp_plugged = !(val & (0x1 << 11));
 		dev_dbg(component->dev, "headphone jack status %d\n",
 			hda_hp_plugged);
 
-		snd_soc_component_update_bits(component, RT5640_DUMMY2,
+		snd_soc_component_update_bits(component, RT5640_GCTL2,
 			(0x1 << 10), !hda_hp_plugged << 10);
 
 		if (hda_hp_plugged)
@@ -2504,7 +2504,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
 		RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);
 
-	snd_soc_component_write(component, RT5640_DUMMY1, 0x3f41);
+	snd_soc_component_write(component, RT5640_GCTL1, 0x3f41);
 
 	rt5640_set_ovcd_params(component);
 
@@ -2519,7 +2519,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 			snd_soc_component_write(component, RT5640_IRQ_CTRL1,
 				RT5640_IRQ_JD_NOR);
 		else if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
-			snd_soc_component_update_bits(component, RT5640_DUMMY2,
+			snd_soc_component_update_bits(component, RT5640_GCTL2,
 				RT5640_IRQ_JD2_MASK | RT5640_JD2_MASK,
 				RT5640_IRQ_JD2_NOR | RT5640_JD2_EN);
 	} else {
@@ -2527,7 +2527,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 			snd_soc_component_write(component, RT5640_IRQ_CTRL1,
 				RT5640_IRQ_JD_NOR | RT5640_JD_P_INV);
 		else if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
-			snd_soc_component_update_bits(component, RT5640_DUMMY2,
+			snd_soc_component_update_bits(component, RT5640_GCTL2,
 				RT5640_IRQ_JD2_MASK | RT5640_JD2_P_MASK |
 				RT5640_JD2_MASK,
 				RT5640_IRQ_JD2_NOR | RT5640_JD2_P_INV |
@@ -2596,7 +2596,7 @@ static void rt5640_enable_hda_jack_detect(
 	snd_soc_component_write(component, RT5640_IRQ_CTRL1, RT5640_IRQ_JD_NOR);
 
 	/* Select JD2 for Headphone */
-	snd_soc_component_update_bits(component, RT5640_DUMMY2, 0x1100, 0x1100);
+	snd_soc_component_update_bits(component, RT5640_GCTL2, 0x1100, 0x1100);
 
 	/* Selecting GPIO01 as an interrupt */
 	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL1,
@@ -2606,7 +2606,7 @@ static void rt5640_enable_hda_jack_detect(
 	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
 		RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);
 
-	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x400, 0x0);
+	snd_soc_component_update_bits(component, RT5640_GCTL1, 0x400, 0x0);
 
 	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
 		RT5640_PWR_VREF2 | RT5640_PWR_MB | RT5640_PWR_BG,
@@ -2668,7 +2668,7 @@ static int rt5640_probe(struct snd_soc_component *component)
 
 	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
 
-	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x0301, 0x0301);
+	snd_soc_component_update_bits(component, RT5640_GCTL1, 0x0301, 0x0301);
 	snd_soc_component_update_bits(component, RT5640_MICBIAS, 0x0030, 0x0030);
 	snd_soc_component_update_bits(component, RT5640_DSP_PATH2, 0xfc00, 0x0c00);
 
@@ -2719,7 +2719,7 @@ static int rt5640_probe(struct snd_soc_component *component)
 					      RT5640_IN_DF2, RT5640_IN_DF2);
 
 	if (device_property_read_bool(component->dev, "realtek,lout-differential"))
-		snd_soc_component_update_bits(component, RT5640_DUMMY1,
+		snd_soc_component_update_bits(component, RT5640_GCTL1,
 					      RT5640_EN_LOUT_DF, RT5640_EN_LOUT_DF);
 
 	if (device_property_read_u32(component->dev, "realtek,dmic1-data-pin",
@@ -2829,12 +2829,12 @@ static int rt5640_resume(struct snd_soc_component *component)
 	if (rt5640->jack) {
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
 			snd_soc_component_update_bits(component,
-				RT5640_DUMMY2, 0x1100, 0x1100);
+				RT5640_GCTL2, 0x1100, 0x1100);
 		} else {
 			if (rt5640->jd_inverted) {
 				if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
 					snd_soc_component_update_bits(
-						component, RT5640_DUMMY2,
+						component, RT5640_GCTL2,
 						RT5640_IRQ_JD2_MASK |
 						RT5640_JD2_MASK,
 						RT5640_IRQ_JD2_NOR |
@@ -2843,7 +2843,7 @@ static int rt5640_resume(struct snd_soc_component *component)
 			} else {
 				if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
 					snd_soc_component_update_bits(
-						component, RT5640_DUMMY2,
+						component, RT5640_GCTL2,
 						RT5640_IRQ_JD2_MASK |
 						RT5640_JD2_P_MASK |
 						RT5640_JD2_MASK,
@@ -3026,7 +3026,7 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 	if (ret != 0)
 		dev_warn(&i2c->dev, "Failed to apply regmap patch: %d\n", ret);
 
-	regmap_update_bits(rt5640->regmap, RT5640_DUMMY1,
+	regmap_update_bits(rt5640->regmap, RT5640_GCTL1,
 				RT5640_MCLK_DET, RT5640_MCLK_DET);
 
 	rt5640->hp_mute = true;
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 94b9a502f7f9..8a12cee76bdc 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -139,8 +139,8 @@
 #define RT5640_SV_ZCD1				0xd9
 #define RT5640_SV_ZCD2				0xda
 /* Dummy Register */
-#define RT5640_DUMMY1				0xfa
-#define RT5640_DUMMY2				0xfb
+#define RT5640_GCTL1				0xfa
+#define RT5640_GCTL2				0xfb
 #define RT5640_DUMMY3				0xfc
 
 
@@ -1986,7 +1986,7 @@
 #define RT5640_M_MONO_ADC_R_SFT			12
 #define RT5640_MCLK_DET				(0x1 << 11)
 
-/* General Control 1 (0xfb) */
+/* General Control 2 (0xfb) */
 #define RT5640_IRQ_JD2_MASK			(0x1 << 12)
 #define RT5640_IRQ_JD2_SFT			12
 #define RT5640_IRQ_JD2_BP			(0x0 << 12)
-- 
2.25.1

