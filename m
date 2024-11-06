Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920F1DD0ED
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881182; cv=none; b=HMrS4cZFTdB3IO+8zKzQlUv3LzBewIvMxV4PbmyRty0s64CHGfFg3IasMxtK17qjj7xNf0Y/zJVHUXm25MaUYdmX86ar/VtSIJbOWKeT/aaKhtHOhfDY40DUBlLKNpzfzYNwNFF09xSu2P7cynV6fKU5lzXp4iQZ6o+28zwJyq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881182; c=relaxed/simple;
	bh=FvHfkcoFRcdGgeRO0csLPELeXnRm8NAXFbb5lVzo6V8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6gx28tl+jitMY11LBnccclOFNkr+YXpZ4u25grB9e06ALFp94H21bP/+fKGewDqj9yG+z+WCNgZE/7XE4tVz5a+0zl13A5qtWtvWAk7abxtIfVxjfq1h7sqHJqeIjTA6XpIOp+dj103CeUcykVIBSAAcDcxXTW6pRy+QQe8aoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PHIUFqgc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PHIUFqgc"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso97976551fa.3
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881179; x=1731485979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXlel/SvkVoTEjT+N6TrE9yJSliGmGXmOgOGBR7slxE=;
        b=PHIUFqgcHcpMKY6uvSQqq5CUa88nWS+/0yf8/x/JqxXkS5dW5km2A95ONn0+oHokqX
         qWw+mA5AIATGZumvA9hk1lfc9CKu5sG3HkLbDJSA4L+pp0nkYgrpCKSlKi6Q1ciElyaF
         NLm9dGinaJ6096SU7qWDJu8zny5Otk6kYmmghha6Y/NHbDvaZJQLUTUbfvMoILhZoMwE
         8C9Mo7CuJGzVqxTiAYtX9SSo7GN2LJUJI8e3jDO1OcmKdvb46uKRGeJ3eXddiDakGWDU
         FYBje/6zxg0eMN6kzwBpTW7Jyv8nMDtFwUAe8NQxN8DhmQnNShcwrhawb3mOCQzRVkn0
         DBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881179; x=1731485979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXlel/SvkVoTEjT+N6TrE9yJSliGmGXmOgOGBR7slxE=;
        b=LorFt/BJb+XD6O5N/Ds/lrqp3Y5KAgDYQ1dVNaYyQ4CzvuUSCFaMyclQyl9gqrUyDQ
         vFfqu/GsVJ0S1NSuvwV4Q7if6Mh8FnpSx1mmgVhwW+8++HBIz1T+HP5MwfyfYwLStrgT
         DYU8KNKGSkqvp3NvZ7QjzF5/ddVN09XwywpslacmL5JTpVtEQQOw4dqdV69C7JLQMePb
         T5DrU8ciSctG190XDtk9+ciLu+4KCkN4TVVGjXRjOWo1QFTQ+m13Z44el2dv+1g8rUbP
         lVBmfoZ4c2Seto1hUsvHTir0EpMu5a9aLJIihXprH5ADor6CVaj8s11ZTWvIhSEtJAZ2
         9E7A==
X-Forwarded-Encrypted: i=1; AJvYcCV959OV0+IG9QtknReM6CGGm2Im8U1kVr4VYrb2JEJmVXIWw7WHs3jK+sAwqUuCw4NBXZfEezWxWGz0FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wXjO1Z05c2O9gNAnhw+nUyTP0NCd59nYhj9PvqPT6IZ2OJlg
	l4j547uFh3pLjghlu5fPWbCrdSA21ZJknfvy9qKHwpzGY8Y1wm3HnqD9hqDHcxY=
X-Google-Smtp-Source: AGHT+IGC71tLjtFqTQIuoFDDSZrzazipwnCmFv9E2NviCYNw1AygfQgtn8LiTJOzxLelw6cXGlOudQ==
X-Received: by 2002:a2e:a592:0:b0:2fb:6362:284e with SMTP id 38308e7fff4ca-2fedb796385mr157449751fa.8.1730881178719;
        Wed, 06 Nov 2024 00:19:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:37 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/31] ASoC: sh: rz-ssi: Remove the 2nd argument of rz_ssi_stream_is_play()
Date: Wed,  6 Nov 2024 10:18:06 +0200
Message-Id: <20241106081826.1211088-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The 2nd argument of the rz_ssi_stream_is_play() is not used. Remove it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4c33663a0ae4..f230d63339e8 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,8 +162,7 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-					 struct snd_pcm_substream *substream)
+static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 {
 	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 }
@@ -337,7 +336,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_play = rz_ssi_stream_is_play(strm->substream);
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
@@ -674,7 +673,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		 */
 		return 0;
 
-	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	dir = rz_ssi_stream_is_play(substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 
 	/* Always transfer 1 period */
 	amount = runtime->period_size;
@@ -800,7 +799,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ssi->dma_rt) {
 			bool is_playback;
 
-			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			is_playback = rz_ssi_stream_is_play(substream);
 			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
 						      is_playback);
 			/* Fallback to pio */
-- 
2.39.2

