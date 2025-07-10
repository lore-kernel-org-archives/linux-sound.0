Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A72D5A10
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142193; cv=none; b=INMq4EU9v+5F/TCqB++mVJk7V21CNy2tzfTwLcf8psza/yXgXzQhx6MuIJoxa5TnMGUpvHnJ9WrsmBZ//YILcsJJSgmbrtYXLbkoOjidImKpq98oVTGJ1jNQtXyEPiMdmmLl8S6STxEERbsFBgSEr7mhEhm55D5Oz3YJZCSiUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142193; c=relaxed/simple;
	bh=Qp/EBqrUBSWwfMRALDB90Z4XifUqs2Uejwvva9abpB8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkNbxn90rwcaLt3oPLdmBt99n3bxGpgzgdQijYRE40sGL0wY1tBFuWFC9O2JvOT0yCJv4Jz5E6dz0J/QQnC7zNQmGLI67DNDJHysLBvA3MnbQdeDcweuS/rV1BUMK7VMdxn1Ou0nwtmTl8LM/F1dbLHUShPTdVV98H/hBnZdYUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=us+vuJsX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KZ0ewuVA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FzWJ3wAT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fzqj6R8P; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="us+vuJsX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KZ0ewuVA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FzWJ3wAT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fzqj6R8P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F01A421193;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWC7H3fxuj+hQ41aKPd/9C53PcGgM5i7Vu1KtvPWdaE=;
	b=us+vuJsXF6hRns/kmn105ffR1UKez3BvGPLOTPrbUhnaPtM1bU1tHcTH3G1Kp+4FNeqQml
	fmRCzqYQLHjA5+OpEW8PWVcFGISgyA0sRoupPmFxqRE4NOZ7b3NixhMp5QmVZiDDA6TtYK
	AQbXNfAir6bA5RDChFPUD9wUR4U+fg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWC7H3fxuj+hQ41aKPd/9C53PcGgM5i7Vu1KtvPWdaE=;
	b=KZ0ewuVAQ+24Avy7Q3TjNWPAexl0jkFF1DL/3akHAUAb8U071n1PAvuzy7taIyR7BodfT0
	4otAioBe0kst4XAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWC7H3fxuj+hQ41aKPd/9C53PcGgM5i7Vu1KtvPWdaE=;
	b=FzWJ3wATEo+ry9Il4i1d5wdaAjvQp0/0aML1x25ooHM1hWXqNp4dKOAoOWEd5EWg58qc7b
	TuBEnBb49Lxk7E/huqf4nSF8EaUoEAE8C1q3cm7LHTkBcXGMq3b4b5dxVM15VCPoPWO0Rg
	D78NCj/Johaw95CS9LR9JYwXXMNGceE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWC7H3fxuj+hQ41aKPd/9C53PcGgM5i7Vu1KtvPWdaE=;
	b=Fzqj6R8Ph7+cBdIYFd9/9o71Sy7G9GX3JhtRb3EzOZrv79rQBnRYcQulisRYJun7sRI84s
	QJLBAUt49jABOEDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D61A713A70;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GF0gM+yQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 031/103] ALSA: gus: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:13 +0200
Message-ID: <20250710100727.22653-32-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_main.c   | 16 ++++++++--------
 sound/isa/gus/gus_mixer.c  |  2 +-
 sound/isa/gus/gus_pcm.c    |  2 +-
 sound/isa/gus/gus_timer.c  |  4 ++--
 sound/isa/gus/gus_uart.c   |  2 +-
 sound/isa/gus/gusextreme.c |  8 ++++----
 sound/isa/gus/gusmax.c     | 16 ++++++++--------
 sound/isa/gus/interwave.c  | 34 +++++++++++++++++-----------------
 8 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index 7166869e423d..873ef4046cd6 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -348,8 +348,8 @@ static int snd_gus_check_version(struct snd_gus_card * gus)
 	rev = inb(GUSP(gus, BOARDVERSION));
 	spin_unlock_irqrestore(&gus->reg_lock, flags);
 	dev_dbg(card->dev, "GF1 [0x%lx] init - val = 0x%x, rev = 0x%x\n", gus->gf1.port, val, rev);
-	strcpy(card->driver, "GUS");
-	strcpy(card->longname, "Gravis UltraSound Classic (2.4)");
+	strscpy(card->driver, "GUS");
+	strscpy(card->longname, "Gravis UltraSound Classic (2.4)");
 	if ((val != 255 && (val & 0x06)) || (rev >= 5 && rev != 255)) {
 		if (rev >= 5 && rev <= 9) {
 			gus->ics_flag = 1;
@@ -360,16 +360,16 @@ static int snd_gus_check_version(struct snd_gus_card * gus)
 		}
 		if (rev >= 10 && rev != 255) {
 			if (rev >= 10 && rev <= 11) {
-				strcpy(card->driver, "GUS MAX");
-				strcpy(card->longname, "Gravis UltraSound MAX");
+				strscpy(card->driver, "GUS MAX");
+				strscpy(card->longname, "Gravis UltraSound MAX");
 				gus->max_flag = 1;
 			} else if (rev == 0x30) {
-				strcpy(card->driver, "GUS ACE");
-				strcpy(card->longname, "Gravis UltraSound Ace");
+				strscpy(card->driver, "GUS ACE");
+				strscpy(card->longname, "Gravis UltraSound Ace");
 				gus->ace_flag = 1;
 			} else if (rev == 0x50) {
-				strcpy(card->driver, "GUS Extreme");
-				strcpy(card->longname, "Gravis UltraSound Extreme");
+				strscpy(card->driver, "GUS Extreme");
+				strscpy(card->longname, "Gravis UltraSound Extreme");
 				gus->ess_flag = 1;
 			} else {
 				dev_err(card->dev,
diff --git a/sound/isa/gus/gus_mixer.c b/sound/isa/gus/gus_mixer.c
index 03f9cfcbf601..60c3a8219770 100644
--- a/sound/isa/gus/gus_mixer.c
+++ b/sound/isa/gus/gus_mixer.c
@@ -152,7 +152,7 @@ int snd_gf1_new_mixer(struct snd_gus_card * gus)
 	if (gus->ics_flag)
 		snd_component_add(card, "ICS2101");
 	if (card->mixername[0] == '\0') {
-		strcpy(card->mixername, gus->ics_flag ? "GF1,ICS2101" : "GF1");
+		strscpy(card->mixername, gus->ics_flag ? "GF1,ICS2101" : "GF1");
 	} else {
 		if (gus->ics_flag)
 			strcat(card->mixername, ",ICS2101");
diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index 16f9bbb43a54..8b9b7b8d92b2 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -851,7 +851,7 @@ int snd_gf1_pcm_new(struct snd_gus_card *gus, int pcm_dev, int control_index)
 					   SNDRV_DMA_TYPE_DEV, card->dev,
 					   64*1024, gus->gf1.dma2 > 3 ? 128*1024 : 64*1024);
 	}
-	strcpy(pcm->name, pcm->id);
+	strscpy(pcm->name, pcm->id);
 	if (gus->interwave) {
 		sprintf(pcm->name + strlen(pcm->name), " rev %c", gus->revision + 'A');
 	}
diff --git a/sound/isa/gus/gus_timer.c b/sound/isa/gus/gus_timer.c
index 047ddbc6192f..7267fb5bf8e5 100644
--- a/sound/isa/gus/gus_timer.c
+++ b/sound/isa/gus/gus_timer.c
@@ -156,7 +156,7 @@ void snd_gf1_timers_init(struct snd_gus_card * gus)
 	tid.subdevice = 0;
 
 	if (snd_timer_new(gus->card, "GF1 timer", &tid, &timer) >= 0) {
-		strcpy(timer->name, "GF1 timer #1");
+		strscpy(timer->name, "GF1 timer #1");
 		timer->private_data = gus;
 		timer->private_free = snd_gf1_timer1_free;
 		timer->hw = snd_gf1_timer1;
@@ -166,7 +166,7 @@ void snd_gf1_timers_init(struct snd_gus_card * gus)
 	tid.device++;
 
 	if (snd_timer_new(gus->card, "GF1 timer", &tid, &timer) >= 0) {
-		strcpy(timer->name, "GF1 timer #2");
+		strscpy(timer->name, "GF1 timer #2");
 		timer->private_data = gus;
 		timer->private_free = snd_gf1_timer2_free;
 		timer->hw = snd_gf1_timer2;
diff --git a/sound/isa/gus/gus_uart.c b/sound/isa/gus/gus_uart.c
index 08276509447f..e207f274f240 100644
--- a/sound/isa/gus/gus_uart.c
+++ b/sound/isa/gus/gus_uart.c
@@ -236,7 +236,7 @@ int snd_gf1_rawmidi_new(struct snd_gus_card *gus, int device)
 	err = snd_rawmidi_new(gus->card, "GF1", device, 1, 1, &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, gus->interwave ? "AMD InterWave" : "GF1");
+	strscpy(rmidi->name, gus->interwave ? "AMD InterWave" : "GF1");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_gf1_uart_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_gf1_uart_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT | SNDRV_RAWMIDI_INFO_INPUT | SNDRV_RAWMIDI_INFO_DUPLEX;
diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
index 6eab95bd49c1..28827a2e6cbd 100644
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -204,15 +204,15 @@ static int snd_gusextreme_mixer(struct snd_card *card)
 	id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 
 	/* reassign AUX to SYNTHESIZER */
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "Synth Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "Synth Playback Volume");
 	error = snd_ctl_rename_id(card, &id1, &id2);
 	if (error < 0)
 		return error;
 
 	/* reassign Master Playback Switch to Synth Playback Switch */
-	strcpy(id1.name, "Master Playback Switch");
-	strcpy(id2.name, "Synth Playback Switch");
+	strscpy(id1.name, "Master Playback Switch");
+	strscpy(id2.name, "Synth Playback Switch");
 	error = snd_ctl_rename_id(card, &id1, &id2);
 	if (error < 0)
 		return error;
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index 445fd2fb50f1..b572411c4422 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -134,24 +134,24 @@ static int snd_gusmax_mixer(struct snd_wss *chip)
 	memset(&id2, 0, sizeof(id2));
 	id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	/* reassign AUXA to SYNTHESIZER */
-	strcpy(id1.name, "Aux Playback Switch");
-	strcpy(id2.name, "Synth Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch");
+	strscpy(id2.name, "Synth Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "Synth Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "Synth Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
 	/* reassign AUXB to CD */
-	strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
-	strcpy(id2.name, "CD Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch"); id1.index = 1;
+	strscpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "CD Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 18a98123e286..0e0bcd85a648 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -271,7 +271,7 @@ static int snd_interwave_detect(struct snd_interwave *iwcard,
 		dev_dbg(gus->card->dev,
 			"[0x%lx] InterWave check - passed\n", gus->gf1.port);
 		gus->interwave = 1;
-		strcpy(gus->card->shortname, "AMD InterWave");
+		strscpy(gus->card->shortname, "AMD InterWave");
 		gus->revision = rev1 >> 4;
 #ifndef SNDRV_STB
 		return 0;	/* ok.. We have an InterWave board */
@@ -500,11 +500,11 @@ static int snd_interwave_mixer(struct snd_wss *chip)
 	id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 #if 0
 	/* remove mono microphone controls */
-	strcpy(id1.name, "Mic Playback Switch");
+	strscpy(id1.name, "Mic Playback Switch");
 	err = snd_ctl_remove_id(card, &id1);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Mic Playback Volume");
+	strscpy(id1.name, "Mic Playback Volume");
 	err = snd_ctl_remove_id(card, &id1);
 	if (err < 0)
 		return err;
@@ -520,24 +520,24 @@ static int snd_interwave_mixer(struct snd_wss *chip)
 	snd_wss_out(chip, CS4231_LEFT_MIC_INPUT, 0x9f);
 	snd_wss_out(chip, CS4231_RIGHT_MIC_INPUT, 0x9f);
 	/* reassign AUXA to SYNTHESIZER */
-	strcpy(id1.name, "Aux Playback Switch");
-	strcpy(id2.name, "Synth Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch");
+	strscpy(id2.name, "Synth Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "Synth Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "Synth Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
 	/* reassign AUXB to CD */
-	strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
-	strcpy(id2.name, "CD Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch"); id1.index = 1;
+	strscpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "CD Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
@@ -713,14 +713,14 @@ static int snd_interwave_probe(struct snd_card *card, int dev,
 		memset(&id1, 0, sizeof(id1));
 		memset(&id2, 0, sizeof(id2));
 		id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		strcpy(id1.name, "Master Playback Switch");
-		strcpy(id2.name, id1.name);
+		strscpy(id1.name, "Master Playback Switch");
+		strscpy(id2.name, id1.name);
 		id2.index = 1;
 		err = snd_ctl_rename_id(card, &id1, &id2);
 		if (err < 0)
 			return err;
-		strcpy(id1.name, "Master Playback Volume");
-		strcpy(id2.name, id1.name);
+		strscpy(id1.name, "Master Playback Volume");
+		strscpy(id2.name, id1.name);
 		err = snd_ctl_rename_id(card, &id1, &id2);
 		if (err < 0)
 			return err;
@@ -742,8 +742,8 @@ static int snd_interwave_probe(struct snd_card *card, int dev,
 #else
 	str = "InterWave STB";
 #endif
-	strcpy(card->driver, str);
-	strcpy(card->shortname, str);
+	strscpy(card->driver, str);
+	strscpy(card->shortname, str);
 	sprintf(card->longname, "%s at 0x%lx, irq %i, dma %d",
 		str,
 		gus->gf1.port,
-- 
2.50.0

