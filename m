Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCB200132
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=r83fn/B5wqvItng7BhKtt+UDdQatRsddSwnrfMup54fMlBkxy3O8kuDRCrU8POLi7rCKDbBW7grjqfWpsxMcsQGOpFRs59znaHfQlygqUOAa693AGMWgNO+l6wl17/62zpRIuxnswwwLoskVJUThCLG5d3RBHQUOy4Knrqo1AoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=dfRFM8Jbwmun2I0mdsjlzOkNImwyM+IpwApV2N4V3tE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nh3sRzl+zub9fJj3n57gug70AEQdo/rQVn480j+mYqSSBmvS9za9FOzOfEbbQNCyomHJVblWEXzP+jD79Pc5PYK3pEKxO8F2y+FjErrwXItaS3+1V7CwrAVzetYRUQ9zE4mH40i+8GMPO8YqskxPGsCrDJxNbE0QrGVAQRixghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p6xSkg/F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xS54cdvE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p6xSkg/F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xS54cdvE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p6xSkg/F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xS54cdvE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p6xSkg/F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xS54cdvE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A115D1FB99;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dx0ECA2Lr235K6v6k2fwEkgnBpGQdBPsAKhTpR421I=;
	b=p6xSkg/FnsJNE30jvDeDtp/wjlscodZoZoTl3I8L08QENYdxsUjInn/83xRDlFWAjpMdo/
	EUxtQGv+WMuCymfrMixgq0h51Qx/Jfw4RBnSZSH9FDLntp0TsRcssqhuiP8o5YFi27OtXW
	pxv1Ayz7ia9qAINytVd0y5d6Cs/v+pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dx0ECA2Lr235K6v6k2fwEkgnBpGQdBPsAKhTpR421I=;
	b=xS54cdvEzimijB2VG3YurIySdWCCUG6QqT+fQW6dk8xXd4Mu9UPVbGiQxEjdQ1nFqtTmov
	6Pz1dyJ5aF2O71AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="p6xSkg/F";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xS54cdvE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dx0ECA2Lr235K6v6k2fwEkgnBpGQdBPsAKhTpR421I=;
	b=p6xSkg/FnsJNE30jvDeDtp/wjlscodZoZoTl3I8L08QENYdxsUjInn/83xRDlFWAjpMdo/
	EUxtQGv+WMuCymfrMixgq0h51Qx/Jfw4RBnSZSH9FDLntp0TsRcssqhuiP8o5YFi27OtXW
	pxv1Ayz7ia9qAINytVd0y5d6Cs/v+pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dx0ECA2Lr235K6v6k2fwEkgnBpGQdBPsAKhTpR421I=;
	b=xS54cdvEzimijB2VG3YurIySdWCCUG6QqT+fQW6dk8xXd4Mu9UPVbGiQxEjdQ1nFqtTmov
	6Pz1dyJ5aF2O71AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84D2513A7D;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YBlOH9x3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 29/54] ALSA: opti9xx: Use standard print API
Date: Wed,  7 Aug 2024 15:34:19 +0200
Message-ID: <20240807133452.9424-30-tiwai@suse.de>
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
X-Rspamd-Queue-Id: A115D1FB99
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

The card pointer is stored in struct snd_opti9xx and snd_miro to be
referred for dev_*() calls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/aci.h                |   1 +
 sound/isa/opti9xx/miro.c           | 163 +++++++++++++++--------------
 sound/isa/opti9xx/opti92x-ad1848.c |  62 +++++------
 3 files changed, 119 insertions(+), 107 deletions(-)

diff --git a/include/sound/aci.h b/include/sound/aci.h
index 6ebbd4223f12..36a761c9820d 100644
--- a/include/sound/aci.h
+++ b/include/sound/aci.h
@@ -72,6 +72,7 @@
 #define ACI_SET_EQ7		0x46	/* ... to Treble */
 
 struct snd_miro_aci {
+	struct snd_card *card;
 	unsigned long aci_port;
 	int aci_vendor;
 	int aci_product;
diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index 59792f2fada1..31d736d1dd10 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -111,6 +111,7 @@ struct snd_miro {
 	long mpu_port;
 	int mpu_irq;
 
+	struct snd_card *card;
 	struct snd_miro_aci *aci;
 };
 
@@ -151,8 +152,9 @@ static int aci_busy_wait(struct snd_miro_aci *aci)
 		byte = inb(aci->aci_port + ACI_REG_BUSY);
 		if ((byte & 1) == 0) {
 			if (timeout >= ACI_MINTIME)
-				snd_printd("aci ready in round %ld.\n",
-					   timeout-ACI_MINTIME);
+				dev_dbg(aci->card->dev,
+					"aci ready in round %ld.\n",
+					timeout-ACI_MINTIME);
 			return byte;
 		}
 		if (timeout >= ACI_MINTIME) {
@@ -174,7 +176,7 @@ static int aci_busy_wait(struct snd_miro_aci *aci)
 			}
 		}
 	}
-	snd_printk(KERN_ERR "aci_busy_wait() time out\n");
+	dev_err(aci->card->dev, "%s() time out\n", __func__);
 	return -EBUSY;
 }
 
@@ -184,7 +186,7 @@ static inline int aci_write(struct snd_miro_aci *aci, unsigned char byte)
 		outb(byte, aci->aci_port + ACI_REG_COMMAND);
 		return 0;
 	} else {
-		snd_printk(KERN_ERR "aci busy, aci_write(0x%x) stopped.\n", byte);
+		dev_err(aci->card->dev, "aci busy, %s(0x%x) stopped.\n", __func__, byte);
 		return -EBUSY;
 	}
 }
@@ -197,7 +199,7 @@ static inline int aci_read(struct snd_miro_aci *aci)
 		byte = inb(aci->aci_port + ACI_REG_STATUS);
 		return byte;
 	} else {
-		snd_printk(KERN_ERR "aci busy, aci_read() stopped.\n");
+		dev_err(aci->card->dev, "aci busy, %s() stopped.\n", __func__);
 		return -EBUSY;
 	}
 }
@@ -260,8 +262,8 @@ static int snd_miro_get_capture(struct snd_kcontrol *kcontrol,
 
 	value = aci_getvalue(miro->aci, ACI_S_GENERAL);
 	if (value < 0) {
-		snd_printk(KERN_ERR "snd_miro_get_capture() failed: %d\n",
-			   value);
+		dev_err(miro->card->dev, "%s() failed: %d\n", __func__,
+			value);
 		return value;
 	}
 
@@ -280,8 +282,8 @@ static int snd_miro_put_capture(struct snd_kcontrol *kcontrol,
 
 	error = aci_setvalue(miro->aci, ACI_SET_SOLOMODE, value);
 	if (error < 0) {
-		snd_printk(KERN_ERR "snd_miro_put_capture() failed: %d\n",
-			   error);
+		dev_err(miro->card->dev, "%s() failed: %d\n", __func__,
+			error);
 		return error;
 	}
 
@@ -322,8 +324,8 @@ static int snd_miro_get_preamp(struct snd_kcontrol *kcontrol,
 
 	value = aci_getvalue(miro->aci, ACI_GET_PREAMP);
 	if (value < 0) {
-		snd_printk(KERN_ERR "snd_miro_get_preamp() failed: %d\n",
-			   value);
+		dev_err(miro->card->dev, "%s() failed: %d\n", __func__,
+			value);
 		return value;
 	}
 	
@@ -342,8 +344,8 @@ static int snd_miro_put_preamp(struct snd_kcontrol *kcontrol,
 
 	error = aci_setvalue(miro->aci, ACI_SET_PREAMP, value);
 	if (error < 0) {
-		snd_printk(KERN_ERR "snd_miro_put_preamp() failed: %d\n",
-			   error);
+		dev_err(miro->card->dev, "%s() failed: %d\n", __func__,
+			error);
 		return error;
 	}
 
@@ -374,7 +376,8 @@ static int snd_miro_put_amp(struct snd_kcontrol *kcontrol,
 
 	error = aci_setvalue(miro->aci, ACI_SET_POWERAMP, value);
 	if (error < 0) {
-		snd_printk(KERN_ERR "snd_miro_put_amp() to %d failed: %d\n", value, error);
+		dev_err(miro->card->dev, "%s() to %d failed: %d\n", __func__,
+			value, error);
 		return error;
 	}
 
@@ -430,13 +433,15 @@ static int snd_miro_get_double(struct snd_kcontrol *kcontrol,
 
 	right_val = aci_getvalue(miro->aci, right_reg);
 	if (right_val < 0) {
-		snd_printk(KERN_ERR "aci_getvalue(%d) failed: %d\n", right_reg, right_val);
+		dev_err(miro->card->dev, "aci_getvalue(%d) failed: %d\n",
+			right_reg, right_val);
 		return right_val;
 	}
 
 	left_val = aci_getvalue(miro->aci, left_reg);
 	if (left_val < 0) {
-		snd_printk(KERN_ERR "aci_getvalue(%d) failed: %d\n", left_reg, left_val);
+		dev_err(miro->card->dev, "aci_getvalue(%d) failed: %d\n",
+			left_reg, left_val);
 		return left_val;
 	}
 
@@ -489,13 +494,15 @@ static int snd_miro_put_double(struct snd_kcontrol *kcontrol,
 
 	left_old = aci_getvalue(aci, getreg_left);
 	if (left_old < 0) {
-		snd_printk(KERN_ERR "aci_getvalue(%d) failed: %d\n", getreg_left, left_old);
+		dev_err(miro->card->dev, "aci_getvalue(%d) failed: %d\n",
+			getreg_left, left_old);
 		return left_old;
 	}
 
 	right_old = aci_getvalue(aci, getreg_right);
 	if (right_old < 0) {
-		snd_printk(KERN_ERR "aci_getvalue(%d) failed: %d\n", getreg_right, right_old);
+		dev_err(miro->card->dev, "aci_getvalue(%d) failed: %d\n",
+			getreg_right, right_old);
 		return right_old;
 	}
 
@@ -515,15 +522,15 @@ static int snd_miro_put_double(struct snd_kcontrol *kcontrol,
 		if (left >= 0) {
 			error = aci_setvalue(aci, setreg_left, left);
 			if (error < 0) {
-				snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n",
-					   left, error);
+				dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+					left, error);
 				return error;
 			}
 		} else {
 			error = aci_setvalue(aci, setreg_left, 0x80 - left);
 			if (error < 0) {
-				snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n",
-					   0x80 - left, error);
+				dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+					0x80 - left, error);
 				return error;
 			}
 		}
@@ -531,15 +538,15 @@ static int snd_miro_put_double(struct snd_kcontrol *kcontrol,
 		if (right >= 0) {
 			error = aci_setvalue(aci, setreg_right, right);
 			if (error < 0) {
-				snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n",
-					   right, error);
+				dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+					right, error);
 				return error;
 			}
 		} else {
 			error = aci_setvalue(aci, setreg_right, 0x80 - right);
 			if (error < 0) {
-				snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n",
-					   0x80 - right, error);
+				dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+					0x80 - right, error);
 				return error;
 			}
 		}
@@ -557,14 +564,14 @@ static int snd_miro_put_double(struct snd_kcontrol *kcontrol,
 
 		error = aci_setvalue(aci, setreg_left, 0x20 - left);
 		if (error < 0) {
-			snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n",
-				   0x20 - left, error);
+			dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+				0x20 - left, error);
 			return error;
 		}
 		error = aci_setvalue(aci, setreg_right, 0x20 - right);
 		if (error < 0) {
-			snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n",
-				   0x20 - right, error);
+			dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+				0x20 - right, error);
 			return error;
 		}
 	}
@@ -667,7 +674,7 @@ static int snd_set_aci_init_values(struct snd_miro *miro)
 	if ((aci->aci_product == 'A') && wss) {
 		error = aci_setvalue(aci, ACI_SET_WSS, wss);
 		if (error < 0) {
-			snd_printk(KERN_ERR "enabling WSS mode failed\n");
+			dev_err(miro->card->dev, "enabling WSS mode failed\n");
 			return error;
 		}
 	}
@@ -677,7 +684,7 @@ static int snd_set_aci_init_values(struct snd_miro *miro)
 	if (ide) {
 		error = aci_setvalue(aci, ACI_SET_IDE, ide);
 		if (error < 0) {
-			snd_printk(KERN_ERR "enabling IDE port failed\n");
+			dev_err(miro->card->dev, "enabling IDE port failed\n");
 			return error;
 		}
 	}
@@ -688,8 +695,8 @@ static int snd_set_aci_init_values(struct snd_miro *miro)
 		error = aci_setvalue(aci, aci_init_values[idx][0],
 				     aci_init_values[idx][1]);
 		if (error < 0) {
-			snd_printk(KERN_ERR "aci_setvalue(%d) failed: %d\n", 
-				   aci_init_values[idx][0], error);
+			dev_err(miro->card->dev, "aci_setvalue(%d) failed: %d\n",
+				aci_init_values[idx][0], error);
                         return error;
                 }
 	}
@@ -805,7 +812,7 @@ static int snd_miro_init(struct snd_miro *chip,
 		break;
 
 	default:
-		snd_printk(KERN_ERR "sorry, no support for %d\n", hardware);
+		dev_err(chip->card->dev, "sorry, no support for %d\n", hardware);
 		return -ENODEV;
 	}
 
@@ -836,7 +843,7 @@ static unsigned char snd_miro_read(struct snd_miro *chip,
 		break;
 
 	default:
-		snd_printk(KERN_ERR "sorry, no support for %d\n", chip->hardware);
+		dev_err(chip->card->dev, "sorry, no support for %d\n", chip->hardware);
 	}
 
 	spin_unlock_irqrestore(&chip->lock, flags);
@@ -866,7 +873,7 @@ static void snd_miro_write(struct snd_miro *chip, unsigned char reg,
 		break;
 
 	default:
-		snd_printk(KERN_ERR "sorry, no support for %d\n", chip->hardware);
+		dev_err(chip->card->dev, "sorry, no support for %d\n", chip->hardware);
 	}
 
 	spin_unlock_irqrestore(&chip->lock, flags);
@@ -1022,7 +1029,7 @@ static int snd_miro_configure(struct snd_miro *chip)
 		snd_miro_write_mask(chip, OPTi9XX_MC_REG(4), 0x00, 0x0c);
 		break;
 	default:
-		snd_printk(KERN_ERR "chip %d not supported\n", chip->hardware);
+		dev_err(chip->card->dev, "chip %d not supported\n", chip->hardware);
 		return -EINVAL;
 	}
 
@@ -1045,7 +1052,7 @@ static int snd_miro_configure(struct snd_miro *chip)
 		wss_base_bits = 0x02;
 		break;
 	default:
-		snd_printk(KERN_ERR "WSS port 0x%lx not valid\n", chip->wss_base);
+		dev_err(chip->card->dev, "WSS port 0x%lx not valid\n", chip->wss_base);
 		goto __skip_base;
 	}
 	snd_miro_write_mask(chip, OPTi9XX_MC_REG(1), wss_base_bits << 4, 0x30);
@@ -1068,7 +1075,7 @@ static int snd_miro_configure(struct snd_miro *chip)
 		irq_bits = 0x04;
 		break;
 	default:
-		snd_printk(KERN_ERR "WSS irq # %d not valid\n", chip->irq);
+		dev_err(chip->card->dev, "WSS irq # %d not valid\n", chip->irq);
 		goto __skip_resources;
 	}
 
@@ -1083,12 +1090,12 @@ static int snd_miro_configure(struct snd_miro *chip)
 		dma_bits = 0x03;
 		break;
 	default:
-		snd_printk(KERN_ERR "WSS dma1 # %d not valid\n", chip->dma1);
+		dev_err(chip->card->dev, "WSS dma1 # %d not valid\n", chip->dma1);
 		goto __skip_resources;
 	}
 
 	if (chip->dma1 == chip->dma2) {
-		snd_printk(KERN_ERR "don't want to share dmas\n");
+		dev_err(chip->card->dev, "don't want to share dmas\n");
 		return -EBUSY;
 	}
 
@@ -1097,7 +1104,7 @@ static int snd_miro_configure(struct snd_miro *chip)
 	case 1:
 		break;
 	default:
-		snd_printk(KERN_ERR "WSS dma2 # %d not valid\n", chip->dma2);
+		dev_err(chip->card->dev, "WSS dma2 # %d not valid\n", chip->dma2);
 		goto __skip_resources;
 	}
 	dma_bits |= 0x04;
@@ -1125,8 +1132,8 @@ static int snd_miro_configure(struct snd_miro *chip)
 			mpu_port_bits = 0x00;
 			break;
 		default:
-			snd_printk(KERN_ERR "MPU-401 port 0x%lx not valid\n",
-				   chip->mpu_port);
+			dev_err(chip->card->dev, "MPU-401 port 0x%lx not valid\n",
+				chip->mpu_port);
 			goto __skip_mpu;
 		}
 
@@ -1144,8 +1151,8 @@ static int snd_miro_configure(struct snd_miro *chip)
 			mpu_irq_bits = 0x01;
 			break;
 		default:
-			snd_printk(KERN_ERR "MPU-401 irq # %d not valid\n",
-				   chip->mpu_irq);
+			dev_err(chip->card->dev, "MPU-401 irq # %d not valid\n",
+				chip->mpu_irq);
 			goto __skip_mpu;
 		}
 
@@ -1208,6 +1215,7 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 
 	miro->aci = aci;
 
+	aci->card = card;
 	mutex_init(&aci->aci_mutex);
 
 	/* get ACI port from OPTi9xx MC 4 */
@@ -1218,37 +1226,37 @@ static int snd_card_miro_aci_detect(struct snd_card *card,
 	miro->res_aci_port =
 		devm_request_region(card->dev, aci->aci_port, 3, "miro aci");
 	if (miro->res_aci_port == NULL) {
-		snd_printk(KERN_ERR "aci i/o area 0x%lx-0x%lx already used.\n", 
-			   aci->aci_port, aci->aci_port+2);
+		dev_err(card->dev, "aci i/o area 0x%lx-0x%lx already used.\n",
+			aci->aci_port, aci->aci_port+2);
 		return -ENOMEM;
 	}
 
         /* force ACI into a known state */
 	for (i = 0; i < 3; i++)
 		if (snd_aci_cmd(aci, ACI_ERROR_OP, -1, -1) < 0) {
-			snd_printk(KERN_ERR "can't force aci into known state.\n");
+			dev_err(card->dev, "can't force aci into known state.\n");
 			return -ENXIO;
 		}
 
 	aci->aci_vendor = snd_aci_cmd(aci, ACI_READ_IDCODE, -1, -1);
 	aci->aci_product = snd_aci_cmd(aci, ACI_READ_IDCODE, -1, -1);
 	if (aci->aci_vendor < 0 || aci->aci_product < 0) {
-		snd_printk(KERN_ERR "can't read aci id on 0x%lx.\n",
-			   aci->aci_port);
+		dev_err(card->dev, "can't read aci id on 0x%lx.\n",
+			aci->aci_port);
 		return -ENXIO;
 	}
 
 	aci->aci_version = snd_aci_cmd(aci, ACI_READ_VERSION, -1, -1);
 	if (aci->aci_version < 0) {
-		snd_printk(KERN_ERR "can't read aci version on 0x%lx.\n", 
-			   aci->aci_port);
+		dev_err(card->dev, "can't read aci version on 0x%lx.\n",
+			aci->aci_port);
 		return -ENXIO;
 	}
 
 	if (snd_aci_cmd(aci, ACI_INIT, -1, -1) < 0 ||
 	    snd_aci_cmd(aci, ACI_ERROR_OP, ACI_ERROR_OP, ACI_ERROR_OP) < 0 ||
 	    snd_aci_cmd(aci, ACI_ERROR_OP, ACI_ERROR_OP, ACI_ERROR_OP) < 0) {
-		snd_printk(KERN_ERR "can't initialize aci.\n"); 
+		dev_err(card->dev, "can't initialize aci.\n");
 		return -ENXIO;
 	}
 
@@ -1268,14 +1276,14 @@ static int snd_miro_probe(struct snd_card *card)
 							miro->mc_base_size,
 							"miro (OPTi9xx MC)");
 		if (miro->res_mc_base == NULL) {
-			snd_printk(KERN_ERR "request for OPTI9xx MC failed\n");
+			dev_err(card->dev, "request for OPTI9xx MC failed\n");
 			return -ENOMEM;
 		}
 	}
 
 	error = snd_card_miro_aci_detect(card, miro);
 	if (error < 0) {
-		snd_printk(KERN_ERR "unable to detect aci chip\n");
+		dev_err(card->dev, "unable to detect aci chip\n");
 		return -ENODEV;
 	}
 
@@ -1335,11 +1343,11 @@ static int snd_miro_probe(struct snd_card *card)
 		default:
 			sprintf(card->shortname, 
 				"unknown miro");
-			snd_printk(KERN_INFO "unknown miro aci id\n");
+			dev_info(card->dev, "unknown miro aci id\n");
 			break;
 		}
 	} else {
-		snd_printk(KERN_INFO "found unsupported aci card\n");
+		dev_info(card->dev, "found unsupported aci card\n");
 		sprintf(card->shortname, "unknown Cardinal Technologies");
 	}
 
@@ -1355,8 +1363,8 @@ static int snd_miro_probe(struct snd_card *card)
 		error = snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
 				mpu_port, 0, miro->mpu_irq, &rmidi);
 		if (error < 0)
-			snd_printk(KERN_WARNING "no MPU-401 device at 0x%lx?\n",
-				   mpu_port);
+			dev_warn(card->dev, "no MPU-401 device at 0x%lx?\n",
+				 mpu_port);
 	}
 
 	if (fm_port > 0 && fm_port != SNDRV_AUTO_PORT) {
@@ -1365,8 +1373,8 @@ static int snd_miro_probe(struct snd_card *card)
 
 		if (snd_opl4_create(card, fm_port, fm_port - 8,
 				    2, &opl3, &opl4) < 0)
-			snd_printk(KERN_WARNING "no OPL4 device at 0x%lx\n",
-				   fm_port);
+			dev_warn(card->dev, "no OPL4 device at 0x%lx\n",
+				 fm_port);
 	}
 
 	error = snd_set_aci_init_values(miro);
@@ -1410,14 +1418,14 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 
 	error = snd_card_miro_detect(card, miro);
 	if (error < 0) {
-		snd_printk(KERN_ERR "unable to detect OPTi9xx chip\n");
+		dev_err(card->dev, "unable to detect OPTi9xx chip\n");
 		return -ENODEV;
 	}
 
 	if (port == SNDRV_AUTO_PORT) {
 		port = snd_legacy_find_free_ioport(possible_ports, 4);
 		if (port < 0) {
-			snd_printk(KERN_ERR "unable to find a free WSS port\n");
+			dev_err(card->dev, "unable to find a free WSS port\n");
 			return -EBUSY;
 		}
 	}
@@ -1425,8 +1433,8 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (mpu_port == SNDRV_AUTO_PORT) {
 		mpu_port = snd_legacy_find_free_ioport(possible_mpu_ports, 2);
 		if (mpu_port < 0) {
-			snd_printk(KERN_ERR
-				   "unable to find a free MPU401 port\n");
+			dev_err(card->dev,
+				"unable to find a free MPU401 port\n");
 			return -EBUSY;
 		}
 	}
@@ -1434,29 +1442,29 @@ static int snd_miro_isa_probe(struct device *devptr, unsigned int n)
 	if (irq == SNDRV_AUTO_IRQ) {
 		irq = snd_legacy_find_free_irq(possible_irqs);
 		if (irq < 0) {
-			snd_printk(KERN_ERR "unable to find a free IRQ\n");
+			dev_err(card->dev, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (mpu_irq == SNDRV_AUTO_IRQ) {
 		mpu_irq = snd_legacy_find_free_irq(possible_mpu_irqs);
 		if (mpu_irq < 0) {
-			snd_printk(KERN_ERR
-				   "unable to find a free MPU401 IRQ\n");
+			dev_err(card->dev,
+				"unable to find a free MPU401 IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1 == SNDRV_AUTO_DMA) {
 		dma1 = snd_legacy_find_free_dma(possible_dma1s);
 		if (dma1 < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA1\n");
+			dev_err(card->dev, "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 	if (dma2 == SNDRV_AUTO_DMA) {
 		dma2 = snd_legacy_find_free_dma(possible_dma2s[dma1 % 4]);
 		if (dma2 < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA2\n");
+			dev_err(card->dev, "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
 	}
@@ -1505,14 +1513,14 @@ static int snd_card_miro_pnp(struct snd_miro *chip,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "AUDIO pnp configure failure: %d\n", err);
+		dev_err(chip->card->dev, "AUDIO pnp configure failure: %d\n", err);
 		return err;
 	}
 
 	err = pnp_activate_dev(devmc);
 	if (err < 0) {
-		snd_printk(KERN_ERR "MC pnp configure failure: %d\n",
-				    err);
+		dev_err(chip->card->dev, "MC pnp configure failure: %d\n",
+			err);
 		return err;
 	}
 
@@ -1533,7 +1541,7 @@ static int snd_card_miro_pnp(struct snd_miro *chip,
 	if (mpu_port > 0) {
 		err = pnp_activate_dev(devmpu);
 		if (err < 0) {
-			snd_printk(KERN_ERR "MPU401 pnp configure failure\n");
+			dev_err(chip->card->dev, "MPU401 pnp configure failure\n");
 			mpu_port = -1;
 			return err;
 		}
@@ -1560,6 +1568,7 @@ static int snd_miro_pnp_probe(struct pnp_card_link *pcard,
 		return err;
 
 	miro = card->private_data;
+	miro->card = card;
 
 	err = snd_card_miro_pnp(miro, pcard, pid);
 	if (err)
@@ -1572,7 +1581,7 @@ static int snd_miro_pnp_probe(struct pnp_card_link *pcard,
 
 	err = snd_miro_opti_check(card, miro);
 	if (err) {
-		snd_printk(KERN_ERR "OPTI chip not found\n");
+		dev_err(card->dev, "OPTI chip not found\n");
 		return err;
 	}
 
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index c33f67dd5133..220ea1952c1e 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -109,6 +109,7 @@ MODULE_PARM_DESC(dma2, "2nd dma # for opti9xx driver.");
 #endif /* OPTi93X */
 
 struct snd_opti9xx {
+	struct snd_card *card;
 	unsigned short hardware;
 	unsigned char password;
 	char name[7];
@@ -218,7 +219,7 @@ static int snd_opti9xx_init(struct snd_opti9xx *chip,
 #endif	/* OPTi93X */
 
 	default:
-		snd_printk(KERN_ERR "chip %d not supported\n", hardware);
+		dev_err(chip->card->dev, "chip %d not supported\n", hardware);
 		return -ENODEV;
 	}
 	return 0;
@@ -261,7 +262,7 @@ static unsigned char snd_opti9xx_read(struct snd_opti9xx *chip,
 #endif	/* OPTi93X */
 
 	default:
-		snd_printk(KERN_ERR "chip %d not supported\n", chip->hardware);
+		dev_err(chip->card->dev, "chip %d not supported\n", chip->hardware);
 	}
 
 	spin_unlock_irqrestore(&chip->lock, flags);
@@ -304,7 +305,7 @@ static void snd_opti9xx_write(struct snd_opti9xx *chip, unsigned char reg,
 #endif	/* OPTi93X */
 
 	default:
-		snd_printk(KERN_ERR "chip %d not supported\n", chip->hardware);
+		dev_err(chip->card->dev, "chip %d not supported\n", chip->hardware);
 	}
 
 	spin_unlock_irqrestore(&chip->lock, flags);
@@ -400,7 +401,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 #endif	/* OPTi93X */
 
 	default:
-		snd_printk(KERN_ERR "chip %d not supported\n", chip->hardware);
+		dev_err(chip->card->dev, "chip %d not supported\n", chip->hardware);
 		return -EINVAL;
 	}
 
@@ -423,7 +424,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		wss_base_bits = 0x02;
 		break;
 	default:
-		snd_printk(KERN_WARNING "WSS port 0x%lx not valid\n", port);
+		dev_warn(chip->card->dev, "WSS port 0x%lx not valid\n", port);
 		goto __skip_base;
 	}
 	snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(1), wss_base_bits << 4, 0x30);
@@ -448,7 +449,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		irq_bits = 0x04;
 		break;
 	default:
-		snd_printk(KERN_WARNING "WSS irq # %d not valid\n", irq);
+		dev_warn(chip->card->dev, "WSS irq # %d not valid\n", irq);
 		goto __skip_resources;
 	}
 
@@ -463,13 +464,13 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		dma_bits = 0x03;
 		break;
 	default:
-		snd_printk(KERN_WARNING "WSS dma1 # %d not valid\n", dma1);
+		dev_warn(chip->card->dev, "WSS dma1 # %d not valid\n", dma1);
 		goto __skip_resources;
 	}
 
 #if defined(CS4231) || defined(OPTi93X)
 	if (dma1 == dma2) {
-		snd_printk(KERN_ERR "don't want to share dmas\n");
+		dev_err(chip->card->dev, "don't want to share dmas\n");
 		return -EBUSY;
 	}
 
@@ -478,7 +479,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 	case 1:
 		break;
 	default:
-		snd_printk(KERN_WARNING "WSS dma2 # %d not valid\n", dma2);
+		dev_warn(chip->card->dev, "WSS dma2 # %d not valid\n", dma2);
 		goto __skip_resources;
 	}
 	dma_bits |= 0x04;
@@ -509,8 +510,8 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 			mpu_port_bits = 0x00;
 			break;
 		default:
-			snd_printk(KERN_WARNING
-				   "MPU-401 port 0x%lx not valid\n", mpu_port);
+			dev_warn(chip->card->dev,
+				 "MPU-401 port 0x%lx not valid\n", mpu_port);
 			goto __skip_mpu;
 		}
 
@@ -528,8 +529,8 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 			mpu_irq_bits = 0x01;
 			break;
 		default:
-			snd_printk(KERN_WARNING "MPU-401 irq # %d not valid\n",
-				mpu_irq);
+			dev_warn(chip->card->dev, "MPU-401 irq # %d not valid\n",
+				 mpu_irq);
 			goto __skip_mpu;
 		}
 
@@ -603,7 +604,7 @@ static int snd_opti93x_mixer(struct snd_wss *chip)
 	strcpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot rename opti93x control\n");
+		dev_err(card->dev, "Cannot rename opti93x control\n");
 		return err;
 	}
 	/* reassign AUX1 switch to FM */
@@ -611,7 +612,7 @@ static int snd_opti93x_mixer(struct snd_wss *chip)
 	strcpy(id2.name, "FM Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot rename opti93x control\n");
+		dev_err(card->dev, "Cannot rename opti93x control\n");
 		return err;
 	}
 	/* remove AUX1 volume */
@@ -740,7 +741,7 @@ static int snd_card_opti9xx_pnp(struct snd_opti9xx *chip,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "AUDIO pnp configure failure: %d\n", err);
+		dev_err(chip->card->dev, "AUDIO pnp configure failure: %d\n", err);
 		return err;
 	}
 
@@ -757,7 +758,7 @@ static int snd_card_opti9xx_pnp(struct snd_opti9xx *chip,
 
 	err = pnp_activate_dev(devmc);
 	if (err < 0) {
-		snd_printk(KERN_ERR "MC pnp configure failure: %d\n", err);
+		dev_err(chip->card->dev, "MC pnp configure failure: %d\n", err);
 		return err;
 	}
 
@@ -781,7 +782,7 @@ static int snd_card_opti9xx_pnp(struct snd_opti9xx *chip,
 	if (devmpu && mpu_port > 0) {
 		err = pnp_activate_dev(devmpu);
 		if (err < 0) {
-			snd_printk(KERN_ERR "MPU401 pnp configure failure\n");
+			dev_err(chip->card->dev, "MPU401 pnp configure failure\n");
 			mpu_port = -1;
 		} else {
 			mpu_port = pnp_port_start(devmpu, 0);
@@ -811,7 +812,7 @@ static int snd_opti9xx_probe(struct snd_card *card)
 	if (port == SNDRV_AUTO_PORT) {
 		port = snd_legacy_find_free_ioport(possible_ports, 4);
 		if (port < 0) {
-			snd_printk(KERN_ERR "unable to find a free WSS port\n");
+			dev_err(card->dev, "unable to find a free WSS port\n");
 			return -EBUSY;
 		}
 	}
@@ -850,7 +851,7 @@ static int snd_opti9xx_probe(struct snd_card *card)
 	error = devm_request_irq(card->dev, irq, snd_opti93x_interrupt,
 				 0, DEV_NAME" - WSS", chip);
 	if (error < 0) {
-		snd_printk(KERN_ERR "opti9xx: can't grab IRQ %d\n", irq);
+		dev_err(card->dev, "opti9xx: can't grab IRQ %d\n", irq);
 		return error;
 	}
 #endif
@@ -876,8 +877,8 @@ static int snd_opti9xx_probe(struct snd_card *card)
 		error = snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
 				mpu_port, 0, mpu_irq, &rmidi);
 		if (error)
-			snd_printk(KERN_WARNING "no MPU-401 device at 0x%lx?\n",
-				   mpu_port);
+			dev_warn(card->dev, "no MPU-401 device at 0x%lx?\n",
+				 mpu_port);
 	}
 
 	if (fm_port > 0 && fm_port != SNDRV_AUTO_PORT) {
@@ -900,8 +901,8 @@ static int snd_opti9xx_probe(struct snd_card *card)
 #endif	/* !OPTi93X */
 		if (!opl3 && snd_opl3_create(card, fm_port, fm_port + 2,
 					     OPL3_HW_AUTO, 0, &opl3) < 0) {
-			snd_printk(KERN_WARNING "no OPL device at 0x%lx-0x%lx\n",
-				   fm_port, fm_port + 4 - 1);
+			dev_warn(card->dev, "no OPL device at 0x%lx-0x%lx\n",
+				 fm_port, fm_port + 4 - 1);
 		}
 		if (opl3) {
 			error = snd_opl3_hwdep_new(opl3, 0, 1, &synth);
@@ -958,28 +959,28 @@ static int snd_opti9xx_isa_probe(struct device *devptr,
 	if (mpu_port == SNDRV_AUTO_PORT) {
 		mpu_port = snd_legacy_find_free_ioport(possible_mpu_ports, 2);
 		if (mpu_port < 0) {
-			snd_printk(KERN_ERR "unable to find a free MPU401 port\n");
+			dev_err(devptr, "unable to find a free MPU401 port\n");
 			return -EBUSY;
 		}
 	}
 	if (irq == SNDRV_AUTO_IRQ) {
 		irq = snd_legacy_find_free_irq(possible_irqs);
 		if (irq < 0) {
-			snd_printk(KERN_ERR "unable to find a free IRQ\n");
+			dev_err(devptr, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (mpu_irq == SNDRV_AUTO_IRQ) {
 		mpu_irq = snd_legacy_find_free_irq(possible_mpu_irqs);
 		if (mpu_irq < 0) {
-			snd_printk(KERN_ERR "unable to find a free MPU401 IRQ\n");
+			dev_err(devptr, "unable to find a free MPU401 IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1 == SNDRV_AUTO_DMA) {
 		dma1 = snd_legacy_find_free_dma(possible_dma1s);
 		if (dma1 < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA1\n");
+			dev_err(devptr, "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
@@ -987,7 +988,7 @@ static int snd_opti9xx_isa_probe(struct device *devptr,
 	if (dma2 == SNDRV_AUTO_DMA) {
 		dma2 = snd_legacy_find_free_dma(possible_dma2s[dma1 % 4]);
 		if (dma2 < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA2\n");
+			dev_err(devptr, "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
 	}
@@ -1076,6 +1077,7 @@ static int snd_opti9xx_pnp_probe(struct pnp_card_link *pcard,
 	if (error < 0)
 		return error;
 	chip = card->private_data;
+	chip->card = card;
 
 	hw = snd_card_opti9xx_pnp(chip, pcard, pid);
 	switch (hw) {
@@ -1097,7 +1099,7 @@ static int snd_opti9xx_pnp_probe(struct pnp_card_link *pcard,
 		return error;
 	error = snd_opti9xx_read_check(card, chip);
 	if (error) {
-		snd_printk(KERN_ERR "OPTI chip not found\n");
+		dev_err(card->dev, "OPTI chip not found\n");
 		return error;
 	}
 	error = snd_opti9xx_probe(card);
-- 
2.43.0

