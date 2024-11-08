Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2731EF92B
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063042; cv=none; b=h2OmCqeqs439fIEPO59DIfL1/Vlqx9oSHDn0Xc0twG1DxjB3e+IQxYv70Zu2mlBfCmLt/0hA5bHSTf6f/cUngyoUsROHThZ/yQWsYYXVg3u62vXCOkS2QJ99IM6/DFKBDh1iVXDbX/G3KLVuFNhBKmWsGTvUKTIl3N0uHes/Ncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063042; c=relaxed/simple;
	bh=d8mU8bYOrPorUuoOZuvaha0KU0RlKCB/stgC96hd0g8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=caTGC5JjXnkPQ+yiIznpN2qnSLfl7LYVU2zwM4Xwbl+M6iGNOmS5jFSFM0VwfWcIiumLGvjb3P6bec6jP7cjB2SVMEOk40vg/vjb+7+SJjNY6dWU9poSU6VlD06zFyuEX+xwJGTRybobeOzcTVEAqm6927AF4VQLjimbweAjEMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Dbeo1O7K; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Dbeo1O7K"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9eb3794a04so275763766b.3
        for <linux-sound@vger.kernel.org>; Fri, 08 Nov 2024 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063039; x=1731667839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0HYIcZ4941pOAMBeRvtJV39WH2Y/jzU7I8a5PPgGFo=;
        b=Dbeo1O7KoHUqawQ/OBO+NwwWCSd6GBqHJzertGEHPBY2Q9Rlrs8v3XvZlbZCuby5ty
         6mmFq9FICsoUAVLYpK2GnEXQnbDxj3B0TvjsC6Mzs87OqYeby+F9ukO1m4fuYcyk8VsI
         L9iMH2JvlUZqSir+JWrJktbgnNWHoAB7Z3HAnZagmuQbuEQSTgSzHMMtwPqrSP+bmFF9
         onXFDbY6pO9ZMBubbahQe0Wz81JGpNJjvQQ4AgCr+hDWElBeIRBunyozwe4nFpJi4C1b
         2OEqU6EY8xfqMwmWJH8hdp1VsWPn1LEcapAcPKIFacKKbkm2qhEh+KlLeFYRiIYB6Fek
         SDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063039; x=1731667839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0HYIcZ4941pOAMBeRvtJV39WH2Y/jzU7I8a5PPgGFo=;
        b=j7r5V6R6V9bntuPF8AtC8nu67HGBK8mrsHFXaiFGNIqdCucFFECzxm46HQAgnF5O6w
         vgiX2tyNUsOBMN3KpOWwSpG0oubPkyE3jngBCZ6BC14r8ohRhhBXfdg2EwYL3lLdfyMS
         N0mmIHTo/01eN4cfxVpRXi+1MLXvqsEuz5rtDcvy0/+iIGv2GxoDwwFFyo9v4DB4nnTG
         BLrS7dNZfup98Z5IV4Ff3quCVVWx387VE2ueDPReicouyDUj9y2TVKdK+ybUl3WA0btk
         8o+cKqFK0MZ6i9QQvLlpBLr9fAr1zxuSrOryA8tthgTVVEQNnwokotDy8shUItSdgBGx
         8fJA==
X-Forwarded-Encrypted: i=1; AJvYcCX46d+VQtHNVXEO+tTGLS5AwgqGAcctPul5tKWhxjJjaAMJ6nWvAvFf9bVZq+Q874//2pManY1oPbxZwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQA90Es/dW8ld+omBuhx0dafc/wP7MPg78DoKDK+zqk7pEUTN5
	tAcBETEH/8u4SKRO9BUt8gRu/h9eDYmrtVStPDH602OndqpqLKTFbnBJhacKem4=
X-Google-Smtp-Source: AGHT+IFGG1BBo43Xzy4yQ4uC6LGC4AjE4EiaqG8//Yidm3ggRg+BojPgMYe1LcTHoO/XqgYzHzGGaA==
X-Received: by 2002:a17:907:842:b0:a9a:4f78:c3 with SMTP id a640c23a62f3a-a9eeff0dc7bmr201747066b.21.1731063038893;
        Fri, 08 Nov 2024 02:50:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:38 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/25] ASoC: sh: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
Date: Fri,  8 Nov 2024 12:49:44 +0200
Message-Id: <20241108104958.2931943-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The first argument of the rz_ssi_stream_is_play() is not used. Remove it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typos in patch title and description
- collected tags

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

