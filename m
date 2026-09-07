Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A38481A86
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782635; cv=none; b=J+5L0CkZv5u1ORneQF+WAIL9e5X9kdqdbCz4w0FOjT0wAb2JJNmAJwcGbuEeG178eh7eEi3uVu6eUiEjiSsDDXciNyKXvgAovzthRLI40fb9oMMxE2Mn8Vq6Mu+DjTzLbnrLgL/v9MHKbOF3SKhyrN8Wk7pt8qXhy3Mfi8eatEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782635; c=relaxed/simple;
	bh=aiZEyKgJmHLp53zVzZj5+EjYzrNr0SLdC82B6Z9NXh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnuNqKpkpqwVFkGpQMq+YDh3EQCSW9BvLwQIg6o5hz2tJhB+z1K56Drn6MuwYjyVvxsX68FVgbgYaE5kk9n22BXSG5BIE05SyG1UbGVwb9Bsf3IBpcIf+8RA6pkYnGN6SxjPJv+bTkj8gDHXw2R51dLxrUhVptTofpvw7WVeuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDAmdslf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDAmdslf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db3305f94fso22468855ad.0
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782633; x=1789387433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=SDAmdslfCQP6+ORYJG4IWH02GjkxsEMmHeisv6CYeZDJ2AqqVRmH1AU/fM10fzYm8L
         PyyVJycyIKE2AZaeakb7qzh3tlCO/1R+dYkwfwYlZEdqghxy/1gKwIPg2pBd5WMCB1lZ
         uv/GMSdCvqUhivS7gcKIoW0ezPywpJJb/We6sneBTFJnByX3QHfSXt4owqgG+i62xVKX
         BNTnaeHbYvlyQNit8UfJFVGvvO7XBMHevIvSwXhzqJa8YqapOEjuZZ3hs4P6MAZtcTqx
         +ON0DArSfkKE7tZ9Ztz72dwgDUduK39bt+2UZoeMy4vhwHMTzVtk3xZECQPsYr4pJagk
         tLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782633; x=1789387433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=Rs90E37g//vRp4XIZdCbPo+pGlrl06d8vZqM2E35Q86n1QNnY6v+rskDOgt3fa3g9r
         LIeazP20j1Vl7xxgidIm+hgQZgFvnoqD+sVID8NlZUc/W0UMD3XUY76N+F3hUZFVU6Mt
         6qJsGYjQkmGg2E7kK91fI1DG9A6fN0iA6R8lAKwcDfGIF8jO7HK+Yl1+PUACbYlc8sNY
         nAO7nKcK3cNc9PShDmymAVOshmgV/WBHHX9qmKGsO7Wgha6PHhhMn7Yn/qXodojnnHZQ
         uIEGKO1zGjyiS+0SJmkb4tixk3ThbeLdXoOE7Qh6RxqncHdp6qA75IJctMObDIqcqM8/
         7TNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUpYz0cpwjyQPVDIuoXSiOdRRa1PjDGCDeqTNITaPHH30KaqjXWTwie9z9Drc6D5iR8G9lEIL3NqYbbA==@vger.kernel.org
X-Gm-Message-State: AFuF++mZNbMzlmHiS7xLNuQ20s3fI/YGdhdPq6GD5+CLf+uEYzu5gfPO
	HSM3EQLLDRR7mzSGpASL1j4B6cqweQmQ4gS4K3E670PE+ni+WzkeKflH
X-Gm-Gg: AYBFou0mTb1rQa6ZLmEiOFqykq90wZjNRlCfOZlrVeIdfC1sqOaPWHRFJeWuNKyv+aB
	WEZr6R8VTHoatDdvTiN15xmvad32c5flyOpG/OVxiKxlNzP2P+PJq/k2yRMQF7115hoKv1k4qrt
	FlM5t+lO2dkErSTqZKzPeIiypuj9QNEMNxZy4w9j/zY8ctd9MhNKH17CMvGrzdFuW8GJJiZsUHq
	57LuPhytxq8N+2paj8wIByeEGOBqS79lDscQUFpxGVJX/1Uxom3xsTgZGkjA/Kc3Mt39HVkVyqS
	KnYiRFU9wgOrrKoT6kvE5ulLKyePm+kGyUl9YxMQC4BhwK/VwE8qb1VXFBIn5maOyAXdjmhaQOb
	TRqj6uqCYJrax0/OWjweuWDlTSxkKp3It+D3HEcENG7ibqCpxL2ANKmS+5FkJFR8z3YYsBVMCZp
	EyeaG9r2T4AIpCpP7xPWcHk/xruuaFbX3rK4e/R60bmbPJ+vFq4ZUrmhnLHdl/4wlb+PMCMqYek
	0UFdubl+aB8MUB8IGwi4HpaTxJas0H3hYAvuhmWznsV3U0IznlFfH3SqjXC9qEPq4FqoHxhySh6
	d3np
X-Received: by 2002:a17:903:4501:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2db126679c3mr222996345ad.8.1788782633459;
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
Date: Mon,  7 Sep 2026 19:03:06 +0700
Message-ID: <20260907120310.135693-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The return values from regmap_update_bits() are currently ignored
by the clock and AFE control functions.
Propagate the errors to allow callers to handle regmap update
failures.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index ecba13eda440..77511f6fba41 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -564,9 +564,7 @@ static int mt8188_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
@@ -575,9 +573,7 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -617,14 +613,12 @@ int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 static int mt8188_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 }
 
 static int mt8188_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
 }
 
 static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
-- 
2.43.0

