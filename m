Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9085E30E0D9
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502630; cv=none; b=g0bDzhVCErUTQ7MIoBcW9Wb1BtluzNMvL69jIcLL5LtBxNZPo3FsqnP72JW1f8u7K57dMFPcR8VXBuUGJccQfNwViQbVwos56J8N+Oo2WIm9J3f97TUYQIdpswO+F37k+m+iZgyfr/KGBsTZSsJTpcRAlnKnsPrIT0bJJdSpxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502630; c=relaxed/simple;
	bh=vnr4gal4MOLuG82fsphrbknZQj1G8Ub9p/N0pcYgGbM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKeXj198eShafJ6AJamXGFtNiIzxjGzyhCsUWCxEr9OcVtfLgfS4M0nQh14/dMhFcguqd+7OmQLpy+jX8j8aEI53fDkoDVvYUahZBm47bSaPxABFVr+Zha9m1bEY968yjf9pRIQW0/4r5PNjVn/UcQyO9zsgKXkeT0lgqTaxi2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sd2r1SBN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xR61yZe+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sd2r1SBN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xR61yZe+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sd2r1SBN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xR61yZe+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sd2r1SBN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xR61yZe+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44459378AF;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTVA7J54cQzTCnBxa4lGWkxPX+DlR3omQMxSxPGqiqM=;
	b=sd2r1SBNKZclc7wJvTr6Yy2sQUIW94AJ2Bb339061FPh7XBezEZ9Ny6S6IFohcwgZ+rV0j
	w2aFivjBanrw0n7AQ4UPQbvUS4q1DK36HAE8gx+UX9W/HHNdY45B/8RC8GVBlai0sdmK6i
	YqrpwkIUn2cIPskZzBsILqFFwKad43Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTVA7J54cQzTCnBxa4lGWkxPX+DlR3omQMxSxPGqiqM=;
	b=xR61yZe+roTqh4NGu92a84lPR5qgscev5obTJ/25eXuD68ipC/ePea3Q1N2fKwGyVq0HRc
	TMwONoLlmRpYIQDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sd2r1SBN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xR61yZe+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTVA7J54cQzTCnBxa4lGWkxPX+DlR3omQMxSxPGqiqM=;
	b=sd2r1SBNKZclc7wJvTr6Yy2sQUIW94AJ2Bb339061FPh7XBezEZ9Ny6S6IFohcwgZ+rV0j
	w2aFivjBanrw0n7AQ4UPQbvUS4q1DK36HAE8gx+UX9W/HHNdY45B/8RC8GVBlai0sdmK6i
	YqrpwkIUn2cIPskZzBsILqFFwKad43Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTVA7J54cQzTCnBxa4lGWkxPX+DlR3omQMxSxPGqiqM=;
	b=xR61yZe+roTqh4NGu92a84lPR5qgscev5obTJ/25eXuD68ipC/ePea3Q1N2fKwGyVq0HRc
	TMwONoLlmRpYIQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2031D13301;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UBqKBnpcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/14] ALSA: usb-audio: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:26 +0200
Message-ID: <20250910110932.15234-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910110932.15234-1-tiwai@suse.de>
References: <20250910110932.15234-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 44459378AF
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 206 +++++++++++++++++++++++-------------------------
 1 file changed, 99 insertions(+), 107 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 97e7c3b62c8e..54d01dfd820f 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1528,8 +1528,6 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 	int counts;
 	unsigned int transfer_done, frame_limit, avail = 0;
 	int i, stride, period_elapsed = 0;
-	unsigned long flags;
-	int err = 0;
 
 	stride = ep->stride;
 
@@ -1537,106 +1535,101 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 	ctx->queued = 0;
 	urb->number_of_packets = 0;
 
-	spin_lock_irqsave(&subs->lock, flags);
-	frame_limit = subs->frame_limit + ep->max_urb_frames;
-	transfer_done = subs->transfer_done;
+	scoped_guard(spinlock_irqsave, &subs->lock) {
+		frame_limit = subs->frame_limit + ep->max_urb_frames;
+		transfer_done = subs->transfer_done;
 
-	if (subs->lowlatency_playback &&
-	    runtime->state != SNDRV_PCM_STATE_DRAINING) {
-		unsigned int hwptr = subs->hwptr_done / stride;
+		if (subs->lowlatency_playback &&
+		    runtime->state != SNDRV_PCM_STATE_DRAINING) {
+			unsigned int hwptr = subs->hwptr_done / stride;
 
-		/* calculate the byte offset-in-buffer of the appl_ptr */
-		avail = (runtime->control->appl_ptr - runtime->hw_ptr_base)
-			% runtime->buffer_size;
-		if (avail <= hwptr)
-			avail += runtime->buffer_size;
-		avail -= hwptr;
-	}
-
-	for (i = 0; i < ctx->packets; i++) {
-		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, avail);
-		if (counts < 0)
-			break;
-		/* set up descriptor */
-		urb->iso_frame_desc[i].offset = frames * stride;
-		urb->iso_frame_desc[i].length = counts * stride;
-		frames += counts;
-		avail -= counts;
-		urb->number_of_packets++;
-		transfer_done += counts;
-		if (transfer_done >= runtime->period_size) {
-			transfer_done -= runtime->period_size;
-			frame_limit = 0;
-			period_elapsed = 1;
-			if (subs->fmt_type == UAC_FORMAT_TYPE_II) {
-				if (transfer_done > 0) {
-					/* FIXME: fill-max mode is not
-					 * supported yet */
-					frames -= transfer_done;
-					counts -= transfer_done;
-					urb->iso_frame_desc[i].length =
-						counts * stride;
-					transfer_done = 0;
-				}
-				i++;
-				if (i < ctx->packets) {
-					/* add a transfer delimiter */
-					urb->iso_frame_desc[i].offset =
-						frames * stride;
-					urb->iso_frame_desc[i].length = 0;
-					urb->number_of_packets++;
-				}
-				break;
-			}
+			/* calculate the byte offset-in-buffer of the appl_ptr */
+			avail = (runtime->control->appl_ptr - runtime->hw_ptr_base)
+				% runtime->buffer_size;
+			if (avail <= hwptr)
+				avail += runtime->buffer_size;
+			avail -= hwptr;
 		}
-		/* finish at the period boundary or after enough frames */
-		if ((period_elapsed || transfer_done >= frame_limit) &&
-		    !snd_usb_endpoint_implicit_feedback_sink(ep))
-			break;
-	}
 
-	if (!frames) {
-		err = -EAGAIN;
-		goto unlock;
-	}
+		for (i = 0; i < ctx->packets; i++) {
+			counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, avail);
+			if (counts < 0)
+				break;
+			/* set up descriptor */
+			urb->iso_frame_desc[i].offset = frames * stride;
+			urb->iso_frame_desc[i].length = counts * stride;
+			frames += counts;
+			avail -= counts;
+			urb->number_of_packets++;
+			transfer_done += counts;
+			if (transfer_done >= runtime->period_size) {
+				transfer_done -= runtime->period_size;
+				frame_limit = 0;
+				period_elapsed = 1;
+				if (subs->fmt_type == UAC_FORMAT_TYPE_II) {
+					if (transfer_done > 0) {
+						/* FIXME: fill-max mode is not
+						 * supported yet */
+						frames -= transfer_done;
+						counts -= transfer_done;
+						urb->iso_frame_desc[i].length =
+							counts * stride;
+						transfer_done = 0;
+					}
+					i++;
+					if (i < ctx->packets) {
+						/* add a transfer delimiter */
+						urb->iso_frame_desc[i].offset =
+							frames * stride;
+						urb->iso_frame_desc[i].length = 0;
+						urb->number_of_packets++;
+					}
+					break;
+				}
+			}
+			/* finish at the period boundary or after enough frames */
+			if ((period_elapsed || transfer_done >= frame_limit) &&
+			    !snd_usb_endpoint_implicit_feedback_sink(ep))
+				break;
+		}
 
-	bytes = frames * stride;
-	subs->transfer_done = transfer_done;
-	subs->frame_limit = frame_limit;
-	if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U16_LE &&
-		     subs->cur_audiofmt->dsd_dop)) {
-		fill_playback_urb_dsd_dop(subs, urb, bytes);
-	} else if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U8 &&
-			   subs->cur_audiofmt->dsd_bitrev)) {
-		fill_playback_urb_dsd_bitrev(subs, urb, bytes);
-	} else {
-		/* usual PCM */
-		if (!subs->tx_length_quirk)
-			copy_to_urb(subs, urb, 0, stride, bytes);
-		else
-			bytes = copy_to_urb_quirk(subs, urb, stride, bytes);
+		if (!frames)
+			return -EAGAIN;
+
+		bytes = frames * stride;
+		subs->transfer_done = transfer_done;
+		subs->frame_limit = frame_limit;
+		if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U16_LE &&
+			     subs->cur_audiofmt->dsd_dop)) {
+			fill_playback_urb_dsd_dop(subs, urb, bytes);
+		} else if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U8 &&
+				    subs->cur_audiofmt->dsd_bitrev)) {
+			fill_playback_urb_dsd_bitrev(subs, urb, bytes);
+		} else {
+			/* usual PCM */
+			if (!subs->tx_length_quirk)
+				copy_to_urb(subs, urb, 0, stride, bytes);
+			else
+				bytes = copy_to_urb_quirk(subs, urb, stride, bytes);
 			/* bytes is now amount of outgoing data */
+		}
+
+		subs->last_frame_number = usb_get_current_frame_number(subs->dev);
+
+		if (subs->trigger_tstamp_pending_update) {
+			/* this is the first actual URB submitted,
+			 * update trigger timestamp to reflect actual start time
+			 */
+			snd_pcm_gettime(runtime, &runtime->trigger_tstamp);
+			subs->trigger_tstamp_pending_update = false;
+		}
+
+		if (period_elapsed && !subs->running && subs->lowlatency_playback) {
+			subs->period_elapsed_pending = 1;
+			period_elapsed = 0;
+		}
 	}
 
-	subs->last_frame_number = usb_get_current_frame_number(subs->dev);
-
-	if (subs->trigger_tstamp_pending_update) {
-		/* this is the first actual URB submitted,
-		 * update trigger timestamp to reflect actual start time
-		 */
-		snd_pcm_gettime(runtime, &runtime->trigger_tstamp);
-		subs->trigger_tstamp_pending_update = false;
-	}
-
-	if (period_elapsed && !subs->running && subs->lowlatency_playback) {
-		subs->period_elapsed_pending = 1;
-		period_elapsed = 0;
-	}
-
- unlock:
-	spin_unlock_irqrestore(&subs->lock, flags);
-	if (err < 0)
-		return err;
 	urb->transfer_buffer_length = bytes;
 	if (period_elapsed) {
 		if (in_stream_lock)
@@ -1654,24 +1647,23 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 static void retire_playback_urb(struct snd_usb_substream *subs,
 			       struct urb *urb)
 {
-	unsigned long flags;
 	struct snd_urb_ctx *ctx = urb->context;
 	bool period_elapsed = false;
 
-	spin_lock_irqsave(&subs->lock, flags);
-	if (ctx->queued) {
-		if (subs->inflight_bytes >= ctx->queued)
-			subs->inflight_bytes -= ctx->queued;
-		else
-			subs->inflight_bytes = 0;
-	}
+	scoped_guard(spinlock_irqsave, &subs->lock) {
+		if (ctx->queued) {
+			if (subs->inflight_bytes >= ctx->queued)
+				subs->inflight_bytes -= ctx->queued;
+			else
+				subs->inflight_bytes = 0;
+		}
 
-	subs->last_frame_number = usb_get_current_frame_number(subs->dev);
-	if (subs->running) {
-		period_elapsed = subs->period_elapsed_pending;
-		subs->period_elapsed_pending = 0;
+		subs->last_frame_number = usb_get_current_frame_number(subs->dev);
+		if (subs->running) {
+			period_elapsed = subs->period_elapsed_pending;
+			subs->period_elapsed_pending = 0;
+		}
 	}
-	spin_unlock_irqrestore(&subs->lock, flags);
 	if (period_elapsed)
 		snd_pcm_period_elapsed(subs->pcm_substream);
 }
-- 
2.50.1

