Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0391DD38E
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037663; cv=none; b=ProrapW5mqZiG3yEM10307OTGGyWHEL6xMmTDp83sB1utvu4Fj70QSRnAw30XOkmY8K127pIyUZdpbfT5Q9sbGM1Q17S2I9VXFylNmYNZ5DBcgeo5E3cbOm/DBExTis4naOQbTofUEPWrUlmGmFnYis21eZQiZigS0oaeABfL8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037663; c=relaxed/simple;
	bh=i5r2KfxBv2DFgD2iY+2DStWXWUZ+1DCpPrDzVNxiu6Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msjP3+p2Tc+AuYKl1taSXaiS5YeOelp/dpMIjhSuEe8QmcwTQ6KbGLLIPgZGFSzQ+Apx2cd5LBuVA8HsKTQR6OgjySb4Us0cmcI/aZG59IYk5wf6lXIvagAlFz4Nk8QtqECISIH82J58D+hFU0GOh4JuEKN+/++ICO1AA7x1nCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YIQQUULT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xgMsvPCX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YIQQUULT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xgMsvPCX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YIQQUULT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xgMsvPCX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YIQQUULT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xgMsvPCX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C31F21D18;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NSpkCaAK/OOWOlT+uH8QQxmHurRa6r2YEqhg2YVnIE=;
	b=YIQQUULTum9By2LkzcQi2eYtOvdv97dqWaQZAQuJZay3GaHO6pxz6h7FxdZXuftP0N49JT
	6o/AyiMxdTxPlL0aacHQ9Qbz5xXHtFO146gTTwEPj0c1Yq8wWTA+NMgr64vEp53+lGUmjm
	SPwn0gHAsvYdXMqOVWMNv0u2C8+DYbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NSpkCaAK/OOWOlT+uH8QQxmHurRa6r2YEqhg2YVnIE=;
	b=xgMsvPCXUshNT7tqQjt9yOz/A0iz1KQdOupTo7exTlYJtDw9bQ0NwOk4NoGz3fbkq/utBG
	jyJ2UoUFzJygJkDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NSpkCaAK/OOWOlT+uH8QQxmHurRa6r2YEqhg2YVnIE=;
	b=YIQQUULTum9By2LkzcQi2eYtOvdv97dqWaQZAQuJZay3GaHO6pxz6h7FxdZXuftP0N49JT
	6o/AyiMxdTxPlL0aacHQ9Qbz5xXHtFO146gTTwEPj0c1Yq8wWTA+NMgr64vEp53+lGUmjm
	SPwn0gHAsvYdXMqOVWMNv0u2C8+DYbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6NSpkCaAK/OOWOlT+uH8QQxmHurRa6r2YEqhg2YVnIE=;
	b=xgMsvPCXUshNT7tqQjt9yOz/A0iz1KQdOupTo7exTlYJtDw9bQ0NwOk4NoGz3fbkq/utBG
	jyJ2UoUFzJygJkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53C5E13B05;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OAtUE9l3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/54] ALSA: mtpav: Use standard print API
Date: Wed,  7 Aug 2024 15:33:55 +0200
Message-ID: <20240807133452.9424-6-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.950];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

The commented-out debug prints got removed, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mtpav.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index f212f233ea61..946184a2a758 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -285,10 +285,6 @@ static void snd_mtpav_output_port_write(struct mtpav *mtp_card,
 
 		snd_mtpav_send_byte(mtp_card, 0xf5);
 		snd_mtpav_send_byte(mtp_card, portp->hwport);
-		/*
-		snd_printk(KERN_DEBUG "new outport: 0x%x\n",
-			   (unsigned int) portp->hwport);
-		*/
 		if (!(outbyte & 0x80) && portp->running_status)
 			snd_mtpav_send_byte(mtp_card, portp->running_status);
 	}
@@ -522,8 +518,6 @@ static void snd_mtpav_read_bytes(struct mtpav *mcrd)
 
 	u8 sbyt = snd_mtpav_getreg(mcrd, SREG);
 
-	/* printk(KERN_DEBUG "snd_mtpav_read_bytes() sbyt: 0x%x\n", sbyt); */
-
 	if (!(sbyt & SIGS_BYTE))
 		return;
 
@@ -569,13 +563,13 @@ static int snd_mtpav_get_ISA(struct mtpav *mcard)
 	mcard->res_port = devm_request_region(mcard->card->dev, port, 3,
 					      "MotuMTPAV MIDI");
 	if (!mcard->res_port) {
-		snd_printk(KERN_ERR "MTVAP port 0x%lx is busy\n", port);
+		dev_err(mcard->card->dev, "MTVAP port 0x%lx is busy\n", port);
 		return -EBUSY;
 	}
 	mcard->port = port;
 	if (devm_request_irq(mcard->card->dev, irq, snd_mtpav_irqh, 0,
 			     "MOTU MTPAV", mcard)) {
-		snd_printk(KERN_ERR "MTVAP IRQ %d busy\n", irq);
+		dev_err(mcard->card->dev, "MTVAP IRQ %d busy\n", irq);
 		return -EBUSY;
 	}
 	mcard->irq = irq;
@@ -717,7 +711,9 @@ static int snd_mtpav_probe(struct platform_device *dev)
 	card->private_free = snd_mtpav_free;
 
 	platform_set_drvdata(dev, card);
-	printk(KERN_INFO "Motu MidiTimePiece on parallel port irq: %d ioport: 0x%lx\n", irq, port);
+	dev_info(card->dev,
+		 "Motu MidiTimePiece on parallel port irq: %d ioport: 0x%lx\n",
+		 irq, port);
 	return 0;
 }
 
-- 
2.43.0

