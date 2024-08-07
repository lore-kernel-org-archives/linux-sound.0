Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E54B1E6741
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037661; cv=none; b=NCeM0Ru+CY9iXSbhBX2i1Bu2x3Xukk1tjocafswuq5Ic9DKt2D9V5YcAr7mHc41eaErDo4jkLcCn9btYAUkIeEIC1YcsjAkL7XtfT1CAsmXw0st0VS4Pej47SssomVgbm570JdPkgzwJIlrVm6JhK0f+GxfPHQpln2wkmvSSqVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037661; c=relaxed/simple;
	bh=KQCnKUtBonyNeRnOl1I4CgL8wKjOxDyRZqj1P/vNpio=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fm8b9Nk2Fk+i0g1knRdeBA1g0GjFtca2DSPypnvwP2VxLfMHcAiT820rvOZ1w9WF0tlfeqMfSiAqy99Gw62hacQTYIFAI+3SExLUw+lLt5fdnebAbBwa0Z/uRUSihll9GNCdSMESzMV14sug960DPhqWXXpqoPluKrBJUkMFvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FyUX+wyr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zgL1Iu+8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FyUX+wyr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zgL1Iu+8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FyUX+wyr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zgL1Iu+8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FyUX+wyr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zgL1Iu+8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7C5A21D19;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kc68XYuKxv8o5xhcFtty2I6Kf53cAQxT9m57Xpuk6w=;
	b=FyUX+wyrPqMv5VHdzqcP0fVczx/iqSvZFuzMda2NS9DeDn1+Czaud9gzLY/VsWTf/RLjnv
	+ooHVPLb80vs05bWBAj8FLl6QkWIi7wc1U7xNMQ0520Bsos5TEulHNolljbbYysS9pHa0K
	SGjNRmfedEBrrrulTFwydvE4wDgsRKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kc68XYuKxv8o5xhcFtty2I6Kf53cAQxT9m57Xpuk6w=;
	b=zgL1Iu+8AAljoPryzqNdESvjSiOOgxQ78SXuKNxUtfTp202u30rnGrPdoMWqSV5QdV8cMU
	8ohscNvJLI4+CqDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FyUX+wyr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zgL1Iu+8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kc68XYuKxv8o5xhcFtty2I6Kf53cAQxT9m57Xpuk6w=;
	b=FyUX+wyrPqMv5VHdzqcP0fVczx/iqSvZFuzMda2NS9DeDn1+Czaud9gzLY/VsWTf/RLjnv
	+ooHVPLb80vs05bWBAj8FLl6QkWIi7wc1U7xNMQ0520Bsos5TEulHNolljbbYysS9pHa0K
	SGjNRmfedEBrrrulTFwydvE4wDgsRKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kc68XYuKxv8o5xhcFtty2I6Kf53cAQxT9m57Xpuk6w=;
	b=zgL1Iu+8AAljoPryzqNdESvjSiOOgxQ78SXuKNxUtfTp202u30rnGrPdoMWqSV5QdV8cMU
	8ohscNvJLI4+CqDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEE8A13B06;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sE2SKdl3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/54] ALSA: serial-u16550: Use standard print API
Date: Wed,  7 Aug 2024 15:33:58 +0200
Message-ID: <20240807133452.9424-9-tiwai@suse.de>
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
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C7C5A21D19
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/serial-u16550.c | 41 ++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 3cbc7a4adcb4..f66e01624c68 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -224,9 +224,9 @@ static void snd_uart16550_io_loop(struct snd_uart16550 * uart)
 			snd_rawmidi_receive(uart->midi_input[substream], &c, 1);
 
 		if (status & UART_LSR_OE)
-			snd_printk(KERN_WARNING
-				   "%s: Overrun on device at 0x%lx\n",
-			       uart->rmidi->name, uart->base);
+			dev_warn(uart->card->dev,
+				 "%s: Overrun on device at 0x%lx\n",
+				 uart->rmidi->name, uart->base);
 	}
 
 	/* remember the last stream */
@@ -323,7 +323,8 @@ static int snd_uart16550_detect(struct snd_uart16550 *uart)
 	}
 
 	if (!devm_request_region(uart->card->dev, io_base, 8, "Serial MIDI")) {
-		snd_printk(KERN_ERR "u16550: can't grab port 0x%lx\n", io_base);
+		dev_err(uart->card->dev,
+			"u16550: can't grab port 0x%lx\n", io_base);
 		return -EBUSY;
 	}
 
@@ -619,9 +620,9 @@ static int snd_uart16550_output_byte(struct snd_uart16550 *uart,
 		}
 	} else {
 		if (!snd_uart16550_write_buffer(uart, midi_byte)) {
-			snd_printk(KERN_WARNING
-				   "%s: Buffer overrun on device at 0x%lx\n",
-				   uart->rmidi->name, uart->base);
+			dev_warn(uart->card->dev,
+				 "%s: Buffer overrun on device at 0x%lx\n",
+				 uart->rmidi->name, uart->base);
 			return 0;
 		}
 	}
@@ -775,15 +776,15 @@ static int snd_uart16550_create(struct snd_card *card,
 
 	err = snd_uart16550_detect(uart);
 	if (err <= 0) {
-		printk(KERN_ERR "no UART detected at 0x%lx\n", iobase);
+		dev_err(card->dev, "no UART detected at 0x%lx\n", iobase);
 		return -ENODEV;
 	}
 
 	if (irq >= 0 && irq != SNDRV_AUTO_IRQ) {
 		if (devm_request_irq(card->dev, irq, snd_uart16550_interrupt,
 				     0, "Serial MIDI", uart)) {
-			snd_printk(KERN_WARNING
-				   "irq %d busy. Using Polling.\n", irq);
+			dev_warn(card->dev,
+				 "irq %d busy. Using Polling.\n", irq);
 		} else {
 			uart->irq = irq;
 		}
@@ -879,23 +880,23 @@ static int snd_serial_probe(struct platform_device *devptr)
 	case SNDRV_SERIAL_GENERIC:
 		break;
 	default:
-		snd_printk(KERN_ERR
-			   "Adaptor type is out of range 0-%d (%d)\n",
-			   SNDRV_SERIAL_MAX_ADAPTOR, adaptor[dev]);
+		dev_err(&devptr->dev,
+			"Adaptor type is out of range 0-%d (%d)\n",
+			SNDRV_SERIAL_MAX_ADAPTOR, adaptor[dev]);
 		return -ENODEV;
 	}
 
 	if (outs[dev] < 1 || outs[dev] > SNDRV_SERIAL_MAX_OUTS) {
-		snd_printk(KERN_ERR
-			   "Count of outputs is out of range 1-%d (%d)\n",
-			   SNDRV_SERIAL_MAX_OUTS, outs[dev]);
+		dev_err(&devptr->dev,
+			"Count of outputs is out of range 1-%d (%d)\n",
+			SNDRV_SERIAL_MAX_OUTS, outs[dev]);
 		return -ENODEV;
 	}
 
 	if (ins[dev] < 1 || ins[dev] > SNDRV_SERIAL_MAX_INS) {
-		snd_printk(KERN_ERR
-			   "Count of inputs is out of range 1-%d (%d)\n",
-			   SNDRV_SERIAL_MAX_INS, ins[dev]);
+		dev_err(&devptr->dev,
+			"Count of inputs is out of range 1-%d (%d)\n",
+			SNDRV_SERIAL_MAX_INS, ins[dev]);
 		return -ENODEV;
 	}
 
@@ -975,7 +976,7 @@ static int __init alsa_card_serial_init(void)
 	}
 	if (! cards) {
 #ifdef MODULE
-		printk(KERN_ERR "serial midi soundcard not found or device busy\n");
+		pr_err("serial midi soundcard not found or device busy\n");
 #endif
 		snd_serial_unregister_all();
 		return -ENODEV;
-- 
2.43.0

