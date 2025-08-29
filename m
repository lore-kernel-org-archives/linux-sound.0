Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431E3277B1
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478728; cv=none; b=g5VBpJYaC4acJpEtRvLJZBkUF1IbPE+N3b3re60vY21DKqQfeES9Icc9/OyxyxvulPocpwdkEvkG67IYPkweGGuv/sYK1NrfddlPgqTkh6LlQqntILwNX/8PfCDSIUnQeAtH4+7/YscSFZA70U9g6f+1uiYo6ObOhQ00jyXhVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478728; c=relaxed/simple;
	bh=uNLU8S2SxOlP0jxBY41krVo50qzXNdKZRQAZhDwqfIY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdyeih91FkomlFj7cqTf4PRpCaysl/IWRyKOXZc4ZKpQAGfcs9aMTO6/iGgiuWxuy6ocw9ua4M8ZQLisodYQVDt5j6PO+5ymiDFjZucAZl+Ix4VJcF3X6gmi1lVK7Oc9z27ZPUktaX8/Yc3+eUXgEkYKdHaIsaEpRAiOvJH7Wao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ch5MsAp1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VBohf6Bi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ch5MsAp1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VBohf6Bi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ch5MsAp1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VBohf6Bi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ch5MsAp1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VBohf6Bi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 953C033ECE;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8CF5pP257eO+u35h8mT8ZVrbGyTOgvZ6keXempQ8So=;
	b=Ch5MsAp1bN2gEgU0dSJoMqPhIAQOb+hOtBLpa0/Zzk/vY30A8DHtviMoK5jjFpACn27gns
	KksGG8RemDrQ9EMeFP3swgfLaOMa6TD3QSRF+Euxy2JBOgtNNUvhZGojNS3zZCUjaqQgZ5
	SVS11R2KbOSno6AVJl4Yw+pioawFSro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8CF5pP257eO+u35h8mT8ZVrbGyTOgvZ6keXempQ8So=;
	b=VBohf6BiEKUx4pQ/oZTQXxzQRrtxKd1VOy9Nsfw0zpm6O9Zy10aDjctsA9xmBIHOJF2W4s
	QHsexIPWbHpAtRAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ch5MsAp1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VBohf6Bi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8CF5pP257eO+u35h8mT8ZVrbGyTOgvZ6keXempQ8So=;
	b=Ch5MsAp1bN2gEgU0dSJoMqPhIAQOb+hOtBLpa0/Zzk/vY30A8DHtviMoK5jjFpACn27gns
	KksGG8RemDrQ9EMeFP3swgfLaOMa6TD3QSRF+Euxy2JBOgtNNUvhZGojNS3zZCUjaqQgZ5
	SVS11R2KbOSno6AVJl4Yw+pioawFSro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8CF5pP257eO+u35h8mT8ZVrbGyTOgvZ6keXempQ8So=;
	b=VBohf6BiEKUx4pQ/oZTQXxzQRrtxKd1VOy9Nsfw0zpm6O9Zy10aDjctsA9xmBIHOJF2W4s
	QHsexIPWbHpAtRAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CDBB13A54;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aDZOHbC8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 30/61] ALSA: es1938: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:05 +0200
Message-ID: <20250829144342.4290-31-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 953C033ECE
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
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 0ce7076206f9..280125eff362 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -237,11 +237,9 @@ MODULE_DEVICE_TABLE(pci, snd_es1938_ids);
  * -----------------------------------------------------------------*/
 static void snd_es1938_mixer_write(struct es1938 *chip, unsigned char reg, unsigned char val)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&chip->mixer_lock, flags);
+	guard(spinlock_irqsave)(&chip->mixer_lock);
 	outb(reg, SLSB_REG(chip, MIXERADDR));
 	outb(val, SLSB_REG(chip, MIXERDATA));
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
 	dev_dbg(chip->card->dev, "Mixer reg %02x set to %02x\n", reg, val);
 }
 
@@ -251,11 +249,10 @@ static void snd_es1938_mixer_write(struct es1938 *chip, unsigned char reg, unsig
 static int snd_es1938_mixer_read(struct es1938 *chip, unsigned char reg)
 {
 	int data;
-	unsigned long flags;
-	spin_lock_irqsave(&chip->mixer_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->mixer_lock);
 	outb(reg, SLSB_REG(chip, MIXERADDR));
 	data = inb(SLSB_REG(chip, MIXERDATA));
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
 	dev_dbg(chip->card->dev, "Mixer reg %02x now is %02x\n", reg, data);
 	return data;
 }
@@ -266,9 +263,9 @@ static int snd_es1938_mixer_read(struct es1938 *chip, unsigned char reg)
 static int snd_es1938_mixer_bits(struct es1938 *chip, unsigned char reg,
 				 unsigned char mask, unsigned char val)
 {
-	unsigned long flags;
 	unsigned char old, new, oval;
-	spin_lock_irqsave(&chip->mixer_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->mixer_lock);
 	outb(reg, SLSB_REG(chip, MIXERADDR));
 	old = inb(SLSB_REG(chip, MIXERDATA));
 	oval = old & mask;
@@ -279,7 +276,6 @@ static int snd_es1938_mixer_bits(struct es1938 *chip, unsigned char reg,
 			"Mixer reg %02x was %02x, set to %02x\n",
 			   reg, old, new);
 	}
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
 	return oval;
 }
 
@@ -322,11 +318,9 @@ static int snd_es1938_get_byte(struct es1938 *chip)
  * -----------------------------------------------------------------*/
 static void snd_es1938_write(struct es1938 *chip, unsigned char reg, unsigned char val)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_es1938_write_cmd(chip, reg);
 	snd_es1938_write_cmd(chip, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	dev_dbg(chip->card->dev, "Reg %02x set to %02x\n", reg, val);
 }
 
@@ -336,12 +330,11 @@ static void snd_es1938_write(struct es1938 *chip, unsigned char reg, unsigned ch
 static unsigned char snd_es1938_read(struct es1938 *chip, unsigned char reg)
 {
 	unsigned char val;
-	unsigned long flags;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_es1938_write_cmd(chip, ESS_CMD_READREG);
 	snd_es1938_write_cmd(chip, reg);
 	val = snd_es1938_get_byte(chip);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	dev_dbg(chip->card->dev, "Reg %02x now is %02x\n", reg, val);
 	return val;
 }
@@ -352,9 +345,9 @@ static unsigned char snd_es1938_read(struct es1938 *chip, unsigned char reg)
 static int snd_es1938_bits(struct es1938 *chip, unsigned char reg, unsigned char mask,
 			   unsigned char val)
 {
-	unsigned long flags;
 	unsigned char old, new, oval;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_es1938_write_cmd(chip, ESS_CMD_READREG);
 	snd_es1938_write_cmd(chip, reg);
 	old = snd_es1938_get_byte(chip);
@@ -366,7 +359,6 @@ static int snd_es1938_bits(struct es1938 *chip, unsigned char reg, unsigned char
 		dev_dbg(chip->card->dev, "Reg %02x was %02x, set to %02x\n",
 			   reg, old, new);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return oval;
 }
 
-- 
2.50.1

