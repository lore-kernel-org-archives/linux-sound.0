Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E731E111
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480058; cv=none; b=gOHMu+xDp5c+rOzmLYt9VYN6hMyyQLoTqoEjZ7vC/nMOeY7kP5ZjAnnrRTdrIR4vGfz79chLvkjyQQ+MdVz002J0yirospjghmzaAEoQMRyTJ9iz/osJjiWrL5X64vF8yaPOteRcMcOHhHjWea18NPRf+P28zsBz6j4ZxRHjob0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480058; c=relaxed/simple;
	bh=pb3asPhou+fP9RE5r2NnTZbIsyjUg7V14b6Lp8KLwQU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkdAz8xwR1YlP4I3bhddfwThGKQR2Tg5DaKci/l+tLjxj1yAA1iEUYqw02sgyQ7H+/ihrHOlJAi/SDxCAhqEBznU78amyx7hsDYxTSV0hsgZS1Yl9uAU4ngG9rjMFpqmC0vWAo1fQkd4AMozjkdRxhNVpwLdsMw6J/S6v0dTbuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mt0hdxaH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6WxcxhuB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mt0hdxaH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6WxcxhuB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mt0hdxaH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WxcxhuB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mt0hdxaH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6WxcxhuB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8AE7E5C24B;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPM+jn/VqWAXwlxuIBfMCEew4Zj3Qu3ZCdlEJT+JqIE=;
	b=mt0hdxaHLnVSVUA1cPUEajpWs6QQxm6+qFS9rsO/Ifja4Affc+yW+nhib5nNV/1zbfabeH
	vs8ej2U/yVQdc1i+Gx/ix7EK5h9mwlxwTIdCAKplcFKEwlgfYUUmCzd5srAEnzCvxsu+rl
	OKDNtybXYqbxVWNL4YuvKHyrdK0crHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPM+jn/VqWAXwlxuIBfMCEew4Zj3Qu3ZCdlEJT+JqIE=;
	b=6WxcxhuBwGPaGYDemynF3YvUtTip1sxEGLgiOPcwXIXfXZbP1XqIk/GeyU1W0cZ3TqPeuX
	WQbjojAJUvTgJsCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mt0hdxaH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6WxcxhuB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPM+jn/VqWAXwlxuIBfMCEew4Zj3Qu3ZCdlEJT+JqIE=;
	b=mt0hdxaHLnVSVUA1cPUEajpWs6QQxm6+qFS9rsO/Ifja4Affc+yW+nhib5nNV/1zbfabeH
	vs8ej2U/yVQdc1i+Gx/ix7EK5h9mwlxwTIdCAKplcFKEwlgfYUUmCzd5srAEnzCvxsu+rl
	OKDNtybXYqbxVWNL4YuvKHyrdK0crHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPM+jn/VqWAXwlxuIBfMCEew4Zj3Qu3ZCdlEJT+JqIE=;
	b=6WxcxhuBwGPaGYDemynF3YvUtTip1sxEGLgiOPcwXIXfXZbP1XqIk/GeyU1W0cZ3TqPeuX
	WQbjojAJUvTgJsCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CA6113326;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SD1DGTbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/9] ALSA: ua101: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:07:10 +0200
Message-ID: <20250829150724.6886-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8AE7E5C24B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/misc/ua101.c | 165 +++++++++++++++++++----------------------
 1 file changed, 77 insertions(+), 88 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 1c4a266018bb..76b6eb55dcc2 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -171,7 +171,6 @@ static void playback_urb_complete(struct urb *usb_urb)
 {
 	struct ua101_urb *urb = (struct ua101_urb *)usb_urb;
 	struct ua101 *ua = urb->urb.context;
-	unsigned long flags;
 
 	if (unlikely(urb->urb.status == -ENOENT ||	/* unlinked */
 		     urb->urb.status == -ENODEV ||	/* device removed */
@@ -184,14 +183,13 @@ static void playback_urb_complete(struct urb *usb_urb)
 
 	if (test_bit(USB_PLAYBACK_RUNNING, &ua->states)) {
 		/* append URB to FIFO */
-		spin_lock_irqsave(&ua->lock, flags);
+		guard(spinlock_irqsave)(&ua->lock);
 		list_add_tail(&urb->ready_list, &ua->ready_playback_urbs);
 		if (ua->rate_feedback_count > 0)
 			queue_work(system_highpri_wq, &ua->playback_work);
 		ua->playback.substream->runtime->delay -=
 				urb->urb.iso_frame_desc[0].length /
 						ua->playback.frame_bytes;
-		spin_unlock_irqrestore(&ua->lock, flags);
 	}
 }
 
@@ -249,7 +247,6 @@ static inline void add_with_wraparound(struct ua101 *ua,
 static void playback_work(struct work_struct *work)
 {
 	struct ua101 *ua = container_of(work, struct ua101, playback_work);
-	unsigned long flags;
 	unsigned int frames;
 	struct ua101_urb *urb;
 	bool do_period_elapsed = false;
@@ -269,43 +266,43 @@ static void playback_work(struct work_struct *work)
 	 * submitting playback URBs is possible as long as both FIFOs are
 	 * nonempty.
 	 */
-	spin_lock_irqsave(&ua->lock, flags);
-	while (ua->rate_feedback_count > 0 &&
-	       !list_empty(&ua->ready_playback_urbs)) {
-		/* take packet size out of FIFO */
-		frames = ua->rate_feedback[ua->rate_feedback_start];
-		add_with_wraparound(ua, &ua->rate_feedback_start, 1);
-		ua->rate_feedback_count--;
+	scoped_guard(spinlock_irqsave, &ua->lock) {
+		while (ua->rate_feedback_count > 0 &&
+		       !list_empty(&ua->ready_playback_urbs)) {
+			/* take packet size out of FIFO */
+			frames = ua->rate_feedback[ua->rate_feedback_start];
+			add_with_wraparound(ua, &ua->rate_feedback_start, 1);
+			ua->rate_feedback_count--;
 
-		/* take URB out of FIFO */
-		urb = list_first_entry(&ua->ready_playback_urbs,
-				       struct ua101_urb, ready_list);
-		list_del(&urb->ready_list);
+			/* take URB out of FIFO */
+			urb = list_first_entry(&ua->ready_playback_urbs,
+					       struct ua101_urb, ready_list);
+			list_del(&urb->ready_list);
 
-		/* fill packet with data or silence */
-		urb->urb.iso_frame_desc[0].length =
-			frames * ua->playback.frame_bytes;
-		if (test_bit(ALSA_PLAYBACK_RUNNING, &ua->states))
-			do_period_elapsed |= copy_playback_data(&ua->playback,
-								&urb->urb,
-								frames);
-		else
-			memset(urb->urb.transfer_buffer, 0,
-			       urb->urb.iso_frame_desc[0].length);
+			/* fill packet with data or silence */
+			urb->urb.iso_frame_desc[0].length =
+				frames * ua->playback.frame_bytes;
+			if (test_bit(ALSA_PLAYBACK_RUNNING, &ua->states))
+				do_period_elapsed |= copy_playback_data(&ua->playback,
+									&urb->urb,
+									frames);
+			else
+				memset(urb->urb.transfer_buffer, 0,
+				       urb->urb.iso_frame_desc[0].length);
 
-		/* and off you go ... */
-		err = usb_submit_urb(&urb->urb, GFP_ATOMIC);
-		if (unlikely(err < 0)) {
-			spin_unlock_irqrestore(&ua->lock, flags);
-			abort_usb_playback(ua);
-			abort_alsa_playback(ua);
-			dev_err(&ua->dev->dev, "USB request error %d: %s\n",
-				err, usb_error_string(err));
-			return;
+			/* and off you go ... */
+			err = usb_submit_urb(&urb->urb, GFP_ATOMIC);
+			if (unlikely(err < 0)) {
+				abort_usb_playback(ua);
+				abort_alsa_playback(ua);
+				dev_err(&ua->dev->dev, "USB request error %d: %s\n",
+					err, usb_error_string(err));
+				return;
+			}
+			ua->playback.substream->runtime->delay += frames;
 		}
-		ua->playback.substream->runtime->delay += frames;
 	}
-	spin_unlock_irqrestore(&ua->lock, flags);
+
 	if (do_period_elapsed)
 		snd_pcm_period_elapsed(ua->playback.substream);
 }
@@ -347,7 +344,6 @@ static void capture_urb_complete(struct urb *urb)
 {
 	struct ua101 *ua = urb->context;
 	struct ua101_stream *stream = &ua->capture;
-	unsigned long flags;
 	unsigned int frames, write_ptr;
 	bool do_period_elapsed;
 	int err;
@@ -364,47 +360,45 @@ static void capture_urb_complete(struct urb *urb)
 	else
 		frames = 0;
 
-	spin_lock_irqsave(&ua->lock, flags);
+	scoped_guard(spinlock_irqsave, &ua->lock) {
 
-	if (frames > 0 && test_bit(ALSA_CAPTURE_RUNNING, &ua->states))
-		do_period_elapsed = copy_capture_data(stream, urb, frames);
-	else
-		do_period_elapsed = false;
+		if (frames > 0 && test_bit(ALSA_CAPTURE_RUNNING, &ua->states))
+			do_period_elapsed = copy_capture_data(stream, urb, frames);
+		else
+			do_period_elapsed = false;
 
-	if (test_bit(USB_CAPTURE_RUNNING, &ua->states)) {
-		err = usb_submit_urb(urb, GFP_ATOMIC);
-		if (unlikely(err < 0)) {
-			spin_unlock_irqrestore(&ua->lock, flags);
-			dev_err(&ua->dev->dev, "USB request error %d: %s\n",
-				err, usb_error_string(err));
-			goto stream_stopped;
+		if (test_bit(USB_CAPTURE_RUNNING, &ua->states)) {
+			err = usb_submit_urb(urb, GFP_ATOMIC);
+			if (unlikely(err < 0)) {
+				dev_err(&ua->dev->dev, "USB request error %d: %s\n",
+					err, usb_error_string(err));
+				goto stream_stopped;
+			}
+
+			/* append packet size to FIFO */
+			write_ptr = ua->rate_feedback_start;
+			add_with_wraparound(ua, &write_ptr, ua->rate_feedback_count);
+			ua->rate_feedback[write_ptr] = frames;
+			if (ua->rate_feedback_count < ua->playback.queue_length) {
+				ua->rate_feedback_count++;
+				if (ua->rate_feedback_count ==
+				    ua->playback.queue_length)
+					wake_up(&ua->rate_feedback_wait);
+			} else {
+				/*
+				 * Ring buffer overflow; this happens when the playback
+				 * stream is not running.  Throw away the oldest entry,
+				 * so that the playback stream, when it starts, sees
+				 * the most recent packet sizes.
+				 */
+				add_with_wraparound(ua, &ua->rate_feedback_start, 1);
+			}
+			if (test_bit(USB_PLAYBACK_RUNNING, &ua->states) &&
+			    !list_empty(&ua->ready_playback_urbs))
+				queue_work(system_highpri_wq, &ua->playback_work);
 		}
-
-		/* append packet size to FIFO */
-		write_ptr = ua->rate_feedback_start;
-		add_with_wraparound(ua, &write_ptr, ua->rate_feedback_count);
-		ua->rate_feedback[write_ptr] = frames;
-		if (ua->rate_feedback_count < ua->playback.queue_length) {
-			ua->rate_feedback_count++;
-			if (ua->rate_feedback_count ==
-						ua->playback.queue_length)
-				wake_up(&ua->rate_feedback_wait);
-		} else {
-			/*
-			 * Ring buffer overflow; this happens when the playback
-			 * stream is not running.  Throw away the oldest entry,
-			 * so that the playback stream, when it starts, sees
-			 * the most recent packet sizes.
-			 */
-			add_with_wraparound(ua, &ua->rate_feedback_start, 1);
-		}
-		if (test_bit(USB_PLAYBACK_RUNNING, &ua->states) &&
-		    !list_empty(&ua->ready_playback_urbs))
-			queue_work(system_highpri_wq, &ua->playback_work);
 	}
 
-	spin_unlock_irqrestore(&ua->lock, flags);
-
 	if (do_period_elapsed)
 		snd_pcm_period_elapsed(stream->substream);
 
@@ -558,9 +552,9 @@ static int start_usb_playback(struct ua101 *ua)
 	clear_bit(PLAYBACK_URB_COMPLETED, &ua->states);
 	ua->playback.urbs[0]->urb.complete =
 		first_playback_urb_complete;
-	spin_lock_irq(&ua->lock);
-	INIT_LIST_HEAD(&ua->ready_playback_urbs);
-	spin_unlock_irq(&ua->lock);
+	scoped_guard(spinlock_irq, &ua->lock) {
+		INIT_LIST_HEAD(&ua->ready_playback_urbs);
+	}
 
 	/*
 	 * We submit the initial URBs all at once, so we have to wait for the
@@ -581,11 +575,11 @@ static int start_usb_playback(struct ua101 *ua)
 
 	for (i = 0; i < ua->playback.queue_length; ++i) {
 		/* all initial URBs contain silence */
-		spin_lock_irq(&ua->lock);
-		frames = ua->rate_feedback[ua->rate_feedback_start];
-		add_with_wraparound(ua, &ua->rate_feedback_start, 1);
-		ua->rate_feedback_count--;
-		spin_unlock_irq(&ua->lock);
+		scoped_guard(spinlock_irq, &ua->lock) {
+			frames = ua->rate_feedback[ua->rate_feedback_start];
+			add_with_wraparound(ua, &ua->rate_feedback_start, 1);
+			ua->rate_feedback_count--;
+		}
 		urb = &ua->playback.urbs[i]->urb;
 		urb->iso_frame_desc[0].length =
 			frames * ua->playback.frame_bytes;
@@ -834,13 +828,8 @@ static int playback_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 static inline snd_pcm_uframes_t ua101_pcm_pointer(struct ua101 *ua,
 						  struct ua101_stream *stream)
 {
-	unsigned long flags;
-	unsigned int pos;
-
-	spin_lock_irqsave(&ua->lock, flags);
-	pos = stream->buffer_pos;
-	spin_unlock_irqrestore(&ua->lock, flags);
-	return pos;
+	guard(spinlock_irqsave)(&ua->lock);
+	return stream->buffer_pos;
 }
 
 static snd_pcm_uframes_t capture_pcm_pointer(struct snd_pcm_substream *subs)
-- 
2.50.1

