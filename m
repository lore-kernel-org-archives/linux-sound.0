Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833612D59FE
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142138; cv=none; b=WptU441tJDnBLP78su30MgJjcKgcmGuu0ft6lMrAhZEEaMPjS4l2I4H7sfJTSOB4YCcWPWfP898p0cwJ7++SJyx+lAGxZIkIzZ2iEfqrPmuOBGPQHvCNbcMVU2mVhrUzEV6PjmXp+UhC7/4IR891fJkJC8s4CTwZpF6hPKP17DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142138; c=relaxed/simple;
	bh=rWbK1clbBICfXeMHRk+cJrR7yD503t/1mo1KJxQ2aBo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8Ikhl07QWJCwawML2H/lVxIpEgTKIFnum2BlhGvG7i6FWQtyYi1gEtYWzKoaI8Ms1KZzB6iwPR+TSyScVNZEAF5SP3+0BXIFuDS7j0Luh3rK9FM7CeFKCXVXp6uyFVCtsUPodb2RtOGPxh3BuhkDkblqoO5YRLDu2rxIr3vEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPW1mo7L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lJhabvOK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BPW1mo7L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lJhabvOK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPW1mo7L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lJhabvOK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BPW1mo7L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lJhabvOK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C10621180;
	Thu, 10 Jul 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRKnFR7WymSw0mLFn8epgFK9gdyVLyiBkBYoLeVeTG8=;
	b=BPW1mo7LE0jT9yd87KkNMJzrAVEVyKusPwMHPiiomPzEmaS5dN2Y6SEfLYs+w56qxmB4js
	eBkUnhNw+VhMl/BxnHYO8N36PN4amUxlBe9i3AO2ghSSLOgapEe2aYVRr47KqMHAWy0A5I
	cq7XlCcT519KeBAMuW+rJV/gULZPCto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRKnFR7WymSw0mLFn8epgFK9gdyVLyiBkBYoLeVeTG8=;
	b=lJhabvOKUGbETJ/WZY6Y2T4+0TpCwGwIjuMqhV7YRgaK7revXmSXiKLXd+cRFfbTQVSAQx
	cPCZstuyA5TCDGBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BPW1mo7L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lJhabvOK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRKnFR7WymSw0mLFn8epgFK9gdyVLyiBkBYoLeVeTG8=;
	b=BPW1mo7LE0jT9yd87KkNMJzrAVEVyKusPwMHPiiomPzEmaS5dN2Y6SEfLYs+w56qxmB4js
	eBkUnhNw+VhMl/BxnHYO8N36PN4amUxlBe9i3AO2ghSSLOgapEe2aYVRr47KqMHAWy0A5I
	cq7XlCcT519KeBAMuW+rJV/gULZPCto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRKnFR7WymSw0mLFn8epgFK9gdyVLyiBkBYoLeVeTG8=;
	b=lJhabvOKUGbETJ/WZY6Y2T4+0TpCwGwIjuMqhV7YRgaK7revXmSXiKLXd+cRFfbTQVSAQx
	cPCZstuyA5TCDGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02C16136DC;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oHbvOumQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 010/103] ALSA: serial-u16550: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:52 +0200
Message-ID: <20250710100727.22653-11-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1C10621180
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/serial-u16550.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 6d0656fcd574..52772ccfc377 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -845,7 +845,7 @@ static int snd_uart16550_rmidi(struct snd_uart16550 *uart, int device,
 			    &snd_uart16550_input);
 	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
 			    &snd_uart16550_output);
-	strcpy(rrawmidi->name, "Serial MIDI");
+	strscpy(rrawmidi->name, "Serial MIDI");
 	snd_uart16550_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT]);
 	snd_uart16550_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT]);
 	rrawmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
@@ -905,8 +905,8 @@ static int snd_serial_probe(struct platform_device *devptr)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "Serial");
-	strcpy(card->shortname, "Serial MIDI (UART16550A)");
+	strscpy(card->driver, "Serial");
+	strscpy(card->shortname, "Serial MIDI (UART16550A)");
 
 	err = snd_uart16550_create(card, port[dev], irq[dev], speed[dev],
 				   base[dev], adaptor[dev], droponfull[dev],
-- 
2.50.0

