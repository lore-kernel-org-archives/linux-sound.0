Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED13316918
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502615; cv=none; b=ptfw80LqTYpcXtPdT1eoF9Y/z0koUoyV2rtDrdaaqEq1EcgcjTlP/klDW8IyZU4vdSW0tQynzGB50jZpUru1rLA9BCj6SIETL0CVi44ilDfOxkAGo/UIxu/i0SeJd4SkIDFsPV+RDcfaz5bCzIQSFebtwqF7KofnTqHSGvwHzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502615; c=relaxed/simple;
	bh=/zxiyPu1YOVY4T/2UUAa9ywrYRVrXkv6FjIEGaTJJj4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cm3d9J9tDqs5/XaB+GYOGILXvgB3ZcLIWy0okpSLKKSRfT+/n3EHG/SUTDFzT+SAU3EeQ4B6oHtABg5IKuqDFfnxC1dmRPFMe9VG2BF8rPWfkCTkbZFISX+V9xNtKBhJ73U+zpA0AFclYDO73CNSa71NRHxxJ8SesUaCNafDALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qMBbtE4e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wZimxClW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qMBbtE4e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wZimxClW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qMBbtE4e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZimxClW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qMBbtE4e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wZimxClW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E7E5E601E9;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJ/CMcj+9QRXx+w+Thkbr9rwWPgqMzc92zDjQp/lU/Y=;
	b=qMBbtE4eSLqKPuwajlgyHZnKUoui0e+3ZvFyDQVHQNbGH5QKNPDvHe3LFwcsg0K3i3PuyR
	76ynClbES4M+ug3SHtLrLdl5r/bXfpbEdq0YkDxYARejII78/DC9gRQdLpI8/bCP2ZqrxH
	NtL9aVK864NdPyzRkre7xth/sfoCifs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJ/CMcj+9QRXx+w+Thkbr9rwWPgqMzc92zDjQp/lU/Y=;
	b=wZimxClWWbFtixKXl+zjp3D5ONhcLWc+0FPNPpIKGt1Zmx1AYsYOAQUDOWciow59mYYYxT
	ih14a0+8Q37r6lDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJ/CMcj+9QRXx+w+Thkbr9rwWPgqMzc92zDjQp/lU/Y=;
	b=qMBbtE4eSLqKPuwajlgyHZnKUoui0e+3ZvFyDQVHQNbGH5QKNPDvHe3LFwcsg0K3i3PuyR
	76ynClbES4M+ug3SHtLrLdl5r/bXfpbEdq0YkDxYARejII78/DC9gRQdLpI8/bCP2ZqrxH
	NtL9aVK864NdPyzRkre7xth/sfoCifs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJ/CMcj+9QRXx+w+Thkbr9rwWPgqMzc92zDjQp/lU/Y=;
	b=wZimxClWWbFtixKXl+zjp3D5ONhcLWc+0FPNPpIKGt1Zmx1AYsYOAQUDOWciow59mYYYxT
	ih14a0+8Q37r6lDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE02013301;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0IAoMXlcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/14] ALSA: line6: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:24 +0200
Message-ID: <20250910110932.15234-10-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/capture.c |  6 +-----
 sound/usb/line6/driver.c  | 29 ++++++++++++++---------------
 sound/usb/line6/midi.c    | 10 ++--------
 sound/usb/line6/pcm.c     | 27 ++++++++++++---------------
 4 files changed, 29 insertions(+), 43 deletions(-)

diff --git a/sound/usb/line6/capture.c b/sound/usb/line6/capture.c
index 84a9b7b76f43..9ef4faa006a0 100644
--- a/sound/usb/line6/capture.c
+++ b/sound/usb/line6/capture.c
@@ -145,8 +145,6 @@ void line6_capture_check_period(struct snd_line6_pcm *line6pcm, int length)
 static void audio_in_callback(struct urb *urb)
 {
 	int i, index, length = 0, shutdown = 0;
-	unsigned long flags;
-
 	struct snd_line6_pcm *line6pcm = (struct snd_line6_pcm *)urb->context;
 
 	line6pcm->in.last_frame = urb->start_frame;
@@ -156,7 +154,7 @@ static void audio_in_callback(struct urb *urb)
 		if (urb == line6pcm->in.urbs[index])
 			break;
 
-	spin_lock_irqsave(&line6pcm->in.lock, flags);
+	guard(spinlock_irqsave)(&line6pcm->in.lock);
 
 	for (i = 0; i < LINE6_ISO_PACKETS; ++i) {
 		char *fbuf;
@@ -211,8 +209,6 @@ static void audio_in_callback(struct urb *urb)
 		    test_bit(LINE6_STREAM_PCM, &line6pcm->in.running))
 			line6_capture_check_period(line6pcm, length);
 	}
-
-	spin_unlock_irqrestore(&line6pcm->in.lock, flags);
 }
 
 /* open capture callback */
diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index c505c1cba162..e97368c31417 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -286,31 +286,30 @@ static void line6_data_received(struct urb *urb)
 {
 	struct usb_line6 *line6 = (struct usb_line6 *)urb->context;
 	struct midi_buffer *mb = &line6->line6midi->midibuf_in;
-	unsigned long flags;
 	int done;
 
 	if (urb->status == -ESHUTDOWN)
 		return;
 
 	if (line6->properties->capabilities & LINE6_CAP_CONTROL_MIDI) {
-		spin_lock_irqsave(&line6->line6midi->lock, flags);
-		done =
-			line6_midibuf_write(mb, urb->transfer_buffer, urb->actual_length);
+		scoped_guard(spinlock_irqsave, &line6->line6midi->lock) {
+			done =
+				line6_midibuf_write(mb, urb->transfer_buffer, urb->actual_length);
 
-		if (done < urb->actual_length) {
-			line6_midibuf_ignore(mb, done);
-			dev_dbg(line6->ifcdev, "%d %d buffer overflow - message skipped\n",
-				done, urb->actual_length);
+			if (done < urb->actual_length) {
+				line6_midibuf_ignore(mb, done);
+				dev_dbg(line6->ifcdev, "%d %d buffer overflow - message skipped\n",
+					done, urb->actual_length);
+			}
 		}
-		spin_unlock_irqrestore(&line6->line6midi->lock, flags);
 
 		for (;;) {
-			spin_lock_irqsave(&line6->line6midi->lock, flags);
-			done =
-				line6_midibuf_read(mb, line6->buffer_message,
-						   LINE6_MIDI_MESSAGE_MAXLEN,
-						   LINE6_MIDIBUF_READ_RX);
-			spin_unlock_irqrestore(&line6->line6midi->lock, flags);
+			scoped_guard(spinlock_irqsave, &line6->line6midi->lock) {
+				done =
+					line6_midibuf_read(mb, line6->buffer_message,
+							   LINE6_MIDI_MESSAGE_MAXLEN,
+							   LINE6_MIDIBUF_READ_RX);
+			}
 
 			if (done <= 0)
 				break;
diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index 1d77794b4490..4731293728e6 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -72,7 +72,6 @@ static void line6_midi_transmit(struct snd_rawmidi_substream *substream)
 */
 static void midi_sent(struct urb *urb)
 {
-	unsigned long flags;
 	int status;
 	int num;
 	struct usb_line6 *line6 = (struct usb_line6 *)urb->context;
@@ -84,7 +83,7 @@ static void midi_sent(struct urb *urb)
 	if (status == -ESHUTDOWN)
 		return;
 
-	spin_lock_irqsave(&line6->line6midi->lock, flags);
+	guard(spinlock_irqsave)(&line6->line6midi->lock);
 	num = --line6->line6midi->num_active_send_urbs;
 
 	if (num == 0) {
@@ -94,8 +93,6 @@ static void midi_sent(struct urb *urb)
 
 	if (num == 0)
 		wake_up(&line6->line6midi->send_wait);
-
-	spin_unlock_irqrestore(&line6->line6midi->lock, flags);
 }
 
 /*
@@ -158,17 +155,14 @@ static int line6_midi_output_close(struct snd_rawmidi_substream *substream)
 static void line6_midi_output_trigger(struct snd_rawmidi_substream *substream,
 				      int up)
 {
-	unsigned long flags;
 	struct usb_line6 *line6 =
 	    line6_rawmidi_substream_midi(substream)->line6;
 
 	line6->line6midi->substream_transmit = substream;
-	spin_lock_irqsave(&line6->line6midi->lock, flags);
+	guard(spinlock_irqsave)(&line6->line6midi->lock);
 
 	if (line6->line6midi->num_active_send_urbs == 0)
 		line6_midi_transmit(substream);
-
-	spin_unlock_irqrestore(&line6->line6midi->lock, flags);
 }
 
 static void line6_midi_output_drain(struct snd_rawmidi_substream *substream)
diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index 81e6d5e05135..f61d9f6cf754 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -182,11 +182,10 @@ static void line6_buffer_release(struct snd_line6_pcm *line6pcm,
 static int line6_stream_start(struct snd_line6_pcm *line6pcm, int direction,
 			      int type)
 {
-	unsigned long flags;
 	struct line6_pcm_stream *pstr = get_stream(line6pcm, direction);
 	int ret = 0;
 
-	spin_lock_irqsave(&pstr->lock, flags);
+	guard(spinlock_irqsave)(&pstr->lock);
 	if (!test_and_set_bit(type, &pstr->running) &&
 	    !(pstr->active_urbs || pstr->unlink_urbs)) {
 		pstr->count = 0;
@@ -199,7 +198,6 @@ static int line6_stream_start(struct snd_line6_pcm *line6pcm, int direction,
 
 	if (ret < 0)
 		clear_bit(type, &pstr->running);
-	spin_unlock_irqrestore(&pstr->lock, flags);
 	return ret;
 }
 
@@ -207,21 +205,20 @@ static int line6_stream_start(struct snd_line6_pcm *line6pcm, int direction,
 static void line6_stream_stop(struct snd_line6_pcm *line6pcm, int direction,
 			  int type)
 {
-	unsigned long flags;
 	struct line6_pcm_stream *pstr = get_stream(line6pcm, direction);
 
-	spin_lock_irqsave(&pstr->lock, flags);
-	clear_bit(type, &pstr->running);
-	if (!pstr->running) {
-		spin_unlock_irqrestore(&pstr->lock, flags);
-		line6_unlink_audio_urbs(line6pcm, pstr);
-		spin_lock_irqsave(&pstr->lock, flags);
-		if (direction == SNDRV_PCM_STREAM_CAPTURE) {
-			line6pcm->prev_fbuf = NULL;
-			line6pcm->prev_fsize = 0;
-		}
+	scoped_guard(spinlock_irqsave, &pstr->lock) {
+		clear_bit(type, &pstr->running);
+		if (pstr->running)
+			return;
+	}
+
+	line6_unlink_audio_urbs(line6pcm, pstr);
+	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+		guard(spinlock_irqsave)(&pstr->lock);
+		line6pcm->prev_fbuf = NULL;
+		line6pcm->prev_fsize = 0;
 	}
-	spin_unlock_irqrestore(&pstr->lock, flags);
 }
 
 /* common PCM trigger callback */
-- 
2.50.1

