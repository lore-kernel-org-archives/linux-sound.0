Received: from smtp134-80.sina.com.cn (smtp134-80.sina.com.cn [180.149.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D1432BF5D
	for <linux-sound@vger.kernel.org>; Mon,  5 Jan 2026 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604602; cv=none; b=Sr7Zk3ElU8zVTe83xaacZqdop3FkIk88unk47jU5MnwzHgVI+5qCHZsD7d6Y/Gmz5/fsRkfCk//07t0LMKc3u8Lra3jsn3xLXVPtB8KKKjjlRvRNvTF0gvLB86NpwT6lHt7kMiy+NCt2gctwME/ucHMTfAkRjIZkvWVwfeIndYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604602; c=relaxed/simple;
	bh=lb4caJGvNDqIFgugodWEzfz06oormnVzjftBzzyBPl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nxRZr5x/MS6gOZoh9LGCtMGjca3nMn4OK8vOxyaTr672JpzKx0epGtfQBpxBD9nK2+VQDOtHsvGxNy6hzJe6EeDYbemELOf2R1iRbjn496KNIopZu/zA/T51gl5H871lAjq7toIHiVyveJLqsFo8KGesG8WP5Jys1SQilWCrUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.29) with ESMTP
	id 695B814B000044A1; Mon, 5 Jan 2026 17:15:58 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A959991583DE43449288B3140B5DABCB
X-SMAIL-UIID: A959991583DE43449288B3140B5DABCB-20260105-171558
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/5] ASoC: codecs: ES8389: Add members related to power supply
Date: Mon,  5 Jan 2026 17:15:45 +0800
Message-Id: <20260105091548.4196-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260105091548.4196-1-zhangyi@everest-semi.com>
References: <20260105091548.4196-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Added the members `avdd-supply` and `dvdd-supply` to
enable the driver to get the power supply status.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 27 ++++++++++++++++++++++++++-
 sound/soc/codecs/es8389.h |  8 ++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index a84d79f9d3d1..9400c5ca4e3a 100755
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -31,13 +32,20 @@
 struct	es8389_private {
 	struct regmap *regmap;
 	struct clk *mclk;
+	struct regulator_bulk_data core_supply[2];
 	unsigned int sysclk;
 	int mastermode;
 
 	u8 mclk_src;
+	u8 vddd;
 	enum snd_soc_bias_level bias_level;
 };
 
+static const char * const es8389_core_supplies[] = {
+	"vddd",
+	"vdda",
+};
+
 static bool es8389_volatile_register(struct device *dev,
 			unsigned int reg)
 {
@@ -818,7 +826,7 @@ static int es8389_resume(struct snd_soc_component *component)
 
 static int es8389_probe(struct snd_soc_component *component)
 {
-	int ret;
+	int ret, i;
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 
 	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
@@ -827,6 +835,14 @@ static int es8389_probe(struct snd_soc_component *component)
 		es8389->mclk_src = ES8389_MCLK_SOURCE;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
+		es8389->core_supply[i].supply = es8389_core_supplies[i];
+	ret = devm_regulator_bulk_get(component->dev, ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
+	if (ret) {
+		dev_err(component->dev, "Failed to request core supplies %d\n", ret);
+		return ret;
+	}
+
 	es8389->mclk = devm_clk_get(component->dev, "mclk");
 	if (IS_ERR(es8389->mclk))
 		return dev_err_probe(component->dev, PTR_ERR(es8389->mclk),
@@ -841,6 +857,13 @@ static int es8389_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
+	ret = regulator_bulk_enable(ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
+	if (ret) {
+		dev_err(component->dev, "Failed to enable core supplies: %d\n", ret);
+		clk_disable_unprepare(es8389->mclk);
+		return ret;
+	}
+
 	es8389_init(component);
 	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
 
@@ -907,6 +930,8 @@ static void es8389_i2c_shutdown(struct i2c_client *i2c)
 	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x08);
 	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0xC1);
 	regmap_write(es8389->regmap, ES8389_PULL_DOWN, 0x00);
+
+	regulator_bulk_disable(ARRAY_SIZE(es8389_core_supplies), es8389->core_supply);
 }
 
 static int es8389_i2c_probe(struct i2c_client *i2c_client)
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index 123d1e4b2d53..d21e72f876a6 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -137,4 +137,12 @@
 #define ES8389_STATE_ON               (13 << 0)
 #define ES8389_STATE_STANDBY          (7 << 0)
 
+enum ES8389_supplies {
+	ES8389_SUPPLY_VD = 0,
+	ES8389_SUPPLY_VA,
+};
+
+#define ES8389_3V3  1
+#define ES8389_1V8  0
+
 #endif
-- 
2.17.1

