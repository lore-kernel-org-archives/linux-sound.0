Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782B13BD657
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050643; cv=none; b=n21947ms0HnipkPqZnYGR+uoUfYrrhQGZJ90hYfDLPAK9ambhftTASYDj4erf4tMO8NlC5ldCMGuv84KSNn54cAAJ+Roql5c2kpbDBrPFHrEC7dVyTg3iSSMPq/vMu9q0HEaCt9ibIPVXkgHKfLpaWDpe/ceYynXOoChdHzwHvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050643; c=relaxed/simple;
	bh=oy09ZHrl9v5cKiaCRQNKvFAeiGrAltam15QJNPJBBn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpyT4npnDBTgLb9NnUntOcjzIzTDBJf4woca1bW5zM8r/ycviZX90v/tP3MoFpTXgeghP1mkUiZlEvTPuR+GKPEjts5vNXVwLXfC2mg9trQ3EM65zZ16KPfq0q26RCr/9vYOMe+l/yXSiMUJ+GHvWBt6o89Rgs5gbq8/ruTCa1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erbD/F+a; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erbD/F+a"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bcd3ac3307so80400055ad.0
        for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780050640; x=1780655440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qPVtOmyFqQyKIyP2PlSkUiq0jd3c4HJJrw3M4f4wYQ=;
        b=erbD/F+aREFaFzCOmKyhR+LLN+PTGYrTgGFaYVAxVkA039lkRvWm1opn5RtYMu4FrV
         UrJRfqMXw6BNMxKGiZHX0uEBN3ChzjNaqqoPcHxB50ZRaavN3jXnEAz88FZmv71Z94XC
         Q8+Q2b+uFnjmxEUGI0phPBEjT4WpEhYSyF5BO2yHAIArprOM/efJzL9cFc4n5Dek/005
         Lqvk+pwTmEtH5NA7toEsRz+IxXuymZOxy7rducBqCz9Pyi5YDcpaKURx85wZbOf09T45
         ItOBU+kQUszcuTi3v2WtQLCdOoPk8KLoI6+eleNtgHSJD97t7RKheNGUiElxK4a48tXs
         fldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050640; x=1780655440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qPVtOmyFqQyKIyP2PlSkUiq0jd3c4HJJrw3M4f4wYQ=;
        b=DuiCQUHmyNjCqIH3B9ZQJX8BFvln3lHTwDoJZr9L7fxYmGk/hnXojSxt60DLXvCc8e
         hTjtigicfoBXZnTLFaClJoKixqjq8dLLzx76f4XPrDnDrtZxy1RfwtNAxQyGRO8sJigh
         hWFWhmu1/FnJ3TtzOOu9fHJaop4/6jstTC7CSlQMLRNVSy7EFY1QgC1dFJrIhA6i2i9O
         d5qtf939DabhAhnmZ196tDsxaHYolXiIuJKDaTWAMZHEWkCCMjoUQ/PodEXskhOnCF7v
         Ii9Vqv3btwnnScD3q0M/0M5/zC7cOpfRaktagb6fCbmz8OdVZwqtzaygJqYTxClStEcq
         97sg==
X-Forwarded-Encrypted: i=1; AFNElJ+5F/RJhYEC1z/kgbfmrHI3Lqdgsiezm0qSRpOjj2FPqN/HqjjtO/r37g3RjXSP1HrvhXg5KxvQC/kAHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmtO3jeksLTeHn95s2KeeTW8UUylhhzMjWSNXr2YjSKVRwn1S
	3uC+U26pYr7yfxQH0fEWsO5gkHfEs9qMBXp0VRPmXzd9e3t859MMD0tf
X-Gm-Gg: Acq92OGutdcwxG95Gj87N/lVyUY3S/aqrgSeGjF/TQbEU5WFLvl312jf0Ad+8XF+G2G
	PVkTNdzKQsAPcNq/sDzNqPTEyVr2gGBfUvDq6ew4PT9Yl/8bysDK9yBayviWpVDCmtSlL1LwO4O
	2h0NQV4tn4MPfhRo3ivZXPF0vCre7dPxEpdA8qthAMcl2oNSFTWpfPXI9vjwBVyIw9NEgY1iBrU
	FP/0ZYSyQXY7iVtNx3r47g5i1fQT9hKPktrwIEfhoLL8du/SssEsLoH7hDrmI4P2/8gbVZ3BMKb
	2JF/OIwBKRBDWqYz8jJrI03iJJNTPyx7N5Nwn26QSAFrP49WgCMIyOfKV/Y3KENot+iz0nSxDWI
	06fFFh69GCbv2QONUXAfCr1UGg3d9GhnnlXHotxyNKfmVhCs3qMltreAcP8u8/CLzQ3rdH30xHs
	qkHyEg/FqtmjhQBI5bmG7vD185bws1xvCmk06UnBqfkgCARwLvC6koZtnhePEm6HeViy0PHaf1C
	WpRPe0=
X-Received: by 2002:a17:903:234f:b0:2bf:3126:44b6 with SMTP id d9443c01a7336-2bf312645c6mr427695ad.40.1780050639662;
        Fri, 29 May 2026 03:30:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3a8afsm22904795ad.73.2026.05.29.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:30:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks
Date: Fri, 29 May 2026 17:30:19 +0700
Message-ID: <20260529103019.15233-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 Remove the leftover mutex_unlock, as pointed out by Mark.

 sound/soc/sprd/sprd-mcdt.c | 66 +++++++++-----------------------------
 1 file changed, 16 insertions(+), 50 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index 814a1cde1d35..5f3a2a7bce31 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -524,7 +524,7 @@ static irqreturn_t sprd_mcdt_irq_handler(int irq, void *dev_id)
 	struct sprd_mcdt_dev *mcdt = (struct sprd_mcdt_dev *)dev_id;
 	int i;
 
-	spin_lock(&mcdt->lock);
+	guard(spinlock)(&mcdt->lock);
 
 	for (i = 0; i < MCDT_ADC_CHANNEL_NUM; i++) {
 		if (sprd_mcdt_chan_int_sts(mcdt, i, MCDT_ADC_FIFO_AF_INT)) {
@@ -547,8 +547,6 @@ static irqreturn_t sprd_mcdt_irq_handler(int irq, void *dev_id)
 		}
 	}
 
-	spin_unlock(&mcdt->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -569,22 +567,19 @@ static irqreturn_t sprd_mcdt_irq_handler(int irq, void *dev_id)
 int sprd_mcdt_chan_write(struct sprd_mcdt_chan *chan, char *tx_buf, u32 size)
 {
 	struct sprd_mcdt_dev *mcdt = chan->mcdt;
-	unsigned long flags;
 	int avail, i = 0, words = size / 4;
 	u32 *buf = (u32 *)tx_buf;
 
-	spin_lock_irqsave(&mcdt->lock, flags);
+	guard(spinlock_irqsave)(&mcdt->lock);
 
 	if (chan->dma_enable) {
 		dev_err(mcdt->dev,
 			"Can not write data when DMA mode enabled\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EINVAL;
 	}
 
 	if (sprd_mcdt_chan_fifo_sts(mcdt, chan->id, MCDT_DAC_FIFO_REAL_FULL)) {
 		dev_err(mcdt->dev, "Channel fifo is full now\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EBUSY;
 	}
 
@@ -592,14 +587,12 @@ int sprd_mcdt_chan_write(struct sprd_mcdt_chan *chan, char *tx_buf, u32 size)
 	if (size > avail) {
 		dev_err(mcdt->dev,
 			"Data size is larger than the available fifo size\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EBUSY;
 	}
 
 	while (i++ < words)
 		sprd_mcdt_dac_write_fifo(mcdt, chan->id, *buf++);
 
-	spin_unlock_irqrestore(&mcdt->lock, flags);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_chan_write);
@@ -620,21 +613,18 @@ EXPORT_SYMBOL_GPL(sprd_mcdt_chan_write);
 int sprd_mcdt_chan_read(struct sprd_mcdt_chan *chan, char *rx_buf, u32 size)
 {
 	struct sprd_mcdt_dev *mcdt = chan->mcdt;
-	unsigned long flags;
 	int i = 0, avail, words = size / 4;
 	u32 *buf = (u32 *)rx_buf;
 
-	spin_lock_irqsave(&mcdt->lock, flags);
+	guard(spinlock_irqsave)(&mcdt->lock);
 
 	if (chan->dma_enable) {
 		dev_err(mcdt->dev, "Can not read data when DMA mode enabled\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EINVAL;
 	}
 
 	if (sprd_mcdt_chan_fifo_sts(mcdt, chan->id, MCDT_ADC_FIFO_REAL_EMPTY)) {
 		dev_err(mcdt->dev, "Channel fifo is empty\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EBUSY;
 	}
 
@@ -645,7 +635,6 @@ int sprd_mcdt_chan_read(struct sprd_mcdt_chan *chan, char *rx_buf, u32 size)
 	while (i++ < words)
 		sprd_mcdt_adc_read_fifo(mcdt, chan->id, buf++);
 
-	spin_unlock_irqrestore(&mcdt->lock, flags);
 	return words * 4;
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_chan_read);
@@ -672,14 +661,12 @@ int sprd_mcdt_chan_int_enable(struct sprd_mcdt_chan *chan, u32 water_mark,
 			      struct sprd_mcdt_chan_callback *cb)
 {
 	struct sprd_mcdt_dev *mcdt = chan->mcdt;
-	unsigned long flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&mcdt->lock, flags);
+	guard(spinlock_irqsave)(&mcdt->lock);
 
 	if (chan->dma_enable || chan->int_enable) {
 		dev_err(mcdt->dev, "Failed to set interrupt mode.\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EINVAL;
 	}
 
@@ -712,8 +699,6 @@ int sprd_mcdt_chan_int_enable(struct sprd_mcdt_chan *chan, u32 water_mark,
 		chan->int_enable = true;
 	}
 
-	spin_unlock_irqrestore(&mcdt->lock, flags);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_chan_int_enable);
@@ -725,14 +710,12 @@ EXPORT_SYMBOL_GPL(sprd_mcdt_chan_int_enable);
 void sprd_mcdt_chan_int_disable(struct sprd_mcdt_chan *chan)
 {
 	struct sprd_mcdt_dev *mcdt = chan->mcdt;
-	unsigned long flags;
 
-	spin_lock_irqsave(&mcdt->lock, flags);
+	guard(spinlock_irqsave)(&mcdt->lock);
 
-	if (!chan->int_enable) {
-		spin_unlock_irqrestore(&mcdt->lock, flags);
+	if (!chan->int_enable)
 		return;
-	}
+
 
 	switch (chan->type) {
 	case SPRD_MCDT_ADC_CHAN:
@@ -754,7 +737,6 @@ void sprd_mcdt_chan_int_disable(struct sprd_mcdt_chan *chan)
 	}
 
 	chan->int_enable = false;
-	spin_unlock_irqrestore(&mcdt->lock, flags);
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_chan_int_disable);
 
@@ -775,15 +757,13 @@ int sprd_mcdt_chan_dma_enable(struct sprd_mcdt_chan *chan,
 			      u32 water_mark)
 {
 	struct sprd_mcdt_dev *mcdt = chan->mcdt;
-	unsigned long flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&mcdt->lock, flags);
+	guard(spinlock_irqsave)(&mcdt->lock);
 
 	if (chan->dma_enable || chan->int_enable ||
 	    dma_chan > SPRD_MCDT_DMA_CH4) {
 		dev_err(mcdt->dev, "Failed to set DMA mode\n");
-		spin_unlock_irqrestore(&mcdt->lock, flags);
 		return -EINVAL;
 	}
 
@@ -814,8 +794,6 @@ int sprd_mcdt_chan_dma_enable(struct sprd_mcdt_chan *chan,
 	if (!ret)
 		chan->dma_enable = true;
 
-	spin_unlock_irqrestore(&mcdt->lock, flags);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_chan_dma_enable);
@@ -827,14 +805,11 @@ EXPORT_SYMBOL_GPL(sprd_mcdt_chan_dma_enable);
 void sprd_mcdt_chan_dma_disable(struct sprd_mcdt_chan *chan)
 {
 	struct sprd_mcdt_dev *mcdt = chan->mcdt;
-	unsigned long flags;
 
-	spin_lock_irqsave(&mcdt->lock, flags);
+	guard(spinlock_irqsave)(&mcdt->lock);
 
-	if (!chan->dma_enable) {
-		spin_unlock_irqrestore(&mcdt->lock, flags);
+	if (!chan->dma_enable)
 		return;
-	}
 
 	switch (chan->type) {
 	case SPRD_MCDT_ADC_CHAN:
@@ -852,7 +827,6 @@ void sprd_mcdt_chan_dma_disable(struct sprd_mcdt_chan *chan)
 	}
 
 	chan->dma_enable = false;
-	spin_unlock_irqrestore(&mcdt->lock, flags);
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_chan_dma_disable);
 
@@ -868,7 +842,7 @@ struct sprd_mcdt_chan *sprd_mcdt_request_chan(u8 channel,
 {
 	struct sprd_mcdt_chan *temp;
 
-	mutex_lock(&sprd_mcdt_list_mutex);
+	guard(mutex)(&sprd_mcdt_list_mutex);
 
 	list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
 		if (temp->type == type && temp->id == channel) {
@@ -880,8 +854,6 @@ struct sprd_mcdt_chan *sprd_mcdt_request_chan(u8 channel,
 	if (list_entry_is_head(temp, &sprd_mcdt_chan_list, list))
 		temp = NULL;
 
-	mutex_unlock(&sprd_mcdt_list_mutex);
-
 	return temp;
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_request_chan);
@@ -897,17 +869,14 @@ void sprd_mcdt_free_chan(struct sprd_mcdt_chan *chan)
 	sprd_mcdt_chan_dma_disable(chan);
 	sprd_mcdt_chan_int_disable(chan);
 
-	mutex_lock(&sprd_mcdt_list_mutex);
+	guard(mutex)(&sprd_mcdt_list_mutex);
 
 	list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
-		if (temp == chan) {
-			mutex_unlock(&sprd_mcdt_list_mutex);
+		if (temp == chan)
 			return;
-		}
 	}
 
 	list_add_tail(&chan->list, &sprd_mcdt_chan_list);
-	mutex_unlock(&sprd_mcdt_list_mutex);
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_free_chan);
 
@@ -933,9 +902,8 @@ static void sprd_mcdt_init_chans(struct sprd_mcdt_dev *mcdt,
 		chan->mcdt = mcdt;
 		INIT_LIST_HEAD(&chan->list);
 
-		mutex_lock(&sprd_mcdt_list_mutex);
-		list_add_tail(&chan->list, &sprd_mcdt_chan_list);
-		mutex_unlock(&sprd_mcdt_list_mutex);
+		scoped_guard(mutex, &sprd_mcdt_list_mutex)
+			list_add_tail(&chan->list, &sprd_mcdt_chan_list);
 	}
 }
 
@@ -977,12 +945,10 @@ static void sprd_mcdt_remove(struct platform_device *pdev)
 {
 	struct sprd_mcdt_chan *chan, *temp;
 
-	mutex_lock(&sprd_mcdt_list_mutex);
+	guard(mutex)(&sprd_mcdt_list_mutex);
 
 	list_for_each_entry_safe(chan, temp, &sprd_mcdt_chan_list, list)
 		list_del(&chan->list);
-
-	mutex_unlock(&sprd_mcdt_list_mutex);
 }
 
 static const struct of_device_id sprd_mcdt_of_match[] = {
-- 
2.43.0

