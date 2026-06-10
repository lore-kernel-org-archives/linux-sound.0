Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B1D3B95FA
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086849; cv=none; b=PrkyBprghn9Ss5Li69PhktGdzs812udFrKMa96UlrtkOb6nRvbQWD+y4Qxvnvvy6PrWlpe140+5pQVzu7WDOocHtnROmXvcDouuK7aYIt/WlZz5SqlMpv1qB5UnODyOsg2uiN03EoDIT1Yj3zv0prF+ug6PpA0hlwmkTxsqEuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086849; c=relaxed/simple;
	bh=B0H2WtJ5TfN7fCTCPJlxSseEixkQNbFgXQ0JnWUQn/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAfFLbVq4/R8v3OVq1e7So1W7/FrTcB9P7ozu/+o5sIPD+eUwMHFxy+VJid0vNxl4BibvPdB8m7x6vPs7qCLr/0JMf5N3jHR45N+RAScNtwmTSzeYzrsFU0JCSVCMG2+zqZG0mhAe7t2eKUtAm0yahnb041U5qJXV1MCGoKwOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azPn0ung; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azPn0ung"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c2a68d01so44383525ad.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086847; x=1781691647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=;
        b=azPn0ungQd+TkcTijZ6rmGHMZX0vjBfyczP1AiU/rRDqoCPcpLitBBmQ+WUXV+xgUs
         POy4BqUwBEfk7hqtH8ja9HgtocK8yjIAsei/VS+T8AFewQ/Rslt8OFsirZAJQrxF9eQW
         hogSASlzT8Qwwblm44ig4bQUwbhhXh+NOP4Xy4cC9yIrc0IlCbqahE/Vz/+1FLHqFe4A
         cU5Q3pumuAxQu6o7M8+oRre50wbe7HNq+S0ezH0oT1xa5ztPrwLXkPoA7zIohpEHjLXy
         H1mhWKSxp+TNj2mEe7dyCCpubDnaQUzfpUMVqQpN7bNX9ok8QvsXX5aHeFC6YoYyzJjU
         BCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086847; x=1781691647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccE2EB2fnzyeaAU6yY7eDAKmvbXrjVPbtb4CUqU9a2E=;
        b=mmEHCIMdGoCeW/tZYv/moFfdUf5tWrCrXtaOc+0vPmHKP19lkj4/2iyWesUIZYSzCq
         OP7Ttk4N/Aj1KtZdYqpn0kHRK0syIJgrPEL/vIGITvMSCpyviioiOmGYF547Htev+6nu
         RGruI+QkpSF5iYyxA4U/Ng9bD2OdE+67/tW6DUE6RHVmPVgKSpD1GRB3NuJLStnoq3GT
         DwALvP5HhrWuSven4jtJ1QzJi41CWyomw/oVrywjDo5Ituq12i85Aka04OfZNAyJZ/ky
         0s522JgvknfB2nKO11yaa/n9LXPIu2Jv/7qD06rjSf9Eep2wLa6SU1GEcQdhRE7eBmpy
         BvnA==
X-Forwarded-Encrypted: i=1; AFNElJ9saaRYWO7+w0xx8d46MfaOQScuNKuLlNMjaHe/PPNcYiROX2oUs0A6d2ah6Vqo9N5eYg4RFzbJug9G0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytGvWVeEC28T+0rwHHUlkxPZF5aDZljrapJefdEifbwOCYneTJ
	kcYMpgqA0+3d5mSKioRLZkZO918VbA7Qb851xt7iRPQ7LwEh+GHlCZ6wvzRaQg==
X-Gm-Gg: Acq92OG6ZMuC9wFGOTTbPk85FfJz61fqtKcxrXVyf+fmDOgPTdgxE5cqr4lUbZ7HwqW
	RNnNmHsAChVts1BolUASG8gjbmL3sgUpynA2+6C++aNau66BF6d+gbu7LpRjfZwtzZxjSC0yaXv
	tJHAHfDa91TSELDOSyx5fH5qPeHkbntHeQTqxfm75Qj5LIRlsPVxVsuH+YIuw4Dq12faDm3G5H7
	C+b/UcknsahiddmA0eeMXvx6rSbtP0MeGTZ/YAXw/A2T/oUKGdivrnfnQL3pHEOPDd/xSMlRTdg
	iVLItRmTIesURf5AphNnZnqhS2FmwQ0P/hH+S3NmIkyEtg8rZjPccHoiNF0G+XnWJB8ItLPHPXr
	XWMQQ/5aoP6D+LNHEmZqIQyX0fKskszlemkKwZDoDvHStrZkzHd2IySyaOXxQUHXIj2yiVL/Mr5
	FGUmOtIyV13FaG9PiQcjrcVqRE4EibgPMdLt5gul4CSm4/1/W7o7yGjNzDwC8Lioqbu1Av
X-Received: by 2002:a17:903:b0b:b0:2b4:6080:d4d0 with SMTP id d9443c01a7336-2c1e80ec3b7mr273180005ad.22.1781086847357;
        Wed, 10 Jun 2026 03:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/10] ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:13 +0700
Message-ID: <20260610102021.83273-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/common/mtk-btcvsd.c | 81 +++++++++++---------------
 1 file changed, 35 insertions(+), 46 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 5e7e85b4c98a..85cfc602dfd3 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -319,7 +319,6 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 {
 	unsigned int i;
 	unsigned int num_valid_addr;
-	unsigned long flags;
 	enum BT_SCO_BAND band = bt->band;
 
 	/* prepare encoded mute data */
@@ -330,7 +329,7 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 		       table_msbc_silence, SCO_PACKET_180);
 
 	/* write mute data to bt tx sram buffer */
-	spin_lock_irqsave(&bt->tx_lock, flags);
+	guard(spinlock_irqsave)(&bt->tx_lock);
 	num_valid_addr = bt->tx->buffer_info.num_valid_addr;
 
 	dev_info(bt->dev, "%s(), band %d, num_valid_addr %u\n",
@@ -349,7 +348,6 @@ static int btcvsd_tx_clean_buffer(struct mtk_btcvsd_snd *bt)
 					     bt->tx->buffer_info.packet_length,
 					     bt->tx->buffer_info.packet_num);
 	}
-	spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 	return 0;
 }
@@ -365,7 +363,6 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 	int pv;
 	u8 *src;
 	unsigned int packet_buf_ofs;
-	unsigned long flags;
 	unsigned long connsys_addr_rx, ap_addr_rx;
 
 	connsys_addr_rx = *bt->bt_reg_pkt_r;
@@ -385,7 +382,7 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 				     bt->rx->temp_packet_buf, packet_length,
 				     packet_num);
 
-	spin_lock_irqsave(&bt->rx_lock, flags);
+	guard(spinlock_irqsave)(&bt->rx_lock);
 	for (i = 0; i < blk_size; i++) {
 		packet_buf_ofs = (bt->rx->packet_w & SCO_RX_PACKET_MASK) *
 				 bt->rx->packet_size;
@@ -403,7 +400,7 @@ static int mtk_btcvsd_read_from_bt(struct mtk_btcvsd_snd *bt,
 		       SCO_CVSD_PACKET_VALID_SIZE);
 		bt->rx->packet_w++;
 	}
-	spin_unlock_irqrestore(&bt->rx_lock, flags);
+
 	return 0;
 }
 
@@ -414,7 +411,6 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 				  unsigned int blk_size)
 {
 	unsigned int i;
-	unsigned long flags;
 	u8 *dst;
 	unsigned long connsys_addr_tx, ap_addr_tx;
 	bool new_ap_addr_tx = true;
@@ -430,17 +426,17 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 		return -EIO;
 	}
 
-	spin_lock_irqsave(&bt->tx_lock, flags);
-	for (i = 0; i < blk_size; i++) {
-		memcpy(bt->tx->temp_packet_buf + (bt->tx->packet_size * i),
-		       (bt->tx_packet_buf +
-			(bt->tx->packet_r % SCO_TX_PACKER_BUF_NUM) *
-			bt->tx->packet_size),
-		       bt->tx->packet_size);
+	scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+		for (i = 0; i < blk_size; i++) {
+			memcpy(bt->tx->temp_packet_buf + (bt->tx->packet_size * i),
+			       (bt->tx_packet_buf +
+				(bt->tx->packet_r % SCO_TX_PACKER_BUF_NUM) *
+				bt->tx->packet_size),
+			       bt->tx->packet_size);
 
-		bt->tx->packet_r++;
+			bt->tx->packet_r++;
+		}
 	}
-	spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 	dst = (u8 *)ap_addr_tx;
 
@@ -462,11 +458,11 @@ static int mtk_btcvsd_write_to_bt(struct mtk_btcvsd_snd *bt,
 	if (new_ap_addr_tx) {
 		unsigned int next_idx;
 
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		bt->tx->buffer_info.num_valid_addr++;
-		next_idx = bt->tx->buffer_info.num_valid_addr - 1;
-		bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+			bt->tx->buffer_info.num_valid_addr++;
+			next_idx = bt->tx->buffer_info.num_valid_addr - 1;
+			bt->tx->buffer_info.bt_sram_addr[next_idx] = ap_addr_tx;
+		}
 		dev_info(bt->dev, "%s(), new ap_addr_tx = 0x%lx, num_valid_addr %d\n",
 			 __func__, ap_addr_tx,
 			 bt->tx->buffer_info.num_valid_addr);
@@ -701,17 +697,16 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 {
 	ssize_t read_size = 0, read_count = 0, cur_read_idx, cont;
 	unsigned long avail;
-	unsigned long flags;
 	unsigned int packet_size = bt->rx->packet_size;
 
 	while (count) {
-		spin_lock_irqsave(&bt->rx_lock, flags);
-		/* available data in RX packet buffer */
-		avail = (bt->rx->packet_w - bt->rx->packet_r) * packet_size;
+		scoped_guard(spinlock_irqsave, &bt->rx_lock) {
+			/* available data in RX packet buffer */
+			avail = (bt->rx->packet_w - bt->rx->packet_r) * packet_size;
 
-		cur_read_idx = (bt->rx->packet_r & SCO_RX_PACKET_MASK) *
-			       packet_size;
-		spin_unlock_irqrestore(&bt->rx_lock, flags);
+			cur_read_idx = (bt->rx->packet_r & SCO_RX_PACKET_MASK) *
+				       packet_size;
+		}
 
 		if (!avail) {
 			int ret = wait_for_bt_irq(bt, bt->rx);
@@ -749,9 +744,8 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 			return -EFAULT;
 		}
 
-		spin_lock_irqsave(&bt->rx_lock, flags);
-		bt->rx->packet_r += read_size / packet_size;
-		spin_unlock_irqrestore(&bt->rx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->rx_lock)
+			bt->rx->packet_r += read_size / packet_size;
 
 		read_count += read_size;
 		count -= read_size;
@@ -778,7 +772,6 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 				    size_t count)
 {
 	int written_size = count, avail, cur_write_idx, write_size, cont;
-	unsigned long flags;
 	unsigned int packet_size = bt->tx->packet_size;
 
 	/*
@@ -794,14 +787,14 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 	bt->tx->buf_data_equivalent_time *= 1000;
 
 	while (count) {
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		/* free space of TX packet buffer */
-		avail = bt->tx->buf_size -
-			(bt->tx->packet_w - bt->tx->packet_r) * packet_size;
+		scoped_guard(spinlock_irqsave, &bt->tx_lock) {
+			/* free space of TX packet buffer */
+			avail = bt->tx->buf_size -
+				(bt->tx->packet_w - bt->tx->packet_r) * packet_size;
 
-		cur_write_idx = (bt->tx->packet_w % SCO_TX_PACKER_BUF_NUM) *
-				packet_size;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+			cur_write_idx = (bt->tx->packet_w % SCO_TX_PACKER_BUF_NUM) *
+					packet_size;
+		}
 
 		if (!avail) {
 			int ret = wait_for_bt_irq(bt, bt->tx);
@@ -838,9 +831,8 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 			return -EFAULT;
 		}
 
-		spin_lock_irqsave(&bt->tx_lock, flags);
-		bt->tx->packet_w += write_size / packet_size;
-		spin_unlock_irqrestore(&bt->tx_lock, flags);
+		scoped_guard(spinlock_irqsave, &bt->tx_lock)
+			bt->tx->packet_w += write_size / packet_size;
 		count -= write_size;
 	}
 
@@ -985,7 +977,6 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 	int hw_packet_ptr;
 	int packet_diff;
 	spinlock_t *lock;	/* spinlock for bt stream control */
-	unsigned long flags;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		lock = &bt->tx_lock;
@@ -995,7 +986,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 		bt_stream = bt->rx;
 	}
 
-	spin_lock_irqsave(lock, flags);
+	guard(spinlock_irqsave)(lock);
 	hw_packet_ptr = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
 			bt->tx->packet_r : bt->rx->packet_w;
 
@@ -1018,8 +1009,6 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 
 	bt_stream->prev_frame = frame;
 
-	spin_unlock_irqrestore(lock, flags);
-
 	return frame;
 }
 
-- 
2.43.0

