Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E51E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479674; cv=none; b=ZV4g5W31AnA+EXFmLz5s4wlloGkqBtNPFKsc5dTZ95iAnKSk/FU/5CMn1cioZa8YVGDmpofaBu1EwWEn8JeeRnhNmt1I0ULVI6CV9sNPAh+eFyPaFM0ZL1QuJb5Jc7JIeMz/oRApKvsZ/0AThd1bbD2afnz7E3OeFr0aodQkGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479674; c=relaxed/simple;
	bh=ZpID5ERFNzo80WN5l0nSTTNH5iQ1h7TZ9b5jzyxg3rA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+DnDY4Vlp6pwzv3IqM1TtwdKkxZjtsMZ35gT/l+fz5BnUNswtL5WxG2fYGbN1EAHSm2Qt4sd8O1+C4ODx5pD7ATtkUTeI3VwNbUt36wPzbeK4c7ZNT9SXIS8enGbX5c/2crNaz+1F4BVutzjfZ3PgftcP23if8Kt9gUw+Gh+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Irfg/B9c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPJTxkqx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Irfg/B9c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPJTxkqx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Irfg/B9c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPJTxkqx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Irfg/B9c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPJTxkqx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0A9933EE2;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNWLJsUScDJ6EH2WcSnfjW8sw6J6Jrwr2UYCk9FSo14=;
	b=Irfg/B9cdsXxV97lPUIQ+ehwR7xFqyCEduJg0mfnMEmVKZIoDXOI//W9hlLx46BB+KGmne
	BXMbGpL2d13d3fggf0ieQdZsnCD5gGlq8QQiJWG8gn9rj0Ue9t10qfoWKjGOcspF+AYsnN
	As6He5//EHC5VlLpi8pmYsuagZfmLLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNWLJsUScDJ6EH2WcSnfjW8sw6J6Jrwr2UYCk9FSo14=;
	b=HPJTxkqxi8hYOw07XEDu23IVpWtTLqtcGW505jubmJvyrM246qi7grwBuOCDqX1BjmQKgB
	TB2LJ9eoO7GLOgAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Irfg/B9c";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HPJTxkqx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNWLJsUScDJ6EH2WcSnfjW8sw6J6Jrwr2UYCk9FSo14=;
	b=Irfg/B9cdsXxV97lPUIQ+ehwR7xFqyCEduJg0mfnMEmVKZIoDXOI//W9hlLx46BB+KGmne
	BXMbGpL2d13d3fggf0ieQdZsnCD5gGlq8QQiJWG8gn9rj0Ue9t10qfoWKjGOcspF+AYsnN
	As6He5//EHC5VlLpi8pmYsuagZfmLLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNWLJsUScDJ6EH2WcSnfjW8sw6J6Jrwr2UYCk9FSo14=;
	b=HPJTxkqxi8hYOw07XEDu23IVpWtTLqtcGW505jubmJvyrM246qi7grwBuOCDqX1BjmQKgB
	TB2LJ9eoO7GLOgAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B737313A54;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OHODK5DAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/13] ALSA: portman2x4: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:23 +0200
Message-ID: <20250829150026.6379-13-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: D0A9933EE2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/portman2x4.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index b4fa6625a3d6..b903a138fc2a 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -496,29 +496,25 @@ static void snd_portman_midi_input_trigger(struct snd_rawmidi_substream *substre
 					   int up)
 {
 	struct portman *pm = substream->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&pm->reg_lock, flags);
+	guard(spinlock_irqsave)(&pm->reg_lock);
 	if (up)
 		pm->mode[substream->number] |= PORTMAN2X4_MODE_INPUT_TRIGGERED;
 	else
 		pm->mode[substream->number] &= ~PORTMAN2X4_MODE_INPUT_TRIGGERED;
-	spin_unlock_irqrestore(&pm->reg_lock, flags);
 }
 
 static void snd_portman_midi_output_trigger(struct snd_rawmidi_substream *substream,
 					    int up)
 {
 	struct portman *pm = substream->rmidi->private_data;
-	unsigned long flags;
 	unsigned char byte;
 
-	spin_lock_irqsave(&pm->reg_lock, flags);
+	guard(spinlock_irqsave)(&pm->reg_lock);
 	if (up) {
 		while ((snd_rawmidi_transmit(substream, &byte, 1) == 1))
 			portman_write_midi(pm, substream->number, byte);
 	}
-	spin_unlock_irqrestore(&pm->reg_lock, flags);
 }
 
 static const struct snd_rawmidi_ops snd_portman_midi_output = {
@@ -590,7 +586,7 @@ static void snd_portman_interrupt(void *userdata)
 	unsigned char midivalue = 0;
 	struct portman *pm = ((struct snd_card*)userdata)->private_data;
 
-	spin_lock(&pm->reg_lock);
+	guard(spinlock)(&pm->reg_lock);
 
 	/* While any input data is waiting */
 	while ((portman_read_status(pm) & INT_REQ) == INT_REQ) {
@@ -617,8 +613,6 @@ static void snd_portman_interrupt(void *userdata)
 		}
 
 	}
-
-	spin_unlock(&pm->reg_lock);
 }
 
 static void snd_portman_attach(struct parport *p)
-- 
2.50.1

