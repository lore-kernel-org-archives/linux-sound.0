Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F23BF67B
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282603; cv=none; b=b1sxOP30snv56OJlnRb9ccz5cnDXdkIpevngtRzyhOe2fNu1LldKzDMqHUVvAIWXIjPZhm3BkD1y8rIn3TSK+MQMPOOnTmLRl8z76ieuUSDnRDrwvYeRf/l3YzGkyXJqE6n3MDYK2SNX/t0gvRZdkOxOWXapqs/3SW5fualvyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282603; c=relaxed/simple;
	bh=SFCFFwHLQsmCdrpuqlJCrhc5Ygf2e1G8qXrq4SXv7os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwXHJFnfLtQQdF0TlaNTwZEva47IIItsgfDTfGT3gZ7MPFqP2r8orLTSXe2v1JKuI9a/MkFwS3US6B9IrbTEIOrGVorbjTNZP6Kn76cDUvTVyZ77UzBF/6e+t4Gn7f2+sgFAschsdlNyz58ShDx02PrreN3mUMINyaPi7oeyp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6u4mQ7H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6u4mQ7H"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486b9675d36so35879765e9.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282597; x=1774887397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO+SkoI9eVt74xNLLkIIUZ5Y4CPfHlVSwCp47CpWJR8=;
        b=N6u4mQ7Hgb1gF1cZcBRTyezt7fM5d6Rhg7pd62rSDv/WsDjxbRj9+gw8cc69RJKzlj
         2380kYSzDtecDcXwIvBFN1L5z3YoRuuTY343iT6FXD1x8wIHQPaFwp+L+2Hwt+hYUWYN
         05NaxWuk0ICApC5gBNHRaWNCsylhz+pleLfzybAVuJG984qFY+m4543mglQ5WNgQkTrZ
         OKgAVivPM/4y+H9WSuH5zlEXyK60QiWq7nEnnFpKY7P9S6uzEXJS5twZOu5mAqi+8u3m
         osob5aSGmi28qfAFneB+tzc1uC5frFwi2FakbLjn2YaEHVWA4LyXMilVDf9cahb9RMDz
         Sepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282597; x=1774887397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UO+SkoI9eVt74xNLLkIIUZ5Y4CPfHlVSwCp47CpWJR8=;
        b=M4AcNiBL3JFeQnh42IUBhVLGqRNDBfvJDG2Ob/9GhUQV6bZ4MkjqaQZLI4cY5mCjnv
         QTEjphzw+3G84nn48RrGKdQaVc+zXJfzCMy0flOR6oxGeZ5TV2fvBdNNoVeSy/NYU7Fx
         fsY73/jIwh4F2zBqRpiTTQSALEdOdkJrmsp/I4sA4IwskIZCFD7QduDUJKL/LJNpxOQl
         JOY3XRRIJY+ZGqSX+8HYOa3+rRJsDfoDUCkOyuonKPRBaPF9iM7TDAFBhbzxYGddiomB
         QRDPikVtwlzTTdCFTc0QUQGF1lTXuM5rMwYnAd5DTQTdKhSSxbsKiNAFq6lnqU63jvVz
         2GJA==
X-Forwarded-Encrypted: i=1; AJvYcCV0qeDbxzEZpnYkOfVwnQyM1ZJM1f1bILtLO0V1RsLpbCa87OHmCLyRJawegDVNS/98TBdsBvoLS43PFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtRqesnOI+iaw7l0Y7HFYX7M7FT7uQWgHW03KJz0ngz1BBxXi
	P065xK4NCJtRsM/PIpJOINJkv5RsDNjUsyMt7D+IUihHfPV8NO02jTs=
X-Gm-Gg: ATEYQzycG5DmfS6FgUciLEslI25qzNBYTjk8ztSienBV+lkWDif8J/cUxsaOSuKzAXA
	Sej+SjKuYNFCjz5Zln+F1poO/NavBB8xaYLhVz+vPk/gZ3FgNTwAwcqVI7jbevjGp4ks/DI0y5l
	pWIx1y9F1r3S5iTJJE4fsgTLjMpGJ/BhU5BHOWu1eWXzQd/Z6sEkJBLzH49uu4irfORaHKN5fAM
	38eIZwDHGwFwDjR7HKQV9gnr/c1jUDSp+tszZTN0A2L63ZoLkKcZlhGmY5RYBKP2+7ya47bYSz+
	UYzNa8Gg3MQWgQ0GRv1x6GG9IOAx7QVwlnw9o0etTMHWrOK7IqT9+9oKauzep5kSvjUnEu1dYEl
	XoEUFdupgR+JAHafpztfNQL4Wprk7RrBUD2h32z3DWlT2EjYv6JZL+jqIYWbSi9o/trLKfF72eM
	Zo3ri5B/uMbUbYNUPBpZx4x4WhZQ8IPeT/Vpv17ihJpA==
X-Received: by 2002:a05:600c:4705:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-486fee04a53mr175550015e9.21.1774282596969;
        Mon, 23 Mar 2026 09:16:36 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:34 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: paul@crapouillou.net,
	linux-mips@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 2/3] ASoC: jz4760: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:50 +0100
Message-ID: <20260323161551.47181-3-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
References: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock is obtained with devm_clk_get() in the platform probe, then
manually enabled in the component probe and disabled in the component
remove without checking the return value of clk_prepare_enable().

Use devm_clk_get_enabled() instead, which combines the get, prepare and
enable operations into one call whose lifetime is tied to the device.
This removes the need for explicit enable/disable in the component
probe/remove callbacks, and ensures that clock enable failures are
propagated as errors rather than silently ignored.

Remove the now-unused struct clk pointer from struct jz_codec and drop
the empty component remove callback.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/codecs/jz4760.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index 344c251be397..6846ace06415 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -163,7 +163,6 @@ struct jz_codec {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *base;
-	struct clk *clk;
 };
 
 static int jz4760_codec_set_bias_level(struct snd_soc_component *codec,
@@ -602,25 +601,13 @@ static void jz4760_codec_codec_init_regs(struct snd_soc_component *codec)
 
 static int jz4760_codec_codec_probe(struct snd_soc_component *codec)
 {
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_prepare_enable(jz_codec->clk);
-
 	jz4760_codec_codec_init_regs(codec);
 
 	return 0;
 }
 
-static void jz4760_codec_codec_remove(struct snd_soc_component *codec)
-{
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_disable_unprepare(jz_codec->clk);
-}
-
 static const struct snd_soc_component_driver jz4760_codec_soc_codec_dev = {
 	.probe			= jz4760_codec_codec_probe,
-	.remove			= jz4760_codec_codec_remove,
 	.set_bias_level		= jz4760_codec_set_bias_level,
 	.controls		= jz4760_codec_snd_controls,
 	.num_controls		= ARRAY_SIZE(jz4760_codec_snd_controls),
@@ -818,6 +805,7 @@ static int jz4760_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_codec *codec;
+	struct clk *clk;
 	int ret;
 
 	codec = devm_kzalloc(dev, sizeof(*codec), GFP_KERNEL);
@@ -835,9 +823,9 @@ static int jz4760_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(codec->regmap))
 		return PTR_ERR(codec->regmap);
 
-	codec->clk = devm_clk_get(dev, "aic");
-	if (IS_ERR(codec->clk))
-		return PTR_ERR(codec->clk);
+	clk = devm_clk_get_enabled(dev, "aic");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	platform_set_drvdata(pdev, codec);
 
-- 
2.47.3

