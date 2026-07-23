Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3164A3F076F;
	Thu, 23 Jul 2026 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793612; cv=none; b=dNTjVVcNF4Rq2cwiqqdoeeoXM4nKnBoYnPqmj1/HGB12YBsf8lCZ3xaoIhzEyFOT8faNLhgTeAPc5uR4aYjh4NBHnMt/ef+phXf4UgRJN2lvYnu/izqNvyWQlbmMb2qqle5F/IpLEFNNGsodYjFT+gA4G8CiYdBu9vGkZQpsd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793612; c=relaxed/simple;
	bh=LuqhCsNyxUrYZUh5Hoa7wGXUuZGQ24rqFskxb0mg5JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTiWwOXpRkBAi5TZDPI44D+7tU3/X3e7bDzxxgGJG3cUHTVime/tOeX23FuGtAk8rgaJkNaK4zB4r5/MuOMYewUlRq7udh61gKjYrZnufWb1LByWDvh0mi2RZjZgeCuFjqLB0qXA4PacATgsfvTSZ66rtW1Hu0X2BXOLALvDTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=OoMEAjWO; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="OoMEAjWO"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 474a1d1d3;
	Thu, 23 Jul 2026 15:54:41 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 23 Jul 2026 15:54:30 +0800
Subject: [PATCH 2/2] ASoC: codecs: es8316: Add regulator support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-es8316-regulator-next-20260722-v1-2-721f757879a0@thundersoft.com>
References: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
In-Reply-To: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784793277; l=3659;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=LuqhCsNyxUrYZUh5Hoa7wGXUuZGQ24rqFskxb0mg5JA=;
 b=7py00nEVc0bFrryUkx2Q6AG+HiqbAx8ONG+eQxAPSN6tLvFAQRk+0Q8v3D8BW1OqKyxPDkxmE
 ++ghRBjw/msDH4wXMMo+Gk091NSVmZOD6h1oO1pRKGkleHfgRl7K47e
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8df8330409d5kunmc0741ac2514408
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUtKVkNPHxgeGB5JGE9PS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=OoMEAjWOWe309MFTgwcR3//Yol/bSRAONUvoQbArsyAbif8ff12yYLWiZnlV5vyK3u/OZ3eo9LO+6xyA4d4Vo4dfeAGgpb5zageIVa2OegCNdcmxSynwiefFM1/YQtKP+IrIjBXcLONXPkAnI5goWv/cpkLZFE+xoPj4RvDbYm0=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=47DM7+/yHuFdec2gHIvXTXebWAIZAtBrKbuRpP84YZ4=;
	h=date:mime-version:subject:message-id:from;

ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs.

Request the supplies during I2C probe. Enable them before enabling MCLK
and accessing the device registers, and disable them on probe failure
and component removal.

Leave the supplies enabled during system suspend because the existing
suspend and resume callbacks do not handle a complete power loss.
Powering the codec down would require separate reset and
reinitialization support.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/codecs/es8316.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 3abe77423f29..904056b2569a 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -30,10 +31,20 @@ static const unsigned int supported_mclk_lrck_ratios[] = {
 	256, 384, 400, 500, 512, 768, 1024
 };
 
+static const char * const es8316_supply_names[] = {
+	"avdd",
+	"cpvdd",
+	"dvdd",
+	"pvdd",
+};
+
+#define ES8316_NUM_SUPPLIES ARRAY_SIZE(es8316_supply_names)
+
 struct es8316_priv {
 	struct mutex lock;
 	struct clk *mclk;
 	struct regmap *regmap;
+	struct regulator_bulk_data supplies[ES8316_NUM_SUPPLIES];
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int irq;
@@ -767,10 +778,16 @@ static int es8316_probe(struct snd_soc_component *component)
 	if (!es8316->mclk)
 		dev_warn(component->dev, "assuming static mclk\n");
 
+	ret = regulator_bulk_enable(ES8316_NUM_SUPPLIES, es8316->supplies);
+	if (ret) {
+		dev_err(component->dev, "unable to enable supplies\n");
+		return ret;
+	}
+
 	ret = clk_prepare_enable(es8316->mclk);
 	if (ret) {
 		dev_err(component->dev, "unable to enable mclk\n");
-		return ret;
+		goto err_disable_supplies;
 	}
 
 	/* Reset codec and enable current state machine */
@@ -793,6 +810,11 @@ static int es8316_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, ES8316_CLKMGR_ADCOSR, 0x32);
 
 	return 0;
+
+err_disable_supplies:
+	regulator_bulk_disable(ES8316_NUM_SUPPLIES, es8316->supplies);
+
+	return ret;
 }
 
 static void es8316_remove(struct snd_soc_component *component)
@@ -800,6 +822,7 @@ static void es8316_remove(struct snd_soc_component *component)
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 
 	clk_disable_unprepare(es8316->mclk);
+	regulator_bulk_disable(ES8316_NUM_SUPPLIES, es8316->supplies);
 }
 
 static int es8316_resume(struct snd_soc_component *component)
@@ -862,7 +885,7 @@ static int es8316_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct device *dev = &i2c_client->dev;
 	struct es8316_priv *es8316;
-	int ret;
+	int i, ret;
 
 	es8316 = devm_kzalloc(&i2c_client->dev, sizeof(struct es8316_priv),
 			      GFP_KERNEL);
@@ -871,6 +894,14 @@ static int es8316_i2c_probe(struct i2c_client *i2c_client)
 
 	i2c_set_clientdata(i2c_client, es8316);
 
+	for (i = 0; i < ES8316_NUM_SUPPLIES; i++)
+		es8316->supplies[i].supply = es8316_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ES8316_NUM_SUPPLIES,
+				      es8316->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to get supplies\n");
+
 	es8316->regmap = devm_regmap_init_i2c(i2c_client, &es8316_regmap);
 	if (IS_ERR(es8316->regmap))
 		return PTR_ERR(es8316->regmap);

-- 
2.43.0

