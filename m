Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC9D1EA0C3
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=Jcg1OZSHF5AKXGUnyjUR1lRUo5HFB7/KYv1UZdatFOMpO8gYKbfmObG1nmk77hw2a3riJ7xZrJ2kN80tJKSmehXkv+kw6/tKotstNhc9W37eiKAJyTO0yucc1DpUb1qJfdKdL22AciW9lT8tEku4cbllI/J9VeNuuAOyYPpkxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=4tx8RVWjYuDkt0Ietg0fyCXqwH9UXhewZUNsiUg5Bqg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EE0yoI2CLbBchkPP8GDV6uhnlBd1ujR7qM+xvpAoTtzqInyV5IV1sX3+C79rUye34Ejy2EZy5RgiGoKtDWB+fKBaHuI3/0OY/wGrxhh7JqiBvggatcQKlEJREkqRQY+hK3UCySXjYARh7j8gFcxf8kHXorLM49LA5un1ruYWmIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bcQI6vXq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wNOTQaL7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bcQI6vXq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wNOTQaL7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcQI6vXq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wNOTQaL7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bcQI6vXq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wNOTQaL7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 024EB21D20;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZEptk7ZxnbiWu6tHetJUOIM/SX/eUgl4J80zQO9ShI=;
	b=bcQI6vXqHkaO7eI4KmSayS+zshNM++UQYiqI5QYje8l9qq2BdkD0Jp79FBleZf16nEiw2t
	cGniu9fGIUY7P52dhm3/51+ZNkYme/rAZ0x2JHXfLGLooC96PYLwKuFw86MgZaEj5fAnBt
	M8tbf6WyVR26xr8+RH0ZDFebV6QQ/yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZEptk7ZxnbiWu6tHetJUOIM/SX/eUgl4J80zQO9ShI=;
	b=wNOTQaL7Pc7v2BF2df6rcwr0p73wy+MkpNhrvUXASqq2Z0bNTIvNVKaRn1kPwtdUAnXuCb
	frpWvPapkAsThSAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZEptk7ZxnbiWu6tHetJUOIM/SX/eUgl4J80zQO9ShI=;
	b=bcQI6vXqHkaO7eI4KmSayS+zshNM++UQYiqI5QYje8l9qq2BdkD0Jp79FBleZf16nEiw2t
	cGniu9fGIUY7P52dhm3/51+ZNkYme/rAZ0x2JHXfLGLooC96PYLwKuFw86MgZaEj5fAnBt
	M8tbf6WyVR26xr8+RH0ZDFebV6QQ/yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZEptk7ZxnbiWu6tHetJUOIM/SX/eUgl4J80zQO9ShI=;
	b=wNOTQaL7Pc7v2BF2df6rcwr0p73wy+MkpNhrvUXASqq2Z0bNTIvNVKaRn1kPwtdUAnXuCb
	frpWvPapkAsThSAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE3C013A7D;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YDMZNdp3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 17/54] ALSA: i2c: Drop commented old debug prints
Date: Wed,  7 Aug 2024 15:34:07 +0200
Message-ID: <20240807133452.9424-18-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.941];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

There are quite a few commented-out debug prints that have never been
used in the production code.  Let's rip them off for code cleanness.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/i2c/other/ak4113.c      |  2 --
 sound/i2c/other/ak4114.c      | 12 ------------
 sound/i2c/other/ak4117.c      | 13 -------------
 sound/i2c/other/ak4xxx-adda.c |  2 --
 sound/i2c/tea6330t.c          |  3 ---
 5 files changed, 32 deletions(-)

diff --git a/sound/i2c/other/ak4113.c b/sound/i2c/other/ak4113.c
index e7213092eb4f..c1f7447a4d11 100644
--- a/sound/i2c/other/ak4113.c
+++ b/sound/i2c/other/ak4113.c
@@ -599,8 +599,6 @@ int snd_ak4113_check_rate_and_errors(struct ak4113 *ak4113, unsigned int flags)
 			(runtime->rate != res)) {
 		snd_pcm_stream_lock_irqsave(ak4113->substream, _flags);
 		if (snd_pcm_running(ak4113->substream)) {
-			/*printk(KERN_DEBUG "rate changed (%i <- %i)\n",
-			 * runtime->rate, res); */
 			snd_pcm_stop(ak4113->substream,
 					SNDRV_PCM_STATE_DRAINING);
 			wake_up(&runtime->sleep);
diff --git a/sound/i2c/other/ak4114.c b/sound/i2c/other/ak4114.c
index c0cffe28989b..7c493681f3cb 100644
--- a/sound/i2c/other/ak4114.c
+++ b/sound/i2c/other/ak4114.c
@@ -38,17 +38,6 @@ static inline unsigned char reg_read(struct ak4114 *ak4114, unsigned char reg)
 	return ak4114->read(ak4114->private_data, reg);
 }
 
-#if 0
-static void reg_dump(struct ak4114 *ak4114)
-{
-	int i;
-
-	printk(KERN_DEBUG "AK4114 REG DUMP:\n");
-	for (i = 0; i < 0x20; i++)
-		printk(KERN_DEBUG "reg[%02x] = %02x (%02x)\n", i, reg_read(ak4114, i), i < ARRAY_SIZE(ak4114->regmap) ? ak4114->regmap[i] : 0);
-}
-#endif
-
 static void snd_ak4114_free(struct ak4114 *chip)
 {
 	atomic_inc(&chip->wq_processing);	/* don't schedule new work */
@@ -589,7 +578,6 @@ int snd_ak4114_check_rate_and_errors(struct ak4114 *ak4114, unsigned int flags)
 	if (!(flags & AK4114_CHECK_NO_RATE) && runtime && runtime->rate != res) {
 		snd_pcm_stream_lock_irqsave(ak4114->capture_substream, _flags);
 		if (snd_pcm_running(ak4114->capture_substream)) {
-			// printk(KERN_DEBUG "rate changed (%i <- %i)\n", runtime->rate, res);
 			snd_pcm_stop(ak4114->capture_substream, SNDRV_PCM_STATE_DRAINING);
 			res = 1;
 		}
diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index 640501bb3ca6..165fdda8fda5 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -34,17 +34,6 @@ static inline unsigned char reg_read(struct ak4117 *ak4117, unsigned char reg)
 	return ak4117->read(ak4117->private_data, reg);
 }
 
-#if 0
-static void reg_dump(struct ak4117 *ak4117)
-{
-	int i;
-
-	printk(KERN_DEBUG "AK4117 REG DUMP:\n");
-	for (i = 0; i < 0x1b; i++)
-		printk(KERN_DEBUG "reg[%02x] = %02x (%02x)\n", i, reg_read(ak4117, i), i < sizeof(ak4117->regmap) ? ak4117->regmap[i] : 0);
-}
-#endif
-
 static void snd_ak4117_free(struct ak4117 *chip)
 {
 	timer_shutdown_sync(&chip->timer);
@@ -452,7 +441,6 @@ int snd_ak4117_check_rate_and_errors(struct ak4117 *ak4117, unsigned int flags)
 		goto __rate;
 	rcs0 = reg_read(ak4117, AK4117_REG_RCS0);
 	rcs2 = reg_read(ak4117, AK4117_REG_RCS2);
-	// printk(KERN_DEBUG "AK IRQ: rcs0 = 0x%x, rcs1 = 0x%x, rcs2 = 0x%x\n", rcs0, rcs1, rcs2);
 	spin_lock_irqsave(&ak4117->lock, _flags);
 	if (rcs0 & AK4117_PAR)
 		ak4117->errors[AK4117_PARITY_ERRORS]++;
@@ -505,7 +493,6 @@ int snd_ak4117_check_rate_and_errors(struct ak4117 *ak4117, unsigned int flags)
 	if (!(flags & AK4117_CHECK_NO_RATE) && runtime && runtime->rate != res) {
 		snd_pcm_stream_lock_irqsave(ak4117->substream, _flags);
 		if (snd_pcm_running(ak4117->substream)) {
-			// printk(KERN_DEBUG "rate changed (%i <- %i)\n", runtime->rate, res);
 			snd_pcm_stop(ak4117->substream, SNDRV_PCM_STATE_DRAINING);
 			wake_up(&runtime->sleep);
 			res = 1;
diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index 7d15093844b9..b24c80410d45 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -391,8 +391,6 @@ static int put_ak_reg(struct snd_kcontrol *kcontrol, int addr,
 		nval = mask - nval;
 	if (AK_GET_NEEDSMSB(kcontrol->private_value))
 		nval |= 0x80;
-	/* printk(KERN_DEBUG "DEBUG - AK writing reg: chip %x addr %x,
-	   nval %x\n", chip, addr, nval); */
 	snd_akm4xxx_write(ak, chip, addr, nval);
 	return 1;
 }
diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
index 037d6293f728..676d58054944 100644
--- a/sound/i2c/tea6330t.c
+++ b/sound/i2c/tea6330t.c
@@ -56,9 +56,6 @@ int snd_tea6330t_detect(struct snd_i2c_bus *bus, int equalizer)
 static void snd_tea6330t_set(struct tea6330t *tea,
 			     unsigned char addr, unsigned char value)
 {
-#if 0
-	printk(KERN_DEBUG "set - 0x%x/0x%x\n", addr, value);
-#endif
 	snd_i2c_write(tea->bus, TEA6330T_ADDR, addr, value, 1);
 }
 #endif
-- 
2.43.0

