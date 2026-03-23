Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F83BF664
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282599; cv=none; b=gmVi2Mx3F0c/44GNtFfK5cHv4e7KtSFUhZ3URPRtPeryOzaqj7wsZTNLVi7s8srx/FblOmPly1Suj0HXDQcz2AUMIAzbMmSt2bmXR0ENzDjB82Roi/2gZE9vX2Mi9V8QJAjP2aNByQ8/ZcYbQq+vM2zNOHeWjIwVtNgM7kS1iPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282599; c=relaxed/simple;
	bh=g8+Hj0Vb1Y/88a17yOow0ZjQc6l0noTQuUGZxhIscS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8+k4MixeAfGvRfsVr05tqA+jzj+SIm+BxeudHuk9dYeoWU7sIqoSYEaVk78DMTM0M4eyCdLD+dC4Q1ki3/LXfRdXCiQcq+fXlK/v8BBLRmDDloHVA5vf5im14UfjndGGrBAT2yitddybhYfxPSIKN7CAJsPL0nW4XP2rJLm8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfL7ZP4L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfL7ZP4L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so34589585e9.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282594; x=1774887394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e14EFbUgBOZGsLZ9xhCm0kYrey9UscJoVzYYnSs0h4=;
        b=DfL7ZP4Llr92HekVW2kyP2b4s9Qyu1vsgQfyaskD9FbZ4dPGD3IdrcpP8MRCRMo8a7
         +SmkE5IcF9Kdn06p/ka3nvaVpTn/Gn3E7vMR007RubPNkbHB9BHEiCLL1mBBmqdOHQe4
         d9K8k+2jQykdskGS3n7+IIh6en0YoP1Ga932SCTkuwiMBwxvssLNxB9wK5qmpn7wfTf7
         gkdv1nlOvMxZDXi69+SPOv6nEQdJE5LVYvvpgtNh7752gDNBR6jerpk7y/mIdgjUzrE0
         pIKwOYxI1wimzzfOPyTY6ybPyOySpxcZVKcH0r+NI+Sn/f4sy4bJtgwFU+WTB4e50x1Z
         vjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282594; x=1774887394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8e14EFbUgBOZGsLZ9xhCm0kYrey9UscJoVzYYnSs0h4=;
        b=shTxTqa4S6zwTs6mIDmvIl6UIxn2ovQLNjBI1dp8eVZKmXVzA1X1gsEb3d9Xal9rrI
         6fF2ivN8rNxsehBtB/RKpxt2mO6Re4ZvW7y1NZmzXPIUIAxka+n5hg8gFwXYeUqmWg9m
         TRhzefzXeHi1BSiVce3ZjVCIy2o/TdXE6fTyRliz7S5GiLH8AofH3McvJruP4CNF+DQ2
         uerq9WTaRoLbySx1EQ7dluUyYHyfbL3bLblk6oWfpXpG8idc1yMEnnGL3i+wj7ETn1cO
         1Sep8yBJis/u72UPOYGIpTl7PdkPTilY5PUB15e6Z2hPQ+c0OBeQDGE7n/kaVoTLHCTL
         PCVg==
X-Forwarded-Encrypted: i=1; AJvYcCW27TpqyOiX5fd6An2/xYCEFBf53qbFjDzd9EJQ9m3oi7lABFY7yaa/yhmvq1T6KVDIZoKuRvhmOzrYtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5w78qaWJk0LCW7dRHpn+V6a+SSXXBHZ5TtGkh7pZY2ZXptPxv
	WuBMR4FDm3SBuwj2Wz1kUMuHmdfWMom+7X5kGpzHiu+gBtY9gmB+FnNRNwBW
X-Gm-Gg: ATEYQzwQeBnuvAbqjppRq5xMM6L+uUrKGxG+R0Wgx+Epdg9j/8K2nX5daZwe0lbNNFK
	A+e0Fjz9slY1EZ3VnaePB36jLTRxj54Jq9Q8yGJ3/DMvmGZth4mdIGBdROLGSzLd8xt4z9+GqYQ
	Azn2ZFar+LBBBFfeSPIEOpJ6gLjQQ8/av5yKTFfMA5l9K8jB3yuAS2rGHW3na8llD4LjjA7lSxI
	stDGjUt71vL8mJDyHqLbd2kHxg8ndwxMi+Sj0WfZ4rJG3/84uJ1gUYRR05agGItK6R0T5qtlyDV
	atFHUs3HQfNXZlLK5W7yt/PKs0Y76zyhQjAWnMiPPfN9GIzjYNTE5MsAJK+wJNHNWZPg0V9s27/
	S1CIkyx2fcCs0nHe1v0rOjYgd7AdgiY0aBiCK3EnRSw7LTddTTKPywR4X5hKDVFGMLYKi9YjU0H
	MXE7B18YVc1HaFU7BXsBnyrJLz0B54YzFG/FfB1rseVZJLY/oMuWdg
X-Received: by 2002:a05:600c:a59b:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-486ffa30b26mr96817745e9.28.1774282594063;
        Mon, 23 Mar 2026 09:16:34 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:29 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: jz4725b: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:49 +0100
Message-ID: <20260323161551.47181-2-jihed.chaibi.dev@gmail.com>
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

Remove the now-unused struct clk pointer from struct jz_icdc and drop
the empty component remove callback.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 39cebaa167be..8a7d26a08c03 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -160,7 +160,6 @@ enum {
 struct jz_icdc {
 	struct regmap *regmap;
 	void __iomem *base;
-	struct clk *clk;
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
@@ -405,8 +404,6 @@ static int jz4725b_codec_dev_probe(struct snd_soc_component *component)
 	struct jz_icdc *icdc = snd_soc_component_get_drvdata(component);
 	struct regmap *map = icdc->regmap;
 
-	clk_prepare_enable(icdc->clk);
-
 	/* Write CONFIGn (n=1 to 8) bits.
 	 * The value 0x0f is specified in the datasheet as a requirement.
 	 */
@@ -418,16 +415,8 @@ static int jz4725b_codec_dev_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static void jz4725b_codec_dev_remove(struct snd_soc_component *component)
-{
-	struct jz_icdc *icdc = snd_soc_component_get_drvdata(component);
-
-	clk_disable_unprepare(icdc->clk);
-}
-
 static const struct snd_soc_component_driver jz4725b_codec = {
 	.probe			= jz4725b_codec_dev_probe,
-	.remove			= jz4725b_codec_dev_remove,
 	.set_bias_level		= jz4725b_codec_set_bias_level,
 	.controls		= jz4725b_codec_controls,
 	.num_controls		= ARRAY_SIZE(jz4725b_codec_controls),
@@ -618,6 +607,7 @@ static int jz4725b_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_icdc *icdc;
+	struct clk *clk;
 	int ret;
 
 	icdc = devm_kzalloc(dev, sizeof(*icdc), GFP_KERNEL);
@@ -633,9 +623,9 @@ static int jz4725b_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(icdc->regmap))
 		return PTR_ERR(icdc->regmap);
 
-	icdc->clk = devm_clk_get(&pdev->dev, "aic");
-	if (IS_ERR(icdc->clk))
-		return PTR_ERR(icdc->clk);
+	clk = devm_clk_get_enabled(dev, "aic");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	platform_set_drvdata(pdev, icdc);
 
-- 
2.47.3

