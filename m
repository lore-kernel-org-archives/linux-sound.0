Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2431DD85
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479227; cv=none; b=UeKHBtBYowwPUAABjpTbS48218OzOdRD7CoFazD8hvrpgS/02w1LHcDrVVwffljc2Vt7r+3lV56VamT5maQDXboynAYM/BzFAEUHv8UM2J2Ny7ufni0FleRDkrZ2CgyBUOGXuFMw9LibOdFyG2eiJY05nBiDpCyRlmCJs74FeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479227; c=relaxed/simple;
	bh=5TaP060Gip+WVyjy0dx/fgBjyuO6BEKZeBXrHLSDbcs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTglk9cH9sP6GfCxU7XVYfy4IVXbr+OmQb4HH9bG4PLTjGnOegC4mpVfvDkMiPpw0XYg0txf4D6AhEYDGU22AQWEIYmR0nR1UCDkPJ30KkTkkUrwABPb5vP/jwqylJ3sWGYIlnUXIOb5rcLSofyw/d1/xsZyZ60JsZLk6AYsLYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k9hajpE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dlSQ6W5d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k9hajpE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dlSQ6W5d; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k9hajpE+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dlSQ6W5d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k9hajpE+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dlSQ6W5d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A6C1227DD;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOgMbM3XAqO2tsVd2/rV4gxJdYaxlvKqcdoaIb7dIxY=;
	b=k9hajpE+QRZEHcjDXLdc+00SVQ8RUL9tm8bcXhiJg7axfJkF61RfNM+KTUOJhXIAwRd4jK
	AORUsfTnYBmcUrxUm/5XcXwgPQ/M2DWKKTEqyeJBh7SfTooew8G7Bn79tBChbSQQ55Uzj2
	LgROEAyn0pMK5DNkiF4aGSR3a/qSUr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOgMbM3XAqO2tsVd2/rV4gxJdYaxlvKqcdoaIb7dIxY=;
	b=dlSQ6W5d0QqF1HjwgHNPZls45P9YcEeKxAWjnPbSXtsv7ryYzS7DLX4PcX0jLbA+blxenc
	Gcs3P7XiDq1pDcBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k9hajpE+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dlSQ6W5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOgMbM3XAqO2tsVd2/rV4gxJdYaxlvKqcdoaIb7dIxY=;
	b=k9hajpE+QRZEHcjDXLdc+00SVQ8RUL9tm8bcXhiJg7axfJkF61RfNM+KTUOJhXIAwRd4jK
	AORUsfTnYBmcUrxUm/5XcXwgPQ/M2DWKKTEqyeJBh7SfTooew8G7Bn79tBChbSQQ55Uzj2
	LgROEAyn0pMK5DNkiF4aGSR3a/qSUr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOgMbM3XAqO2tsVd2/rV4gxJdYaxlvKqcdoaIb7dIxY=;
	b=dlSQ6W5d0QqF1HjwgHNPZls45P9YcEeKxAWjnPbSXtsv7ryYzS7DLX4PcX0jLbA+blxenc
	Gcs3P7XiDq1pDcBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1005913A54;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kA6+Ati+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/18] ALSA: opti9xx: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:51 +0200
Message-ID: <20250829145300.5460-12-tiwai@suse.de>
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2A6C1227DD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opti9xx/miro.c           | 17 +++++------------
 sound/isa/opti9xx/opti92x-ad1848.c | 21 ++++++---------------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index ad7180d7c0c2..c320af3e9a05 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -822,10 +822,9 @@ static int snd_miro_init(struct snd_miro *chip,
 static unsigned char snd_miro_read(struct snd_miro *chip,
 				   unsigned char reg)
 {
-	unsigned long flags;
 	unsigned char retval = 0xff;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	outb(chip->password, chip->mc_base + chip->pwd_reg);
 
 	switch (chip->hardware) {
@@ -846,16 +845,13 @@ static unsigned char snd_miro_read(struct snd_miro *chip,
 		dev_err(chip->card->dev, "sorry, no support for %d\n", chip->hardware);
 	}
 
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return retval;
 }
 
 static void snd_miro_write(struct snd_miro *chip, unsigned char reg,
 			   unsigned char value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	outb(chip->password, chip->mc_base + chip->pwd_reg);
 
 	switch (chip->hardware) {
@@ -875,8 +871,6 @@ static void snd_miro_write(struct snd_miro *chip, unsigned char reg,
 	default:
 		dev_err(chip->card->dev, "sorry, no support for %d\n", chip->hardware);
 	}
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 static inline void snd_miro_write_mask(struct snd_miro *chip,
@@ -1013,7 +1007,6 @@ static int snd_miro_configure(struct snd_miro *chip)
 	unsigned char dma_bits;
 	unsigned char mpu_port_bits = 0;
 	unsigned char mpu_irq_bits;
-	unsigned long flags;
 
 	snd_miro_write_mask(chip, OPTi9XX_MC_REG(1), 0x80, 0x80);
 	snd_miro_write_mask(chip, OPTi9XX_MC_REG(2), 0x20, 0x20); /* OPL4 */
@@ -1109,9 +1102,9 @@ static int snd_miro_configure(struct snd_miro *chip)
 	}
 	dma_bits |= 0x04;
 
-	spin_lock_irqsave(&chip->lock, flags);
-	outb(irq_bits << 3 | dma_bits, chip->wss_base);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->lock) {
+		outb(irq_bits << 3 | dma_bits, chip->wss_base);
+	}
 
 __skip_resources:
 	if (chip->hardware > OPTi9XX_HW_82C928) {
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index 328d043a1619..abaa3ed3ab5c 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -228,10 +228,9 @@ static int snd_opti9xx_init(struct snd_opti9xx *chip,
 static unsigned char snd_opti9xx_read(struct snd_opti9xx *chip,
 				      unsigned char reg)
 {
-	unsigned long flags;
 	unsigned char retval = 0xff;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	outb(chip->password, chip->mc_base + chip->pwd_reg);
 
 	switch (chip->hardware) {
@@ -265,16 +264,13 @@ static unsigned char snd_opti9xx_read(struct snd_opti9xx *chip,
 		dev_err(chip->card->dev, "chip %d not supported\n", chip->hardware);
 	}
 
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return retval;
 }
 
 static void snd_opti9xx_write(struct snd_opti9xx *chip, unsigned char reg,
 			      unsigned char value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	outb(chip->password, chip->mc_base + chip->pwd_reg);
 
 	switch (chip->hardware) {
@@ -307,8 +303,6 @@ static void snd_opti9xx_write(struct snd_opti9xx *chip, unsigned char reg,
 	default:
 		dev_err(chip->card->dev, "chip %d not supported\n", chip->hardware);
 	}
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 
@@ -659,9 +653,6 @@ static int snd_opti9xx_read_check(struct snd_card *card,
 				  struct snd_opti9xx *chip)
 {
 	unsigned char value;
-#ifdef OPTi93X
-	unsigned long flags;
-#endif
 
 	chip->res_mc_base =
 		devm_request_region(card->dev, chip->mc_base,
@@ -680,10 +671,10 @@ static int snd_opti9xx_read_check(struct snd_card *card,
 	if (!chip->res_mc_indir)
 		return -EBUSY;
 
-	spin_lock_irqsave(&chip->lock, flags);
-	outb(chip->password, chip->mc_base + chip->pwd_reg);
-	outb(((chip->mc_indir_index & 0x1f0) >> 4), chip->mc_base);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->lock) {
+		outb(chip->password, chip->mc_base + chip->pwd_reg);
+		outb(((chip->mc_indir_index & 0x1f0) >> 4), chip->mc_base);
+	}
 
 	value = snd_opti9xx_read(chip, OPTi9XX_MC_REG(7));
 	snd_opti9xx_write(chip, OPTi9XX_MC_REG(7), 0xff - value);
-- 
2.50.1

