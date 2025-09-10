Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C63176EF
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502629; cv=none; b=qjd8HH5kP0G4excj4bJDFpk5yy2xX0kOOi4n4USEbPVI57cgsJrknxvr2j/5Tl4WjC15xDiu4KrFlOz3RTisBmHG5B9eF5SoEXvFx2D0nln7+YZXOQMs89z1Bb5R9m0nU3aKiYuzh95nY/GcdBI0j3x81Wm+O9y/DXEn4qd0x7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502629; c=relaxed/simple;
	bh=qmdBzA6KZTGBTzBLcYAjxaMbs+JddWJTLn0MIU/uv8g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFzoOYS7eYpnegXcGdXlCB8f3EcWX2zlt76XtskyGBnAtiJhNOuGGK/VpQm/cKsJDswenuMelMfE6L9LPfNqTL2YBxV4jQOzlGj9Gv1i5ndl9L8P2D1pBGy1PybivXdQ+f/qHrQv3x2Z87BJNqihE20rI6YNX7dPhpC49s0UepE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQ3pSk5E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8YF33cl7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YQ3pSk5E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8YF33cl7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQ3pSk5E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8YF33cl7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YQ3pSk5E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8YF33cl7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B00B7601F5;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLjMe66q0zoQHd75F9nWBE921G4vBFb9gLH/Msqh1Ro=;
	b=YQ3pSk5Ew1DcjwVg3pH4NIRytNZMe1QX4WVAM3AiSPovtdApBfwK0+bFOQI3OwLTsSRRoY
	hQJYdB2Y8msB6zlGuI19z0Y83pq7cVfAP4uuF7XHiCYKIlIr/FQXT08hs9GBpZy1lzQuiO
	CZG0f3yWKK/tVe75BRYZQEKZ8V4EGxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLjMe66q0zoQHd75F9nWBE921G4vBFb9gLH/Msqh1Ro=;
	b=8YF33cl7s4mx6SxoxRIdbWMU8hkLauZc+2k/oxIa32TVhOGBLs9rISEUwOrADdf6xySWCK
	ikt2g//Vy+2k/nCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YQ3pSk5E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8YF33cl7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLjMe66q0zoQHd75F9nWBE921G4vBFb9gLH/Msqh1Ro=;
	b=YQ3pSk5Ew1DcjwVg3pH4NIRytNZMe1QX4WVAM3AiSPovtdApBfwK0+bFOQI3OwLTsSRRoY
	hQJYdB2Y8msB6zlGuI19z0Y83pq7cVfAP4uuF7XHiCYKIlIr/FQXT08hs9GBpZy1lzQuiO
	CZG0f3yWKK/tVe75BRYZQEKZ8V4EGxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLjMe66q0zoQHd75F9nWBE921G4vBFb9gLH/Msqh1Ro=;
	b=8YF33cl7s4mx6SxoxRIdbWMU8hkLauZc+2k/oxIa32TVhOGBLs9rISEUwOrADdf6xySWCK
	ikt2g//Vy+2k/nCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87E6F13A54;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UE/6H3pcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/14] ALSA: sparc/dbri: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:29 +0200
Message-ID: <20250910110932.15234-15-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910110932.15234-1-tiwai@suse.de>
References: <20250910110932.15234-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B00B7601F5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/dbri.c | 228 +++++++++++++++++++++------------------------
 1 file changed, 107 insertions(+), 121 deletions(-)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 93cbe158009f..75f82a92ff44 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -758,40 +758,38 @@ static void dbri_initialize(struct snd_dbri *dbri)
 	u32 dvma_addr = (u32)dbri->dma_dvma;
 	s32 *cmd;
 	u32 dma_addr;
-	unsigned long flags;
 	int n;
 
-	spin_lock_irqsave(&dbri->lock, flags);
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		dbri_reset(dbri);
 
-	dbri_reset(dbri);
+		/* Initialize pipes */
+		for (n = 0; n < DBRI_NO_PIPES; n++)
+			dbri->pipes[n].desc = dbri->pipes[n].first_desc = -1;
 
-	/* Initialize pipes */
-	for (n = 0; n < DBRI_NO_PIPES; n++)
-		dbri->pipes[n].desc = dbri->pipes[n].first_desc = -1;
+		spin_lock_init(&dbri->cmdlock);
+		/*
+		 * Initialize the interrupt ring buffer.
+		 */
+		dma_addr = dvma_addr + dbri_dma_off(intr, 0);
+		dbri->dma->intr[0] = dma_addr;
+		dbri->dbri_irqp = 1;
+		/*
+		 * Set up the interrupt queue
+		 */
+		scoped_guard(spinlock, &dbri->cmdlock) {
+			cmd = dbri->cmdptr = dbri->dma->cmd;
+			*(cmd++) = DBRI_CMD(D_IIQ, 0, 0);
+			*(cmd++) = dma_addr;
+			*(cmd++) = DBRI_CMD(D_PAUSE, 0, 0);
+			dbri->cmdptr = cmd;
+			*(cmd++) = DBRI_CMD(D_WAIT, 1, 0);
+			*(cmd++) = DBRI_CMD(D_WAIT, 1, 0);
+			dma_addr = dvma_addr + dbri_dma_off(cmd, 0);
+			sbus_writel(dma_addr, dbri->regs + REG8);
+		}
+	}
 
-	spin_lock_init(&dbri->cmdlock);
-	/*
-	 * Initialize the interrupt ring buffer.
-	 */
-	dma_addr = dvma_addr + dbri_dma_off(intr, 0);
-	dbri->dma->intr[0] = dma_addr;
-	dbri->dbri_irqp = 1;
-	/*
-	 * Set up the interrupt queue
-	 */
-	spin_lock(&dbri->cmdlock);
-	cmd = dbri->cmdptr = dbri->dma->cmd;
-	*(cmd++) = DBRI_CMD(D_IIQ, 0, 0);
-	*(cmd++) = dma_addr;
-	*(cmd++) = DBRI_CMD(D_PAUSE, 0, 0);
-	dbri->cmdptr = cmd;
-	*(cmd++) = DBRI_CMD(D_WAIT, 1, 0);
-	*(cmd++) = DBRI_CMD(D_WAIT, 1, 0);
-	dma_addr = dvma_addr + dbri_dma_off(cmd, 0);
-	sbus_writel(dma_addr, dbri->regs + REG8);
-	spin_unlock(&dbri->cmdlock);
-
-	spin_unlock_irqrestore(&dbri->lock, flags);
 	dbri_cmdwait(dbri);
 }
 
@@ -1002,7 +1000,6 @@ static void unlink_time_slot(struct snd_dbri *dbri, int pipe,
 static void xmit_fixed(struct snd_dbri *dbri, int pipe, unsigned int data)
 {
 	s32 *cmd;
-	unsigned long flags;
 
 	if (pipe < 16 || pipe > DBRI_MAX_PIPE) {
 		printk(KERN_ERR "DBRI: xmit_fixed: Illegal pipe number\n");
@@ -1037,9 +1034,10 @@ static void xmit_fixed(struct snd_dbri *dbri, int pipe, unsigned int data)
 	*(cmd++) = data;
 	*(cmd++) = DBRI_CMD(D_PAUSE, 0, 0);
 
-	spin_lock_irqsave(&dbri->lock, flags);
-	dbri_cmdsend(dbri, cmd, 3);
-	spin_unlock_irqrestore(&dbri->lock, flags);
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		dbri_cmdsend(dbri, cmd, 3);
+	}
+
 	dbri_cmdwait(dbri);
 
 }
@@ -1317,33 +1315,31 @@ to the DBRI via the CHI interface and few of the DBRI's PIO pins.
 */
 static void cs4215_setup_pipes(struct snd_dbri *dbri)
 {
-	unsigned long flags;
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		/*
+		 * Data mode:
+		 * Pipe  4: Send timeslots 1-4 (audio data)
+		 * Pipe 20: Send timeslots 5-8 (part of ctrl data)
+		 * Pipe  6: Receive timeslots 1-4 (audio data)
+		 * Pipe 21: Receive timeslots 6-7. We can only receive 20 bits via
+		 *          interrupt, and the rest of the data (slot 5 and 8) is
+		 *          not relevant for us (only for doublechecking).
+		 *
+		 * Control mode:
+		 * Pipe 17: Send timeslots 1-4 (slots 5-8 are read only)
+		 * Pipe 18: Receive timeslot 1 (clb).
+		 * Pipe 19: Receive timeslot 7 (version).
+		 */
 
-	spin_lock_irqsave(&dbri->lock, flags);
-	/*
-	 * Data mode:
-	 * Pipe  4: Send timeslots 1-4 (audio data)
-	 * Pipe 20: Send timeslots 5-8 (part of ctrl data)
-	 * Pipe  6: Receive timeslots 1-4 (audio data)
-	 * Pipe 21: Receive timeslots 6-7. We can only receive 20 bits via
-	 *          interrupt, and the rest of the data (slot 5 and 8) is
-	 *          not relevant for us (only for doublechecking).
-	 *
-	 * Control mode:
-	 * Pipe 17: Send timeslots 1-4 (slots 5-8 are read only)
-	 * Pipe 18: Receive timeslot 1 (clb).
-	 * Pipe 19: Receive timeslot 7 (version).
-	 */
+		setup_pipe(dbri, 4, D_SDP_MEM | D_SDP_TO_SER | D_SDP_MSB);
+		setup_pipe(dbri, 20, D_SDP_FIXED | D_SDP_TO_SER | D_SDP_MSB);
+		setup_pipe(dbri, 6, D_SDP_MEM | D_SDP_FROM_SER | D_SDP_MSB);
+		setup_pipe(dbri, 21, D_SDP_FIXED | D_SDP_FROM_SER | D_SDP_MSB);
 
-	setup_pipe(dbri, 4, D_SDP_MEM | D_SDP_TO_SER | D_SDP_MSB);
-	setup_pipe(dbri, 20, D_SDP_FIXED | D_SDP_TO_SER | D_SDP_MSB);
-	setup_pipe(dbri, 6, D_SDP_MEM | D_SDP_FROM_SER | D_SDP_MSB);
-	setup_pipe(dbri, 21, D_SDP_FIXED | D_SDP_FROM_SER | D_SDP_MSB);
-
-	setup_pipe(dbri, 17, D_SDP_FIXED | D_SDP_TO_SER | D_SDP_MSB);
-	setup_pipe(dbri, 18, D_SDP_FIXED | D_SDP_FROM_SER | D_SDP_MSB);
-	setup_pipe(dbri, 19, D_SDP_FIXED | D_SDP_FROM_SER | D_SDP_MSB);
-	spin_unlock_irqrestore(&dbri->lock, flags);
+		setup_pipe(dbri, 17, D_SDP_FIXED | D_SDP_TO_SER | D_SDP_MSB);
+		setup_pipe(dbri, 18, D_SDP_FIXED | D_SDP_FROM_SER | D_SDP_MSB);
+		setup_pipe(dbri, 19, D_SDP_FIXED | D_SDP_FROM_SER | D_SDP_MSB);
+	}
 
 	dbri_cmdwait(dbri);
 }
@@ -1418,7 +1414,6 @@ static void cs4215_open(struct snd_dbri *dbri)
 {
 	int data_width;
 	u32 tmp;
-	unsigned long flags;
 
 	dprintk(D_MM, "cs4215_open: %d channels, %d bits\n",
 		dbri->mm.channels, dbri->mm.precision);
@@ -1443,35 +1438,35 @@ static void cs4215_open(struct snd_dbri *dbri)
 	 * bits.  The CS4215, it seems, observes TSIN (the delayed signal)
 	 * even if it's the CHI master.  Don't ask me...
 	 */
-	spin_lock_irqsave(&dbri->lock, flags);
-	tmp = sbus_readl(dbri->regs + REG0);
-	tmp &= ~(D_C);		/* Disable CHI */
-	sbus_writel(tmp, dbri->regs + REG0);
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		tmp = sbus_readl(dbri->regs + REG0);
+		tmp &= ~(D_C);		/* Disable CHI */
+		sbus_writel(tmp, dbri->regs + REG0);
 
-	/* Switch CS4215 to data mode - set PIO3 to 1 */
-	sbus_writel(D_ENPIO | D_PIO1 | D_PIO3 |
-		    (dbri->mm.onboard ? D_PIO0 : D_PIO2), dbri->regs + REG2);
+		/* Switch CS4215 to data mode - set PIO3 to 1 */
+		sbus_writel(D_ENPIO | D_PIO1 | D_PIO3 |
+			    (dbri->mm.onboard ? D_PIO0 : D_PIO2), dbri->regs + REG2);
 
-	reset_chi(dbri, CHIslave, 128);
+		reset_chi(dbri, CHIslave, 128);
 
-	/* Note: this next doesn't work for 8-bit stereo, because the two
-	 * channels would be on timeslots 1 and 3, with 2 and 4 idle.
-	 * (See CS4215 datasheet Fig 15)
-	 *
-	 * DBRI non-contiguous mode would be required to make this work.
-	 */
-	data_width = dbri->mm.channels * dbri->mm.precision;
+		/* Note: this next doesn't work for 8-bit stereo, because the two
+		 * channels would be on timeslots 1 and 3, with 2 and 4 idle.
+		 * (See CS4215 datasheet Fig 15)
+		 *
+		 * DBRI non-contiguous mode would be required to make this work.
+		 */
+		data_width = dbri->mm.channels * dbri->mm.precision;
 
-	link_time_slot(dbri, 4, 16, 16, data_width, dbri->mm.offset);
-	link_time_slot(dbri, 20, 4, 16, 32, dbri->mm.offset + 32);
-	link_time_slot(dbri, 6, 16, 16, data_width, dbri->mm.offset);
-	link_time_slot(dbri, 21, 6, 16, 16, dbri->mm.offset + 40);
+		link_time_slot(dbri, 4, 16, 16, data_width, dbri->mm.offset);
+		link_time_slot(dbri, 20, 4, 16, 32, dbri->mm.offset + 32);
+		link_time_slot(dbri, 6, 16, 16, data_width, dbri->mm.offset);
+		link_time_slot(dbri, 21, 6, 16, 16, dbri->mm.offset + 40);
 
-	/* FIXME: enable CHI after _setdata? */
-	tmp = sbus_readl(dbri->regs + REG0);
-	tmp |= D_C;		/* Enable CHI */
-	sbus_writel(tmp, dbri->regs + REG0);
-	spin_unlock_irqrestore(&dbri->lock, flags);
+		/* FIXME: enable CHI after _setdata? */
+		tmp = sbus_readl(dbri->regs + REG0);
+		tmp |= D_C;		/* Enable CHI */
+		sbus_writel(tmp, dbri->regs + REG0);
+	}
 
 	cs4215_setdata(dbri, 0);
 }
@@ -1483,7 +1478,6 @@ static int cs4215_setctrl(struct snd_dbri *dbri)
 {
 	int i, val;
 	u32 tmp;
-	unsigned long flags;
 
 	/* FIXME - let the CPU do something useful during these delays */
 
@@ -1520,34 +1514,34 @@ static int cs4215_setctrl(struct snd_dbri *dbri)
 	 * done in hardware by a TI 248 that delays the DBRI->4215
 	 * frame sync signal by eight clock cycles.  Anybody know why?
 	 */
-	spin_lock_irqsave(&dbri->lock, flags);
-	tmp = sbus_readl(dbri->regs + REG0);
-	tmp &= ~D_C;		/* Disable CHI */
-	sbus_writel(tmp, dbri->regs + REG0);
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		tmp = sbus_readl(dbri->regs + REG0);
+		tmp &= ~D_C;		/* Disable CHI */
+		sbus_writel(tmp, dbri->regs + REG0);
 
-	reset_chi(dbri, CHImaster, 128);
+		reset_chi(dbri, CHImaster, 128);
 
-	/*
-	 * Control mode:
-	 * Pipe 17: Send timeslots 1-4 (slots 5-8 are read only)
-	 * Pipe 18: Receive timeslot 1 (clb).
-	 * Pipe 19: Receive timeslot 7 (version).
-	 */
+		/*
+		 * Control mode:
+		 * Pipe 17: Send timeslots 1-4 (slots 5-8 are read only)
+		 * Pipe 18: Receive timeslot 1 (clb).
+		 * Pipe 19: Receive timeslot 7 (version).
+		 */
 
-	link_time_slot(dbri, 17, 16, 16, 32, dbri->mm.offset);
-	link_time_slot(dbri, 18, 16, 16, 8, dbri->mm.offset);
-	link_time_slot(dbri, 19, 18, 16, 8, dbri->mm.offset + 48);
-	spin_unlock_irqrestore(&dbri->lock, flags);
+		link_time_slot(dbri, 17, 16, 16, 32, dbri->mm.offset);
+		link_time_slot(dbri, 18, 16, 16, 8, dbri->mm.offset);
+		link_time_slot(dbri, 19, 18, 16, 8, dbri->mm.offset + 48);
+	}
 
 	/* Wait for the chip to echo back CLB (Control Latch Bit) as zero */
 	dbri->mm.ctrl[0] &= ~CS4215_CLB;
 	xmit_fixed(dbri, 17, *(int *)dbri->mm.ctrl);
 
-	spin_lock_irqsave(&dbri->lock, flags);
-	tmp = sbus_readl(dbri->regs + REG0);
-	tmp |= D_C;		/* Enable CHI */
-	sbus_writel(tmp, dbri->regs + REG0);
-	spin_unlock_irqrestore(&dbri->lock, flags);
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		tmp = sbus_readl(dbri->regs + REG0);
+		tmp |= D_C;		/* Enable CHI */
+		sbus_writel(tmp, dbri->regs + REG0);
+	}
 
 	for (i = 10; ((dbri->mm.status & 0xe4) != 0x20); --i)
 		msleep_interruptible(1);
@@ -1709,7 +1703,6 @@ static void xmit_descs(struct snd_dbri *dbri)
 	struct dbri_streaminfo *info;
 	u32 dvma_addr;
 	s32 *cmd;
-	unsigned long flags;
 	int first_td;
 
 	if (dbri == NULL)
@@ -1717,7 +1710,7 @@ static void xmit_descs(struct snd_dbri *dbri)
 
 	dvma_addr = (u32)dbri->dma_dvma;
 	info = &dbri->stream_info[DBRI_REC];
-	spin_lock_irqsave(&dbri->lock, flags);
+	guard(spinlock_irqsave)(&dbri->lock);
 
 	if (info->pipe >= 0) {
 		first_td = dbri->pipes[info->pipe].first_desc;
@@ -1760,8 +1753,6 @@ static void xmit_descs(struct snd_dbri *dbri)
 			dbri->pipes[info->pipe].desc = first_td;
 		}
 	}
-
-	spin_unlock_irqrestore(&dbri->lock, flags);
 }
 
 /* transmission_complete_intr()
@@ -1932,7 +1923,7 @@ static irqreturn_t snd_dbri_interrupt(int irq, void *dev_id)
 
 	if (dbri == NULL)
 		return IRQ_NONE;
-	spin_lock(&dbri->lock);
+	guard(spinlock)(&dbri->lock);
 
 	/*
 	 * Read it, so the interrupt goes away.
@@ -1977,8 +1968,6 @@ static irqreturn_t snd_dbri_interrupt(int irq, void *dev_id)
 
 	dbri_process_interrupt_buffer(dbri);
 
-	spin_unlock(&dbri->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -2046,17 +2035,16 @@ static int snd_dbri_open(struct snd_pcm_substream *substream)
 	struct snd_dbri *dbri = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dbri_streaminfo *info = DBRI_STREAM(dbri, substream);
-	unsigned long flags;
 
 	dprintk(D_USR, "open audio output.\n");
 	runtime->hw = snd_dbri_pcm_hw;
 
-	spin_lock_irqsave(&dbri->lock, flags);
-	info->substream = substream;
-	info->offset = 0;
-	info->dvma_buffer = 0;
-	info->pipe = -1;
-	spin_unlock_irqrestore(&dbri->lock, flags);
+	scoped_guard(spinlock_irqsave, &dbri->lock) {
+		info->substream = substream;
+		info->offset = 0;
+		info->dvma_buffer = 0;
+		info->pipe = -1;
+	}
 
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			    snd_hw_rule_format, NULL, SNDRV_PCM_HW_PARAM_FORMAT,
@@ -2160,7 +2148,7 @@ static int snd_dbri_prepare(struct snd_pcm_substream *substream)
 	else
 		info->pipe = 6;	/* Receive pipe */
 
-	spin_lock_irq(&dbri->lock);
+	guard(spinlock_irq)(&dbri->lock);
 	info->offset = 0;
 
 	/* Setup the all the transmit/receive descriptors to cover the
@@ -2169,8 +2157,6 @@ static int snd_dbri_prepare(struct snd_pcm_substream *substream)
 	ret = setup_descs(dbri, DBRI_STREAMNO(substream),
 			  snd_pcm_lib_period_bytes(substream));
 
-	spin_unlock_irq(&dbri->lock);
-
 	dprintk(D_USR, "prepare audio output. %d bytes\n", info->size);
 	return ret;
 }
-- 
2.50.1

