Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE11D0DC5
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037660; cv=none; b=ZzE3oENGd1luCalrBG9kOu2iAfb0gCWtzdQ3ceip4y6BYesfgaZzXhGfSGR/2wrw5BZvF1CZ01o+429rHQZD8LzRLAQN9VJhlXa+4SZ3YNbQLTAq5bwrI8mzaef3A3YOrBVQlN6+qnlTzCU7k9CTLXI0Kn6D1vPcuXyE7TmrVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037660; c=relaxed/simple;
	bh=ZTZgKBHR9et3fdN9lziP7I04S1z4Hi3dEUQZG/pk7RI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOj1BnswDQOakprBtb3jfTc0F83UODDih0MQ/GltpwW8AYox9fcdKNDFaq+FF6G003T06LP+C1g2WPRTAyUXV67q0H7q1VOkFZE5+qLYx34EkgGS/00OsazOSHw19M8mYJWuaA/4Ax5U6MG2MrdQ4uMjSKfBBhM5tIpAs4NZqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZvWTJNoB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0aoKTLbp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZvWTJNoB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0aoKTLbp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZvWTJNoB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0aoKTLbp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZvWTJNoB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0aoKTLbp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FBC921D17;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt+V4FX2QHSpKAHXCFHMOsusgF3+B24IURRjeQ+C/A=;
	b=ZvWTJNoBiDT8fKfwLmc0Qu2XkOr4y8M6XbUOPJOXWBu+9NF1HuZ85eypGlLXlznViT8clL
	gdnS+sy4C76Cw5zcCZl3rRQl6SgZrIaPix9n2b3bqPXV9b3FMNyBp/Txn0WnZCa3YvhqLS
	0G74jaMgM0t8WmieY1G0zI9EeQwxy8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt+V4FX2QHSpKAHXCFHMOsusgF3+B24IURRjeQ+C/A=;
	b=0aoKTLbpnOZnM4/aYGsekdhv8DbPDWw4kG9xYjBGIrb9AAkukX54D7tOm3dar4VR3ZVBp5
	PtjUoij7GmjoJFCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt+V4FX2QHSpKAHXCFHMOsusgF3+B24IURRjeQ+C/A=;
	b=ZvWTJNoBiDT8fKfwLmc0Qu2XkOr4y8M6XbUOPJOXWBu+9NF1HuZ85eypGlLXlznViT8clL
	gdnS+sy4C76Cw5zcCZl3rRQl6SgZrIaPix9n2b3bqPXV9b3FMNyBp/Txn0WnZCa3YvhqLS
	0G74jaMgM0t8WmieY1G0zI9EeQwxy8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZt+V4FX2QHSpKAHXCFHMOsusgF3+B24IURRjeQ+C/A=;
	b=0aoKTLbpnOZnM4/aYGsekdhv8DbPDWw4kG9xYjBGIrb9AAkukX54D7tOm3dar4VR3ZVBp5
	PtjUoij7GmjoJFCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 356CB13A7D;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gLPjC9l3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/54] ALSA: mpu401_uart: Use standard print API
Date: Wed,  7 Aug 2024 15:33:54 +0200
Message-ID: <20240807133452.9424-5-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.947];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.21

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

The assignment of mpu->rmidi was moved to an earlier place, so that
dev_*() can access to the proper device pointer.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mpu401/mpu401_uart.c | 31 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
index f435b9b4ae24..8e3318e17717 100644
--- a/sound/drivers/mpu401/mpu401_uart.c
+++ b/sound/drivers/mpu401/mpu401_uart.c
@@ -73,8 +73,9 @@ static void snd_mpu401_uart_clear_rx(struct snd_mpu401 *mpu)
 		mpu->read(mpu, MPU401D(mpu));
 #ifdef CONFIG_SND_DEBUG
 	if (timeout <= 0)
-		snd_printk(KERN_ERR "cmd: clear rx timeout (status = 0x%x)\n",
-			   mpu->read(mpu, MPU401C(mpu)));
+		dev_err(mpu->rmidi->dev,
+			"cmd: clear rx timeout (status = 0x%x)\n",
+			mpu->read(mpu, MPU401C(mpu)));
 #endif
 }
 
@@ -224,8 +225,9 @@ static int snd_mpu401_uart_cmd(struct snd_mpu401 * mpu, unsigned char cmd,
 			udelay(10);
 #ifdef CONFIG_SND_DEBUG
 		if (!timeout)
-			snd_printk(KERN_ERR "cmd: tx timeout (status = 0x%x)\n",
-				   mpu->read(mpu, MPU401C(mpu)));
+			dev_err(mpu->rmidi->dev,
+				"cmd: tx timeout (status = 0x%x)\n",
+				mpu->read(mpu, MPU401C(mpu)));
 #endif
 	}
 	mpu->write(mpu, cmd, MPU401C(mpu));
@@ -244,10 +246,11 @@ static int snd_mpu401_uart_cmd(struct snd_mpu401 * mpu, unsigned char cmd,
 		ok = 1;
 	spin_unlock_irqrestore(&mpu->input_lock, flags);
 	if (!ok) {
-		snd_printk(KERN_ERR "cmd: 0x%x failed at 0x%lx "
-			   "(status = 0x%x, data = 0x%x)\n", cmd, mpu->port,
-			   mpu->read(mpu, MPU401C(mpu)),
-			   mpu->read(mpu, MPU401D(mpu)));
+		dev_err(mpu->rmidi->dev,
+			"cmd: 0x%x failed at 0x%lx (status = 0x%x, data = 0x%x)\n",
+			cmd, mpu->port,
+			mpu->read(mpu, MPU401C(mpu)),
+			mpu->read(mpu, MPU401D(mpu)));
 		return 1;
 	}
 	return 0;
@@ -546,13 +549,14 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 	spin_lock_init(&mpu->timer_lock);
 	mpu->hardware = hardware;
 	mpu->irq = -1;
+	mpu->rmidi = rmidi;
 	if (! (info_flags & MPU401_INFO_INTEGRATED)) {
 		int res_size = hardware == MPU401_HW_PC98II ? 4 : 2;
 		mpu->res = request_region(port, res_size, "MPU401 UART");
 		if (!mpu->res) {
-			snd_printk(KERN_ERR "mpu401_uart: "
-				   "unable to grab port 0x%lx size %d\n",
-				   port, res_size);
+			dev_err(rmidi->dev,
+				"mpu401_uart: unable to grab port 0x%lx size %d\n",
+				port, res_size);
 			err = -EBUSY;
 			goto free_device;
 		}
@@ -572,8 +576,8 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 	if (irq >= 0) {
 		if (request_irq(irq, snd_mpu401_uart_interrupt, 0,
 				"MPU401 UART", (void *) mpu)) {
-			snd_printk(KERN_ERR "mpu401_uart: "
-				   "unable to grab IRQ %d\n", irq);
+			dev_err(rmidi->dev,
+				"mpu401_uart: unable to grab IRQ %d\n", irq);
 			err = -EBUSY;
 			goto free_device;
 		}
@@ -599,7 +603,6 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
 		if (out_enable)
 			rmidi->info_flags |= SNDRV_RAWMIDI_INFO_DUPLEX;
 	}
-	mpu->rmidi = rmidi;
 	if (rrawmidi)
 		*rrawmidi = rmidi;
 	return 0;
-- 
2.43.0

