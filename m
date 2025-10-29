Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DFB27B32D
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747116; cv=none; b=W0WM4KEiQu4MMVuguPar6K9nlkEHCxmumw5b9DxTcEU6Wa7o3qZKBEmS0D+weaodrbhESCHOjljaDvQVX9zWmmsi3/9NJ5isL+A3nlrkppegnb0JKhsL+D+hfdZAQ5/4QKfXa6Jk149ErwNznSIFxCmkZzoE3HgdBYwdPY/GGpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747116; c=relaxed/simple;
	bh=syzyZO/mJBKfFjprlnJbjqObQo3iQm+ErRfFxq3DXAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSYazxsw26AmHLI1B+0bYOe6oS5E2zMUMZsAYZJngGFaoVgP9I1SralAC6O97MkX4AZcP1GHNJw7t3hla2CJJBvlsbxbARl4bKLEj8NpD1147RayhTrQ5BY5ewSvx4DIMc/qmyMjz3zgIP+fsZGcREx5z2hKti5TUWCp72FxpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aLF0q0Oz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aLF0q0Oz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4298a028de6so705690f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761747112; x=1762351912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp6r0mmEiz+yEn07q0vDicoMrtrxWqGLSLuaBkcXGQs=;
        b=aLF0q0OzTId9NZLe36VsKpLHpZnT+JaFchqNfRd5UQeMwitv/AqoFAPIcCuYyEkplI
         eXyv/kAWNvzcjVD0JA/DVzbLAKp52WrUC/CmrXgPIMMPA2ElFZ0OvSKp3euqSOZy3kul
         xdHCGHtt+UyBxS/LJ82aWqmy0l0mE5B0/QTTeJxsD0cheCJV+3tuE3bd2/1r8qdzINk+
         OCuQH6OqRrMY8NoJcvY9QwEyIdFRxTXqOsBLNLtHQZkoTFoVEWkhhxlfAiCGzuiIHJNx
         2Pv5j6Gu3tpApdoWKor4/Fxd18DLWof6x5139r2gKQODR9ryHW/BnTGJALSSljyNneK+
         pL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747112; x=1762351912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp6r0mmEiz+yEn07q0vDicoMrtrxWqGLSLuaBkcXGQs=;
        b=a7L9xPj8AgJ0dgCWsuCJe/YrtL/DrHsdEkMC0EVCez80RMg2oDb9Ez7YnYduGnoPt0
         /qstI7RclpiV4677eLb/hs76wgY7K6pFS8Ls8a4R8cRVKVqT0f+Ul2QCZJI6KcNYYExj
         S7/v/WXIXTryYVqJbGc1vkOWJU8P7kddEM5tODwaTIp+CQv49w53dFUWy8inUmRwj3N7
         KdLyei/CujtYH10usEFvInHDtBEsvVMmps4IkZ0r08Mq8nKaoToVoVcCk/NET6wBjTe9
         b3OmkTPufXlGA+w2Pr0qo4Uhvs9LJmsN4hWiDhGPvzrhb0ABNcr1+5Llc8YzGCeBN+PU
         axgg==
X-Forwarded-Encrypted: i=1; AJvYcCUx7yJ+ViZJ/3Sz+SvWnHC2F+uvMN1wrYgaC2v4G+ciYMLjCxfNPPxkB5J4fmDyMMlKqY++EDB6NJL5vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJ6q2FLBsNeBvqtcmZJ2CUxtT5ys6rTO8hBc60ZowL/Nqci3o
	i3dtzCdrqWMbZr5MVDlpUXlT3J0xO585uELUGWfYbOhsnBm1NyWPu9qhGvAmeMKl4WA=
X-Gm-Gg: ASbGncunCADFnb31rJkWva8TbB5r/jC5cBoIqJnqf4wF6DhGUNz8YCNk5bAqYqt8TvY
	SEIhqowIJFqRlK9q/76I/ER37KTDvCsHpdc7EJ8I5F+44rSgz/nlxpPj+yTOLcJA56Lr2hnykNP
	P5nx2gjyTbFr9MgGB9GMnG7z82EakewxuTnms7pWFrlA+gGbqe4Auvqlpj28k6xPkPCrvA/Xbj1
	MNo0P80QqoDOaFxysicwHIb3uMUgErEZO63guAdiCbY1ink90Wgnj0bvp+OthDqe88mosNPozWQ
	AnG65Z1yThAWsvlhQoMZ86bNbMoeOV9MEwkMvK43AB7OOT3RFanR5XiXS7nUUEeGxRCkxwewQrP
	D+CVanEB6x13aTeie0HdEy/FxhP18YEIIFMFRIiqMX2790P1HUsDVR6gggiaZtNHPPI5FolOtJr
	zNJkeCThEJ/iJgCIEj0U7L1fdnRQPBeGKi09JLZg2xGbpzxO9vZoJpuCrGubVl
X-Google-Smtp-Source: AGHT+IF0Hr0vldeCHlMvpdjLo7kANvDVUkMSknePlPVoEwlL5eF+LbbvELXIRDurzNHdmZ/2Jwl5Lw==
X-Received: by 2002:a05:6000:401e:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-429aeb09960mr3002731f8f.21.1761747112092;
        Wed, 29 Oct 2025 07:11:52 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6302:7900:aafe:5712:6974:4a42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9c6sm27076286f8f.36.2025.10.29.07.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:11:51 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume
Date: Wed, 29 Oct 2025 16:11:34 +0200
Message-ID: <20251029141134.2556926-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When the driver supports DMA, it enqueues four DMA descriptors per
substream before the substream is started. New descriptors are enqueued in
the DMA completion callback, and each time a new descriptor is queued, the
dma_buffer_pos is incremented.

During suspend, the DMA transactions are terminated. There might be cases
where the four extra enqueued DMA descriptors are not completed and are
instead canceled on suspend. However, the cancel operation does not take
into account that the dma_buffer_pos was already incremented.

Previously, the suspend code reinitialized dma_buffer_pos to zero, but this
is not always correct.

To avoid losing any audio periods during suspend/resume and to prevent
clip sound, save the completed DMA buffer position in the DMA callback and
reinitialize dma_buffer_pos on resume.

Cc: stable@vger.kernel.org
Fixes: 1fc778f7c833a ("ASoC: renesas: rz-ssi: Add suspend to RAM support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index e00940814157..81b883e8ac92 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -85,6 +85,7 @@ struct rz_ssi_stream {
 	struct snd_pcm_substream *substream;
 	int fifo_sample_size;	/* sample capacity of SSI FIFO */
 	int dma_buffer_pos;	/* The address for the next DMA descriptor */
+	int completed_dma_buf_pos; /* The address of the last completed DMA descriptor. */
 	int period_counter;	/* for keeping track of periods transferred */
 	int sample_width;
 	int buffer_pos;		/* current frame position in the buffer */
@@ -215,6 +216,7 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 	rz_ssi_set_substream(strm, substream);
 	strm->sample_width = samples_to_bytes(runtime, 1);
 	strm->dma_buffer_pos = 0;
+	strm->completed_dma_buf_pos = 0;
 	strm->period_counter = 0;
 	strm->buffer_pos = 0;
 
@@ -437,6 +439,10 @@ static void rz_ssi_pointer_update(struct rz_ssi_stream *strm, int frames)
 		snd_pcm_period_elapsed(strm->substream);
 		strm->period_counter = current_period;
 	}
+
+	strm->completed_dma_buf_pos += runtime->period_size;
+	if (strm->completed_dma_buf_pos >= runtime->buffer_size)
+		strm->completed_dma_buf_pos = 0;
 }
 
 static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
@@ -778,10 +784,14 @@ static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 	return -ENODEV;
 }
 
-static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
+static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
+	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
+	strm->dma_buffer_pos = strm->completed_dma_buf_pos + runtime->period_size;
+
 	if (rz_ssi_is_stream_running(&ssi->playback) ||
 	    rz_ssi_is_stream_running(&ssi->capture))
 		return 0;
@@ -794,16 +804,6 @@ static int rz_ssi_trigger_resume(struct rz_ssi_priv *ssi)
 				ssi->hw_params_cache.channels);
 }
 
-static void rz_ssi_streams_suspend(struct rz_ssi_priv *ssi)
-{
-	if (rz_ssi_is_stream_running(&ssi->playback) ||
-	    rz_ssi_is_stream_running(&ssi->capture))
-		return;
-
-	ssi->playback.dma_buffer_pos = 0;
-	ssi->capture.dma_buffer_pos = 0;
-}
-
 static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			      struct snd_soc_dai *dai)
 {
@@ -813,7 +813,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
-		ret = rz_ssi_trigger_resume(ssi);
+		ret = rz_ssi_trigger_resume(ssi, strm);
 		if (ret)
 			return ret;
 
@@ -852,7 +852,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		rz_ssi_stop(ssi, strm);
-		rz_ssi_streams_suspend(ssi);
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
-- 
2.43.0

