Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8718A3E5A16
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700883; cv=none; b=Vt3nA+3EVGFG74bA1J890pwCCQ1oVUFfVX4KvozWaW1BHSb6p6Cts+NqWf5370UkTxkd/YLHsG9boTHA9Opoiaj3QzylfVSzhKQJnyDdn05zpRV96mZMAa9A15yeFcgUjDxOynkJC0kUW5tu1JJ2r6vCo7gSVCONv2fwe+d+Naw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700883; c=relaxed/simple;
	bh=fa0ET2L9z+e7LdfwkYkE9QV9wQKHv7YbNWrLN3yxRBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQRM9hZnn2IdT4iI4u9qMJMa5kc7jrJRtNDkW0fvur05173Yp4Ocym/9GHGWMhmMANw0+oVCPpsS1qsBJ8xZ13j5Qsq+uayF0Nh2a9qca1iFhUoAwSsJLYzs5G2GDQand1FBk6LcSG8xnhoVy8sPakzQCaPCOMGU7uHhm9HUjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=15/8lL7i; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="15/8lL7i"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe608cb92so5638085f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779700880; x=1780305680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCQ5Osb6tlRXLmYhUdFsQijMzkEIKxVf9Zq+dOggEf8=;
        b=15/8lL7i+3QfDUeTOkjzdoFAoZtZnnyTcjjsZYaXm1/M2KH3yOPpExxOQhWgf/X8w+
         bYh/HwfJR3ftuuig5JsEeox1dZGKQH0bbBJhADuhdMqGLoj1O97wSrRjLYBfHV0AYW+Y
         sR2cHRgj4Yi5HtM0y9Xta+CMGcskWU4Qs/1rj3ECKN5BD7jVVneT8rWZWk1iJBLXJUjN
         PC5rTHBbjw1E8AoLzdTzDMH2YAXHI4L6PS6f0gkYnAu1HCl9aA2QCfq8lJ57h+h1QIhU
         RYP3c3OFpecPaSplKemXbZDaprnP2njeqhbycdnUE1dBWjfX3cROIW9sKi+34NQl9UdG
         SBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700880; x=1780305680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCQ5Osb6tlRXLmYhUdFsQijMzkEIKxVf9Zq+dOggEf8=;
        b=lt9y9NY1F41UbRXJq0bjGcx9nJQ/cDpUxaTcLN8Ku1c5F/I7GV8ff+a1AmZKooQq9e
         cPnzMv97Rx3qdaCk6xptD7arCeYwFtUWpgBBTU2cd/P8pneR7iGdkCDaFM6013NMOP5C
         z/L2rT7F06x3ka3FPnYFyxd+aEylYfvcxa6Vsj+QOBbU2f4R3rQYq1RMzKdEyr7HLVQT
         vC+M+E332+xeBIpqqlmPrq+NqnTKDFP0CLHR8mubK0TPWfin5dowQnzIzvW7H4xBx8GE
         Gg7l+9nESSoELdM1OI3f9bnp93FIbnqFVaaMuL73rsH1Pcxy0iTzdJ8JbozvIlEbggft
         m4yw==
X-Gm-Message-State: AOJu0YxHSuGJ/KfXpPEbb/lIV0z2n2GK6ZmmqvIduyh+YagIbyWKBsGM
	E3H5mGmzKEtih2yA4hCKwIqgAXLQ4dYOvYu4IOTyEKPLcaqgOVQLKf9RTLo3xFmXKq76hIIX2s5
	7Zax9SvQ=
X-Gm-Gg: Acq92OFipRt0/fCF7y4StScNdPHnXbmhtfbkHzu1/gx1j+uHjVoGx620q5tMX2PVpQS
	Pne6B5ocbgESLVWW6kJLjIsAsYmtCJ/G//OTxjtKbJ1TvFV2sh9A9KPvoOpOhLN5I3aKSw6gNXr
	ne98TD1xhRwPnn4CQJX4D7C1Hyf78ndK1g+9+VheknofGKy8Q5LehCT49PfgQWbkeQ3R63Yi30O
	RCUgV+d4eHD6ecU6/EWnNYYeQHnUB3MpRyp/CHxYsZorE2rGVQebS86EBaeYgx7I49ujCxJWxOA
	ogJYwSuKlqm/5y+4CC3D+t+lF5beCAJli8ehC+yIg9wFaRilMIGQdtXLDxty/NZ/0YRzu89rsly
	rYc8qT5vroiW4Cig7YywIV9h/760s8P2gqiUTQmhqpMLZa7K+Siktma58U/8IRqZ5VhEEir6I1p
	ekQXZpwX3if8ELyYDtcKSyfM/MBvdtUf6M+2J/2GcC
X-Received: by 2002:a05:6000:2003:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-45eb38e4b46mr23030896f8f.38.1779700879936;
        Mon, 25 May 2026 02:21:19 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm25399989f8f.18.2026.05.25.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:21:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 25 May 2026 13:20:46 +0400
Subject: [PATCH v2 2/2] ASoC: codecs: nau8822: add support for supply
 regulators
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-nau8822-reg-v2-2-7d37ae393e46@flipper.net>
References: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
In-Reply-To: <20260525-nau8822-reg-v2-0-7d37ae393e46@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5040; i=alchark@flipper.net;
 h=from:subject:message-id; bh=fa0ET2L9z+e7LdfwkYkE9QV9wQKHv7YbNWrLN3yxRBs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSJiNTZ8ccGfFKa3HLvO5/V6vbjC143ZTulqB37bdRhn
 D3fv2hBx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFM9yYyRYcG6rbPXrq/xe3choOZS+xflTceS7612fsub/O+ec9o6j8eMDDcuB21
 O1nh5LtDGu1FuZ8y8Tl/32S7nD2yfuuaQoZqvOxsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

NAU8822 has four power supply pins: VDDA, VDDB, VDDC, and VDDSPK, which
need to be online and stable before communication with the device is
attempted.

Request and enable these regulators at init time, if provided. Also wait
for 100 us after powering up the supply regulators before attempting to
access the device registers, as recommended by the datasheet.

This helps avoid -ENXIO errors when the codec is probed before the
regulators are ready.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 sound/soc/codecs/nau8822.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/nau8822.h |  3 +++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 19fee5f4bf5f..830164e991a7 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -19,6 +19,7 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -108,6 +109,10 @@ static const struct reg_default nau8822_reg_defaults[] = {
 	{ NAU8822_REG_OUTPUT_TIEOFF, 0x0000 },
 };
 
+static const char * const nau8822_supply_names[NAU8822_NUM_SUPPLIES] = {
+	"vdda", "vddb", "vddc", "vddspk",
+};
+
 static bool nau8822_readable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -1056,6 +1061,7 @@ static int nau8822_suspend(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
+	regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
 
 	regcache_mark_dirty(nau8822->regmap);
 
@@ -1066,6 +1072,15 @@ static int nau8822_resume(struct snd_soc_component *component)
 {
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret = regulator_bulk_enable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
+
+	if (ret) {
+		dev_err(component->dev,
+			"Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	fsleep(100);
 
 	regcache_sync(nau8822->regmap);
 
@@ -1153,7 +1168,7 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct nau8822 *nau8822 = dev_get_platdata(dev);
-	int ret;
+	int ret, i;
 
 	if (!nau8822) {
 		nau8822 = devm_kzalloc(dev, sizeof(*nau8822), GFP_KERNEL);
@@ -1167,6 +1182,13 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(&i2c->dev, PTR_ERR(nau8822->mclk),
 			"Error getting mclk\n");
 
+	for (i = 0; i < NAU8822_NUM_SUPPLIES; i++)
+		nau8822->supplies[i].supply = nau8822_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, NAU8822_NUM_SUPPLIES, nau8822->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
 	nau8822->regmap = devm_regmap_init_i2c(i2c, &nau8822_regmap_config);
 	if (IS_ERR(nau8822->regmap)) {
 		ret = PTR_ERR(nau8822->regmap);
@@ -1175,21 +1197,38 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 	}
 	nau8822->dev = dev;
 
+	ret = regulator_bulk_enable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
+
+	fsleep(100);
+
 	/* Reset the codec */
 	ret = regmap_write(nau8822->regmap, NAU8822_REG_RESET, 0x00);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to issue reset: %d\n", ret);
-		return ret;
+		goto err_reg;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &soc_component_dev_nau8822,
 						&nau8822_dai, 1);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret);
-		return ret;
+		goto err_reg;
 	}
 
 	return 0;
+
+err_reg:
+	regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
+	return ret;
+}
+
+static void nau8822_i2c_remove(struct i2c_client *i2c)
+{
+	struct nau8822 *nau8822 = i2c_get_clientdata(i2c);
+
+	regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
 }
 
 static const struct i2c_device_id nau8822_i2c_id[] = {
@@ -1212,6 +1251,7 @@ static struct i2c_driver nau8822_i2c_driver = {
 		.of_match_table = of_match_ptr(nau8822_of_match),
 	},
 	.probe = nau8822_i2c_probe,
+	.remove = nau8822_i2c_remove,
 	.id_table = nau8822_i2c_id,
 };
 module_i2c_driver(nau8822_i2c_driver);
diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
index 13fe0a091e9e..24799c7b5931 100644
--- a/sound/soc/codecs/nau8822.h
+++ b/sound/soc/codecs/nau8822.h
@@ -211,6 +211,8 @@ struct nau8822_pll {
 	int freq_out;
 };
 
+#define NAU8822_NUM_SUPPLIES	4
+
 /* Codec Private Data */
 struct nau8822 {
 	struct device *dev;
@@ -219,6 +221,7 @@ struct nau8822 {
 	struct nau8822_pll pll;
 	int sysclk;
 	int div_id;
+	struct regulator_bulk_data supplies[NAU8822_NUM_SUPPLIES];
 };
 
 #endif	/* __NAU8822_H__ */

-- 
2.52.0

