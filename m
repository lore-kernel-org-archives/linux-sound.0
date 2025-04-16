Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4DC22D7BC
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795575; cv=none; b=sYOqZboiTDB4IE39xbeBoJEo0Kk8YoyBtNNmVA9RYbIIbMS2isleGIuTQiDKn5Yl6kFSSmLjvCglTPly/mQMcGEPWBHq/zEjciyUwaGuYw5IYzP1IB0vRCpvChKyVyl5aW6EB/GmUbQ2LFBn3Vo1nZQVZm9LtYKjl3Ws3/Zeh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795575; c=relaxed/simple;
	bh=NNeuHsNpn04bSQBCdNQyqHRolmuQQ32m3pGw1chP9Fw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q+J5HSShBFslcoNzlx3BpFalv22rsL+C0lxIK3pM/3QWa3Ap1iCZZAZKMbGPlK6Ricen9QPKMOAHBRHaPrhd9RORX9zcTtr/qnsndASXsdLLdpTK5cSfvqt3CGpRBJRVUutUR8iQUt80BbdqmhL1asSBmmF9D0Oh5g50MXLzgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=uZC4Jhso; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="uZC4Jhso"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53G9Pfe363043220, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1744795541; bh=NNeuHsNpn04bSQBCdNQyqHRolmuQQ32m3pGw1chP9Fw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=uZC4JhsoLF7vzV4lknfvQYED5dc7JHUnwT7aexfN66JWztbhpWtjVEwCSNO3rR/HT
	 5HLsvvJq9TRDhDSkAaAHO/aC/NaHWb8wQqnvcJIXe/iXO32aERQzlG1u4kuc5Y0WMO
	 MwHhKE6VeDd5Nkl7OI259tcg8rNhOowvSX0DxQZ0iloDBzWWvRatYfOoTgUJkFIds4
	 B3HbAMEhdpYG6DGFyCAS55Qbf462YiAwbe2mq0rBac9iJzq7nHow7XjItIpTUcM882
	 hnMiTi8UYKHm8tNMtVJuD2yAx1CPixI43iNgWkxjje8PqcU+Wzgj57Qch4Dfn0yO8a
	 DsJsYFYafAREA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53G9Pfe363043220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 17:25:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Apr 2025 17:25:41 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 16 Apr 2025 17:25:41 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [RESEND PATCH 1/2] ASoC: rt722: fix pop noise at the beginning of headphone playback
Date: Wed, 16 Apr 2025 17:25:28 +0800
Message-ID: <20250416092528.737845-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch added the function_status check to avoid the calibration again.
The codec driver reinitializes when the 'FUNCTION_NEEDS_INITIALIZATION' flag raises.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c |   8 +
 sound/soc/codecs/rt722-sdca.c     | 285 +++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.h     |   5 +
 3 files changed, 176 insertions(+), 122 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 11e2e8f68a98..142eb032b4f8 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -24,6 +24,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 	case 0x2f50:
 	case 0x2f54:
 	case 0x2f58 ... 0x2f5d:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_GE49, RT722_SDCA_CTL_SELECTED_MODE,
 			0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_GE49, RT722_SDCA_CTL_DETECTED_MODE,
@@ -56,6 +57,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 			  RT722_SDCA_CTL_VENDOR_DEF, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A,
 			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_CS1F,
 			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
@@ -70,6 +72,7 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 			  RT722_SDCA_CTL_VENDOR_DEF, CH_08):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23,
 			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_CS31,
 			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
 	case RT722_BUF_ADDR_HID1 ... RT722_BUF_ADDR_HID2:
@@ -150,11 +153,14 @@ static bool rt722_sdca_volatile_register(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case 0x2f01:
 	case 0x2f54:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_GE49, RT722_SDCA_CTL_DETECTED_MODE,
 			0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01, RT722_SDCA_CTL_HIDTX_CURRENT_OWNER,
 			0) ... SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
 			RT722_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case RT722_BUF_ADDR_HID1 ... RT722_BUF_ADDR_HID2:
 	case 0x2000000:
 	case 0x200000d:
@@ -166,6 +172,8 @@ static bool rt722_sdca_volatile_register(struct device *dev, unsigned int reg)
 	case 0x2000084:
 	case 0x2000086:
 	case 0x3110000:
+	case 0x5800003:
+	case 0x5810000:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index f093ce841b3f..dae78392e60e 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1302,140 +1302,181 @@ int rt722_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave
 
 static void rt722_sdca_dmic_preset(struct rt722_sdca_priv *rt722)
 {
-	/* Set AD07 power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_ADC0A_08_PDE_FLOAT_CTL, 0x2a29);
-	/* Set AD10 power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_ADC10_PDE_FLOAT_CTL, 0x2a00);
-	/* Set DMIC1/DMIC2 power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_DMIC1_2_PDE_FLOAT_CTL, 0x2a2a);
-	/* Set DMIC2 IT entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_DMIC_ENT_FLOAT_CTL, 0x2626);
-	/* Set AD10 FU entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_ADC_ENT_FLOAT_CTL, 0x1e00);
-	/* Set DMIC2 FU entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_DMIC_GAIN_ENT_FLOAT_CTL0, 0x1515);
-	/* Set AD10 FU channel floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_ADC_VOL_CH_FLOAT_CTL, 0x0304);
-	/* Set DMIC2 FU channel floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_DMIC_GAIN_ENT_FLOAT_CTL2, 0x0304);
-	/* vf71f_r12_07_06 and vf71f_r13_07_06 = 2’b00 */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
-		RT722_HDA_LEGACY_CONFIG_CTL0, 0x0000);
-	/* Enable vf707_r12_05/vf707_r13_05 */
-	regmap_write(rt722->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_IT26,
-			RT722_SDCA_CTL_VENDOR_DEF, 0), 0x01);
-	/* Fine tune PDE2A latency */
-	regmap_write(rt722->regmap, 0x2f5c, 0x25);
+	unsigned int mic_func_status;
+	struct device *dev = &rt722->slave->dev;
+
+	regmap_read(rt722->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0), &mic_func_status);
+	dev_dbg(dev, "%s mic func_status=0x%x\n", __func__, mic_func_status);
+
+	if ((mic_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt722->first_hw_init)) {
+		/* Set AD07 power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_ADC0A_08_PDE_FLOAT_CTL, 0x2a29);
+		/* Set AD10 power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_ADC10_PDE_FLOAT_CTL, 0x2a00);
+		/* Set DMIC1/DMIC2 power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_DMIC1_2_PDE_FLOAT_CTL, 0x2a2a);
+		/* Set DMIC2 IT entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_DMIC_ENT_FLOAT_CTL, 0x2626);
+		/* Set AD10 FU entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_ADC_ENT_FLOAT_CTL, 0x1e00);
+		/* Set DMIC2 FU entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_DMIC_GAIN_ENT_FLOAT_CTL0, 0x1515);
+		/* Set AD10 FU channel floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_ADC_VOL_CH_FLOAT_CTL, 0x0304);
+		/* Set DMIC2 FU channel floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_DMIC_GAIN_ENT_FLOAT_CTL2, 0x0304);
+		/* vf71f_r12_07_06 and vf71f_r13_07_06 = 2’b00 */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL,
+			RT722_HDA_LEGACY_CONFIG_CTL0, 0x0000);
+		/* Enable vf707_r12_05/vf707_r13_05 */
+		regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_IT26,
+				RT722_SDCA_CTL_VENDOR_DEF, 0), 0x01);
+		/* Fine tune PDE2A latency */
+		regmap_write(rt722->regmap, 0x2f5c, 0x25);
+
+		/* clear flag */
+		regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
+				FUNCTION_NEEDS_INITIALIZATION);
+	}
 }
 
 static void rt722_sdca_amp_preset(struct rt722_sdca_priv *rt722)
 {
-	/* Set DVQ=01 */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_CLSD_CTRL6,
-		0xc215);
-	/* Reset dc_cal_top */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_CALI, RT722_DC_CALIB_CTRL,
-		0x702c);
-	/* W1C Trigger Calibration */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_CALI, RT722_DC_CALIB_CTRL,
-		0xf02d);
-	/* Set DAC02/ClassD power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_AMP_PDE_FLOAT_CTL,
-		0x2323);
-	/* Set EAPD high */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_EAPD_CTL,
-		0x0002);
-	/* Enable vf707_r14 */
-	regmap_write(rt722->regmap,
-		SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_OT23,
-			RT722_SDCA_CTL_VENDOR_DEF, CH_08), 0x04);
+	unsigned int amp_func_status;
+	struct device *dev = &rt722->slave->dev;
+
+	regmap_read(rt722->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0), &amp_func_status);
+	dev_dbg(dev, "%s amp func_status=0x%x\n", __func__, amp_func_status);
+
+	if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt722->first_hw_init)) {
+		/* Set DVQ=01 */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_CLSD_CTRL6,
+			0xc215);
+		/* Reset dc_cal_top */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_CALI, RT722_DC_CALIB_CTRL,
+			0x702c);
+		/* W1C Trigger Calibration */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_CALI, RT722_DC_CALIB_CTRL,
+			0xf02d);
+		/* Set DAC02/ClassD power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_AMP_PDE_FLOAT_CTL,
+			0x2323);
+		/* Set EAPD high */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_EAPD_CTL,
+			0x0002);
+		/* Enable vf707_r14 */
+		regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_OT23,
+				RT722_SDCA_CTL_VENDOR_DEF, CH_08), 0x04);
+
+		/* clear flag */
+		regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
+				FUNCTION_NEEDS_INITIALIZATION);
+	}
 }
 
 static void rt722_sdca_jack_preset(struct rt722_sdca_priv *rt722)
 {
 	int loop_check, chk_cnt = 100, ret;
 	unsigned int calib_status = 0;
+	unsigned int jack_func_status;
+	struct device *dev = &rt722->slave->dev;
+
+	regmap_read(rt722->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0), &jack_func_status);
+	dev_dbg(dev, "%s jack func_status=0x%x\n", __func__, jack_func_status);
+
+	if ((jack_func_status & FUNCTION_NEEDS_INITIALIZATION) || (!rt722->first_hw_init)) {
+		/* Config analog bias */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_ANALOG_BIAS_CTL3,
+			0xa081);
+		/* GE related settings */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_GE_RELATED_CTL2,
+			0xa009);
+		/* Button A, B, C, D bypass mode */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL4,
+			0xcf00);
+		/* HID1 slot enable */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL5,
+			0x000f);
+		/* Report ID for HID1 */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL0,
+			0x1100);
+		/* OSC/OOC for slot 2, 3 */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL7,
+			0x0c12);
+		/* Set JD de-bounce clock control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_JD_CTRL1,
+			0x7002);
+		/* Set DVQ=01 */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_CLSD_CTRL6,
+			0xc215);
+		/* FSM switch to calibration manual mode */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_FSM_CTL,
+			0x4100);
+		/* W1C Trigger DC calibration (HP) */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_CALI, RT722_DAC_DC_CALI_CTL3,
+			0x008d);
+		/* check HP calibration FSM status */
+		for (loop_check = 0; loop_check < chk_cnt; loop_check++) {
+			usleep_range(10000, 11000);
+			ret = rt722_sdca_index_read(rt722, RT722_VENDOR_CALI,
+				RT722_DAC_DC_CALI_CTL3, &calib_status);
+			if (ret < 0)
+				dev_dbg(&rt722->slave->dev, "calibration failed!, ret=%d\n", ret);
+			if ((calib_status & 0x0040) == 0x0)
+				break;
+		}
 
-	/* Config analog bias */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_ANALOG_BIAS_CTL3,
-		0xa081);
-	/* GE related settings */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_GE_RELATED_CTL2,
-		0xa009);
-	/* Button A, B, C, D bypass mode */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL4,
-		0xcf00);
-	/* HID1 slot enable */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL5,
-		0x000f);
-	/* Report ID for HID1 */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL0,
-		0x1100);
-	/* OSC/OOC for slot 2, 3 */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_UMP_HID_CTL7,
-		0x0c12);
-	/* Set JD de-bounce clock control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_JD_CTRL1,
-		0x7002);
-	/* Set DVQ=01 */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_CLSD_CTRL6,
-		0xc215);
-	/* FSM switch to calibration manual mode */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_FSM_CTL,
-		0x4100);
-	/* W1C Trigger DC calibration (HP) */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_CALI, RT722_DAC_DC_CALI_CTL3,
-		0x008d);
-	/* check HP calibration FSM status */
-	for (loop_check = 0; loop_check < chk_cnt; loop_check++) {
-		usleep_range(10000, 11000);
-		ret = rt722_sdca_index_read(rt722, RT722_VENDOR_CALI,
-			RT722_DAC_DC_CALI_CTL3, &calib_status);
-		if (ret < 0)
-			dev_dbg(&rt722->slave->dev, "calibration failed!, ret=%d\n", ret);
-		if ((calib_status & 0x0040) == 0x0)
-			break;
+		if (loop_check == chk_cnt)
+			dev_dbg(&rt722->slave->dev, "%s, calibration time-out!\n", __func__);
+
+		/* Set ADC09 power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ADC0A_08_PDE_FLOAT_CTL,
+			0x2a12);
+		/* Set MIC2 and LINE1 power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_MIC2_LINE2_PDE_FLOAT_CTL,
+			0x3429);
+		/* Set ET41h and LINE2 power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ET41_LINE2_PDE_FLOAT_CTL,
+			0x4112);
+		/* Set DAC03 and HP power entity floating control */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_DAC03_HP_PDE_FLOAT_CTL,
+			0x4040);
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ENT_FLOAT_CTRL_1,
+			0x4141);
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_FLOAT_CTRL_1,
+			0x0101);
+		/* Fine tune PDE40 latency */
+		regmap_write(rt722->regmap, 0x2f58, 0x07);
+		regmap_write(rt722->regmap, 0x2f03, 0x06);
+		/* MIC VRefo */
+		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
+			RT722_COMBO_JACK_AUTO_CTL1, 0x0200, 0x0200);
+		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
+			RT722_VREFO_GAT, 0x4000, 0x4000);
+		/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
+		rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_DIGITAL_MISC_CTRL4,
+			0x0010);
+
+		/* clear flag */
+		regmap_write(rt722->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
+				FUNCTION_NEEDS_INITIALIZATION);
 	}
-
-	if (loop_check == chk_cnt)
-		dev_dbg(&rt722->slave->dev, "%s, calibration time-out!\n", __func__);
-
-	/* Set ADC09 power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ADC0A_08_PDE_FLOAT_CTL,
-		0x2a12);
-	/* Set MIC2 and LINE1 power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_MIC2_LINE2_PDE_FLOAT_CTL,
-		0x3429);
-	/* Set ET41h and LINE2 power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ET41_LINE2_PDE_FLOAT_CTL,
-		0x4112);
-	/* Set DAC03 and HP power entity floating control */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_DAC03_HP_PDE_FLOAT_CTL,
-		0x4040);
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_ENT_FLOAT_CTRL_1,
-		0x4141);
-	rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_FLOAT_CTRL_1,
-		0x0101);
-	/* Fine tune PDE40 latency */
-	regmap_write(rt722->regmap, 0x2f58, 0x07);
-	regmap_write(rt722->regmap, 0x2f03, 0x06);
-	/* MIC VRefo */
-	rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
-		RT722_COMBO_JACK_AUTO_CTL1, 0x0200, 0x0200);
-	rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
-		RT722_VREFO_GAT, 0x4000, 0x4000);
-	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
-	rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_DIGITAL_MISC_CTRL4,
-		0x0010);
 }
 
 int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index 04c3b4232ef3..a68ab6ca1569 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -183,6 +183,7 @@ struct rt722_sdca_dmic_kctrl_priv {
 #define RT722_SDCA_ENT_PLATFORM_FU44		0x44
 #define RT722_SDCA_ENT_XU03			0x03
 #define RT722_SDCA_ENT_XU0D			0x0d
+#define RT722_SDCA_ENT0 0x00
 
 /* RT722 SDCA control */
 #define RT722_SDCA_CTL_SAMPLE_FREQ_INDEX		0x10
@@ -197,6 +198,7 @@ struct rt722_sdca_dmic_kctrl_priv {
 #define RT722_SDCA_CTL_REQ_POWER_STATE			0x01
 #define RT722_SDCA_CTL_VENDOR_DEF			0x30
 #define RT722_SDCA_CTL_FU_CH_GAIN			0x0b
+#define RT722_SDCA_CTL_FUNC_STATUS			0x10
 
 /* RT722 SDCA channel */
 #define CH_L	0x01
@@ -215,6 +217,9 @@ struct rt722_sdca_dmic_kctrl_priv {
 #define RT722_SDCA_RATE_96000HZ		0x0b
 #define RT722_SDCA_RATE_192000HZ	0x0d
 
+/* Function_Status */
+#define FUNCTION_NEEDS_INITIALIZATION		BIT(5)
+
 enum {
 	RT722_AIF1, /* For headset mic and headphone */
 	RT722_AIF2, /* For speaker */
-- 
2.34.1

