Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431BF3D6CC4
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318731; cv=none; b=iJoZe96aNKKy1xQlSlVwD9FEWsKmfWqTY9sXz/EU7Um4PqoZQ9FDcJHJLPDrUqxeRmL/1ntHCCfpxIQ3xyyjDPyqfKyoVzc5kOsySu895YFMot6O55W/NpK5wcrwXtonQkncvALGzBKzKNHA+XiU6qyQWqUw/ZFKVEkhyanvgSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318731; c=relaxed/simple;
	bh=O69LbaRDhE5Mnt4Cws91GlWiqFPHvQzlvOmeDgLwXLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvVdFe0a/NKud5Nv9hX+pzRV81emCj3pNU9+fw+DUHunSSi9GOcd142vjmmyjlMtuoSPijiZjlUWwQuWIAmp4WybCnTmTerMeW5QehMpPQS0ornA71bXtWMeZ8UKmTzsgq33tok8vdbpMY3A8txoUtQwW2tRix/7ooO/0Rcj9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hTQujixW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hTQujixW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15290745e9.0
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318726; x=1792923526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=;
        b=hTQujixW4ZmIu/gFRAXM5eyJXPTumgBaJtkAlJWR7Thy/RNZNx144g1gPOowToUxRa
         y0PxA2/o6+pEB5dGlK/Owp59GOL7D6q/B8P04t899opXuxn1Qt84PfYVMGIpdGUkl6bB
         mV6b8FdOjFA99WL2x0vfvuDjA0nfU19Xg00JU2MHEfuowdY/X/VQG7MRgfIzGc34Y7tU
         M0+rASuT5vtRdiJF06/X4C6eT8wXbPvsbki2f9OAwPmnxkPOFAdtVqfJg31r+1GHBNFj
         7OD9N+doh+80YD3Y/nPoi+AwzAt1cJqsjVfnT5ecTeV4d0q5Lwh/E/yTg337hzqhIrBl
         97+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318726; x=1792923526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aktfp4bJWSm7ZQ5qjOy7UXQuKieKX3fZ9KSbn1DddPw=;
        b=USRh+qJIopNfdKamwzXProjj4YRiFixJSHb/uJpPGpX78YK4kJpayKZH5lyyvs6g8m
         NXRE/BHfVLUXOkO8mWClzWXmp7d+33QRfQ3aWpy9jFuvkLlT0EecKDqj190P9n9aJH8t
         eeICMaydIFhhPTMjILqj4WmlHM696w/liITk3nnmQfnLraiAZ5cDsBW3iF91wh2X5587
         F5dfQ2gPBtp8GJnqE0GEXa7jxnnjTgMSPwRyI0e7x31lvHmhv7+YrAMa2FWpAOKP5Ae4
         C0r0Ga3721DP8o+S6jFrNoiCCfoSJeSNkn/11mSUI/M7G7019JJA+3wEhWHBcUCgKWil
         xZmg==
X-Gm-Message-State: AFq9FYJdYxOeFDbDv2gUR2YoO3jUt4fT24RbY1S4NgX+nbeAgX3vKmVA
	pWH5W+vL6amomdw3Idfn9xHaZ6Xi2M3vDl/5MHehG58jtBcbJgyPhl3vd5cOLe+LSyk=
X-Gm-Gg: AYBFou0KmqlvXY/JB1yta5WRfaoXplG89Pl1dbIUhmym9puGDhvDIFTEi/MpzO59J+9
	O6CsJL6BjjwKmfev8YmKx/9yb0qTBnb0j/5pNN4RyaV1oRVF5tgjafi4gWXGEYCo3AEseCxYpYQ
	69nur6Y7ixFJ/0rtTxjC4qbXI4kreM6D9BX6m4HaW4S8hX8gpgGR9m6ZykPgYd8p7LPnP3qucA2
	WqTOyKY+WkebmBHsDGD1FPNSlF0bexrkiNJLRiPMUSrMqBitMEKDR6j2RT+mQo70HpZ2YdcuwuU
	1Z91OmxUtLR+nLjLBzTE6F2QaGF/U65NPQLrgwrPj7mg2GQoJS0RUhkmjUz9Ql02iGoHqyUCFAW
	tsNJKufakP/UvHNf0I7sGmPkUFl1afgdcgPkHYataz46OfWIA7YnrtmwMpljO2j/bqMKQv0PjFE
	57HrXH6Q5BhUco86U1zukCwEXkaLLuyxN0WiJSWjxfsAQ38hI0P1CxXkEpxqSLEu1SiZ+M
X-Received: by 2002:a05:600c:870b:b0:4a1:d0e4:2bc7 with SMTP id 5b1f17b1804b1-4a1d7608614mr89775225e9.15.1792318726464;
        Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:03 +0200
Subject: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=O69LbaRDhE5Mnt4Cws91GlWiqFPHvQzlvOmeDgLwXLk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vwOZ/e5mJF+j32W++2crf9qcl+mHuSxvaakfEAzK
 0M+UOZ/RykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy7gYjwzTz01GubckscY/7
 Ai32BAq2lh4U8riczaAteG9pxwPLs4wMDdPk5zhPzzjZ2+WTwF+9c93ha2UOs1Su2Gw5uUahlSm
 cFQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..7e9b34e02275 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3

