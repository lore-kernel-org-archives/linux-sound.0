Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7741A4F8
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641819; cv=none; b=H8MXE9VI9KitehZ9/UkdMtxsto9AOVBd3kRzoc5bdR6HCnoLMBAvqlPY5aQ0kE0D9/UKhMpJ4MreSB68jGinODz3BeeUABrT+td2PIMc09kF5ye5BokJzxjPq6BiNCNjZLxLqYLKb6VjlGa87ouFK2Y79W9pAlBi+lZde9S3b2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641819; c=relaxed/simple;
	bh=fEh3Ctr+kn7qeMvGXEdDRJEr9cWC8V22jo7DeJxxG9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eBg4i6QMQUpwOhdjO6++yAqu1hXwee9YiwkDTt8Q85Z9BJST6NAMwGYoWbw9ioZYUCkYWNUF124agUatoAdK3R9ezVb9cNn8wlcc8sIkEPBs2j68VuevskqmN+YYw6gc04N3RN+wSGxWq7M23UaVnhrS5nn1P/3QQ1xkqS4dA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=IytrdX2Q; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="IytrdX2Q"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68HAh5fE53215681, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789641785; bh=VRrqgULSF65aWfb+FwY/HIOWi+Mi5vSd4Eiss7PEek8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=IytrdX2QiAk7eyshR2V3e3ak5I9iE2UmvrGzsIXW0MC6T4YlnKcZq7Ywr3U4jPIb9
	 uyrPPBf0hRDR+XVgzEiWvAI5Yre18SZvOnC49SBbJFIkeVrhQs53v+gWoPJ7uUMfFI
	 cYLBX1M4rA+PdYDbwR4+wKn1WoOSalR/dSHCHGKGrW/jnTEqYF6R/LHRqRYzzvaBj0
	 6d9r58WfXPrruOHnNYBzEUE0tnbSz4VwDIz5Pewpva38DifeaDITjWy7b5BYlsA9XT
	 T33VEZMdioW82mn3SEMOLD6tP5stdeMofW6RHWyCjrmncT42/a+5oZzY7TNEgWEVnR
	 DF4e34WCfQ9cQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68HAh5fE53215681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Sep 2026 18:43:05 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 17 Sep 2026 18:43:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 17 Sep 2026 18:43:04 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Thu, 17 Sep 2026 18:43:04 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<shumingf@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	"Oder Chiou" <oder_chiou@realtek.com>
Subject: [PATCH] ASoC: rt721: Add support for the RT721_U and RT718 codec variants
Date: Thu, 17 Sep 2026 18:42:44 +0800
Message-ID: <20260917104244.2512641-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The RT721_U and RT718 variants share most of the register layout and
driver behavior with RT721. Extend the existing RT721 driver to
recognize these variants and apply variant-specific settings where
required.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c   |   3 +
 sound/soc/codecs/rt721-sdca.c       | 199 +++++++++++++++++++++++++---
 sound/soc/codecs/rt721-sdca.h       |  12 ++
 sound/soc/sdw_utils/soc_sdw_utils.c |  46 +++++++
 4 files changed, 242 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 0ebb5688f848..a8c7b42898db 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -91,6 +91,7 @@ static bool rt721_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x5810037:
 	case 0x5810038:
 	case 0x5810039:
+	case 0x5810100:
 	case 0x5b10018:
 	case 0x5b10019:
 	case 0x5f00045:
@@ -167,6 +168,7 @@ static bool rt721_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 	case 0x5810037:
 	case 0x5810038:
 	case 0x5810039:
+	case 0x5810100:
 	case 0x5b10018:
 	case 0x5b10019:
 	case 0x6100006:
@@ -448,6 +450,7 @@ static void rt721_sdca_sdw_remove(struct sdw_slave *slave)
 
 static const struct sdw_device_id rt721_sdca_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x721, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x718, 0x3, 0x1, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt721_sdca_id);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index dbf61fa382a2..ef003c93f533 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -169,8 +169,12 @@ static void rt721_sdca_dmic_preset(struct rt721_sdca_priv *rt721)
 			RT721_ENT_FLOAT_CTL8, 0x1e00);
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_ENT_FLOAT_CTL7, 0x1515);
-		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
-			RT721_CH_FLOAT_CTL3, 0x0304);
+		if (rt721->wf_id == RT721_S)
+			rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+				RT721_CH_FLOAT_CTL3, 0x0304);
+		else
+			rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+				RT721_CH_FLOAT_CTL5, 0x0304);
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_CH_FLOAT_CTL4, 0x0304);
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
@@ -183,7 +187,12 @@ static void rt721_sdca_dmic_preset(struct rt721_sdca_priv *rt721)
 			RT721_RC_CALIB_CTRL0, 0x0b00);
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
 			RT721_RC_CALIB_CTRL0, 0x0b40);
-		regmap_write(rt721->regmap, 0x2f5c, 0x25);
+		if (rt721->wf_id == RT721_S) {
+			regmap_write(rt721->regmap, 0x2f5c, 0x25);
+		} else {
+			regmap_write(rt721->regmap, 0x2f5c, 0x01);
+			regmap_write(rt721->regmap, 0x2f52, 0x00);
+		}
 		/* clear flag */
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT0,
@@ -208,9 +217,11 @@ static void rt721_sdca_amp_preset(struct rt721_sdca_priv *rt721)
 			RT721_VREF1_HV_CTRL1, 0xe000);
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
 			RT721_MISC_POWER_CTL31, 0x8007);
-		regmap_write(rt721->mbq_regmap, 0x5810000, 0x6420);
-		regmap_write(rt721->mbq_regmap, 0x5810000, 0x6421);
-		regmap_write(rt721->mbq_regmap, 0x5810000, 0xe421);
+		if (rt721->wf_id == RT721_S) {
+			regmap_write(rt721->mbq_regmap, 0x5810000, 0x6420);
+			regmap_write(rt721->mbq_regmap, 0x5810000, 0x6421);
+			regmap_write(rt721->mbq_regmap, 0x5810000, 0xe421);
+		}
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_CH_FLOAT_CTL6, 0x5561);
 		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_REG,
@@ -231,6 +242,8 @@ static void rt721_sdca_amp_preset(struct rt721_sdca_priv *rt721)
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_FU55,
 				RT721_SDCA_CTL_FU_MUTE, CH_02), 0x00);
 		regmap_write(rt721->regmap, 0x2f5d, 0x1);
+		if (rt721->wf_id == RT721_U)
+			regmap_write(rt721->regmap, 0x2f54, 0x00);
 		/* clear flag */
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
@@ -245,7 +258,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 	regmap_read(rt721->regmap,
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
-			&jack_func_status);
+		&jack_func_status);
 	dev_dbg(dev, "%s jack func_status=0x%x\n", __func__, jack_func_status);
 
 	if ((jack_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt721->first_hw_init)) {
@@ -330,6 +343,113 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 	}
 }
 
+static void rt721u_sdca_jack_preset(struct rt721_sdca_priv *rt721)
+{
+	unsigned int jack_func_status, calibration_status, i;
+	int ret;
+	struct device *dev = &rt721->slave->dev;
+
+	regmap_read(rt721->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0, RT721_SDCA_CTL_FUNC_STATUS, 0),
+		&jack_func_status);
+	dev_dbg(dev, "%s jack func_status=0x%x\n", __func__, jack_func_status);
+
+	if ((jack_func_status & BIT(5)) || (!rt721->first_hw_init)) {
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_ANA_POW_PART,
+			RT721_VREF1_HV_CTRL1, 0xe000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_MISC_POWER_CTL31, 0x8007);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			0x10, 0xffb7);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			0x20, 0xffb7);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			0x30, 0xffb7);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON13, 0x6048);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_GE_REL_CTRL1, 0x8011);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL3, 0xcf00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL4, 0x000f);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL1, 0x1100);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_UMP_HID_CTRL5, 0x0c12);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_JD_CTRL,
+			RT721_JD_1PIN_GAT_CTRL2, 0xc004);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
+			RT721_RC_CALIB_CTRL0, 0x0b00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_RC_CALIB_CTRL,
+			RT721_RC_CALIB_CTRL0, 0x0b40);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON14, 0x333b);
+		regmap_write(rt721->mbq_regmap, 0x5810135, 0x8036);
+		regmap_write(rt721->mbq_regmap, 0x5810130, 0xee03);
+		regmap_write(rt721->mbq_regmap, 0x5810133, 0x6000);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
+			RT721_HP_AMP_2CH_CAL1, 0x4140);
+		regmap_write(rt721->mbq_regmap, 0x5810100, 0x0006);
+		regmap_write(rt721->mbq_regmap, 0x5810100, 0x8006);
+		for (i = 0; i < 5; i++) {
+			ret = regmap_read(rt721->mbq_regmap, 0x5810100,
+				&calibration_status);
+			if (ret < 0)
+				dev_dbg(dev, "calibration failed!, ret=%d\n",
+					ret);
+			if (!(calibration_status & 0x8000))
+				break;
+		}
+		if (rt721->hw_vid == RT721_U_VB)
+			rt_sdca_index_write(rt721->mbq_regmap, RT721_CBJ_CTRL,
+				RT721_CBJ_A0_GAT_CTRL1, 0x2205);
+		else
+			rt_sdca_index_write(rt721->mbq_regmap, RT721_CBJ_CTRL,
+				RT721_CBJ_A0_GAT_CTRL1, 0x2e05);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON14, 0x3b3b);
+		regmap_write(rt721->mbq_regmap, 0x310400, 0x3043);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON14, 0x3f33);
+		regmap_write(rt721->mbq_regmap, 0x310401, 0x3000);
+		regmap_write(rt721->mbq_regmap, 0x310402, 0x1b00);
+		regmap_write(rt721->mbq_regmap, 0x310300, 0x000f);
+		regmap_write(rt721->mbq_regmap, 0x310301, 0x3000);
+		regmap_write(rt721->mbq_regmap, 0x310302, 0x1b00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON17, 0x0008);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL2, 0x1234);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL3, 0x3512);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL1, 0x4040);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
+			RT721_ENT_FLOAT_CTL4, 0x1201);
+		regmap_write(rt721->regmap, 0x2f58, 0x01);
+		regmap_write(rt721->regmap, 0x2f59, 0x01);
+		regmap_write(rt721->regmap, 0x2f51, 0x00);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_VENDOR_ANA_CTL,
+			RT721_UAJ_TOP_TCON13, 0x6040);
+		regmap_write(rt721->mbq_regmap, 0x910001, 0x3256);
+		regmap_write(rt721->mbq_regmap, 0x910002, 0x0000);
+		regmap_write(rt721->mbq_regmap, 0x910003, 0x0000);
+		regmap_write(rt721->mbq_regmap, 0x900004, 0x7778);
+		regmap_write(rt721->mbq_regmap, 0x910202, 0x02e4);
+		regmap_write(rt721->mbq_regmap, 0x800002, 0xcc04);
+		rt_sdca_index_write(rt721->mbq_regmap, RT721_CAP_PORT_CTRL,
+			RT721_HP_AMP_2CH_CAL4, 0xa105);
+		rt_sdca_index_write(rt721->mbq_regmap, 0x0b, 0x01, 0x0000);
+		/* clear flag */
+		regmap_write(rt721->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT0,
+			RT721_SDCA_CTL_FUNC_STATUS, 0), FUNCTION_NEEDS_INITIALIZATION);
+	}
+}
+
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
 	guard(mutex)(&rt721->calibrate_mutex);
@@ -733,19 +853,47 @@ static int rt721_sdca_dmic_set_gain_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
+static const DECLARE_TLV_DB_SCALE(out_vol_tlv_s, -6525, 75, 0);
+static const DECLARE_TLV_DB_SCALE(out_vol_tlv_u, -9225, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(boost_vol_tlv, 0, 1000, 0);
 static const DECLARE_TLV_DB_SCALE(mic2_boost_vol_tlv, -200, 200, 0);
 
-static const struct snd_kcontrol_new rt721_sdca_controls[] = {
+static const struct snd_kcontrol_new rt721s_sdca_controls[] = {
 	/* Headphone playback settings */
 	SOC_DOUBLE_R_EXT_TLV("FU05 Playback Volume",
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05,
 			RT721_SDCA_CTL_FU_VOLUME, CH_L),
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05,
 			RT721_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x57, 0,
-		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, out_vol_tlv),
+		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, out_vol_tlv_s),
+	/* AMP playback settings */
+	SOC_DOUBLE_R_EXT_TLV("FU06 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
+			RT721_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
+			RT721_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x57, 0,
+		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, out_vol_tlv_s),
+};
+
+static const struct snd_kcontrol_new rt721u_sdca_controls[] = {
+	/* Headphone playback settings */
+	SOC_DOUBLE_R_EXT_TLV("FU05 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05,
+			RT721_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05,
+			RT721_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x7b, 0,
+		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, out_vol_tlv_u),
+	/* AMP playback settings */
+	SOC_DOUBLE_R_EXT_TLV("FU06 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
+			RT721_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
+			RT721_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x7b, 0,
+		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, out_vol_tlv_u),
+};
+
+static const struct snd_kcontrol_new rt721_sdca_controls[] = {
 	/* Headset mic capture settings */
 	SOC_DOUBLE_EXT("FU0F Capture Switch", SND_SOC_NOPM, 0, 1, 1, 0,
 		rt721_sdca_fu0f_capture_get, rt721_sdca_fu0f_capture_put),
@@ -761,13 +909,6 @@ static const struct snd_kcontrol_new rt721_sdca_controls[] = {
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PLATFORM_FU44,
 			RT721_SDCA_CTL_FU_CH_GAIN, CH_R), 1, 0x15, 0,
 		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, mic2_boost_vol_tlv),
-	/* AMP playback settings */
-	SOC_DOUBLE_R_EXT_TLV("FU06 Playback Volume",
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
-			RT721_SDCA_CTL_FU_VOLUME, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
-			RT721_SDCA_CTL_FU_VOLUME, CH_R), 0, 0x57, 0,
-		rt721_sdca_set_gain_get, rt721_sdca_set_gain_put, out_vol_tlv),
 	/* DMIC capture settings */
 	RT_SDCA_FU_CTRL("FU1E Capture Switch",
 		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E,
@@ -1276,6 +1417,15 @@ static int rt721_sdca_probe(struct snd_soc_component *component)
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
+	if (rt721->wf_id == RT721_S)
+		snd_soc_add_component_controls(component,
+			rt721s_sdca_controls,
+			ARRAY_SIZE(rt721s_sdca_controls));
+	else
+		snd_soc_add_component_controls(component,
+			rt721u_sdca_controls,
+			ARRAY_SIZE(rt721u_sdca_controls));
+
 	return 0;
 }
 
@@ -1533,6 +1683,7 @@ int rt721_sdca_init(struct device *dev, struct regmap *regmap,
 	rt721->fu0f_mixer_l_mute = rt721->fu0f_mixer_r_mute = true;
 	rt721->fu1e_mixer_mute[0] = rt721->fu1e_mixer_mute[1] =
 		rt721->fu1e_mixer_mute[2] = rt721->fu1e_mixer_mute[3] = true;
+	rt721->wf_id = -1;
 
 	return devm_snd_soc_register_component(dev,
 			&soc_sdca_dev_rt721, rt721_sdca_dai, ARRAY_SIZE(rt721_sdca_dai));
@@ -1550,6 +1701,7 @@ static void rt721_sdca_reset(struct rt721_sdca_priv *rt721)
 int rt721_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
+	int val;
 
 	rt721->disable_irq = false;
 
@@ -1581,12 +1733,23 @@ int rt721_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	if (rt721->wf_id < 0) {
+		rt_sdca_index_read(rt721->mbq_regmap, RT721_VENDOR_REG,
+			RT721_JD_PRODUCT_NUM, &val);
+		rt721->wf_id = (val >> 4) & 0xf;
+		rt721->hw_vid = val & 0xf;
+		dev_dbg(&slave->dev, "wf_id = %d hw_vid = %d\n", rt721->wf_id, rt721->hw_vid);
+	}
+
 	if (!rt721->first_hw_init)
 		rt721_sdca_reset(rt721);
 
 	rt721_sdca_dmic_preset(rt721);
 	rt721_sdca_amp_preset(rt721);
-	rt721_sdca_jack_preset(rt721);
+	if (rt721->wf_id == RT721_S)
+		rt721_sdca_jack_preset(rt721);
+	else
+		rt721u_sdca_jack_preset(rt721);
 
 	if (rt721->hs_jack && (!rt721->first_hw_init))
 		rt721_sdca_jack_init(rt721);
diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
index b8873b18a648..16cf40cd88de 100644
--- a/sound/soc/codecs/rt721-sdca.h
+++ b/sound/soc/codecs/rt721-sdca.h
@@ -40,6 +40,8 @@ struct  rt721_sdca_priv {
 	/* For DMIC */
 	bool fu1e_dapm_mute;
 	bool fu1e_mixer_mute[4];
+	int wf_id;
+	int hw_vid;
 };
 
 struct rt721_sdca_dmic_kctrl_priv {
@@ -273,6 +275,16 @@ enum {
 	RT721_AIFS,
 };
 
+enum rt721_wf_id {
+	RT721_S,
+	RT721_U,
+};
+
+enum rt721u_hw_ver {
+	RT721_U_VB = 1,
+	RT721_U_VD = 3,
+};
+
 int rt721_sdca_io_init(struct device *dev, struct sdw_slave *slave);
 int rt721_sdca_init(struct device *dev, struct regmap *regmap,
 			struct regmap *mbq_regmap, struct sdw_slave *slave);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 88031238c04e..dccc27921272 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -685,6 +685,52 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 3,
 	},
+	{
+		.vendor_id = 0x025d,
+		.part_id = 0x718,
+		.name_prefix = "rt721",
+		.version_id = 3,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt721-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt721-sdca-aif2",
+				.component_name = "rt721",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				/* No feedback capability is provided by rt721-sdca codec driver*/
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_mf_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt721-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+		},
+		.dai_num = 3,
+	},
 	{
 		.vendor_id = 0x025d,
 		.part_id = 0x722,
-- 
2.54.0

