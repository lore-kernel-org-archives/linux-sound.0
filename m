Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5653F167C
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270873; cv=none; b=Nktxm4SorozMwNc3+UPQMwDKJVgDY1/eHujWg1eNAKYGWoCP/lH7Ohzy4WH9YnP7FORYLHiEUgq/efg/zYTK2dtE5WVVKZzr9pYCd1X5TI4zP7ibhoxWnnID2pD1ye35Kduv6a+jb+BG4TCfq47eYoCkQzq3m/ve2qkLB2rOpIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270873; c=relaxed/simple;
	bh=ilNQGmGpp8rcfqhqtSz2+RO74o+lIPVDFRt4nmgP+9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqzScNrDDp5KPLKjxFlgFIG9Z/k7BH1YitSZysk60D+YeuR82LuEsR1scKuRcqqmJ+eZ6GwfQk19FW3GCTGFdmW2MTNjfuItlBaHFb7tzAoq7XXj2e3V3dFzNjwHI4KRXyvRgnJ1xKN/+CPAqq2D+k15RB9928BGVb2trhU72k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrC7k8+n; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrC7k8+n"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-307d0405e07so1469528eec.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270872; x=1781875672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=CrC7k8+nxi0Mhpr4Iv5Zv1BNQlVlQsv60RqFnH6kZb5Xl8D92gmP1O2HZMgeoJxoSC
         gFmSaAcevOXGX2wVwe2zC2tj0ilkPORqmy3cjYJ9tqq6cWeAA0coh3kmiDPw0dTPyumo
         YnziT0sX80/QYH+KM6RvqIBdec2gVceQu7vL0DNxLNNlCAzoQbP5SYX1usLVSUTBKyT+
         RU3+2A39ziUXSDRlS0H7Nj6j8fesPBG/+e+k+KLqlpWyvvSVwHDmNWEEsDirP9vs0yex
         XPvtdKks6i+Uz9LP/6GfAmDSxJKBTw6CFCxD1sqAQ9LMZfE8vy3AY/eO2yopCxZ/u0Mg
         p+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270872; x=1781875672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=HrZMbAsjRuPFjrI+L75W6Kr+MMDOKYZvCJL4KctctBPPlNEqrNt/1WC2RUheWUPkEZ
         5xrwzst81FmkqD4FDbVaERo3Qgt7lSAt1d1e263o5GZlqwbUwohUBCn72oua1Zj/yyNe
         w2tZAZUeSX9CuTQh3dbxisP1OeoFIyaX6EMbD0iJXpyX9wua/Zsn5zHPYZvLMi5fPMSZ
         tI4YjBsy/WowZB3KBSbWqw2AmTn/nz7rty1aykkO1KT7/SgmnwxXHiIqR25w026rwO3f
         ngXyZ4WOF6hZrDuoXjL2jK+47lO8koLg4XDEmjmv0MsfixNH+ajKGJX4R3etlEGfXT4K
         evLA==
X-Forwarded-Encrypted: i=1; AFNElJ8bYSgB5FEBb5+bHY65Xskv/5MmZA6a77SXMWSRQh3yBmHkitwk2GCxwEDcfelFMqpJACxOhULNx7RMOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDsW5YapKreYqyqUHSi78gAPAl00E/7jlWhvcWrSsL5uREbPOf
	HHq1EiRS2+iUtzxmV5j9ZDD+bKZo2b0bgqxHIRT23UEXVqDnzezZNAni
X-Gm-Gg: Acq92OG3MxNTZuosE81Pug84h18ySpcvmE9AW19G68vI3sX/wG175G22lki8sS5t6DQ
	JfjFHAqlXBH4OH13A6yMUSks9CaGqPYviIzcTzkqtTSr82cHZkxlvjAXv1KYKVy990HwLtp6vdd
	vBN+h9VMtx2QYnWQw61aiyCgvktLl1dLdRt8J0MlQi+q2Bd9BcvpzsoS4EgRz9YiESlcfofEnyV
	MIFzbJwEXmyAg/ZilK1iUriusjWxAmSP+YcU4FqmmrALyEa5p2RvvCJ4ocfWU7TGBTNVhz6gi69
	qpqVBgxWiU++CbT7nTbfna9e4E3scpfqzIHDjNKRcphDf9Y2im1vH9WINGI44fKAd9GgTobqezr
	q1Ey1mb/tLcKAZ8epokon1F3dXPqEsWPy0FpS0ODwnuaL3DvBiKfi6a3YiRzXhxB61yfMtGncMX
	kQzTa3vXKyT3Ha11+GpFi0QlLR2AMdbSh2WZxIJoswxwIHe5mISGbnAdcvzw==
X-Received: by 2002:a05:7300:c8c:b0:304:8364:e95c with SMTP id 5a478bee46e88-3081ffb2789mr1848291eec.15.1781270871669;
        Fri, 12 Jun 2026 06:27:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:38 +0700
Message-ID: <20260612132639.78086-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/mpc5200_dma.c | 56 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 56e2cf2f727b..bfedb2dea0b3 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -77,18 +77,20 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 {
 	struct psc_dma_stream *s = _psc_dma_stream;
 
-	spin_lock(&s->psc_dma->lock);
-	/* For each finished period, dequeue the completed period buffer
-	 * and enqueue a new one in it's place. */
-	while (bcom_buffer_done(s->bcom_task)) {
-		bcom_retrieve_buffer(s->bcom_task, NULL, NULL);
+	scoped_guard(spinlock, &s->psc_dma->lock) {
+		/*
+		 * For each finished period, dequeue the completed period buffer
+		 * and enqueue a new one in its place
+		 */
+		while (bcom_buffer_done(s->bcom_task)) {
+			bcom_retrieve_buffer(s->bcom_task, NULL, NULL);
 
-		s->period_current = (s->period_current+1) % s->runtime->periods;
-		s->period_count++;
+			s->period_current = (s->period_current+1) % s->runtime->periods;
+			s->period_count++;
 
-		psc_dma_bcom_enqueue_next_buffer(s);
+			psc_dma_bcom_enqueue_next_buffer(s);
+		}
 	}
-	spin_unlock(&s->psc_dma->lock);
 
 	/* If the stream is active, then also inform the PCM middle layer
 	 * of the period finished event. */
@@ -116,7 +118,6 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 	struct psc_dma_stream *s = to_psc_dma_stream(substream, psc_dma);
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
 	u16 imr;
-	unsigned long flags;
 	int i;
 
 	switch (cmd) {
@@ -135,19 +136,18 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 		/* Fill up the bestcomm bd queue and enable DMA.
 		 * This will begin filling the PSC's fifo.
 		 */
-		spin_lock_irqsave(&psc_dma->lock, flags);
-
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
-			bcom_gen_bd_rx_reset(s->bcom_task);
-		else
-			bcom_gen_bd_tx_reset(s->bcom_task);
+		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
+			if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+				bcom_gen_bd_rx_reset(s->bcom_task);
+			else
+				bcom_gen_bd_tx_reset(s->bcom_task);
 
-		for (i = 0; i < runtime->periods; i++)
-			if (!bcom_queue_full(s->bcom_task))
-				psc_dma_bcom_enqueue_next_buffer(s);
+			for (i = 0; i < runtime->periods; i++)
+				if (!bcom_queue_full(s->bcom_task))
+					psc_dma_bcom_enqueue_next_buffer(s);
 
-		bcom_enable(s->bcom_task);
-		spin_unlock_irqrestore(&psc_dma->lock, flags);
+			bcom_enable(s->bcom_task);
+		}
 
 		out_8(&regs->command, MPC52xx_PSC_RST_ERR_STAT);
 
@@ -158,13 +158,13 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 			substream->pstr->stream, s->period_count);
 		s->active = 0;
 
-		spin_lock_irqsave(&psc_dma->lock, flags);
-		bcom_disable(s->bcom_task);
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
-			bcom_gen_bd_rx_reset(s->bcom_task);
-		else
-			bcom_gen_bd_tx_reset(s->bcom_task);
-		spin_unlock_irqrestore(&psc_dma->lock, flags);
+		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
+			bcom_disable(s->bcom_task);
+			if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+				bcom_gen_bd_rx_reset(s->bcom_task);
+			else
+				bcom_gen_bd_tx_reset(s->bcom_task);
+		}
 
 		break;
 
-- 
2.43.0

