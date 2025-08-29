Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E771E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479676; cv=none; b=PLZvJFyVR7cucKiGIuXFEm8AFC6ZhvLNLA8TbTwDXIwyfccZb4+fHw3aWl4JXt6sSsbrnUBZRtwOhzvV7FDaTVgsjFQ3TBcIbPCY268juSA7y4cWeY2mzyApC13kfibPhbMkz0jHB7j4dtUe1zL8C9N4NYPAyJfrtmzPyIIpEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479676; c=relaxed/simple;
	bh=h3n8t9m4UYu7TxVXu62PMFJ+3MfPDDFLqUlkTIcGQZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lN7RCf+bPT8sE/GASTQs3N3L6kXxrxhXBfr9df9+pNNUOYGnEgDSJHmSI68Ne+DKzloEgj2CZFP+idnfKymbwlaJFgBp4jqKwnGQbvqhfQ8wTvhi/Ba5v6LvCphqpU+ByBb5QZ96DgkC6SONb9Ef+1ZeTT3idb+4G4/af9OCVfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ItMwHtT5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v72K23HB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+jW5NcG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xQwpRRYS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ItMwHtT5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v72K23HB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+jW5NcG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xQwpRRYS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EFB0E5C248;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv81gRLRgeLalAx4rBS9+n2DvvBg0qM82OJ0e9nEXG8=;
	b=ItMwHtT5RZoqJpjwcqzP6cbTLZ9TSjeKXAZeqKD0oUWe1sQx/0gR1gJcT2zeUmsuh83E4t
	YfKey/MavI2NcO0IPtgg+WMq1RKeoxFQcTmCGOAOJ800/1Rw/NQ6hYLNXrxYGJGIGdHDMV
	W9HXInSkfbxGLnj0H6VRkkxSKXUSk/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv81gRLRgeLalAx4rBS9+n2DvvBg0qM82OJ0e9nEXG8=;
	b=v72K23HBXJ5ZhslHXUWuy6XxoROft1Aq7YFgM3PdeM4gBBXB07qs7ctuAeFirLj18Pn96N
	jNvpvFZAtnWgI+BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv81gRLRgeLalAx4rBS9+n2DvvBg0qM82OJ0e9nEXG8=;
	b=k+jW5NcGVn8F6mX4dA9u7HQdvczYy4VytKHnR6XiFtmdAgqqad67nUbv+QS57fTgB7CEHe
	BscklOXE/TNAi3RKSeiEJRhOmjulHD1ZOIvzPLUzfugnzbbPrvrovBRWDNid1TdvK2hB6W
	E686PvWDdp7b8dwaAPvwaX6/9y7xICo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv81gRLRgeLalAx4rBS9+n2DvvBg0qM82OJ0e9nEXG8=;
	b=xQwpRRYSLdNdsGfxfvEGOTvA1K+EEfqzf/0hwwd54BaIteRgqD6ONq6+VYTgt80YtOkkVd
	y5OVfU5ozdUshEAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5F5F13326;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oIgcM5DAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/13] ALSA: serial-u16550: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:24 +0200
Message-ID: <20250829150026.6379-14-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/serial-u16550.c | 48 +++++++++++------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 52772ccfc377..3c28961091b1 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -281,29 +281,24 @@ static irqreturn_t snd_uart16550_interrupt(int irq, void *dev_id)
 	struct snd_uart16550 *uart;
 
 	uart = dev_id;
-	spin_lock(&uart->open_lock);
-	if (uart->filemode == SERIAL_MODE_NOT_OPENED) {
-		spin_unlock(&uart->open_lock);
+	guard(spinlock)(&uart->open_lock);
+	if (uart->filemode == SERIAL_MODE_NOT_OPENED)
 		return IRQ_NONE;
-	}
 	/* indicate to the UART that the interrupt has been serviced */
 	inb(uart->base + UART_IIR);
 	snd_uart16550_io_loop(uart);
-	spin_unlock(&uart->open_lock);
 	return IRQ_HANDLED;
 }
 
 /* When the polling mode, this function calls snd_uart16550_io_loop. */
 static void snd_uart16550_buffer_timer(struct timer_list *t)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart;
 
 	uart = timer_container_of(uart, t, buffer_timer);
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 	snd_uart16550_del_timer(uart);
 	snd_uart16550_io_loop(uart);
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 }
 
 /*
@@ -499,71 +494,61 @@ static void snd_uart16550_do_close(struct snd_uart16550 * uart)
 
 static int snd_uart16550_input_open(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 	if (uart->filemode == SERIAL_MODE_NOT_OPENED)
 		snd_uart16550_do_open(uart);
 	uart->filemode |= SERIAL_MODE_INPUT_OPEN;
 	uart->midi_input[substream->number] = substream;
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 	return 0;
 }
 
 static int snd_uart16550_input_close(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 	uart->filemode &= ~SERIAL_MODE_INPUT_OPEN;
 	uart->midi_input[substream->number] = NULL;
 	if (uart->filemode == SERIAL_MODE_NOT_OPENED)
 		snd_uart16550_do_close(uart);
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 	return 0;
 }
 
 static void snd_uart16550_input_trigger(struct snd_rawmidi_substream *substream,
 					int up)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 	if (up)
 		uart->filemode |= SERIAL_MODE_INPUT_TRIGGERED;
 	else
 		uart->filemode &= ~SERIAL_MODE_INPUT_TRIGGERED;
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 }
 
 static int snd_uart16550_output_open(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 	if (uart->filemode == SERIAL_MODE_NOT_OPENED)
 		snd_uart16550_do_open(uart);
 	uart->filemode |= SERIAL_MODE_OUTPUT_OPEN;
 	uart->midi_output[substream->number] = substream;
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 	return 0;
 };
 
 static int snd_uart16550_output_close(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 	uart->filemode &= ~SERIAL_MODE_OUTPUT_OPEN;
 	uart->midi_output[substream->number] = NULL;
 	if (uart->filemode == SERIAL_MODE_NOT_OPENED)
 		snd_uart16550_do_close(uart);
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 	return 0;
 };
 
@@ -632,7 +617,6 @@ static int snd_uart16550_output_byte(struct snd_uart16550 *uart,
 
 static void snd_uart16550_output_write(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	unsigned char midi_byte, addr_byte;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 	char first;
@@ -643,7 +627,7 @@ static void snd_uart16550_output_write(struct snd_rawmidi_substream *substream)
 	 * variables (ie buff_in & buff_out)
 	 */
 
-	spin_lock_irqsave(&uart->open_lock, flags);
+	guard(spinlock_irqsave)(&uart->open_lock);
 
 	if (uart->irq < 0)	/* polling */
 		snd_uart16550_io_loop(uart);
@@ -718,21 +702,19 @@ static void snd_uart16550_output_write(struct snd_rawmidi_substream *substream)
 		}
 		lasttime = jiffies;
 	}
-	spin_unlock_irqrestore(&uart->open_lock, flags);
 }
 
 static void snd_uart16550_output_trigger(struct snd_rawmidi_substream *substream,
 					 int up)
 {
-	unsigned long flags;
 	struct snd_uart16550 *uart = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&uart->open_lock, flags);
-	if (up)
-		uart->filemode |= SERIAL_MODE_OUTPUT_TRIGGERED;
-	else
-		uart->filemode &= ~SERIAL_MODE_OUTPUT_TRIGGERED;
-	spin_unlock_irqrestore(&uart->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &uart->open_lock) {
+		if (up)
+			uart->filemode |= SERIAL_MODE_OUTPUT_TRIGGERED;
+		else
+			uart->filemode &= ~SERIAL_MODE_OUTPUT_TRIGGERED;
+	}
 	if (up)
 		snd_uart16550_output_write(substream);
 }
-- 
2.50.1

