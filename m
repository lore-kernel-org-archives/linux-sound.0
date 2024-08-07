Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D521EA0B5
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=E32+g7epnHYWFe0SpAbtpi1lbrSMmZ6crtCT0wIBJIebxwbcY6cOaEvxyFeV0c5iMRvUqwZUt3V3wSGjlClilNclZViCPw40nTYBozhOtbOvhgQWbcT4V/SpTKS1HrrO87sa/b/PGu/tnW4/RHPLlglID1T/o2ceKlEeMTqMHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=aShfoQo6fbUfT/knjxjhPrI5hh077TMMRBKcpxYdhNI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tj0zPQT5wq2bsVZfftCxSG/EOJhywGRe1Tcik94vQsbKaHP31OsiBY6yXFasRFW3pmp0w/DdlIcAW0l2vUwGGCXr6QFPG5tDb0sNZY0CzDU+SYPoDqegQOQ7g5mvOoRGRn4iLHmabDUZ+LAg1FOJILmNfEebuQwxg88LVJkq9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AEUsVWYZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CCZBRS6R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AEUsVWYZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CCZBRS6R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AEUsVWYZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CCZBRS6R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AEUsVWYZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CCZBRS6R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBE5E21D1D;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6LkHsmUxgHQZBNmJ7bczhnuJvfRZqCc5RK7fPLvFys=;
	b=AEUsVWYZROShqCsgyFHjJLJhnY/b+swIoSGkYfjxR2FMCHaiw1G12UQdPiNVJhVh/31beT
	l8UeDFFsql77E75wYtNTUM9Lx5y2wpCqfKZVgxcS+7ArVM1iNvf8coXQkRc0On2vCGdiwX
	2MwWL06NQrAodIxL87Nij61+6nUkfXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6LkHsmUxgHQZBNmJ7bczhnuJvfRZqCc5RK7fPLvFys=;
	b=CCZBRS6RZPBFdV8bBfeFzU12Sh3M7iWq7y+waUeP01osQzdXw0Qw+1lFOg+9HAOPhh9hzD
	KBGqMzFib6VoiaCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AEUsVWYZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CCZBRS6R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6LkHsmUxgHQZBNmJ7bczhnuJvfRZqCc5RK7fPLvFys=;
	b=AEUsVWYZROShqCsgyFHjJLJhnY/b+swIoSGkYfjxR2FMCHaiw1G12UQdPiNVJhVh/31beT
	l8UeDFFsql77E75wYtNTUM9Lx5y2wpCqfKZVgxcS+7ArVM1iNvf8coXQkRc0On2vCGdiwX
	2MwWL06NQrAodIxL87Nij61+6nUkfXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6LkHsmUxgHQZBNmJ7bczhnuJvfRZqCc5RK7fPLvFys=;
	b=CCZBRS6RZPBFdV8bBfeFzU12Sh3M7iWq7y+waUeP01osQzdXw0Qw+1lFOg+9HAOPhh9hzD
	KBGqMzFib6VoiaCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4B4813A7D;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cFIbJ9p3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 15/54] ALSA: i2c: cs8427: Use standard print API
Date: Wed,  7 Aug 2024 15:34:05 +0200
Message-ID: <20240807133452.9424-16-tiwai@suse.de>
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
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BBE5E21D1D
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/i2c/cs8427.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/sound/i2c/cs8427.c b/sound/i2c/cs8427.c
index f58b14b49045..29a1a7a0d050 100644
--- a/sound/i2c/cs8427.c
+++ b/sound/i2c/cs8427.c
@@ -52,8 +52,9 @@ int snd_cs8427_reg_write(struct snd_i2c_device *device, unsigned char reg,
 	buf[1] = val;
 	err = snd_i2c_sendbytes(device, buf, 2);
 	if (err != 2) {
-		snd_printk(KERN_ERR "unable to send bytes 0x%02x:0x%02x "
-			   "to CS8427 (%i)\n", buf[0], buf[1], err);
+		dev_err(device->bus->card->dev,
+			"unable to send bytes 0x%02x:0x%02x to CS8427 (%i)\n",
+			buf[0], buf[1], err);
 		return err < 0 ? err : -EIO;
 	}
 	return 0;
@@ -68,14 +69,14 @@ static int snd_cs8427_reg_read(struct snd_i2c_device *device, unsigned char reg)
 
 	err = snd_i2c_sendbytes(device, &reg, 1);
 	if (err != 1) {
-		snd_printk(KERN_ERR "unable to send register 0x%x byte "
-			   "to CS8427\n", reg);
+		dev_err(device->bus->card->dev,
+			"unable to send register 0x%x byte to CS8427\n", reg);
 		return err < 0 ? err : -EIO;
 	}
 	err = snd_i2c_readbytes(device, &buf, 1);
 	if (err != 1) {
-		snd_printk(KERN_ERR "unable to read register 0x%x byte "
-			   "from CS8427\n", reg);
+		dev_err(device->bus->card->dev,
+			"unable to read register 0x%x byte from CS8427\n", reg);
 		return err < 0 ? err : -EIO;
 	}
 	return buf;
@@ -195,16 +196,18 @@ int snd_cs8427_init(struct snd_i2c_bus *bus,
 	err = snd_cs8427_reg_read(device, CS8427_REG_ID_AND_VER);
 	if (err != CS8427_VER8427A) {
 		/* give second chance */
-		snd_printk(KERN_WARNING "invalid CS8427 signature 0x%x: "
-			   "let me try again...\n", err);
+		dev_warn(device->bus->card->dev,
+			 "invalid CS8427 signature 0x%x: let me try again...\n",
+			 err);
 		err = snd_cs8427_reg_read(device, CS8427_REG_ID_AND_VER);
 	}
 	if (err != CS8427_VER8427A) {
 		snd_i2c_unlock(bus);
-		snd_printk(KERN_ERR "unable to find CS8427 signature "
-			   "(expected 0x%x, read 0x%x),\n",
-			   CS8427_VER8427A, err);
-		snd_printk(KERN_ERR "   initialization is not completed\n");
+		dev_err(device->bus->card->dev,
+			"unable to find CS8427 signature (expected 0x%x, read 0x%x),\n",
+			CS8427_VER8427A, err);
+		dev_err(device->bus->card->dev,
+			"   initialization is not completed\n");
 		return -EFAULT;
 	}
 	/* turn off run bit while making changes to configuration */
@@ -289,7 +292,7 @@ int snd_cs8427_create(struct snd_i2c_bus *bus,
 	snd_i2c_sendbytes(device, buf, 1);
 	snd_i2c_readbytes(device, buf, 127);
 	for (xx = 0; xx < 127; xx++)
-		printk(KERN_DEBUG "reg[0x%x] = 0x%x\n", xx+1, buf[xx]);
+		dev_dbg(device->bus->card->dev, "reg[0x%x] = 0x%x\n", xx+1, buf[xx]);
 	}
 #endif
 	
@@ -392,15 +395,15 @@ static int snd_cs8427_qsubcode_get(struct snd_kcontrol *kcontrol,
 	snd_i2c_lock(device->bus);
 	err = snd_i2c_sendbytes(device, &reg, 1);
 	if (err != 1) {
-		snd_printk(KERN_ERR "unable to send register 0x%x byte "
-			   "to CS8427\n", reg);
+		dev_err(device->bus->card->dev,
+			"unable to send register 0x%x byte to CS8427\n", reg);
 		snd_i2c_unlock(device->bus);
 		return err < 0 ? err : -EIO;
 	}
 	err = snd_i2c_readbytes(device, ucontrol->value.bytes.data, 10);
 	if (err != 10) {
-		snd_printk(KERN_ERR "unable to read Q-subcode bytes "
-			   "from CS8427\n");
+		dev_err(device->bus->card->dev,
+			"unable to read Q-subcode bytes from CS8427\n");
 		snd_i2c_unlock(device->bus);
 		return err < 0 ? err : -EIO;
 	}
-- 
2.43.0

