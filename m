Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3C33B961
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962094; cv=none; b=Vr4EuXEGNuky+h3CrEvJ3OsPanuW0jkgctVIycY8cbjAXXnVLmRXVmQ1S2ur9XHCkcyZR/z0ju6eMnyI4CFkAlaX0rQEJ6xeaheZLlM7Jbfl2on+R+sVs1gsZwTMBb7bVmwVZFUhdcdAvmFCvsZwm0N62huKoXP6LgNQD8OiqHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962094; c=relaxed/simple;
	bh=T35+cYLS7/MVLQYR3L4zZ3jVtXxwtTE09atiMIdrc8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOB+6QviK9GrMA6d/Fq0Dll1T78XmdQvFtSvucpns2/QcypUYL5daPhSocHFcRV4Ceg6EAAu8SB47chKyzzwNrDIUCvZRKgU4z2NOm8ctVCqkJmzCTpx0yAolKPIMF4+pj3alrNd6xW4OLiHFwfJb61LMGG574YtIVQ7HriBns8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCfySJkf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCfySJkf"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso1720665a12.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 07:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962089; x=1763566889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XTTxnEs3Raq/piGJ6Bf3ZQhcim/5IOYY6Is9ElUM8U=;
        b=VCfySJkfaF4H1SuLHBZ6uZUs7y1y5ShqS5KINQ0QKt0AjekuJSsU+srHLQF/BL40Sa
         YxwJI9GFXHTkWadOZXgJDfD87PonrTHnEMqBnWeRERVYA4gdGN1PBeYo9xU8te9pcSJg
         OD/gDp+rzw4rU3pHzzq0+JhlmUx5PQYOVyWCOnawFK5LcWdSP05rudAP6CFvBC2YIepT
         MVOyNzraMkvHAAUX6Q0YMqB3fkYmVcJqM97197mBhZgqOwyE8FGN24KdCq/BM/ykNoK6
         +LcMvTkt30Id8NEQbyBVKRRH8weJhIdjJRlwzEUs7J2Bp3q2L8i4ZHHbzz40qv49G0oZ
         sAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962089; x=1763566889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XTTxnEs3Raq/piGJ6Bf3ZQhcim/5IOYY6Is9ElUM8U=;
        b=kZ/R7VSRxo8sjU6Dyx5njy7+lA+ae7qw2QVEuarpeSIZiF6nh/xJCUfPJY5Mqgmz6O
         sKEP1zXMW/2XxwrILpUJJF5rnAcdEwEZZ0i+0GAZnrsRrGDWYG2eNfhCtqkVsw4co9lM
         xgGjbYwvP03Lqp3OOUgk2lfwe6oaNiiVSVvmDGYUNEamzh7pYl/kyHg30wcuec+Djaqt
         SPB5Ht2zEq85EjWTaUDWfLrQnA/q5IcWgeTEqvOBkkt/vRZ4IOZ6Oml/2bipLSNaqzug
         eXpShQBgn8KQrRkozsbMTMOoTaT8yFpEdzMJo667fahSONZb4fP1IYuhSpWzBErILyL4
         K3LQ==
X-Gm-Message-State: AOJu0Yw5KvAmh56KGIJyQNIMG+LKZHjKZ1tOC3bl8cbbixIS5kEulMQL
	T25klr+uvBgzFu1yS3zZxn733Y6+hWRbHJNTMnf+4gcpMqeiRynTlYbx
X-Gm-Gg: ASbGnct7d1i0n0lO17gLavooOvphPpp51uRJdmW1vUCc/dB5+iLn7Ojl2CdsUE/YWW1
	2AKaP1wF8zktY7UyYywd9GePbcBNlODNXo+LWO/DkVtbBCmhezn64cCAUaV0Wu4jtkbiNJNyblW
	WKzlAI3LpbBdj0H0Fovu5o8B3osfsOt0ZmOliWxkpKWoHhRl6Cfz8Cfu4jHCmMajkWG/yQMBljB
	vE0//Q5Av98wKEfgiF3NQq9DWTj7Cn0DOsv63Jq+EmKkEZnL8kb0IOdrr0+2MD+qJS6OOcKugkT
	yhfS5SCuJAIhS5U6KR/WqhVOjiLUTllcU+vBWZU25+TyrMwt91nM+cMpRnM2yg86eeIKCjK54c7
	nrDR4nMlXpiFtF5PWZjxx6P/sMVYy7s7qNWi1NVVAxSHmLy/bbNaPVV6pV9oprgOllQ8dXCxu2A
	vEHPqKYT5J9gqT150/P7EgTrxTuSiSHEyNJoJrKsTWYo2DTaldkEcCKRagplwy0xssJ4bkPISd6
	2OFKw==
X-Google-Smtp-Source: AGHT+IGcT9Q73iX6iO06eyvMeqFfiaMCp9upzjhrl6xZANlRXTJ6HWG9Es1iaU+beLhBFmY+7jsDbw==
X-Received: by 2002:a17:907:849:b0:b72:aa52:6034 with SMTP id a640c23a62f3a-b7331971161mr407545166b.21.1762962089077;
        Wed, 12 Nov 2025 07:41:29 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:28 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 6/7] ASoC: renesas: rz-ssi: Add support for 24 bits sample width
Date: Wed, 12 Nov 2025 15:41:07 +0000
Message-ID: <20251112154115.1048298-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for 24 bits sample format width for RZ/G2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 76 +++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 18 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 839934e4b76a..5ebaaa440141 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -38,6 +38,7 @@
 #define SSICR_MST		BIT(14)
 #define SSICR_BCKP		BIT(13)
 #define SSICR_LRCKP		BIT(12)
+#define SSICR_PDTA		BIT(9)
 #define SSICR_CKDV(x)		(((x) & 0xf) << 4)
 #define SSICR_TEN		BIT(1)
 #define SSICR_REN		BIT(0)
@@ -74,7 +75,7 @@
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
 #define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
-#define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
+#define SSI_FMTS		(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
 #define SSI_FIFO_DEPTH		32
@@ -294,11 +295,25 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 	}
 
 	/*
-	 * DWL: Data Word Length = 16 bits
+	 * DWL: Data Word Length = {16, 24} bits
 	 * SWL: System Word Length = 32 bits
 	 */
 	ssicr |= SSICR_CKDV(clk_ckdv);
-	ssicr |= SSICR_DWL(1) | SSICR_SWL(3);
+	switch (ssi->hw_params_cache.sample_width) {
+	case 16:
+		ssicr |= SSICR_DWL(1);
+		break;
+	case 24:
+		ssicr |= SSICR_PDTA;
+		ssicr |= SSICR_DWL(5);
+		break;
+	default:
+		dev_err(ssi->dev, "Not support %u data width",
+			ssi->hw_params_cache.sample_width);
+		return -EINVAL;
+	}
+
+	ssicr |= SSICR_SWL(3);
 	rz_ssi_reg_writel(ssi, SSICR, ssicr);
 	rz_ssi_reg_writel(ssi, SSIFCR, SSIFCR_AUCKE | SSIFCR_FIFO_RST);
 
@@ -459,7 +474,6 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	struct snd_pcm_substream *substream = strm->substream;
 	struct snd_pcm_runtime *runtime;
-	u16 *buf;
 	int fifo_samples;
 	int frames_left;
 	int samples;
@@ -494,12 +508,23 @@ static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 			break;
 
 		/* calculate new buffer index */
-		buf = (u16 *)runtime->dma_area;
-		buf += strm->buffer_pos * runtime->channels;
+		if (ssi->hw_params_cache.sample_width == 16) {
+			u16 *buf;
 
-		/* Note, only supports 16-bit samples */
-		for (i = 0; i < samples; i++)
-			*buf++ = (u16)(rz_ssi_reg_readl(ssi, SSIFRDR) >> 16);
+			buf = (u16 *)runtime->dma_area;
+			buf += strm->buffer_pos * runtime->channels;
+
+			for (i = 0; i < samples; i++)
+				*buf++ = (u16)(rz_ssi_reg_readl(ssi, SSIFRDR) >> 16);
+		} else {
+			u32 *buf;
+
+			buf = (u32 *)runtime->dma_area;
+			buf += strm->buffer_pos * runtime->channels;
+
+			for (i = 0; i < samples; i++)
+				*buf++ = rz_ssi_reg_readl(ssi, SSIFRDR);
+		}
 
 		rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
 		rz_ssi_pointer_update(strm, samples / runtime->channels);
@@ -517,7 +542,6 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	int frames_left;
 	int i;
 	u32 ssifsr;
-	u16 *buf;
 
 	if (!rz_ssi_stream_is_valid(ssi, strm))
 		return -EINVAL;
@@ -546,12 +570,23 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 		return 0;
 
 	/* calculate new buffer index */
-	buf = (u16 *)(runtime->dma_area);
-	buf += strm->buffer_pos * runtime->channels;
+	if (ssi->hw_params_cache.sample_width == 16) {
+		u16 *buf;
+
+		buf = (u16 *)(runtime->dma_area);
+		buf += strm->buffer_pos * runtime->channels;
+
+		for (i = 0; i < samples; i++)
+			rz_ssi_reg_writel(ssi, SSIFTDR, ((u32)(*buf++) << 16));
+	} else {
+		u32 *buf;
 
-	/* Note, only supports 16-bit samples */
-	for (i = 0; i < samples; i++)
-		rz_ssi_reg_writel(ssi, SSIFTDR, ((u32)(*buf++) << 16));
+		buf = (u32 *)(runtime->dma_area);
+		buf += strm->buffer_pos * runtime->channels;
+
+		for (i = 0; i < samples; i++)
+			rz_ssi_reg_writel(ssi, SSIFTDR, *buf++);
+	}
 
 	rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_TDE, 0);
 	rz_ssi_pointer_update(strm, samples / runtime->channels);
@@ -662,8 +697,13 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_priv *ssi,
 	cfg.direction = is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 	cfg.dst_addr = ssi->phys + SSIFTDR;
 	cfg.src_addr = ssi->phys + SSIFRDR;
-	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	if (ssi->hw_params_cache.sample_width == 24) {
+		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	} else {
+		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	}
 
 	return dmaengine_slave_config(dma_ch, &cfg);
 }
@@ -981,7 +1021,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int ret;
 
-	if (sample_bits != 16) {
+	if (!(sample_bits == 16 || sample_bits == 24)) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
 			sample_bits);
 		return -EINVAL;
-- 
2.43.0

