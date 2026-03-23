Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E893BFE3B
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282608; cv=none; b=fn3NQyX7iVAUxja4wlr/t3kgGSbtj5lSFKT4Iop1Z0A/QAZ1PGuHUiSX1NlmDYf46RLHAu5Wwh1EuWdd+VOiFwA6iqrEsKAfbudrwwkg+T3lfP5dzzpio6r7x3l0orbD7ZR+ysk6NsLklrnVFgz4hoQNpJRVG9wO2AjM6RLwGU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282608; c=relaxed/simple;
	bh=iXK6wvRyFqYcb2f+HT0HHDjAo809KzTB5lgU9a6PXM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qii/dgB99UKnU48N21alHqVXYh7/v1C6lCq+Qf8dQMSZFRJ65YHuYP3DEFrKr/eI1BKnsSSEbZKBN08FTIEn1gK5ynq+ZStbziYeKSyQRVZ/77oFiv3FcadSgOURJk5KmIViWnJtjA0FW232Vf+3fa2uZ9e+j7B011g6iT7hAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+iniI/e; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+iniI/e"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so26190585e9.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282602; x=1774887402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp4YODN/4k6phpMRYg5cRzJL2UKo8bXWoJWQxfk4Kow=;
        b=g+iniI/eDfcqqVVXzyBwiQCEzvWJoKmPSQu+Y4AWEyUguzdmeGYjes9ZALdXzAMeSa
         O/qhQMWUeP+M/vQVQlSVwvJJN2/NLs8Gv+77TbQVtFFlJvEc/5HiTMVU5aA/cfXhyp58
         SMSDd05RBa9EK2IlpU57kUMMNMsQcXmwOntGfIcylkzITigeoSUmlMd1cDy4VdcDgKC9
         i0LbYA6BDqMz9sI0vMC3HmG5SzPItuCzl3xTk9DFemgkoGm2FtenWDXzJEevcYE1I6dt
         Gwi+6wp7xOfecuUd0eDi7FxyJiLrdPNsuCGQHgX6Hi9ide/fxXCnmEcyAGP9pPjx9hox
         gCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282602; x=1774887402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gp4YODN/4k6phpMRYg5cRzJL2UKo8bXWoJWQxfk4Kow=;
        b=DKJUpCrOGMtxcn62KTNXbTOMUmshusdJ6bAFRSJHHoVVcYW4286BdkbOoxhdPW9nlu
         rKNcwaMk7NPWe2E1HHKiDMJ4zuOW2/ng7XMPIf974Y/jeoxX7xq8EV2zkjyypQTgWtzz
         4O/jFNxtVws1S29pDo8Z7/jjTBAJgcfaAayhBQxoz4X5HMB+5RZR+8RE64lKIs9yq4Cm
         /rKfJs8VNL7/EcdQc7OuOuPKrgCRFC7V7b2B/+C479Mj7iuFepeMrh4XKTQMwXWPiCx6
         mNI60rBstq+/73XFYtIZCeTuMKDWqO1Kmqni2HglBDK1V4bxw8AB0bJtyMdBYTpII2zW
         UkgA==
X-Forwarded-Encrypted: i=1; AJvYcCWOBOD5ELfwp1fUmL8DuhUp51hDG9vqQzYjUqem/1H52Wat1zCT8bkuPjDgRddcOpLhcepImJ6zt4xa1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHra2S/o2sn7MFxqZo5KxDdUVfh1bF/+CHg4Y27bfRqurdIxW
	Y+BI5k+EKCVZlWHg4nuBgxuKqNEHA9E3U5S/xpO7ehlT/GUEdTDLiTk=
X-Gm-Gg: ATEYQzxUgylvLe748U8iP4CdUY/1RNoxbHsAftu8s49PtrPi4l6nlntJ+y5zmdKftrF
	gH8aQT4lB0AanZXDUwd1EJ3JToOZvru0ziqPOshyzphvI76ai/3Lqayms+5cF5AxBgb2ZNIjcs8
	+WwJWOByerwcmijQsPk2WjQLoGJneEprWJE2mEDyYzg1xb/W28wyCmZNvDOSPOHuVYGOQroWQkU
	sWHQ9p0jZFQR3n4AvLd55lySdRGg8G7slHQSoZKKIYXOYdwFibkEQpc3PeHXnAf6y4oU+jdUibh
	iI/LIvWq/QV+8Y815z76k9e59XI4X3gjJ7jiWOmp3VfxrUURLLfscHY6+SW+KqlesFgdoOq4m0D
	sK6ZQShAU0ArlpLHV/D5pIo9RAQjsP7nZMKXho0q3TSExx7gnD2+Gu6yo7I3rbFBf2qO9ZauCwz
	UkZ+JZh97joETKUpl39xd8XhZIkXisnmyS1OrBHaEfzg==
X-Received: by 2002:a05:600c:3546:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-486fee29536mr181005205e9.25.1774282601876;
        Mon, 23 Mar 2026 09:16:41 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:37 -0700 (PDT)
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
Subject: [PATCH 3/3] ASoC: jz4770: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:51 +0100
Message-ID: <20260323161551.47181-4-jihed.chaibi.dev@gmail.com>
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
 sound/soc/codecs/jz4770.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 6b86d47028d7..be1ecdcc737b 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -179,7 +179,6 @@ struct jz_codec {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *base;
-	struct clk *clk;
 };
 
 static int jz4770_codec_set_bias_level(struct snd_soc_component *codec,
@@ -634,25 +633,13 @@ static void jz4770_codec_codec_init_regs(struct snd_soc_component *codec)
 
 static int jz4770_codec_codec_probe(struct snd_soc_component *codec)
 {
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_prepare_enable(jz_codec->clk);
-
 	jz4770_codec_codec_init_regs(codec);
 
 	return 0;
 }
 
-static void jz4770_codec_codec_remove(struct snd_soc_component *codec)
-{
-	struct jz_codec *jz_codec = snd_soc_component_get_drvdata(codec);
-
-	clk_disable_unprepare(jz_codec->clk);
-}
-
 static const struct snd_soc_component_driver jz4770_codec_soc_codec_dev = {
 	.probe			= jz4770_codec_codec_probe,
-	.remove			= jz4770_codec_codec_remove,
 	.set_bias_level		= jz4770_codec_set_bias_level,
 	.controls		= jz4770_codec_snd_controls,
 	.num_controls		= ARRAY_SIZE(jz4770_codec_snd_controls),
@@ -865,6 +852,7 @@ static int jz4770_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_codec *codec;
+	struct clk *clk;
 	int ret;
 
 	codec = devm_kzalloc(dev, sizeof(*codec), GFP_KERNEL);
@@ -882,9 +870,9 @@ static int jz4770_codec_probe(struct platform_device *pdev)
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

