Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108F3DA7E0
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516462; cv=none; b=B8G2BX9QpOqctMML1B4Efz5JiyshFDuxYkcQyQ6Z1aaimNduxjCcR78q4eYngCj5q28/UO/eQD/RqlvJEeXitFeoTsUWboptOEwHY39stPmGmbQ/DIISRhyWMuR5cYi3FEWdi9USaYX0/BDTuUtkvq3YX9njZ/B3xjS7Ymq4Xjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516462; c=relaxed/simple;
	bh=ilNQGmGpp8rcfqhqtSz2+RO74o+lIPVDFRt4nmgP+9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqyroyaY4YTtNAWfKvHXTgN+5xy+YaiyO3hhETRl7ZjCBt3PGNtUIFVdqnv24E/EExGREtuHNVFxR/SeLg9QWsphZATJ0DZRlWR2zcKnqgIM2o9NJ8ENuCV1ru6IKV4mFojiIPwpXIzuBX4IcfWzJbR035H/Mwv9XFb+14TCWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLgIlZIc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLgIlZIc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso1631512a91.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516460; x=1782121260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=iLgIlZIcbgr8ze5LRg98HJlA8+eUrf2ik6eZse7LL2WoI0+zCl/R6UKFyrnoZw6cna
         VWYZkUFe5LhVacrzQhSfoBFY9UAcn+CZLv8k4+N8pmIHG1DC7lelZEZRIdpbg76Iinvl
         hwVD2+JRc7SEPvt1NBuLs6jxT+o8XezkShjJMpNYhrABxT1g9uofrbITj8/uve4/jvWe
         MHZo3ZWZIijw1hqJUTeDxbD982lKeEATuIgtj3N5y8ahcFZTmfqY4qEiZMTSb6AyvaBT
         zliqUUMf3N6O+U0ErZOZQ0pUBbea0qppmmuwzLVvOsA8iaMxw6dIY+qfYOi/B5X2bxay
         Y/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516460; x=1782121260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fixiw6LCSjSy5TCm86A8JjKJ/P+woOFTUDHQjwMDfTk=;
        b=e0qddpFznPZML1wQBds9JR95c5DZgI9T69TUOp5lHWDmT+Z04tGC2BiXp0QIqpzmJ/
         N3xmSdkBlDtUITHxkMVqzMkuLyBVGML1wYqxUyIucm9vtlTXLXWYLnM3hIBWJvL+gkh5
         OT+hqbP7LLBfay5Kh2OX0HMgVbhTWqNOlS1mELcTH+skb6CB3nvqO3C2fF4F+4SiCUHM
         EoY0EYGEys1urkNhPlgD5RXYhycCjcDaBF7sHBRTBQJ/z0W1L0CcuLRJ5IGe9b2/khv2
         zUDOXpV2d4ZNJmgmt0TbzWvjhUBoEcYB+0hsY87yhatEr1XVifuuSDQFIop/OHX0L8Ag
         bJTw==
X-Forwarded-Encrypted: i=1; AFNElJ8D8hCvyN6MAJk8Z40JYKyZIaLyAEJqjfnDEtQ67yPj4U24gGqJM1DHVnVsTdTLrOy0UIyWYtuedyoIGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32NsKn+Hjvmo+DpezlH9MaJdn/NMPTVoCxC7AiQp62GECyKEc
	fIbSZJ3OUd521HwKNBwsRnXnfmtYRbxEVhSZpd9/UeBRBAsQznvXY/5s
X-Gm-Gg: Acq92OGVehHZYrM8dRGMBir6iCZ8MQsEbf+oq+iqP7JKNXHie3VOkAzHs3/OMCaBfkQ
	k19behYGkfxQuJ3xEytJE0ZXlrCBvN7Pb+bU9ZqAHOG/fb8XmRp0mUhsU3kYwtOizqTaou/Aryy
	fkAY191fOJYKtBxSyn74XKs7QU6UmmaYahEtSXR2HtLIS0a2/TRr0q072PJuP2vILUGwGMc7VNK
	30OVABfq+uIMtNoW5nwFQdPWEgDcjyW6WzX1SvvsPNblZzbou613S22CmaQJLQyFw66bNNulpsv
	rjaxGhMg0wI91J+u0qlByclMqDAgrL4cT2Kk8ki4iTlE5HwsjmaRIPj5csgMvHDem4oiGerM5re
	Vnulzfssp3/PynqvlfGPDJuPvwqRePhNnoSSoddRCGMyvV9bnOGNqUgM/EboPFDoh9gcN8SR/kk
	Iq3L0CIJ3VjL2lK1gSoYYqdhGQYBtQUsCSQLVUqT0bjhMr7QwL1AWQ2RNgLhzM0U1c2erC
X-Received: by 2002:a17:90a:d004:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-37a01c34487mr13541493a91.7.1781516460544;
        Mon, 15 Jun 2026 02:41:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:59 -0700 (PDT)
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
Subject: [PATCH v2 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:23 +0700
Message-ID: <20260615093824.115751-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
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

