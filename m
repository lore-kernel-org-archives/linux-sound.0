Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305B2931C8
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109362; cv=none; b=flpFfgZsARSoex1DiGUcziZMyCnNxGk6oEYqi7OEh3UWGvmmr8EIgy/XmPWxnMEsmKXtFTTMH0PKLz8+vQeaKKAaNP5od7flQJo/QAlEhqDLNZhasoOhzFVCSsdRm61dwyGXAb3sdmRzBJW8xemGZ94SUKXG0J2kirL2dLkUfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109362; c=relaxed/simple;
	bh=JYpMe5xJN7tUQUFpfvpPUyELSznoJMPf/vIdMkvzM/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Stlrr2g2/EaGpnvtZTbj6mve5fggVLxSg6rwwZ0B6T7soz47/wLw79yLz7L39idqwB0mS0r5XAsi0z36d5x1NGjrrBCEeWjgy3+V5V46L53qDOBc6BYFWhcEkmhe1t2+neYjeFs5cQNaLklKKK4RBbGl1v0b/u2GewUVKx2p1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqpdylBz; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqpdylBz"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1208360a12.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109361; x=1784714161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=;
        b=OqpdylBz0Gd7MSDiHzzVrVG9GmwJMNmpQB2fIfx69tpnx6THfL9RjqkP9MSAfS7E8W
         it2xlt2LJIomeQv1InE9P/KbisKipliCO68XolYg5LV6FSiBqs3UWUckW/65mHYA9AvT
         cFzPO21dRMyQYKZlGZlslRTP5KgXLe2MburAZKjcLeao8L+B0QCA1/LARZXIIZz/miai
         6BY40TVR4q+OUzN5OozxlWY0CnphY56Lx2MyaFXAdrR5QY75mUHHeVGR6NGpxISdWmya
         WxXDG3h41E3Us6l4QDDFkw3KtJ4j/wu/Sg6gLjWFET6K+0acjbw6Z22ur8PMIKJr0t9/
         TiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109361; x=1784714161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZY26nfH61F/ozoLH7Gi9fNecnPmd2NgxbQtVT0E040=;
        b=AP9e/f8GY1oO5emBcMi77UdduPPwlEk8KJWKZAALtFsu9+huHZb5kCi6m2UNorLLmz
         pGMFrgAqDXMMleAuySIeKVb29Nfkv35RQq+dOMjrJMon0rOjiIYWfOZaWDp+1M5cPrpq
         tPgPP4wcJBYjyxWlVNxd2udLZ+WOCvh3Bm+DYuEhVzAXbeDdK4rp93RjIOgkcOpmhIw7
         Ph/W0KDn4ECNQHzrIKTaNgXCrkekjkOlCApLKcOkYW/ziP9hjwQyQdm680rRfq+Uuw3v
         EFNgMpA60zqZ+Qk9z+wPRvoEh1KNSsha6L6W7OOkP3TLSrH7OZkgIdIyBPL4AIpstCqn
         Sm8Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro1TsHLiZW7QQc5QC1q92yMvpiXeo96J4/CXLwOk8O7D7Un7l5jZ/iRrSy98LFvOddHGfgeSomr9ZjWeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOmFsgrGKKaKW0nhJWnFxc5zXWgnEfeDbzLPezGMTShbejqmz
	2fuCzkc04VExli105O2NFxAq9RuoaU318D5HX1nx7jdfgd/UOhyvQ+fW
X-Gm-Gg: AfdE7cl2yFtMx8nYAv2tHYsmAqvgzuiCyMpjLQVYJ3ZegG8dbCZs8zshJ8KvqngK62y
	7BKPDJ07KvBkrBpv6gWP8IE7N1zRzbrVmUbw8vWokurcGGTCydDvL90YNsbeMDX7o44iGSDCtPT
	d4feCzvoAxXjUOoEU7oCi0nnaj9FYC+c87Yqtfgl+aqvq3fnsxmLj5YySifjGVbrmfj+amqljQU
	2aM5ZBj5NZ0mpYTvyKlnHFJof6dRzT5/mb6GGg4OvkqtiDXgYAJbQqRQ+HwBQXvwU+wsrEtJTst
	ejubIxMJ25Eefh456cbqBKVU9XPptPjn6zjEgpfTQ/X6Z4H+coM8gLlITGsPsQeQyZlgTxy7Vh/
	IxWmqTaYyh76ZnD2VVTXiaX+wWGzXvqXE41E6NAtmWbUofUMHVyTek9Anvh3OTnd6ixArZwYQ0K
	0HvZ9+1dIluWmLdCMtHw+YEtkMVSIeq3BCN7lkZrrZBNxGer0=
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr18474760637.51.1784109360730;
        Wed, 15 Jul 2026 02:56:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
Date: Wed, 15 Jul 2026 16:55:21 +0700
Message-ID: <20260715095525.40668-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 05308df3ae5b..71f7a1fedd88 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2380,31 +2380,22 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, quirks->codec,
 				     &sun4i_codec_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our codec\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &sun4i_codec_component,
 					      &dummy_cpu_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our DAI\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
+	if (ret)
 		return ret;
-	}
 
 	card = quirks->create_card(&pdev->dev);
-	if (IS_ERR(card)) {
-		ret = PTR_ERR(card);
-		dev_err(&pdev->dev, "Failed to create our card\n");
-		return ret;
-	}
+	if (IS_ERR(card))
+		return PTR_ERR(card);
 
 	snd_soc_card_set_drvdata(card, scodec);
 
-- 
2.43.0

