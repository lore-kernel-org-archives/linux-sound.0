Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B231B10A
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479208; cv=none; b=rN5Q5H1d+0VrPvvL7zEs6pgjBXyuSux24+/3/DguoenSHhyR978aUrXe5OGVt5357nf1Bzprrhvc1zQw4ON2vRhzkI6pj+LmvZVoVTipkvzSuOJssZnhTAr2yqhLDErTVu9Nr9DyVIPrlpymD/9jklrlTTukNillm028D1STFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479208; c=relaxed/simple;
	bh=GZEjfByEkwf9zUbbK/aBM1AJPplESeQgnZ25g3Orhls=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFtP5ndAToUXG7D+jztt0meeqOw+InMHWTxq7Y2bbposZ4TWG9wB+9ReeE5j0NJQ3tgpoL/knspPNbwHd91dDuhINfHiI7aZSpGd40yBcMvRZOyE8sZlukywFcDfGGKbOaAT6i1mjv6qwlY3g6Bcy93YVbCEANG/ZAfZ6Nyaa6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l2lGbUJ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UpzedQsf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l2lGbUJ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UpzedQsf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l2lGbUJ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UpzedQsf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l2lGbUJ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UpzedQsf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D74B2275B;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfjIwe9Fg+qdqeYZ2Oi+tis67Bh8HxuIUO7Isxky30s=;
	b=l2lGbUJ50k4h9NuRGH/QqMmMa6RhfuetqIpnxDCTb+K9u1IXUPxbIYvg+AdufQiavo0eqL
	2aAcBm2wWy9Q8SFpe3bvUILh3h3ELVTDnJvw1OJ/W89c5/FVu2L7298ok39Ubb+lOHE0g2
	HkORXaTdZgmJIZI/xcijs3fYltmz1pI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfjIwe9Fg+qdqeYZ2Oi+tis67Bh8HxuIUO7Isxky30s=;
	b=UpzedQsf3lDRupAu7/uYwW88WWMGUQFKL5IDdcm+6FKlmz+7I8mCHmLb1LYZuOD+syOcX9
	Yd/5a/hGP3vAMQDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfjIwe9Fg+qdqeYZ2Oi+tis67Bh8HxuIUO7Isxky30s=;
	b=l2lGbUJ50k4h9NuRGH/QqMmMa6RhfuetqIpnxDCTb+K9u1IXUPxbIYvg+AdufQiavo0eqL
	2aAcBm2wWy9Q8SFpe3bvUILh3h3ELVTDnJvw1OJ/W89c5/FVu2L7298ok39Ubb+lOHE0g2
	HkORXaTdZgmJIZI/xcijs3fYltmz1pI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfjIwe9Fg+qdqeYZ2Oi+tis67Bh8HxuIUO7Isxky30s=;
	b=UpzedQsf3lDRupAu7/uYwW88WWMGUQFKL5IDdcm+6FKlmz+7I8mCHmLb1LYZuOD+syOcX9
	Yd/5a/hGP3vAMQDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D7BD13326;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GGuoFde+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/18] ALSA: es18xx: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:46 +0200
Message-ID: <20250829145300.5460-7-tiwai@suse.de>
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

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es18xx.c | 58 ++++++++++++++++++----------------------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 3e89a84c6244..1da7b400a17b 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -185,16 +185,13 @@ static int snd_es18xx_dsp_get_byte(struct snd_es18xx *chip)
 static int snd_es18xx_write(struct snd_es18xx *chip,
 			    unsigned char reg, unsigned char data)
 {
-	unsigned long flags;
 	int ret;
 	
-        spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ret = snd_es18xx_dsp_command(chip, reg);
 	if (ret < 0)
-		goto end;
+		return ret;
         ret = snd_es18xx_dsp_command(chip, data);
- end:
-        spin_unlock_irqrestore(&chip->reg_lock, flags);
 #ifdef REG_DEBUG
 	dev_dbg(chip->card->dev, "Reg %02x set to %02x\n", reg, data);
 #endif
@@ -203,22 +200,20 @@ static int snd_es18xx_write(struct snd_es18xx *chip,
 
 static int snd_es18xx_read(struct snd_es18xx *chip, unsigned char reg)
 {
-	unsigned long flags;
 	int ret, data;
-        spin_lock_irqsave(&chip->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ret = snd_es18xx_dsp_command(chip, 0xC0);
 	if (ret < 0)
-		goto end;
+		return ret;
         ret = snd_es18xx_dsp_command(chip, reg);
 	if (ret < 0)
-		goto end;
+		return ret;
 	data = snd_es18xx_dsp_get_byte(chip);
 	ret = data;
 #ifdef REG_DEBUG
 	dev_dbg(chip->card->dev, "Reg %02x now is %02x (%d)\n", reg, data, ret);
 #endif
- end:
-        spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return ret;
 }
 
@@ -228,47 +223,41 @@ static int snd_es18xx_bits(struct snd_es18xx *chip, unsigned char reg,
 {
         int ret;
 	unsigned char old, new, oval;
-	unsigned long flags;
-        spin_lock_irqsave(&chip->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->reg_lock);
         ret = snd_es18xx_dsp_command(chip, 0xC0);
 	if (ret < 0)
-		goto end;
+		return ret;
         ret = snd_es18xx_dsp_command(chip, reg);
 	if (ret < 0)
-		goto end;
+		return ret;
 	ret = snd_es18xx_dsp_get_byte(chip);
-	if (ret < 0) {
-		goto end;
-	}
+	if (ret < 0)
+		return ret;
 	old = ret;
 	oval = old & mask;
 	if (val != oval) {
 		ret = snd_es18xx_dsp_command(chip, reg);
 		if (ret < 0)
-			goto end;
+			return ret;
 		new = (old & ~mask) | (val & mask);
 		ret = snd_es18xx_dsp_command(chip, new);
 		if (ret < 0)
-			goto end;
+			return ret;
 #ifdef REG_DEBUG
 		dev_dbg(chip->card->dev, "Reg %02x was %02x, set to %02x (%d)\n",
 			reg, old, new, ret);
 #endif
 	}
-	ret = oval;
- end:
-        spin_unlock_irqrestore(&chip->reg_lock, flags);
-	return ret;
+	return oval;
 }
 
 static inline void snd_es18xx_mixer_write(struct snd_es18xx *chip,
 			    unsigned char reg, unsigned char data)
 {
-	unsigned long flags;
-        spin_lock_irqsave(&chip->mixer_lock, flags);
+	guard(spinlock_irqsave)(&chip->mixer_lock);
         outb(reg, chip->port + 0x04);
         outb(data, chip->port + 0x05);
-        spin_unlock_irqrestore(&chip->mixer_lock, flags);
 #ifdef REG_DEBUG
 	dev_dbg(chip->card->dev, "Mixer reg %02x set to %02x\n", reg, data);
 #endif
@@ -276,12 +265,11 @@ static inline void snd_es18xx_mixer_write(struct snd_es18xx *chip,
 
 static inline int snd_es18xx_mixer_read(struct snd_es18xx *chip, unsigned char reg)
 {
-	unsigned long flags;
 	int data;
-        spin_lock_irqsave(&chip->mixer_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->mixer_lock);
         outb(reg, chip->port + 0x04);
 	data = inb(chip->port + 0x05);
-        spin_unlock_irqrestore(&chip->mixer_lock, flags);
 #ifdef REG_DEBUG
 	dev_dbg(chip->card->dev, "Mixer reg %02x now is %02x\n", reg, data);
 #endif
@@ -293,8 +281,8 @@ static inline int snd_es18xx_mixer_bits(struct snd_es18xx *chip, unsigned char r
 					unsigned char mask, unsigned char val)
 {
 	unsigned char old, new, oval;
-	unsigned long flags;
-        spin_lock_irqsave(&chip->mixer_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->mixer_lock);
         outb(reg, chip->port + 0x04);
 	old = inb(chip->port + 0x05);
 	oval = old & mask;
@@ -306,7 +294,6 @@ static inline int snd_es18xx_mixer_bits(struct snd_es18xx *chip, unsigned char r
 			reg, old, new);
 #endif
 	}
-        spin_unlock_irqrestore(&chip->mixer_lock, flags);
 	return oval;
 }
 
@@ -314,14 +301,13 @@ static inline int snd_es18xx_mixer_writable(struct snd_es18xx *chip, unsigned ch
 					    unsigned char mask)
 {
 	int old, expected, new;
-	unsigned long flags;
-        spin_lock_irqsave(&chip->mixer_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->mixer_lock);
         outb(reg, chip->port + 0x04);
 	old = inb(chip->port + 0x05);
 	expected = old ^ mask;
 	outb(expected, chip->port + 0x05);
 	new = inb(chip->port + 0x05);
-        spin_unlock_irqrestore(&chip->mixer_lock, flags);
 #ifdef REG_DEBUG
 	dev_dbg(chip->card->dev, "Mixer reg %02x was %02x, set to %02x, now is %02x\n",
 		reg, old, expected, new);
-- 
2.50.1

