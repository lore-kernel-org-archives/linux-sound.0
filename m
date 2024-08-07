Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E7200109
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037667; cv=none; b=FC7TvCacWBHZLhH+WBaj0NfWqxGcUPevTDnV78+OO4lYUw5HE/NThzASC9yIqh5Em8Nj5JaPzylrW9GPMsWYwXi0FTNwm6H49XaYyI7k94trrh5BPRcgXr739mj0TBPL1Bqy+W/G0K/y5oYJn5Xp7iIq5tcbJoOwF2AVGsQtVHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037667; c=relaxed/simple;
	bh=B2Mdnljq6b3YFqZHOeeKDn4mWopEo14NEqLF0EAbdas=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAkEfrb1SE7swyq3NVmgUAUHdLpjWHSG3ZSNGOKoFosWvDjGl7zQh/nKGASOZ3O3RlMlBwg4Pz6v5swFzpWu08FzRe/MogahR2o1OLr0H6XR4Tm7qBcv0kNpNhykDCLAtIN7f9CBmpqi+CpW+smKQjiGZbiMkzEX87M1DMFksbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KnobA+dU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B3jPVnWY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KnobA+dU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B3jPVnWY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KnobA+dU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B3jPVnWY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KnobA+dU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B3jPVnWY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F0A521D27;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhQ1XYS0mBFeOy+Oh7kmhFde5KgMRUrXrHezJRrcd28=;
	b=KnobA+dUGQoAJOzmFlPOBPoE+90ra64Xn98wTWxTayiv9k3S+xKYDOD1FAZ0EhHDz7aqBz
	rT6PAFmA9tu3act/C0SNo+RJ4ZhyaSAAAdnDmT66MziMs01+gIAO9gWhnFyEADMH49p027
	6pyK7j5rmS2DKelpHHPKbNmv7sNLFek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhQ1XYS0mBFeOy+Oh7kmhFde5KgMRUrXrHezJRrcd28=;
	b=B3jPVnWYCoa1BOzTiV2bt7AObAT5Km/u2elah4dPPKRuJmhIizIwUXb8gHP/9bqSWNzawt
	9asrid3w8CilzhBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KnobA+dU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B3jPVnWY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhQ1XYS0mBFeOy+Oh7kmhFde5KgMRUrXrHezJRrcd28=;
	b=KnobA+dUGQoAJOzmFlPOBPoE+90ra64Xn98wTWxTayiv9k3S+xKYDOD1FAZ0EhHDz7aqBz
	rT6PAFmA9tu3act/C0SNo+RJ4ZhyaSAAAdnDmT66MziMs01+gIAO9gWhnFyEADMH49p027
	6pyK7j5rmS2DKelpHHPKbNmv7sNLFek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhQ1XYS0mBFeOy+Oh7kmhFde5KgMRUrXrHezJRrcd28=;
	b=B3jPVnWYCoa1BOzTiV2bt7AObAT5Km/u2elah4dPPKRuJmhIizIwUXb8gHP/9bqSWNzawt
	9asrid3w8CilzhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76C5713B03;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4G/fG913s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 36/54] ALSA: wss: Use standard print API
Date: Wed,  7 Aug 2024 15:34:26 +0200
Message-ID: <20240807133452.9424-37-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 8F0A521D27
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wss/wss_lib.c | 178 ++++++++++++++++++++--------------------
 1 file changed, 90 insertions(+), 88 deletions(-)

diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 026061b55ee9..9c655789574d 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -187,15 +187,16 @@ void snd_wss_out(struct snd_wss *chip, unsigned char reg, unsigned char value)
 	snd_wss_wait(chip);
 #ifdef CONFIG_SND_DEBUG
 	if (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT)
-		snd_printk(KERN_DEBUG "out: auto calibration time out "
-			   "- reg = 0x%x, value = 0x%x\n", reg, value);
+		dev_dbg(chip->card->dev,
+			"out: auto calibration time out - reg = 0x%x, value = 0x%x\n",
+			reg, value);
 #endif
 	wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | reg);
 	wss_outb(chip, CS4231P(REG), value);
 	chip->image[reg] = value;
 	mb();
-	snd_printdd("codec out - reg 0x%x = 0x%x\n",
-			chip->mce_bit | reg, value);
+	dev_dbg(chip->card->dev, "codec out - reg 0x%x = 0x%x\n",
+		chip->mce_bit | reg, value);
 }
 EXPORT_SYMBOL(snd_wss_out);
 
@@ -204,8 +205,8 @@ unsigned char snd_wss_in(struct snd_wss *chip, unsigned char reg)
 	snd_wss_wait(chip);
 #ifdef CONFIG_SND_DEBUG
 	if (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT)
-		snd_printk(KERN_DEBUG "in: auto calibration time out "
-			   "- reg = 0x%x\n", reg);
+		dev_dbg(chip->card->dev,
+			"in: auto calibration time out - reg = 0x%x\n", reg);
 #endif
 	wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | reg);
 	mb();
@@ -222,7 +223,7 @@ void snd_cs4236_ext_out(struct snd_wss *chip, unsigned char reg,
 	wss_outb(chip, CS4231P(REG), val);
 	chip->eimage[CS4236_REG(reg)] = val;
 #if 0
-	printk(KERN_DEBUG "ext out : reg = 0x%x, val = 0x%x\n", reg, val);
+	dev_dbg(chip->card->dev, "ext out : reg = 0x%x, val = 0x%x\n", reg, val);
 #endif
 }
 EXPORT_SYMBOL(snd_cs4236_ext_out);
@@ -238,8 +239,8 @@ unsigned char snd_cs4236_ext_in(struct snd_wss *chip, unsigned char reg)
 	{
 		unsigned char res;
 		res = wss_inb(chip, CS4231P(REG));
-		printk(KERN_DEBUG "ext in : reg = 0x%x, val = 0x%x\n",
-		       reg, res);
+		dev_dbg(chip->card->dev, "ext in : reg = 0x%x, val = 0x%x\n",
+			reg, res);
 		return res;
 	}
 #endif
@@ -250,87 +251,87 @@ EXPORT_SYMBOL(snd_cs4236_ext_in);
 
 static void snd_wss_debug(struct snd_wss *chip)
 {
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"CS4231 REGS:      INDEX = 0x%02x  "
 		"                 STATUS = 0x%02x\n",
 					wss_inb(chip, CS4231P(REGSEL)),
 					wss_inb(chip, CS4231P(STATUS)));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x00: left input      = 0x%02x  "
 		"  0x10: alt 1 (CFIG 2)  = 0x%02x\n",
 					snd_wss_in(chip, 0x00),
 					snd_wss_in(chip, 0x10));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x01: right input     = 0x%02x  "
 		"  0x11: alt 2 (CFIG 3)  = 0x%02x\n",
 					snd_wss_in(chip, 0x01),
 					snd_wss_in(chip, 0x11));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x02: GF1 left input  = 0x%02x  "
 		"  0x12: left line in    = 0x%02x\n",
 					snd_wss_in(chip, 0x02),
 					snd_wss_in(chip, 0x12));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x03: GF1 right input = 0x%02x  "
 		"  0x13: right line in   = 0x%02x\n",
 					snd_wss_in(chip, 0x03),
 					snd_wss_in(chip, 0x13));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x04: CD left input   = 0x%02x  "
 		"  0x14: timer low       = 0x%02x\n",
 					snd_wss_in(chip, 0x04),
 					snd_wss_in(chip, 0x14));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x05: CD right input  = 0x%02x  "
 		"  0x15: timer high      = 0x%02x\n",
 					snd_wss_in(chip, 0x05),
 					snd_wss_in(chip, 0x15));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x06: left output     = 0x%02x  "
 		"  0x16: left MIC (PnP)  = 0x%02x\n",
 					snd_wss_in(chip, 0x06),
 					snd_wss_in(chip, 0x16));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x07: right output    = 0x%02x  "
 		"  0x17: right MIC (PnP) = 0x%02x\n",
 					snd_wss_in(chip, 0x07),
 					snd_wss_in(chip, 0x17));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x08: playback format = 0x%02x  "
 		"  0x18: IRQ status      = 0x%02x\n",
 					snd_wss_in(chip, 0x08),
 					snd_wss_in(chip, 0x18));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x09: iface (CFIG 1)  = 0x%02x  "
 		"  0x19: left line out   = 0x%02x\n",
 					snd_wss_in(chip, 0x09),
 					snd_wss_in(chip, 0x19));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x0a: pin control     = 0x%02x  "
 		"  0x1a: mono control    = 0x%02x\n",
 					snd_wss_in(chip, 0x0a),
 					snd_wss_in(chip, 0x1a));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x0b: init & status   = 0x%02x  "
 		"  0x1b: right line out  = 0x%02x\n",
 					snd_wss_in(chip, 0x0b),
 					snd_wss_in(chip, 0x1b));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x0c: revision & mode = 0x%02x  "
 		"  0x1c: record format   = 0x%02x\n",
 					snd_wss_in(chip, 0x0c),
 					snd_wss_in(chip, 0x1c));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x0d: loopback        = 0x%02x  "
 		"  0x1d: var freq (PnP)  = 0x%02x\n",
 					snd_wss_in(chip, 0x0d),
 					snd_wss_in(chip, 0x1d));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x0e: ply upr count   = 0x%02x  "
 		"  0x1e: ply lwr count   = 0x%02x\n",
 					snd_wss_in(chip, 0x0e),
 					snd_wss_in(chip, 0x1e));
-	printk(KERN_DEBUG
+	dev_dbg(chip->card->dev,
 		"  0x0f: rec upr count   = 0x%02x  "
 		"  0x1f: rec lwr count   = 0x%02x\n",
 					snd_wss_in(chip, 0x0f),
@@ -365,16 +366,16 @@ void snd_wss_mce_up(struct snd_wss *chip)
 	snd_wss_wait(chip);
 #ifdef CONFIG_SND_DEBUG
 	if (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT)
-		snd_printk(KERN_DEBUG
-			   "mce_up - auto calibration time out (0)\n");
+		dev_dbg(chip->card->dev,
+			"mce_up - auto calibration time out (0)\n");
 #endif
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	chip->mce_bit |= CS4231_MCE;
 	timeout = wss_inb(chip, CS4231P(REGSEL));
 	if (timeout == 0x80)
-		snd_printk(KERN_DEBUG "mce_up [0x%lx]: "
-			   "serious init problem - codec still busy\n",
-			   chip->port);
+		dev_dbg(chip->card->dev,
+			"mce_up [0x%lx]: serious init problem - codec still busy\n",
+			chip->port);
 	if (!(timeout & CS4231_MCE))
 		wss_outb(chip, CS4231P(REGSEL),
 			 chip->mce_bit | (timeout & 0x1f));
@@ -393,9 +394,9 @@ void snd_wss_mce_down(struct snd_wss *chip)
 
 #ifdef CONFIG_SND_DEBUG
 	if (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT)
-		snd_printk(KERN_DEBUG "mce_down [0x%lx] - "
-			   "auto calibration time out (0)\n",
-			   (long)CS4231P(REGSEL));
+		dev_dbg(chip->card->dev,
+			"mce_down [0x%lx] - auto calibration time out (0)\n",
+			(long)CS4231P(REGSEL));
 #endif
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	chip->mce_bit &= ~CS4231_MCE;
@@ -403,9 +404,9 @@ void snd_wss_mce_down(struct snd_wss *chip)
 	wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | (timeout & 0x1f));
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (timeout == 0x80)
-		snd_printk(KERN_DEBUG "mce_down [0x%lx]: "
-			   "serious init problem - codec still busy\n",
-			   chip->port);
+		dev_dbg(chip->card->dev,
+			"mce_down [0x%lx]: serious init problem - codec still busy\n",
+			chip->port);
 	if ((timeout & CS4231_MCE) == 0 || !(chip->hardware & hw_mask))
 		return;
 
@@ -416,7 +417,7 @@ void snd_wss_mce_down(struct snd_wss *chip)
 	 */
 	msleep(1);
 
-	snd_printdd("(1) jiffies = %lu\n", jiffies);
+	dev_dbg(chip->card->dev, "(1) jiffies = %lu\n", jiffies);
 
 	/* check condition up to 250 ms */
 	end_time = jiffies + msecs_to_jiffies(250);
@@ -424,27 +425,29 @@ void snd_wss_mce_down(struct snd_wss *chip)
 		CS4231_CALIB_IN_PROGRESS) {
 
 		if (time_after(jiffies, end_time)) {
-			snd_printk(KERN_ERR "mce_down - "
-					"auto calibration time out (2)\n");
+			dev_err(chip->card->dev,
+				"mce_down - auto calibration time out (2)\n");
 			return;
 		}
 		msleep(1);
 	}
 
-	snd_printdd("(2) jiffies = %lu\n", jiffies);
+	dev_dbg(chip->card->dev, "(2) jiffies = %lu\n", jiffies);
 
 	/* check condition up to 100 ms */
 	end_time = jiffies + msecs_to_jiffies(100);
 	while (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT) {
 		if (time_after(jiffies, end_time)) {
-			snd_printk(KERN_ERR "mce_down - auto calibration time out (3)\n");
+			dev_err(chip->card->dev,
+				"mce_down - auto calibration time out (3)\n");
 			return;
 		}
 		msleep(1);
 	}
 
-	snd_printdd("(3) jiffies = %lu\n", jiffies);
-	snd_printd("mce_down - exit = 0x%x\n", wss_inb(chip, CS4231P(REGSEL)));
+	dev_dbg(chip->card->dev, "(3) jiffies = %lu\n", jiffies);
+	dev_dbg(chip->card->dev, "mce_down - exit = 0x%x\n",
+		wss_inb(chip, CS4231P(REGSEL)));
 }
 EXPORT_SYMBOL(snd_wss_mce_down);
 
@@ -543,7 +546,7 @@ static unsigned char snd_wss_get_format(struct snd_wss *chip,
 	if (channels > 1)
 		rformat |= CS4231_STEREO;
 #if 0
-	snd_printk(KERN_DEBUG "get_format: 0x%x (mode=0x%x)\n", format, mode);
+	dev_dbg(chip->card->dev, "get_format: 0x%x (mode=0x%x)\n", format, mode);
 #endif
 	return rformat;
 }
@@ -793,7 +796,7 @@ static void snd_wss_init(struct snd_wss *chip)
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printk(KERN_DEBUG "init: (1)\n");
+	dev_dbg(chip->card->dev, "init: (1)\n");
 #endif
 	snd_wss_mce_up(chip);
 	spin_lock_irqsave(&chip->reg_lock, flags);
@@ -808,7 +811,7 @@ static void snd_wss_init(struct snd_wss *chip)
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printk(KERN_DEBUG "init: (2)\n");
+	dev_dbg(chip->card->dev, "init: (2)\n");
 #endif
 
 	snd_wss_mce_up(chip);
@@ -821,8 +824,8 @@ static void snd_wss_init(struct snd_wss *chip)
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printk(KERN_DEBUG "init: (3) - afei = 0x%x\n",
-		   chip->image[CS4231_ALT_FEATURE_1]);
+	dev_dbg(chip->card->dev, "init: (3) - afei = 0x%x\n",
+		chip->image[CS4231_ALT_FEATURE_1]);
 #endif
 
 	spin_lock_irqsave(&chip->reg_lock, flags);
@@ -838,7 +841,7 @@ static void snd_wss_init(struct snd_wss *chip)
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printk(KERN_DEBUG "init: (4)\n");
+	dev_dbg(chip->card->dev, "init: (4)\n");
 #endif
 
 	snd_wss_mce_up(chip);
@@ -851,7 +854,7 @@ static void snd_wss_init(struct snd_wss *chip)
 	snd_wss_calibrate_mute(chip, 0);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printk(KERN_DEBUG "init: (5)\n");
+	dev_dbg(chip->card->dev, "init: (5)\n");
 #endif
 }
 
@@ -1256,12 +1259,13 @@ static int snd_wss_probe(struct snd_wss *chip)
 					break;	/* this is valid value */
 			}
 		}
-		snd_printdd("wss: port = 0x%lx, id = 0x%x\n", chip->port, id);
+		dev_dbg(chip->card->dev, "wss: port = 0x%lx, id = 0x%x\n",
+			chip->port, id);
 		if (id != 0x0a)
 			return -ENODEV;	/* no valid device found */
 
 		rev = snd_wss_in(chip, CS4231_VERSION) & 0xe7;
-		snd_printdd("CS4231: VERSION (I25) = 0x%x\n", rev);
+		dev_dbg(chip->card->dev, "CS4231: VERSION (I25) = 0x%x\n", rev);
 		if (rev == 0x80) {
 			unsigned char tmp = snd_wss_in(chip, 23);
 			snd_wss_out(chip, 23, ~tmp);
@@ -1280,8 +1284,8 @@ static int snd_wss_probe(struct snd_wss *chip)
 		} else if (rev == 0x03) {
 			chip->hardware = WSS_HW_CS4236B;
 		} else {
-			snd_printk(KERN_ERR
-				   "unknown CS chip with version 0x%x\n", rev);
+			dev_err(chip->card->dev,
+				"unknown CS chip with version 0x%x\n", rev);
 			return -ENODEV;		/* unknown CS4231 chip? */
 		}
 	}
@@ -1340,7 +1344,9 @@ static int snd_wss_probe(struct snd_wss *chip)
 			snd_cs4236_ext_out(chip, CS4236_VERSION, 0xff);
 			id = snd_cs4236_ext_in(chip, CS4236_VERSION);
 			snd_cs4236_ext_out(chip, CS4236_VERSION, rev);
-			snd_printdd("CS4231: ext version; rev = 0x%x, id = 0x%x\n", rev, id);
+			dev_dbg(chip->card->dev,
+				"CS4231: ext version; rev = 0x%x, id = 0x%x\n",
+				rev, id);
 			if ((id & 0x1f) == 0x1d) {	/* CS4235 */
 				chip->hardware = WSS_HW_CS4235;
 				switch (id >> 5) {
@@ -1349,10 +1355,9 @@ static int snd_wss_probe(struct snd_wss *chip)
 				case 6:
 					break;
 				default:
-					snd_printk(KERN_WARNING
-						"unknown CS4235 chip "
-						"(enhanced version = 0x%x)\n",
-						id);
+					dev_warn(chip->card->dev,
+						 "unknown CS4235 chip (enhanced version = 0x%x)\n",
+						 id);
 				}
 			} else if ((id & 0x1f) == 0x0b) {	/* CS4236/B */
 				switch (id >> 5) {
@@ -1363,10 +1368,9 @@ static int snd_wss_probe(struct snd_wss *chip)
 					chip->hardware = WSS_HW_CS4236B;
 					break;
 				default:
-					snd_printk(KERN_WARNING
-						"unknown CS4236 chip "
-						"(enhanced version = 0x%x)\n",
-						id);
+					dev_warn(chip->card->dev,
+						 "unknown CS4236 chip (enhanced version = 0x%x)\n",
+						 id);
 				}
 			} else if ((id & 0x1f) == 0x08) {	/* CS4237B */
 				chip->hardware = WSS_HW_CS4237B;
@@ -1377,10 +1381,9 @@ static int snd_wss_probe(struct snd_wss *chip)
 				case 7:
 					break;
 				default:
-					snd_printk(KERN_WARNING
-						"unknown CS4237B chip "
-						"(enhanced version = 0x%x)\n",
-						id);
+					dev_warn(chip->card->dev,
+						 "unknown CS4237B chip (enhanced version = 0x%x)\n",
+						 id);
 				}
 			} else if ((id & 0x1f) == 0x09) {	/* CS4238B */
 				chip->hardware = WSS_HW_CS4238B;
@@ -1390,10 +1393,9 @@ static int snd_wss_probe(struct snd_wss *chip)
 				case 7:
 					break;
 				default:
-					snd_printk(KERN_WARNING
-						"unknown CS4238B chip "
-						"(enhanced version = 0x%x)\n",
-						id);
+					dev_warn(chip->card->dev,
+						 "unknown CS4238B chip (enhanced version = 0x%x)\n",
+						 id);
 				}
 			} else if ((id & 0x1f) == 0x1e) {	/* CS4239 */
 				chip->hardware = WSS_HW_CS4239;
@@ -1403,15 +1405,14 @@ static int snd_wss_probe(struct snd_wss *chip)
 				case 6:
 					break;
 				default:
-					snd_printk(KERN_WARNING
-						"unknown CS4239 chip "
-						"(enhanced version = 0x%x)\n",
-						id);
+					dev_warn(chip->card->dev,
+						 "unknown CS4239 chip (enhanced version = 0x%x)\n",
+						 id);
 				}
 			} else {
-				snd_printk(KERN_WARNING
-					   "unknown CS4236/CS423xB chip "
-					   "(enhanced version = 0x%x)\n", id);
+				dev_warn(chip->card->dev,
+					 "unknown CS4236/CS423xB chip (enhanced version = 0x%x)\n",
+					 id);
 			}
 		}
 	}
@@ -1644,8 +1645,9 @@ static void snd_wss_resume(struct snd_wss *chip)
 	wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | (timeout & 0x1f));
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (timeout == 0x80)
-		snd_printk(KERN_ERR "down [0x%lx]: serious init problem "
-			   "- codec still busy\n", chip->port);
+		dev_err(chip->card->dev
+			"down [0x%lx]: serious init problem - codec still busy\n",
+			chip->port);
 	if ((timeout & CS4231_MCE) == 0 ||
 	    !(chip->hardware & (WSS_HW_CS4231_MASK | WSS_HW_CS4232_MASK))) {
 		return;
@@ -1757,7 +1759,7 @@ int snd_wss_create(struct snd_card *card,
 
 	chip->res_port = devm_request_region(card->dev, port, 4, "WSS");
 	if (!chip->res_port) {
-		snd_printk(KERN_ERR "wss: can't grab port 0x%lx\n", port);
+		dev_err(chip->card->dev, "wss: can't grab port 0x%lx\n", port);
 		return -EBUSY;
 	}
 	chip->port = port;
@@ -1765,7 +1767,7 @@ int snd_wss_create(struct snd_card *card,
 		chip->res_cport = devm_request_region(card->dev, cport, 8,
 						      "CS4232 Control");
 		if (!chip->res_cport) {
-			snd_printk(KERN_ERR
+			dev_err(chip->card->dev,
 				"wss: can't grab control port 0x%lx\n", cport);
 			return -ENODEV;
 		}
@@ -1774,20 +1776,20 @@ int snd_wss_create(struct snd_card *card,
 	if (!(hwshare & WSS_HWSHARE_IRQ))
 		if (devm_request_irq(card->dev, irq, snd_wss_interrupt, 0,
 				     "WSS", (void *) chip)) {
-			snd_printk(KERN_ERR "wss: can't grab IRQ %d\n", irq);
+			dev_err(chip->card->dev, "wss: can't grab IRQ %d\n", irq);
 			return -EBUSY;
 		}
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
 	if (!(hwshare & WSS_HWSHARE_DMA1) &&
 	    snd_devm_request_dma(card->dev, dma1, "WSS - 1")) {
-		snd_printk(KERN_ERR "wss: can't grab DMA1 %d\n", dma1);
+		dev_err(chip->card->dev, "wss: can't grab DMA1 %d\n", dma1);
 		return -EBUSY;
 	}
 	chip->dma1 = dma1;
 	if (!(hwshare & WSS_HWSHARE_DMA2) && dma1 != dma2 && dma2 >= 0 &&
 	    snd_devm_request_dma(card->dev, dma2, "WSS - 2")) {
-		snd_printk(KERN_ERR "wss: can't grab DMA2 %d\n", dma2);
+		dev_err(chip->card->dev, "wss: can't grab DMA2 %d\n", dma2);
 		return -EBUSY;
 	}
 	if (dma1 == dma2 || dma2 < 0) {
@@ -1810,8 +1812,8 @@ int snd_wss_create(struct snd_card *card,
 #if 0
 	if (chip->hardware & WSS_HW_CS4232_MASK) {
 		if (chip->res_cport == NULL)
-			snd_printk(KERN_ERR "CS4232 control port features are "
-				   "not accessible\n");
+			dev_err(chip->card->dev,
+				"CS4232 control port features are not accessible\n");
 	}
 #endif
 
-- 
2.43.0

