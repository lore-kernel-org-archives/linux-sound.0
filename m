Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377972;
	b=xNoBf0MKc/VW1ntStkiwQnT/8KGysI2wNav80Yh3gbCzF37aYNrCJn03Iksj2WXO+syA
	 VtuZhT0HLG/Xrt1xcMlF7jij0+2u2TSsvvEvNnFtx+7G3zhxt0UgbES2CCSu+zsUisPi7
	 FqkkdBx8uFGrNsZL4zCAPHed6ct+3jVOp0wIRrqnvTnCofjeMecywv4IA5lf7sS5kYPnq
	 kETr1rbdePSnpeM50HxShi9MrbZ8vU87gh47/2NDgbjKxtwUiAGwLW1GM7cCQJtPvS/UU
	 bZlZK3Mzi/USg5na8Zo9JK1Mp0nsLVP7CMqH2hlm3/bc2WLcBgRoAlpU6bA6JvRt/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
	b=0Maqi6K964sFRNzZOiJVyd1zuuMioRjB1gE8vChWKKlrlZHzDsotVVjMDPpgARSHYddX
	 YfRVLedvQtxYdUb5vTHVyKm27Ybjh5FjsIK9Tx43tcmTIvjZuDMxbE0kNfgg7HwW5NsN0
	 YmZAt3juVvFjaDAkuLWitzYHcOVSqxcO12+X8CH/6Ya5elcb9v1ktSmiIvZgpRJFxWbw+
	 KQNw8/mGJEXFsx6SYGv5/Akdrs+wbIslDcx41cSvCrfakFfE2ASxx6f8hfUQfdxJyXXfn
	 v+lkhPnU6enjymnL9gurScjyyTIakbdPcRAqVfj2G3yXF5dVtRdCfe/IhBFnIIbE/AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pZFBV8uH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6C606A32C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 16:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C6C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pZFBV8uH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7679915e9.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377970; x=1793982770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=pZFBV8uHcj4SUpQbR2LXX+avyjyp+ArIZLZHwrBJM9Uy6bJdWPRyl4SkeV+opcoX9X
         ZiSIBhXLexpkgauaY+7UsP+BjbF9L7KLmHBnvdaRvHeuUWRZcybGd/B3Xhgs8aeby23t
         T9OM6NyaFCi11lQ219DIPKwGyexFwDi8CASvtyTnK5lB9wsURi+jqgyAXkEH+3VUvuML
         2L5Llv/dMA6ze44grNCY0NLXPGHYVRmNFwANWqbZRpTMNSWPFie+A0xxkC4dUqwxNWMq
         GMlQdjhKqL5R4CWr01ibe+YBp+Zv3BJtVCGU48CAoL+C7zwiB9QER1u7r9y1BZ3+dr6Y
         sstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377970; x=1793982770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+1tf605VEw+u+AR0YH1cCPgkt2etMqrPGwsHIMVVIo=;
        b=nlqD2ZConKfhlmtEVJaBYAd8M9safGPxSB1nTQljysTcnOzIaAef4h1OjBaDtUGeHC
         yXnzjyA1ovfVWRJ2oOqbUNQt+XxFFWGkrvL6hDf921sFhuVT7t/V+sMWxfEY/B4rME7q
         B5aC3yzOl04OeVvVj9Zv/EmJCOhvkFQcUk5qemIjhguToayVhCSQBw9gLj1xl7KJXUf1
         0wm2lyXwWTQymKRohYM/pCpul3yBDud58UBCLIcWzGOfCkX12gk1xRprdBTqg0ul74Rx
         aA3gC7QudfTrrmmarjoYMDF3nbFm8Mk4W9Xukl25I2umtCvQHaHoyx2p5AR289q/u7Fv
         oKkw==
X-Gm-Message-State: AFq9FYJ3u2KcwMTeN3fGPZ5e+cRmc1Oz17U80RPOQhenBcpH6atbujKK
	YzNsZFvzZSURzkcObsc2MznO8M7FHsawaYO0IHA49C6oxIpRVuPTbcGhVz+P9gvRMQw=
X-Gm-Gg: AYBFou3Va3Inh1jvcHkXeEDAgX3xP8/QSJkZ4t77+5pPfzb/cEh7KQGjVUE482vYlcz
	yiqcU2cp9KDfaSg8b1ZVWoeVJRh5mxj39od5N19y3YXspmZ7l2GhzpEr+dbxgXbFNRBhXzTiqb9
	Pqx+jtIJBe8cEVIvHBrRrLf9kkPAVaLE0cMfPEoPEkX0QsHOX/O6F0jRiNOJ+pbGo/Im0A0gw9X
	5596h5opw2TSXnYaI50oPZj8IxF6B5yu1IinRr0tCUhH+/kPRuy+2MlrouyfYpBw4pB2wQ59fVK
	E5dZ6xAs07W0n0dLFDEcZDk9JYYLWe49fW1OPJHx150koUZLi9DTMRlYreSR9pSGR7Lv8xuCJL1
	8DUWBWHCNdcj4SfcrK/XlmC0yqGkWamfTSCPu5uWM3MrcDD3UZstXStEVFEs2yve9zefqgsI82G
	/NWw2fN2nlfq5VURkIktNUnH9MgKpW/coy+NklHu7TJlYiwiIczjJxsiHB7weKkZN5z/KANsNXV
	PrM3PV+di18MNLYGc5FdgAIh+oYvA3ztM1urYCKRrNj4LXswIdFWADB+24/vEE28Z/LmOXrN5wS
	S62/EYRGSSFoJdfmmRgaJ4gwbgv5sUVPdKNSeYLgB8Vu9PAXnw==
X-Received: by 2002:a05:600c:8b55:b0:4a2:1655:87e2 with SMTP id 5b1f17b1804b1-4ac17b2b023mr70629455e9.19.1793377969852;
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm4062372f8f.45.2026.10.30.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:54 +0100
Subject: [PATCH 2/2] ASoC: meson: card: unregister the card before freeing
 its links
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-meson-card-register-fixup-v1-2-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MbVgYLo6a0sH0b1W+GvzTE98oQ0+5OC6agqIsxBjCpM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq0Lkf+sf85oVkmvYbuC66yvHz5Vc3HOvrCEzd/If
 LbFjofPO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRlb8Z/im2TJmvXdm04Wfk
 zt8qz6atM45WzcxKkM82sThy2XpD8EdGhhNTdi+SP1rUmtsY1C7j1bfppaDdlW5mD7kXm0uZKkN
 lGQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The card is registered with devm, so it is only unregistered after
meson_card_remove() has freed its links.

Register the card without devm and unregister it in remove(), before
freeing the links.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 3cdc73b3fe8b..24332f29047a 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -309,7 +309,7 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = devm_snd_soc_register_card(dev, &priv->card);
+	ret = snd_soc_register_card(&priv->card);
 	if (ret)
 		goto out_err;
 
@@ -326,6 +326,7 @@ void meson_card_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
+	snd_soc_unregister_card(card);
 	meson_card_clean_references(priv);
 }
 EXPORT_SYMBOL_GPL(meson_card_remove);

-- 
2.53.0

