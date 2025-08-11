Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79523C506
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908405; cv=none; b=Cu3VKpUkKTRBQs1ihD7cvo6b7lEHP53nDc4BxyBTWMqbHnIJxthwvKOZlsDiRw5IR3Ldsnk11DanGHIXsEuo/jfc6lPYgrNr3EeXRsNKeaQPx1swkkJRbAEOWIRKJrJk/yc2VbYCSkHCUq80UKIIsX6MibmzeELihmLSknsG33w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908405; c=relaxed/simple;
	bh=pdZPqFZdcCr9RQOYKVwTm17QneK8rL4cvW5YZkNuEZA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO9ZRgYTyIjoTCV9Lo7PANZ1x0fUruE0KHfo+nidR5BEZymL/TH+rtNNBXj04xu/ZMe0NPniFp4v4Ii/HQ1vXGDY9ZyJ3xC/hw4QxabM+Q+VLy2HGcdLy5SLDm76aJWrdM0ej9twsH1OPizeuzAmWJMPDezkNLHbpW6PhtBmXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hj3R1WsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4tv1lUKZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hj3R1WsS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4tv1lUKZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hj3R1WsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4tv1lUKZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hj3R1WsS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4tv1lUKZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 150B521E00;
	Mon, 11 Aug 2025 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3aZT3Dv2WbtjSnd0w4CG+ukX7FJZBnfyeZRJVEbQic=;
	b=hj3R1WsSNIgFpwUqPB9PjjhhQcc5Rxj1+zmEGXnvlXBk/qZ6v0V+/NrhtCaRfPNalnmguz
	6jmNp0flJftwyff35LOEOEt1XYXAb/4yVMxSI77OeotlzqXtmOszIBbxlNJvpQOJDyt4sn
	Z24ATEBQ3DJDM0aTSsZ3fZl2Axo4MMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3aZT3Dv2WbtjSnd0w4CG+ukX7FJZBnfyeZRJVEbQic=;
	b=4tv1lUKZRH4vi88ceQagjfX3qDAumnfcM4jKVZ+QkLMbVnZvt0Pe2Z6m65LwBQzKks/4jP
	FvjYot1XzmqUK8CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3aZT3Dv2WbtjSnd0w4CG+ukX7FJZBnfyeZRJVEbQic=;
	b=hj3R1WsSNIgFpwUqPB9PjjhhQcc5Rxj1+zmEGXnvlXBk/qZ6v0V+/NrhtCaRfPNalnmguz
	6jmNp0flJftwyff35LOEOEt1XYXAb/4yVMxSI77OeotlzqXtmOszIBbxlNJvpQOJDyt4sn
	Z24ATEBQ3DJDM0aTSsZ3fZl2Axo4MMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3aZT3Dv2WbtjSnd0w4CG+ukX7FJZBnfyeZRJVEbQic=;
	b=4tv1lUKZRH4vi88ceQagjfX3qDAumnfcM4jKVZ+QkLMbVnZvt0Pe2Z6m65LwBQzKks/4jP
	FvjYot1XzmqUK8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFECE13479;
	Mon, 11 Aug 2025 10:32:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WPtPOdbGmWjEDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:32:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/11] ALSA: seq: oss/midi: Cleanup with guard and auto-cleanup
Date: Mon, 11 Aug 2025 12:32:45 +0200
Message-ID: <20250811103249.10644-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811103249.10644-1-tiwai@suse.de>
References: <20250811103249.10644-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use the auto-cleanup for the refcount management of seq_oss_midi
object.  The explicit call of snd_use_lock_free() is dropped by the
magic __free(seq_oss_midi) attribute.

Along with that, replace the manual mutex and spin locks with
guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_midi.c | 125 ++++++++++--------------------
 1 file changed, 40 insertions(+), 85 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index f8e247d9e5c9..6d6a1a0dc6c0 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -40,6 +40,7 @@ struct seq_oss_midi {
 	struct mutex open_mutex;
 };
 
+DEFINE_FREE(seq_oss_midi, struct seq_oss_midi *, if (!IS_ERR_OR_NULL(_T)) snd_use_lock_free(&(_T)->use_lock))
 
 /*
  * midi device table
@@ -90,13 +91,11 @@ static struct seq_oss_midi *
 get_mdev(int dev)
 {
 	struct seq_oss_midi *mdev;
-	unsigned long flags;
 
-	spin_lock_irqsave(&register_lock, flags);
+	guard(spinlock_irqsave)(&register_lock);
 	mdev = midi_devs[dev];
 	if (mdev)
 		snd_use_lock_use(&mdev->use_lock);
-	spin_unlock_irqrestore(&register_lock, flags);
 	return mdev;
 }
 
@@ -108,19 +107,16 @@ find_slot(int client, int port)
 {
 	int i;
 	struct seq_oss_midi *mdev;
-	unsigned long flags;
 
-	spin_lock_irqsave(&register_lock, flags);
+	guard(spinlock_irqsave)(&register_lock);
 	for (i = 0; i < max_midi_devs; i++) {
 		mdev = midi_devs[i];
 		if (mdev && mdev->client == client && mdev->port == port) {
 			/* found! */
 			snd_use_lock_use(&mdev->use_lock);
-			spin_unlock_irqrestore(&register_lock, flags);
 			return mdev;
 		}
 	}
-	spin_unlock_irqrestore(&register_lock, flags);
 	return NULL;
 }
 
@@ -134,8 +130,7 @@ int
 snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 {
 	int i;
-	struct seq_oss_midi *mdev;
-	unsigned long flags;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	/* the port must include generic midi */
 	if (! (pinfo->type & SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC))
@@ -151,7 +146,6 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	mdev = find_slot(pinfo->addr.client, pinfo->addr.port);
 	if (mdev) {
 		/* already exists */
-		snd_use_lock_free(&mdev->use_lock);
 		return 0;
 	}
 
@@ -176,7 +170,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	/* create MIDI coder */
 	if (snd_midi_event_new(MAX_MIDI_EVENT_BUF, &mdev->coder) < 0) {
 		pr_err("ALSA: seq_oss: can't malloc midi coder\n");
-		kfree(mdev);
+		kfree(no_free_ptr(mdev));
 		return -ENOMEM;
 	}
 	/* OSS sequencer adds running status to all sequences */
@@ -185,23 +179,21 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	/*
 	 * look for en empty slot
 	 */
-	spin_lock_irqsave(&register_lock, flags);
+	guard(spinlock_irqsave)(&register_lock);
 	for (i = 0; i < max_midi_devs; i++) {
 		if (midi_devs[i] == NULL)
 			break;
 	}
 	if (i >= max_midi_devs) {
 		if (max_midi_devs >= SNDRV_SEQ_OSS_MAX_MIDI_DEVS) {
-			spin_unlock_irqrestore(&register_lock, flags);
 			snd_midi_event_free(mdev->coder);
-			kfree(mdev);
+			kfree(no_free_ptr(mdev));
 			return -ENOMEM;
 		}
 		max_midi_devs++;
 	}
 	mdev->seq_device = i;
-	midi_devs[mdev->seq_device] = mdev;
-	spin_unlock_irqrestore(&register_lock, flags);
+	midi_devs[mdev->seq_device] = no_free_ptr(mdev);
 
 	return 0;
 }
@@ -213,26 +205,24 @@ int
 snd_seq_oss_midi_check_exit_port(int client, int port)
 {
 	struct seq_oss_midi *mdev;
-	unsigned long flags;
 	int index;
 
 	mdev = find_slot(client, port);
 	if (mdev) {
-		spin_lock_irqsave(&register_lock, flags);
-		midi_devs[mdev->seq_device] = NULL;
-		spin_unlock_irqrestore(&register_lock, flags);
+		scoped_guard(spinlock_irqsave, &register_lock) {
+			midi_devs[mdev->seq_device] = NULL;
+		}
 		snd_use_lock_free(&mdev->use_lock);
 		snd_use_lock_sync(&mdev->use_lock);
 		snd_midi_event_free(mdev->coder);
 		kfree(mdev);
 	}
-	spin_lock_irqsave(&register_lock, flags);
+	guard(spinlock_irqsave)(&register_lock);
 	for (index = max_midi_devs - 1; index >= 0; index--) {
 		if (midi_devs[index])
 			break;
 	}
 	max_midi_devs = index + 1;
-	spin_unlock_irqrestore(&register_lock, flags);
 	return 0;
 }
 
@@ -245,9 +235,8 @@ snd_seq_oss_midi_clear_all(void)
 {
 	int i;
 	struct seq_oss_midi *mdev;
-	unsigned long flags;
 
-	spin_lock_irqsave(&register_lock, flags);
+	guard(spinlock_irqsave)(&register_lock);
 	for (i = 0; i < max_midi_devs; i++) {
 		mdev = midi_devs[i];
 		if (mdev) {
@@ -257,7 +246,6 @@ snd_seq_oss_midi_clear_all(void)
 		}
 	}
 	max_midi_devs = 0;
-	spin_unlock_irqrestore(&register_lock, flags);
 }
 
 
@@ -267,9 +255,8 @@ snd_seq_oss_midi_clear_all(void)
 void
 snd_seq_oss_midi_setup(struct seq_oss_devinfo *dp)
 {
-	spin_lock_irq(&register_lock);
+	guard(spinlock_irq)(&register_lock);
 	dp->max_mididev = max_midi_devs;
-	spin_unlock_irq(&register_lock);
 }
 
 /*
@@ -317,20 +304,17 @@ int
 snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 {
 	int perm;
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 	struct snd_seq_port_subscribe subs;
-	int err;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
 
-	mutex_lock(&mdev->open_mutex);
+	guard(mutex)(&mdev->open_mutex);
 	/* already used? */
-	if (mdev->opened && mdev->devinfo != dp) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	if (mdev->opened && mdev->devinfo != dp)
+		return -EBUSY;
 
 	perm = 0;
 	if (is_write_mode(fmode))
@@ -338,16 +322,12 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 	if (is_read_mode(fmode))
 		perm |= PERM_READ;
 	perm &= mdev->flags;
-	if (perm == 0) {
-		err = -ENXIO;
-		goto unlock;
-	}
+	if (perm == 0)
+		return -ENXIO;
 
 	/* already opened? */
-	if ((mdev->opened & perm) == perm) {
-		err = 0;
-		goto unlock;
-	}
+	if ((mdev->opened & perm) == perm)
+		return 0;
 
 	perm &= ~mdev->opened;
 
@@ -370,18 +350,11 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 			mdev->opened |= PERM_READ;
 	}
 
-	if (! mdev->opened) {
-		err = -ENXIO;
-		goto unlock;
-	}
+	if (!mdev->opened)
+		return -ENXIO;
 
 	mdev->devinfo = dp;
-	err = 0;
-
- unlock:
-	mutex_unlock(&mdev->open_mutex);
-	snd_use_lock_free(&mdev->use_lock);
-	return err;
+	return 0;
 }
 
 /*
@@ -390,15 +363,15 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 int
 snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 	struct snd_seq_port_subscribe subs;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
-	mutex_lock(&mdev->open_mutex);
+	guard(mutex)(&mdev->open_mutex);
 	if (!mdev->opened || mdev->devinfo != dp)
-		goto unlock;
+		return 0;
 
 	memset(&subs, 0, sizeof(subs));
 	if (mdev->opened & PERM_WRITE) {
@@ -416,10 +389,6 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 
 	mdev->opened = 0;
 	mdev->devinfo = NULL;
-
- unlock:
-	mutex_unlock(&mdev->open_mutex);
-	snd_use_lock_free(&mdev->use_lock);
 	return 0;
 }
 
@@ -429,7 +398,7 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 int
 snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 	int mode;
 
 	mdev = get_mididev(dp, dev);
@@ -442,7 +411,6 @@ snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev)
 	if (mdev->opened & PERM_READ)
 		mode |= SNDRV_SEQ_OSS_FILE_READ;
 
-	snd_use_lock_free(&mdev->use_lock);
 	return mode;
 }
 
@@ -453,15 +421,13 @@ snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev)
 void
 snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev)
 {
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return;
-	if (! mdev->opened) {
-		snd_use_lock_free(&mdev->use_lock);
+	if (!mdev->opened)
 		return;
-	}
 
 	if (mdev->opened & PERM_WRITE) {
 		struct snd_seq_event ev;
@@ -492,7 +458,6 @@ snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev)
 		}
 	}
 	// snd_seq_oss_midi_close(dp, dev);
-	snd_use_lock_free(&mdev->use_lock);
 }
 
 
@@ -502,14 +467,13 @@ snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev)
 void
 snd_seq_oss_midi_get_addr(struct seq_oss_devinfo *dp, int dev, struct snd_seq_addr *addr)
 {
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return;
 	addr->client = mdev->client;
 	addr->port = mdev->port;
-	snd_use_lock_free(&mdev->use_lock);
 }
 
 
@@ -520,26 +484,20 @@ int
 snd_seq_oss_midi_input(struct snd_seq_event *ev, int direct, void *private_data)
 {
 	struct seq_oss_devinfo *dp = (struct seq_oss_devinfo *)private_data;
-	struct seq_oss_midi *mdev;
-	int rc;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	if (dp->readq == NULL)
 		return 0;
 	mdev = find_slot(ev->source.client, ev->source.port);
 	if (!mdev)
 		return 0;
-	if (! (mdev->opened & PERM_READ)) {
-		snd_use_lock_free(&mdev->use_lock);
+	if (!(mdev->opened & PERM_READ))
 		return 0;
-	}
 
 	if (dp->seq_mode == SNDRV_SEQ_OSS_MODE_MUSIC)
-		rc = send_synth_event(dp, ev, mdev->seq_device);
+		return send_synth_event(dp, ev, mdev->seq_device);
 	else
-		rc = send_midi_event(dp, ev, mdev);
-
-	snd_use_lock_free(&mdev->use_lock);
-	return rc;
+		return send_midi_event(dp, ev, mdev);
 }
 
 /*
@@ -636,17 +594,15 @@ send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev, struct seq
 int
 snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, struct snd_seq_event *ev)
 {
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
 	if (snd_midi_event_encode_byte(mdev->coder, c, ev)) {
 		snd_seq_oss_fill_addr(dp, ev, mdev->client, mdev->port);
-		snd_use_lock_free(&mdev->use_lock);
 		return 0;
 	}
-	snd_use_lock_free(&mdev->use_lock);
 	return -EINVAL;
 }
 
@@ -656,7 +612,7 @@ snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, stru
 int
 snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info *inf)
 {
-	struct seq_oss_midi *mdev;
+	struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
@@ -665,7 +621,6 @@ snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info
 	inf->dev_type = 0; /* FIXME: ?? */
 	inf->capabilities = 0; /* FIXME: ?? */
 	strscpy(inf->name, mdev->name, sizeof(inf->name));
-	snd_use_lock_free(&mdev->use_lock);
 	return 0;
 }
 
@@ -692,10 +647,11 @@ void
 snd_seq_oss_midi_info_read(struct snd_info_buffer *buf)
 {
 	int i;
-	struct seq_oss_midi *mdev;
 
 	snd_iprintf(buf, "\nNumber of MIDI devices: %d\n", max_midi_devs);
 	for (i = 0; i < max_midi_devs; i++) {
+		struct seq_oss_midi *mdev __free(seq_oss_midi) = NULL;
+
 		snd_iprintf(buf, "\nmidi %d: ", i);
 		mdev = get_mdev(i);
 		if (mdev == NULL) {
@@ -707,7 +663,6 @@ snd_seq_oss_midi_info_read(struct snd_info_buffer *buf)
 		snd_iprintf(buf, "  capability %s / opened %s\n",
 			    capmode_str(mdev->flags),
 			    capmode_str(mdev->opened));
-		snd_use_lock_free(&mdev->use_lock);
 	}
 }
 #endif /* CONFIG_SND_PROC_FS */
-- 
2.50.1

