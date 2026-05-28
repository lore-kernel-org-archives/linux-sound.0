Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7B3D45C1
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965963; cv=none; b=Y/LN4BtVVWJpKzyMWJEv7+bkMvyKQlkHvii/JdNF02P9Qi2aGDw34Qn4S5+/+e4jmDxv+0lMTjfNUcNsqNhjvO7nKzS4Wa/obtG70jdkdzuuddU0WVITJGvQZRoJvNf5qI9iIhwh7zCDjd3kTtuUp7jhBAyqHFKarodiPEReDJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965963; c=relaxed/simple;
	bh=3Zua4RCmYJ34oNzpMPtTfhr8n1U3jN+c547U0+6tIUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRA/C6bI2I1b4Kp8Li+PSnr1G0eOWzLUWa5I88z5rebpI3+yVtqlOUGM6rgmXA++wUDmMPuyYycmo5NcZ22Rqkk7xHNDtE8KFEAprymWR0bV0OZOWVbANnVKb/AcNTfT8Q7+7JNO8TgrbjSdiG6pWzun5RsU7mjtp7BTGjypxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZL+LZ23K; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZL+LZ23K"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso6409330b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779965961; x=1780570761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9GtZ/1jAN0sq6WOw+nN4//CWKo4AvfhwojBeLqQo18=;
        b=ZL+LZ23KLz0efqx+b6a2LqWuxPSzEGsKIkbL1R5Ix6dVAOmMx+Z0BtsGaHnIDFkUrz
         MARxXxHhkhERgE1SOUJTGIZ1pJXHZI+F06AmCZxA11KlCG7kl6O6laxPbjpdCy6hq2X2
         lv7PdceJHF1Zuem/VcJvmFQpyFJliUvxnkXmdQG3qyeMGqpcHWyS3Lxv3fcLw+V6QC55
         il/V1rlSxPWQO37kNITOQ/i4RR2O224w4j+ahUImdbcMIPptwsxahwvWeWnNpGapS0bv
         Hu5Zi3o624mMAjagugW+Q9x90xyMmvxfBrpzcvaEIYjWtQ3aSJb4JVDil0ESWTMdblRH
         uNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965961; x=1780570761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9GtZ/1jAN0sq6WOw+nN4//CWKo4AvfhwojBeLqQo18=;
        b=e/1RFQYT3dXoKhhMm0UVtxCAPOp4YQce8s3J3JTzFDK0rdlZo91iFowZx1skZIM0Zj
         tgwh17t6ueCuXMiZ6/rIgOcCFC4olGpDxjOcwcT8ZeSs797xPGppo/9l7NwSpfo42JWl
         oCfN2KbXiaJyT3eJfIdgaBwX4FipVQvSx+r33u7OT7wAxgTduE7YNirD+ecO+oKJDkvM
         LELkTDP2KeZQBN1rNQFFa0792uZAlALFBwiFm4vR9ok5/vEyzQaWOv/HgMcROjM6CVSg
         HPGv6fkzbdHyRCk04bxw4dO56NNS3Y57lYEmjeRE7Gf14dOmuiCTu1UwqAD/w8V2aEg7
         7PuQ==
X-Forwarded-Encrypted: i=1; AFNElJ996iZus2KZ5KdLIV9t5HSIQ6gTzC8EIYQeVRs9adEfn2uMJvwN6hfioE2r7eQwiN6KrU9fq4qL9Kqeaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysodbZxHaQed5cLbzj9O+JBJvZLUotoOWNg9t8W4/QuurborP8
	nILemUnnt8G7b07FCcC5pBmRgPTNNLg/fNY06HKUkqLq+vLDo1yVcLbf
X-Gm-Gg: Acq92OGUIFK+auWb/cPmWR/6JwKoCq31FdaYRXUR2ILpZk4L2nh4VOBFIHoI0SU/PU6
	9Gaa1H3Ff+qCmJUjDvOG7Ge0lwWjK+ZFqmo0t4qX2IbLw6++C+d/R5dzhass8ugxcmAPPVljvvJ
	WcKpxjoE/4I7Y3jtb6iME5h0tkjXitTzYJ6K+3nXADcO17AAT2um1VVV5y2v6k0TXtW6f38aHD8
	dG5/7p9P6cG5R17uglYhHvpU393+mzdIjLNhw8TWn8odTUucm9/8DPCP5vMAn+gQquE6zB5RSzX
	scIpDRi1yvY5IRQbOmjs3SdSiJxjtMKtq381XkDEZhmulBczbnZ45zDVHdQC5CRFhvWZbd2WbEx
	K0uafGPlLJJOrl9KpjVqxJGjmW0+UQgVbGOWCxEKqYAn/A9bg2x3Xa6WZf02P8qsSFA4fAWxgQb
	TrKdQYCdcuJebzqZoWjPkNzRG+8kIuROGswf6e0gJ4LeIc4Alwo+NSOHZuT4iKnf0hiVhA
X-Received: by 2002:a05:6a00:4206:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841fe62fc7fmr949345b3a.26.1779965961009;
        Thu, 28 May 2026 03:59:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7301255sm5248646b3a.57.2026.05.28.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:59:20 -0700 (PDT)
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
Subject: [PATCH] ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks
Date: Thu, 28 May 2026 17:59:00 +0700
Message-ID: <20260528105900.85604-1-phucduc.bui@gmail.com>
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

Compile-tested only.

 sound/soc/sprd/sprd-mcdt.c | 62 +++++++++-----------------------------
 1 file changed, 15 insertions(+), 47 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index 814a1cde1d35..f78751d58f7f 100644
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
@@ -897,7 +869,7 @@ void sprd_mcdt_free_chan(struct sprd_mcdt_chan *chan)
 	sprd_mcdt_chan_dma_disable(chan);
 	sprd_mcdt_chan_int_disable(chan);
 
-	mutex_lock(&sprd_mcdt_list_mutex);
+	guard(mutex)(&sprd_mcdt_list_mutex);
 
 	list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
 		if (temp == chan) {
@@ -907,7 +879,6 @@ void sprd_mcdt_free_chan(struct sprd_mcdt_chan *chan)
 	}
 
 	list_add_tail(&chan->list, &sprd_mcdt_chan_list);
-	mutex_unlock(&sprd_mcdt_list_mutex);
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_free_chan);
 
@@ -933,9 +904,8 @@ static void sprd_mcdt_init_chans(struct sprd_mcdt_dev *mcdt,
 		chan->mcdt = mcdt;
 		INIT_LIST_HEAD(&chan->list);
 
-		mutex_lock(&sprd_mcdt_list_mutex);
-		list_add_tail(&chan->list, &sprd_mcdt_chan_list);
-		mutex_unlock(&sprd_mcdt_list_mutex);
+		scoped_guard(mutex, &sprd_mcdt_list_mutex)
+			list_add_tail(&chan->list, &sprd_mcdt_chan_list);
 	}
 }
 
@@ -977,12 +947,10 @@ static void sprd_mcdt_remove(struct platform_device *pdev)
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

