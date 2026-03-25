Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3B330666
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473033; cv=none; b=Fc7TASsV/vxLjFwTNb5LvnlFmGkTvLDpUr/QcZq+OzeIS8ElMfy0rW2x2TEuM7c8yztrk8xeWRqdjBW4CqZC9qmJhDhWlv7wlmhfWrEozfe0AZ3Qnyy9w8WJbXhMuw6NoTKKEMDG+9BEoIZGELFK3kSXwXcynBGecRdtHI2K+bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473033; c=relaxed/simple;
	bh=tUzIUb7k3J6cOpfCCMDZdP6M9eodSIZ13LiGR9eH2hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxUzK2PhoS02TzBwXYwv+2LDb7z1ECG9TT3mvIZ4OnhsKqdgsqrkfEON96AcCbb2opEIJOi4Goj6UTtzTyOrB2y2tIWVLTYSfmSWF5mT0x8YU6pdOt9OcnCT6OsWBZ2RQAi74w+i9g1v3ZpUPuoDl8b235G3Qf4NodG90fjToOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVgbQ528; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVgbQ528"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb439299so2987355e9.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774473030; x=1775077830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ5QxoSZaUzmehajJJUJGfXXBnnvkvRAu9eZCPtocyQ=;
        b=pVgbQ528hdXCN8bKjJOsph2rfkOhWkl+EAz9XGWKKscPBfbQaSRuiIhIIR07Ejgt/B
         mwLZ5zQ0b/Nu6AR4nXoY8bvG2d9wZ6lrjiB72tShm1d/2zSLz4EX2gobHyod9xHvb+w2
         guiHp0T++5L/J3Umotmb52nhz4F0jpTUblxRlFG7L8em7U+ggfdgiPrzHfY5/O640Ez/
         7El9hMvKs8RZWrO0/3SggnFPcpJg7I3C4iMZgEGXmKoTXR91NTVH4zBztf6N7kh1FuX/
         vRdp6ZnFrdjJv9jPgRFf2bwXWiXISd9xQnbag7GgIGBA8M7jcxrKZwIlRxqT9twf9Aot
         x7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774473030; x=1775077830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZ5QxoSZaUzmehajJJUJGfXXBnnvkvRAu9eZCPtocyQ=;
        b=ew4aF9P44allB17tGs1E8zOHBf4v0GiaN09qeVHszGjee40r4Q32uvybvTcr7mimTl
         F4qruM7JzmWNPh6h7/ro/P5dzeLL6o//Dtk9lz2GlGu+Wf6ogUiPG3690efdendmQvqf
         ycnxjDPdq0pewx0iMOLGAk6jLUdKv0zw9wDjqbF3xC9uh41TDlJpeFy6OU1d9RXEIQaO
         ZooW8zFiddoqCMO6Nm515ykLkmJeYmsbuitX9BS+zbFV7ESxJvsC+0QnDNF/n5Bnu05j
         BaWT0NUoJnBrrJguBB0SrJ/4A3d+dKLXjbK0767a9W0TBBwtgyWGjTTVLfUq50bSAhtI
         o+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK2JEiLff81gf9GqmiH76x24/5AOUi7iqujSfT+EauHESD13mudsMQMyw7bp9hKL+iOUEG4imjTqiwwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRV6sxPiZve+QB5qAvU4ZvvGngfWWVt0Co0IT7jPhnHLLVdT2
	63P/0GUOEWhQsGUNftDkM1uZX8oW+3Zt+PRoR/6y6q8PmJYA1TCSDkg=
X-Gm-Gg: ATEYQzzygGSN5SDsmH+kmh7plUCmdrlXV8whGA6mUbTmzI6aCqWPOQJgZ0+eoAAZFer
	AeKMIO89/WVgrZY1U5dkjuclrxl94dnnYOxguRN8rPL0WY6iROTQtwploueytYzn2oh95Z1LexV
	srhtJ6AbiqT8+4U8Abtt6Au8ZtITF4xrTvP8HlxNOUBqDj1ijwZeXznZ7MjY13fyZTCS1D21BVP
	QUqAUuseLIz0KZe0+aFfyKqZRWBiJcy1gixlky1Hwt78M1C893o+m40K8dSR3Lkaz2drFNLoPt7
	ajzzC1cReTxhqrBdKRWaFOyIw8007jfYlUak845248CE34XvwtAZyVJRCnIBr1C+IyuAfTuzWmY
	kVjbjy7CQ/uX3+6eVQKXWu34liLID3Z9pc2OVxEtHGRXb/hq4rE+sL/v0cLZu7ZSi/gUQqcfZYa
	Z7Ljrff8wnfBV5YFB+xCzdyqJcK6ReGI2eKiq1d3KpLA==
X-Received: by 2002:a05:600c:154a:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-48715fd6119mr78561645e9.8.1774473030145;
        Wed, 25 Mar 2026 14:10:30 -0700 (PDT)
Received: from localhost.localdomain ([78.241.70.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb336c3sm11673765e9.2.2026.03.25.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:10:29 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v2 2/2] ASoC: adau1372: Fix clock leak on PLL lock failure
Date: Wed, 25 Mar 2026 22:07:04 +0100
Message-ID: <20260325210704.76847-3-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
References: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adau1372_enable_pll() was a void function that logged a dev_err() on
PLL lock timeout but did not propagate the error. As a result,
adau1372_set_power() would continue with adau1372->enabled set to true
despite the PLL being unlocked, and the mclk left enabled with no
corresponding disable on the error path.

Convert adau1372_enable_pll() to return int, using -ETIMEDOUT on lock
timeout and propagating regmap errors directly. In adau1372_set_power(),
check the return value and unwind in reverse order: restore regcache to
cache-only mode, reassert GPIO power-down, and disable the clock before
returning the error.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
Changes in v2:
- Also unwind regcache and GPIO power-down state on PLL lock failure,
  as noted by Mark Brown.

 sound/soc/codecs/adau1372.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 6345342218d6..e3eba241bdf7 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -762,7 +762,7 @@ static int adau1372_startup(struct snd_pcm_substream *substream, struct snd_soc_
 	return 0;
 }

-static void adau1372_enable_pll(struct adau1372 *adau1372)
+static int adau1372_enable_pll(struct adau1372 *adau1372)
 {
 	unsigned int val, timeout = 0;
 	int ret;
@@ -778,8 +778,12 @@ static void adau1372_enable_pll(struct adau1372 *adau1372)
 		timeout++;
 	} while (!(val & 1) && timeout < 3);

-	if (ret < 0 || !(val & 1))
+	if (ret < 0 || !(val & 1)) {
 		dev_err(adau1372->dev, "Failed to lock PLL\n");
+		return ret < 0 ? ret : -ETIMEDOUT;
+	}
+
+	return 0;
 }

 static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
@@ -807,7 +811,14 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 		 * accessed.
 		 */
 		if (adau1372->use_pll) {
-			adau1372_enable_pll(adau1372);
+			ret = adau1372_enable_pll(adau1372);
+			if (ret) {
+				regcache_cache_only(adau1372->regmap, true);
+				if (adau1372->pd_gpio)
+					gpiod_set_value(adau1372->pd_gpio, 1);
+				clk_disable_unprepare(adau1372->mclk);
+				return ret;
+			}
 			clk_ctrl |= ADAU1372_CLK_CTRL_CLKSRC;
 		}

--
2.47.3

