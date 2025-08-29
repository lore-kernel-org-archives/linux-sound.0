Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053919CC02
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479660; cv=none; b=VejIw7H5CyX8/Vjmv15x/MZXGJRfKCzVPeEVjqYaP1lscN99PaAgOT4CjgMKtXlv0FXijNxMxThpOd5VIguW+eIAkDLKtzlb8eZaMyhKUzscwAvKTDc1NeLrb+XSy758/vMcJlXwl8XExBQpTkFx8RhclNYnFE/QTH+kN5ScdLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479660; c=relaxed/simple;
	bh=yda0TMb+/13YdMDTj77mLmpP32CSsX6VnxtWO/AIbt0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwIsgCPiDRHdPAuTdfc/Sru3N9LxKC5sQT3yFPNYX99UmWZmb0PMVvcf3HdOWxujXN90ryCyYdzkBrdlwU+G1aQd8oDiR+SMLxIWAS1r1D0BSHnpt0eBVli3fI0bMtAyrNasSTVeymGUiBiJTlGfD8WPaoZiqDKpv6uV8PwOE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ykubncxb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bjSLUvGi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ykubncxb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bjSLUvGi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ykubncxb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bjSLUvGi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ykubncxb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bjSLUvGi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1E55033EE0;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+g44PFep3fSTWym5VClxP/9wVNoMotVRv4j5WW8vIM=;
	b=Ykubncxbh4jxGIDDjjwQItoExrvs44JGarbuol/nt4ymNO63GpK93tHxi+iRaBhBi+BBXR
	ZcbM7FzGt8k8fVpWTzeAhqrjUjAlGgdLRGBwOc5sRLSBQRASUVlaiSe0Xihi6HgJP/lh92
	LiPggf0SGQAhx0WbB9qij/+SNcaaa2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+g44PFep3fSTWym5VClxP/9wVNoMotVRv4j5WW8vIM=;
	b=bjSLUvGiKIKlYmZLCQERkceG1IpwVrKIxIZ4jAiCQmEQBLBZsCbiOhm3adtVpNb608KMRq
	8hRvi2eistTwuLAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ykubncxb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bjSLUvGi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+g44PFep3fSTWym5VClxP/9wVNoMotVRv4j5WW8vIM=;
	b=Ykubncxbh4jxGIDDjjwQItoExrvs44JGarbuol/nt4ymNO63GpK93tHxi+iRaBhBi+BBXR
	ZcbM7FzGt8k8fVpWTzeAhqrjUjAlGgdLRGBwOc5sRLSBQRASUVlaiSe0Xihi6HgJP/lh92
	LiPggf0SGQAhx0WbB9qij/+SNcaaa2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+g44PFep3fSTWym5VClxP/9wVNoMotVRv4j5WW8vIM=;
	b=bjSLUvGiKIKlYmZLCQERkceG1IpwVrKIxIZ4jAiCQmEQBLBZsCbiOhm3adtVpNb608KMRq
	8hRvi2eistTwuLAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04C2213A54;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oKSOO4/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/13] ALSA: opl4: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:17 +0200
Message-ID: <20250829150026.6379-7-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
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
X-Rspamd-Queue-Id: 1E55033EE0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl4/opl4_lib.c   | 10 +---
 sound/drivers/opl4/opl4_mixer.c |  8 +---
 sound/drivers/opl4/opl4_synth.c | 81 ++++++++++++++-------------------
 3 files changed, 39 insertions(+), 60 deletions(-)

diff --git a/sound/drivers/opl4/opl4_lib.c b/sound/drivers/opl4/opl4_lib.c
index ef6b2d533958..44fbc6bf0654 100644
--- a/sound/drivers/opl4/opl4_lib.c
+++ b/sound/drivers/opl4/opl4_lib.c
@@ -47,10 +47,9 @@ EXPORT_SYMBOL(snd_opl4_read);
 
 void snd_opl4_read_memory(struct snd_opl4 *opl4, char *buf, int offset, int size)
 {
-	unsigned long flags;
 	u8 memcfg;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 
 	memcfg = snd_opl4_read(opl4, OPL4_REG_MEMORY_CONFIGURATION);
 	snd_opl4_write(opl4, OPL4_REG_MEMORY_CONFIGURATION, memcfg | OPL4_MODE_BIT);
@@ -65,18 +64,15 @@ void snd_opl4_read_memory(struct snd_opl4 *opl4, char *buf, int offset, int size
 	insb(opl4->pcm_port + 1, buf, size);
 
 	snd_opl4_write(opl4, OPL4_REG_MEMORY_CONFIGURATION, memcfg);
-
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 EXPORT_SYMBOL(snd_opl4_read_memory);
 
 void snd_opl4_write_memory(struct snd_opl4 *opl4, const char *buf, int offset, int size)
 {
-	unsigned long flags;
 	u8 memcfg;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 
 	memcfg = snd_opl4_read(opl4, OPL4_REG_MEMORY_CONFIGURATION);
 	snd_opl4_write(opl4, OPL4_REG_MEMORY_CONFIGURATION, memcfg | OPL4_MODE_BIT);
@@ -91,8 +87,6 @@ void snd_opl4_write_memory(struct snd_opl4 *opl4, const char *buf, int offset, i
 	outsb(opl4->pcm_port + 1, buf, size);
 
 	snd_opl4_write(opl4, OPL4_REG_MEMORY_CONFIGURATION, memcfg);
-
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 EXPORT_SYMBOL(snd_opl4_write_memory);
diff --git a/sound/drivers/opl4/opl4_mixer.c b/sound/drivers/opl4/opl4_mixer.c
index fa1e6eff43ab..deebb8636437 100644
--- a/sound/drivers/opl4/opl4_mixer.c
+++ b/sound/drivers/opl4/opl4_mixer.c
@@ -19,13 +19,11 @@ static int snd_opl4_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 static int snd_opl4_ctl_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_opl4 *opl4 = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	u8 reg = kcontrol->private_value;
 	u8 value;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	value = snd_opl4_read(opl4, reg);
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 	ucontrol->value.integer.value[0] = 7 - (value & 7);
 	ucontrol->value.integer.value[1] = 7 - ((value >> 3) & 7);
 	return 0;
@@ -34,16 +32,14 @@ static int snd_opl4_ctl_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 static int snd_opl4_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_opl4 *opl4 = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	u8 reg = kcontrol->private_value;
 	u8 value, old_value;
 
 	value = (7 - (ucontrol->value.integer.value[0] & 7)) |
 		((7 - (ucontrol->value.integer.value[1] & 7)) << 3);
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	old_value = snd_opl4_read(opl4, reg);
 	snd_opl4_write(opl4, reg, value);
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 	return value != old_value;
 }
 
diff --git a/sound/drivers/opl4/opl4_synth.c b/sound/drivers/opl4/opl4_synth.c
index 34e2bd52bba1..82dbb8519ab1 100644
--- a/sound/drivers/opl4/opl4_synth.c
+++ b/sound/drivers/opl4/opl4_synth.c
@@ -272,13 +272,12 @@ static const unsigned char snd_opl4_volume_table[128] = {
  */
 void snd_opl4_synth_reset(struct snd_opl4 *opl4)
 {
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
-	for (i = 0; i < OPL4_MAX_VOICES; i++)
-		snd_opl4_write(opl4, OPL4_REG_MISC + i, OPL4_DAMP_BIT);
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &opl4->reg_lock) {
+		for (i = 0; i < OPL4_MAX_VOICES; i++)
+			snd_opl4_write(opl4, OPL4_REG_MISC + i, OPL4_DAMP_BIT);
+	}
 
 	INIT_LIST_HEAD(&opl4->off_voices);
 	INIT_LIST_HEAD(&opl4->on_voices);
@@ -296,14 +295,12 @@ void snd_opl4_synth_reset(struct snd_opl4 *opl4)
  */
 void snd_opl4_synth_shutdown(struct snd_opl4 *opl4)
 {
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	for (i = 0; i < OPL4_MAX_VOICES; i++)
 		snd_opl4_write(opl4, OPL4_REG_MISC + i,
 			       opl4->voices[i].reg_misc & ~OPL4_KEY_ON_BIT);
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 /*
@@ -313,17 +310,15 @@ static void snd_opl4_do_for_note(struct snd_opl4 *opl4, int note, struct snd_mid
 				 void (*func)(struct snd_opl4 *opl4, struct opl4_voice *voice))
 {
 	int i;
-	unsigned long flags;
 	struct opl4_voice *voice;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	for (i = 0; i < OPL4_MAX_VOICES; i++) {
 		voice = &opl4->voices[i];
 		if (voice->chan == chan && voice->note == note) {
 			func(opl4, voice);
 		}
 	}
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 /*
@@ -334,17 +329,15 @@ static void snd_opl4_do_for_channel(struct snd_opl4 *opl4,
 				    void (*func)(struct snd_opl4 *opl4, struct opl4_voice *voice))
 {
 	int i;
-	unsigned long flags;
 	struct opl4_voice *voice;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	for (i = 0; i < OPL4_MAX_VOICES; i++) {
 		voice = &opl4->voices[i];
 		if (voice->chan == chan) {
 			func(opl4, voice);
 		}
 	}
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 /*
@@ -354,16 +347,14 @@ static void snd_opl4_do_for_all(struct snd_opl4 *opl4,
 				void (*func)(struct snd_opl4 *opl4, struct opl4_voice *voice))
 {
 	int i;
-	unsigned long flags;
 	struct opl4_voice *voice;
 
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	for (i = 0; i < OPL4_MAX_VOICES; i++) {
 		voice = &opl4->voices[i];
 		if (voice->chan)
 			func(opl4, voice);
 	}
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 static void snd_opl4_update_volume(struct snd_opl4 *opl4, struct opl4_voice *voice)
@@ -486,7 +477,6 @@ void snd_opl4_note_on(void *private_data, int note, int vel, struct snd_midi_cha
 	struct opl4_voice *voice[2];
 	const struct opl4_sound *sound[2];
 	int voices = 0, i;
-	unsigned long flags;
 
 	/* determine the number of voices and voice parameters */
 	i = chan->drum_channel ? 0x80 : (chan->midi_program & 0x7f);
@@ -501,41 +491,41 @@ void snd_opl4_note_on(void *private_data, int note, int vel, struct snd_midi_cha
 	}
 
 	/* allocate and initialize the needed voices */
-	spin_lock_irqsave(&opl4->reg_lock, flags);
-	for (i = 0; i < voices; i++) {
-		voice[i] = snd_opl4_get_voice(opl4);
-		list_move_tail(&voice[i]->list, &opl4->on_voices);
-		voice[i]->chan = chan;
-		voice[i]->note = note;
-		voice[i]->velocity = vel & 0x7f;
-		voice[i]->sound = sound[i];
-	}
+	scoped_guard(spinlock_irqsave, &opl4->reg_lock) {
+		for (i = 0; i < voices; i++) {
+			voice[i] = snd_opl4_get_voice(opl4);
+			list_move_tail(&voice[i]->list, &opl4->on_voices);
+			voice[i]->chan = chan;
+			voice[i]->note = note;
+			voice[i]->velocity = vel & 0x7f;
+			voice[i]->sound = sound[i];
+		}
 
-	/* set tone number (triggers header loading) */
-	for (i = 0; i < voices; i++) {
-		voice[i]->reg_f_number =
-			(sound[i]->tone >> 8) & OPL4_TONE_NUMBER_BIT8;
-		snd_opl4_write(opl4, OPL4_REG_F_NUMBER + voice[i]->number,
-			       voice[i]->reg_f_number);
-		snd_opl4_write(opl4, OPL4_REG_TONE_NUMBER + voice[i]->number,
-			       sound[i]->tone & 0xff);
-	}
+		/* set tone number (triggers header loading) */
+		for (i = 0; i < voices; i++) {
+			voice[i]->reg_f_number =
+				(sound[i]->tone >> 8) & OPL4_TONE_NUMBER_BIT8;
+			snd_opl4_write(opl4, OPL4_REG_F_NUMBER + voice[i]->number,
+				       voice[i]->reg_f_number);
+			snd_opl4_write(opl4, OPL4_REG_TONE_NUMBER + voice[i]->number,
+				       sound[i]->tone & 0xff);
+		}
 
-	/* set parameters which can be set while loading */
-	for (i = 0; i < voices; i++) {
-		voice[i]->reg_misc = OPL4_LFO_RESET_BIT;
-		snd_opl4_update_pan(opl4, voice[i]);
-		snd_opl4_update_pitch(opl4, voice[i]);
-		voice[i]->level_direct = OPL4_LEVEL_DIRECT_BIT;
-		snd_opl4_update_volume(opl4, voice[i]);
+		/* set parameters which can be set while loading */
+		for (i = 0; i < voices; i++) {
+			voice[i]->reg_misc = OPL4_LFO_RESET_BIT;
+			snd_opl4_update_pan(opl4, voice[i]);
+			snd_opl4_update_pitch(opl4, voice[i]);
+			voice[i]->level_direct = OPL4_LEVEL_DIRECT_BIT;
+			snd_opl4_update_volume(opl4, voice[i]);
+		}
 	}
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 
 	/* wait for completion of loading */
 	snd_opl4_wait_for_wave_headers(opl4);
 
 	/* set remaining parameters */
-	spin_lock_irqsave(&opl4->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl4->reg_lock);
 	for (i = 0; i < voices; i++) {
 		snd_opl4_update_tone_parameters(opl4, voice[i]);
 		voice[i]->reg_lfo_vibrato = voice[i]->sound->reg_lfo_vibrato;
@@ -549,7 +539,6 @@ void snd_opl4_note_on(void *private_data, int note, int vel, struct snd_midi_cha
 		snd_opl4_write(opl4, OPL4_REG_MISC + voice[i]->number,
 			       voice[i]->reg_misc);
 	}
-	spin_unlock_irqrestore(&opl4->reg_lock, flags);
 }
 
 static void snd_opl4_voice_off(struct snd_opl4 *opl4, struct opl4_voice *voice)
-- 
2.50.1

