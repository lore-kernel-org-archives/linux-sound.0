Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748232255C
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480425; cv=none; b=rQBoeHcfHg9VOqutubooLZGWxJWtO3aza0AhdccFLn3INsN2rrqJBXK7DyWC/KaMw+5blMXrNVwuRZCAGtbA6ev1K4TuOGEl35+l15Zl71w6SCDuOogkV+LZXhs98FxAEcvPDRYGe2BkkXRe9L6uSYsFNS+C6e4u9KGe2tLJKoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480425; c=relaxed/simple;
	bh=3etrFbfY+Fp/UMErYgChEpfWobklsv1+XoDa/hJ2yIU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnpvsnE8FmFFMJC2pNYGt0GI5i78IPql2gvoPFvlWabENhpwErNoM9hq652pcZwBaYIHVaBggSbF1xPGzmM+QKNaE4vIRrSyQZx6E/iFa/bNLAK8qLdZLizNGi7UpjJJPVR8t/V+cLRR91XckhhA0Ozh0EViRhtDOqIcY6yIGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D46kazxp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmcLLLms; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D46kazxp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmcLLLms; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D46kazxp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmcLLLms";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D46kazxp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmcLLLms"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 738EF33F05;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0M1BPEpVuP2QRbRWwUFC+M5frRnmtFv0+3MaJrgwDY=;
	b=D46kazxp1MOvKTkN4zr0tRK+l2k9iwxaqKPFLE2kLUHQxmd/zKkiDgEfmpP8asmH5Z0q/R
	M3v+YNl7h/8sIBjMHpfxhFZ00IqcdPYu8Fva1jTSYLKP2vB1+ZiD4kcyTgVQFaTpUEMBrt
	onQemgrEB4r3rXrq4uwilkdb5XLUVQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0M1BPEpVuP2QRbRWwUFC+M5frRnmtFv0+3MaJrgwDY=;
	b=GmcLLLmsH1LBleFYIMN8pFeEzLR2av/ZsAnicAp/x54741NpHWwLJ2aMrVZ5QALIJTOaew
	zQr8dvUlWL/2TtAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D46kazxp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GmcLLLms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0M1BPEpVuP2QRbRWwUFC+M5frRnmtFv0+3MaJrgwDY=;
	b=D46kazxp1MOvKTkN4zr0tRK+l2k9iwxaqKPFLE2kLUHQxmd/zKkiDgEfmpP8asmH5Z0q/R
	M3v+YNl7h/8sIBjMHpfxhFZ00IqcdPYu8Fva1jTSYLKP2vB1+ZiD4kcyTgVQFaTpUEMBrt
	onQemgrEB4r3rXrq4uwilkdb5XLUVQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0M1BPEpVuP2QRbRWwUFC+M5frRnmtFv0+3MaJrgwDY=;
	b=GmcLLLmsH1LBleFYIMN8pFeEzLR2av/ZsAnicAp/x54741NpHWwLJ2aMrVZ5QALIJTOaew
	zQr8dvUlWL/2TtAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55EF513A6A;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mHqnE6XDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/19] ALSA: i2c: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:13:16 +0200
Message-ID: <20250829151335.7342-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 738EF33F05
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/i2c/other/ak4113.c | 48 +++++++++++++++++++---------------------
 sound/i2c/other/ak4114.c | 33 ++++++++++++++-------------
 sound/i2c/other/ak4117.c | 40 ++++++++++++++++-----------------
 3 files changed, 58 insertions(+), 63 deletions(-)

diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index fd54e44fe7d6..70b3f7e17f9e 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -185,11 +185,10 @@ static int snd_ak4113_in_error_get(struct snd_kcontrol *kcontrol,
 {
 	struct ak4113 *chip = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	ucontrol->value.integer.value[0] =
 		chip->errors[kcontrol->private_value];
 	chip->errors[kcontrol->private_value] = 0;
-	spin_unlock_irq(&chip->lock);
 	return 0;
 }
 
@@ -235,14 +234,13 @@ static int snd_ak4113_rx_put(struct snd_kcontrol *kcontrol,
 	int change;
 	u8 old_val;
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	old_val = chip->regmap[AK4113_REG_IO1];
 	change = ucontrol->value.integer.value[0] != AK4113_IPS(old_val);
 	if (change)
 		reg_write(chip, AK4113_REG_IO1,
 				(old_val & (~AK4113_IPS(0xff))) |
 				(AK4113_IPS(ucontrol->value.integer.value[0])));
-	spin_unlock_irq(&chip->lock);
 	return change;
 }
 
@@ -532,27 +530,27 @@ int snd_ak4113_check_rate_and_errors(struct ak4113 *ak4113, unsigned int flags)
 		goto __rate;
 	rcs0 = reg_read(ak4113, AK4113_REG_RCS0);
 	rcs2 = reg_read(ak4113, AK4113_REG_RCS2);
-	spin_lock_irqsave(&ak4113->lock, _flags);
-	if (rcs0 & AK4113_PAR)
-		ak4113->errors[AK4113_PARITY_ERRORS]++;
-	if (rcs0 & AK4113_V)
-		ak4113->errors[AK4113_V_BIT_ERRORS]++;
-	if (rcs2 & AK4113_CCRC)
-		ak4113->errors[AK4113_CCRC_ERRORS]++;
-	if (rcs2 & AK4113_QCRC)
-		ak4113->errors[AK4113_QCRC_ERRORS]++;
-	c0 = (ak4113->rcs0 & (AK4113_QINT | AK4113_CINT | AK4113_STC |
-				AK4113_AUDION | AK4113_AUTO | AK4113_UNLCK)) ^
-		(rcs0 & (AK4113_QINT | AK4113_CINT | AK4113_STC |
-			 AK4113_AUDION | AK4113_AUTO | AK4113_UNLCK));
-	c1 = (ak4113->rcs1 & (AK4113_DTSCD | AK4113_NPCM | AK4113_PEM |
-				AK4113_DAT | 0xf0)) ^
-		(rcs1 & (AK4113_DTSCD | AK4113_NPCM | AK4113_PEM |
-			 AK4113_DAT | 0xf0));
-	ak4113->rcs0 = rcs0 & ~(AK4113_QINT | AK4113_CINT | AK4113_STC);
-	ak4113->rcs1 = rcs1;
-	ak4113->rcs2 = rcs2;
-	spin_unlock_irqrestore(&ak4113->lock, _flags);
+	scoped_guard(spinlock_irqsave, &ak4113->lock) {
+		if (rcs0 & AK4113_PAR)
+			ak4113->errors[AK4113_PARITY_ERRORS]++;
+		if (rcs0 & AK4113_V)
+			ak4113->errors[AK4113_V_BIT_ERRORS]++;
+		if (rcs2 & AK4113_CCRC)
+			ak4113->errors[AK4113_CCRC_ERRORS]++;
+		if (rcs2 & AK4113_QCRC)
+			ak4113->errors[AK4113_QCRC_ERRORS]++;
+		c0 = (ak4113->rcs0 & (AK4113_QINT | AK4113_CINT | AK4113_STC |
+				      AK4113_AUDION | AK4113_AUTO | AK4113_UNLCK)) ^
+			(rcs0 & (AK4113_QINT | AK4113_CINT | AK4113_STC |
+				 AK4113_AUDION | AK4113_AUTO | AK4113_UNLCK));
+		c1 = (ak4113->rcs1 & (AK4113_DTSCD | AK4113_NPCM | AK4113_PEM |
+				      AK4113_DAT | 0xf0)) ^
+			(rcs1 & (AK4113_DTSCD | AK4113_NPCM | AK4113_PEM |
+				 AK4113_DAT | 0xf0));
+		ak4113->rcs0 = rcs0 & ~(AK4113_QINT | AK4113_CINT | AK4113_STC);
+		ak4113->rcs1 = rcs1;
+		ak4113->rcs2 = rcs2;
+	}
 
 	if (rcs0 & AK4113_PAR)
 		snd_ctl_notify(ak4113->card, SNDRV_CTL_EVENT_MASK_VALUE,
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index f4ded69bb0e4..0e3a272c1490 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -170,11 +170,10 @@ static int snd_ak4114_in_error_get(struct snd_kcontrol *kcontrol,
 {
 	struct ak4114 *chip = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	ucontrol->value.integer.value[0] =
 		chip->errors[kcontrol->private_value];
 	chip->errors[kcontrol->private_value] = 0;
-	spin_unlock_irq(&chip->lock);
 	return 0;
 }
 
@@ -552,21 +551,21 @@ int snd_ak4114_check_rate_and_errors(struct ak4114 *ak4114, unsigned int flags)
 	if (flags & AK4114_CHECK_NO_STAT)
 		goto __rate;
 	rcs0 = reg_read(ak4114, AK4114_REG_RCS0);
-	spin_lock_irqsave(&ak4114->lock, _flags);
-	if (rcs0 & AK4114_PAR)
-		ak4114->errors[AK4114_PARITY_ERRORS]++;
-	if (rcs1 & AK4114_V)
-		ak4114->errors[AK4114_V_BIT_ERRORS]++;
-	if (rcs1 & AK4114_CCRC)
-		ak4114->errors[AK4114_CCRC_ERRORS]++;
-	if (rcs1 & AK4114_QCRC)
-		ak4114->errors[AK4114_QCRC_ERRORS]++;
-	c0 = (ak4114->rcs0 & (AK4114_QINT | AK4114_CINT | AK4114_PEM | AK4114_AUDION | AK4114_AUTO | AK4114_UNLCK)) ^
-                     (rcs0 & (AK4114_QINT | AK4114_CINT | AK4114_PEM | AK4114_AUDION | AK4114_AUTO | AK4114_UNLCK));
-	c1 = (ak4114->rcs1 & 0xf0) ^ (rcs1 & 0xf0);
-	ak4114->rcs0 = rcs0 & ~(AK4114_QINT | AK4114_CINT);
-	ak4114->rcs1 = rcs1;
-	spin_unlock_irqrestore(&ak4114->lock, _flags);
+	scoped_guard(spinlock_irqsave, &ak4114->lock) {
+		if (rcs0 & AK4114_PAR)
+			ak4114->errors[AK4114_PARITY_ERRORS]++;
+		if (rcs1 & AK4114_V)
+			ak4114->errors[AK4114_V_BIT_ERRORS]++;
+		if (rcs1 & AK4114_CCRC)
+			ak4114->errors[AK4114_CCRC_ERRORS]++;
+		if (rcs1 & AK4114_QCRC)
+			ak4114->errors[AK4114_QCRC_ERRORS]++;
+		c0 = (ak4114->rcs0 & (AK4114_QINT | AK4114_CINT | AK4114_PEM | AK4114_AUDION | AK4114_AUTO | AK4114_UNLCK)) ^
+			(rcs0 & (AK4114_QINT | AK4114_CINT | AK4114_PEM | AK4114_AUDION | AK4114_AUTO | AK4114_UNLCK));
+		c1 = (ak4114->rcs1 & 0xf0) ^ (rcs1 & 0xf0);
+		ak4114->rcs0 = rcs0 & ~(AK4114_QINT | AK4114_CINT);
+		ak4114->rcs1 = rcs1;
+	}
 
 	ak4114_notify(ak4114, rcs0, rcs1, c0, c1);
 	if (ak4114->change_callback && (c0 | c1) != 0)
diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index cd380db195ef..d2ec20f885f0 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -144,11 +144,10 @@ static int snd_ak4117_in_error_get(struct snd_kcontrol *kcontrol,
 {
 	struct ak4117 *chip = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	ucontrol->value.integer.value[0] =
 		       chip->errors[kcontrol->private_value];
 	chip->errors[kcontrol->private_value] = 0;
-	spin_unlock_irq(&chip->lock);
 	return 0;
 }
 
@@ -192,12 +191,11 @@ static int snd_ak4117_rx_put(struct snd_kcontrol *kcontrol,
 	int change;
 	u8 old_val;
 	
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	old_val = chip->regmap[AK4117_REG_IO];
 	change = !!ucontrol->value.integer.value[0] != ((old_val & AK4117_IPS) ? 1 : 0);
 	if (change)
 		reg_write(chip, AK4117_REG_IO, (old_val & ~AK4117_IPS) | (ucontrol->value.integer.value[0] ? AK4117_IPS : 0));
-	spin_unlock_irq(&chip->lock);
 	return change;
 }
 
@@ -441,23 +439,23 @@ int snd_ak4117_check_rate_and_errors(struct ak4117 *ak4117, unsigned int flags)
 		goto __rate;
 	rcs0 = reg_read(ak4117, AK4117_REG_RCS0);
 	rcs2 = reg_read(ak4117, AK4117_REG_RCS2);
-	spin_lock_irqsave(&ak4117->lock, _flags);
-	if (rcs0 & AK4117_PAR)
-		ak4117->errors[AK4117_PARITY_ERRORS]++;
-	if (rcs0 & AK4117_V)
-		ak4117->errors[AK4117_V_BIT_ERRORS]++;
-	if (rcs2 & AK4117_CCRC)
-		ak4117->errors[AK4117_CCRC_ERRORS]++;
-	if (rcs2 & AK4117_QCRC)
-		ak4117->errors[AK4117_QCRC_ERRORS]++;
-	c0 = (ak4117->rcs0 & (AK4117_QINT | AK4117_CINT | AK4117_STC | AK4117_AUDION | AK4117_AUTO | AK4117_UNLCK)) ^
-                     (rcs0 & (AK4117_QINT | AK4117_CINT | AK4117_STC | AK4117_AUDION | AK4117_AUTO | AK4117_UNLCK));
-	c1 = (ak4117->rcs1 & (AK4117_DTSCD | AK4117_NPCM | AK4117_PEM | 0x0f)) ^
-	             (rcs1 & (AK4117_DTSCD | AK4117_NPCM | AK4117_PEM | 0x0f));
-	ak4117->rcs0 = rcs0 & ~(AK4117_QINT | AK4117_CINT | AK4117_STC);
-	ak4117->rcs1 = rcs1;
-	ak4117->rcs2 = rcs2;
-	spin_unlock_irqrestore(&ak4117->lock, _flags);
+	scoped_guard(spinlock_irqsave, &ak4117->lock) {
+		if (rcs0 & AK4117_PAR)
+			ak4117->errors[AK4117_PARITY_ERRORS]++;
+		if (rcs0 & AK4117_V)
+			ak4117->errors[AK4117_V_BIT_ERRORS]++;
+		if (rcs2 & AK4117_CCRC)
+			ak4117->errors[AK4117_CCRC_ERRORS]++;
+		if (rcs2 & AK4117_QCRC)
+			ak4117->errors[AK4117_QCRC_ERRORS]++;
+		c0 = (ak4117->rcs0 & (AK4117_QINT | AK4117_CINT | AK4117_STC | AK4117_AUDION | AK4117_AUTO | AK4117_UNLCK)) ^
+			(rcs0 & (AK4117_QINT | AK4117_CINT | AK4117_STC | AK4117_AUDION | AK4117_AUTO | AK4117_UNLCK));
+		c1 = (ak4117->rcs1 & (AK4117_DTSCD | AK4117_NPCM | AK4117_PEM | 0x0f)) ^
+			(rcs1 & (AK4117_DTSCD | AK4117_NPCM | AK4117_PEM | 0x0f));
+		ak4117->rcs0 = rcs0 & ~(AK4117_QINT | AK4117_CINT | AK4117_STC);
+		ak4117->rcs1 = rcs1;
+		ak4117->rcs2 = rcs2;
+	}
 
 	if (rcs0 & AK4117_PAR)
 		snd_ctl_notify(ak4117->card, SNDRV_CTL_EVENT_MASK_VALUE, &ak4117->kctls[0]->id);
-- 
2.50.1

