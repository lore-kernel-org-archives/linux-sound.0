Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8636F2DCC0B
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900557; cv=none; b=nA/EdVd0baHlGpApnZJ+Uusldv4k74IovzYZ69+hrV39TGAO3Vbjw/SKUZ8el9kWwGYon5X1Cy9y8zKOvhQWO26ykE7DZD8R6L/NACYl0fbVAdo1NRMQw5WOBjJyyQO3dw/KLBpU5KTK6ehArYqjctCnB8fHZObgsBahOqHY1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900557; c=relaxed/simple;
	bh=x6OMRMPgAiO81R3JCLoUGhv0C+rIfBRsK4BigRtKSqg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qQpMdG8KTb91G3UBEVFcOayZsw8htHfCB/ADuqopNJov6S/TnXUuu346QHkWaxtW1Bs/Pr1ZkeD6r7CQCik1FCqs3aabIouU4Gj/wrBIDNjMWMu1PZVDE6wCQsWV/yEVTKnYjJsDIq6o+r/Wbv7kh0uDdXzX6eS28oco3NV0eUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1nnb0lyk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Kw1TLli; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1nnb0lyk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Kw1TLli; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1nnb0lyk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Kw1TLli";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1nnb0lyk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Kw1TLli"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A09DF33FFA;
	Mon, 11 Aug 2025 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754900552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9f7icU2pIoa7xCLI/+XAHt2U6GelaNnElpzs2elJreE=;
	b=1nnb0lykCezHssueYqGusI1ZcxLMf//ybQxTxYevTV7rhe4CPvpLEQJgW2aCWTs+9a0+hn
	cYLnRREAYGoZlKPRVId4O5mvAIMwSgEM3QzRMbncKRdtujWdEjtMU3EVs7N/R82hneYq0Y
	NV793QbZuwBAtMUrE1vRzCZhptgwIW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754900552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9f7icU2pIoa7xCLI/+XAHt2U6GelaNnElpzs2elJreE=;
	b=8Kw1TLlizoyTtn5nw7e2XlcCXTHEQouYQ/S65Y/a91Quscv+HL4fP01oKNnlSpfmVfPjro
	9BWhpmL2sBurKdDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754900552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9f7icU2pIoa7xCLI/+XAHt2U6GelaNnElpzs2elJreE=;
	b=1nnb0lykCezHssueYqGusI1ZcxLMf//ybQxTxYevTV7rhe4CPvpLEQJgW2aCWTs+9a0+hn
	cYLnRREAYGoZlKPRVId4O5mvAIMwSgEM3QzRMbncKRdtujWdEjtMU3EVs7N/R82hneYq0Y
	NV793QbZuwBAtMUrE1vRzCZhptgwIW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754900552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9f7icU2pIoa7xCLI/+XAHt2U6GelaNnElpzs2elJreE=;
	b=8Kw1TLlizoyTtn5nw7e2XlcCXTHEQouYQ/S65Y/a91Quscv+HL4fP01oKNnlSpfmVfPjro
	9BWhpmL2sBurKdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80F4B13479;
	Mon, 11 Aug 2025 08:22:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IzesHUiomWgPZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 08:22:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: 6fire: Clean ups with guard()
Date: Mon, 11 Aug 2025 10:22:29 +0200
Message-ID: <20250811082231.31498-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Simple code cleanups with the guard() for spinlock and mutex.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 40 ++++++++++----------
 sound/usb/6fire/midi.c | 21 +++--------
 sound/usb/6fire/pcm.c  | 83 ++++++++++++++++++------------------------
 3 files changed, 59 insertions(+), 85 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 9eb4bf9b138b..5ff78814e687 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -88,24 +88,22 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	struct snd_card *card = NULL;
 
 	/* look if we already serve this card and return if so */
-	mutex_lock(&register_mutex);
-	for (i = 0; i < SNDRV_CARDS; i++) {
-		if (devices[i] == device) {
-			if (chips[i])
-				chips[i]->intf_count++;
-			usb_set_intfdata(intf, chips[i]);
-			mutex_unlock(&register_mutex);
-			return 0;
-		} else if (!devices[i] && regidx < 0)
-			regidx = i;
+	scoped_guard(mutex, &register_mutex) {
+		for (i = 0; i < SNDRV_CARDS; i++) {
+			if (devices[i] == device) {
+				if (chips[i])
+					chips[i]->intf_count++;
+				usb_set_intfdata(intf, chips[i]);
+				return 0;
+			} else if (!devices[i] && regidx < 0)
+				regidx = i;
+		}
+		if (regidx < 0) {
+			dev_err(&intf->dev, "too many cards registered.\n");
+			return -ENODEV;
+		}
+		devices[regidx] = device;
 	}
-	if (regidx < 0) {
-		mutex_unlock(&register_mutex);
-		dev_err(&intf->dev, "too many cards registered.\n");
-		return -ENODEV;
-	}
-	devices[regidx] = device;
-	mutex_unlock(&register_mutex);
 
 	/* check, if firmware is present on device, upload it if not */
 	ret = usb6fire_fw_init(intf);
@@ -175,10 +173,10 @@ static void usb6fire_chip_disconnect(struct usb_interface *intf)
 	if (chip) { /* if !chip, fw upload has been performed */
 		chip->intf_count--;
 		if (!chip->intf_count) {
-			mutex_lock(&register_mutex);
-			devices[chip->regidx] = NULL;
-			chips[chip->regidx] = NULL;
-			mutex_unlock(&register_mutex);
+			scoped_guard(mutex, &register_mutex) {
+				devices[chip->regidx] = NULL;
+				chips[chip->regidx] = NULL;
+			}
 
 			chip->shutdown = true;
 			usb6fire_chip_abort(chip);
diff --git a/sound/usb/6fire/midi.c b/sound/usb/6fire/midi.c
index 923f7767e62f..4d1eeb32c5fe 100644
--- a/sound/usb/6fire/midi.c
+++ b/sound/usb/6fire/midi.c
@@ -23,9 +23,8 @@ static void usb6fire_midi_out_handler(struct urb *urb)
 {
 	struct midi_runtime *rt = urb->context;
 	int ret;
-	unsigned long flags;
 
-	spin_lock_irqsave(&rt->out_lock, flags);
+	guard(spinlock_irqsave)(&rt->out_lock);
 
 	if (rt->out) {
 		ret = snd_rawmidi_transmit(rt->out, rt->out_buffer + 4,
@@ -43,18 +42,14 @@ static void usb6fire_midi_out_handler(struct urb *urb)
 		} else /* no more data to transmit */
 			rt->out = NULL;
 	}
-	spin_unlock_irqrestore(&rt->out_lock, flags);
 }
 
 static void usb6fire_midi_in_received(
 		struct midi_runtime *rt, u8 *data, int length)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&rt->in_lock, flags);
+	guard(spinlock_irqsave)(&rt->in_lock);
 	if (rt->in)
 		snd_rawmidi_receive(rt->in, data, length);
-	spin_unlock_irqrestore(&rt->in_lock, flags);
 }
 
 static int usb6fire_midi_out_open(struct snd_rawmidi_substream *alsa_sub)
@@ -73,14 +68,11 @@ static void usb6fire_midi_out_trigger(
 	struct midi_runtime *rt = alsa_sub->rmidi->private_data;
 	struct urb *urb = &rt->out_urb;
 	__s8 ret;
-	unsigned long flags;
 
-	spin_lock_irqsave(&rt->out_lock, flags);
+	guard(spinlock_irqsave)(&rt->out_lock);
 	if (up) { /* start transfer */
-		if (rt->out) { /* we are already transmitting so just return */
-			spin_unlock_irqrestore(&rt->out_lock, flags);
+		if (rt->out) /* we are already transmitting so just return */
 			return;
-		}
 
 		ret = snd_rawmidi_transmit(alsa_sub, rt->out_buffer + 4,
 				MIDI_BUFSIZE - 4);
@@ -99,7 +91,6 @@ static void usb6fire_midi_out_trigger(
 		}
 	} else if (rt->out == alsa_sub)
 		rt->out = NULL;
-	spin_unlock_irqrestore(&rt->out_lock, flags);
 }
 
 static void usb6fire_midi_out_drain(struct snd_rawmidi_substream *alsa_sub)
@@ -125,14 +116,12 @@ static void usb6fire_midi_in_trigger(
 		struct snd_rawmidi_substream *alsa_sub, int up)
 {
 	struct midi_runtime *rt = alsa_sub->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&rt->in_lock, flags);
+	guard(spinlock_irqsave)(&rt->in_lock);
 	if (up)
 		rt->in = alsa_sub;
 	else
 		rt->in = NULL;
-	spin_unlock_irqrestore(&rt->in_lock, flags);
 }
 
 static const struct snd_rawmidi_ops out_ops = {
diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index d53cad97889a..08515da5dcc8 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -289,7 +289,7 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 	struct pcm_urb *out_urb = in_urb->peer;
 	struct pcm_runtime *rt = in_urb->chip->pcm;
 	struct pcm_substream *sub;
-	unsigned long flags;
+	bool period_elapsed;
 	int total_length = 0;
 	int frame_count;
 	int frame;
@@ -313,17 +313,18 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	/* receive our capture data */
 	sub = &rt->capture;
-	spin_lock_irqsave(&sub->lock, flags);
-	if (sub->active) {
-		usb6fire_pcm_capture(sub, in_urb);
-		if (sub->period_off >= sub->instance->runtime->period_size) {
-			sub->period_off %= sub->instance->runtime->period_size;
-			spin_unlock_irqrestore(&sub->lock, flags);
-			snd_pcm_period_elapsed(sub->instance);
-		} else
-			spin_unlock_irqrestore(&sub->lock, flags);
-	} else
-		spin_unlock_irqrestore(&sub->lock, flags);
+	period_elapsed = false;
+	scoped_guard(spinlock_irqsave, &sub->lock) {
+		if (sub->active) {
+			usb6fire_pcm_capture(sub, in_urb);
+			if (sub->period_off >= sub->instance->runtime->period_size) {
+				sub->period_off %= sub->instance->runtime->period_size;
+				period_elapsed = true;
+			}
+		}
+	}
+	if (period_elapsed)
+		snd_pcm_period_elapsed(sub->instance);
 
 	/* setup out urb structure */
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
@@ -338,17 +339,18 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	/* now send our playback data (if a free out urb was found) */
 	sub = &rt->playback;
-	spin_lock_irqsave(&sub->lock, flags);
-	if (sub->active) {
-		usb6fire_pcm_playback(sub, out_urb);
-		if (sub->period_off >= sub->instance->runtime->period_size) {
-			sub->period_off %= sub->instance->runtime->period_size;
-			spin_unlock_irqrestore(&sub->lock, flags);
-			snd_pcm_period_elapsed(sub->instance);
-		} else
-			spin_unlock_irqrestore(&sub->lock, flags);
-	} else
-		spin_unlock_irqrestore(&sub->lock, flags);
+	period_elapsed = false;
+	scoped_guard(spinlock_irqsave, &sub->lock) {
+		if (sub->active) {
+			usb6fire_pcm_playback(sub, out_urb);
+			if (sub->period_off >= sub->instance->runtime->period_size) {
+				sub->period_off %= sub->instance->runtime->period_size;
+				period_elapsed = true;
+			}
+		}
+	}
+	if (period_elapsed)
+		snd_pcm_period_elapsed(sub->instance);
 
 	/* setup the 4th byte of each sample (0x40 for analog channels) */
 	dest = out_urb->buffer;
@@ -392,7 +394,7 @@ static int usb6fire_pcm_open(struct snd_pcm_substream *alsa_sub)
 	if (rt->panic)
 		return -EPIPE;
 
-	mutex_lock(&rt->stream_mutex);
+	guard(mutex)(&rt->stream_mutex);
 	alsa_rt->hw = pcm_hw;
 
 	if (alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -408,14 +410,12 @@ static int usb6fire_pcm_open(struct snd_pcm_substream *alsa_sub)
 	}
 
 	if (!sub) {
-		mutex_unlock(&rt->stream_mutex);
 		dev_err(&rt->chip->dev->dev, "invalid stream type.\n");
 		return -EINVAL;
 	}
 
 	sub->instance = alsa_sub;
 	sub->active = false;
-	mutex_unlock(&rt->stream_mutex);
 	return 0;
 }
 
@@ -423,18 +423,17 @@ static int usb6fire_pcm_close(struct snd_pcm_substream *alsa_sub)
 {
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
 	struct pcm_substream *sub = usb6fire_pcm_get_substream(alsa_sub);
-	unsigned long flags;
 
 	if (rt->panic)
 		return 0;
 
-	mutex_lock(&rt->stream_mutex);
+	guard(mutex)(&rt->stream_mutex);
 	if (sub) {
 		/* deactivate substream */
-		spin_lock_irqsave(&sub->lock, flags);
-		sub->instance = NULL;
-		sub->active = false;
-		spin_unlock_irqrestore(&sub->lock, flags);
+		scoped_guard(spinlock_irqsave, &sub->lock) {
+			sub->instance = NULL;
+			sub->active = false;
+		}
 
 		/* all substreams closed? if so, stop streaming */
 		if (!rt->playback.instance && !rt->capture.instance) {
@@ -442,7 +441,6 @@ static int usb6fire_pcm_close(struct snd_pcm_substream *alsa_sub)
 			rt->rate = ARRAY_SIZE(rates);
 		}
 	}
-	mutex_unlock(&rt->stream_mutex);
 	return 0;
 }
 
@@ -458,7 +456,7 @@ static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 	if (!sub)
 		return -ENODEV;
 
-	mutex_lock(&rt->stream_mutex);
+	guard(mutex)(&rt->stream_mutex);
 	sub->dma_off = 0;
 	sub->period_off = 0;
 
@@ -467,7 +465,6 @@ static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 			if (alsa_rt->rate == rates[rt->rate])
 				break;
 		if (rt->rate == ARRAY_SIZE(rates)) {
-			mutex_unlock(&rt->stream_mutex);
 			dev_err(&rt->chip->dev->dev,
 				"invalid rate %d in prepare.\n",
 				alsa_rt->rate);
@@ -475,19 +472,15 @@ static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 		}
 
 		ret = usb6fire_pcm_set_rate(rt);
-		if (ret) {
-			mutex_unlock(&rt->stream_mutex);
+		if (ret)
 			return ret;
-		}
 		ret = usb6fire_pcm_stream_start(rt);
 		if (ret) {
-			mutex_unlock(&rt->stream_mutex);
 			dev_err(&rt->chip->dev->dev,
 				"could not start pcm stream.\n");
 			return ret;
 		}
 	}
-	mutex_unlock(&rt->stream_mutex);
 	return 0;
 }
 
@@ -495,26 +488,22 @@ static int usb6fire_pcm_trigger(struct snd_pcm_substream *alsa_sub, int cmd)
 {
 	struct pcm_substream *sub = usb6fire_pcm_get_substream(alsa_sub);
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
-	unsigned long flags;
 
 	if (rt->panic)
 		return -EPIPE;
 	if (!sub)
 		return -ENODEV;
 
+	guard(spinlock_irqsave)(&sub->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&sub->lock, flags);
 		sub->active = true;
-		spin_unlock_irqrestore(&sub->lock, flags);
 		return 0;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&sub->lock, flags);
 		sub->active = false;
-		spin_unlock_irqrestore(&sub->lock, flags);
 		return 0;
 
 	default:
@@ -527,15 +516,13 @@ static snd_pcm_uframes_t usb6fire_pcm_pointer(
 {
 	struct pcm_substream *sub = usb6fire_pcm_get_substream(alsa_sub);
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
-	unsigned long flags;
 	snd_pcm_uframes_t ret;
 
 	if (rt->panic || !sub)
 		return SNDRV_PCM_POS_XRUN;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	ret = sub->dma_off;
-	spin_unlock_irqrestore(&sub->lock, flags);
 	return ret;
 }
 
-- 
2.50.1

