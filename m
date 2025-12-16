Received: from mail78-37.sinamail.sina.com.cn (mail78-37.sinamail.sina.com.cn [219.142.78.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782163164D6
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867694; cv=none; b=VvfuUQI0K0NJ4nZgBNFfvSNFLjd6Q6RGgBwmb/ycZn+zO8U9UJb6RkDbRJ8PT1SXXvB8Bo2HoV/XatpsuwNold2AKGsfxSl1e2aLGrp1qa5jRk2BP55lnzs4cYsO5eHbIsxFwZtnBy8F8UytLUzQgaWtepIyc/CBbH+G/J/ENEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867694; c=relaxed/simple;
	bh=XtDCGXiVu6eZ/2cEOB9m61laOrBUPw2kJ8kgRu8O6fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NsleTzLjhB/6MyErM73V9lWQCq9mLkmxcW3RIzCWwdk/K97x1qeB2SU7ssXZGkO9n82iVnyMkFMVcNYanY6o0YDIzwoHO3SZJkRZDqLajOHsYCveTlzlUM09OgHQYzzgsfhnKe0nv9SxlbB3pIvc1bjb50cJJmbz4bbXpHp9EFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6941007B00005785; Tue, 16 Dec 2025 14:47:27 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 2BB02582D59E4470AEE835AC01BCA72D
X-SMAIL-UIID: 2BB02582D59E4470AEE835AC01BCA72D-20251216-144727
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/2] ASoC: codecs: ES8326: Add kcontrol for DRE
Date: Tue, 16 Dec 2025 14:47:21 +0800
Message-Id: <20251216064721.4622-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251216064721.4622-1-zhangyi@everest-semi.com>
References: <20251216064721.4622-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Set up a kcontrol to control DRE

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 14 ++++++++++++++
 sound/soc/codecs/es8326.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 77af50eea27d..8b3ad6b5ef45 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -194,6 +194,8 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_pga_tlv, 0, 600, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(softramp_rate, 0, 100, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(drc_target_tlv, -3200, 200, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(drc_recovery_tlv, -125, 250, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dre_gain_tlv, -9550, 400, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dre_gate_tlv, -9600, 600, 0);
 
 static const char *const winsize[] = {
 	"0.25db/2  LRCK",
@@ -226,6 +228,8 @@ static const char *const hp_spkvol_switch[] = {
 
 static const struct soc_enum dacpol =
 	SOC_ENUM_SINGLE(ES8326_DAC_DSM, 4, 4, dacpol_txt);
+static const struct soc_enum dre_winsize =
+	SOC_ENUM_SINGLE(ES8326_ADC_DRE, 0, 16, winsize);
 static const struct soc_enum alc_winsize =
 	SOC_ENUM_SINGLE(ES8326_ADC_RAMPRATE, 4, 16, winsize);
 static const struct soc_enum drc_winsize =
@@ -247,6 +251,16 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("ADC PGA Gain Volume", ES8326_PGAGAIN, 0, 10, 0, adc_analog_pga_tlv),
 	SOC_SINGLE("ADC PGA SE Switch", ES8326_PGAGAIN, 7, 1, 0),
 	SOC_SINGLE_TLV("ADC Ramp Rate", ES8326_ADC_RAMPRATE, 0, 0x0f, 0, softramp_rate),
+	SOC_SINGLE("ADC4 DRE Switch", ES8326_ADC_DRE, 4, 1, 0),
+	SOC_SINGLE("ADC3 DRE Switch", ES8326_ADC_DRE, 5, 1, 0),
+	SOC_SINGLE("ADC2 DRE Switch", ES8326_ADC_DRE, 6, 1, 0),
+	SOC_SINGLE("ADC1 DRE Switch", ES8326_ADC_DRE, 7, 1, 0),
+	SOC_ENUM("DRE Winsize", dre_winsize),
+	SOC_SINGLE("DRE Gain Switch", ES8326_ADC_DRE_GAIN, 5, 1, 0),
+	SOC_SINGLE_TLV("DRE Gain Volume", ES8326_ADC_DRE_GAIN,
+			0, 0x1F, 0, dre_gain_tlv),
+	SOC_SINGLE_TLV("DRE Gate Volume", ES8326_ADC_DRE_GATE,
+			4, 0x07, 0, dre_gate_tlv),
 	SOC_SINGLE("ALC Capture Switch", ES8326_ALC_RECOVERY, 3, 1, 0),
 	SOC_SINGLE_TLV("ALC Capture Recovery Level", ES8326_ALC_LEVEL,
 			0, 4, 0, drc_recovery_tlv),
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index c3e52e7bdef5..1c5b3ec70a1e 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -58,6 +58,9 @@
 #define ES8326_ADC1_VOL		0x2c
 #define ES8326_ADC2_VOL		0x2d
 #define ES8326_ADC_RAMPRATE	0x2e
+#define ES8326_ADC_DRE		0x2f
+#define ES8326_ADC_DRE_GAIN	0x30
+#define ES8326_ADC_DRE_GATE	0x31
 #define ES8326_ALC_RECOVERY	0x32
 #define ES8326_ALC_LEVEL	0x33
 #define ES8326_ADC_HPFS1	0x34
-- 
2.17.1

