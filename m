Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569116;
	b=HUs0PUaYYxBVOWty1ylK6pbn1DDkxRezDRAjlkRJs7XlDpZnTbmSoK3zLKWume/HgW8b
	 KI30RlQNyrv3wKk/aIwMrlKeLElKxUN4D2vgUSucyMVBj1DQZmEeDopJDY3oLaIwqcL0o
	 PcyWVntcF5m8LE7xpOVdQSAW2h89rWE4Ij2qxDpTzL1KXlkQrFyIl9Rm+IBdplrecwfC6
	 mAGmcJZefD0gm+7sNFpEvJ9nu2kIEpF5mFn5vChr2WnA4PWQSB8lhz3SdQB6S5F/fD5FX
	 nQztzzAafCjH5zc8FciFjECJLCDQLqhez3kaDcpv7WJXDFxH0ut7qijoIZewHJbc4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569116;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=5xyV59tbWNxRCO4eyyFrWlnwpAR8fxHGk8ZesUv7p9E=;
	b=WCic/mxaG18DVfRMXHBwOMrTSQgu3uu+o7bux0RfF+Zb4PuB087cCxtfPQSWQm1+xCYz
	 6Wm+seLcCMYW3MzX6wWy19i8KL236w4wriKUYOs3G1K2Ax7BFOixzWbNKDI5EAP0KuVEI
	 6z4gL7AdQlacYfmLMVwgcgnIb3pwGJf8lrooY4DjfYSdgYRcA7saqZR1SseoB4l6FFPWR
	 59vIMOUhnGXhNaFqj+2QAhq+/60phTaBW728Tai89tr/AeXXdL5RE1hnCBpBBspBR5ASn
	 pgN66eoKY/gXrTYi7OptVVXi8ek5vC5uIvBjgmuyRrsIT98aYb5NxVfQUVzYIXRM/oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.175
Received: from smtp153-175.sina.com.cn (smtp153-175.sina.com.cn [61.135.153.175])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF0606A31A
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 07:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AD86F0A000060EB; Wed, 21 Oct 2026 15:51:43 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 38F85E2EC59C499FABC4BDAE62811FD5
X-SMAIL-UIID: 38F85E2EC59C499FABC4BDAE62811FD5-20261021-155143
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 3/3] ASoC: es9356-sdca: Modify the Initialization Configuration
Date: Wed, 21 Oct 2026 15:51:36 +0800
Message-Id: <20261021075136.16155-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261021075136.16155-1-zhangyi@everest-semi.com>
References: <20261021075136.16155-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Read the chip version number and modify the initialization configuration

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es9356.c | 76 ++++++++++++++++++++++++++++++---------
 sound/soc/codecs/es9356.h |  4 +++
 2 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 31cabf528..8eb48e6f3 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -749,58 +749,97 @@ static const struct regmap_config es9356_sdca_regmap = {
 	.use_single_write = true,
 };
 
-static void es9356_register_init(struct es9356_sdw_priv *es9356)
+static int es9356_register_init(struct es9356_sdw_priv *es9356)
 {
+	unsigned int version;
+	int ret;
+
+	ret = regmap_read(es9356->regmap, ES9356_VERSION, &version);
+	if (ret < 0) {
+		pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+		return ret;
+	}
+
+	regmap_write(es9356->regmap, ES9356_SPKLDO_CTL, 0x2c);
+	if (!(version >> 1))
+		regmap_write(es9356->regmap, ES9356_HP_VOLUME, 0x11);
+	else
+		regmap_write(es9356->regmap, ES9356_HP_VOLUME, 0x00);
+
+	regmap_write(es9356->regmap, ES9356_SPKCLK_CTL, 0xc3);
 	regmap_write(es9356->regmap, ES9356_STATE, 0x02);
 	regmap_write(es9356->regmap, ES9356_ENDPOINT_MODE, 0x24);
 	regmap_write(es9356->regmap, ES9356_PRE_DIV_CTL, 0x00);
 	regmap_write(es9356->regmap, ES9356_ADC_OSR, 0x18);
-	regmap_write(es9356->regmap, ES9356_ADC_OSRGAIN, 0x13);
+	regmap_write(es9356->regmap, ES9356_ADC_OSRGAIN, 0x11);
 	regmap_write(es9356->regmap, ES9356_DAC_OSR, 0x16);
 	regmap_write(es9356->regmap, ES9356_CLK_CTL, 0x0f);
-	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x01);
-	regmap_write(es9356->regmap, ES9356_CLK_SEL, 0x30);
 
+	if (!(version >> 1))
+		regmap_write(es9356->regmap, ES9356_CLK_SEL, 0x30);
+	else
+		regmap_write(es9356->regmap, ES9356_CLK_SEL, 0x10);
+
+	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x01);
 	regmap_write(es9356->regmap, ES9356_DETCLK_CTL, 0x51);
-	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x10);
+	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x00);
 	regmap_write(es9356->regmap, ES9356_MICBIAS_CTL, 0x10);
 	regmap_write(es9356->regmap, ES9356_HPDETECT_CTL, 0x07);
 	regmap_write(es9356->regmap, ES9356_ADC_ANA, 0x30);
-	regmap_write(es9356->regmap, ES9356_PGA_CTL, 0xa8);
+	regmap_write(es9356->regmap, ES9356_PGA_CTL, 0xaa);
 	regmap_write(es9356->regmap, ES9356_ADC_INT, 0xaa);
 	regmap_write(es9356->regmap, ES9356_ADC_LP, 0x19);
 	regmap_write(es9356->regmap, ES9356_VMID1SEL, 0xbc);
 	regmap_write(es9356->regmap, ES9356_VMID_TIME, 0x0b);
 	regmap_write(es9356->regmap, ES9356_STATE_TIME, 0xbb);
-	regmap_write(es9356->regmap, ES9356_HP_SPK_TIME, 0x77);
+	regmap_write(es9356->regmap, ES9356_HP_SPK_TIME, 0x7a);
 	regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
-	regmap_write(es9356->regmap, ES9356_MICBIAS_SEL, 0x15);
+
+	if ((version & GENMASK(1, 0)) == 0x03)
+		regmap_write(es9356->regmap, ES9356_MICBIAS_SEL, 0x15);
+	else
+		regmap_write(es9356->regmap, ES9356_MICBIAS_SEL, 0x25);
+
+	regmap_write(es9356->regmap, ES9356_SPARE_REGISTER3, 0x00);
 	regmap_write(es9356->regmap, ES9356_KEY_PRESS_TIME, 0xff);
 	regmap_write(es9356->regmap, ES9356_KEY_RELEASE_TIME, 0xff);
 	regmap_write(es9356->regmap, ES9356_KEY_HOLD_TIME, 0x0f);
-	regmap_write(es9356->regmap, ES9356_BTSEL_REF, 0x00);
+
+	if ((version & GENMASK(1, 0)) == 0x03)
+		regmap_write(es9356->regmap, ES9356_BTSEL_REF, 0x04);
+	else
+		regmap_write(es9356->regmap, ES9356_BTSEL_REF, 0x00);
+
 	regmap_write(es9356->regmap, ES9356_KEYD_DETECT, 0x18);
 	regmap_write(es9356->regmap, ES9356_MICBIAS_RES, 0x03);
-	regmap_write(es9356->regmap, ES9356_BUTTON_CHARGE, 0x00);
-	regmap_write(es9356->regmap, ES9356_CALIBRATION_TIME, 0x13);
-	regmap_write(es9356->regmap, ES9356_CALIBRATION_SETTING, 0xf4);
+	regmap_write(es9356->regmap, ES9356_CALIBRATION_TIME, 0x1a);
+
+	if (!(version >> 1)) {
+		regmap_write(es9356->regmap, ES9356_CALIBRATION_SETTING, 0xc3);
+	} else {
+		regmap_write(es9356->regmap, ES9356_CALIBRATION_SETTING, 0xf4);
+		regmap_write(es9356->regmap, ES9356_SPK_SCP, 0x55);
+	}
 
 	regmap_write(es9356->regmap, ES9356_SPK_VOLUME, 0x33);
 	regmap_write(es9356->regmap, ES9356_DAC_VROI, 0x01);
 	regmap_write(es9356->regmap, ES9356_DAC_LP, 0x00);
 	regmap_write(es9356->regmap, ES9356_HP_IBIAS, 0x04);
 	regmap_write(es9356->regmap, ES9356_HP_LP, 0x03);
-	regmap_write(es9356->regmap, ES9356_SPKLDO_CTL, 0x65);
+	regmap_write(es9356->regmap, ES9356_SPKLDO_CTL, 0x6c);
 	regmap_write(es9356->regmap, ES9356_SPKBIAS_COMP, 0x09);
-	regmap_write(es9356->regmap, ES9356_VMID1STL, 0x00);
+	regmap_write(es9356->regmap, ES9356_VMID1STL, 0x01);
 	regmap_write(es9356->regmap, ES9356_VMID2STL, 0x00);
 	regmap_write(es9356->regmap, ES9356_VSEL, 0xfc);
 
 	regmap_write(es9356->regmap, ES9356_IBIASGEN, 0x10);
-	regmap_write(es9356->regmap, ES9356_ADC_AMIC_CTL, 0x0d);
+	regmap_write(es9356->regmap, ES9356_ADC_AMIC_CTL, 0x05);
 	regmap_write(es9356->regmap, ES9356_STATE, 0x0e);
 	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x00);
 	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x08);
+	regmap_write(es9356->regmap, ES9356_DAC_AUTOMUTE, 0x31);
+	regmap_write(es9356->regmap, ES9356_DAC_AUTOMUTE_WINSIZE, 0x3D);
+	regmap_write(es9356->regmap, ES9356_DAC_AUTOMUTE_RESULT1, 0x80);
 
 	regmap_write(es9356->regmap,
 		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
@@ -821,11 +860,14 @@ static void es9356_register_init(struct es9356_sdw_priv *es9356)
 		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
 	regmap_write(es9356->regmap,
 		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
+
+	return 0;
 }
 
 static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (es9356->hw_init)
 		return 0;
@@ -840,7 +882,9 @@ static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		es9356_register_init(es9356);
+		ret = es9356_register_init(es9356);
+		if (ret < 0)
+			return -EINVAL;
 	}
 	pm_runtime_get_noresume(&slave->dev);
 
diff --git a/sound/soc/codecs/es9356.h b/sound/soc/codecs/es9356.h
index ceb571903..c147ecdd8 100644
--- a/sound/soc/codecs/es9356.h
+++ b/sound/soc/codecs/es9356.h
@@ -38,6 +38,7 @@
 #define ES9356_MICBIAS_CTL                      0x2047
 #define ES9356_HPDETECT_CTL                     0x2048
 #define ES9356_MICBIAS_RES                      0x2049
+#define ES9356_SPARE_REGISTER3                  0x204a
 
 /*CLK*/
 #define ES9356_CLK_SEL                          0x2050
@@ -82,6 +83,9 @@
 #define ES9356_DAC_RAMP                         0x2093
 #define ES9356_DAC_VPPSCALE                     0x2094
 #define ES9356_DAC_SWAP                         0x2097
+#define ES9356_DAC_AUTOMUTE                     0x2098
+#define ES9356_DAC_AUTOMUTE_WINSIZE             0x2099
+#define ES9356_DAC_AUTOMUTE_RESULT1             0x209B
 #define ES9356_SPKCMP_VPPSC                     0x20A0
 #define ES9356_CALIBRATION_TIME                 0x20A1
 #define ES9356_CALIBRATION_SETTING              0x20A2
-- 
2.17.1

