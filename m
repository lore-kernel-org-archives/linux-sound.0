Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE0200139
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=rzmIzXPx0FE365ls5J4HQMUzo7ZQ5fxCeV1/A1l8otyhXvMJHuuiupz/0MQ8044Ac9NJaV+yo2vYGyKa433Z0cX9z45QB6zJU6kwKCO8kDFr2jjbZuVa/HiJ96kP/2i2/KUD4LMVxnClXk9qr81SjVAk++xFJcggRZpx5TP2E+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=z+JYr+wLQMdyDLnvMENmK7XKmr5lZj7YWiQGccBVkJ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9igTaOTcXhHFztDho5ndDRtD7PosQ1May9G3YO0ARMDSy69uIpHGPF3qZRLrgRraq2bOF/YtEWP1HwyM6dQmEMx1RQWTNbajYDzancQKcivAi7UuvGJ/o6UdpAXInRR8vRRfZ27MZWg1mvY6q+AdweHbMw/btvLfmGJPdkUI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vP/Y97n+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vu3hCrik; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vP/Y97n+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vu3hCrik; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vP/Y97n+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vu3hCrik";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vP/Y97n+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vu3hCrik"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9BAF1FB59;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydnB48/FnidECoAeMw7GVuAb19h6XWFGpii9Z4ToEA=;
	b=vP/Y97n+GkhezI7jnfC2bdH+cd4U7E8bVpMha7rNRNy+Z5WvFd5Zee3vvqjSZqMuJPKvqj
	UTWqFedmxI+SJ1wgr+jLDaFGRLjAHVmusd3ds/RNe5xxG661leXQcTMplO2iSi5JkaxDYI
	U51PBJpJBixYNuFuuQoWXbOzS9imP20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydnB48/FnidECoAeMw7GVuAb19h6XWFGpii9Z4ToEA=;
	b=Vu3hCrikyttTivMtHVCQQzAIYKjKwHncWEtTm6/vyn9DA1bXXE4LaznGmE8f7WFt0pm4fq
	3QvSY3xxo2rJrMAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vP/Y97n+";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Vu3hCrik
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydnB48/FnidECoAeMw7GVuAb19h6XWFGpii9Z4ToEA=;
	b=vP/Y97n+GkhezI7jnfC2bdH+cd4U7E8bVpMha7rNRNy+Z5WvFd5Zee3vvqjSZqMuJPKvqj
	UTWqFedmxI+SJ1wgr+jLDaFGRLjAHVmusd3ds/RNe5xxG661leXQcTMplO2iSi5JkaxDYI
	U51PBJpJBixYNuFuuQoWXbOzS9imP20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ydnB48/FnidECoAeMw7GVuAb19h6XWFGpii9Z4ToEA=;
	b=Vu3hCrikyttTivMtHVCQQzAIYKjKwHncWEtTm6/vyn9DA1bXXE4LaznGmE8f7WFt0pm4fq
	3QvSY3xxo2rJrMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1A2413B03;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UCtBKt13s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 38/54] ALSA: korg1212: Use standard print API
Date: Wed,  7 Aug 2024 15:34:28 +0200
Message-ID: <20240807133452.9424-39-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C9BAF1FB59
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 5c2cac201a28..e62fb1ad6d77 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -28,14 +28,14 @@
 // ----------------------------------------------------------------------------
 #define K1212_DEBUG_LEVEL		0
 #if K1212_DEBUG_LEVEL > 0
-#define K1212_DEBUG_PRINTK(fmt,args...)	printk(KERN_DEBUG fmt,##args)
+#define K1212_DEBUG_PRINTK(fmt, args...) pr_debug(fmt, ##args)
 #else
-#define K1212_DEBUG_PRINTK(fmt,...)	do { } while (0)
+#define K1212_DEBUG_PRINTK(fmt, ...)	do { } while (0)
 #endif
 #if K1212_DEBUG_LEVEL > 1
-#define K1212_DEBUG_PRINTK_VERBOSE(fmt,args...)	printk(KERN_DEBUG fmt,##args)
+#define K1212_DEBUG_PRINTK_VERBOSE(fmt, args...) pr_debug(fmt, ##args)
 #else
-#define K1212_DEBUG_PRINTK_VERBOSE(fmt,...)
+#define K1212_DEBUG_PRINTK_VERBOSE(fmt, ...)
 #endif
 
 // ----------------------------------------------------------------------------
@@ -602,7 +602,7 @@ static void snd_korg1212_timer_func(struct timer_list *t)
 			/* reprogram timer */
 			mod_timer(&korg1212->timer, jiffies + 1);
 		} else {
-			snd_printd("korg1212_timer_func timeout\n");
+			dev_dbg(korg1212->card->dev, "korg1212_timer_func timeout\n");
 			korg1212->sharedBufferPtr->cardCommand = 0;
 			korg1212->dsp_stop_is_processed = 1;
 			wake_up(&korg1212->wait);
@@ -1131,7 +1131,7 @@ static irqreturn_t snd_korg1212_interrupt(int irq, void *dev_id)
 			K1212_DEBUG_PRINTK_VERBOSE("K1212_DEBUG: IRQ DMAE count - %ld, %x, [%s].\n",
 						   korg1212->irqcount, doorbellValue,
 						   stateName[korg1212->cardState]);
-			snd_printk(KERN_ERR "korg1212: DMA Error\n");
+			dev_err(korg1212->card->dev, "korg1212: DMA Error\n");
 			korg1212->errorcnt++;
 			korg1212->totalerrorcnt++;
 			korg1212->sharedBufferPtr->cardCommand = 0;
@@ -1272,8 +1272,8 @@ static int snd_korg1212_silence(struct snd_korg1212 *korg1212, int pos, int coun
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) dst < (void *) korg1212->playDataBufsPtr ||
 		     (void *) dst > (void *) korg1212->playDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_silence KERNEL EFAULT dst=%p iter=%d\n",
-			       dst, i);
+			pr_debug("K1212_DEBUG: %s KERNEL EFAULT dst=%p iter=%d\n",
+				 __func__, dst, i);
 			return -EFAULT;
 		}
 #endif
@@ -1305,7 +1305,8 @@ static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) src < (void *) korg1212->recordDataBufsPtr ||
 		     (void *) src > (void *) korg1212->recordDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_to KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst->kvec.iov_base, i);
+			pr_debug("K1212_DEBUG: %s KERNEL EFAULT, src=%p dst=%p iter=%d\n",
+				 __func__, src, dst->kvec.iov_base, i);
 			return -EFAULT;
 		}
 #endif
@@ -1330,8 +1331,8 @@ static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
 	size = korg1212->channels * 2;
 	dst = korg1212->playDataBufsPtr[0].bufferData + pos;
 
-	K1212_DEBUG_PRINTK_VERBOSE("K1212_DEBUG: snd_korg1212_copy_from pos=%d size=%d count=%d\n",
-				   pos, size, count);
+	K1212_DEBUG_PRINTK_VERBOSE("K1212_DEBUG: %s pos=%d size=%d count=%d\n",
+				   __func__, pos, size, count);
 
 	if (snd_BUG_ON(pos + count > K1212_MAX_SAMPLES))
 		return -EINVAL;
@@ -1340,7 +1341,8 @@ static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) dst < (void *) korg1212->playDataBufsPtr ||
 		     (void *) dst > (void *) korg1212->playDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_from KERNEL EFAULT, src=%p dst=%p iter=%d\n", src->kvec.iov_base, dst, i);
+			pr_debug("K1212_DEBUG: %s KERNEL EFAULT, src=%p dst=%p iter=%d\n",
+				 __func__, src->kvec.iov_base, dst, i);
 			return -EFAULT;
 		}
 #endif
@@ -2135,7 +2137,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
                           KBUILD_MODNAME, korg1212);
 
         if (err) {
-		snd_printk(KERN_ERR "korg1212: unable to grab IRQ %d\n", pci->irq);
+		dev_err(&pci->dev, "korg1212: unable to grab IRQ %d\n", pci->irq);
                 return -EBUSY;
         }
 
@@ -2232,7 +2234,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 
 	err = request_firmware(&dsp_code, "korg/k1212.dsp", &pci->dev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "firmware not available\n");
+		dev_err(&pci->dev, "firmware not available\n");
 		return err;
 	}
 
-- 
2.43.0

