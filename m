Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4D926B2D3
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900426; cv=none; b=Ua8RlA7cD/Y0Yk9ssvt+reWstk0mLDA9cbnrkB1WTw4Zr1pyJmJmBfN4aFdpa/BIv7ov8QqmLihe+mpCVi8f+81zy0F5UWt3S6T4tZA1NfokPzH+6s78Vcg8J4+VXBmohqODykdKau5i52yD9U5/OyVCydFWcb5CVGcb/jugOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900426; c=relaxed/simple;
	bh=nuhiKr1j7XIjSw+eEvbT88pTET9BRzn03iO2Fg0AL90=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Mds17CdTPX4aPDipCgBDByy1gMkBj0mTmGk6VmecJcvasoWwuxDQlAlhact2oL7VnLSk1qiQIdkCWCE8CngA88ygIVFYKjgbZACdI4y/XUyV2Zep8dPZBA+Ociu+lTY+FHIs7hAHtpgfyb4VS+xyHywf37qKzEZ/CfS7D5wuAjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e62glmVF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1AY0phDB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e62glmVF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1AY0phDB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e62glmVF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1AY0phDB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e62glmVF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1AY0phDB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A767433F59;
	Mon, 11 Aug 2025 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754900421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uPwSZ6sVCFKKD6IArikheGaFl2o7wxl/x5OkO5x/kCk=;
	b=e62glmVFM8pYCpbxBw8d0DlxTRE0OJE1Swtj6S29Zc3e3zfh2OfxmZa2MPpg1rhfxG5GIZ
	kVngrR5tYFnD9lVCRy/muvMjY6YwBla1jmfl+DyhGJxLsQ1GF/yig6xVdT2g1YyhChKYei
	Ho99K7gdcJ8U9ux/9cfZZR3yva6BmEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754900421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uPwSZ6sVCFKKD6IArikheGaFl2o7wxl/x5OkO5x/kCk=;
	b=1AY0phDBLh3V8Mos7DjYPaM+kX0VahA2ConcT8PB6FN5CyaS4l0epGkbYzmsdIHwoliie7
	Y3FaNRd1QOyHGACQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e62glmVF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1AY0phDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754900421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uPwSZ6sVCFKKD6IArikheGaFl2o7wxl/x5OkO5x/kCk=;
	b=e62glmVFM8pYCpbxBw8d0DlxTRE0OJE1Swtj6S29Zc3e3zfh2OfxmZa2MPpg1rhfxG5GIZ
	kVngrR5tYFnD9lVCRy/muvMjY6YwBla1jmfl+DyhGJxLsQ1GF/yig6xVdT2g1YyhChKYei
	Ho99K7gdcJ8U9ux/9cfZZR3yva6BmEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754900421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uPwSZ6sVCFKKD6IArikheGaFl2o7wxl/x5OkO5x/kCk=;
	b=1AY0phDBLh3V8Mos7DjYPaM+kX0VahA2ConcT8PB6FN5CyaS4l0epGkbYzmsdIHwoliie7
	Y3FaNRd1QOyHGACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8327913479;
	Mon, 11 Aug 2025 08:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1sVfHsWnmWiBZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 08:20:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Replace manual mutex/spinlock with guard()
Date: Mon, 11 Aug 2025 10:20:18 +0200
Message-ID: <20250811082019.31052-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: A767433F59
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This is another code cleanup by replacing the manual mutex or spinlock
with guard() macros.  usb_audio_disconnect() is slightly refactored
(split to another function) to apply guard() cleanly, but the rest are
rather straightforward conversions.

No functional changes but only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c          |  39 ++++++------
 sound/usb/endpoint.c      | 124 ++++++++++++++------------------------
 sound/usb/media.c         |   6 +-
 sound/usb/midi.c          |  66 ++++++++------------
 sound/usb/midi2.c         |  16 ++---
 sound/usb/mixer_s1810c.c  |  35 ++++-------
 sound/usb/mixer_us16x08.c |   3 +-
 sound/usb/pcm.c           |  72 +++++++++++-----------
 sound/usb/proc.c          |   3 +-
 9 files changed, 148 insertions(+), 216 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 10d9b7285597..0265206a8e8c 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -900,7 +900,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 
 	/* check whether it's already registered */
 	chip = NULL;
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	for (i = 0; i < SNDRV_CARDS; i++) {
 		if (usb_chip[i] && usb_chip[i]->dev == dev) {
 			if (atomic_read(&usb_chip[i]->shutdown)) {
@@ -1015,7 +1015,6 @@ static int usb_audio_probe(struct usb_interface *intf,
 
 	if (platform_ops && platform_ops->connect_cb)
 		platform_ops->connect_cb(chip);
-	mutex_unlock(&register_mutex);
 
 	return 0;
 
@@ -1033,7 +1032,6 @@ static int usb_audio_probe(struct usb_interface *intf,
 		if (!chip->num_interfaces)
 			snd_card_free(chip->card);
 	}
-	mutex_unlock(&register_mutex);
 	return err;
 }
 
@@ -1041,18 +1039,14 @@ static int usb_audio_probe(struct usb_interface *intf,
  * we need to take care of counter, since disconnection can be called also
  * many times as well as usb_audio_probe().
  */
-static void usb_audio_disconnect(struct usb_interface *intf)
+static bool __usb_audio_disconnect(struct usb_interface *intf,
+				   struct snd_usb_audio *chip,
+				   struct snd_card *card)
 {
-	struct snd_usb_audio *chip = usb_get_intfdata(intf);
-	struct snd_card *card;
 	struct list_head *p;
 
-	if (chip == USB_AUDIO_IFACE_UNUSED)
-		return;
+	guard(mutex)(&register_mutex);
 
-	card = chip->card;
-
-	mutex_lock(&register_mutex);
 	if (platform_ops && platform_ops->disconnect_cb)
 		platform_ops->disconnect_cb(chip);
 
@@ -1098,13 +1092,24 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 		usb_enable_autosuspend(interface_to_usbdev(intf));
 
 	chip->num_interfaces--;
-	if (chip->num_interfaces <= 0) {
-		usb_chip[chip->index] = NULL;
-		mutex_unlock(&register_mutex);
+	if (chip->num_interfaces > 0)
+		return false;
+
+	usb_chip[chip->index] = NULL;
+	return true;
+}
+
+static void usb_audio_disconnect(struct usb_interface *intf)
+{
+	struct snd_usb_audio *chip = usb_get_intfdata(intf);
+	struct snd_card *card;
+
+	if (chip == USB_AUDIO_IFACE_UNUSED)
+		return;
+
+	card = chip->card;
+	if (__usb_audio_disconnect(intf, chip, card))
 		snd_card_free_when_closed(card);
-	} else {
-		mutex_unlock(&register_mutex);
-	}
 }
 
 /* lock the shutdown (disconnect) task and autoresume */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 7b01e7b4e335..880f5afcce60 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -163,22 +163,19 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
 static int slave_next_packet_size(struct snd_usb_endpoint *ep,
 				  unsigned int avail)
 {
-	unsigned long flags;
 	unsigned int phase;
 	int ret;
 
 	if (ep->fill_max)
 		return ep->maxframesize;
 
-	spin_lock_irqsave(&ep->lock, flags);
+	guard(spinlock_irqsave)(&ep->lock);
 	phase = (ep->phase & 0xffff) + (ep->freqm << ep->datainterval);
 	ret = min(phase >> 16, ep->maxframesize);
 	if (avail && ret >= avail)
 		ret = -EAGAIN;
 	else
 		ep->phase = phase;
-	spin_unlock_irqrestore(&ep->lock, flags);
-
 	return ret;
 }
 
@@ -440,11 +437,8 @@ next_packet_fifo_dequeue(struct snd_usb_endpoint *ep)
 static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
 				    struct snd_urb_ctx *ctx)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&ep->lock, flags);
+	guard(spinlock_irqsave)(&ep->lock);
 	list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
-	spin_unlock_irqrestore(&ep->lock, flags);
 }
 
 /*
@@ -466,23 +460,21 @@ int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 	bool implicit_fb = snd_usb_endpoint_implicit_feedback_sink(ep);
 
 	while (ep_state_running(ep)) {
-
-		unsigned long flags;
 		struct snd_usb_packet_info *packet;
 		struct snd_urb_ctx *ctx = NULL;
 		int err, i;
 
-		spin_lock_irqsave(&ep->lock, flags);
-		if ((!implicit_fb || ep->next_packet_queued > 0) &&
-		    !list_empty(&ep->ready_playback_urbs)) {
-			/* take URB out of FIFO */
-			ctx = list_first_entry(&ep->ready_playback_urbs,
-					       struct snd_urb_ctx, ready_list);
-			list_del_init(&ctx->ready_list);
-			if (implicit_fb)
-				packet = next_packet_fifo_dequeue(ep);
+		scoped_guard(spinlock_irqsave, &ep->lock) {
+			if ((!implicit_fb || ep->next_packet_queued > 0) &&
+			    !list_empty(&ep->ready_playback_urbs)) {
+				/* take URB out of FIFO */
+				ctx = list_first_entry(&ep->ready_playback_urbs,
+						       struct snd_urb_ctx, ready_list);
+				list_del_init(&ctx->ready_list);
+				if (implicit_fb)
+					packet = next_packet_fifo_dequeue(ep);
+			}
 		}
-		spin_unlock_irqrestore(&ep->lock, flags);
 
 		if (ctx == NULL)
 			break;
@@ -768,12 +760,8 @@ bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
 				 const struct audioformat *fp,
 				 const struct snd_pcm_hw_params *params)
 {
-	bool ret;
-
-	mutex_lock(&chip->mutex);
-	ret = endpoint_compatible(ep, fp, params);
-	mutex_unlock(&chip->mutex);
-	return ret;
+	guard(mutex)(&chip->mutex);
+	return endpoint_compatible(ep, fp, params);
 }
 
 /*
@@ -799,11 +787,11 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 	struct snd_usb_endpoint *ep;
 	int ep_num = is_sync_ep ? fp->sync_ep : fp->endpoint;
 
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	ep = snd_usb_get_endpoint(chip, ep_num);
 	if (!ep) {
 		usb_audio_err(chip, "Cannot find EP 0x%x to open\n", ep_num);
-		goto unlock;
+		return NULL;
 	}
 
 	if (!ep->opened) {
@@ -820,17 +808,13 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 			      ep_num, ep->iface, ep->altsetting, ep->ep_idx);
 
 		ep->iface_ref = iface_ref_find(chip, ep->iface);
-		if (!ep->iface_ref) {
-			ep = NULL;
-			goto unlock;
-		}
+		if (!ep->iface_ref)
+			return NULL;
 
 		if (fp->protocol != UAC_VERSION_1) {
 			ep->clock_ref = clock_ref_find(chip, fp->clock);
-			if (!ep->clock_ref) {
-				ep = NULL;
-				goto unlock;
-			}
+			if (!ep->clock_ref)
+				return NULL;
 			ep->clock_ref->opened++;
 		}
 
@@ -859,16 +843,13 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 			      ep->implicit_fb_sync);
 
 	} else {
-		if (WARN_ON(!ep->iface_ref)) {
-			ep = NULL;
-			goto unlock;
-		}
+		if (WARN_ON(!ep->iface_ref))
+			return NULL;
 
 		if (!endpoint_compatible(ep, fp, params)) {
 			usb_audio_err(chip, "Incompatible EP setup for 0x%x\n",
 				      ep_num);
-			ep = NULL;
-			goto unlock;
+			return NULL;
 		}
 
 		usb_audio_dbg(chip, "Reopened EP 0x%x (count %d)\n",
@@ -879,9 +860,6 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		ep->iface_ref->need_setup = true;
 
 	ep->opened++;
-
- unlock:
-	mutex_unlock(&chip->mutex);
 	return ep;
 }
 
@@ -964,7 +942,7 @@ static int endpoint_set_interface(struct snd_usb_audio *chip,
 void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 			    struct snd_usb_endpoint *ep)
 {
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	usb_audio_dbg(chip, "Closing EP 0x%x (count %d)\n",
 		      ep->ep_num, ep->opened);
 
@@ -985,7 +963,6 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 		ep->clock_ref = NULL;
 		usb_audio_dbg(chip, "EP 0x%x closed\n", ep->ep_num);
 	}
-	mutex_unlock(&chip->mutex);
 }
 
 /* Prepare for suspening EP, called from the main suspend handler */
@@ -1047,7 +1024,6 @@ void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep)
 static int stop_urbs(struct snd_usb_endpoint *ep, bool force, bool keep_pending)
 {
 	unsigned int i;
-	unsigned long flags;
 
 	if (!force && atomic_read(&ep->running))
 		return -EBUSY;
@@ -1055,11 +1031,11 @@ static int stop_urbs(struct snd_usb_endpoint *ep, bool force, bool keep_pending)
 	if (!ep_state_update(ep, EP_STATE_RUNNING, EP_STATE_STOPPING))
 		return 0;
 
-	spin_lock_irqsave(&ep->lock, flags);
-	INIT_LIST_HEAD(&ep->ready_playback_urbs);
-	ep->next_packet_head = 0;
-	ep->next_packet_queued = 0;
-	spin_unlock_irqrestore(&ep->lock, flags);
+	scoped_guard(spinlock_irqsave, &ep->lock) {
+		INIT_LIST_HEAD(&ep->ready_playback_urbs);
+		ep->next_packet_head = 0;
+		ep->next_packet_queued = 0;
+	}
 
 	if (keep_pending)
 		return 0;
@@ -1360,16 +1336,16 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 				struct snd_usb_endpoint *ep)
 {
 	const struct audioformat *fmt = ep->cur_audiofmt;
-	int err = 0;
+	int err;
 
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	if (!ep->need_setup)
-		goto unlock;
+		return 0;
 
 	/* release old buffers, if any */
 	err = release_urbs(ep, false);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	ep->datainterval = fmt->datainterval;
 	ep->maxpacksize = fmt->maxpacksize;
@@ -1407,7 +1383,7 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "Set up %d URBS, ret=%d\n", ep->nurbs, err);
 
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* some unit conversions in runtime */
 	ep->maxframesize = ep->maxpacksize / ep->cur_frame_bytes;
@@ -1419,8 +1395,6 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 		err = 0;
 	}
 
- unlock:
-	mutex_unlock(&chip->mutex);
 	return err;
 }
 
@@ -1467,11 +1441,11 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	bool iface_first;
 	int err = 0;
 
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	if (WARN_ON(!ep->iface_ref))
-		goto unlock;
+		return 0;
 	if (!ep->need_prepare)
-		goto unlock;
+		return 0;
 
 	/* If the interface has been already set up, just set EP parameters */
 	if (!ep->iface_ref->need_setup) {
@@ -1481,7 +1455,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 		if (ep->cur_audiofmt->protocol == UAC_VERSION_1) {
 			err = init_sample_rate(chip, ep);
 			if (err < 0)
-				goto unlock;
+				return err;
 		}
 		goto done;
 	}
@@ -1499,37 +1473,33 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	if (iface_first) {
 		err = endpoint_set_interface(chip, ep, true);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 
 	err = snd_usb_init_pitch(chip, ep->cur_audiofmt);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	err = init_sample_rate(chip, ep);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	/* for UAC2/3, enable the interface altset here at last */
 	if (!iface_first) {
 		err = endpoint_set_interface(chip, ep, true);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 
 	ep->iface_ref->need_setup = false;
 
  done:
 	ep->need_prepare = false;
-	err = 1;
-
-unlock:
-	mutex_unlock(&chip->mutex);
-	return err;
+	return 1;
 }
 EXPORT_SYMBOL_GPL(snd_usb_endpoint_prepare);
 
@@ -1541,14 +1511,13 @@ int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
 
 	if (!clock)
 		return 0;
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	list_for_each_entry(ref, &chip->clock_ref_list, list) {
 		if (ref->clock == clock) {
 			rate = ref->rate;
 			break;
 		}
 	}
-	mutex_unlock(&chip->mutex);
 	return rate;
 }
 
@@ -1898,9 +1867,8 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 		 * If the frequency looks valid, set it.
 		 * This value is referred to in prepare_playback_urb().
 		 */
-		spin_lock_irqsave(&ep->lock, flags);
+		guard(spinlock_irqsave)(&ep->lock);
 		ep->freqm = f;
-		spin_unlock_irqrestore(&ep->lock, flags);
 	} else {
 		/*
 		 * Out of range; maybe the shift value is wrong.
diff --git a/sound/usb/media.c b/sound/usb/media.c
index d48db6f3ae65..0064f8d12422 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -140,11 +140,10 @@ int snd_media_start_pipeline(struct snd_usb_substream *subs)
 	if (!mctl)
 		return 0;
 
-	mutex_lock(&mctl->media_dev->graph_mutex);
+	guard(mutex)(&mctl->media_dev->graph_mutex);
 	if (mctl->media_dev->enable_source)
 		ret = mctl->media_dev->enable_source(&mctl->media_entity,
 						     &mctl->media_pipe);
-	mutex_unlock(&mctl->media_dev->graph_mutex);
 	return ret;
 }
 
@@ -155,10 +154,9 @@ void snd_media_stop_pipeline(struct snd_usb_substream *subs)
 	if (!mctl)
 		return;
 
-	mutex_lock(&mctl->media_dev->graph_mutex);
+	guard(mutex)(&mctl->media_dev->graph_mutex);
 	if (mctl->media_dev->disable_source)
 		mctl->media_dev->disable_source(&mctl->media_entity);
-	mutex_unlock(&mctl->media_dev->graph_mutex);
 }
 
 static int snd_media_mixer_init(struct snd_usb_audio *chip)
diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index acb3bf92857c..1912d59627bd 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -265,16 +265,15 @@ static void snd_usbmidi_out_urb_complete(struct urb *urb)
 	struct out_urb_context *context = urb->context;
 	struct snd_usb_midi_out_endpoint *ep = context->ep;
 	unsigned int urb_index;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ep->buffer_lock, flags);
-	urb_index = context - ep->urbs;
-	ep->active_urbs &= ~(1 << urb_index);
-	if (unlikely(ep->drain_urbs)) {
-		ep->drain_urbs &= ~(1 << urb_index);
-		wake_up(&ep->drain_wait);
+	scoped_guard(spinlock_irqsave, &ep->buffer_lock) {
+		urb_index = context - ep->urbs;
+		ep->active_urbs &= ~(1 << urb_index);
+		if (unlikely(ep->drain_urbs)) {
+			ep->drain_urbs &= ~(1 << urb_index);
+			wake_up(&ep->drain_wait);
+		}
 	}
-	spin_unlock_irqrestore(&ep->buffer_lock, flags);
 	if (urb->status < 0) {
 		int err = snd_usbmidi_urb_error(urb);
 		if (err < 0) {
@@ -295,13 +294,10 @@ static void snd_usbmidi_do_output(struct snd_usb_midi_out_endpoint *ep)
 {
 	unsigned int urb_index;
 	struct urb *urb;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ep->buffer_lock, flags);
-	if (ep->umidi->disconnected) {
-		spin_unlock_irqrestore(&ep->buffer_lock, flags);
+	guard(spinlock_irqsave)(&ep->buffer_lock);
+	if (ep->umidi->disconnected)
 		return;
-	}
 
 	urb_index = ep->next_urb;
 	for (;;) {
@@ -325,7 +321,6 @@ static void snd_usbmidi_do_output(struct snd_usb_midi_out_endpoint *ep)
 			break;
 	}
 	ep->next_urb = urb_index;
-	spin_unlock_irqrestore(&ep->buffer_lock, flags);
 }
 
 static void snd_usbmidi_out_work(struct work_struct *work)
@@ -342,9 +337,8 @@ static void snd_usbmidi_error_timer(struct timer_list *t)
 	struct snd_usb_midi *umidi = timer_container_of(umidi, t, error_timer);
 	unsigned int i, j;
 
-	spin_lock(&umidi->disc_lock);
+	guard(spinlock)(&umidi->disc_lock);
 	if (umidi->disconnected) {
-		spin_unlock(&umidi->disc_lock);
 		return;
 	}
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
@@ -361,7 +355,6 @@ static void snd_usbmidi_error_timer(struct timer_list *t)
 		if (umidi->endpoints[i].out)
 			snd_usbmidi_do_output(umidi->endpoints[i].out);
 	}
-	spin_unlock(&umidi->disc_lock);
 }
 
 /* helper function to send static data that may not DMA-able */
@@ -1148,13 +1141,11 @@ static int substream_open(struct snd_rawmidi_substream *substream, int dir,
 	struct snd_usb_midi *umidi = substream->rmidi->private_data;
 	struct snd_kcontrol *ctl;
 
-	down_read(&umidi->disc_rwsem);
-	if (umidi->disconnected) {
-		up_read(&umidi->disc_rwsem);
+	guard(rwsem_read)(&umidi->disc_rwsem);
+	if (umidi->disconnected)
 		return open ? -ENODEV : 0;
-	}
 
-	mutex_lock(&umidi->mutex);
+	guard(mutex)(&umidi->mutex);
 	if (open) {
 		if (!umidi->opened[0] && !umidi->opened[1]) {
 			if (umidi->roland_load_ctl) {
@@ -1183,8 +1174,6 @@ static int substream_open(struct snd_rawmidi_substream *substream, int dir,
 			}
 		}
 	}
-	mutex_unlock(&umidi->mutex);
-	up_read(&umidi->disc_rwsem);
 	return 0;
 }
 
@@ -1548,11 +1537,10 @@ void snd_usbmidi_disconnect(struct list_head *p)
 	 * a timer may submit an URB. To reliably break the cycle
 	 * a flag under lock must be used
 	 */
-	down_write(&umidi->disc_rwsem);
-	spin_lock_irq(&umidi->disc_lock);
-	umidi->disconnected = 1;
-	spin_unlock_irq(&umidi->disc_lock);
-	up_write(&umidi->disc_rwsem);
+	scoped_guard(rwsem_write, &umidi->disc_rwsem) {
+		guard(spinlock_irq)(&umidi->disc_lock);
+		umidi->disconnected = 1;
+	}
 
 	timer_shutdown_sync(&umidi->error_timer);
 
@@ -2094,11 +2082,10 @@ static int roland_load_put(struct snd_kcontrol *kcontrol,
 
 	if (value->value.enumerated.item[0] > 1)
 		return -EINVAL;
-	mutex_lock(&umidi->mutex);
+	guard(mutex)(&umidi->mutex);
 	changed = value->value.enumerated.item[0] != kcontrol->private_value;
 	if (changed)
 		kcontrol->private_value = value->value.enumerated.item[0];
-	mutex_unlock(&umidi->mutex);
 	return changed;
 }
 
@@ -2448,18 +2435,17 @@ static void snd_usbmidi_input_start_ep(struct snd_usb_midi *umidi,
 				       struct snd_usb_midi_in_endpoint *ep)
 {
 	unsigned int i;
-	unsigned long flags;
 
 	if (!ep)
 		return;
 	for (i = 0; i < INPUT_URBS; ++i) {
 		struct urb *urb = ep->urbs[i];
-		spin_lock_irqsave(&umidi->disc_lock, flags);
-		if (!atomic_read(&urb->use_count)) {
-			urb->dev = ep->umidi->dev;
-			snd_usbmidi_submit_urb(urb, GFP_ATOMIC);
+		scoped_guard(spinlock_irqsave, &umidi->disc_lock) {
+			if (!atomic_read(&urb->use_count)) {
+				urb->dev = ep->umidi->dev;
+				snd_usbmidi_submit_urb(urb, GFP_ATOMIC);
+			}
 		}
-		spin_unlock_irqrestore(&umidi->disc_lock, flags);
 	}
 }
 
@@ -2488,9 +2474,8 @@ void snd_usbmidi_suspend(struct list_head *p)
 	struct snd_usb_midi *umidi;
 
 	umidi = list_entry(p, struct snd_usb_midi, list);
-	mutex_lock(&umidi->mutex);
+	guard(mutex)(&umidi->mutex);
 	snd_usbmidi_input_stop(p);
-	mutex_unlock(&umidi->mutex);
 }
 EXPORT_SYMBOL(snd_usbmidi_suspend);
 
@@ -2502,9 +2487,8 @@ void snd_usbmidi_resume(struct list_head *p)
 	struct snd_usb_midi *umidi;
 
 	umidi = list_entry(p, struct snd_usb_midi, list);
-	mutex_lock(&umidi->mutex);
+	guard(mutex)(&umidi->mutex);
 	snd_usbmidi_input_start(p);
-	mutex_unlock(&umidi->mutex);
 }
 EXPORT_SYMBOL(snd_usbmidi_resume);
 
diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 030569fda416..e6793f3bdfc3 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -160,15 +160,13 @@ static void output_urb_complete(struct urb *urb)
 {
 	struct snd_usb_midi2_urb *ctx = urb->context;
 	struct snd_usb_midi2_endpoint *ep = ctx->ep;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ep->lock, flags);
+	guard(spinlock_irqsave)(&ep->lock);
 	set_bit(ctx->index, &ep->urb_free);
 	if (urb->status >= 0 && atomic_read(&ep->running))
 		submit_output_urbs_locked(ep);
 	if (ep->urb_free == ep->urb_free_mask)
 		wake_up(&ep->wait);
-	spin_unlock_irqrestore(&ep->lock, flags);
 }
 
 /* prepare for input submission: just set the buffer length */
@@ -189,10 +187,9 @@ static void input_urb_complete(struct urb *urb)
 {
 	struct snd_usb_midi2_urb *ctx = urb->context;
 	struct snd_usb_midi2_endpoint *ep = ctx->ep;
-	unsigned long flags;
 	int len;
 
-	spin_lock_irqsave(&ep->lock, flags);
+	guard(spinlock_irqsave)(&ep->lock);
 	if (ep->disconnected || urb->status < 0)
 		goto dequeue;
 	len = urb->actual_length;
@@ -208,22 +205,18 @@ static void input_urb_complete(struct urb *urb)
 	submit_input_urbs_locked(ep);
 	if (ep->urb_free == ep->urb_free_mask)
 		wake_up(&ep->wait);
-	spin_unlock_irqrestore(&ep->lock, flags);
 }
 
 /* URB submission helper; for both direction */
 static void submit_io_urbs(struct snd_usb_midi2_endpoint *ep)
 {
-	unsigned long flags;
-
 	if (!ep)
 		return;
-	spin_lock_irqsave(&ep->lock, flags);
+	guard(spinlock_irqsave)(&ep->lock);
 	if (ep->direction == STR_IN)
 		submit_input_urbs_locked(ep);
 	else
 		submit_output_urbs_locked(ep);
-	spin_unlock_irqrestore(&ep->lock, flags);
 }
 
 /* kill URBs for close, suspend and disconnect */
@@ -248,13 +241,12 @@ static void drain_urb_queue(struct snd_usb_midi2_endpoint *ep)
 {
 	if (!ep)
 		return;
-	spin_lock_irq(&ep->lock);
+	guard(spinlock_irq)(&ep->lock);
 	atomic_set(&ep->running, 0);
 	wait_event_lock_irq_timeout(ep->wait,
 				    ep->disconnected ||
 				    ep->urb_free == ep->urb_free_mask,
 				    ep->lock, msecs_to_jiffies(500));
-	spin_unlock_irq(&ep->lock);
 }
 
 /* release URBs for an EP */
diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index fac4bbc6b275..bee2a65fd3c9 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -338,18 +338,16 @@ snd_s1810c_get_switch_state(struct usb_mixer_interface *mixer,
 	struct s1810_mixer_state *private = mixer->private_data;
 	u32 field = 0;
 	u32 ctl_idx = (u32) (kctl->private_value & 0xFF);
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&private->usb_mutex);
+	guard(mutex)(&private->usb_mutex);
 	ret = snd_sc1810c_get_status_field(chip->dev, &field,
 					   ctl_idx, &private->seqnum);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 
 	*state = field;
- unlock:
-	mutex_unlock(&private->usb_mutex);
-	return ret ? ret : 0;
+	return ret;
 }
 
 /*
@@ -366,12 +364,9 @@ snd_s1810c_set_switch_state(struct usb_mixer_interface *mixer,
 	u32 pval = (u32) kctl->private_value;
 	u32 ctl_id = (pval >> 8) & 0xFF;
 	u32 ctl_val = (pval >> 16) & 0x1;
-	int ret = 0;
 
-	mutex_lock(&private->usb_mutex);
-	ret = snd_s1810c_send_ctl_packet(chip->dev, 0, 0, 0, ctl_id, ctl_val);
-	mutex_unlock(&private->usb_mutex);
-	return ret;
+	guard(mutex)(&private->usb_mutex);
+	return snd_s1810c_send_ctl_packet(chip->dev, 0, 0, 0, ctl_id, ctl_val);
 }
 
 /* Generic get/set/init functions for switch controls */
@@ -386,12 +381,12 @@ snd_s1810c_switch_get(struct snd_kcontrol *kctl,
 	u32 pval = (u32) kctl->private_value;
 	u32 ctl_idx = pval & 0xFF;
 	u32 state = 0;
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 	ret = snd_s1810c_get_switch_state(mixer, kctl, &state);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 
 	switch (ctl_idx) {
 	case SC1810C_STATE_LINE_SW:
@@ -402,9 +397,7 @@ snd_s1810c_switch_get(struct snd_kcontrol *kctl,
 		ctl_elem->value.integer.value[0] = (long)state;
 	}
 
- unlock:
-	mutex_unlock(&private->data_mutex);
-	return (ret < 0) ? ret : 0;
+	return 0;
 }
 
 static int
@@ -420,10 +413,10 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 	u32 newval = 0;
 	int ret = 0;
 
-	mutex_lock(&private->data_mutex);
+	guard(mutex)(&private->data_mutex);
 	ret = snd_s1810c_get_switch_state(mixer, kctl, &curval);
 	if (ret < 0)
-		goto unlock;
+		return ret;
 
 	switch (ctl_idx) {
 	case SC1810C_STATE_LINE_SW:
@@ -435,14 +428,12 @@ snd_s1810c_switch_set(struct snd_kcontrol *kctl,
 	}
 
 	if (curval == newval)
-		goto unlock;
+		return 0;
 
 	kctl->private_value &= ~(0x1 << 16);
 	kctl->private_value |= (unsigned int)(newval & 0x1) << 16;
 	ret = snd_s1810c_set_switch_state(mixer, kctl);
 
- unlock:
-	mutex_unlock(&private->data_mutex);
 	return (ret < 0) ? 0 : 1;
 }
 
diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index 236b69054867..1c5712c31f5e 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -152,12 +152,11 @@ static int snd_us16x08_recv_urb(struct snd_usb_audio *chip,
 	unsigned char *buf, int size)
 {
 
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	snd_usb_ctl_msg(chip->dev,
 		usb_rcvctrlpipe(chip->dev, 0),
 		SND_US16X08_URB_METER_REQUEST,
 		SND_US16X08_URB_METER_REQUESTTYPE, 0, 0, buf, size);
-	mutex_unlock(&chip->mutex);
 	return 0;
 }
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index bff92505e408..c52fd0989c93 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -77,10 +77,10 @@ static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream
 
 	if (atomic_read(&subs->stream->chip->shutdown))
 		return SNDRV_PCM_POS_XRUN;
-	spin_lock(&subs->lock);
-	hwptr_done = subs->hwptr_done;
-	runtime->delay = snd_usb_pcm_delay(subs, runtime);
-	spin_unlock(&subs->lock);
+	scoped_guard(spinlock, &subs->lock) {
+		hwptr_done = subs->hwptr_done;
+		runtime->delay = snd_usb_pcm_delay(subs, runtime);
+	}
 	return bytes_to_frames(runtime, hwptr_done);
 }
 
@@ -560,9 +560,9 @@ int snd_usb_hw_params(struct snd_usb_substream *subs,
 					  subs->sync_endpoint);
 	}
 
-	mutex_lock(&chip->mutex);
-	subs->cur_audiofmt = fmt;
-	mutex_unlock(&chip->mutex);
+	scoped_guard(mutex, &chip->mutex) {
+		subs->cur_audiofmt = fmt;
+	}
 
 	if (!subs->data_endpoint->need_setup)
 		goto unlock;
@@ -611,9 +611,9 @@ int snd_usb_hw_free(struct snd_usb_substream *subs)
 	struct snd_usb_audio *chip = subs->stream->chip;
 
 	snd_media_stop_pipeline(subs);
-	mutex_lock(&chip->mutex);
-	subs->cur_audiofmt = NULL;
-	mutex_unlock(&chip->mutex);
+	scoped_guard(mutex, &chip->mutex) {
+		subs->cur_audiofmt = NULL;
+	}
 	if (!snd_usb_lock_shutdown(chip)) {
 		if (stop_endpoints(subs, false))
 			sync_pending_stops(subs);
@@ -1244,13 +1244,11 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
-	mutex_lock(&chip->mutex);
-	if (subs->opened) {
-		mutex_unlock(&chip->mutex);
-		return -EBUSY;
+	scoped_guard(mutex, &chip->mutex) {
+		if (subs->opened)
+			return -EBUSY;
+		subs->opened = 1;
 	}
-	subs->opened = 1;
-	mutex_unlock(&chip->mutex);
 
 	runtime->hw = snd_usb_hardware;
 	/* need an explicit sync to catch applptr update in low-latency mode */
@@ -1281,9 +1279,9 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 err_resume:
 	snd_usb_autosuspend(subs->stream->chip);
 err_open:
-	mutex_lock(&chip->mutex);
-	subs->opened = 0;
-	mutex_unlock(&chip->mutex);
+	scoped_guard(mutex, &chip->mutex) {
+		subs->opened = 0;
+	}
 
 	return ret;
 }
@@ -1307,9 +1305,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	subs->pcm_substream = NULL;
 	snd_usb_autosuspend(subs->stream->chip);
-	mutex_lock(&chip->mutex);
-	subs->opened = 0;
-	mutex_unlock(&chip->mutex);
+	scoped_guard(mutex, &chip->mutex) {
+		subs->opened = 0;
+	}
 
 	return 0;
 }
@@ -1325,7 +1323,6 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
 	unsigned int stride, frames, bytes, oldptr;
 	int i, period_elapsed = 0;
-	unsigned long flags;
 	unsigned char *cp;
 	int current_frame_number;
 
@@ -1358,22 +1355,21 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 							oldbytes, bytes);
 		}
 		/* update the current pointer */
-		spin_lock_irqsave(&subs->lock, flags);
-		oldptr = subs->hwptr_done;
-		subs->hwptr_done += bytes;
-		if (subs->hwptr_done >= subs->buffer_bytes)
-			subs->hwptr_done -= subs->buffer_bytes;
-		frames = (bytes + (oldptr % stride)) / stride;
-		subs->transfer_done += frames;
-		if (subs->transfer_done >= runtime->period_size) {
-			subs->transfer_done -= runtime->period_size;
-			period_elapsed = 1;
+		scoped_guard(spinlock_irqsave, &subs->lock) {
+			oldptr = subs->hwptr_done;
+			subs->hwptr_done += bytes;
+			if (subs->hwptr_done >= subs->buffer_bytes)
+				subs->hwptr_done -= subs->buffer_bytes;
+			frames = (bytes + (oldptr % stride)) / stride;
+			subs->transfer_done += frames;
+			if (subs->transfer_done >= runtime->period_size) {
+				subs->transfer_done -= runtime->period_size;
+				period_elapsed = 1;
+			}
+
+			/* realign last_frame_number */
+			subs->last_frame_number = current_frame_number;
 		}
-
-		/* realign last_frame_number */
-		subs->last_frame_number = current_frame_number;
-
-		spin_unlock_irqrestore(&subs->lock, flags);
 		/* copy a data chunk */
 		if (oldptr + bytes > subs->buffer_bytes) {
 			unsigned int bytes1 = subs->buffer_bytes - oldptr;
diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index c8b967bd7065..f4b7a7ff3203 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -193,7 +193,7 @@ static void proc_dump_substream_status(struct snd_usb_audio *chip,
 				       struct snd_usb_substream *subs,
 				       struct snd_info_buffer *buffer)
 {
-	mutex_lock(&chip->mutex);
+	guard(mutex)(&chip->mutex);
 	if (subs->running) {
 		snd_iprintf(buffer, "  Status: Running\n");
 		if (subs->cur_audiofmt) {
@@ -204,7 +204,6 @@ static void proc_dump_substream_status(struct snd_usb_audio *chip,
 	} else {
 		snd_iprintf(buffer, "  Status: Stop\n");
 	}
-	mutex_unlock(&chip->mutex);
 }
 
 static void proc_pcm_format_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
-- 
2.50.1

