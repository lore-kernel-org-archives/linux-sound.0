Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030D31ED7C
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993730; cv=none; b=JccQZx7p/5r/3NCNml11DvXVI1K7iU8RHcSMaLLEK6O3mQ2NsE4PZYDnZkI/U1Y7Uj5CaVw6w3kMiqYdX1M3jB5JHlUoSTtlL79c01qi8fcZZSKbFGzbcezo2IZDkyPZ60JggjWQFEoFwWygAt3OvADAv4fn1jS4MLRsfQa2oI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993730; c=relaxed/simple;
	bh=FqZUrEDZcpuyBcWy3h2r4UG7JkoqFXQUnqFWVQUwCtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bt+vc07j78TWXCCP98iFwAqSxCYPtq4UxmhWYZNfFqmhKRMTme6J6FZtjnb7k2fxMS7Hsijc9Y1FP9RmStaNFm143SZ2lyneB6XzIoExE/ijdV2CoZ3rjsCR6AdyNBiVhyvRZw20+M/Lha/RpQxIjpSxPBZd1H6VE40MWoph1Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwhQiUzl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwhQiUzl"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2255738b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993727; x=1786598527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS5N1HI6JBb7BYnde9ZKmg1y6INP5OTp62HALVYGh98=;
        b=fwhQiUzlkovGVjzXbJVMNYhWCoCTZITJIFaASQADaHGp6VAsnANFRbKQkZjzzi/EbR
         FNP3ZmUrE9nPVqgkSffuBgnqCO3tFtNixL5jpyHGX3AM76Lo9WOfwde5MZWLj+PsXo1V
         UbgrzCcFb/fyl6A+mniu9rXpHPHtlSjUSg+WNMeRvc6fpAv1ipbLsaciX9TcuzjdKdrq
         Yrfg973tt0DxFUmSzh8/icyY1xoQuqA31GSP5oxaNr7gsxrVqv93yq9csfToQB790twg
         3/5idRw7lvViLpNKKuOzTRXpALxjULxS2uGrLVpW0nud+6expEt20Fjf39pJFREtdBFF
         oxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993727; x=1786598527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS5N1HI6JBb7BYnde9ZKmg1y6INP5OTp62HALVYGh98=;
        b=THz3GHVImAVAYVUOkfuJL/ATw0p3fiLU+DlT8LE5DKyoq12XIV+qhw8tsQkuqWX8Sp
         VBpzGfHhz2PmLnlAQIQc8iuHb+UeqDphUhw5jBzuikmWmhdKtq7wVaoTTIxox9chQdw2
         RChrIgcH56R2aeOrsTP+xgjgC2unvzJ56ggwvcj/vHJ5CFIqtLzZIsSgkGm4EuqVtG2r
         yKdWCoCl5Wer0t/SFdnNlVl6JDrov4+NX3uJ3iyLycF5DOm6oDxzvLpmNifHHRaAksCg
         IoO11BBADHcFNzLBF6CwbAQ4EGQ2xxPuR8QZJrFS5bGkju8u/Rx2mLlAXltc17+xr4U4
         /51A==
X-Forwarded-Encrypted: i=1; AHgh+Rqz8F3ZeSPUxCajEh/1SQFlYFeGud6uqeuF2owlst45v+xPvmEWWbzd0o7Illk0TGRRiMRP6wVSWGd8XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwAldYvpsEIOcatNyj9uTeaiPy12c5b3RmIJHnOHalQLZS2m1
	PEzY3olZaMjWo+61iXkZXeuhWVyRYF5QEe7/pD5cLX0tgQBfyx9FTUDESk8MYg==
X-Gm-Gg: AR+sD11wOVNBxIt9PoWwcLvnjDaBdlc3d2yAylFCmLvDRMtf7uDbRklGU18Npwv9MI3
	9xHrtDYL6+SIymtY/PZe9/Gzp2aBah2HRPc+PCRp5FjLisJubtiWNqgRJUT5vwP52FxOKQmnq/+
	moA6XGl9vYWjnFVF3/wu9fLT9h2opU841hLd5YJsPRQqpOAcc+nYhzLkmTCw4pY8mOEoY1N8mAU
	h0Urbz5aQBcsA3Dl+NrHeTJCmUSkXRkIynGcNjikUBVNvsCUhbU6HB8PufilsBUGbAlgwaEO6N3
	WJisf+V392M0kDpKbVydKLQGAQrXUj7DhuQpCDUMihw8iYIetUETsEirmitSFRmUWnDpetO8xrb
	nSzbkuAADikj1VId3EqGBJEpt0MAqXYaTUOtR9JYvhH4tTQAIBJ2JLIFN0KwiV33XHPfIBpIH8s
	wKjKo8uF5KcinAz5IVKpN9Be6M6bHA+ngGrvasgZOJ+ulJSR22KfDjqZoGy7Ddmx3bPQ4BL3M0z
	1VNU/Oo1dGBSyLepD45ZO2fVc2S7im6BH2XH2IrYkAukrqUM2o2kvDKmUbUjIiuzGNauh6hYlpZ
	l5ke
X-Received: by 2002:a05:6a00:4b05:b0:848:56ff:6ced with SMTP id d2e1a72fcca58-84f2e0148a8mr13181609b3a.8.1785993727007;
        Wed, 05 Aug 2026 22:22:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/14] ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error handling
Date: Thu,  6 Aug 2026 12:21:24 +0700
Message-ID: <20260806052136.21034-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index d88d5ccfcdb2..541163ed56fc 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -205,10 +205,9 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_get_dai_name(&args, &rk_dailink.codecs[0].dai_name);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Unable to get codec_dai_name\n");
 
 	rk_dailink.cpus->of_node = of_parse_phandle(np, "rockchip,i2s-controller",
 						  0);
-- 
2.43.0

