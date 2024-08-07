Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21C1EB4AD
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037668; cv=none; b=V8P/vjMB56ywYEScfNRYsF2tm8npm1okAUFtIHtofTcnWgR/rKCeJ0wo5dwIgY7NwklzFbl6P9BO/ibVYWXKCYPCxaQRWj4RCP2vIk4hY1IEkhSHIyj5FSOJqGN61wxuaOhtJdhE/VjM/eW6p+wtVEFIlWHKjAh4iZFOPW9HNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037668; c=relaxed/simple;
	bh=E3VUKDGRq0fN3b9E08uG0ALH8fNaMf8vya3RWKqtZjU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahl5Q6GqKbl7bYxdO2vibJfEUz/jv5wIIxFYQw5GFQcnssKQKPAju3C3Qd3P24s8xoc3TeytPdUjHI+8IxTFnfodyWa0QFM1R1drjeFmxrTS0zKtDsed/cdFtTfrnWyeQSHl6DT1hDTzPAzUykB+qAZrM58ISLGuDTqpzMcN2s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hzx2DC+O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xUJkWtNM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hzx2DC+O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xUJkWtNM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hzx2DC+O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xUJkWtNM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hzx2DC+O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xUJkWtNM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44F9921D23;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhXImX7lXa/QUr5TYRo4Xx16dXK7vnXemXN9EmtUlys=;
	b=hzx2DC+OxsL5/F2rPyIXfjWL8Ik684SLB420kHgWsFC1UwOI9PeEGGvU5RXgBpjKj5//1m
	Rzg73cZRjBkDxxZE9iQM1sREGq9VWaDqX3fckjQUrsVmdAouD0du3tXSXU9ddCZTsc7ds/
	ewPyEw/0VqKtimZKB1u2w/o10s4KODw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhXImX7lXa/QUr5TYRo4Xx16dXK7vnXemXN9EmtUlys=;
	b=xUJkWtNMUHa56x/F0ikDNa7wpUG3Z5M9H5fRDwc3s/y+vK80Dd+plSuHYr6HkgDTqjrrf7
	Guyb1jFm9Lyto1Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hzx2DC+O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xUJkWtNM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhXImX7lXa/QUr5TYRo4Xx16dXK7vnXemXN9EmtUlys=;
	b=hzx2DC+OxsL5/F2rPyIXfjWL8Ik684SLB420kHgWsFC1UwOI9PeEGGvU5RXgBpjKj5//1m
	Rzg73cZRjBkDxxZE9iQM1sREGq9VWaDqX3fckjQUrsVmdAouD0du3tXSXU9ddCZTsc7ds/
	ewPyEw/0VqKtimZKB1u2w/o10s4KODw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WhXImX7lXa/QUr5TYRo4Xx16dXK7vnXemXN9EmtUlys=;
	b=xUJkWtNMUHa56x/F0ikDNa7wpUG3Z5M9H5fRDwc3s/y+vK80Dd+plSuHYr6HkgDTqjrrf7
	Guyb1jFm9Lyto1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21C5113B03;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4C7WBtx3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 26/54] ALSA: gus: Use standard print API
Date: Wed,  7 Aug 2024 15:34:16 +0200
Message-ID: <20240807133452.9424-27-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 44F9921D23
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Some commented-out debug prints and dead code are dropped as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_dma.c    |  37 ++++---
 sound/isa/gus/gus_io.c     | 215 +++++++++++++++++++++++++------------
 sound/isa/gus/gus_irq.c    |   7 +-
 sound/isa/gus/gus_main.c   |  29 ++---
 sound/isa/gus/gus_mem.c    |   2 +-
 sound/isa/gus/gus_pcm.c    |  33 ++----
 sound/isa/gus/gus_reset.c  |   8 +-
 sound/isa/gus/gus_uart.c   |  21 ++--
 sound/isa/gus/gus_volume.c |   7 +-
 sound/isa/gus/gusclassic.c |   4 +-
 sound/isa/gus/gusextreme.c |   4 +-
 sound/isa/gus/gusmax.c     |  16 ++-
 sound/isa/gus/interwave.c  |  61 ++++++-----
 13 files changed, 266 insertions(+), 178 deletions(-)

diff --git a/sound/isa/gus/gus_dma.c b/sound/isa/gus/gus_dma.c
index 6d664dd8dde0..bb5a4e2fbfb3 100644
--- a/sound/isa/gus/gus_dma.c
+++ b/sound/isa/gus/gus_dma.c
@@ -30,15 +30,18 @@ static void snd_gf1_dma_program(struct snd_gus_card * gus,
 	unsigned char dma_cmd;
 	unsigned int address_high;
 
-	snd_printdd("dma_transfer: addr=0x%x, buf=0x%lx, count=0x%x\n",
-		    addr, buf_addr, count);
+	dev_dbg(gus->card->dev,
+		"dma_transfer: addr=0x%x, buf=0x%lx, count=0x%x\n",
+		addr, buf_addr, count);
 
 	if (gus->gf1.dma1 > 3) {
 		if (gus->gf1.enh_mode) {
 			address = addr >> 1;
 		} else {
 			if (addr & 0x1f) {
-				snd_printd("snd_gf1_dma_transfer: unaligned address (0x%x)?\n", addr);
+				dev_dbg(gus->card->dev,
+					"%s: unaligned address (0x%x)?\n",
+					__func__, addr);
 				return;
 			}
 			address = (addr & 0x000c0000) | ((addr & 0x0003ffff) >> 1);
@@ -63,8 +66,9 @@ static void snd_gf1_dma_program(struct snd_gus_card * gus,
 	snd_gf1_dma_ack(gus);
 	snd_dma_program(gus->gf1.dma1, buf_addr, count, dma_cmd & SNDRV_GF1_DMA_READ ? DMA_MODE_READ : DMA_MODE_WRITE);
 #if 0
-	snd_printk(KERN_DEBUG "address = 0x%x, count = 0x%x, dma_cmd = 0x%x\n",
-		   address << 1, count, dma_cmd);
+	dev_dbg(gus->card->dev,
+		"address = 0x%x, count = 0x%x, dma_cmd = 0x%x\n",
+		address << 1, count, dma_cmd);
 #endif
 	spin_lock_irqsave(&gus->reg_lock, flags);
 	if (gus->gf1.enh_mode) {
@@ -131,9 +135,9 @@ static void snd_gf1_dma_interrupt(struct snd_gus_card * gus)
 	snd_gf1_dma_program(gus, block->addr, block->buf_addr, block->count, (unsigned short) block->cmd);
 	kfree(block);
 #if 0
-	snd_printd(KERN_DEBUG "program dma (IRQ) - "
-		   "addr = 0x%x, buffer = 0x%lx, count = 0x%x, cmd = 0x%x\n",
-		   block->addr, block->buf_addr, block->count, block->cmd);
+	dev_dbg(gus->card->dev,
+		"program dma (IRQ) - addr = 0x%x, buffer = 0x%lx, count = 0x%x, cmd = 0x%x\n",
+		block->addr, block->buf_addr, block->count, block->cmd);
 #endif
 }
 
@@ -194,14 +198,17 @@ int snd_gf1_dma_transfer_block(struct snd_gus_card * gus,
 	*block = *__block;
 	block->next = NULL;
 
-	snd_printdd("addr = 0x%x, buffer = 0x%lx, count = 0x%x, cmd = 0x%x\n",
-		    block->addr, (long) block->buffer, block->count,
-		    block->cmd);
+	dev_dbg(gus->card->dev,
+		"addr = 0x%x, buffer = 0x%lx, count = 0x%x, cmd = 0x%x\n",
+		block->addr, (long) block->buffer, block->count,
+		block->cmd);
 
-	snd_printdd("gus->gf1.dma_data_pcm_last = 0x%lx\n",
-		    (long)gus->gf1.dma_data_pcm_last);
-	snd_printdd("gus->gf1.dma_data_pcm = 0x%lx\n",
-		    (long)gus->gf1.dma_data_pcm);
+	dev_dbg(gus->card->dev,
+		"gus->gf1.dma_data_pcm_last = 0x%lx\n",
+		(long)gus->gf1.dma_data_pcm_last);
+	dev_dbg(gus->card->dev,
+		"gus->gf1.dma_data_pcm = 0x%lx\n",
+		(long)gus->gf1.dma_data_pcm);
 
 	spin_lock_irqsave(&gus->dma_lock, flags);
 	if (synth) {
diff --git a/sound/isa/gus/gus_io.c b/sound/isa/gus/gus_io.c
index fb7b5e2636b8..1dc9e0edb3d9 100644
--- a/sound/isa/gus/gus_io.c
+++ b/sound/isa/gus/gus_io.c
@@ -325,10 +325,8 @@ void snd_gf1_pokew(struct snd_gus_card * gus, unsigned int addr, unsigned short
 {
 	unsigned long flags;
 
-#ifdef CONFIG_SND_DEBUG
 	if (!gus->interwave)
-		snd_printk(KERN_DEBUG "snd_gf1_pokew - GF1!!!\n");
-#endif
+		dev_dbg(gus->card->dev, "%s - GF1!!!\n", __func__);
 	spin_lock_irqsave(&gus->reg_lock, flags);
 	outb(SNDRV_GF1_GW_DRAM_IO_LOW, gus->gf1.reg_regsel);
 	mb();
@@ -349,10 +347,8 @@ unsigned short snd_gf1_peekw(struct snd_gus_card * gus, unsigned int addr)
 	unsigned long flags;
 	unsigned short res;
 
-#ifdef CONFIG_SND_DEBUG
 	if (!gus->interwave)
-		snd_printk(KERN_DEBUG "snd_gf1_peekw - GF1!!!\n");
-#endif
+		dev_dbg(gus->card->dev, "%s - GF1!!!\n", __func__);
 	spin_lock_irqsave(&gus->reg_lock, flags);
 	outb(SNDRV_GF1_GW_DRAM_IO_LOW, gus->gf1.reg_regsel);
 	mb();
@@ -375,10 +371,8 @@ void snd_gf1_dram_setmem(struct snd_gus_card * gus, unsigned int addr,
 	unsigned long port;
 	unsigned long flags;
 
-#ifdef CONFIG_SND_DEBUG
 	if (!gus->interwave)
-		snd_printk(KERN_DEBUG "snd_gf1_dram_setmem - GF1!!!\n");
-#endif
+		dev_dbg(gus->card->dev, "%s - GF1!!!\n", __func__);
 	addr &= ~1;
 	count >>= 1;
 	port = GUSP(gus, GF1DATALOW);
@@ -433,30 +427,73 @@ void snd_gf1_print_voice_registers(struct snd_gus_card * gus)
 	int voice, ctrl;
 
 	voice = gus->gf1.active_voice;
-	printk(KERN_INFO " -%i- GF1  voice ctrl, ramp ctrl  = 0x%x, 0x%x\n", voice, ctrl = snd_gf1_i_read8(gus, 0), snd_gf1_i_read8(gus, 0x0d));
-	printk(KERN_INFO " -%i- GF1  frequency              = 0x%x\n", voice, snd_gf1_i_read16(gus, 1));
-	printk(KERN_INFO " -%i- GF1  loop start, end        = 0x%x (0x%x), 0x%x (0x%x)\n", voice, snd_gf1_i_read_addr(gus, 2, ctrl & 4), snd_gf1_i_read_addr(gus, 2, (ctrl & 4) ^ 4), snd_gf1_i_read_addr(gus, 4, ctrl & 4), snd_gf1_i_read_addr(gus, 4, (ctrl & 4) ^ 4));
-	printk(KERN_INFO " -%i- GF1  ramp start, end, rate  = 0x%x, 0x%x, 0x%x\n", voice, snd_gf1_i_read8(gus, 7), snd_gf1_i_read8(gus, 8), snd_gf1_i_read8(gus, 6));
-	printk(KERN_INFO" -%i- GF1  volume                 = 0x%x\n", voice, snd_gf1_i_read16(gus, 9));
-	printk(KERN_INFO " -%i- GF1  position               = 0x%x (0x%x)\n", voice, snd_gf1_i_read_addr(gus, 0x0a, ctrl & 4), snd_gf1_i_read_addr(gus, 0x0a, (ctrl & 4) ^ 4));
+	dev_info(gus->card->dev,
+		 " -%i- GF1  voice ctrl, ramp ctrl  = 0x%x, 0x%x\n",
+		 voice, ctrl = snd_gf1_i_read8(gus, 0), snd_gf1_i_read8(gus, 0x0d));
+	dev_info(gus->card->dev,
+		 " -%i- GF1  frequency              = 0x%x\n",
+		 voice, snd_gf1_i_read16(gus, 1));
+	dev_info(gus->card->dev,
+		 " -%i- GF1  loop start, end        = 0x%x (0x%x), 0x%x (0x%x)\n",
+		 voice, snd_gf1_i_read_addr(gus, 2, ctrl & 4),
+		 snd_gf1_i_read_addr(gus, 2, (ctrl & 4) ^ 4),
+		 snd_gf1_i_read_addr(gus, 4, ctrl & 4),
+		 snd_gf1_i_read_addr(gus, 4, (ctrl & 4) ^ 4));
+	dev_info(gus->card->dev,
+		 " -%i- GF1  ramp start, end, rate  = 0x%x, 0x%x, 0x%x\n",
+		 voice, snd_gf1_i_read8(gus, 7), snd_gf1_i_read8(gus, 8),
+		 snd_gf1_i_read8(gus, 6));
+	dev_info(gus->card->dev,
+		 " -%i- GF1  volume                 = 0x%x\n",
+		 voice, snd_gf1_i_read16(gus, 9));
+	dev_info(gus->card->dev,
+		 " -%i- GF1  position               = 0x%x (0x%x)\n",
+		 voice, snd_gf1_i_read_addr(gus, 0x0a, ctrl & 4),
+		 snd_gf1_i_read_addr(gus, 0x0a, (ctrl & 4) ^ 4));
 	if (gus->interwave && snd_gf1_i_read8(gus, 0x19) & 0x01) {	/* enhanced mode */
 		mode = snd_gf1_i_read8(gus, 0x15);
-		printk(KERN_INFO " -%i- GFA1 mode                   = 0x%x\n", voice, mode);
+		dev_info(gus->card->dev,
+			 " -%i- GFA1 mode                   = 0x%x\n",
+			 voice, mode);
 		if (mode & 0x01) {	/* Effect processor */
-			printk(KERN_INFO " -%i- GFA1 effect address         = 0x%x\n", voice, snd_gf1_i_read_addr(gus, 0x11, ctrl & 4));
-			printk(KERN_INFO " -%i- GFA1 effect volume          = 0x%x\n", voice, snd_gf1_i_read16(gus, 0x16));
-			printk(KERN_INFO " -%i- GFA1 effect volume final    = 0x%x\n", voice, snd_gf1_i_read16(gus, 0x1d));
-			printk(KERN_INFO " -%i- GFA1 effect accumulator     = 0x%x\n", voice, snd_gf1_i_read8(gus, 0x14));
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 effect address         = 0x%x\n",
+				 voice, snd_gf1_i_read_addr(gus, 0x11, ctrl & 4));
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 effect volume          = 0x%x\n",
+				 voice, snd_gf1_i_read16(gus, 0x16));
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 effect volume final    = 0x%x\n",
+				 voice, snd_gf1_i_read16(gus, 0x1d));
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 effect accumulator     = 0x%x\n",
+				 voice, snd_gf1_i_read8(gus, 0x14));
 		}
 		if (mode & 0x20) {
-			printk(KERN_INFO " -%i- GFA1 left offset            = 0x%x (%i)\n", voice, snd_gf1_i_read16(gus, 0x13), snd_gf1_i_read16(gus, 0x13) >> 4);
-			printk(KERN_INFO " -%i- GFA1 left offset final      = 0x%x (%i)\n", voice, snd_gf1_i_read16(gus, 0x1c), snd_gf1_i_read16(gus, 0x1c) >> 4);
-			printk(KERN_INFO " -%i- GFA1 right offset           = 0x%x (%i)\n", voice, snd_gf1_i_read16(gus, 0x0c), snd_gf1_i_read16(gus, 0x0c) >> 4);
-			printk(KERN_INFO " -%i- GFA1 right offset final     = 0x%x (%i)\n", voice, snd_gf1_i_read16(gus, 0x1b), snd_gf1_i_read16(gus, 0x1b) >> 4);
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 left offset            = 0x%x (%i)\n",
+				 voice, snd_gf1_i_read16(gus, 0x13),
+				 snd_gf1_i_read16(gus, 0x13) >> 4);
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 left offset final      = 0x%x (%i)\n",
+				 voice, snd_gf1_i_read16(gus, 0x1c),
+				 snd_gf1_i_read16(gus, 0x1c) >> 4);
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 right offset           = 0x%x (%i)\n",
+				 voice, snd_gf1_i_read16(gus, 0x0c),
+				 snd_gf1_i_read16(gus, 0x0c) >> 4);
+			dev_info(gus->card->dev,
+				 " -%i- GFA1 right offset final     = 0x%x (%i)\n",
+				 voice, snd_gf1_i_read16(gus, 0x1b),
+				 snd_gf1_i_read16(gus, 0x1b) >> 4);
 		} else
-			printk(KERN_INFO " -%i- GF1  pan                    = 0x%x\n", voice, snd_gf1_i_read8(gus, 0x0c));
+			dev_info(gus->card->dev,
+				 " -%i- GF1  pan                    = 0x%x\n",
+				 voice, snd_gf1_i_read8(gus, 0x0c));
 	} else
-		printk(KERN_INFO " -%i- GF1  pan                    = 0x%x\n", voice, snd_gf1_i_read8(gus, 0x0c));
+		dev_info(gus->card->dev,
+			 " -%i- GF1  pan                    = 0x%x\n",
+			 voice, snd_gf1_i_read8(gus, 0x0c));
 }
 
 #if 0
@@ -465,61 +502,105 @@ void snd_gf1_print_global_registers(struct snd_gus_card * gus)
 {
 	unsigned char global_mode = 0x00;
 
-	printk(KERN_INFO " -G- GF1 active voices            = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_ACTIVE_VOICES));
+	dev_info(gus->card->dev,
+		 " -G- GF1 active voices            = 0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_ACTIVE_VOICES));
 	if (gus->interwave) {
 		global_mode = snd_gf1_i_read8(gus, SNDRV_GF1_GB_GLOBAL_MODE);
-		printk(KERN_INFO " -G- GF1 global mode              = 0x%x\n", global_mode);
+		dev_info(gus->card->dev,
+			 " -G- GF1 global mode              = 0x%x\n",
+			 global_mode);
 	}
 	if (global_mode & 0x02)	/* LFO enabled? */
-		printk(KERN_INFO " -G- GF1 LFO base                 = 0x%x\n", snd_gf1_i_look16(gus, SNDRV_GF1_GW_LFO_BASE));
-	printk(KERN_INFO " -G- GF1 voices IRQ read          = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_VOICES_IRQ_READ));
-	printk(KERN_INFO " -G- GF1 DRAM DMA control         = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_DMA_CONTROL));
-	printk(KERN_INFO " -G- GF1 DRAM DMA high/low        = 0x%x/0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_DMA_HIGH), snd_gf1_i_read16(gus, SNDRV_GF1_GW_DRAM_DMA_LOW));
-	printk(KERN_INFO " -G- GF1 DRAM IO high/low         = 0x%x/0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_IO_HIGH), snd_gf1_i_read16(gus, SNDRV_GF1_GW_DRAM_IO_LOW));
+		dev_info(gus->card->dev,
+			 " -G- GF1 LFO base                 = 0x%x\n",
+			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_LFO_BASE));
+	dev_info(gus->card->dev,
+		 " -G- GF1 voices IRQ read          = 0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_VOICES_IRQ_READ));
+	dev_info(gus->card->dev,
+		 " -G- GF1 DRAM DMA control         = 0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_DMA_CONTROL));
+	dev_info(gus->card->dev,
+		 " -G- GF1 DRAM DMA high/low        = 0x%x/0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_DMA_HIGH),
+		 snd_gf1_i_read16(gus, SNDRV_GF1_GW_DRAM_DMA_LOW));
+	dev_info(gus->card->dev,
+		 " -G- GF1 DRAM IO high/low         = 0x%x/0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_IO_HIGH),
+		 snd_gf1_i_read16(gus, SNDRV_GF1_GW_DRAM_IO_LOW));
 	if (!gus->interwave)
-		printk(KERN_INFO " -G- GF1 record DMA control       = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_REC_DMA_CONTROL));
-	printk(KERN_INFO " -G- GF1 DRAM IO 16               = 0x%x\n", snd_gf1_i_look16(gus, SNDRV_GF1_GW_DRAM_IO16));
+		dev_info(gus->card->dev,
+			 " -G- GF1 record DMA control       = 0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_REC_DMA_CONTROL));
+	dev_info(gus->card->dev,
+		 " -G- GF1 DRAM IO 16               = 0x%x\n",
+		 snd_gf1_i_look16(gus, SNDRV_GF1_GW_DRAM_IO16));
 	if (gus->gf1.enh_mode) {
-		printk(KERN_INFO " -G- GFA1 memory config           = 0x%x\n", snd_gf1_i_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG));
-		printk(KERN_INFO " -G- GFA1 memory control          = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_MEMORY_CONTROL));
-		printk(KERN_INFO " -G- GFA1 FIFO record base        = 0x%x\n", snd_gf1_i_look16(gus, SNDRV_GF1_GW_FIFO_RECORD_BASE_ADDR));
-		printk(KERN_INFO " -G- GFA1 FIFO playback base      = 0x%x\n", snd_gf1_i_look16(gus, SNDRV_GF1_GW_FIFO_PLAY_BASE_ADDR));
-		printk(KERN_INFO " -G- GFA1 interleave control      = 0x%x\n", snd_gf1_i_look16(gus, SNDRV_GF1_GW_INTERLEAVE));
+		dev_info(gus->card->dev,
+			 " -G- GFA1 memory config           = 0x%x\n",
+			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG));
+		dev_info(gus->card->dev,
+			 " -G- GFA1 memory control          = 0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_MEMORY_CONTROL));
+		dev_info(gus->card->dev,
+			 " -G- GFA1 FIFO record base        = 0x%x\n",
+			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_FIFO_RECORD_BASE_ADDR));
+		dev_info(gus->card->dev,
+			 " -G- GFA1 FIFO playback base      = 0x%x\n",
+			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_FIFO_PLAY_BASE_ADDR));
+		dev_info(gus->card->dev,
+			 " -G- GFA1 interleave control      = 0x%x\n",
+			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_INTERLEAVE));
 	}
 }
 
 void snd_gf1_print_setup_registers(struct snd_gus_card * gus)
 {
-	printk(KERN_INFO " -S- mix control                  = 0x%x\n", inb(GUSP(gus, MIXCNTRLREG)));
-	printk(KERN_INFO " -S- IRQ status                   = 0x%x\n", inb(GUSP(gus, IRQSTAT)));
-	printk(KERN_INFO " -S- timer control                = 0x%x\n", inb(GUSP(gus, TIMERCNTRL)));
-	printk(KERN_INFO " -S- timer data                   = 0x%x\n", inb(GUSP(gus, TIMERDATA)));
-	printk(KERN_INFO " -S- status read                  = 0x%x\n", inb(GUSP(gus, REGCNTRLS)));
-	printk(KERN_INFO " -S- Sound Blaster control        = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_SOUND_BLASTER_CONTROL));
-	printk(KERN_INFO " -S- AdLib timer 1/2              = 0x%x/0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_ADLIB_TIMER_1), snd_gf1_i_look8(gus, SNDRV_GF1_GB_ADLIB_TIMER_2));
-	printk(KERN_INFO " -S- reset                        = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET));
+	dev_info(gus->card->dev,
+		 " -S- mix control                  = 0x%x\n",
+		 inb(GUSP(gus, MIXCNTRLREG)));
+	dev_info(gus->card->dev,
+		 " -S- IRQ status                   = 0x%x\n",
+		 inb(GUSP(gus, IRQSTAT)));
+	dev_info(gus->card->dev,
+		 " -S- timer control                = 0x%x\n",
+		 inb(GUSP(gus, TIMERCNTRL)));
+	dev_info(gus->card->dev,
+		 " -S- timer data                   = 0x%x\n",
+		 inb(GUSP(gus, TIMERDATA)));
+	dev_info(gus->card->dev,
+		 " -S- status read                  = 0x%x\n",
+		 inb(GUSP(gus, REGCNTRLS)));
+	dev_info(gus->card->dev,
+		 " -S- Sound Blaster control        = 0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_SOUND_BLASTER_CONTROL));
+	dev_info(gus->card->dev,
+		 " -S- AdLib timer 1/2              = 0x%x/0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_ADLIB_TIMER_1),
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_ADLIB_TIMER_2));
+	dev_info(gus->card->dev,
+		 " -S- reset                        = 0x%x\n",
+		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET));
 	if (gus->interwave) {
-		printk(KERN_INFO " -S- compatibility                = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_COMPATIBILITY));
-		printk(KERN_INFO " -S- decode control               = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_DECODE_CONTROL));
-		printk(KERN_INFO " -S- version number               = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_VERSION_NUMBER));
-		printk(KERN_INFO " -S- MPU-401 emul. control A/B    = 0x%x/0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_MPU401_CONTROL_A), snd_gf1_i_look8(gus, SNDRV_GF1_GB_MPU401_CONTROL_B));
-		printk(KERN_INFO " -S- emulation IRQ                = 0x%x\n", snd_gf1_i_look8(gus, SNDRV_GF1_GB_EMULATION_IRQ));
+		dev_info(gus->card->dev,
+			 " -S- compatibility                = 0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_COMPATIBILITY));
+		dev_info(gus->card->dev,
+			 " -S- decode control               = 0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DECODE_CONTROL));
+		dev_info(gus->card->dev,
+			 " -S- version number               = 0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_VERSION_NUMBER));
+		dev_info(gus->card->dev,
+			 " -S- MPU-401 emul. control A/B    = 0x%x/0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_MPU401_CONTROL_A),
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_MPU401_CONTROL_B));
+		dev_info(gus->card->dev,
+			 " -S- emulation IRQ                = 0x%x\n",
+			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_EMULATION_IRQ));
 	}
 }
-
-void snd_gf1_peek_print_block(struct snd_gus_card * gus, unsigned int addr, int count, int w_16bit)
-{
-	if (!w_16bit) {
-		while (count-- > 0)
-			printk(count > 0 ? "%02x:" : "%02x", snd_gf1_peek(gus, addr++));
-	} else {
-		while (count-- > 0) {
-			printk(count > 0 ? "%04x:" : "%04x", snd_gf1_peek(gus, addr) | (snd_gf1_peek(gus, addr + 1) << 8));
-			addr += 2;
-		}
-	}
-}
-
 #endif  /*  0  */
 
 #endif
diff --git a/sound/isa/gus/gus_irq.c b/sound/isa/gus/gus_irq.c
index 226b8438aa70..0e1054402c91 100644
--- a/sound/isa/gus/gus_irq.c
+++ b/sound/isa/gus/gus_irq.c
@@ -26,7 +26,6 @@ irqreturn_t snd_gus_interrupt(int irq, void *dev_id)
 	if (status == 0)
 		return IRQ_RETVAL(handled);
 	handled = 1;
-	/* snd_printk(KERN_DEBUG "IRQ: status = 0x%x\n", status); */
 	if (status & 0x02) {
 		STAT_ADD(gus->gf1.interrupt_stat_midi_in);
 		if (gus->gf1.interrupt_handler_midi_in)
@@ -50,9 +49,9 @@ irqreturn_t snd_gus_interrupt(int irq, void *dev_id)
 				continue;	/* multi request */
 			already |= _current_;	/* mark request */
 #if 0
-			printk(KERN_DEBUG "voice = %i, voice_status = 0x%x, "
-			       "voice_verify = %i\n",
-			       voice, voice_status, inb(GUSP(gus, GF1PAGE)));
+			dev_dbg(gus->card->dev,
+				"voice = %i, voice_status = 0x%x, voice_verify = %i\n",
+				voice, voice_status, inb(GUSP(gus, GF1PAGE)));
 #endif
 			pvoice = &gus->gf1.voices[voice]; 
 			if (pvoice->use) {
diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index 3b46490271fe..51ce405eba7a 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -158,32 +158,32 @@ int snd_gus_create(struct snd_card *card,
 	/* allocate resources */
 	gus->gf1.res_port1 = request_region(port, 16, "GUS GF1 (Adlib/SB)");
 	if (!gus->gf1.res_port1) {
-		snd_printk(KERN_ERR "gus: can't grab SB port 0x%lx\n", port);
+		dev_err(card->dev, "gus: can't grab SB port 0x%lx\n", port);
 		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.res_port2 = request_region(port + 0x100, 12, "GUS GF1 (Synth)");
 	if (!gus->gf1.res_port2) {
-		snd_printk(KERN_ERR "gus: can't grab synth port 0x%lx\n", port + 0x100);
+		dev_err(card->dev, "gus: can't grab synth port 0x%lx\n", port + 0x100);
 		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	if (irq >= 0 && request_irq(irq, snd_gus_interrupt, 0, "GUS GF1", (void *) gus)) {
-		snd_printk(KERN_ERR "gus: can't grab irq %d\n", irq);
+		dev_err(card->dev, "gus: can't grab irq %d\n", irq);
 		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.irq = irq;
 	card->sync_irq = irq;
 	if (request_dma(dma1, "GUS - 1")) {
-		snd_printk(KERN_ERR "gus: can't grab DMA1 %d\n", dma1);
+		dev_err(card->dev, "gus: can't grab DMA1 %d\n", dma1);
 		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.dma1 = dma1;
 	if (dma2 >= 0 && dma1 != dma2) {
 		if (request_dma(dma2, "GUS - 2")) {
-			snd_printk(KERN_ERR "gus: can't grab DMA2 %d\n", dma2);
+			dev_err(card->dev, "gus: can't grab DMA2 %d\n", dma2);
 			snd_gus_free(gus);
 			return -EBUSY;
 		}
@@ -229,7 +229,9 @@ static int snd_gus_detect_memory(struct snd_gus_card * gus)
 	snd_gf1_poke(gus, 0L, 0xaa);
 	snd_gf1_poke(gus, 1L, 0x55);
 	if (snd_gf1_peek(gus, 0L) != 0xaa || snd_gf1_peek(gus, 1L) != 0x55) {
-		snd_printk(KERN_ERR "plain GF1 card at 0x%lx without onboard DRAM?\n", gus->gf1.port);
+		dev_err(gus->card->dev,
+			"plain GF1 card at 0x%lx without onboard DRAM?\n",
+			gus->gf1.port);
 		return -ENOMEM;
 	}
 	for (idx = 1, d = 0xab; idx < 4; idx++, d++) {
@@ -287,14 +289,14 @@ static int snd_gus_init_dma_irq(struct snd_gus_card * gus, int latches)
 	dma1 |= gus->equal_dma ? 0x40 : (dma2 << 3);
 
 	if ((dma1 & 7) == 0 || (dma2 & 7) == 0) {
-		snd_printk(KERN_ERR "Error! DMA isn't defined.\n");
+		dev_err(gus->card->dev, "Error! DMA isn't defined.\n");
 		return -EINVAL;
 	}
 	irq = gus->gf1.irq;
 	irq = abs(irq);
 	irq = irqs[irq & 0x0f];
 	if (irq == 0) {
-		snd_printk(KERN_ERR "Error! IRQ isn't defined.\n");
+		dev_err(gus->card->dev, "Error! IRQ isn't defined.\n");
 		return -EINVAL;
 	}
 	irq |= 0x40;
@@ -357,7 +359,7 @@ static int snd_gus_check_version(struct snd_gus_card * gus)
 	val = inb(GUSP(gus, REGCNTRLS));
 	rev = inb(GUSP(gus, BOARDVERSION));
 	spin_unlock_irqrestore(&gus->reg_lock, flags);
-	snd_printdd("GF1 [0x%lx] init - val = 0x%x, rev = 0x%x\n", gus->gf1.port, val, rev);
+	dev_dbg(card->dev, "GF1 [0x%lx] init - val = 0x%x, rev = 0x%x\n", gus->gf1.port, val, rev);
 	strcpy(card->driver, "GUS");
 	strcpy(card->longname, "Gravis UltraSound Classic (2.4)");
 	if ((val != 255 && (val & 0x06)) || (rev >= 5 && rev != 255)) {
@@ -382,8 +384,11 @@ static int snd_gus_check_version(struct snd_gus_card * gus)
 				strcpy(card->longname, "Gravis UltraSound Extreme");
 				gus->ess_flag = 1;
 			} else {
-				snd_printk(KERN_ERR "unknown GF1 revision number at 0x%lx - 0x%x (0x%x)\n", gus->gf1.port, rev, val);
-				snd_printk(KERN_ERR "  please - report to <perex@perex.cz>\n");
+				dev_err(card->dev,
+					"unknown GF1 revision number at 0x%lx - 0x%x (0x%x)\n",
+					gus->gf1.port, rev, val);
+				dev_err(card->dev,
+					"  please - report to <perex@perex.cz>\n");
 			}
 		}
 	}
@@ -400,7 +405,7 @@ int snd_gus_initialize(struct snd_gus_card *gus)
 	if (!gus->interwave) {
 		err = snd_gus_check_version(gus);
 		if (err < 0) {
-			snd_printk(KERN_ERR "version check failed\n");
+			dev_err(gus->card->dev, "version check failed\n");
 			return err;
 		}
 		err = snd_gus_detect_memory(gus);
diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 3e56c01c4544..054058779db6 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -189,7 +189,7 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 		if (nblock != NULL) {
 			if (size != (int)nblock->size) {
 				/* TODO: remove in the future */
-				snd_printk(KERN_ERR "snd_gf1_mem_alloc - share: sizes differ\n");
+				pr_err("%s - share: sizes differ\n", __func__);
 				goto __std;
 			}
 			nblock->share++;
diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index 850544725da7..bcbcaa924c12 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -67,10 +67,6 @@ static int snd_gf1_pcm_block_change(struct snd_pcm_substream *substream,
 
 	count += offset & 31;
 	offset &= ~31;
-	/*
-	snd_printk(KERN_DEBUG "block change - offset = 0x%x, count = 0x%x\n",
-		   offset, count);
-	*/
 	memset(&block, 0, sizeof(block));
 	block.cmd = SNDRV_GF1_DMA_IRQ;
 	if (snd_pcm_format_unsigned(runtime->format))
@@ -123,11 +119,6 @@ static void snd_gf1_pcm_trigger_up(struct snd_pcm_substream *substream)
 		curr = begin + (pcmp->bpos * pcmp->block_size) / runtime->channels;
 		end = curr + (pcmp->block_size / runtime->channels);
 		end -= snd_pcm_format_width(runtime->format) == 16 ? 2 : 1;
-		/*
-		snd_printk(KERN_DEBUG "init: curr=0x%x, begin=0x%x, end=0x%x, "
-			   "ctrl=0x%x, ramp=0x%x, rate=0x%x\n",
-			   curr, begin, end, voice_ctrl, ramp_ctrl, rate);
-		*/
 		pan = runtime->channels == 2 ? (!voice ? 1 : 14) : 8;
 		vol = !voice ? gus->gf1.pcm_volume_level_left : gus->gf1.pcm_volume_level_right;
 		spin_lock_irqsave(&gus->reg_lock, flags);
@@ -178,13 +169,13 @@ static void snd_gf1_pcm_interrupt_wave(struct snd_gus_card * gus,
 	unsigned int end, step;
 
 	if (!pvoice->private_data) {
-		snd_printd("snd_gf1_pcm: unknown wave irq?\n");
+		dev_dbg(gus->card->dev, "%s: unknown wave irq?\n", __func__);
 		snd_gf1_smart_stop_voice(gus, pvoice->number);
 		return;
 	}
 	pcmp = pvoice->private_data;
 	if (pcmp == NULL) {
-		snd_printd("snd_gf1_pcm: unknown wave irq?\n");
+		dev_dbg(gus->card->dev, "%s: unknown wave irq?\n", __func__);
 		snd_gf1_smart_stop_voice(gus, pvoice->number);
 		return;
 	}		
@@ -197,11 +188,11 @@ static void snd_gf1_pcm_interrupt_wave(struct snd_gus_card * gus,
 	ramp_ctrl = (snd_gf1_read8(gus, SNDRV_GF1_VB_VOLUME_CONTROL) & ~0xa4) | 0x03;
 #if 0
 	snd_gf1_select_voice(gus, pvoice->number);
-	printk(KERN_DEBUG "position = 0x%x\n",
-	       (snd_gf1_read_addr(gus, SNDRV_GF1_VA_CURRENT, voice_ctrl & 4) >> 4));
+	dev_dbg(gus->card->dev, "position = 0x%x\n",
+		(snd_gf1_read_addr(gus, SNDRV_GF1_VA_CURRENT, voice_ctrl & 4) >> 4));
 	snd_gf1_select_voice(gus, pcmp->pvoices[1]->number);
-	printk(KERN_DEBUG "position = 0x%x\n",
-	       (snd_gf1_read_addr(gus, SNDRV_GF1_VA_CURRENT, voice_ctrl & 4) >> 4));
+	dev_dbg(gus->card->dev, "position = 0x%x\n",
+		(snd_gf1_read_addr(gus, SNDRV_GF1_VA_CURRENT, voice_ctrl & 4) >> 4));
 	snd_gf1_select_voice(gus, pvoice->number);
 #endif
 	pcmp->bpos++;
@@ -293,11 +284,6 @@ static int snd_gf1_pcm_poke_block(struct snd_gus_card *gus, unsigned char *buf,
 	unsigned int len;
 	unsigned long flags;
 
-	/*
-	printk(KERN_DEBUG
-	       "poke block; buf = 0x%x, pos = %i, count = %i, port = 0x%x\n",
-	       (int)buf, pos, count, gus->gf1.port);
-	*/
 	while (count > 0) {
 		len = count;
 		if (len > 512)		/* limit, to allow IRQ */
@@ -673,8 +659,9 @@ static int snd_gf1_pcm_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_free = snd_gf1_pcm_playback_free;
 
 #if 0
-	printk(KERN_DEBUG "playback.buffer = 0x%lx, gf1.pcm_buffer = 0x%lx\n",
-	       (long) pcm->playback.buffer, (long) gus->gf1.pcm_buffer);
+	dev_dbg(gus->card->dev,
+		"playback.buffer = 0x%lx, gf1.pcm_buffer = 0x%lx\n",
+		(long) pcm->playback.buffer, (long) gus->gf1.pcm_buffer);
 #endif
 	err = snd_gf1_dma_init(gus);
 	if (err < 0)
@@ -695,7 +682,7 @@ static int snd_gf1_pcm_playback_close(struct snd_pcm_substream *substream)
 	struct gus_pcm_private *pcmp = runtime->private_data;
 	
 	if (!wait_event_timeout(pcmp->sleep, (atomic_read(&pcmp->dma_count) <= 0), 2*HZ))
-		snd_printk(KERN_ERR "gf1 pcm - serious DMA problem\n");
+		dev_err(gus->card->dev, "gf1 pcm - serious DMA problem\n");
 
 	snd_gf1_dma_done(gus);	
 	return 0;
diff --git a/sound/isa/gus/gus_reset.c b/sound/isa/gus/gus_reset.c
index 9a1ab5872c4f..ac5da1281042 100644
--- a/sound/isa/gus/gus_reset.c
+++ b/sound/isa/gus/gus_reset.c
@@ -116,7 +116,9 @@ void snd_gf1_smart_stop_voice(struct snd_gus_card * gus, unsigned short voice)
 	spin_lock_irqsave(&gus->reg_lock, flags);
 	snd_gf1_select_voice(gus, voice);
 #if 0
-	printk(KERN_DEBUG " -%i- smart stop voice - volume = 0x%x\n", voice, snd_gf1_i_read16(gus, SNDRV_GF1_VW_VOLUME));
+	dev_dbg(gus->card->dev,
+		" -%i- smart stop voice - volume = 0x%x\n",
+		voice, snd_gf1_i_read16(gus, SNDRV_GF1_VW_VOLUME));
 #endif
 	snd_gf1_ctrl_stop(gus, SNDRV_GF1_VB_ADDRESS_CONTROL);
 	snd_gf1_ctrl_stop(gus, SNDRV_GF1_VB_VOLUME_CONTROL);
@@ -130,7 +132,9 @@ void snd_gf1_stop_voice(struct snd_gus_card * gus, unsigned short voice)
 	spin_lock_irqsave(&gus->reg_lock, flags);
 	snd_gf1_select_voice(gus, voice);
 #if 0
-	printk(KERN_DEBUG " -%i- stop voice - volume = 0x%x\n", voice, snd_gf1_i_read16(gus, SNDRV_GF1_VW_VOLUME));
+	dev_dbg(gus->card->dev,
+		" -%i- stop voice - volume = 0x%x\n",
+		voice, snd_gf1_i_read16(gus, SNDRV_GF1_VW_VOLUME));
 #endif
 	snd_gf1_ctrl_stop(gus, SNDRV_GF1_VB_ADDRESS_CONTROL);
 	snd_gf1_ctrl_stop(gus, SNDRV_GF1_VB_VOLUME_CONTROL);
diff --git a/sound/isa/gus/gus_uart.c b/sound/isa/gus/gus_uart.c
index 3975848160e7..08276509447f 100644
--- a/sound/isa/gus/gus_uart.c
+++ b/sound/isa/gus/gus_uart.c
@@ -89,7 +89,9 @@ static int snd_gf1_uart_output_open(struct snd_rawmidi_substream *substream)
 	gus->midi_substream_output = substream;
 	spin_unlock_irqrestore(&gus->uart_cmd_lock, flags);
 #if 0
-	snd_printk(KERN_DEBUG "write init - cmd = 0x%x, stat = 0x%x\n", gus->gf1.uart_cmd, snd_gf1_uart_stat(gus));
+	dev_dbg(gus->card->dev,
+		"write init - cmd = 0x%x, stat = 0x%x\n",
+		gus->gf1.uart_cmd, snd_gf1_uart_stat(gus));
 #endif
 	return 0;
 }
@@ -111,18 +113,17 @@ static int snd_gf1_uart_input_open(struct snd_rawmidi_substream *substream)
 		for (i = 0; i < 1000 && (snd_gf1_uart_stat(gus) & 0x01); i++)
 			snd_gf1_uart_get(gus);	/* clean Rx */
 		if (i >= 1000)
-			snd_printk(KERN_ERR "gus midi uart init read - cleanup error\n");
+			dev_err(gus->card->dev, "gus midi uart init read - cleanup error\n");
 	}
 	spin_unlock_irqrestore(&gus->uart_cmd_lock, flags);
 #if 0
-	snd_printk(KERN_DEBUG
-		   "read init - enable = %i, cmd = 0x%x, stat = 0x%x\n",
-		   gus->uart_enable, gus->gf1.uart_cmd, snd_gf1_uart_stat(gus));
-	snd_printk(KERN_DEBUG
-		   "[0x%x] reg (ctrl/status) = 0x%x, reg (data) = 0x%x "
-		   "(page = 0x%x)\n",
-		   gus->gf1.port + 0x100, inb(gus->gf1.port + 0x100),
-		   inb(gus->gf1.port + 0x101), inb(gus->gf1.port + 0x102));
+	dev_dbg(gus->card->dev,
+		"read init - enable = %i, cmd = 0x%x, stat = 0x%x\n",
+		gus->uart_enable, gus->gf1.uart_cmd, snd_gf1_uart_stat(gus));
+	dev_dbg(gus->card->dev,
+		"[0x%x] reg (ctrl/status) = 0x%x, reg (data) = 0x%x (page = 0x%x)\n",
+		gus->gf1.port + 0x100, inb(gus->gf1.port + 0x100),
+		inb(gus->gf1.port + 0x101), inb(gus->gf1.port + 0x102));
 #endif
 	return 0;
 }
diff --git a/sound/isa/gus/gus_volume.c b/sound/isa/gus/gus_volume.c
index ed72196a361b..e729621756cf 100644
--- a/sound/isa/gus/gus_volume.c
+++ b/sound/isa/gus/gus_volume.c
@@ -104,7 +104,8 @@ unsigned short snd_gf1_translate_freq(struct snd_gus_card * gus, unsigned int fr
 		freq16 = 50;
 	if (freq16 & 0xf8000000) {
 		freq16 = ~0xf8000000;
-		snd_printk(KERN_ERR "snd_gf1_translate_freq: overflow - freq = 0x%x\n", freq16);
+		dev_err(gus->card->dev, "%s: overflow - freq = 0x%x\n",
+			__func__, freq16);
 	}
 	return ((freq16 << 9) + (gus->gf1.playback_freq >> 1)) / gus->gf1.playback_freq;
 }
@@ -189,14 +190,14 @@ unsigned short snd_gf1_compute_freq(unsigned int freq,
 	fc = (freq << 10) / rate;
 	if (fc > 97391L) {
 		fc = 97391;
-		snd_printk(KERN_ERR "patch: (1) fc frequency overflow - %u\n", fc);
+		pr_err("patch: (1) fc frequency overflow - %u\n", fc);
 	}
 	fc = (fc * 44100UL) / mix_rate;
 	while (scale--)
 		fc <<= 1;
 	if (fc > 65535L) {
 		fc = 65535;
-		snd_printk(KERN_ERR "patch: (2) fc frequency overflow - %u\n", fc);
+		pr_err("patch: (2) fc frequency overflow - %u\n", fc);
 	}
 	return (unsigned short) fc;
 }
diff --git a/sound/isa/gus/gusclassic.c b/sound/isa/gus/gusclassic.c
index 09cc53ceea2a..101202acefb3 100644
--- a/sound/isa/gus/gusclassic.c
+++ b/sound/isa/gus/gusclassic.c
@@ -115,7 +115,7 @@ static int snd_gusclassic_detect(struct snd_gus_card *gus)
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 0) {
-		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	udelay(160);
@@ -123,7 +123,7 @@ static int snd_gusclassic_detect(struct snd_gus_card *gus)
 	udelay(160);
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 1) {
-		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	return 0;
diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
index 63d9f2d75df0..6eab95bd49c1 100644
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -179,7 +179,7 @@ static int snd_gusextreme_detect(struct snd_gus_card *gus,
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 0) {
-		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -EIO;
 	}
 	udelay(160);
@@ -187,7 +187,7 @@ static int snd_gusextreme_detect(struct snd_gus_card *gus,
 	udelay(160);
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 1) {
-		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -EIO;
 	}
 
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index 6834c0560064..445fd2fb50f1 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -64,8 +64,6 @@ struct snd_gusmax {
 	unsigned short pcm_status_reg;
 };
 
-#define PFX	"gusmax: "
-
 static int snd_gusmax_detect(struct snd_gus_card *gus)
 {
 	unsigned char d;
@@ -73,7 +71,7 @@ static int snd_gusmax_detect(struct snd_gus_card *gus)
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 0) {
-		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	udelay(160);
@@ -81,7 +79,7 @@ static int snd_gusmax_detect(struct snd_gus_card *gus)
 	udelay(160);
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 1) {
-		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 
@@ -206,7 +204,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	if (xirq == SNDRV_AUTO_IRQ) {
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
+			dev_err(pdev, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
@@ -214,7 +212,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	if (xdma1 == SNDRV_AUTO_DMA) {
 		xdma1 = snd_legacy_find_free_dma(possible_dmas);
 		if (xdma1 < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
+			dev_err(pdev, "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
@@ -222,7 +220,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	if (xdma2 == SNDRV_AUTO_DMA) {
 		xdma2 = snd_legacy_find_free_dma(possible_dmas);
 		if (xdma2 < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
+			dev_err(pdev, "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
 	}
@@ -267,13 +265,13 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 		return err;
 
 	if (!gus->max_flag) {
-		snd_printk(KERN_ERR PFX "GUS MAX soundcard was not detected at 0x%lx\n", gus->gf1.port);
+		dev_err(pdev, "GUS MAX soundcard was not detected at 0x%lx\n", gus->gf1.port);
 		return -ENODEV;
 	}
 
 	if (devm_request_irq(card->dev, xirq, snd_gusmax_interrupt, 0,
 			     "GUS MAX", (void *)maxcard)) {
-		snd_printk(KERN_ERR PFX "unable to grab IRQ %d\n", xirq);
+		dev_err(pdev, "unable to grab IRQ %d\n", xirq);
 		return -EBUSY;
 	}
 	maxcard->irq = xirq;
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index a04a9d3253f8..18a98123e286 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -52,11 +52,9 @@ static int pcm_channels[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
 static int effect[SNDRV_CARDS];
 
 #ifdef SNDRV_STB
-#define PFX "interwave-stb: "
 #define INTERWAVE_DRIVER	"snd_interwave_stb"
 #define INTERWAVE_PNP_DRIVER	"interwave-stb"
 #else
-#define PFX "interwave: "
 #define INTERWAVE_DRIVER	"snd_interwave"
 #define INTERWAVE_PNP_DRIVER	"interwave"
 #endif
@@ -148,7 +146,7 @@ static void snd_interwave_i2c_setlines(struct snd_i2c_bus *bus, int ctrl, int da
 	unsigned long port = bus->private_value;
 
 #if 0
-	printk(KERN_DEBUG "i2c_setlines - 0x%lx <- %i,%i\n", port, ctrl, data);
+	dev_dbg(bus->card->dev, "i2c_setlines - 0x%lx <- %i,%i\n", port, ctrl, data);
 #endif
 	outb((data << 1) | ctrl, port);
 	udelay(10);
@@ -161,7 +159,7 @@ static int snd_interwave_i2c_getclockline(struct snd_i2c_bus *bus)
 
 	res = inb(port) & 1;
 #if 0
-	printk(KERN_DEBUG "i2c_getclockline - 0x%lx -> %i\n", port, res);
+	dev_dbg(bus->card->dev, "i2c_getclockline - 0x%lx -> %i\n", port, res);
 #endif
 	return res;
 }
@@ -175,7 +173,7 @@ static int snd_interwave_i2c_getdataline(struct snd_i2c_bus *bus, int ack)
 		udelay(10);
 	res = (inb(port) & 2) >> 1;
 #if 0
-	printk(KERN_DEBUG "i2c_getdataline - 0x%lx -> %i\n", port, res);
+	dev_dbg(bus->card->dev, "i2c_getdataline - 0x%lx -> %i\n", port, res);
 #endif
 	return res;
 }
@@ -215,7 +213,7 @@ static int snd_interwave_detect_stb(struct snd_interwave *iwcard,
 						      "InterWave (I2C bus)");
 	}
 	if (iwcard->i2c_res == NULL) {
-		snd_printk(KERN_ERR "interwave: can't grab i2c bus port\n");
+		dev_err(card->dev, "interwave: can't grab i2c bus port\n");
 		return -ENODEV;
 	}
 
@@ -248,7 +246,7 @@ static int snd_interwave_detect(struct snd_interwave *iwcard,
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 0);	/* reset GF1 */
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 0) {
-		snd_printdd("[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 1 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	udelay(160);
@@ -256,7 +254,7 @@ static int snd_interwave_detect(struct snd_interwave *iwcard,
 	udelay(160);
 	d = snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET);
 	if ((d & 0x07) != 1) {
-		snd_printdd("[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
+		dev_dbg(gus->card->dev, "[0x%lx] check 2 failed - 0x%x\n", gus->gf1.port, d);
 		return -ENODEV;
 	}
 	spin_lock_irqsave(&gus->reg_lock, flags);
@@ -265,10 +263,13 @@ static int snd_interwave_detect(struct snd_interwave *iwcard,
 	rev2 = snd_gf1_look8(gus, SNDRV_GF1_GB_VERSION_NUMBER);
 	snd_gf1_write8(gus, SNDRV_GF1_GB_VERSION_NUMBER, rev1);
 	spin_unlock_irqrestore(&gus->reg_lock, flags);
-	snd_printdd("[0x%lx] InterWave check - rev1=0x%x, rev2=0x%x\n", gus->gf1.port, rev1, rev2);
+	dev_dbg(gus->card->dev,
+		"[0x%lx] InterWave check - rev1=0x%x, rev2=0x%x\n",
+		gus->gf1.port, rev1, rev2);
 	if ((rev1 & 0xf0) == (rev2 & 0xf0) &&
 	    (rev1 & 0x0f) != (rev2 & 0x0f)) {
-		snd_printdd("[0x%lx] InterWave check - passed\n", gus->gf1.port);
+		dev_dbg(gus->card->dev,
+			"[0x%lx] InterWave check - passed\n", gus->gf1.port);
 		gus->interwave = 1;
 		strcpy(gus->card->shortname, "AMD InterWave");
 		gus->revision = rev1 >> 4;
@@ -278,7 +279,7 @@ static int snd_interwave_detect(struct snd_interwave *iwcard,
 		return snd_interwave_detect_stb(iwcard, gus, dev, rbus);
 #endif
 	}
-	snd_printdd("[0x%lx] InterWave check - failed\n", gus->gf1.port);
+	dev_dbg(gus->card->dev, "[0x%lx] InterWave check - failed\n", gus->gf1.port);
 	return -ENODEV;
 }
 
@@ -327,7 +328,7 @@ static void snd_interwave_bank_sizes(struct snd_gus_card *gus, int *sizes)
 			snd_gf1_poke(gus, local, d);
 			snd_gf1_poke(gus, local + 1, d + 1);
 #if 0
-			printk(KERN_DEBUG "d = 0x%x, local = 0x%x, "
+			dev_dbg(gus->card->dev, "d = 0x%x, local = 0x%x, "
 			       "local + 1 = 0x%x, idx << 22 = 0x%x\n",
 			       d,
 			       snd_gf1_peek(gus, local),
@@ -342,7 +343,7 @@ static void snd_interwave_bank_sizes(struct snd_gus_card *gus, int *sizes)
 		}
 	}
 #if 0
-	printk(KERN_DEBUG "sizes: %i %i %i %i\n",
+	dev_dbg(gus->card->dev, "sizes: %i %i %i %i\n",
 	       sizes[0], sizes[1], sizes[2], sizes[3]);
 #endif
 }
@@ -397,12 +398,12 @@ static void snd_interwave_detect_memory(struct snd_gus_card *gus)
 		lmct = (psizes[3] << 24) | (psizes[2] << 16) |
 		    (psizes[1] << 8) | psizes[0];
 #if 0
-		printk(KERN_DEBUG "lmct = 0x%08x\n", lmct);
+		dev_dbg(gus->card->dev, "lmct = 0x%08x\n", lmct);
 #endif
 		for (i = 0; i < ARRAY_SIZE(lmc); i++)
 			if (lmct == lmc[i]) {
 #if 0
-				printk(KERN_DEBUG "found !!! %i\n", i);
+				dev_dbg(gus->card->dev, "found !!! %i\n", i);
 #endif
 				snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, (snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG) & 0xfff0) | i);
 				snd_interwave_bank_sizes(gus, psizes);
@@ -566,12 +567,12 @@ static int snd_interwave_pnp(int dev, struct snd_interwave *iwcard,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "InterWave PnP configure failure (out of resources?)\n");
+		dev_err(&pdev->dev, "InterWave PnP configure failure (out of resources?)\n");
 		return err;
 	}
 	if (pnp_port_start(pdev, 0) + 0x100 != pnp_port_start(pdev, 1) ||
 	    pnp_port_start(pdev, 0) + 0x10c != pnp_port_start(pdev, 2)) {
-		snd_printk(KERN_ERR "PnP configure failure (wrong ports)\n");
+		dev_err(&pdev->dev, "PnP configure failure (wrong ports)\n");
 		return -ENOENT;
 	}
 	port[dev] = pnp_port_start(pdev, 0);
@@ -579,22 +580,26 @@ static int snd_interwave_pnp(int dev, struct snd_interwave *iwcard,
 	if (dma2[dev] >= 0)
 		dma2[dev] = pnp_dma(pdev, 1);
 	irq[dev] = pnp_irq(pdev, 0);
-	snd_printdd("isapnp IW: sb port=0x%llx, gf1 port=0x%llx, codec port=0x%llx\n",
-			(unsigned long long)pnp_port_start(pdev, 0),
-			(unsigned long long)pnp_port_start(pdev, 1),
-			(unsigned long long)pnp_port_start(pdev, 2));
-	snd_printdd("isapnp IW: dma1=%i, dma2=%i, irq=%i\n", dma1[dev], dma2[dev], irq[dev]);
+	dev_dbg(&pdev->dev,
+		"isapnp IW: sb port=0x%llx, gf1 port=0x%llx, codec port=0x%llx\n",
+		(unsigned long long)pnp_port_start(pdev, 0),
+		(unsigned long long)pnp_port_start(pdev, 1),
+		(unsigned long long)pnp_port_start(pdev, 2));
+	dev_dbg(&pdev->dev,
+		"isapnp IW: dma1=%i, dma2=%i, irq=%i\n",
+		dma1[dev], dma2[dev], irq[dev]);
 #ifdef SNDRV_STB
 	/* Tone Control initialization */
 	pdev = iwcard->devtc;
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "InterWave ToneControl PnP configure failure (out of resources?)\n");
+		dev_err(&pdev->dev,
+			"InterWave ToneControl PnP configure failure (out of resources?)\n");
 		return err;
 	}
 	port_tc[dev] = pnp_port_start(pdev, 0);
-	snd_printdd("isapnp IW: tone control port=0x%lx\n", port_tc[dev]);
+	dev_dbg(&pdev->dev, "isapnp IW: tone control port=0x%lx\n", port_tc[dev]);
 #endif
 	return 0;
 }
@@ -660,7 +665,7 @@ static int snd_interwave_probe(struct snd_card *card, int dev,
 
 	if (devm_request_irq(card->dev, xirq, snd_interwave_interrupt, 0,
 			     "InterWave", iwcard)) {
-		snd_printk(KERN_ERR PFX "unable to grab IRQ %d\n", xirq);
+		dev_err(card->dev, "unable to grab IRQ %d\n", xirq);
 		return -EBUSY;
 	}
 	iwcard->irq = xirq;
@@ -780,21 +785,21 @@ static int snd_interwave_isa_probe(struct device *pdev,
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
 		irq[dev] = snd_legacy_find_free_irq(possible_irqs);
 		if (irq[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
+			dev_err(pdev, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1[dev] == SNDRV_AUTO_DMA) {
 		dma1[dev] = snd_legacy_find_free_dma(possible_dmas);
 		if (dma1[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
+			dev_err(pdev, "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 	if (dma2[dev] == SNDRV_AUTO_DMA) {
 		dma2[dev] = snd_legacy_find_free_dma(possible_dmas);
 		if (dma2[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
+			dev_err(pdev, "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
 	}
-- 
2.43.0

