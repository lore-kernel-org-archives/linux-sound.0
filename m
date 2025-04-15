Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415120A5C4
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732528; cv=none; b=gxF8W0gE2k/VGYrc9CzfjtRvKpXTYZFtrQv6S0X50afQGo04Uh1GTU+vDW9b2QQ8CnIl5/5MM92GMkVVTMJFlU6ucImXrIWccP7nmVU+TfE/XkUMKkLhxtfHmmnyjZ0xkEH0WvC9zlOMQdo6mtTNC5GncDDjsE9G2y+LKxHl+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732528; c=relaxed/simple;
	bh=x0R5ElvlIaUYV+bCHZsj7jcqSvl3+xe1hfS2emvrWHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfRyJ9SYh2yxxw6LBSNfCV9kCetQI9c6WcJXGV8KsrzZN7fmjg941uamnlbQjgo7+k3GqTHAsVV4Omdp95cdbbCIHaJICyj7cn9A7b5Plby8joYL9Zp4mtc76FMC4TpfSll354NL+M5hy504+CxhZmCZaENZiAel6gspvSme5Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZhPYmACI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eMFMQQxh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZhPYmACI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eMFMQQxh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZhPYmACI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eMFMQQxh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZhPYmACI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eMFMQQxh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 006681F749;
	Tue, 15 Apr 2025 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744732525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xSy6eJPdpyyBjMiYGnslx1CGHIXByqtq/qlKfgUuTgE=;
	b=ZhPYmACIieoR9ZAGcwbo9PJfWDsHnDSM4W8tFnJPnijmbAUwBOfiQjn+HKb3fiq7V8F8w+
	6aSnSAWMnJF5R6M2Z8CpJ3P+STOTDVa02/2m2v0LVFtsJV5ItuMO00/bCCZUYDP7iXykfj
	W3CnxYjmjkJdomoEs365x2mg5vTKDRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744732525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xSy6eJPdpyyBjMiYGnslx1CGHIXByqtq/qlKfgUuTgE=;
	b=eMFMQQxhx80srjkEnGT8vBgD0dl8ivH+WdzmT88iNG4PS7zmnnzwdSliIg1r37we+G7X3a
	3bDs6+81fAyeLzAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744732525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xSy6eJPdpyyBjMiYGnslx1CGHIXByqtq/qlKfgUuTgE=;
	b=ZhPYmACIieoR9ZAGcwbo9PJfWDsHnDSM4W8tFnJPnijmbAUwBOfiQjn+HKb3fiq7V8F8w+
	6aSnSAWMnJF5R6M2Z8CpJ3P+STOTDVa02/2m2v0LVFtsJV5ItuMO00/bCCZUYDP7iXykfj
	W3CnxYjmjkJdomoEs365x2mg5vTKDRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744732525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xSy6eJPdpyyBjMiYGnslx1CGHIXByqtq/qlKfgUuTgE=;
	b=eMFMQQxhx80srjkEnGT8vBgD0dl8ivH+WdzmT88iNG4PS7zmnnzwdSliIg1r37we+G7X3a
	3bDs6+81fAyeLzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1CC6139A1;
	Tue, 15 Apr 2025 15:55:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id syIEMmyB/mdZWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 15:55:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: WangYuli <wangyuli@uniontech.com>,
	Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] ALSA: korg1212: Replace the pending stop check code with sync_stop PCM ops
Date: Tue, 15 Apr 2025 17:55:21 +0200
Message-ID: <20250415155522.7998-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The korg1212 driver has an overly complex code with the timer API to
check the pending stop operation and to sync at the prepare stage.
This very same thing can be achieved more simply by the PCM sync_stop
ops without timer, and this patch implements it.

Along with the rewrite to sync_stop ops, the flag
dsp_stop_is_processed is replaced with dsp_stop_processing to indicate
the stop operation is pending, not to indicate it's finished.  In that
way, wait_for_event() can be used more straightforwardly.

Link: https://lore.kernel.org/590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 75 +++++++++--------------------------
 1 file changed, 19 insertions(+), 56 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 49b71082c485..56dea5b10828 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -308,9 +308,6 @@ struct snd_korg1212 {
         spinlock_t    lock;
 	struct mutex open_mutex;
 
-	struct timer_list timer;	/* timer callback for checking ack of stop request */
-	int stop_pending_cnt;		/* counter for stop pending check */
-
         wait_queue_head_t wait;
 
         unsigned long iomem;
@@ -382,7 +379,7 @@ struct snd_korg1212 {
 	unsigned long totalerrorcnt; // Total Error Count
 
 	int dsp_is_loaded;
-	int dsp_stop_is_processed;
+	int dsp_stop_processing;
 
 };
 
@@ -565,52 +562,17 @@ static int snd_korg1212_Send1212Command(struct snd_korg1212 *korg1212,
 /* spinlock already held */
 static void snd_korg1212_SendStop(struct snd_korg1212 *korg1212)
 {
-	if (! korg1212->stop_pending_cnt) {
-		korg1212->sharedBufferPtr->cardCommand = 0xffffffff;
-		/* program the timer */
-		korg1212->stop_pending_cnt = HZ;
-		mod_timer(&korg1212->timer, jiffies + 1);
-	}
+	korg1212->dsp_stop_processing = 1;
+	korg1212->sharedBufferPtr->cardCommand = 0xffffffff;
 }
 
 static void snd_korg1212_SendStopAndWait(struct snd_korg1212 *korg1212)
 {
 	unsigned long flags;
 	spin_lock_irqsave(&korg1212->lock, flags);
-	korg1212->dsp_stop_is_processed = 0;
 	snd_korg1212_SendStop(korg1212);
 	spin_unlock_irqrestore(&korg1212->lock, flags);
-	wait_event_timeout(korg1212->wait, korg1212->dsp_stop_is_processed, (HZ * 3) / 2);
-}
-
-/* timer callback for checking the ack of stop request */
-static void snd_korg1212_timer_func(struct timer_list *t)
-{
-	struct snd_korg1212 *korg1212 = from_timer(korg1212, t, timer);
-	unsigned long flags;
-	
-	spin_lock_irqsave(&korg1212->lock, flags);
-	if (korg1212->sharedBufferPtr->cardCommand == 0) {
-		/* ack'ed */
-		korg1212->stop_pending_cnt = 0;
-		korg1212->dsp_stop_is_processed = 1;
-		wake_up(&korg1212->wait);
-		K1212_DEBUG_PRINTK_VERBOSE("K1212_DEBUG: Stop ack'ed [%s]\n",
-					   stateName[korg1212->cardState]);
-	} else {
-		if (--korg1212->stop_pending_cnt > 0) {
-			/* reprogram timer */
-			mod_timer(&korg1212->timer, jiffies + 1);
-		} else {
-			dev_dbg(korg1212->card->dev, "korg1212_timer_func timeout\n");
-			korg1212->sharedBufferPtr->cardCommand = 0;
-			korg1212->dsp_stop_is_processed = 1;
-			wake_up(&korg1212->wait);
-			K1212_DEBUG_PRINTK("K1212_DEBUG: Stop timeout [%s]\n",
-					   stateName[korg1212->cardState]);
-		}
-	}
-	spin_unlock_irqrestore(&korg1212->lock, flags);
+	wait_event_timeout(korg1212->wait, !korg1212->dsp_stop_processing, HZ);
 }
 
 static int snd_korg1212_TurnOnIdleMonitor(struct snd_korg1212 *korg1212)
@@ -1135,7 +1097,9 @@ static irqreturn_t snd_korg1212_interrupt(int irq, void *dev_id)
 			korg1212->errorcnt++;
 			korg1212->totalerrorcnt++;
 			korg1212->sharedBufferPtr->cardCommand = 0;
+			korg1212->dsp_stop_processing = 0;
 			snd_korg1212_setCardState(korg1212, K1212_STATE_ERRORSTOP);
+			wake_up(&korg1212->wait);
                         break;
 
                 // ------------------------------------------------------------------------
@@ -1147,6 +1111,8 @@ static irqreturn_t snd_korg1212_interrupt(int irq, void *dev_id)
 						   korg1212->irqcount, doorbellValue,
 						   stateName[korg1212->cardState]);
 			korg1212->sharedBufferPtr->cardCommand = 0;
+			korg1212->dsp_stop_processing = 0;
+			wake_up(&korg1212->wait);
                         break;
 
                 default:
@@ -1535,6 +1501,14 @@ static int snd_korg1212_hw_params(struct snd_pcm_substream *substream,
         return 0;
 }
 
+static int snd_korg1212_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
+
+	wait_event_timeout(korg1212->wait, !korg1212->dsp_stop_processing, HZ);
+	return 0;
+}
+
 static int snd_korg1212_prepare(struct snd_pcm_substream *substream)
 {
         struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1544,19 +1518,7 @@ static int snd_korg1212_prepare(struct snd_pcm_substream *substream)
 			   stateName[korg1212->cardState]);
 
 	spin_lock_irq(&korg1212->lock);
-
-	/* FIXME: we should wait for ack! */
-	if (korg1212->stop_pending_cnt > 0) {
-		K1212_DEBUG_PRINTK("K1212_DEBUG: snd_korg1212_prepare - Stop is pending... [%s]\n",
-				   stateName[korg1212->cardState]);
-        	spin_unlock_irq(&korg1212->lock);
-		return -EAGAIN;
-		/*
-		korg1212->sharedBufferPtr->cardCommand = 0;
-		del_timer(&korg1212->timer);
-		korg1212->stop_pending_cnt = 0;
-		*/
-	}
+	korg1212->dsp_stop_processing = 0;
 
         rc = snd_korg1212_SetupForPlay(korg1212);
 
@@ -1668,6 +1630,7 @@ static const struct snd_pcm_ops snd_korg1212_playback_ops = {
         .hw_params =	snd_korg1212_hw_params,
         .prepare =	snd_korg1212_prepare,
         .trigger =	snd_korg1212_trigger,
+	.sync_stop =	snd_korg1212_sync_stop,
         .pointer =	snd_korg1212_playback_pointer,
 	.copy =		snd_korg1212_playback_copy,
 	.fill_silence =	snd_korg1212_playback_silence,
@@ -1680,6 +1643,7 @@ static const struct snd_pcm_ops snd_korg1212_capture_ops = {
 	.hw_params =	snd_korg1212_hw_params,
 	.prepare =	snd_korg1212_prepare,
 	.trigger =	snd_korg1212_trigger,
+	.sync_stop =	snd_korg1212_sync_stop,
 	.pointer =	snd_korg1212_capture_pointer,
 	.copy =		snd_korg1212_capture_copy,
 };
@@ -2086,7 +2050,6 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         init_waitqueue_head(&korg1212->wait);
         spin_lock_init(&korg1212->lock);
 	mutex_init(&korg1212->open_mutex);
-	timer_setup(&korg1212->timer, snd_korg1212_timer_func, 0);
 
         korg1212->irq = -1;
         korg1212->clkSource = K1212_CLKIDX_Local;
-- 
2.49.0

