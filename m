Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10542316A
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890308; cv=none; b=pumHn3LuWTgJ3328r9JlPlKvhI82XzNe9FYgJHwUPxRof5wxWp1NS3g4Co7mVRZxx0gC+00+8G/TsXsQfWtsrcqQoLXFMAnMX7+tC6fcvu++ajvSIpG+RrQnoQ5FosDUB0gd4TEiEzdj98xPFrNtegXsv5AFs0TwCA9/8uqVr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890308; c=relaxed/simple;
	bh=AiWKUJ6pcaS+s2EMRR0lpjZ6dv0VklPnVPvbjxXu/dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOmhzPcUaaN8acaKo7UiHneCOyPwExrH6luqfYjCG1k83ZO0tbawopBwafw/UA1U3MrzbIOCqlCG0JWhCaXc6pjojt5IzMJD+PTpSPcJS6SY79S/i5vd2LpUvliJbHPGU8hrh/B4PB7Dh3DVmeSUy/nPsDk+Dz8q2OUjUgm73YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqzJfGpG; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqzJfGpG"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1334825de43so10313348c88.0
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890306; x=1780495106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=;
        b=BqzJfGpGBT2ZD8QCUeCJxpZoohRCpO3AtLvwHujSgB8IFg8wJmO1oln8C0LQBG1w5R
         wulZhe8lIFSISr+c70OQMZP2vkOEZOMWJieebZ1s2RcghL205pp1EX+EIN9gXrgBqe+y
         YQkJwokEyGkFZjSZRuFYiNTdts9xdKMwfo4whn2D8GZr/keSMND293VlEZmeIbMnQfVs
         Csueft557jAgqaJbDAbyrxsw55pD9LNUIiIZ09IBJoOEiK0lb1WJOb1xFHshxNNaLEyT
         iV1VAOaJx6CajGXHIfumi4L9G3bIinv65csgwOi6Yy3xsDxPLTAANZWRcNCGLngj5fof
         knug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890306; x=1780495106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qqn/GhtdZ2zHm2dhsjmzQoC4+5EN3BPsb9xc1JJYgSU=;
        b=q7MgcCYaoTAyaT+DeElmrb/DgZuT2yy022vLs3+kgTUq3xWnYimB18AyJnmelzz0yX
         4QCTIDSQi441qXZfM3c5cgwNXwa1McHfxzetC3SijapUnaqyJEhNlITqxbCfPdQqKDPh
         ERo5uKeuywQmgf4ADeSYmc1y0/ZNCNqm6bEEZsXocmwjykz5YE4oQ9LfNVkzIQ7sTB1m
         RCeSBgV7ixh+8tvskTN7ySebbIW8IzKEHgpmb5ERrtAviLJYdhf9Wblu4HpUd1xjdy+U
         WWvwc41zjGfUlA5cAvt/VMU54IWK3Mc4oK+tuQp8aBqC4pAfxyXWM88oe7V0lRftTLam
         6c7A==
X-Gm-Message-State: AOJu0YzOPRFx/zIzPqbRQkjedkO5klE/oiouvdcvE9I23M1g6U7kvMae
	aO0vQOMa0sdghneebfguq+xFb4QH1JrWf17oaOLD1CXJV9bBFwyBgIzs
X-Gm-Gg: Acq92OHK9Zta28HPXEODIoBb05zE61ivhN4JVzzOyjgUrDy0VveWOssZFnXLjrtDNPF
	zyDFu7p0uuShlPs8/bojpKlOe/ZYl8hZ6AYt06x5zAyHr+PfNDjFpIOyQuEiBbDc2AJ0QwJjTuX
	MPwhzqfH2J3r8lDfI9Ahw0EtF89+/vooiSDdf3UTKUkrVepK34WKM4ErOLmu1DTw60GGXskKFB5
	Q9kueUG6WFe0qE8f9Ie9Jim4Y32mVesVQjqI7w2J2d7pGukZIt4gV6YioqiDJs6MtEj1pA5kld1
	ykr6gTP6TBUgh056bwZwLfitspnbj5dKgclqG0NvWIokKoYQ+iLOYD/0isGRdONIgBFubmvRjXw
	g73w9pKyrIsXbUIK+Av3n4SaJlugKS1n8tcaE+YomhztQQWkR5hfGvPYgg3BhS4lLHiqx+97Tmb
	lb+2pTTYBccs2oKIaEHIU96BmYEa0qWJ2hAHkllovxssxIfzwIfPdXdIXOyg/sMfhqgqsl/jqhr
	wc+WTd9cluP
X-Received: by 2002:a05:7022:62a6:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1365fc6932bmr8295204c88.41.1779890306165;
        Wed, 27 May 2026 06:58:26 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:25 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:55:47 -0300
Subject: [PATCH 2/2] ASoC: mediatek: mt8192: Check runtime resume during
 probe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-2-1bb834d05b72@gmail.com>
References: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
In-Reply-To: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=AiWKUJ6pcaS+s2EMRR0lpjZ6dv0VklPnVPvbjxXu/dY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4pklll4m/lM4s7ZEHO7aHXznfQp56/39sv0p7Ap3
 3zr9uJQRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzkyDZGhqXrhb+oauy39J/t
 8NiuduspzslHDBLFfp62j3380CxR4xbDXyHxP0ruxx7puPtlON8wPb8vSjhoa8qtDba7ZzC/XBL
 rwQAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8192 AFE probe enables runtime PM temporarily while reinitializing
the regmap cache from hardware, but it uses pm_runtime_get_sync()
without checking the return value. If runtime resume fails, probe keeps
going without the device necessarily being accessible, and
pm_runtime_get_sync() may leave the PM usage count incremented.

The regmap_reinit_cache() failure path also returns before dropping the
temporary PM reference and before clearing pm_runtime_bypass_reg_ctl.

Use pm_runtime_resume_and_get() so resume failures do not leak a usage
count, and clear the temporary bypass flag after dropping the probe PM
reference on all regmap_reinit_cache() outcomes.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 9f5057eeeff9..db0ae44a86af 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2227,15 +2227,19 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		afe_priv->pm_runtime_bypass_reg_ctl = false;
+		return dev_err_probe(dev, ret, "failed to resume device\n");
+	}
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
-	if (ret)
-		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
-
 	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
+
 	regcache_cache_only(afe->regmap, true);
 	regcache_mark_dirty(afe->regmap);
 

-- 
2.54.0

