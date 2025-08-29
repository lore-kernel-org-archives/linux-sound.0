Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82B31CA77
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479221; cv=none; b=d2JSMzP9GLLN/fwh8dP+NYbFJJ49x352ZPfmpjDrhzN9jbCmd9/ETVdUPuhDzWDJVyLgN8ZUsPftUtuvcUBMDNcBp+fXMM7mS1VXRwgjX8zEq0r31poh9jVwhzQ9LXXnIQcQoTwc+mrSNOBQkOckLoJH9cbCiGPs1h87lEf/Qag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479221; c=relaxed/simple;
	bh=WDbpQM0xO/4NGpZ5pN/QE/ZeohUzgkUL7VNsFjOA184=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ9cFUrLPMaZfU2wSdeoACTQmRHhRt+61EjyGXy6uvX43054O7rr+ZZ5yYMHAYR2g+S5Y3inWRwpjxvws0XNZ2qftlmBX2Uy+6nvzttE2gvMkVnATzKBHit69hhWBLDv2IXku07ZJbFX4JzfgpxHU24eLjkfwBj1KTt0jnPA/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L60dUBVM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=41m4Y7nh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L60dUBVM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=41m4Y7nh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L60dUBVM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="41m4Y7nh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L60dUBVM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="41m4Y7nh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 099D9227CE;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PQlb6z83UZfmWqyPbdZeQsselHaMrPzOtzHEJBVH4c=;
	b=L60dUBVM6dG7Hq1N5A/4JrLFOmNRVadt7wIdcmUyIrVg8iqIJ1RA3VAJoAgiG7Pwf6Dy4/
	KMMyPbg6Y5cKx3IQldy4n5agfjiHWxNNVcJeFkuYvC54VbTsbGsTjWueEAgUfifKUZF0z1
	efHZDd0tTipnDqdKAqgVAVRNNabepsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PQlb6z83UZfmWqyPbdZeQsselHaMrPzOtzHEJBVH4c=;
	b=41m4Y7nhnvxh6GfcHhN/BuWLaC5XxKI5UZcOe2nAuezhoOF4aYHGGq6pMI+bOeavwOCR0y
	FYgd8B5qWP8ogeBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PQlb6z83UZfmWqyPbdZeQsselHaMrPzOtzHEJBVH4c=;
	b=L60dUBVM6dG7Hq1N5A/4JrLFOmNRVadt7wIdcmUyIrVg8iqIJ1RA3VAJoAgiG7Pwf6Dy4/
	KMMyPbg6Y5cKx3IQldy4n5agfjiHWxNNVcJeFkuYvC54VbTsbGsTjWueEAgUfifKUZF0z1
	efHZDd0tTipnDqdKAqgVAVRNNabepsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PQlb6z83UZfmWqyPbdZeQsselHaMrPzOtzHEJBVH4c=;
	b=41m4Y7nhnvxh6GfcHhN/BuWLaC5XxKI5UZcOe2nAuezhoOF4aYHGGq6pMI+bOeavwOCR0y
	FYgd8B5qWP8ogeBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E52E013326;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2L3JNte+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/18] ALSA: opl3sa2: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:50 +0200
Message-ID: <20250829145300.5460-11-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opl3sa2.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index 5e8e1326d5c0..8c1767697b62 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -172,13 +172,8 @@ static unsigned char __snd_opl3sa2_read(struct snd_opl3sa2 *chip, unsigned char
 /* read control port (with spinlock) */
 static unsigned char snd_opl3sa2_read(struct snd_opl3sa2 *chip, unsigned char reg)
 {
-	unsigned long flags;
-	unsigned char result;
-
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	result = __snd_opl3sa2_read(chip, reg);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-	return result;
+	guard(spinlock_irqsave)(&chip->reg_lock);
+	return __snd_opl3sa2_read(chip, reg);
 }
 
 /* write control port (w/o spinlock) */
@@ -195,10 +190,8 @@ static void __snd_opl3sa2_write(struct snd_opl3sa2 *chip, unsigned char reg, uns
 /* write control port (with spinlock) */
 static void snd_opl3sa2_write(struct snd_opl3sa2 *chip, unsigned char reg, unsigned char value)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	__snd_opl3sa2_write(chip, reg, value);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static int snd_opl3sa2_detect(struct snd_card *card)
@@ -336,15 +329,13 @@ static irqreturn_t snd_opl3sa2_interrupt(int irq, void *dev_id)
 static int snd_opl3sa2_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_opl3sa2 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->ctlregs[reg] >> shift) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -353,7 +344,6 @@ static int snd_opl3sa2_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_opl3sa2_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_opl3sa2 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
@@ -365,12 +355,11 @@ static int snd_opl3sa2_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	if (invert)
 		val = mask - val;
 	val <<= shift;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	oval = chip->ctlregs[reg];
 	val = (oval & ~(mask << shift)) | val;
 	change = val != oval;
 	__snd_opl3sa2_write(chip, reg, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -391,7 +380,6 @@ static int snd_opl3sa2_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_opl3sa2_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_opl3sa2 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -399,10 +387,9 @@ static int snd_opl3sa2_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	int invert = (kcontrol->private_value >> 22) & 1;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->ctlregs[left_reg] >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (chip->ctlregs[right_reg] >> shift_right) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert) {
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 		ucontrol->value.integer.value[1] = mask - ucontrol->value.integer.value[1];
@@ -413,7 +400,6 @@ static int snd_opl3sa2_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_opl3sa2_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_opl3sa2 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -431,7 +417,7 @@ static int snd_opl3sa2_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (left_reg != right_reg) {
 		oval1 = chip->ctlregs[left_reg];
 		oval2 = chip->ctlregs[right_reg];
@@ -446,7 +432,6 @@ static int snd_opl3sa2_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 		change = val1 != oval1;
 		__snd_opl3sa2_write(chip, left_reg, val1);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
-- 
2.50.1

