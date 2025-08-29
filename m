Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED42135CE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479656; cv=none; b=WopI469bu/lBUO9u5tfNJeAN5XQmj/35Es0uKBaLYpePVTmbIGVY2ueP5IaOw7Ueqg87pXrgAqazMb8ZY8KdvyA+b6WwsOZSkeiyAmLlEA0dPWr4XBnFcnMur2Xgbz+gIhWDvTf+s9BPc4M03GU+lzMMRUf1x+XUrSFazS60fpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479656; c=relaxed/simple;
	bh=dS+z2lIo1rfE6cU0Ypox1XD4k5DqheyS3ESrNlIeB9U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S14aFePgCKAwFwQznBvfGPNJYbuXqbYVMm/SO2iQ2ZU1W3ifJRo8X6ZsgplSUSpx0VL6+X/nR3MWvmbuArdcABPAJsQxf2DJAbITVT9YgTzHqbOcZEnqOJRs+aBDJaHq6IYnBgRm19PJ14OSiA8mDSlBEtUs4u3Uz9HY4bLR8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EI3TfOCU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QqsVVjFE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EI3TfOCU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QqsVVjFE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EI3TfOCU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QqsVVjFE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EI3TfOCU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QqsVVjFE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77F575C245;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wO21tkIHckHcVGVB8zwatm4bSyU4wiJ2c6hT7EYNYq8=;
	b=EI3TfOCUw7Dlk/5R2ti/Y8GW4zLz+UDDIGHUJPuAI+0wAmngg3xzk87AjKCYrrgggrkvo5
	2Q5esxGE4l59HVYNd4EtCFr2zbfdHf6fyd0GV4u8JxzmsfbXSzzytGmhx0plaOGhjGDypk
	oOb4Kwt4hVMaqhVVgBoZ0Z6TuSEGcNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wO21tkIHckHcVGVB8zwatm4bSyU4wiJ2c6hT7EYNYq8=;
	b=QqsVVjFEJAWxX/r+aJ3Mel4pQYZkJIbiiFpJyF2hNLGyfLB6/sk+6ik6lAAiEse4c05Z3U
	Cy6M0Drr8hPILlAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wO21tkIHckHcVGVB8zwatm4bSyU4wiJ2c6hT7EYNYq8=;
	b=EI3TfOCUw7Dlk/5R2ti/Y8GW4zLz+UDDIGHUJPuAI+0wAmngg3xzk87AjKCYrrgggrkvo5
	2Q5esxGE4l59HVYNd4EtCFr2zbfdHf6fyd0GV4u8JxzmsfbXSzzytGmhx0plaOGhjGDypk
	oOb4Kwt4hVMaqhVVgBoZ0Z6TuSEGcNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wO21tkIHckHcVGVB8zwatm4bSyU4wiJ2c6hT7EYNYq8=;
	b=QqsVVjFEJAWxX/r+aJ3Mel4pQYZkJIbiiFpJyF2hNLGyfLB6/sk+6ik6lAAiEse4c05Z3U
	Cy6M0Drr8hPILlAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F03F13326;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0C8cFpDAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/13] ALSA: mpu401: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:20 +0200
Message-ID: <20250829150026.6379-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mpu401/mpu401_uart.c | 41 ++++++++----------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index 670f8ba92c08..4af89822bf32 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -81,27 +81,21 @@ static void snd_mpu401_uart_clear_rx(struct snd_mpu401 *mpu)
 
 static void uart_interrupt_tx(struct snd_mpu401 *mpu)
 {
-	unsigned long flags;
-
 	if (test_bit(MPU401_MODE_BIT_OUTPUT, &mpu->mode) &&
 	    test_bit(MPU401_MODE_BIT_OUTPUT_TRIGGER, &mpu->mode)) {
-		spin_lock_irqsave(&mpu->output_lock, flags);
+		guard(spinlock_irqsave)(&mpu->output_lock);
 		snd_mpu401_uart_output_write(mpu);
-		spin_unlock_irqrestore(&mpu->output_lock, flags);
 	}
 }
 
 static void _snd_mpu401_uart_interrupt(struct snd_mpu401 *mpu)
 {
-	unsigned long flags;
-
 	if (mpu->info_flags & MPU401_INFO_INPUT) {
-		spin_lock_irqsave(&mpu->input_lock, flags);
+		guard(spinlock_irqsave)(&mpu->input_lock);
 		if (test_bit(MPU401_MODE_BIT_INPUT, &mpu->mode))
 			snd_mpu401_uart_input_read(mpu);
 		else
 			snd_mpu401_uart_clear_rx(mpu);
-		spin_unlock_irqrestore(&mpu->input_lock, flags);
 	}
 	if (! (mpu->info_flags & MPU401_INFO_TX_IRQ))
 		/* ok. for better Tx performance try do some output
@@ -158,12 +152,11 @@ EXPORT_SYMBOL(snd_mpu401_uart_interrupt_tx);
 static void snd_mpu401_uart_timer(struct timer_list *t)
 {
 	struct snd_mpu401 *mpu = timer_container_of(mpu, t, timer);
-	unsigned long flags;
 
-	spin_lock_irqsave(&mpu->timer_lock, flags);
-	/*mpu->mode |= MPU401_MODE_TIMER;*/
-	mod_timer(&mpu->timer,  1 + jiffies);
-	spin_unlock_irqrestore(&mpu->timer_lock, flags);
+	scoped_guard(spinlock_irqsave, &mpu->timer_lock) {
+		/*mpu->mode |= MPU401_MODE_TIMER;*/
+		mod_timer(&mpu->timer,  1 + jiffies);
+	}
 	if (mpu->rmidi)
 		_snd_mpu401_uart_interrupt(mpu);
 }
@@ -173,16 +166,13 @@ static void snd_mpu401_uart_timer(struct timer_list *t)
  */
 static void snd_mpu401_uart_add_timer (struct snd_mpu401 *mpu, int input)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave (&mpu->timer_lock, flags);
+	guard(spinlock_irqsave)(&mpu->timer_lock);
 	if (mpu->timer_invoked == 0) {
 		timer_setup(&mpu->timer, snd_mpu401_uart_timer, 0);
 		mod_timer(&mpu->timer, 1 + jiffies);
 	} 
 	mpu->timer_invoked |= input ? MPU401_MODE_INPUT_TIMER :
 		MPU401_MODE_OUTPUT_TIMER;
-	spin_unlock_irqrestore (&mpu->timer_lock, flags);
 }
 
 /*
@@ -190,16 +180,13 @@ static void snd_mpu401_uart_add_timer (struct snd_mpu401 *mpu, int input)
  */
 static void snd_mpu401_uart_remove_timer (struct snd_mpu401 *mpu, int input)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave (&mpu->timer_lock, flags);
+	guard(spinlock_irqsave)(&mpu->timer_lock);
 	if (mpu->timer_invoked) {
 		mpu->timer_invoked &= input ? ~MPU401_MODE_INPUT_TIMER :
 			~MPU401_MODE_OUTPUT_TIMER;
 		if (! mpu->timer_invoked)
 			timer_delete(&mpu->timer);
 	}
-	spin_unlock_irqrestore (&mpu->timer_lock, flags);
 }
 
 /*
@@ -210,10 +197,9 @@ static void snd_mpu401_uart_remove_timer (struct snd_mpu401 *mpu, int input)
 static int snd_mpu401_uart_cmd(struct snd_mpu401 * mpu, unsigned char cmd,
 			       int ack)
 {
-	unsigned long flags;
 	int timeout, ok;
 
-	spin_lock_irqsave(&mpu->input_lock, flags);
+	guard(spinlock_irqsave)(&mpu->input_lock);
 	if (mpu->hardware != MPU401_HW_TRID4DWAVE) {
 		mpu->write(mpu, 0x00, MPU401D(mpu));
 		/*snd_mpu401_uart_clear_rx(mpu);*/
@@ -244,7 +230,6 @@ static int snd_mpu401_uart_cmd(struct snd_mpu401 * mpu, unsigned char cmd,
 			ok = 1;
 	} else
 		ok = 1;
-	spin_unlock_irqrestore(&mpu->input_lock, flags);
 	if (!ok) {
 		dev_err(mpu->rmidi->dev,
 			"cmd: 0x%x failed at 0x%lx (status = 0x%x, data = 0x%x)\n",
@@ -358,7 +343,6 @@ static int snd_mpu401_uart_output_close(struct snd_rawmidi_substream *substream)
 static void
 snd_mpu401_uart_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct snd_mpu401 *mpu;
 	int max = 64;
 
@@ -374,9 +358,8 @@ snd_mpu401_uart_input_trigger(struct snd_rawmidi_substream *substream, int up)
 		}
 		
 		/* read data in advance */
-		spin_lock_irqsave(&mpu->input_lock, flags);
+		guard(spinlock_irqsave)(&mpu->input_lock);
 		snd_mpu401_uart_input_read(mpu);
-		spin_unlock_irqrestore(&mpu->input_lock, flags);
 	} else {
 		if (mpu->info_flags & MPU401_INFO_USE_TIMER)
 			snd_mpu401_uart_remove_timer(mpu, 1);
@@ -445,7 +428,6 @@ static void snd_mpu401_uart_output_write(struct snd_mpu401 * mpu)
 static void
 snd_mpu401_uart_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct snd_mpu401 *mpu;
 
 	mpu = substream->rmidi->private_data;
@@ -460,9 +442,8 @@ snd_mpu401_uart_output_trigger(struct snd_rawmidi_substream *substream, int up)
 			snd_mpu401_uart_add_timer(mpu, 0);
 
 		/* output pending data */
-		spin_lock_irqsave(&mpu->output_lock, flags);
+		guard(spinlock_irqsave)(&mpu->output_lock);
 		snd_mpu401_uart_output_write(mpu);
-		spin_unlock_irqrestore(&mpu->output_lock, flags);
 	} else {
 		if (! (mpu->info_flags & MPU401_INFO_TX_IRQ))
 			snd_mpu401_uart_remove_timer(mpu, 0);
-- 
2.50.1

