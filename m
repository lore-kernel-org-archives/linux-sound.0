Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1B35580B
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708902; cv=none; b=XPySdjSuiIxEDchM67T7qSJ/lWrdQJjAReaXDxVsSTB7BfBLDHl9/5NCexpC55OrlqK8bX0pXb7hBtVNgRw17YlBjFXp/oXTNfL3s+z2RQ0UD7CUrSB1+rGgsqHDjr/qiIK8wQDZze7UyqYhseVqyOagtswG3fvqZeBi7nI5T14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708902; c=relaxed/simple;
	bh=mvH4aUW0hQgPE4rtZO0gHEDhzUrIft2ed7Tzs5tiU8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YT0w+mXWoi1/4CH8KCfajYNlAcynC80GfA5/iVgDBhKnrJuoFp882zQfGTcg22HzV22zAkj8P7mTvZ3vMut3bN/s8NZ1KXrdg0XT8jQ+ubGyaMOVNlpYfZG3Y5qINC3X2joTdDdGmAoM4+bZwc8kTuATXQNXIDGc58npFVWodm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmnHsco6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmnHsco6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c21417781so669894a91.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769708901; x=1770313701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLDc+/q/p+lOelF7d87wuuNd/OcoSWtyWIkfUq9NMiw=;
        b=mmnHsco6iLkGpoe1VPqFAE6nHjIGPGxPgsfFG0YD7OFoCqdTzwSbgkwkh/Pqlp6qPy
         hxmmVQYChWLmCABSaYPGGG+vDl3//sQFs6/hF0aFnAHOMRaYZ5BxMCgILqE6B5dAL+27
         YiP97+OSm+uHNhyODQl+DUu8pbtd9STQPq4EmqMMto3NMpgS2TufOrm8t4NYf6oqXXrL
         akzpHIa9GtKQgCKJQRbhLZiHfJckVzOXGBxHm9GGsqBvKPDgTxxBqQB+5nJU+HXPWQgP
         rkkruAJ5wjrYebLQFsvAIqzIr2Xak50hWfB7u2D8TMo148Ui/dZRZ1asBMmkubY4DHon
         LMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708901; x=1770313701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLDc+/q/p+lOelF7d87wuuNd/OcoSWtyWIkfUq9NMiw=;
        b=PIXfQ/+cQHYRRzY6clwl26fKdSXA4W35m0ZpnNq7x1O50h9kjc2YkqaLzrPXPoVxSe
         Tm/r8gr7Tc7WSZAz65f+VzL8ksXXpcFQdQ/ipcmyR2w45aLL65bFLtVNsqPXPMT+6mnE
         l8KqeLB5jEnFdGNfUUJdbYyiPw8GjPRMCN0y9gL2LNRWoDwSXBUj3JJKu1UqN/MYPA9d
         A+5hrhXUMNYu+Xkr9sA5MOtuF/XKGCw/H8kP8M+Risdg+Y3M0zLCY4fmZ9dVxVBrlJrn
         kSAz2UNNB+uTAnaVE6UrVC8Hag7UAyzYG/LYS7ltt3QMLoW0BLx5BWdqtgSnel9J2kxJ
         2juw==
X-Forwarded-Encrypted: i=1; AJvYcCXF8cZDVhj37zVoVT2ZmtqfXyihoN7yYKCuSEHceHideDadx/mavEssA6hG+8FwqFc1Ojztoykvd4BxyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZxm6rGmy6JUza3z+Q3UPaaaPOr87SHZWED6q6a+w0OWUlKdw
	kzCU2TL4O0o9UtCp6h+HnA0oAaYZmpxFgxgY/ud0zO1lP7z1pwIAgQKH
X-Gm-Gg: AZuq6aK4+XCMEhb5POR7HaPiB7O/Tik5UTQxzqveERawy51p8DdviX6IRGzUepOSp5q
	UfpjhBObW675aKCFJ8QbtI1fIHguRbHrQVXu4Y1mEc5PM7OkHYca5zTdZvb8G73w6V5b+aoG0if
	dnDP3mlNk0SWy3+N0rvkzVzQ/67JRoSf0vv3gcnGfK/TvTDywDa8cqqyhZhWO8lD8wVwI89sY22
	mjwQST6kWURCppt2fksZ/hfw1EIT+5ukmlq4RYr0NzWOOjvLVciRe6UimivzqVTpSKOx2cRti1P
	XO1ElvjFYzMZ4mpK+iiXc1yJUemksQBJX4UdavxcoQcTGiu7Qu22XefA0nZqNxoiR4gtRe4Bw+3
	IsjtWgmRJur6PvB3HxKmHYLj6ibuTjcoeo009t9j/yu5yDhVi5CUsHFopg1XX/rkuAY15XisPLr
	oA0UtOKXYcGValsd/UzCvXrpUg06xUInawxJoXSULhuQpj1EbhbAzS/+yLwYwOfR8Z11q79gqe9
	jz/
X-Received: by 2002:a17:90b:4c4b:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-3543b3d6577mr224583a91.24.1769708900814;
        Thu, 29 Jan 2026 09:48:20 -0800 (PST)
Received: from localhost.localdomain (118-170-231-131.dynamic-ip.hinet.net. [118.170.231.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm53978655ad.63.2026.01.29.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:48:20 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH 3/3] ASoC: es8328: Check errors in set_dai_fmt() and resume()
Date: Fri, 30 Jan 2026 01:47:33 +0800
Message-Id: <20260129174733.6660-4-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129174733.6660-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check and propagate errors from register updates in es8328_set_dai_fmt().

Also use the cached private regmap in resume() and add proper unwind for
clock/regulator enable and regcache sync failures.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 49 +++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 98fc798ff565..9838fe42cb6f 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -592,21 +592,26 @@ static int es8328_set_dai_fmt(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
+	int ret;
 	u8 dac_mode = 0;
 	u8 adc_mode = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBP_CFP:
 		/* Master serial port mode, with BCLK generated automatically */
-		snd_soc_component_update_bits(component, ES8328_MASTERMODE,
-				    ES8328_MASTERMODE_MSC,
-				    ES8328_MASTERMODE_MSC);
+		ret = snd_soc_component_update_bits(component, ES8328_MASTERMODE,
+						    ES8328_MASTERMODE_MSC,
+						    ES8328_MASTERMODE_MSC);
+		if (ret < 0)
+			return ret;
 		es8328->provider = true;
 		break;
 	case SND_SOC_DAIFMT_CBC_CFC:
 		/* Slave serial port mode */
-		snd_soc_component_update_bits(component, ES8328_MASTERMODE,
-				    ES8328_MASTERMODE_MSC, 0);
+		ret = snd_soc_component_update_bits(component, ES8328_MASTERMODE,
+						    ES8328_MASTERMODE_MSC, 0);
+		if (ret < 0)
+			return ret;
 		es8328->provider = false;
 		break;
 	default:
@@ -635,10 +640,17 @@ static int es8328_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	if ((fmt & SND_SOC_DAIFMT_INV_MASK) != SND_SOC_DAIFMT_NB_NF)
 		return -EINVAL;
 
-	snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
-			ES8328_DACCONTROL1_DACFORMAT_MASK, dac_mode);
-	snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
-			ES8328_ADCCONTROL4_ADCFORMAT_MASK, adc_mode);
+	ret = snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
+					    ES8328_DACCONTROL1_DACFORMAT_MASK,
+					    dac_mode);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
+					    ES8328_ADCCONTROL4_ADCFORMAT_MASK,
+					    adc_mode);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -759,12 +771,9 @@ static int es8328_suspend(struct snd_soc_component *component)
 
 static int es8328_resume(struct snd_soc_component *component)
 {
-	struct regmap *regmap = dev_get_regmap(component->dev, NULL);
-	struct es8328_priv *es8328;
+	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	es8328 = snd_soc_component_get_drvdata(component);
-
 	ret = clk_prepare_enable(es8328->clk);
 	if (ret) {
 		dev_err(component->dev, "unable to enable clock\n");
@@ -775,17 +784,23 @@ static int es8328_resume(struct snd_soc_component *component)
 					es8328->supplies);
 	if (ret) {
 		dev_err(component->dev, "unable to enable regulators\n");
-		return ret;
+		goto err_clk;
 	}
 
-	regcache_mark_dirty(regmap);
-	ret = regcache_sync(regmap);
+	regcache_mark_dirty(es8328->regmap);
+	ret = regcache_sync(es8328->regmap);
 	if (ret) {
 		dev_err(component->dev, "unable to sync regcache\n");
-		return ret;
+		goto err_regulators;
 	}
 
 	return 0;
+
+err_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(es8328->supplies), es8328->supplies);
+err_clk:
+	clk_disable_unprepare(es8328->clk);
+	return ret;
 }
 
 static int es8328_component_probe(struct snd_soc_component *component)
-- 
2.34.1

