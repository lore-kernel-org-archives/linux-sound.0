Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996987;
	b=Pryws+iWaFZflUhRlFNj7aFyhnE6REOqqPFx10rtwG4FpDmW7EeCoI21a5X//w1czD5N
	 aFLF6GwbEZpBTLHSoBbjvX2S7KoRspR3pMYSBdq8hES31it2maA99LB0F/yN2PIK0pQd9
	 5CUbNxYkZ5vWqdR1wNdPuIMAZ7ATse4MO9+S6SEzknJWxF16qwlOx78+OM3po0dbSbBis
	 ElDuLZDsvCmS1YFnxxewJJZE/zuHSlnxEO2TGyO20cCzLMHsN5bnf0ZgpaXqvYeMVvBhD
	 TTcDHp3BGuIS99CQNgdULp9fexif7l105NPUDYYIbzDg/lKkjAg05jDLiC6dKkLPDIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996987;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=B2FkXWGrXs4t1AZ4YqQrFj2tdqC4ijuZXr9WGqPvBs8=;
	b=k9/H1vlQrDXtOJRAdmEnPrp65gO54QDRk+Xj54GJFrCnYn6CsUNoghFofiZgNAtungJ+
	 yII2C3zcRtBd0RvNWwpl3QDqVPEFY8mfADW8+sYPeFmC8+a9xwwOm0Lyc2mxhqh8C9DJk
	 IkOv4xWcKeM7obiFmjPmT/unixKK+Neu3I7MegwFFblArWbTzxxQT0Ck9gzNydsyiQDP+
	 84ORrS9uca/GR/5oPKzoj4c4Ym/tBdtuqHQyf+KYTkkgQfocGnQJ9k5yJ/veVrLdd8MLu
	 Hlfgh7kXw+A2Ri39j36Mcq49pc5wyEYOkLiwaBbayjYf8INQhIwrzO0jTCUePup+GLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.82
Received: from r3-82.sinamail.sina.com.cn (r3-82.sinamail.sina.com.cn [202.108.3.82])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD8606A31E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6ADEF66D00002520; Mon, 26 Oct 2026 14:42:57 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: E5524FDB7BA846509727577830D11350
X-SMAIL-UIID: E5524FDB7BA846509727577830D11350-20261026-144257
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 3/3] ASoC: es9356-sdca: Modify the Initialization Configuration
Date: Mon, 26 Oct 2026 14:42:51 +0800
Message-Id: <20261026064251.15017-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026064251.15017-1-zhangyi@everest-semi.com>
References: <20261026064251.15017-1-zhangyi@everest-semi.com>
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
 sound/soc/codecs/es9356.c | 81 +++++++++++++++++++++++++++++++--------
 sound/soc/codecs/es9356.h |  4 ++
 2 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index a22e92d1e..9c70ccd5b 100644
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
+	int ret = 0;
 
 	if (es9356->hw_init)
 		return 0;
@@ -840,7 +882,11 @@ static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 		/* update count of parent 'active' children */
 		pm_runtime_set_active(&slave->dev);
 
-		es9356_register_init(es9356);
+		ret = es9356_register_init(es9356);
+		if (ret < 0) {
+			regcache_cache_only(es9356->regmap, true);
+			goto err_out;
+		}
 	}
 	pm_runtime_get_noresume(&slave->dev);
 
@@ -867,10 +913,11 @@ static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	es9356->hw_init = true;
 
+err_out:
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
 
-	return 0;
+	return ret;
 }
 
 static int es9356_sdw_update_status(struct sdw_slave *slave,
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

