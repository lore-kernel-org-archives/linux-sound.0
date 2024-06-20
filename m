Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD22594
	for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 10:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718879582; cv=none; b=G5hVVmI2Ny8j6Sdn20/ac5JnPsXK2U1DSAzIMPRngBLJBO5jfNZbIinICkSIJ++mpcy3k0cSDC07I79QKTbbt0bpnVL++Nw3VBQtTvdSnVPyBiMsn4Dfp8wHXKQ8D2PkyYasvf+Zd+HBAc6LbqVour2h82GjzDBRbS+fGaXrcUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718879582; c=relaxed/simple;
	bh=7uvBfI0ZI4R1Z+pcZaMMI9FPjioaQFuf8lawuoqTvPY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hmYAw9LFUa3eWwaS+jh0FvP9h8EK3VtBW0me8dNYsfIAOxZODWfsFlzSlxKUVv70dz81TMCe9SgSiPA0d5L+Z2IW9TmPgC3PpW65wPybIBlFLix6UWodlT/F66C6GzY4rT25G6cU1QS9eotP1VSbeNn7MeVka5S6YZKp0RfjhuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 45KAWVQG02804329, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 45KAWVQG02804329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2024 18:32:31 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 18:32:31 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 20 Jun 2024 18:32:30 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: rt712-sdca: change the definition name of SDCA channel number
Date: Thu, 20 Jun 2024 18:32:24 +0800
Message-ID: <20240620103224.2124179-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch doesn't have any change of functionality.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 12 +++++-----
 sound/soc/codecs/rt712-sdca-sdw.h | 28 +++++++++++------------
 sound/soc/codecs/rt712-sdca.c     | 38 +++++++++++++++----------------
 sound/soc/codecs/rt712-sdca.h     | 10 ++++----
 4 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index ce337db86d1a..ecc541c5a583 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -79,12 +79,12 @@ static bool rt712_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x5d00000 ... 0x5d00009:
 	case 0x5f00000 ... 0x5f00030:
 	case 0x6100000 ... 0x6100068:
-	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_L):
-	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_R):
-	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_L):
-	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_R):
-	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_L):
-	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_01):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_02):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_01):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_02):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_01):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_02):
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/codecs/rt712-sdca-sdw.h b/sound/soc/codecs/rt712-sdca-sdw.h
index 4be22ccd8561..f0cb871b9fa2 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.h
+++ b/sound/soc/codecs/rt712-sdca-sdw.h
@@ -57,16 +57,16 @@ static const struct reg_default rt712_sdca_reg_defaults[] = {
 	{ 0x3303, 0x1f },
 	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS01, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
 	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS11, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_MUTE, CH_02), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_MUTE, CH_02), 0x01 },
 	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE40, RT712_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
 	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE12, RT712_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_CS31, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_PDE23, RT712_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
-	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
-	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_02), 0x01 },
 	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_OT23, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x00 },
 };
 
@@ -95,14 +95,14 @@ static const struct reg_default rt712_sdca_mbq_defaults[] = {
 	{ 0x6100064, 0x8000 },
 	{ 0x6100065, 0x0000 },
 	{ 0x6100067, 0xff12 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_L), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_R), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_L), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_R), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_L), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_R), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_L), 0x0000 },
-	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_R), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_01), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_02), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_01), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_02), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_01), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_02), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_01), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_02), 0x0000 },
 };
 
 #endif /* __RT712_SDW_H__ */
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index b503de9fda80..e69e1a14fb51 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -592,20 +592,20 @@ static int rt712_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
 static int rt712_sdca_set_fu0f_capture_ctl(struct rt712_sdca_priv *rt712)
 {
 	int err;
-	unsigned int ch_l, ch_r;
+	unsigned int ch_01, ch_02;
 
-	ch_l = (rt712->fu0f_dapm_mute || rt712->fu0f_mixer_l_mute) ? 0x01 : 0x00;
-	ch_r = (rt712->fu0f_dapm_mute || rt712->fu0f_mixer_r_mute) ? 0x01 : 0x00;
+	ch_01 = (rt712->fu0f_dapm_mute || rt712->fu0f_mixer_l_mute) ? 0x01 : 0x00;
+	ch_02 = (rt712->fu0f_dapm_mute || rt712->fu0f_mixer_r_mute) ? 0x01 : 0x00;
 
 	err = regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F,
-			RT712_SDCA_CTL_FU_MUTE, CH_L), ch_l);
+			RT712_SDCA_CTL_FU_MUTE, CH_01), ch_01);
 	if (err < 0)
 		return err;
 
 	err = regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F,
-			RT712_SDCA_CTL_FU_MUTE, CH_R), ch_r);
+			RT712_SDCA_CTL_FU_MUTE, CH_02), ch_02);
 	if (err < 0)
 		return err;
 
@@ -649,28 +649,28 @@ static const DECLARE_TLV_DB_SCALE(boost_vol_tlv, 0, 1000, 0);
 
 static const struct snd_kcontrol_new rt712_sdca_controls[] = {
 	SOC_DOUBLE_R_EXT_TLV("FU05 Playback Volume",
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_R),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_01),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_02),
 		0, 0x57, 0,
 		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, out_vol_tlv),
 	SOC_DOUBLE_EXT("FU0F Capture Switch", SND_SOC_NOPM, 0, 1, 1, 0,
 		rt712_sdca_fu0f_capture_get, rt712_sdca_fu0f_capture_put),
 	SOC_DOUBLE_R_EXT_TLV("FU0F Capture Volume",
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_R),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_01),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_02),
 		0, 0x3f, 0,
 		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, mic_vol_tlv),
 	SOC_DOUBLE_R_EXT_TLV("FU44 Boost Volume",
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_R),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_01),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_02),
 		8, 3, 0,
 		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, boost_vol_tlv),
 };
 
 static const struct snd_kcontrol_new rt712_sdca_spk_controls[] = {
 	SOC_DOUBLE_R_EXT_TLV("FU06 Playback Volume",
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_R),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_01),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_02),
 		0, 0x57, 0,
 		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, out_vol_tlv),
 };
@@ -763,21 +763,21 @@ static int rt712_sdca_fu05_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_L),
+				RT712_SDCA_CTL_FU_MUTE, CH_01),
 				unmute);
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_R),
+				RT712_SDCA_CTL_FU_MUTE, CH_02),
 				unmute);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_L),
+				RT712_SDCA_CTL_FU_MUTE, CH_01),
 				mute);
 		regmap_write(rt712->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
-				RT712_SDCA_CTL_FU_MUTE, CH_R),
+				RT712_SDCA_CTL_FU_MUTE, CH_02),
 				mute);
 		break;
 	}
@@ -885,8 +885,8 @@ static int rt712_sdca_classd_event(struct snd_soc_dapm_widget *w,
 
 static const struct snd_kcontrol_new rt712_spk_sto_dac =
 	SOC_DAPM_DOUBLE_R("Switch",
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_R),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_01),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_02),
 		0, 1, 1);
 
 static const struct snd_soc_dapm_widget rt712_sdca_dapm_widgets[] = {
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index ff79e03118ce..bf462a837c0d 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -39,6 +39,12 @@ struct  rt712_sdca_priv {
 	bool fu0f_mixer_r_mute;
 };
 
+/* SDCA (Channel) */
+#define CH_01	0x01
+#define CH_02	0x02
+#define CH_03	0x03
+#define CH_04	0x04
+
 /* NID */
 #define RT712_VENDOR_REG			0x20
 #define RT712_VENDOR_CALI			0x58
@@ -176,10 +182,6 @@ struct  rt712_sdca_priv {
 #define RT712_SDCA_CTL_VENDOR_DEF 0x30
 #define RT712_SDCA_CTL_FU_CH_GAIN 0x0b
 
-/* RT712 SDCA channel */
-#define CH_L 0x01
-#define CH_R 0x02
-
 /* sample frequency index */
 #define RT712_SDCA_RATE_16000HZ		0x04
 #define RT712_SDCA_RATE_32000HZ		0x07
-- 
2.34.1

