Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD2031B10A
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479238; cv=none; b=lQUfp7TguqBEYCLrmM1WlF6rg+Z0fjrg7ZxkamwglCW0u5jT1nyNNORiX836fEluinhSbXTRY8m16YDuFAnQwZ3Dx+qsgkQnzD5CnpdUkECB3FP9aBcRcnFcAcKtB9LgbyOxgPnu4HZNyhkft64ZeFQbOJeq59SQqPtfc2SDdT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479238; c=relaxed/simple;
	bh=32tgQmgB+JuBp8KdIs1aVZE3c1YP1ozTlLNym0Bnh1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzq6i+qVzdMgPr+eyNBnX02VpY0r9WAckAyf0+WL9rTiKlxeYXdnoVoPMPNsetL4E+/h2dC6hPr5j/xsq9e2EHynvRFVrzoq1OeEoFZcH4ZUV8O4cTN1ntw4ljn7pL+QxDOMZN8km5TIrHy+nLqS/iBr2BUmBRsG20zttM01iFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=APJKgYdR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KctzQBCy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=APJKgYdR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KctzQBCy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="APJKgYdR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KctzQBCy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="APJKgYdR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KctzQBCy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C8835C23F;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyQNixoZQ6o9J51ObAhD3ZiItcRmieTLYZkfMDAsZFM=;
	b=APJKgYdRq7JC51zuH0M2jELbtwP/y0IUfjNEr310gSUobxpY3dhsIzCp/nWZ4NO3qanGIG
	TybtXJi+P3nosOyG9Vp7+F24CTTYLGHsqk1py+2cfPEz6uKWx7k1eXxmU7CJa35JH31NNr
	5yDQokramjxwGenZUnJHJmzwwN/rthk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyQNixoZQ6o9J51ObAhD3ZiItcRmieTLYZkfMDAsZFM=;
	b=KctzQBCyZzreYP72tFnZK7MwOOgmDP6tx8zLEz2ngdaZ+yPupfkVvnckt76oFrs+wEoz72
	aiCBCi37UoOalQCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyQNixoZQ6o9J51ObAhD3ZiItcRmieTLYZkfMDAsZFM=;
	b=APJKgYdRq7JC51zuH0M2jELbtwP/y0IUfjNEr310gSUobxpY3dhsIzCp/nWZ4NO3qanGIG
	TybtXJi+P3nosOyG9Vp7+F24CTTYLGHsqk1py+2cfPEz6uKWx7k1eXxmU7CJa35JH31NNr
	5yDQokramjxwGenZUnJHJmzwwN/rthk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyQNixoZQ6o9J51ObAhD3ZiItcRmieTLYZkfMDAsZFM=;
	b=KctzQBCyZzreYP72tFnZK7MwOOgmDP6tx8zLEz2ngdaZ+yPupfkVvnckt76oFrs+wEoz72
	aiCBCi37UoOalQCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5184D13A54;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGyuEti+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/18] ALSA: sb: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:53 +0200
Message-ID: <20250829145300.5460-14-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/isa/sb/sb16.c      |  11 +-
 sound/isa/sb/sb16_csp.c  | 213 +++++++++++++++++----------------------
 sound/isa/sb/sb16_main.c | 123 +++++++++-------------
 sound/isa/sb/sb8_main.c  | 168 ++++++++++++++----------------
 sound/isa/sb/sb8_midi.c  | 121 +++++++++-------------
 sound/isa/sb/sb_common.c |  17 ++--
 sound/isa/sb/sb_mixer.c  |  61 ++++-------
 7 files changed, 294 insertions(+), 420 deletions(-)

diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index 752762117338..208d1942a015 100644
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -310,7 +310,6 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 #ifdef CONFIG_SND_SB16_CSP
 	struct snd_hwdep *xcsp = NULL;
 #endif
-	unsigned long flags;
 	int err;
 
 	xirq = irq[dev];
@@ -421,11 +420,11 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 #endif
 
 	/* setup Mic AGC */
-	spin_lock_irqsave(&chip->mixer_lock, flags);
-	snd_sbmixer_write(chip, SB_DSP4_MIC_AGC,
-		(snd_sbmixer_read(chip, SB_DSP4_MIC_AGC) & 0x01) |
-		(mic_agc[dev] ? 0x00 : 0x01));
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+		snd_sbmixer_write(chip, SB_DSP4_MIC_AGC,
+			(snd_sbmixer_read(chip, SB_DSP4_MIC_AGC) & 0x01) |
+			(mic_agc[dev] ? 0x00 : 0x01));
+	}
 
 	err = snd_card_register(card);
 	if (err < 0)
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 7c5072e4a96f..9ad71a9fc18d 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -301,7 +301,6 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 	__le32 item_type;
 	struct desc_header funcdesc_h;
 
-	unsigned long flags;
 	int err;
 
 	if (copy_from_user(&info, mcode, sizeof(info)))
@@ -429,10 +428,9 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 			p->acc_rates = le16_to_cpu(funcdesc_h.flags_rates);
 
 			/* Decouple CSP from IRQ and DMAREQ lines */
-			spin_lock_irqsave(&p->chip->reg_lock, flags);
+			guard(spinlock_irqsave)(&p->chip->reg_lock);
 			set_mode_register(p->chip, 0xfc);
 			set_mode_register(p->chip, 0x00);
-			spin_unlock_irqrestore(&p->chip->reg_lock, flags);
 
 			/* finished loading successfully */
 			p->running = SNDRV_SB_CSP_ST_LOADED;	/* set LOADED flag */
@@ -542,10 +540,8 @@ static int set_mode_register(struct snd_sb *chip, unsigned char mode)
 static int csp_detect(struct snd_sb *chip, int *version)
 {
 	unsigned char csp_test1, csp_test2;
-	unsigned long flags;
-	int result = -ENODEV;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 
 	set_codec_parameter(chip, 0x00, 0x00);
 	set_mode_register(chip, 0xfc);		/* 0xfc = ?? */
@@ -554,23 +550,21 @@ static int csp_detect(struct snd_sb *chip, int *version)
 	set_register(chip, 0x83, ~csp_test1);
 	csp_test2 = read_register(chip, 0x83);
 	if (csp_test2 != (csp_test1 ^ 0xff))
-		goto __fail;
+		return -ENODEV;
 
 	set_register(chip, 0x83, csp_test1);
 	csp_test2 = read_register(chip, 0x83);
 	if (csp_test2 != csp_test1)
-		goto __fail;
+		return -ENODEV;
 
 	set_mode_register(chip, 0x00);		/* 0x00 = ? */
 
 	*version = get_version(chip);
 	snd_sbdsp_reset(chip);	/* reset DSP after getversion! */
 	if (*version >= 0x10 && *version <= 0x1f)
-		result = 0;		/* valid version id */
+		return 0;		/* valid version id */
 
-      __fail:
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-	return result;
+	return -ENODEV;
 }
 
 /*
@@ -608,14 +602,12 @@ static int snd_sb_csp_load(struct snd_sb_csp * p, const unsigned char *buf, int
 {
 	int status, i;
 	int err;
-	int result = -EIO;
-	unsigned long flags;
 
-	spin_lock_irqsave(&p->chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&p->chip->reg_lock);
 	snd_sbdsp_command(p->chip, 0x01);	/* CSP download command */
 	if (snd_sbdsp_get_byte(p->chip)) {
 		dev_dbg(p->chip->card->dev, "%s: Download command failed\n", __func__);
-		goto __fail;
+		return -EIO;
 	}
 	/* Send CSP low byte (size - 1) */
 	snd_sbdsp_command(p->chip, (unsigned char)(size - 1));
@@ -625,10 +617,10 @@ static int snd_sb_csp_load(struct snd_sb_csp * p, const unsigned char *buf, int
 	/* load from kernel space */
 	while (size--) {
 		if (!snd_sbdsp_command(p->chip, *buf++))
-			goto __fail;
+			return -EIO;
 	}
 	if (snd_sbdsp_get_byte(p->chip))
-		goto __fail;
+		return -EIO;
 
 	if (load_flags & SNDRV_SB_CSP_LOAD_INITBLOCK) {
 		i = 0;
@@ -644,7 +636,7 @@ static int snd_sb_csp_load(struct snd_sb_csp * p, const unsigned char *buf, int
 			dev_dbg(p->chip->card->dev,
 				"%s: Microcode initialization failed\n",
 				__func__);
-			goto __fail;
+			return -EIO;
 		}
 	} else {
 		/*
@@ -652,24 +644,21 @@ static int snd_sb_csp_load(struct snd_sb_csp * p, const unsigned char *buf, int
 		 * Start CSP chip if no 16bit DMA channel is set - some kind
 		 * of autorun or perhaps a bugfix?
 		 */
-		spin_lock(&p->chip->mixer_lock);
-		status = snd_sbmixer_read(p->chip, SB_DSP4_DMASETUP);
-		spin_unlock(&p->chip->mixer_lock);
+		scoped_guard(spinlock, &p->chip->mixer_lock) {
+			status = snd_sbmixer_read(p->chip, SB_DSP4_DMASETUP);
+		}
 		if (!(status & (SB_DMASETUP_DMA7 | SB_DMASETUP_DMA6 | SB_DMASETUP_DMA5))) {
 			err = (set_codec_parameter(p->chip, 0xaa, 0x00) ||
 			       set_codec_parameter(p->chip, 0xff, 0x00));
 			snd_sbdsp_reset(p->chip);		/* really! */
 			if (err)
-				goto __fail;
+				return -EIO;
 			set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
 			set_mode_register(p->chip, 0x70);	/* 70 = RUN */
 		}
 	}
-	result = 0;
 
-      __fail:
-	spin_unlock_irqrestore(&p->chip->reg_lock, flags);
-	return result;
+	return 0;
 }
  
 static int snd_sb_csp_load_user(struct snd_sb_csp * p, const unsigned char __user *buf, int size, int load_flags)
@@ -716,7 +705,6 @@ static int snd_sb_csp_firmware_load(struct snd_sb_csp *p, int index, int flags)
  */
 static int snd_sb_csp_autoload(struct snd_sb_csp * p, snd_pcm_format_t pcm_sfmt, int play_rec_mode)
 {
-	unsigned long flags;
 	int err = 0;
 
 	/* if CSP is running or manually loaded then exit */
@@ -757,10 +745,9 @@ static int snd_sb_csp_autoload(struct snd_sb_csp * p, snd_pcm_format_t pcm_sfmt,
 		default:
 			/* Decouple CSP from IRQ and DMAREQ lines */
 			if (p->running & SNDRV_SB_CSP_ST_AUTO) {
-				spin_lock_irqsave(&p->chip->reg_lock, flags);
+				guard(spinlock_irqsave)(&p->chip->reg_lock);
 				set_mode_register(p->chip, 0xfc);
 				set_mode_register(p->chip, 0x00);
-				spin_unlock_irqrestore(&p->chip->reg_lock, flags);
 				p->running = 0;			/* clear autoloaded flag */
 			}
 			return -EINVAL;
@@ -792,7 +779,6 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
 	unsigned char s_type;	/* sample type */
 	unsigned char mixL, mixR;
 	int result = -EIO;
-	unsigned long flags;
 
 	if (!(p->running & (SNDRV_SB_CSP_ST_LOADED | SNDRV_SB_CSP_ST_AUTO))) {
 		dev_dbg(dev, "%s: Microcode not loaded\n", __func__);
@@ -812,55 +798,54 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
 	}
 
 	/* Mute PCM volume */
-	spin_lock_irqsave(&p->chip->mixer_lock, flags);
-	mixL = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV);
-	mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
-	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
-
-	spin_lock(&p->chip->reg_lock);
-	set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
-	set_mode_register(p->chip, 0x70);	/* 70 = RUN */
-
-	s_type = 0x00;
-	if (channels == SNDRV_SB_CSP_MONO)
-		s_type = 0x11;	/* 000n 000n    (n = 1 if mono) */
-	if (sample_width == SNDRV_SB_CSP_SAMPLE_8BIT)
-		s_type |= 0x22;	/* 00dX 00dX    (d = 1 if 8 bit samples) */
-
-	if (set_codec_parameter(p->chip, 0x81, s_type)) {
-		dev_dbg(dev, "%s: Set sample type command failed\n", __func__);
-		goto __fail;
+	scoped_guard(spinlock_irqsave, &p->chip->mixer_lock) {
+		mixL = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV);
+		mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
 	}
-	if (set_codec_parameter(p->chip, 0x80, 0x00)) {
-		dev_dbg(dev, "%s: Codec start command failed\n", __func__);
-		goto __fail;
+
+	scoped_guard(spinlock, &p->chip->reg_lock) {
+		set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
+		set_mode_register(p->chip, 0x70);	/* 70 = RUN */
+
+		s_type = 0x00;
+		if (channels == SNDRV_SB_CSP_MONO)
+			s_type = 0x11;	/* 000n 000n    (n = 1 if mono) */
+		if (sample_width == SNDRV_SB_CSP_SAMPLE_8BIT)
+			s_type |= 0x22;	/* 00dX 00dX    (d = 1 if 8 bit samples) */
+
+		if (set_codec_parameter(p->chip, 0x81, s_type)) {
+			dev_dbg(dev, "%s: Set sample type command failed\n", __func__);
+			break;
+		}
+		if (set_codec_parameter(p->chip, 0x80, 0x00)) {
+			dev_dbg(dev, "%s: Codec start command failed\n", __func__);
+			break;
+		}
+		p->run_width = sample_width;
+		p->run_channels = channels;
+
+		p->running |= SNDRV_SB_CSP_ST_RUNNING;
+
+		if (p->mode & SNDRV_SB_CSP_MODE_QSOUND) {
+			set_codec_parameter(p->chip, 0xe0, 0x01);
+			/* enable QSound decoder */
+			set_codec_parameter(p->chip, 0x00, 0xff);
+			set_codec_parameter(p->chip, 0x01, 0xff);
+			p->running |= SNDRV_SB_CSP_ST_QSOUND;
+			/* set QSound startup value */
+			snd_sb_csp_qsound_transfer(p);
+		}
+		result = 0;
 	}
-	p->run_width = sample_width;
-	p->run_channels = channels;
-
-	p->running |= SNDRV_SB_CSP_ST_RUNNING;
-
-	if (p->mode & SNDRV_SB_CSP_MODE_QSOUND) {
-		set_codec_parameter(p->chip, 0xe0, 0x01);
-		/* enable QSound decoder */
-		set_codec_parameter(p->chip, 0x00, 0xff);
-		set_codec_parameter(p->chip, 0x01, 0xff);
-		p->running |= SNDRV_SB_CSP_ST_QSOUND;
-		/* set QSound startup value */
-		snd_sb_csp_qsound_transfer(p);
-	}
-	result = 0;
-
-      __fail:
-	spin_unlock(&p->chip->reg_lock);
 
 	/* restore PCM volume */
-	spin_lock_irqsave(&p->chip->mixer_lock, flags);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
-	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
+	if (result < 0) {
+		guard(spinlock_irqsave)(&p->chip->mixer_lock);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
+	}
 
 	return result;
 }
@@ -872,36 +857,35 @@ static int snd_sb_csp_stop(struct snd_sb_csp * p)
 {
 	int result;
 	unsigned char mixL, mixR;
-	unsigned long flags;
 
 	if (!(p->running & SNDRV_SB_CSP_ST_RUNNING))
 		return 0;
 
 	/* Mute PCM volume */
-	spin_lock_irqsave(&p->chip->mixer_lock, flags);
-	mixL = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV);
-	mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
-	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
-
-	spin_lock(&p->chip->reg_lock);
-	if (p->running & SNDRV_SB_CSP_ST_QSOUND) {
-		set_codec_parameter(p->chip, 0xe0, 0x01);
-		/* disable QSound decoder */
-		set_codec_parameter(p->chip, 0x00, 0x00);
-		set_codec_parameter(p->chip, 0x01, 0x00);
-
-		p->running &= ~SNDRV_SB_CSP_ST_QSOUND;
+	scoped_guard(spinlock_irqsave, &p->chip->mixer_lock) {
+		mixL = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV);
+		mixR = snd_sbmixer_read(p->chip, SB_DSP4_PCM_DEV + 1);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL & 0x7);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR & 0x7);
+	}
+
+	scoped_guard(spinlock, &p->chip->reg_lock) {
+		if (p->running & SNDRV_SB_CSP_ST_QSOUND) {
+			set_codec_parameter(p->chip, 0xe0, 0x01);
+			/* disable QSound decoder */
+			set_codec_parameter(p->chip, 0x00, 0x00);
+			set_codec_parameter(p->chip, 0x01, 0x00);
+
+			p->running &= ~SNDRV_SB_CSP_ST_QSOUND;
+		}
+		result = set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
 	}
-	result = set_mode_register(p->chip, 0xc0);	/* c0 = STOP */
-	spin_unlock(&p->chip->reg_lock);
 
 	/* restore PCM volume */
-	spin_lock_irqsave(&p->chip->mixer_lock, flags);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
-	snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
-	spin_unlock_irqrestore(&p->chip->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &p->chip->mixer_lock) {
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV, mixL);
+		snd_sbmixer_write(p->chip, SB_DSP4_PCM_DEV + 1, mixR);
+	}
 
 	if (!(result))
 		p->running &= ~(SNDRV_SB_CSP_ST_PAUSED | SNDRV_SB_CSP_ST_RUNNING);
@@ -914,14 +898,13 @@ static int snd_sb_csp_stop(struct snd_sb_csp * p)
 static int snd_sb_csp_pause(struct snd_sb_csp * p)
 {
 	int result;
-	unsigned long flags;
 
 	if (!(p->running & SNDRV_SB_CSP_ST_RUNNING))
 		return -EBUSY;
 
-	spin_lock_irqsave(&p->chip->reg_lock, flags);
-	result = set_codec_parameter(p->chip, 0x80, 0xff);
-	spin_unlock_irqrestore(&p->chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &p->chip->reg_lock) {
+		result = set_codec_parameter(p->chip, 0x80, 0xff);
+	}
 	if (!(result))
 		p->running |= SNDRV_SB_CSP_ST_PAUSED;
 
@@ -934,14 +917,13 @@ static int snd_sb_csp_pause(struct snd_sb_csp * p)
 static int snd_sb_csp_restart(struct snd_sb_csp * p)
 {
 	int result;
-	unsigned long flags;
 
 	if (!(p->running & SNDRV_SB_CSP_ST_PAUSED))
 		return -EBUSY;
 
-	spin_lock_irqsave(&p->chip->reg_lock, flags);
-	result = set_codec_parameter(p->chip, 0x80, 0x00);
-	spin_unlock_irqrestore(&p->chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &p->chip->reg_lock) {
+		result = set_codec_parameter(p->chip, 0x80, 0x00);
+	}
 	if (!(result))
 		p->running &= ~SNDRV_SB_CSP_ST_PAUSED;
 
@@ -967,15 +949,13 @@ static int snd_sb_qsound_switch_get(struct snd_kcontrol *kcontrol, struct snd_ct
 static int snd_sb_qsound_switch_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb_csp *p = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned char nval;
 	
 	nval = ucontrol->value.integer.value[0] & 0x01;
-	spin_lock_irqsave(&p->q_lock, flags);
+	guard(spinlock_irqsave)(&p->q_lock);
 	change = p->q_enabled != nval;
 	p->q_enabled = nval;
-	spin_unlock_irqrestore(&p->q_lock, flags);
 	return change;
 }
 
@@ -991,19 +971,16 @@ static int snd_sb_qsound_space_info(struct snd_kcontrol *kcontrol, struct snd_ct
 static int snd_sb_qsound_space_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb_csp *p = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	
-	spin_lock_irqsave(&p->q_lock, flags);
+	guard(spinlock_irqsave)(&p->q_lock);
 	ucontrol->value.integer.value[0] = p->qpos_left;
 	ucontrol->value.integer.value[1] = p->qpos_right;
-	spin_unlock_irqrestore(&p->q_lock, flags);
 	return 0;
 }
 
 static int snd_sb_qsound_space_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb_csp *p = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned char nval1, nval2;
 	
@@ -1013,12 +990,11 @@ static int snd_sb_qsound_space_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 	nval2 = ucontrol->value.integer.value[1];
 	if (nval2 > SNDRV_SB_CSP_QSOUND_MAX_RIGHT)
 		nval2 = SNDRV_SB_CSP_QSOUND_MAX_RIGHT;
-	spin_lock_irqsave(&p->q_lock, flags);
+	guard(spinlock_irqsave)(&p->q_lock);
 	change = p->qpos_left != nval1 || p->qpos_right != nval2;
 	p->qpos_left = nval1;
 	p->qpos_right = nval2;
 	p->qpos_changed = change;
-	spin_unlock_irqrestore(&p->q_lock, flags);
 	return change;
 }
 
@@ -1074,7 +1050,6 @@ static int snd_sb_qsound_build(struct snd_sb_csp * p)
 static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 {
 	struct snd_card *card;
-	unsigned long flags;
 
 	if (snd_BUG_ON(!p))
 		return;
@@ -1087,9 +1062,8 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 	p->qsound_space = NULL;
 
 	/* cancel pending transfer of QSound parameters */
-	spin_lock_irqsave (&p->q_lock, flags);
+	guard(spinlock_irqsave)(&p->q_lock);
 	p->qpos_changed = 0;
-	spin_unlock_irqrestore (&p->q_lock, flags);
 }
 
 /*
@@ -1100,7 +1074,7 @@ static int snd_sb_csp_qsound_transfer(struct snd_sb_csp * p)
 {
 	int err = -ENXIO;
 
-	spin_lock(&p->q_lock);
+	guard(spinlock)(&p->q_lock);
 	if (p->running & SNDRV_SB_CSP_ST_QSOUND) {
 		set_codec_parameter(p->chip, 0xe0, 0x01);
 		/* left channel */
@@ -1112,7 +1086,6 @@ static int snd_sb_csp_qsound_transfer(struct snd_sb_csp * p)
 		err = 0;
 	}
 	p->qpos_changed = 0;
-	spin_unlock(&p->q_lock);
 	return err;
 }
 
diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index 5a083eecaa6b..4d64db4f5852 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -130,9 +130,8 @@ static void snd_sb16_csp_update(struct snd_sb *chip)
 		struct snd_sb_csp *csp = chip->csp;
 
 		if (csp->qpos_changed) {
-			spin_lock(&chip->reg_lock);
+			guard(spinlock)(&chip->reg_lock);
 			csp->ops.csp_qsound_transfer (csp);
-			spin_unlock(&chip->reg_lock);
 		}
 	}
 }
@@ -213,9 +212,7 @@ static void snd_sb16_setup_rate(struct snd_sb *chip,
 				unsigned short rate,
 				int channel)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (chip->mode & (channel == SNDRV_PCM_STREAM_PLAYBACK ? SB_MODE_PLAYBACK_16 : SB_MODE_CAPTURE_16))
 		snd_sb_ack_16bit(chip);
 	else
@@ -229,12 +226,10 @@ static void snd_sb16_setup_rate(struct snd_sb *chip,
 		snd_sbdsp_command(chip, rate >> 8);
 		snd_sbdsp_command(chip, rate & 0xff);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static int snd_sb16_playback_prepare(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned char format;
@@ -253,7 +248,7 @@ static int snd_sb16_playback_prepare(struct snd_pcm_substream *substream)
 	snd_dma_program(dma, runtime->dma_addr, size, DMA_MODE_WRITE | DMA_AUTOINIT);
 
 	count = snd_pcm_lib_period_bytes(substream);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (chip->mode & SB_MODE_PLAYBACK_16) {
 		count >>= 1;
 		count--;
@@ -270,7 +265,6 @@ static int snd_sb16_playback_prepare(struct snd_pcm_substream *substream)
 		snd_sbdsp_command(chip, count >> 8);
 		snd_sbdsp_command(chip, SB_DSP_DMA8_OFF);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -278,9 +272,8 @@ static int snd_sb16_playback_trigger(struct snd_pcm_substream *substream,
 				     int cmd)
 {
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
-	int result = 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -296,15 +289,13 @@ static int snd_sb16_playback_trigger(struct snd_pcm_substream *substream,
 		chip->mode &= ~SB_RATE_LOCK_PLAYBACK;
 		break;
 	default:
-		result = -EINVAL;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-	return result;
+	return 0;
 }
 
 static int snd_sb16_capture_prepare(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned char format;
@@ -322,7 +313,7 @@ static int snd_sb16_capture_prepare(struct snd_pcm_substream *substream)
 	snd_dma_program(dma, runtime->dma_addr, size, DMA_MODE_READ | DMA_AUTOINIT);
 
 	count = snd_pcm_lib_period_bytes(substream);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (chip->mode & SB_MODE_CAPTURE_16) {
 		count >>= 1;
 		count--;
@@ -339,7 +330,6 @@ static int snd_sb16_capture_prepare(struct snd_pcm_substream *substream)
 		snd_sbdsp_command(chip, count >> 8);
 		snd_sbdsp_command(chip, SB_DSP_DMA8_OFF);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -347,9 +337,8 @@ static int snd_sb16_capture_trigger(struct snd_pcm_substream *substream,
 				    int cmd)
 {
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
-	int result = 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -365,10 +354,9 @@ static int snd_sb16_capture_trigger(struct snd_pcm_substream *substream,
 		chip->mode &= ~SB_RATE_LOCK_CAPTURE;
 		break;
 	default:
-		result = -EINVAL;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-	return result;
+	return 0;
 }
 
 irqreturn_t snd_sb16dsp_interrupt(int irq, void *dev_id)
@@ -377,9 +365,9 @@ irqreturn_t snd_sb16dsp_interrupt(int irq, void *dev_id)
 	unsigned char status;
 	int ok;
 
-	spin_lock(&chip->mixer_lock);
-	status = snd_sbmixer_read(chip, SB_DSP4_IRQSTATUS);
-	spin_unlock(&chip->mixer_lock);
+	scoped_guard(spinlock, &chip->mixer_lock) {
+		status = snd_sbmixer_read(chip, SB_DSP4_IRQSTATUS);
+	}
 	if ((status & SB_IRQTYPE_MPUIN) && chip->rmidi_callback)
 		chip->rmidi_callback(irq, chip->rmidi->private_data);
 	if (status & SB_IRQTYPE_8BIT) {
@@ -393,11 +381,11 @@ irqreturn_t snd_sb16dsp_interrupt(int irq, void *dev_id)
 			snd_pcm_period_elapsed(chip->capture_substream);
 			ok++;
 		}
-		spin_lock(&chip->reg_lock);
-		if (!ok)
-			snd_sbdsp_command(chip, SB_DSP_DMA8_OFF);
-		snd_sb_ack_8bit(chip);
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			if (!ok)
+				snd_sbdsp_command(chip, SB_DSP_DMA8_OFF);
+			snd_sb_ack_8bit(chip);
+		}
 	}
 	if (status & SB_IRQTYPE_16BIT) {
 		ok = 0;
@@ -410,11 +398,11 @@ irqreturn_t snd_sb16dsp_interrupt(int irq, void *dev_id)
 			snd_pcm_period_elapsed(chip->capture_substream);
 			ok++;
 		}
-		spin_lock(&chip->reg_lock);
-		if (!ok)
-			snd_sbdsp_command(chip, SB_DSP_DMA16_OFF);
-		snd_sb_ack_16bit(chip);
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			if (!ok)
+				snd_sbdsp_command(chip, SB_DSP_DMA16_OFF);
+			snd_sb_ack_16bit(chip);
+		}
 	}
 	return IRQ_HANDLED;
 }
@@ -491,15 +479,12 @@ static const struct snd_pcm_hardware snd_sb16_capture =
 
 static int snd_sb16_playback_open(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	spin_lock_irqsave(&chip->open_lock, flags);
-	if (chip->mode & SB_MODE_PLAYBACK) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
+	guard(spinlock_irqsave)(&chip->open_lock);
+	if (chip->mode & SB_MODE_PLAYBACK)
 		return -EAGAIN;
-	}
 	runtime->hw = snd_sb16_playback;
 
 	/* skip if 16 bit DMA was reserved for capture */
@@ -533,7 +518,6 @@ static int snd_sb16_playback_open(struct snd_pcm_substream *substream)
 		runtime->hw.period_bytes_max = 64 * 1024;
 		goto __open_ok;
 	}
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return -EAGAIN;
 
       __open_ok:
@@ -547,34 +531,28 @@ static int snd_sb16_playback_open(struct snd_pcm_substream *substream)
 	if (chip->mode & SB_RATE_LOCK)
 		runtime->hw.rate_min = runtime->hw.rate_max = chip->locked_rate;
 	chip->playback_substream = substream;
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return 0;
 }
 
 static int snd_sb16_playback_close(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 
 	snd_sb16_csp_playback_close(chip);
-	spin_lock_irqsave(&chip->open_lock, flags);
+	guard(spinlock_irqsave)(&chip->open_lock);
 	chip->playback_substream = NULL;
 	chip->mode &= ~SB_MODE_PLAYBACK;
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return 0;
 }
 
 static int snd_sb16_capture_open(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	spin_lock_irqsave(&chip->open_lock, flags);
-	if (chip->mode & SB_MODE_CAPTURE) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
+	guard(spinlock_irqsave)(&chip->open_lock);
+	if (chip->mode & SB_MODE_CAPTURE)
 		return -EAGAIN;
-	}
 	runtime->hw = snd_sb16_capture;
 
 	/* skip if 16 bit DMA was reserved for playback */
@@ -608,7 +586,6 @@ static int snd_sb16_capture_open(struct snd_pcm_substream *substream)
 		runtime->hw.period_bytes_max = 64 * 1024;
 		goto __open_ok;
 	}
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return -EAGAIN;
 
       __open_ok:
@@ -622,20 +599,17 @@ static int snd_sb16_capture_open(struct snd_pcm_substream *substream)
 	if (chip->mode & SB_RATE_LOCK)
 		runtime->hw.rate_min = runtime->hw.rate_max = chip->locked_rate;
 	chip->capture_substream = substream;
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return 0;
 }
 
 static int snd_sb16_capture_close(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 
 	snd_sb16_csp_capture_close(chip);
-	spin_lock_irqsave(&chip->open_lock, flags);
+	guard(spinlock_irqsave)(&chip->open_lock);
 	chip->capture_substream = NULL;
 	chip->mode &= ~SB_MODE_CAPTURE;
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return 0;
 }
 
@@ -688,18 +662,15 @@ static int snd_sb16_dma_control_info(struct snd_kcontrol *kcontrol, struct snd_c
 static int snd_sb16_dma_control_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.enumerated.item[0] = snd_sb16_get_dma_mode(chip);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static int snd_sb16_dma_control_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned char nval, oval;
 	int change;
 	
@@ -709,11 +680,11 @@ static int snd_sb16_dma_control_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	nval = ucontrol->value.enumerated.item[0];
 	if (nval > 2)
 		return -EINVAL;
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	oval = snd_sb16_get_dma_mode(chip);
-	change = nval != oval;
-	snd_sb16_set_dma_mode(chip, nval);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		oval = snd_sb16_get_dma_mode(chip);
+		change = nval != oval;
+		snd_sb16_set_dma_mode(chip, nval);
+	}
 	if (change) {
 		snd_dma_disable(chip->dma8);
 		snd_dma_disable(chip->dma16);
@@ -735,14 +706,13 @@ static const struct snd_kcontrol_new snd_sb16_dma_control = {
  
 int snd_sb16dsp_configure(struct snd_sb * chip)
 {
-	unsigned long flags;
 	unsigned char irqreg = 0, dmareg = 0, mpureg;
 	unsigned char realirq, realdma, realmpureg;
 	/* note: mpu register should be present only on SB16 Vibra soundcards */
 
-	spin_lock_irqsave(&chip->mixer_lock, flags);
-	mpureg = snd_sbmixer_read(chip, SB_DSP4_MPUSETUP) & ~0x06;
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+		mpureg = snd_sbmixer_read(chip, SB_DSP4_MPUSETUP) & ~0x06;
+	}
 	switch (chip->irq) {
 	case 2:
 	case 9:
@@ -800,18 +770,17 @@ int snd_sb16dsp_configure(struct snd_sb * chip)
 	default:
 		mpureg |= 0x02;	/* disable MPU */
 	}
-	spin_lock_irqsave(&chip->mixer_lock, flags);
 
-	snd_sbmixer_write(chip, SB_DSP4_IRQSETUP, irqreg);
-	realirq = snd_sbmixer_read(chip, SB_DSP4_IRQSETUP);
+	scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+		snd_sbmixer_write(chip, SB_DSP4_IRQSETUP, irqreg);
+		realirq = snd_sbmixer_read(chip, SB_DSP4_IRQSETUP);
 
-	snd_sbmixer_write(chip, SB_DSP4_DMASETUP, dmareg);
-	realdma = snd_sbmixer_read(chip, SB_DSP4_DMASETUP);
+		snd_sbmixer_write(chip, SB_DSP4_DMASETUP, dmareg);
+		realdma = snd_sbmixer_read(chip, SB_DSP4_DMASETUP);
 
-	snd_sbmixer_write(chip, SB_DSP4_MPUSETUP, mpureg);
-	realmpureg = snd_sbmixer_read(chip, SB_DSP4_MPUSETUP);
-
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
+		snd_sbmixer_write(chip, SB_DSP4_MPUSETUP, mpureg);
+		realmpureg = snd_sbmixer_read(chip, SB_DSP4_MPUSETUP);
+	}
 	if ((~realirq) & irqreg || (~realdma) & dmareg) {
 		dev_err(chip->card->dev,
 			"SB16 [0x%lx]: unable to set DMA & IRQ (PnP device?)\n",
diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index 2ed176a5a574..a4b5725255cf 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -89,7 +89,6 @@ static int snd_sb8_hw_constraint_channels_rate(struct snd_pcm_hw_params *params,
 
 static int snd_sb8_playback_prepare(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int mixreg, rate, size, count;
@@ -142,48 +141,48 @@ static int snd_sb8_playback_prepare(struct snd_pcm_substream *substream)
 	}
 	size = chip->p_dma_size = snd_pcm_lib_buffer_bytes(substream);
 	count = chip->p_period_size = snd_pcm_lib_period_bytes(substream);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_sbdsp_command(chip, SB_DSP_SPEAKER_ON);
-	if (chip->hardware == SB_HW_JAZZ16)
-		snd_sbdsp_command(chip, format);
-	else if (stereo) {
-		/* set playback stereo mode */
-		spin_lock(&chip->mixer_lock);
-		mixreg = snd_sbmixer_read(chip, SB_DSP_STEREO_SW);
-		snd_sbmixer_write(chip, SB_DSP_STEREO_SW, mixreg | 0x02);
-		spin_unlock(&chip->mixer_lock);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_sbdsp_command(chip, SB_DSP_SPEAKER_ON);
+		if (chip->hardware == SB_HW_JAZZ16)
+			snd_sbdsp_command(chip, format);
+		else if (stereo) {
+			/* set playback stereo mode */
+			scoped_guard(spinlock, &chip->mixer_lock) {
+				mixreg = snd_sbmixer_read(chip, SB_DSP_STEREO_SW);
+				snd_sbmixer_write(chip, SB_DSP_STEREO_SW, mixreg | 0x02);
+			}
 
-		/* Soundblaster hardware programming reference guide, 3-23 */
-		snd_sbdsp_command(chip, SB_DSP_DMA8_EXIT);
-		runtime->dma_area[0] = 0x80;
-		snd_dma_program(dma, runtime->dma_addr, 1, DMA_MODE_WRITE);
-		/* force interrupt */
-		snd_sbdsp_command(chip, SB_DSP_OUTPUT);
-		snd_sbdsp_command(chip, 0);
-		snd_sbdsp_command(chip, 0);
+			/* Soundblaster hardware programming reference guide, 3-23 */
+			snd_sbdsp_command(chip, SB_DSP_DMA8_EXIT);
+			runtime->dma_area[0] = 0x80;
+			snd_dma_program(dma, runtime->dma_addr, 1, DMA_MODE_WRITE);
+			/* force interrupt */
+			snd_sbdsp_command(chip, SB_DSP_OUTPUT);
+			snd_sbdsp_command(chip, 0);
+			snd_sbdsp_command(chip, 0);
+		}
+		snd_sbdsp_command(chip, SB_DSP_SAMPLE_RATE);
+		if (stereo) {
+			snd_sbdsp_command(chip, 256 - runtime->rate_den / 2);
+			scoped_guard(spinlock, &chip->mixer_lock) {
+				/* save output filter status and turn it off */
+				mixreg = snd_sbmixer_read(chip, SB_DSP_PLAYBACK_FILT);
+				snd_sbmixer_write(chip, SB_DSP_PLAYBACK_FILT, mixreg | 0x20);
+			}
+			/* just use force_mode16 for temporary storate... */
+			chip->force_mode16 = mixreg;
+		} else {
+			snd_sbdsp_command(chip, 256 - runtime->rate_den);
+		}
+		if (chip->playback_format != SB_DSP_OUTPUT) {
+			if (chip->mode & SB_MODE_PLAYBACK_16)
+				count /= 2;
+			count--;
+			snd_sbdsp_command(chip, SB_DSP_BLOCK_SIZE);
+			snd_sbdsp_command(chip, count & 0xff);
+			snd_sbdsp_command(chip, count >> 8);
+		}
 	}
-	snd_sbdsp_command(chip, SB_DSP_SAMPLE_RATE);
-	if (stereo) {
-		snd_sbdsp_command(chip, 256 - runtime->rate_den / 2);
-		spin_lock(&chip->mixer_lock);
-		/* save output filter status and turn it off */
-		mixreg = snd_sbmixer_read(chip, SB_DSP_PLAYBACK_FILT);
-		snd_sbmixer_write(chip, SB_DSP_PLAYBACK_FILT, mixreg | 0x20);
-		spin_unlock(&chip->mixer_lock);
-		/* just use force_mode16 for temporary storate... */
-		chip->force_mode16 = mixreg;
-	} else {
-		snd_sbdsp_command(chip, 256 - runtime->rate_den);
-	}
-	if (chip->playback_format != SB_DSP_OUTPUT) {
-		if (chip->mode & SB_MODE_PLAYBACK_16)
-			count /= 2;
-		count--;
-		snd_sbdsp_command(chip, SB_DSP_BLOCK_SIZE);
-		snd_sbdsp_command(chip, count & 0xff);
-		snd_sbdsp_command(chip, count >> 8);
-	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	snd_dma_program(dma, runtime->dma_addr,
 			size, DMA_MODE_WRITE | DMA_AUTOINIT);
 	return 0;
@@ -192,11 +191,10 @@ static int snd_sb8_playback_prepare(struct snd_pcm_substream *substream)
 static int snd_sb8_playback_trigger(struct snd_pcm_substream *substream,
 				    int cmd)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	unsigned int count;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		snd_sbdsp_command(chip, chip->playback_format);
@@ -211,23 +209,20 @@ static int snd_sb8_playback_trigger(struct snd_pcm_substream *substream,
 			struct snd_pcm_runtime *runtime = substream->runtime;
 			snd_sbdsp_reset(chip);
 			if (runtime->channels > 1) {
-				spin_lock(&chip->mixer_lock);
+				guard(spinlock)(&chip->mixer_lock);
 				/* restore output filter and set hardware to mono mode */ 
 				snd_sbmixer_write(chip, SB_DSP_STEREO_SW, chip->force_mode16 & ~0x02);
-				spin_unlock(&chip->mixer_lock);
 			}
 		} else {
 			snd_sbdsp_command(chip, SB_DSP_DMA8_OFF);
 		}
 		snd_sbdsp_command(chip, SB_DSP_SPEAKER_OFF);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static int snd_sb8_capture_prepare(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int mixreg, rate, size, count;
@@ -281,34 +276,34 @@ static int snd_sb8_capture_prepare(struct snd_pcm_substream *substream)
 	}
 	size = chip->c_dma_size = snd_pcm_lib_buffer_bytes(substream);
 	count = chip->c_period_size = snd_pcm_lib_period_bytes(substream);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_sbdsp_command(chip, SB_DSP_SPEAKER_OFF);
-	if (chip->hardware == SB_HW_JAZZ16)
-		snd_sbdsp_command(chip, format);
-	else if (stereo)
-		snd_sbdsp_command(chip, SB_DSP_STEREO_8BIT);
-	snd_sbdsp_command(chip, SB_DSP_SAMPLE_RATE);
-	if (stereo) {
-		snd_sbdsp_command(chip, 256 - runtime->rate_den / 2);
-		spin_lock(&chip->mixer_lock);
-		/* save input filter status and turn it off */
-		mixreg = snd_sbmixer_read(chip, SB_DSP_CAPTURE_FILT);
-		snd_sbmixer_write(chip, SB_DSP_CAPTURE_FILT, mixreg | 0x20);
-		spin_unlock(&chip->mixer_lock);
-		/* just use force_mode16 for temporary storate... */
-		chip->force_mode16 = mixreg;
-	} else {
-		snd_sbdsp_command(chip, 256 - runtime->rate_den);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_sbdsp_command(chip, SB_DSP_SPEAKER_OFF);
+		if (chip->hardware == SB_HW_JAZZ16)
+			snd_sbdsp_command(chip, format);
+		else if (stereo)
+			snd_sbdsp_command(chip, SB_DSP_STEREO_8BIT);
+		snd_sbdsp_command(chip, SB_DSP_SAMPLE_RATE);
+		if (stereo) {
+			snd_sbdsp_command(chip, 256 - runtime->rate_den / 2);
+			scoped_guard(spinlock, &chip->mixer_lock) {
+				/* save input filter status and turn it off */
+				mixreg = snd_sbmixer_read(chip, SB_DSP_CAPTURE_FILT);
+				snd_sbmixer_write(chip, SB_DSP_CAPTURE_FILT, mixreg | 0x20);
+			}
+			/* just use force_mode16 for temporary storate... */
+			chip->force_mode16 = mixreg;
+		} else {
+			snd_sbdsp_command(chip, 256 - runtime->rate_den);
+		}
+		if (chip->capture_format != SB_DSP_INPUT) {
+			if (chip->mode & SB_MODE_PLAYBACK_16)
+				count /= 2;
+			count--;
+			snd_sbdsp_command(chip, SB_DSP_BLOCK_SIZE);
+			snd_sbdsp_command(chip, count & 0xff);
+			snd_sbdsp_command(chip, count >> 8);
+		}
 	}
-	if (chip->capture_format != SB_DSP_INPUT) {
-		if (chip->mode & SB_MODE_PLAYBACK_16)
-			count /= 2;
-		count--;
-		snd_sbdsp_command(chip, SB_DSP_BLOCK_SIZE);
-		snd_sbdsp_command(chip, count & 0xff);
-		snd_sbdsp_command(chip, count >> 8);
-	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	snd_dma_program(dma, runtime->dma_addr,
 			size, DMA_MODE_READ | DMA_AUTOINIT);
 	return 0;
@@ -317,11 +312,10 @@ static int snd_sb8_capture_prepare(struct snd_pcm_substream *substream)
 static int snd_sb8_capture_trigger(struct snd_pcm_substream *substream,
 				   int cmd)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	unsigned int count;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		snd_sbdsp_command(chip, chip->capture_format);
@@ -337,9 +331,9 @@ static int snd_sb8_capture_trigger(struct snd_pcm_substream *substream,
 			snd_sbdsp_reset(chip);
 			if (runtime->channels > 1) {
 				/* restore input filter status */
-				spin_lock(&chip->mixer_lock);
-				snd_sbmixer_write(chip, SB_DSP_CAPTURE_FILT, chip->force_mode16);
-				spin_unlock(&chip->mixer_lock);
+				scoped_guard(spinlock, &chip->mixer_lock) {
+					snd_sbmixer_write(chip, SB_DSP_CAPTURE_FILT, chip->force_mode16);
+				}
 				/* set hardware to mono mode */
 				snd_sbdsp_command(chip, SB_DSP_MONO_8BIT);
 			}
@@ -348,7 +342,6 @@ static int snd_sb8_capture_trigger(struct snd_pcm_substream *substream,
 		}
 		snd_sbdsp_command(chip, SB_DSP_SPEAKER_OFF);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -464,15 +457,12 @@ static int snd_sb8_open(struct snd_pcm_substream *substream)
 {
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->open_lock, flags);
-	if (chip->open) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		return -EAGAIN;
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		if (chip->open)
+			return -EAGAIN;
+		chip->open |= SB_OPEN_PCM;
 	}
-	chip->open |= SB_OPEN_PCM;
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		chip->playback_substream = substream;
 		runtime->hw = snd_sb8_playback;
@@ -525,18 +515,16 @@ static int snd_sb8_open(struct snd_pcm_substream *substream)
 
 static int snd_sb8_close(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 
 	chip->playback_substream = NULL;
 	chip->capture_substream = NULL;
-	spin_lock_irqsave(&chip->open_lock, flags);
+	guard(spinlock_irqsave)(&chip->open_lock);
 	chip->open &= ~SB_OPEN_PCM;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		chip->mode &= ~SB_MODE_PLAYBACK;
 	else
 		chip->mode &= ~SB_MODE_CAPTURE;
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 	return 0;
 }
 
diff --git a/sound/isa/sb/sb8_midi.c b/sound/isa/sb/sb8_midi.c
index 637079a2f02a..1d41f2470697 100644
--- a/sound/isa/sb/sb8_midi.c
+++ b/sound/isa/sb/sb8_midi.c
@@ -35,7 +35,7 @@ irqreturn_t snd_sb8dsp_midi_interrupt(struct snd_sb *chip)
 		return IRQ_NONE;
 	}
 
-	spin_lock(&chip->midi_input_lock);
+	guard(spinlock)(&chip->midi_input_lock);
 	while (max-- > 0) {
 		if (inb(SBP(chip, DATA_AVAIL)) & 0x80) {
 			byte = inb(SBP(chip, READ));
@@ -44,108 +44,90 @@ irqreturn_t snd_sb8dsp_midi_interrupt(struct snd_sb *chip)
 			}
 		}
 	}
-	spin_unlock(&chip->midi_input_lock);
 	return IRQ_HANDLED;
 }
 
 static int snd_sb8dsp_midi_input_open(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 	unsigned int valid_open_flags;
 
 	chip = substream->rmidi->private_data;
 	valid_open_flags = chip->hardware >= SB_HW_20
 		? SB_OPEN_MIDI_OUTPUT | SB_OPEN_MIDI_OUTPUT_TRIGGER : 0;
-	spin_lock_irqsave(&chip->open_lock, flags);
-	if (chip->open & ~valid_open_flags) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		return -EAGAIN;
-	}
-	chip->open |= SB_OPEN_MIDI_INPUT;
-	chip->midi_substream_input = substream;
-	if (!(chip->open & SB_OPEN_MIDI_OUTPUT)) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		snd_sbdsp_reset(chip);		/* reset DSP */
-		if (chip->hardware >= SB_HW_20)
-			snd_sbdsp_command(chip, SB_DSP_MIDI_UART_IRQ);
-	} else {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		if (chip->open & ~valid_open_flags)
+			return -EAGAIN;
+		chip->open |= SB_OPEN_MIDI_INPUT;
+		chip->midi_substream_input = substream;
+		if (chip->open & SB_OPEN_MIDI_OUTPUT)
+			return 0;
 	}
+	snd_sbdsp_reset(chip);		/* reset DSP */
+	if (chip->hardware >= SB_HW_20)
+		snd_sbdsp_command(chip, SB_DSP_MIDI_UART_IRQ);
 	return 0;
 }
 
 static int snd_sb8dsp_midi_output_open(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 	unsigned int valid_open_flags;
 
 	chip = substream->rmidi->private_data;
 	valid_open_flags = chip->hardware >= SB_HW_20
 		? SB_OPEN_MIDI_INPUT | SB_OPEN_MIDI_INPUT_TRIGGER : 0;
-	spin_lock_irqsave(&chip->open_lock, flags);
-	if (chip->open & ~valid_open_flags) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		return -EAGAIN;
-	}
-	chip->open |= SB_OPEN_MIDI_OUTPUT;
-	chip->midi_substream_output = substream;
-	if (!(chip->open & SB_OPEN_MIDI_INPUT)) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		snd_sbdsp_reset(chip);		/* reset DSP */
-		if (chip->hardware >= SB_HW_20)
-			snd_sbdsp_command(chip, SB_DSP_MIDI_UART_IRQ);
-	} else {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		if (chip->open & ~valid_open_flags)
+			return -EAGAIN;
+		chip->open |= SB_OPEN_MIDI_OUTPUT;
+		chip->midi_substream_output = substream;
+		if (chip->open & SB_OPEN_MIDI_INPUT)
+			return 0;
 	}
+	snd_sbdsp_reset(chip);		/* reset DSP */
+	if (chip->hardware >= SB_HW_20)
+		snd_sbdsp_command(chip, SB_DSP_MIDI_UART_IRQ);
 	return 0;
 }
 
 static int snd_sb8dsp_midi_input_close(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 
 	chip = substream->rmidi->private_data;
-	spin_lock_irqsave(&chip->open_lock, flags);
-	chip->open &= ~(SB_OPEN_MIDI_INPUT | SB_OPEN_MIDI_INPUT_TRIGGER);
-	chip->midi_substream_input = NULL;
-	if (!(chip->open & SB_OPEN_MIDI_OUTPUT)) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		snd_sbdsp_reset(chip);		/* reset DSP */
-	} else {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		chip->open &= ~(SB_OPEN_MIDI_INPUT | SB_OPEN_MIDI_INPUT_TRIGGER);
+		chip->midi_substream_input = NULL;
+		if (chip->open & SB_OPEN_MIDI_OUTPUT)
+			return 0;
 	}
+	snd_sbdsp_reset(chip);		/* reset DSP */
 	return 0;
 }
 
 static int snd_sb8dsp_midi_output_close(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 
 	chip = substream->rmidi->private_data;
 	timer_delete_sync(&chip->midi_timer);
-	spin_lock_irqsave(&chip->open_lock, flags);
-	chip->open &= ~(SB_OPEN_MIDI_OUTPUT | SB_OPEN_MIDI_OUTPUT_TRIGGER);
-	chip->midi_substream_output = NULL;
-	if (!(chip->open & SB_OPEN_MIDI_INPUT)) {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
-		snd_sbdsp_reset(chip);		/* reset DSP */
-	} else {
-		spin_unlock_irqrestore(&chip->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		chip->open &= ~(SB_OPEN_MIDI_OUTPUT | SB_OPEN_MIDI_OUTPUT_TRIGGER);
+		chip->midi_substream_output = NULL;
+		if (chip->open & SB_OPEN_MIDI_INPUT)
+			return 0;
 	}
+	snd_sbdsp_reset(chip);		/* reset DSP */
 	return 0;
 }
 
 static void snd_sb8dsp_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 
 	chip = substream->rmidi->private_data;
-	spin_lock_irqsave(&chip->open_lock, flags);
+	guard(spinlock_irqsave)(&chip->open_lock);
 	if (up) {
 		if (!(chip->open & SB_OPEN_MIDI_INPUT_TRIGGER)) {
 			if (chip->hardware < SB_HW_20)
@@ -159,12 +141,10 @@ static void snd_sb8dsp_midi_input_trigger(struct snd_rawmidi_substream *substrea
 			chip->open &= ~SB_OPEN_MIDI_INPUT_TRIGGER;
 		}
 	}
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 }
 
 static void snd_sb8dsp_midi_output_write(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 	char byte;
 	int max = 32;
@@ -172,11 +152,10 @@ static void snd_sb8dsp_midi_output_write(struct snd_rawmidi_substream *substream
 	/* how big is Tx FIFO? */
 	chip = substream->rmidi->private_data;
 	while (max-- > 0) {
-		spin_lock_irqsave(&chip->open_lock, flags);
+		guard(spinlock_irqsave)(&chip->open_lock);
 		if (snd_rawmidi_transmit_peek(substream, &byte, 1) != 1) {
 			chip->open &= ~SB_OPEN_MIDI_OUTPUT_TRIGGER;
 			timer_delete(&chip->midi_timer);
-			spin_unlock_irqrestore(&chip->open_lock, flags);
 			break;
 		}
 		if (chip->hardware >= SB_HW_20) {
@@ -185,7 +164,6 @@ static void snd_sb8dsp_midi_output_write(struct snd_rawmidi_substream *substream
 				;
 			if (timeout == 0) {
 				/* Tx FIFO full - try again later */
-				spin_unlock_irqrestore(&chip->open_lock, flags);
 				break;
 			}
 			outb(byte, SBP(chip, WRITE));
@@ -194,7 +172,6 @@ static void snd_sb8dsp_midi_output_write(struct snd_rawmidi_substream *substream
 			snd_sbdsp_command(chip, byte);
 		}
 		snd_rawmidi_transmit_ack(substream, 1);
-		spin_unlock_irqrestore(&chip->open_lock, flags);
 	}
 }
 
@@ -202,32 +179,30 @@ static void snd_sb8dsp_midi_output_timer(struct timer_list *t)
 {
 	struct snd_sb *chip = timer_container_of(chip, t, midi_timer);
 	struct snd_rawmidi_substream *substream = chip->midi_substream_output;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->open_lock, flags);
-	mod_timer(&chip->midi_timer, 1 + jiffies);
-	spin_unlock_irqrestore(&chip->open_lock, flags);	
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		mod_timer(&chip->midi_timer, 1 + jiffies);
+	}
 	snd_sb8dsp_midi_output_write(substream);
 }
 
 static void snd_sb8dsp_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct snd_sb *chip;
 
 	chip = substream->rmidi->private_data;
-	spin_lock_irqsave(&chip->open_lock, flags);
-	if (up) {
-		if (!(chip->open & SB_OPEN_MIDI_OUTPUT_TRIGGER)) {
-			mod_timer(&chip->midi_timer, 1 + jiffies);
-			chip->open |= SB_OPEN_MIDI_OUTPUT_TRIGGER;
-		}
-	} else {
-		if (chip->open & SB_OPEN_MIDI_OUTPUT_TRIGGER) {
-			chip->open &= ~SB_OPEN_MIDI_OUTPUT_TRIGGER;
+	scoped_guard(spinlock_irqsave, &chip->open_lock) {
+		if (up) {
+			if (!(chip->open & SB_OPEN_MIDI_OUTPUT_TRIGGER)) {
+				mod_timer(&chip->midi_timer, 1 + jiffies);
+				chip->open |= SB_OPEN_MIDI_OUTPUT_TRIGGER;
+			}
+		} else {
+			if (chip->open & SB_OPEN_MIDI_OUTPUT_TRIGGER) {
+				chip->open &= ~SB_OPEN_MIDI_OUTPUT_TRIGGER;
+			}
 		}
 	}
-	spin_unlock_irqrestore(&chip->open_lock, flags);
 
 	if (up)
 		snd_sb8dsp_midi_output_write(substream);
diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
index a4d5bf3d145f..f2848559e6da 100644
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -94,23 +94,18 @@ static int snd_sbdsp_probe(struct snd_sb * chip)
 	int version;
 	int major, minor;
 	char *str;
-	unsigned long flags;
 
 	/*
 	 *  initialization sequence
 	 */
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	if (snd_sbdsp_reset(chip) < 0) {
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
-		return -ENODEV;
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		if (snd_sbdsp_reset(chip) < 0)
+			return -ENODEV;
+		version = snd_sbdsp_version(chip);
+		if (version < 0)
+			return -ENODEV;
 	}
-	version = snd_sbdsp_version(chip);
-	if (version < 0) {
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
-		return -ENODEV;
-	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	major = version >> 8;
 	minor = version & 0xff;
 	dev_dbg(chip->card->dev, "SB [0x%lx]: DSP chip found, version = %i.%i\n",
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index b2709ed134b4..95173b18cee3 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -57,15 +57,13 @@ static int snd_sbmixer_info_single(struct snd_kcontrol *kcontrol, struct snd_ctl
 static int snd_sbmixer_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 16) & 0xff;
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	unsigned char val;
 
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	val = (snd_sbmixer_read(sb, reg) >> shift) & mask;
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	ucontrol->value.integer.value[0] = val;
 	return 0;
 }
@@ -73,7 +71,6 @@ static int snd_sbmixer_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_sbmixer_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 16) & 0x07;
 	int mask = (kcontrol->private_value >> 24) & 0xff;
@@ -81,13 +78,12 @@ static int snd_sbmixer_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	unsigned char val, oval;
 
 	val = (ucontrol->value.integer.value[0] & mask) << shift;
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval = snd_sbmixer_read(sb, reg);
 	val = (oval & ~(mask << shift)) | val;
 	change = val != oval;
 	if (change)
 		snd_sbmixer_write(sb, reg, val);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	return change;
 }
 
@@ -109,7 +105,6 @@ static int snd_sbmixer_info_double(struct snd_kcontrol *kcontrol, struct snd_ctl
 static int snd_sbmixer_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int left_shift = (kcontrol->private_value >> 16) & 0x07;
@@ -117,10 +112,9 @@ static int snd_sbmixer_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	unsigned char left, right;
 
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	left = (snd_sbmixer_read(sb, left_reg) >> left_shift) & mask;
 	right = (snd_sbmixer_read(sb, right_reg) >> right_shift) & mask;
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	ucontrol->value.integer.value[0] = left;
 	ucontrol->value.integer.value[1] = right;
 	return 0;
@@ -129,7 +123,6 @@ static int snd_sbmixer_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_sbmixer_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int left_shift = (kcontrol->private_value >> 16) & 0x07;
@@ -140,7 +133,7 @@ static int snd_sbmixer_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 
 	left = (ucontrol->value.integer.value[0] & mask) << left_shift;
 	right = (ucontrol->value.integer.value[1] & mask) << right_shift;
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	if (left_reg == right_reg) {
 		oleft = snd_sbmixer_read(sb, left_reg);
 		left = (oleft & ~((mask << left_shift) | (mask << right_shift))) | left | right;
@@ -158,7 +151,6 @@ static int snd_sbmixer_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 			snd_sbmixer_write(sb, right_reg, right);
 		}
 	}
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	return change;
 }
 
@@ -178,12 +170,11 @@ static int snd_dt019x_input_sw_info(struct snd_kcontrol *kcontrol, struct snd_ct
 static int snd_dt019x_input_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned char oval;
 	
-	spin_lock_irqsave(&sb->mixer_lock, flags);
-	oval = snd_sbmixer_read(sb, SB_DT019X_CAPTURE_SW);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &sb->mixer_lock) {
+		oval = snd_sbmixer_read(sb, SB_DT019X_CAPTURE_SW);
+	}
 	switch (oval & 0x07) {
 	case SB_DT019X_CAP_CD:
 		ucontrol->value.enumerated.item[0] = 0;
@@ -214,7 +205,6 @@ static int snd_dt019x_input_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl
 static int snd_dt019x_input_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned char nval, oval;
 	
@@ -239,12 +229,11 @@ static int snd_dt019x_input_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 	default:
 		nval = SB_DT019X_CAP_MAIN;
 	}
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval = snd_sbmixer_read(sb, SB_DT019X_CAPTURE_SW);
 	change = nval != oval;
 	if (change)
 		snd_sbmixer_write(sb, SB_DT019X_CAPTURE_SW, nval);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	return change;
 }
 
@@ -266,12 +255,10 @@ static int snd_als4k_mono_capture_route_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned char oval;
 
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval = snd_sbmixer_read(sb, SB_ALS4000_MONO_IO_CTRL);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	oval >>= 6;
 	if (oval > 2)
 		oval = 2;
@@ -284,13 +271,12 @@ static int snd_als4k_mono_capture_route_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned char nval, oval;
 
 	if (ucontrol->value.enumerated.item[0] > 2)
 		return -EINVAL;
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval = snd_sbmixer_read(sb, SB_ALS4000_MONO_IO_CTRL);
 
 	nval = (oval & ~(3 << 6))
@@ -298,7 +284,6 @@ static int snd_als4k_mono_capture_route_put(struct snd_kcontrol *kcontrol,
 	change = nval != oval;
 	if (change)
 		snd_sbmixer_write(sb, SB_ALS4000_MONO_IO_CTRL, nval);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	return change;
 }
 
@@ -319,12 +304,10 @@ static int snd_sb8mixer_info_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_sb8mixer_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned char oval;
 	
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval = snd_sbmixer_read(sb, SB_DSP_CAPTURE_SOURCE);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	switch ((oval >> 0x01) & 0x03) {
 	case SB_DSP_MIXS_CD:
 		ucontrol->value.enumerated.item[0] = 1;
@@ -342,7 +325,6 @@ static int snd_sb8mixer_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 static int snd_sb8mixer_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned char nval, oval;
 	
@@ -359,13 +341,12 @@ static int snd_sb8mixer_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 		nval = SB_DSP_MIXS_MIC;
 	}
 	nval <<= 1;
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval = snd_sbmixer_read(sb, SB_DSP_CAPTURE_SOURCE);
 	nval |= oval & ~0x06;
 	change = nval != oval;
 	if (change)
 		snd_sbmixer_write(sb, SB_DSP_CAPTURE_SOURCE, nval);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	return change;
 }
 
@@ -385,17 +366,15 @@ static int snd_sb16mixer_info_input_sw(struct snd_kcontrol *kcontrol, struct snd
 static int snd_sb16mixer_get_input_sw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg1 = kcontrol->private_value & 0xff;
 	int reg2 = (kcontrol->private_value >> 8) & 0xff;
 	int left_shift = (kcontrol->private_value >> 16) & 0x0f;
 	int right_shift = (kcontrol->private_value >> 24) & 0x0f;
 	unsigned char val1, val2;
 
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	val1 = snd_sbmixer_read(sb, reg1);
 	val2 = snd_sbmixer_read(sb, reg2);
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	ucontrol->value.integer.value[0] = (val1 >> left_shift) & 0x01;
 	ucontrol->value.integer.value[1] = (val2 >> left_shift) & 0x01;
 	ucontrol->value.integer.value[2] = (val1 >> right_shift) & 0x01;
@@ -406,7 +385,6 @@ static int snd_sb16mixer_get_input_sw(struct snd_kcontrol *kcontrol, struct snd_
 static int snd_sb16mixer_put_input_sw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_sb *sb = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg1 = kcontrol->private_value & 0xff;
 	int reg2 = (kcontrol->private_value >> 8) & 0xff;
 	int left_shift = (kcontrol->private_value >> 16) & 0x0f;
@@ -414,7 +392,7 @@ static int snd_sb16mixer_put_input_sw(struct snd_kcontrol *kcontrol, struct snd_
 	int change;
 	unsigned char val1, val2, oval1, oval2;
 
-	spin_lock_irqsave(&sb->mixer_lock, flags);
+	guard(spinlock_irqsave)(&sb->mixer_lock);
 	oval1 = snd_sbmixer_read(sb, reg1);
 	oval2 = snd_sbmixer_read(sb, reg2);
 	val1 = oval1 & ~((1 << left_shift) | (1 << right_shift));
@@ -428,7 +406,6 @@ static int snd_sb16mixer_put_input_sw(struct snd_kcontrol *kcontrol, struct snd_
 		snd_sbmixer_write(sb, reg1, val1);
 		snd_sbmixer_write(sb, reg2, val2);
 	}
-	spin_unlock_irqrestore(&sb->mixer_lock, flags);
 	return change;
 }
 
@@ -697,20 +674,18 @@ static int snd_sbmixer_init(struct snd_sb *chip,
 			    int map_count,
 			    char *name)
 {
-	unsigned long flags;
 	struct snd_card *card = chip->card;
 	int idx, err;
 
 	/* mixer reset */
-	spin_lock_irqsave(&chip->mixer_lock, flags);
-	snd_sbmixer_write(chip, 0x00, 0x00);
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+		snd_sbmixer_write(chip, 0x00, 0x00);
+	}
 
 	/* mute and zero volume channels */
 	for (idx = 0; idx < map_count; idx++) {
-		spin_lock_irqsave(&chip->mixer_lock, flags);
+		guard(spinlock_irqsave)(&chip->mixer_lock);
 		snd_sbmixer_write(chip, map[idx][0], map[idx][1]);
-		spin_unlock_irqrestore(&chip->mixer_lock, flags);
 	}
 
 	for (idx = 0; idx < controls_count; idx++) {
-- 
2.50.1

