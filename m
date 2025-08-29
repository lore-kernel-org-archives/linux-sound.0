Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF8D31CA7E
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479207; cv=none; b=S4zqsHN1EaQbRTeZ7pOhRcAbV/ySOHZ5E78WZl4Bmcx5SFG17uX7gin6VMH1evlZxZnAd0D/lp4JPLR2+hTMm0Z/AeeBV+HO3L1+UXnoORxaAd+WLzMf2vyge6u0aayhn8R0mRyGaWBDAW7CqR6/VyKTRqurX8tpJiZ2eQEsW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479207; c=relaxed/simple;
	bh=RiXuJigW2z0I15RYAjR/FgzhKxvrsjBRtwb4CtgjwzU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZU2GTxFep+sxhp7cFsvIZ5/uDlVzCv1C4ifiYy7qQ519QEt17vcTDbO+DkpGZ/OZAyg9DNji+V6AndhvnXYX/T46hDKySsbvAPNEEsb4Px11J284fYe8+M33q4O8TgkGsnIyA/x1b0avCcPzZfllHQiJufhlHDNYDtcdfGL5p0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOaTsB40; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z2oqM4CE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOaTsB40; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z2oqM4CE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOaTsB40";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2oqM4CE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOaTsB40";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2oqM4CE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B87F5C242;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6B/h7SkkTM1EhILYtpsqspYLtjGqajAxncyp3NN7SBE=;
	b=dOaTsB40NdJUQQV1UA5kJSuoO+SQVGKVbBSiv7SzhpQE2MuCsoWO4dMPq/W8OhShWlTeNs
	XDzSKhtTCPnJ/DJTMUQQnhe9k3lRbgB2lba41GShimXGeYFZ8K72hv/bCOAhSh9rVjbLoG
	HV1LtbEvIT7ipSHtjqRCsXjMstucJk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6B/h7SkkTM1EhILYtpsqspYLtjGqajAxncyp3NN7SBE=;
	b=z2oqM4CE9bswLuQURQGvfEjK4/SZn1k9NozrDwt2SC/dsjeg9wa+Zf9jhvw0QSI2T2Ha93
	tAJ0erGe7GSXFXDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dOaTsB40;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z2oqM4CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6B/h7SkkTM1EhILYtpsqspYLtjGqajAxncyp3NN7SBE=;
	b=dOaTsB40NdJUQQV1UA5kJSuoO+SQVGKVbBSiv7SzhpQE2MuCsoWO4dMPq/W8OhShWlTeNs
	XDzSKhtTCPnJ/DJTMUQQnhe9k3lRbgB2lba41GShimXGeYFZ8K72hv/bCOAhSh9rVjbLoG
	HV1LtbEvIT7ipSHtjqRCsXjMstucJk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6B/h7SkkTM1EhILYtpsqspYLtjGqajAxncyp3NN7SBE=;
	b=z2oqM4CE9bswLuQURQGvfEjK4/SZn1k9NozrDwt2SC/dsjeg9wa+Zf9jhvw0QSI2T2Ha93
	tAJ0erGe7GSXFXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1759413326;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2MN9BNe+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/18] ALSA: cs423x: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:44 +0200
Message-ID: <20250829145300.5460-5-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 3B87F5C242
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4236_lib.c | 130 +++++++++++++---------------------
 1 file changed, 48 insertions(+), 82 deletions(-)

diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index bf5b0ffb9273..e2c29e831020 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -169,10 +169,9 @@ static void snd_cs4236_playback_format(struct snd_wss *chip,
 				       struct snd_pcm_hw_params *params,
 				       unsigned char pdfr)
 {
-	unsigned long flags;
 	unsigned char rate = divisor_to_rate_register(params->rate_den);
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	/* set fast playback format change and clean playback FIFO */
 	snd_wss_out(chip, CS4231_ALT_FEATURE_1,
 		    chip->image[CS4231_ALT_FEATURE_1] | 0x10);
@@ -180,17 +179,15 @@ static void snd_cs4236_playback_format(struct snd_wss *chip,
 	snd_wss_out(chip, CS4231_ALT_FEATURE_1,
 		    chip->image[CS4231_ALT_FEATURE_1] & ~0x10);
 	snd_cs4236_ext_out(chip, CS4236_DAC_RATE, rate);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static void snd_cs4236_capture_format(struct snd_wss *chip,
 				      struct snd_pcm_hw_params *params,
 				      unsigned char cdfr)
 {
-	unsigned long flags;
 	unsigned char rate = divisor_to_rate_register(params->rate_den);
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	/* set fast capture format change and clean capture FIFO */
 	snd_wss_out(chip, CS4231_ALT_FEATURE_1,
 		    chip->image[CS4231_ALT_FEATURE_1] | 0x20);
@@ -198,7 +195,6 @@ static void snd_cs4236_capture_format(struct snd_wss *chip,
 	snd_wss_out(chip, CS4231_ALT_FEATURE_1,
 		    chip->image[CS4231_ALT_FEATURE_1] & ~0x20);
 	snd_cs4236_ext_out(chip, CS4236_ADC_RATE, rate);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 #ifdef CONFIG_PM
@@ -206,48 +202,45 @@ static void snd_cs4236_capture_format(struct snd_wss *chip,
 static void snd_cs4236_suspend(struct snd_wss *chip)
 {
 	int reg;
-	unsigned long flags;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	for (reg = 0; reg < 32; reg++)
 		chip->image[reg] = snd_wss_in(chip, reg);
 	for (reg = 0; reg < 18; reg++)
 		chip->eimage[reg] = snd_cs4236_ext_in(chip, CS4236_I23VAL(reg));
 	for (reg = 2; reg < 9; reg++)
 		chip->cimage[reg] = snd_cs4236_ctrl_in(chip, reg);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static void snd_cs4236_resume(struct snd_wss *chip)
 {
 	int reg;
-	unsigned long flags;
 	
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	for (reg = 0; reg < 32; reg++) {
-		switch (reg) {
-		case CS4236_EXT_REG:
-		case CS4231_VERSION:
-		case 27:	/* why? CS4235 - master left */
-		case 29:	/* why? CS4235 - master right */
-			break;
-		default:
-			snd_wss_out(chip, reg, chip->image[reg]);
-			break;
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		for (reg = 0; reg < 32; reg++) {
+			switch (reg) {
+			case CS4236_EXT_REG:
+			case CS4231_VERSION:
+			case 27:	/* why? CS4235 - master left */
+			case 29:	/* why? CS4235 - master right */
+				break;
+			default:
+				snd_wss_out(chip, reg, chip->image[reg]);
+				break;
+			}
+		}
+		for (reg = 0; reg < 18; reg++)
+			snd_cs4236_ext_out(chip, CS4236_I23VAL(reg), chip->eimage[reg]);
+		for (reg = 2; reg < 9; reg++) {
+			switch (reg) {
+			case 7:
+				break;
+			default:
+				snd_cs4236_ctrl_out(chip, reg, chip->cimage[reg]);
+			}
 		}
 	}
-	for (reg = 0; reg < 18; reg++)
-		snd_cs4236_ext_out(chip, CS4236_I23VAL(reg), chip->eimage[reg]);
-	for (reg = 2; reg < 9; reg++) {
-		switch (reg) {
-		case 7:
-			break;
-		default:
-			snd_cs4236_ctrl_out(chip, reg, chip->cimage[reg]);
-		}
-	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	snd_wss_mce_down(chip);
 }
 
@@ -403,15 +396,13 @@ static int snd_cs4236_info_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_cs4236_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->eimage[CS4236_REG(reg)] >> shift) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -420,7 +411,6 @@ static int snd_cs4236_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_cs4236_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
@@ -432,11 +422,10 @@ static int snd_cs4236_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	if (invert)
 		val = mask - val;
 	val <<= shift;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val = (chip->eimage[CS4236_REG(reg)] & ~(mask << shift)) | val;
 	change = val != chip->eimage[CS4236_REG(reg)];
 	snd_cs4236_ext_out(chip, reg, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -449,15 +438,13 @@ static int snd_cs4236_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_cs4236_get_singlec(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->cimage[reg] >> shift) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -466,7 +453,6 @@ static int snd_cs4236_get_singlec(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_cs4236_put_singlec(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
@@ -478,11 +464,10 @@ static int snd_cs4236_put_singlec(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	if (invert)
 		val = mask - val;
 	val <<= shift;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val = (chip->cimage[reg] & ~(mask << shift)) | val;
 	change = val != chip->cimage[reg];
 	snd_cs4236_ctrl_out(chip, reg, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -516,7 +501,6 @@ static int snd_cs4236_info_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_cs4236_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -524,10 +508,9 @@ static int snd_cs4236_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	int invert = (kcontrol->private_value >> 22) & 1;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->eimage[CS4236_REG(left_reg)] >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (chip->eimage[CS4236_REG(right_reg)] >> shift_right) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert) {
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 		ucontrol->value.integer.value[1] = mask - ucontrol->value.integer.value[1];
@@ -538,7 +521,6 @@ static int snd_cs4236_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_cs4236_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -556,7 +538,7 @@ static int snd_cs4236_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (left_reg != right_reg) {
 		val1 = (chip->eimage[CS4236_REG(left_reg)] & ~(mask << shift_left)) | val1;
 		val2 = (chip->eimage[CS4236_REG(right_reg)] & ~(mask << shift_right)) | val2;
@@ -568,7 +550,6 @@ static int snd_cs4236_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 		change = val1 != chip->eimage[CS4236_REG(left_reg)];
 		snd_cs4236_ext_out(chip, left_reg, val1);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -592,7 +573,6 @@ static int snd_cs4236_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_cs4236_get_double1(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -600,10 +580,9 @@ static int snd_cs4236_get_double1(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	int invert = (kcontrol->private_value >> 22) & 1;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->image[left_reg] >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (chip->eimage[CS4236_REG(right_reg)] >> shift_right) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert) {
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 		ucontrol->value.integer.value[1] = mask - ucontrol->value.integer.value[1];
@@ -614,7 +593,6 @@ static int snd_cs4236_get_double1(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_cs4236_put_double1(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -632,13 +610,12 @@ static int snd_cs4236_put_double1(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val1 = (chip->image[left_reg] & ~(mask << shift_left)) | val1;
 	val2 = (chip->eimage[CS4236_REG(right_reg)] & ~(mask << shift_right)) | val2;
 	change = val1 != chip->image[left_reg] || val2 != chip->eimage[CS4236_REG(right_reg)];
 	snd_wss_out(chip, left_reg, val1);
 	snd_cs4236_ext_out(chip, right_reg, val2);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -658,31 +635,27 @@ static inline int snd_cs4236_mixer_master_digital_invert_volume(int vol)
 static int snd_cs4236_get_master_digital(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = snd_cs4236_mixer_master_digital_invert_volume(chip->eimage[CS4236_REG(CS4236_LEFT_MASTER)] & 0x7f);
 	ucontrol->value.integer.value[1] = snd_cs4236_mixer_master_digital_invert_volume(chip->eimage[CS4236_REG(CS4236_RIGHT_MASTER)] & 0x7f);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static int snd_cs4236_put_master_digital(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned short val1, val2;
 	
 	val1 = snd_cs4236_mixer_master_digital_invert_volume(ucontrol->value.integer.value[0] & 0x7f);
 	val2 = snd_cs4236_mixer_master_digital_invert_volume(ucontrol->value.integer.value[1] & 0x7f);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val1 = (chip->eimage[CS4236_REG(CS4236_LEFT_MASTER)] & ~0x7f) | val1;
 	val2 = (chip->eimage[CS4236_REG(CS4236_RIGHT_MASTER)] & ~0x7f) | val2;
 	change = val1 != chip->eimage[CS4236_REG(CS4236_LEFT_MASTER)] || val2 != chip->eimage[CS4236_REG(CS4236_RIGHT_MASTER)];
 	snd_cs4236_ext_out(chip, CS4236_LEFT_MASTER, val1);
 	snd_cs4236_ext_out(chip, CS4236_RIGHT_MASTER, val2);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -719,31 +692,27 @@ static inline int snd_cs4235_mixer_output_accu_set_volume(int vol)
 static int snd_cs4235_get_output_accu(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = snd_cs4235_mixer_output_accu_get_volume(chip->image[CS4235_LEFT_MASTER]);
 	ucontrol->value.integer.value[1] = snd_cs4235_mixer_output_accu_get_volume(chip->image[CS4235_RIGHT_MASTER]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static int snd_cs4235_put_output_accu(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned short val1, val2;
 	
 	val1 = snd_cs4235_mixer_output_accu_set_volume(ucontrol->value.integer.value[0]);
 	val2 = snd_cs4235_mixer_output_accu_set_volume(ucontrol->value.integer.value[1]);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val1 = (chip->image[CS4235_LEFT_MASTER] & ~(3 << 5)) | val1;
 	val2 = (chip->image[CS4235_RIGHT_MASTER] & ~(3 << 5)) | val2;
 	change = val1 != chip->image[CS4235_LEFT_MASTER] || val2 != chip->image[CS4235_RIGHT_MASTER];
 	snd_wss_out(chip, CS4235_LEFT_MASTER, val1);
 	snd_wss_out(chip, CS4235_RIGHT_MASTER, val2);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -929,9 +898,8 @@ WSS_DOUBLE("Analog Loopback Switch", 0,
 static int snd_cs4236_get_iec958_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = chip->image[CS4231_ALT_FEATURE_1] & 0x02 ? 1 : 0;
 #if 0
 	dev_dbg(chip->card->dev,
@@ -943,14 +911,12 @@ static int snd_cs4236_get_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 		snd_cs4236_ctrl_in(chip, 6),
 		snd_cs4236_ctrl_in(chip, 8));
 #endif
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static int snd_cs4236_put_iec958_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned short enable, val;
 	
@@ -958,16 +924,16 @@ static int snd_cs4236_put_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 
 	guard(mutex)(&chip->mce_mutex);
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	val = (chip->image[CS4231_ALT_FEATURE_1] & ~0x0e) | (0<<2) | (enable << 1);
-	change = val != chip->image[CS4231_ALT_FEATURE_1];
-	snd_wss_out(chip, CS4231_ALT_FEATURE_1, val);
-	val = snd_cs4236_ctrl_in(chip, 4) | 0xc0;
-	snd_cs4236_ctrl_out(chip, 4, val);
-	udelay(100);
-	val &= ~0x40;
-	snd_cs4236_ctrl_out(chip, 4, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		val = (chip->image[CS4231_ALT_FEATURE_1] & ~0x0e) | (0<<2) | (enable << 1);
+		change = val != chip->image[CS4231_ALT_FEATURE_1];
+		snd_wss_out(chip, CS4231_ALT_FEATURE_1, val);
+		val = snd_cs4236_ctrl_in(chip, 4) | 0xc0;
+		snd_cs4236_ctrl_out(chip, 4, val);
+		udelay(100);
+		val &= ~0x40;
+		snd_cs4236_ctrl_out(chip, 4, val);
+	}
 	snd_wss_mce_down(chip);
 
 #if 0
-- 
2.50.1

