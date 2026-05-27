Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562CC403158
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889338; cv=none; b=Q/aR5MKoqpZjABqqzch3vvqOmGXf3+Qh9qMCb97wSa/vj38j+eML0OT5/hXlRqj8JUOFmp0uAJnPGM6Vh/fq7dnj9YdbJ1GFi87FVVkCYiwkLXA6gVwnEyksP8PjpZ9xUlW2lR5taRziC5k0f+aDJQLGmMH8vBD8mKeYz5+MI/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889338; c=relaxed/simple;
	bh=InHqJ2PNAaclYU6DB/4BCMiDFr1sW1hmcux0hzUPPiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FK2pNAi9oKHliLbp7CdUcJaK9zdWbdQeEkAdgjkN1WkjUYNkRrLYSbk9cRIURV4DGzJJBzhMK7VNDZzUkP1padlFg3/MmCkYJsRhJLOntrQFzBqVHDqSb5U0I5AA6xTrb6zpv6NyWTSmp1/wBkqAp4OkNHvyzCCnRc46ouhRcl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=so8ndgTR; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="so8ndgTR"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-303dbfbec77so13902573eec.0
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889336; x=1780494136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPQMUeKZPxsEa24h/tMGbugrrlbgcKdXRN5CjzvNfg0=;
        b=so8ndgTRV6zGfnA3zRCb15rFM7brydNusYaTRlXwOKsnXN9a1GzOgTnJK3A3+v3qen
         ico02iMeoSh5piHA5MKQ1TBDZc7CO4yZqrSOSNqZptqqy4DPMwI1sNNKQOXmHU7DcCH1
         ri7vftJwG85+pW0fV3xHZ13f+FThghEr/9ON4mzFCyhXwGX5sZQ2Xtt9/mjAihYdE/X+
         rLzHCsjfjl9ETDpSCga25x0EMMbEfLbLYDLgBNnyBmJzG7MJcP4ljIN4ZQOYLmTRkGAw
         kIpjFHNzZUmfQPs6UiUv5RKWI10wJlvi/uKfEUZr5nVSux/5PBMZXKpTzozJgFhRqilj
         MjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889336; x=1780494136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPQMUeKZPxsEa24h/tMGbugrrlbgcKdXRN5CjzvNfg0=;
        b=fhA9oNYLHZrJLtailQBg7jUJ+o07BP3OMuJa+BakeYpVWyYB5GuYOTrsGmNuNbMbrd
         RwV80lHmO4v1vq4H3eGQgCqczLVbqYgIUOGdj03T5IyRN412NyLk9GfHWALXcN+5W34V
         nL8jyv/L8EvSis7wEJv1tP975CVqMkBT9bPlyVn2r3j7rU2mtj85hymyqDn25UBREH2I
         YayCNDPZN1nDqRHDcy84yrU98I1A5sh7BeX/CXJUpWN9CwhQwzyBsOpjZCo+VkXOg+zh
         zOdKnL7fCq+snKlh++UQbxLoWIpiAzhrHhnYpJzjfh9mhN0a1/17TGmwDG8eEZkWPM2y
         3KEQ==
X-Gm-Message-State: AOJu0Yyqgn9X2T1/yit/YP4IuHEzpIElIBHOQqLbz+AeaPf9A4X6dsjb
	bvPppnIRwQ8OcwxCXqC3oddu6gyL6y6wGvKp+MlYj6C8L4rPf15r+btG
X-Gm-Gg: Acq92OGC/hSiGVvbMNMUzhdPhMrmBZ2DHkrWaEgtovVP8kLyyOxs6tCr7AUaGZtKy7s
	S34aq2AvZQQa2f1z68u7+CsS4sySsAdbiGQoaDrRhGtFyvxspD3Jqa4k8ikDGDl4TKTjWZcTUH1
	PyVJncgjC86PCBMrP/VFfULwhdKgEgqknLt/SjjeoKvGSDTGW5wcLBDVFTiXEmn7eG40eVtTXlT
	5WCUCcO5dVY1+WruecrQuva7dndfFgamzD6QV/PTlQW9BT3xHXX+5fXD6teyqgFdo46JiiJkVk1
	2kNTEey+9xUlJGbeWyZaj+y8K0x7sKg8IS10V8QIJqWpV56mIzs5cJGqdXrvH9WtZo+Em7lDdwY
	anYL76r4XHzP7fmvpjLyDq/WCY33Mu0eXKsG6GV1qD8w41hojs5LrC4m4j1BUFGu3Mh67Eo5kr/
	dK3kbRTfsnWhJVCJAsfVFl6EZzMWoIT/BRyf6NkUvwjmntpnfbjuvmThSB/UUlplKO7egM5KkdY
	AnpxOHMkfyQ
X-Received: by 2002:a05:7301:a84:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-30448f30872mr10369074eec.1.1779889336443;
        Wed, 27 May 2026 06:42:16 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:16 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:41:49 -0300
Subject: [PATCH 2/2] ASoC: mediatek: mt8183: Check runtime resume during
 probe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-2-4f4f5593c8d1@gmail.com>
References: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
In-Reply-To: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=InHqJ2PNAaclYU6DB/4BCMiDFr1sW1hmcux0hzUPPiE=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1YZNC5ZftYw1+3/caOwl8IefBtEl/fymm+WYIh0t
 VtzMUaso5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACaS/oiRYaI35zZxrdy1CmEm
 DqssLOu3sKvesLk43WZ6wGIT1fwCe4afjEW/dq9n3H5PYsbpJ0KVHS++HFYIfaoRmLz5eE3/+xk
 2/AA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8183 AFE probe uses pm_runtime_get_sync() before reading hardware
defaults into the regmap cache, but does not check whether runtime resume
failed. If regmap_reinit_cache() then fails, the temporary runtime PM
usage count is also not released.

Use pm_runtime_resume_and_get() so resume failures abort probe without
leaking a usage count, and release the temporary reference before
handling the regmap cache result.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 49a69728fd72..2634699534db 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -844,17 +844,21 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
-
-	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
+		afe_priv->pm_runtime_bypass_reg_ctl = false;
 		goto err_pm_disable;
 	}
 
+	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
+	if (ret) {
+		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
+		goto err_pm_disable;
+	}
+
 	regcache_cache_only(afe->regmap, true);
 	regcache_mark_dirty(afe->regmap);
 

-- 
2.54.0

