Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9566C2D5C6C
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142224; cv=none; b=RhbMOhIlRDfTeqnxOk38yx6lZY6AUeXrMADLrMbirGPJdfzbfG8aexgrgtJtyTMYYLf97vWKy/ZeeXz5acP/XJUqlODKHwop+tkx04XuvH8XVAY+LKwsuapTibxJyHKCuIYj71xUsxv7GldYcqzthpv/uQVUInvN7Z8MZ8leZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142224; c=relaxed/simple;
	bh=ZXK5UaAldw5X6oBfz+bZRIIi/865KLdcoV6UtYAugdg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbDHyHzpJAUzdvHMrsop9ez/xGXmjlZTRizO1cJ7wMs1/YN8P+H92WaW3pYSMkOPeJvtFlJY7zWOIVX29M3+PRuhdK6ZGyXN72dB1Hso0womhP5hpE3IIIAxmR+OjrVu3E7YaMD6uUIFGUbujYZMFUGENNv0KgDaM7g4Ap/qhv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9FavjJc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=450gWgKW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f9FavjJc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=450gWgKW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9FavjJc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="450gWgKW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f9FavjJc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="450gWgKW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B0E7E21199;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WH0A9xEbaeUijm2EF121TGF9TwEUpPZaxe9Byxnu1lw=;
	b=f9FavjJcpW/ZoZmeVdyzOu+x400AhGF4+3dBP9SNqJlGT5AN8afjgu3mjDAwa8cqAURGBU
	4R2QWa1zXJ+1koEqKyH30dSljvzlArs4E12VzFr0bh3ONmv39cFAgXTZQva6dETwo+PuBU
	K6UAjA7fs2c5v+ZsJgp6toj491wISU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WH0A9xEbaeUijm2EF121TGF9TwEUpPZaxe9Byxnu1lw=;
	b=450gWgKWudKmrdINtwSFJanLNmiV03iDdF6HoNpLGfUZC8/cV2i+qJMNKWgDfJ84N6MAFn
	6xRikwzpWYFaVABQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f9FavjJc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=450gWgKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WH0A9xEbaeUijm2EF121TGF9TwEUpPZaxe9Byxnu1lw=;
	b=f9FavjJcpW/ZoZmeVdyzOu+x400AhGF4+3dBP9SNqJlGT5AN8afjgu3mjDAwa8cqAURGBU
	4R2QWa1zXJ+1koEqKyH30dSljvzlArs4E12VzFr0bh3ONmv39cFAgXTZQva6dETwo+PuBU
	K6UAjA7fs2c5v+ZsJgp6toj491wISU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WH0A9xEbaeUijm2EF121TGF9TwEUpPZaxe9Byxnu1lw=;
	b=450gWgKWudKmrdINtwSFJanLNmiV03iDdF6HoNpLGfUZC8/cV2i+qJMNKWgDfJ84N6MAFn
	6xRikwzpWYFaVABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9851E13A70;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GIwKJO2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 037/103] ALSA: wavefront: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:19 +0200
Message-ID: <20250710100727.22653-38-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B0E7E21199
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wavefront/wavefront.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/isa/wavefront/wavefront.c b/sound/isa/wavefront/wavefront.c
index 621ab420a60f..07c68568091d 100644
--- a/sound/isa/wavefront/wavefront.c
+++ b/sound/isa/wavefront/wavefront.c
@@ -234,7 +234,7 @@ static struct snd_hwdep *snd_wavefront_new_synth(struct snd_card *card,
 
 	if (snd_hwdep_new(card, "WaveFront", hw_dev, &wavefront_synth) < 0)
 		return NULL;
-	strcpy (wavefront_synth->name, 
+	strscpy (wavefront_synth->name, 
 		"WaveFront (ICS2115) wavetable synthesizer");
 	wavefront_synth->ops.open = snd_wavefront_synth_open;
 	wavefront_synth->ops.release = snd_wavefront_synth_release;
@@ -292,10 +292,10 @@ static struct snd_rawmidi *snd_wavefront_new_midi(struct snd_card *card,
 		return NULL;
 
 	if (mpu == internal_mpu) {
-		strcpy(rmidi->name, "WaveFront MIDI (Internal)");
+		strscpy(rmidi->name, "WaveFront MIDI (Internal)");
 		rmidi->private_data = &internal_id;
 	} else {
-		strcpy(rmidi->name, "WaveFront MIDI (External)");
+		strscpy(rmidi->name, "WaveFront MIDI (External)");
 		rmidi->private_data = &external_id;
 	}
 
@@ -407,7 +407,7 @@ snd_wavefront_probe (struct snd_card *card, int dev)
 		return -ENOMEM;
 	}
 
-	strcpy (wavefront_synth->name, "ICS2115 Wavetable MIDI Synthesizer");
+	strscpy (wavefront_synth->name, "ICS2115 Wavetable MIDI Synthesizer");
 	wavefront_synth->iface = SNDRV_HWDEP_IFACE_ICS2115;
 	hw_dev++;
 
@@ -478,12 +478,12 @@ snd_wavefront_probe (struct snd_card *card, int dev)
 
 		hw_dev++;
 
-		strcpy(card->driver, "Tropez+");
-		strcpy(card->shortname, "Turtle Beach Tropez+");
+		strscpy(card->driver, "Tropez+");
+		strscpy(card->shortname, "Turtle Beach Tropez+");
 	} else {
 		/* Need a way to distinguish between Maui and Tropez */
-		strcpy(card->driver, "WaveFront");
-		strcpy(card->shortname, "Turtle Beach WaveFront");
+		strscpy(card->driver, "WaveFront");
+		strscpy(card->shortname, "Turtle Beach WaveFront");
 	}
 
 	/* ----- Register the card --------- */
-- 
2.50.0

