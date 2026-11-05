Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875402;
	b=E2PDNfieipfJFThZrgKk3iWEvQR3rpH2yRlGWLbWsdGKO2HcLUNPuXKZWWV47uCgPuhv
	 ODLT+YsbkvmGAhFWA3mlnnmGGwVjhySty0R0H/nnipPECpidOaABHRZCQNIAvE9TCaxSB
	 4/D9yxZ36E62CoddKxGCbCAVBoAzcB3Lm60vUUZ8vvPMXQ4JOcseYUMA6seoRM0Ooh/Yx
	 LkcW5azAOA5PXO+CHdiFWMd9X5JuZQq+DpNASZt+mmO+BwXGM9VRodDPlbDYwrhz1Yb1d
	 Z1flDzORb3ef2dk5ZGpdQaE/+6utZEtPBOr1sn3KnSnv8eBqycfJAHYKo161acDuIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
	b=FMgQOfWCMAaeVX7IpLqJ7joN37plWGgmpvyNIh8ergsBvbVsJ/VlwdD1fetWZvygtPKp
	 mhUYtGn1OIYHWCeuL8y/s6DomnVkyDMcoC2+xW4HRimywaiOuqF9tGoR4TQvhIVWbfuL1
	 Kw72DgyvR+BcjH02sm4b5QzQfDQaB9Atzpvi5j34uaKrtDduN4rtsgEGpzTJEV2T62pm2
	 lQs63j+hfy6i20gIeqFGSqjYz8yJcSrLx318sWzXmubVL+tak8383azsY5L+5uKXNNJ9y
	 5eQkTTFz1fGGWWHNgq+lYjT5VTaWiZkDaxcm1yIJ3YvXz7f9BDjPV0OZp8PeOKN5DJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLIeblBE;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525B606D81D
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A525B606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLIeblBE
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so2349852c88.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875401; x=1794480201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=TLIeblBEEIGVxHHVL2cF4zb8CnljWHioAn/7QCc6FRrwapk6if3yXcqSENHLjOItoj
         GV/YLKxHgC5cCNbtAx9Q6mSZ7mtoHHIy5I5aMrBToEc8nt5fsqfRMEt4X/x9cGwEi1dk
         H64gEhPTZlU8q1vVfIc8cVCpRi3kv77lozmf9C1M/jSVvf7p53flna1B4M+8xZNTDirC
         faMWVgxvPN7ZhB8GRiGsUj8zlbloGKhqvTFQ01bEyIrYJuQkM07jpKeiRkAbOIq/UlxX
         qtjoDk5q6gx9jE/Po60aypFGMLaNundaWCOkBz5pNhRDFbLt8MYgj2TwRTcdPFdHxBr1
         ZkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875401; x=1794480201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTbOMPeQQR/WAw575MjV+whoOIimG2HfOgrdg3UiGjw=;
        b=H0rlwv2/83GqkIGPCVlFT6hMiiRxInO4AzsWdNfcZvCccsMw1R1Xm+TNYB1GAzDtFw
         pYrCChjUn0mDbrJ4LvSHio1tg1v8B3dM/aIAwET2y4Ir5Wu0nb9CM5Otd738SFWlFV0Z
         5TLy+Z/3lrG7ksS3yB6tKFW6UGAlmi91WzyuB8NSpE5lKG2G/fimQg0QrvxP8Gi8+c5u
         GfsqRef1j/AkL2rdcNlHe2aNcwviqHA1wdoBHGoxQWw0EI1GNru67dBigzT7FS4MPh4I
         /KC/ID2DV/ER0aHm+qyjhrfO8A4CCbRv3mcFXLYAmHJ7ekXnYfA8CZIW23SOOUAbH/9/
         l5qA==
X-Forwarded-Encrypted: i=1; AKwUvBxXpTHuLmfPHLCqlrVTV8hJG4XkvnV8O4O36L42vluNCF1e6OvJaZNLevp6Xnx/XOaAadbGs3ZDA2H64Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8a5ONH4ymZVjRgVEnHlHYbFVAXvfW9wlD1KbKn2ldtQZnVj3jr
	bgl8U4/gKXdXVijhz1E/2AZVq/ethAqIHTeIJFZ1fsP1Gs4fqa9wKNO6
X-Gm-Gg: AYBFou2Sb4Pi3F1q2perfcKWvpHnB7qvGzbRIuRYWH1/tKE/NsGQQfiWUEyizrI5yeq
	yOAZ7TP32+oyqJgEdnzsS3eUEcFiZA1w7Rl8SoNqHORaFeRgFyiXUWeRjDDpDkEDN7ufNCe8NMK
	B6SZs4h2muTTidwvYPRF61g8nUBh6005aVJG2B+gt8fs8yTyNB2Ne5COI1ycbOsTr6YbtGfTjS+
	XeTpQHju2MS8KEMys3a+QV50Kxv9fLwQbYoxxhrF7oFv5XHxbDNM9Bqsecy6fv3i6gw1fxl1/RQ
	+nQXw0b0URc9SxRUwYGVR0vIq04zx1PQCIplvPvRP/r1nf07bdzuSt4SebdKtcVYTMcLVAYaSgl
	eLBRM80VZcQ7/1xoJXYj/t1oO9BGItUIdL9WHjKgg8zKAP0x4/Ao3lWyz6RgEoyF8dPSsFePO68
	YODIteMCmAlCeuAunPQm77x6EpvnhhOKZ0VpXk4OLZcEXV+Bn9ddC+zMQ472P+wMF1Vpt1hmvQi
	bTM9e8gI7S7U07UqkxICFLrhlodU9JU5dBfCobrIvcvWpV+ddbSRhXoGu9JUOtNUpm5JqxnuevA
	ZUoE9BJDNJ2E9dQ9yvMOjMWvrHVNBaYfp/3zX9+WxoivJ4+MO12hkDB0IiJO58n7hnSIQRWDp54
	+a7YPVRh1iuySrN7hJzYOX5cMMv4t1nB3q+3bP1TfCEY/
X-Received: by 2002:a05:7023:d04:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1ac4fc00dffmr29448840c88.0.1793875400690;
        Thu, 05 Nov 2026 02:43:20 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:20 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 02/10] ASoC: fsl_sai: Use optional clock getter for MCLKs
Date: Thu,  5 Nov 2026 17:42:29 +0700
Message-ID: <20261105104237.38542-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The current code uses devm_clk_get() and sets the clock pointer
to NULL when it returns an error. However, this silently ignores
errors such as -EPROBE_DEFER, allowing the driver to continue
probing without the requested clock.

Use devm_clk_get_optional() to handle missing optional clocks
automatically, and dev_err_probe() to properly propagate other
errors, including -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 042885ba415e..44a34f48a0cf 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1589,12 +1589,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
-		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
-		if (IS_ERR(sai->mclk_clk[i])) {
-			dev_err(dev, "failed to get mclk%d clock: %ld\n",
-					i, PTR_ERR(sai->mclk_clk[i]));
-			sai->mclk_clk[i] = NULL;
-		}
+		sai->mclk_clk[i] = devm_clk_get_optional(dev, tmp);
+		if (IS_ERR(sai->mclk_clk[i]))
+			return dev_err_probe(dev, PTR_ERR(sai->mclk_clk[i]),
+					     "failed to get mclk%d clock\n", i);
 	}
 
 	if (sai->soc_data->mclk0_is_mclk1)
-- 
2.43.0

