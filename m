Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1E404BFF;
	Thu, 13 Aug 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631148; cv=none; b=kUiVPA0VFEj2GbMeDSSCDw1qJXBk0ElnCkXOcTWqOtIsw94dCTRSr4MuiR2sQoNhyYBFEy4fDNC8JoyvPHWuHyNdZGhEwReVilFXnW4HtC6emNyG4PQtMMXs4Nvb8A0wEhs34gnYNe0sQiTuoREvRW6rlbIgVzWi6Tl1fv0XasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631148; c=relaxed/simple;
	bh=Ihf8ZBPfNl4m5RPMeyqqWUEsbeY1sb4dK9CoJShOM/s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxWryYsAiSO26k7mKHxfBL6gZNp4zQKgpnB7BZhwAydrc/DhgngnC4v1NvIRobcWu2oYNco0eY52vOssoBZLkWME8h6oUaOUP23prQm3f4l9amGmdu0JUGBZKe7c8jwE2hVK9hge6WFssNHP/OYnozMj0uWu5fncW9bz/bgjQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlG4A6cr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WUAirjMz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VFTFDqUG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZRMARtX7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlG4A6cr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WUAirjMz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VFTFDqUG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRMARtX7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B87882952;
	Thu, 13 Aug 2026 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786631135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkIC3EZCEEzWvSr4ev1Ad6qyRbUd/bWq2HcWaTL/Iig=;
	b=XlG4A6crd3cQd/rGpxrhESHKyBfd7yR3J6D1VsD5Gfoek5wOtCwKIwFjMp1tMnkNJyMztw
	d1FF3fy5nljYO1DSknU2dsjk/03UQy8UB3zILK37/lpNEUe8jyMEX3JjgFXaD6L5z87IBc
	mhFsn/v34muxLwAYckk7E1dvG8j0PCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786631135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkIC3EZCEEzWvSr4ev1Ad6qyRbUd/bWq2HcWaTL/Iig=;
	b=WUAirjMzDyOErSy/zirwfFGcvqcr8Oa8Ve+epB110jzA21MexXcuyHAvX1iSRikIXCF449
	CKggGd3z5fo/p8Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786631131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkIC3EZCEEzWvSr4ev1Ad6qyRbUd/bWq2HcWaTL/Iig=;
	b=VFTFDqUGwZCwJ9RiRayde+ApfGtRUzi+niBAwAPkqjG9pm0MW5Zc4siNt/XlmXNF8GlW0f
	9vSKMspv4OeoocPKN6N0DuJmpMRjfVom5bWIpF3IjmCjDzMo796X1fM3kCermGwzN4bCdr
	HBbquLkv+zE/ym2kjOhpu6GbhG+Q+l8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786631131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkIC3EZCEEzWvSr4ev1Ad6qyRbUd/bWq2HcWaTL/Iig=;
	b=ZRMARtX7EriSlkJJXVH/ocXLAF0bYZrxViVvScU69wY0GDxJNKyF407NxXwWqeZ34GsS04
	vXd/pGu42vjVNiCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6DDA77E74;
	Thu, 13 Aug 2026 14:25:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R7wrN9rTfWpZQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Aug 2026 14:25:30 +0000
Date: Thu, 13 Aug 2026 16:25:30 +0200
Message-ID: <87fr0ixfl1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-sound@vger.kernel.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Kees Cook <kees@kernel.org>,	Zhang Cen
 <rollkingzzc@gmail.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@baylibre.com>,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: midi: Serialize input teardown with event_input
In-Reply-To: <20260813133130.726703-1-jkeeping@inmusicbrands.com>
References: <20260813133130.726703-1-jkeeping@inmusicbrands.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,kernel.org,gmail.com,baylibre.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,inmusicbrands.com:email,imap1.dmz-prg2.suse.org:helo]

On Thu, 13 Aug 2026 15:31:27 +0200,
John Keeping wrote:
> 
> snd_midi_input_event() must not be running while a rawmidi substream is
> closing, since this can lead to the trigger state becoming out-of-step
> through this sequence in snd_rawmidi_input_trigger():
> 
> 	snd_rawmidi_input_trigger(up=0)
> 					snd_midi_input_event()
> 					 -> snd_rawmidi_kernel_read()
> 					     -> snd_rawmidi_input_trigger(up=1)
> 	  -> cancel_work_sync()
> 
> which ends with the underlying device being active unexpectedly.
> 
> When this is called from close_substream(), further input can re-trigger
> the input event leaving it running after rawmidi_release_priv() has set
> rfile->rmidi to NULL which leads to:
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b0
> 	Call trace:
> 	 snd_midi_input_event+0x3c/0x134 [snd_seq_midi] (P)
> 	 snd_rawmidi_input_event_work+0x1c/0x2c
> 	 process_one_work+0x150/0x3a4
> 	 worker_thread+0x190/0x318
> 
> Apply the same approach as commit ef7607ab1c8ad ("ALSA: seq: midi:
> Serialize output teardown with event_input") which fixed the same issue
> in the output direction.
> 
> With this change in place, midisynth_unsubscribe() clears the input file
> so snd_midi_input_event() will not re-trigger the stream and will be
> quiesced by the cancel_work_sync() in snd_rawmidi_input_trigger().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Thanks for the patch.  The fix itself looks OK, but I already have an
optimization of the previous output-teardown fix with RCU (which was
planned to be submitted in today), as attached below.  Could you try
to rewrite to fit with this form?


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: seq: midi: Optimize event_input locking with RCU

The recent fix for serializing the output teardown introduced a
spinlock invocation at every MIDI output event via event_process_midi.
Since this is a hot path, let's do performance optimization with RCU.

The new output_substream __rcu pointer is published via
rcu_assign_pointer() in midisynth_use() after output_rfile is set, and
cleared in midisynth_unuse() before the resource teardown.
event_process_midi() reads it under rcu_read_lock() and bumps
output_use_lock inside that section, which is necessary to close the
window between the pointer dereference and the refcount increment.

midisynth_unuse() calls synchronize_rcu() before snd_use_lock_sync():
this guarantees that any reader who obtained a non-NULL pointer has
already called atomic_inc (output_use_lock), so the subsequent
snd_use_lock_sync() sees the correct in-flight count.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_midi.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 2eb12199c92f..c2f89aee1914 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -43,8 +43,8 @@ struct seq_midisynth {
 	int device;
 	int subdevice;
 	struct snd_rawmidi_file input_rfile;
-	spinlock_t output_lock;		/* protects output_rfile publication */
 	snd_use_lock_t output_use_lock;	/* in-flight event_input users */
+	struct snd_rawmidi_substream __rcu *output_substream;
 	struct snd_rawmidi_file output_rfile;
 	int seq_client;
 	int seq_port;
@@ -134,8 +134,8 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 	if (snd_BUG_ON(!msynth))
 		return -EINVAL;
 
-	scoped_guard(spinlock_irqsave, &msynth->output_lock) {
-		substream = msynth->output_rfile.output;
+	scoped_guard(rcu) {
+		substream = rcu_dereference(msynth->output_substream);
 		if (!substream)
 			return -ENODEV;
 		snd_use_lock_use(&msynth->output_use_lock);
@@ -177,7 +177,6 @@ static int snd_seq_midisynth_new(struct seq_midisynth *msynth,
 	msynth->card = card;
 	msynth->device = device;
 	msynth->subdevice = subdevice;
-	spin_lock_init(&msynth->output_lock);
 	snd_use_lock_init(&msynth->output_use_lock);
 	return 0;
 }
@@ -252,8 +251,8 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 		return err;
 	}
 	snd_midi_event_reset_decode(msynth->parser);
-	scoped_guard(spinlock_irqsave, &msynth->output_lock)
-		msynth->output_rfile = rfile;
+	msynth->output_rfile = rfile;
+	rcu_assign_pointer(msynth->output_substream, rfile.output);
 	return 0;
 }
 
@@ -261,17 +260,16 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 static int midisynth_unuse(void *private_data, struct snd_seq_port_subscribe *info)
 {
 	struct seq_midisynth *msynth = private_data;
-	struct snd_rawmidi_file rfile = {};
+	struct snd_rawmidi_file rfile;
 
-	scoped_guard(spinlock_irqsave, &msynth->output_lock) {
-		rfile = msynth->output_rfile;
-		msynth->output_rfile = (struct snd_rawmidi_file){};
-	}
+	rcu_assign_pointer(msynth->output_substream, NULL);
+	synchronize_rcu();
+	snd_use_lock_sync(&msynth->output_use_lock);
+	rfile = msynth->output_rfile;
+	msynth->output_rfile = (struct snd_rawmidi_file){};
 
 	if (snd_BUG_ON(!rfile.output))
 		return -EINVAL;
-
-	snd_use_lock_sync(&msynth->output_use_lock);
 	snd_rawmidi_drain_output(rfile.output);
 	return snd_rawmidi_kernel_release(&rfile);
 }
-- 
2.55.0

