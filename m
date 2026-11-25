Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623913;
	b=eufoGuYnPTEC9xyArTS1Y0/f/9nnZoEsCImSZD0YnQn427liV2M4EHH5eOvC152aU2im
	 b/VJly0KDfgthjfaYEgAgWwQBMvBhC+ze0jImKUT/W8Is/shM7Nwyn6Ek1Keke5q3cy8m
	 /bFtCF5qZDIbxvLUcmGjU+7Fsv5Z1xjyIizOCoLJrvwrkjEHRe7D18+FuiklMfTthQ+4G
	 oBGws07i4NUNfKVPJ5HQRvotOhvM13i02P/pU/mv+w1XD0mHgJ8HfUY3LvZrl8IcbxJ9e
	 H6Nm+fytasydNN1YcKiXk4w5TQ3WM6aP3LnbJ1VNd4JZMh1Ai/LQwCcewPtFEa+2Eww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623913;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=h1r5uQEClDfrIBno2rTuV1NmzM0+RjuROUXIkads1YA=;
	b=4MDOcO9dWWUa0IM24vSG9ggr3vYMazg+h80F3P4OeS0X9og4EV3FQrKiz2yLlDtSJZoL
	 B2GRkRhrHdLySkhLuvK8Q42chU9HWd4ludYStJc+Rgw0U+dhSBRnmTGCVilhguMQcn6qk
	 0mjnR3pfY01d571AW9aUPgGFtbByY+EQ1Nj3XpzJk8N+fUwqpb9xjJfkKabyYExmiqs+x
	 5cEEEfbHpDjUChhyNbKVU2V7E6lHV57sy1fxYoWmu9k7Ay0YjzgyXRIgt3YRotzg+TAT8
	 XkkO+B7SCZlmAt07PQ2mbrXz81V7I931Jcy19tvmHk6s6hvx16otBXzX5wZxyAOB/Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KlNSDLTB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="4cP/htes";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b934FbEF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WHhutvIU;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E7606A32A;
	Wed, 25 Nov 2026 16:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0E7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KlNSDLTB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4cP/htes;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b934FbEF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WHhutvIU
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE993223AB;
	Wed, 25 Nov 2026 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795623911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r5uQEClDfrIBno2rTuV1NmzM0+RjuROUXIkads1YA=;
	b=KlNSDLTBHsBCVzEb7FcovTPbi9YgXYXiKzlsHZ0rABjAa7eK31qteyjbzOPSVhaeCyzsEP
	IK6IX37aful8bYn+1RRcnxWnoOqZKehRmVDxcrZb5/ljY25IPpO/k1mounOq1D21tttgrF
	W+984kDgyEWWbg/EH7aSrpMJqqtt3K4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795623911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r5uQEClDfrIBno2rTuV1NmzM0+RjuROUXIkads1YA=;
	b=4cP/htesKPXWfXmDONdkKQ0lmjK3zJi8Sg6ZXUvNObOuTuIEE8yiwKH/3NcqV2Xot2HOIf
	anv0kNThKNesfODg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b934FbEF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WHhutvIU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795623909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r5uQEClDfrIBno2rTuV1NmzM0+RjuROUXIkads1YA=;
	b=b934FbEFd7E87nPoM5o7kI5OTExo8P0CPQBsDIiz0kShaYJNpOmiiS3Uv9rOWTC4hNvGZN
	1MG3OBozrnJX1veK7UWNa3lDY/VKAHMHTCvBOhCRGWLHq0Ocla8rBGZ0TbzniIvPT8x7hS
	MUnpmhCLZ0I8NAaZIBTtMFMog/JCFkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795623909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1r5uQEClDfrIBno2rTuV1NmzM0+RjuROUXIkads1YA=;
	b=WHhutvIUH23Fxjm4roF1qEl2tfv3PrleV2761cmNXY46neecy17QhXn5g7PjL/BscOkqv1
	LCRTRA+61cxsPpAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6062E134CA;
	Wed, 25 Nov 2026 16:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gUHMD+ULB2thYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 16:25:09 +0000
Date: Wed, 25 Nov 2026 17:25:08 +0100
Message-ID: <871p887uaj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: ALSA: usb-audio: us144mkii: PCM close frees runtime while  playback/feedback URB completion and capture work still use it (UAF)
In-Reply-To: <7b5aed28.578.1a212c08a97.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<12a3a26a.26361.1a1d4e1ad57.Coremail.xuhx@hust.edu.cn>
	<7b5aed28.578.1a212c08a97.Coremail.xuhx@hust.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,perex.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,hust.edu.cn:email];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: BE993223AB

On Wed, 25 Nov 2026 13:48:58 +0100,
徐晗翔 wrote:
> 
> tascam_playback_close() and tascam_capture_close() only cleared the
> substream pointer; the ALSA release path then detached the substream
> and freed the snd_pcm_runtime while a playback/feedback URB
> completion or the capture work still used it.
> 
> Make close() a real synchronous barrier:
> 
>  - clear the active flag and the substream pointer under
>    tascam->lock, and load them under the same lock in the
>    completions, so a completion cannot observe a stale substream of
>    a stream being quiesced;
>  - usb_kill_urb() every playback/feedback URB on playback close and
>    every capture/feedback URB on capture close (the feedback
>    completion consumes BOTH runtimes); usb_kill_urb() waits for each
>    in-flight completion, including one already inside the giveback
>    path;
>  - serialize the completions' final usb_submit_urb() with the close
>    under tascam->lock, so a completion that raced the close cannot
>    resubmit a killed URB;
>  - cancel_work_sync() for capture_work/stop_work/stop_pcm_work;
>  - serialize the whole quiesce with tascam_disconnect()'s
>    tascam_free_urbs() through a new cleanup_lock plus a
>    tascam->disconnected flag, released before snd_card_free() waits
>    for the open PCM files.

About this one and 753f2e86.57a.1a212c1052c.Coremail.xuhx@hust.edu.cn
for us144mkii:
there have been already a series of fixes by Alexandre Becholey
  https://lore.kernel.org/20261116071707.217448-1-alex@becholey.ch

... and as stated there, too, I believe that we should start a cleaner
redesign of URB handling for PCM in this driver at first before
papering over here and there.


thanks,

Takashi


> ---
>  sound/usb/usx2y/us144mkii.h          |  3 +++
>  sound/usb/usx2y/us144mkii_playback.c | 145 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------
>  sound/usb/usx2y/us144mkii.c          | 16 ++++++++++++++++
>  sound/usb/usx2y/us144mkii_capture.c  | 37 ++++++++++++++++++++++++++++++++++++-
>  4 files changed, 159 insertions(+), 42 deletions(-)
> 
> diff --git a/sound/usb/usx2y/us144mkii.h b/sound/usb/usx2y/us144mkii.h
> --- a/sound/usb/usx2y/us144mkii.h
> +++ b/sound/usb/usx2y/us144mkii.h
> @@ -229,6 +229,9 @@
>  
>  	/* --- Stream State --- */
>  	spinlock_t lock;
> +	struct mutex cleanup_lock;	/* serializes the close-time URB quiesce
> +					 * with disconnect()'s free path */
> +	bool disconnected;		/* disconnect() freed the URBs */
>  	atomic_t playback_active;
>  	atomic_t capture_active;
>  	atomic_t active_urbs;
> diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144mkii_playback.c
> --- a/sound/usb/usx2y/us144mkii_playback.c
> +++ b/sound/usb/usx2y/us144mkii_playback.c
> @@ -35,8 +35,40 @@
>  static int tascam_playback_close(struct snd_pcm_substream *substream)
>  {
>  	struct tascam_card *tascam = snd_pcm_substream_chip(substream);
> +	int i;
>  
> -	tascam->playback_substream = NULL;
> +	/* Serialize the quiesce below with disconnect()'s tascam_free_urbs()
> +	 * via the cleanup lock; after disconnect() has run there is nothing
> +	 * left to kill. */
> +	guard(mutex)(&tascam->cleanup_lock);
> +	if (!tascam->disconnected) {
> +		/* Clear the state under tascam->lock first, so a completion
> +		 * that races this close observes the cleared flag before its
> +		 * final resubmit (see the completions) and cannot bring an
> +		 * URB back to life after the kill. */
> +		scoped_guard(spinlock_irqsave, &tascam->lock) {
> +			atomic_set(&tascam->playback_active, 0);
> +			tascam->playback_substream = NULL;
> +		}
> +
> +		/*
> +		 * Per-URB usb_kill_urb() is the explicit synchronous close
> +		 * barrier: it waits for each in-flight completion (including
> +		 * one that already passed the active/pointer checks).  The
> +		 * feedback completion also consumes the playback runtime.
> +		 */
> +		for (i = 0; i < NUM_PLAYBACK_URBS; i++)
> +			if (tascam->playback_urbs[i])
> +				usb_kill_urb(tascam->playback_urbs[i]);
> +		for (i = 0; i < NUM_FEEDBACK_URBS; i++)
> +			if (tascam->feedback_urbs[i])
> +				usb_kill_urb(tascam->feedback_urbs[i]);
> +	}
> +
> +	cancel_work_sync(&tascam->stop_work);
> +	/* a stop_pcm_work queued on feedback sync loss must not run after
> +	 * ALSA detached the substream and freed its runtime */
> +	cancel_work_sync(&tascam->stop_pcm_work);
>  
>  	return 0;
>  }
> @@ -158,8 +190,8 @@
>  void playback_urb_complete(struct urb *urb)
>  {
>  	struct tascam_card *tascam = urb->context;
> -	struct snd_pcm_substream *substream;
> -	struct snd_pcm_runtime *runtime;
> +	struct snd_pcm_substream *substream = NULL;
> +	struct snd_pcm_runtime *runtime = NULL;
>  	size_t total_bytes_for_urb = 0;
>  	snd_pcm_uframes_t offset_frames;
>  	snd_pcm_uframes_t frames_to_copy;
> @@ -173,15 +205,21 @@
>  					    urb->status);
>  		goto out;
>  	}
> -	if (!tascam || !atomic_read(&tascam->playback_active))
> -		goto out;
> -
> -	substream = tascam->playback_substream;
> -	if (!substream || !substream->runtime)
> +	if (!tascam)
>  		goto out;
> -	runtime = substream->runtime;
>  
> +	/* Load the active flag and the substream under tascam->lock: a
> +	 * concurrent close clears both under the same lock, so this read
> +	 * cannot observe a stale substream of a stream that is being
> +	 * quiesced. */
>  	scoped_guard(spinlock_irqsave, &tascam->lock) {
> +		if (!atomic_read(&tascam->playback_active))
> +			goto out;
> +		substream = tascam->playback_substream;
> +		if (!substream || !substream->runtime)
> +			goto out;
> +		runtime = substream->runtime;
> +
>  		for (i = 0; i < urb->number_of_packets; i++) {
>  			unsigned int frames_for_packet;
>  			size_t bytes_for_packet;
> @@ -237,18 +275,26 @@
>  						   frames_to_copy);
>  	}
>  
> -	urb->dev = tascam->dev;
> -	usb_get_urb(urb);
> -	usb_anchor_urb(urb, &tascam->playback_anchor);
> -	ret = usb_submit_urb(urb, GFP_ATOMIC);
> -	if (ret < 0) {
> -		dev_err_ratelimited(tascam->card->dev,
> -				    "Failed to resubmit playback URB: %d\n",
> -				    ret);
> -		usb_unanchor_urb(urb);
> -		usb_put_urb(urb);
> -		atomic_dec(
> -			&tascam->active_urbs); /* Decrement on failed resubmission */
> +	/* Serialize the final resubmit with a concurrent close(): the close
> +	 * clears playback_active under tascam->lock, so observing it
> +	 * cleared here means the stream is being quiesced -- do not bring
> +	 * the URB back to life after the close's per-URB kill. */
> +	scoped_guard(spinlock_irqsave, &tascam->lock) {
> +		if (!atomic_read(&tascam->playback_active))
> +			goto out;
> +		urb->dev = tascam->dev;
> +		usb_get_urb(urb);
> +		usb_anchor_urb(urb, &tascam->playback_anchor);
> +		ret = usb_submit_urb(urb, GFP_ATOMIC);
> +		if (ret < 0) {
> +			dev_err_ratelimited(tascam->card->dev,
> +					    "Failed to resubmit playback URB: %d\n",
> +					    ret);
> +			usb_unanchor_urb(urb);
> +			usb_put_urb(urb);
> +			atomic_dec(
> +				&tascam->active_urbs); /* Decrement on failed resubmission */
> +		}
>  	}
>  out:
>  	usb_put_urb(urb);
> @@ -257,8 +303,8 @@
>  void feedback_urb_complete(struct urb *urb)
>  {
>  	struct tascam_card *tascam = urb->context;
> -	struct snd_pcm_substream *playback_ss, *capture_ss;
> -	struct snd_pcm_runtime *playback_rt, *capture_rt;
> +	struct snd_pcm_substream *playback_ss = NULL, *capture_ss = NULL;
> +	struct snd_pcm_runtime *playback_rt = NULL, *capture_rt = NULL;
>  	u64 total_frames_in_urb = 0;
>  	int ret, p;
>  	unsigned int old_in_idx, new_in_idx;
> @@ -276,18 +322,27 @@
>  		}
>  		goto out;
>  	}
> -	if (!tascam || !atomic_read(&tascam->playback_active))
> +	if (!tascam)
>  		goto out;
>  
> -	playback_ss = tascam->playback_substream;
> -	if (!playback_ss || !playback_ss->runtime)
> -		goto out;
> -	playback_rt = playback_ss->runtime;
> +	scoped_guard(spinlock_irqsave, &tascam->lock) {
> +		/* Load the active flag and the substreams under
> +		 * tascam->lock: a concurrent playback or capture close
> +		 * clears the flag and the pointers under the same lock, so
> +		 * these reads cannot observe a stale substream whose
> +		 * runtime is being detached.  The feedback completion
> +		 * consumes both runtimes, hence capture close must also
> +		 * quiesce the feedback URBs (see tascam_capture_close()). */
> +		if (!atomic_read(&tascam->playback_active))
> +			goto out;
> +		playback_ss = tascam->playback_substream;
> +		if (!playback_ss || !playback_ss->runtime)
> +			goto out;
> +		playback_rt = playback_ss->runtime;
>  
> -	capture_ss = tascam->capture_substream;
> -	capture_rt = capture_ss ? capture_ss->runtime : NULL;
> +		capture_ss = tascam->capture_substream;
> +		capture_rt = capture_ss ? capture_ss->runtime : NULL;
>  
> -	scoped_guard(spinlock_irqsave, &tascam->lock) {
>  		if (tascam->feedback_urb_skip_count > 0) {
>  			tascam->feedback_urb_skip_count--;
>  			break;
> @@ -429,16 +484,24 @@
>  	if (capture_period_elapsed)
>  		snd_pcm_period_elapsed(capture_ss);
>  
> -	urb->dev = tascam->dev;
> -	usb_get_urb(urb);
> -	usb_anchor_urb(urb, &tascam->feedback_anchor);
> -	ret = usb_submit_urb(urb, GFP_ATOMIC);
> -	if (ret < 0) {
> -		dev_err_ratelimited(tascam->card->dev,
> -				    "Failed to resubmit feedback URB: %d\n",
> -				    ret);
> -		usb_unanchor_urb(urb);
> -		usb_put_urb(urb);
> +	/* Serialize the final resubmit with a concurrent close(): observing
> +	 * playback_active cleared under tascam->lock means the playback
> +	 * stream is being quiesced -- do not bring the URB back to life
> +	 * after the close's per-URB kill. */
> +	scoped_guard(spinlock_irqsave, &tascam->lock) {
> +		if (!atomic_read(&tascam->playback_active))
> +			goto out;
> +		urb->dev = tascam->dev;
> +		usb_get_urb(urb);
> +		usb_anchor_urb(urb, &tascam->feedback_anchor);
> +		ret = usb_submit_urb(urb, GFP_ATOMIC);
> +		if (ret < 0) {
> +			dev_err_ratelimited(tascam->card->dev,
> +					    "Failed to resubmit feedback URB: %d\n",
> +					    ret);
> +			usb_unanchor_urb(urb);
> +			usb_put_urb(urb);
> +		}
>  	}
>  out:
>  	usb_put_urb(urb);
> diff --git a/sound/usb/usx2y/us144mkii.c b/sound/usb/usx2y/us144mkii.c
> --- a/sound/usb/usx2y/us144mkii.c
> +++ b/sound/usb/usx2y/us144mkii.c
> @@ -497,6 +497,7 @@
>  	tascam->capture_34_source = 1;
>  
>  	spin_lock_init(&tascam->lock);
> +	mutex_init(&tascam->cleanup_lock);
>  	spin_lock_init(&tascam->midi_in_lock);
>  	spin_lock_init(&tascam->midi_out_lock);
>  	init_usb_anchor(&tascam->playback_anchor);
> @@ -588,6 +589,17 @@
>  		snd_card_disconnect(tascam->card);
>  
>  		/*
> +		 * Serialize with a concurrent PCM close()'s quiesce (the
> +		 * per-URB kills below and tascam_free_urbs() must not race
> +		 * each other), then release the lock before snd_card_free()
> +		 * waits for the open PCM files: a close that runs during
> +		 * that wait sees tascam->disconnected and skips the URB
> +		 * handling.
> +		 */
> +		mutex_lock(&tascam->cleanup_lock);
> +		tascam->disconnected = true;
> +
> +		/*
>  		 * Kill the URBs before cancelling the work, so a late URB
>  		 * completion cannot re-arm a work that then runs after
>  		 * snd_card_free().
> @@ -605,6 +617,10 @@
>  		cancel_work_sync(&tascam->stop_pcm_work);
>  		timer_delete_sync(&tascam->error_timer);
>  		tascam_free_urbs(tascam);
> +		/* release before snd_card_free(): it waits for the open PCM
> +		 * files, and a close running during that wait takes this
> +		 * lock (and sees tascam->disconnected) */
> +		mutex_unlock(&tascam->cleanup_lock);
>  		snd_card_free(tascam->card);
>  		dev_idx--;
>  	}
> diff --git a/sound/usb/usx2y/us144mkii_capture.c b/sound/usb/usx2y/us144mkii_capture.c
> --- a/sound/usb/usx2y/us144mkii_capture.c
> +++ b/sound/usb/usx2y/us144mkii_capture.c
> @@ -35,8 +35,43 @@
>  static int tascam_capture_close(struct snd_pcm_substream *substream)
>  {
>  	struct tascam_card *tascam = snd_pcm_substream_chip(substream);
> +	int i;
>  
> -	tascam->capture_substream = NULL;
> +	/* Serialize the quiesce below with disconnect()'s tascam_free_urbs()
> +	 * via the cleanup lock; after disconnect() has run there is nothing
> +	 * left to kill. */
> +	guard(mutex)(&tascam->cleanup_lock);
> +	if (!tascam->disconnected) {
> +		/* Clear the state under tascam->lock first (ordered against
> +		 * the completions' locked reads) before killing. */
> +		scoped_guard(spinlock_irqsave, &tascam->lock) {
> +			atomic_set(&tascam->capture_active, 0);
> +			tascam->capture_substream = NULL;
> +		}
> +
> +		/*
> +		 * Kill the capture URBs, and the feedback URBs, too: the
> +		 * feedback completion consumes the capture runtime
> +		 * (capture_rt->period_size, snd_pcm_period_elapsed()), so
> +		 * closing capture while playback stays open must quiesce
> +		 * the feedback path as well.  usb_kill_urb() waits for each
> +		 * in-flight completion -- the explicit synchronous barrier.
> +		 */
> +		for (i = 0; i < NUM_CAPTURE_URBS; i++)
> +			if (tascam->capture_urbs[i])
> +				usb_kill_urb(tascam->capture_urbs[i]);
> +		for (i = 0; i < NUM_FEEDBACK_URBS; i++)
> +			if (tascam->feedback_urbs[i])
> +				usb_kill_urb(tascam->feedback_urbs[i]);
> +	}
> +
> +	/* the capture work caches substream->runtime at entry and writes
> +	 * runtime->dma_area; it must not run after the detach below */
> +	cancel_work_sync(&tascam->capture_work);
> +	cancel_work_sync(&tascam->stop_work);
> +	/* a stop_pcm_work queued on feedback sync loss must not run after
> +	 * ALSA detached the substream and freed its runtime */
> +	cancel_work_sync(&tascam->stop_pcm_work);
>  
>  	return 0;
>  }
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-13 20:28:42 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: ALSA: usb-audio: us144mkii: PCM close frees runtime while  playback/feedback URB completion and capture work still use it (UAF)
> > 
> > tascam_playback_close() and tascam_capture_close() only clear the
> > substream pointer; they do not stop URBs or cancel work.  The ALSA
> > release path then calls snd_pcm_detach_substream(), which sets
> > substream->runtime to NULL and frees the snd_pcm_runtime.  A
> > playback/feedback URB completion, or the capture work, can have loaded
> > the substream/runtime pointer before close; after detach it dereferences
> > runtime->rate, runtime->buffer_size, runtime->dma_area or
> > runtime->status, and may resubmit the next URB.  This is a
> > use-after-free / oops on an ordinary PCM close while the device remains
> > connected.  It is not the disconnect path.  Capture close is also
> > affected because feedback_urb_complete() uses the capture runtime.
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Linux 7.3.0 source tree (VERSION=7, PATCHLEVEL=3, SUBLEVEL=0),
> >   sound/usb/usx2y/us144mkii.c, us144mkii_playback.c,
> >   us144mkii_capture.c and us144mkii_pcm.c.  The driver binds the
> >   TASCAM US-144MKII (0644:8020) and US-144 (0644:800f).  The relevant
> >   configuration is CONFIG_SND_USB_US144MKII=m.
> > 
> >   This report is based on source inspection, plus a synthetic ALSA PCM
> >   model used to validate the close/detach lifetime pattern (see
> >   "Reproducer (attached POC)" below).  I have not run the real driver on
> >   TASCAM hardware or under KASAN; no real-hardware result is claimed.
> > 
> > * Mechanism
> > 
> >   1. The close callbacks do not stop I/O:
> > 
> >      static int tascam_playback_close(struct snd_pcm_substream *substream)
> >      {
> >              struct tascam_card *tascam = snd_pcm_substream_chip(substream);
> > 
> >              tascam->playback_substream = NULL;
> >              return 0;
> >      }
> > 
> >      (us144mkii_playback.c:35-42; tascam_capture_close() is the same at
> >      us144mkii_capture.c:35-42).  No usb_kill_urb(), no
> >      cancel_work_sync().
> > 
> >   2. tascam_pcm_trigger() on STOP only clears the active flags and
> >      schedules stop_work asynchronously:
> > 
> >              atomic_set(&tascam->playback_active, 0);
> >              atomic_set(&tascam->capture_active, 0);
> >              ...
> >              schedule_work(&tascam->stop_work);
> > 
> >      (us144mkii_pcm.c:280-287 and 352-353).  tascam_pcm_hw_free() is a
> >      no-op (us144mkii_pcm.c:257-260), so ALSA's do_hw_free() cannot stop
> >      anything either.
> > 
> >   3. ALSA then frees the runtime:
> > 
> >              snd_pcm_drop(substream);                  /* trigger STOP */
> >              ...
> >              substream->ops->close(substream);         /* only NULLs ptr */
> >              ...
> >              snd_pcm_detach_substream(substream);      /* frees runtime */
> > 
> >      (sound/core/pcm_native.c:2785-2805; snd_pcm_detach_substream() at
> >      sound/core/pcm.c:978-1005, substream->runtime = NULL at 997 and
> >      kfree(runtime) at 1001).
> > 
> >   4. Three consumers can already hold the old runtime pointer:
> > 
> >      - playback_urb_complete() reads tascam->playback_substream and
> >        substream->runtime at us144mkii_playback.c:176-182, then uses
> >        runtime->rate / runtime->buffer_size under tascam->lock and
> >        runtime->dma_area after unlocking (184-234), before resubmitting
> >        at 237-247.
> > 
> >      - feedback_urb_complete() reads the playback and capture
> >        substreams at us144mkii_playback.c:282-288.  It uses
> >        capture_rt->period_size at 413-417 and calls
> >        snd_pcm_period_elapsed(capture_ss) at 430 after unlocking.
> >        Therefore capture close must also stop the feedback URB; it
> >        currently stops neither capture nor feedback URBs.
> > 
> >      - tascam_capture_work_handler() reads
> >        tascam->capture_substream and substream->runtime at
> >        us144mkii_capture.c:157-169 and writes runtime->dma_area at 230
> >        under tascam->lock.  It is queued by capture_urb_complete() at
> >        line 301.
> > 
> >   5. The asynchronous stop_work is not a close-time barrier.
> >      usb_kill_anchored_urbs() in tascam_stop_work_handler() does wait
> >      for a completion that is already inside the HCD giveback path
> >      (__usb_hcd_giveback_urb() suspends the anchor wakeups before
> >      usb_unanchor_urb(), and resumes them only after urb->complete()),
> >      but stop_work itself is scheduled asynchronously by trigger(STOP).
> >      close does not wait for stop_work, so detach can free the runtime
> >      before stop_work runs.  A per-URB usb_kill_urb() in close() is the
> >      explicit synchronous barrier; it waits for urb->use_count == 0
> >      (drivers/usb/core/urb.c:703-720).
> > 
> >   6. A completion that has already passed the active/pointer check can
> >      resubmit a URB after close's kill unless the final check and
> >      usb_submit_urb() are serialized with close.  The close path must
> >      clear the active flag and substream pointer under tascam->lock,
> >      kill the URBs, cancel the work, and make the completion's final
> >      submit path take the same lock.
> > 
> >   7. There is a second direction: feedback completion consumes the
> >      capture runtime, but tascam_capture_close() stops neither capture
> >      URBs nor feedback URBs.  Closing capture while playback (and
> >      therefore feedback) remains open can free capture_runtime while
> >      feedback completion still uses capture_rt.
> > 
> >   8. close() must also be serialized with tascam_disconnect():
> >      tascam_disconnect() calls tascam_free_urbs() before
> >      snd_card_free() waits for open PCM files to close
> >      (us144mkii.c:580-611; free at 38-110).  Without a
> >      disconnect_lock/disconnected flag, a close that runs after the
> >      slots were freed can call usb_kill_urb(NULL), or race the free.
> > 
> > 
> > 
> > * Reproducer
> > 
> >   Attached files:
> >     tascam_poc.c  - synthetic ALSA PCM kernel module (C1 mode pcm1)
> >     pcmtest.c     - userland exerciser
> >     Makefile      - builds tascam_poc.ko against the running kernel
> > 
> >   This POC does not drive the TASCAM device.  It creates a synthetic ALSA
> >   PCM card whose .close() only drops the substream pointer, starts an
> >   asynchronous work item that caches the runtime, and lets ALSA detach and
> >   free the runtime before the work runs.  It therefore reproduces the
> >   lifetime ordering in point 3/4 above, not the real USB URB completion.
> >   A KASAN kernel is required to observe the UAF.
> > 
> >   Build and run:
> >     make
> >     gcc -static -O2 -o pcmtest pcmtest.c
> >     sudo modprobe snd-pcm
> >     sudo insmod ./tascam_poc.ko mode=pcm1
> >     sudo ./pcmtest 1
> >     dmesg | tail -50
> >     sudo rmmod tascam_poc
> > 
> >   Expected result with KASAN:
> >     BUG: KASAN: slab-use-after-free in race_pcm_work+0xce/0x140
> >     Allocated by task ... (snd_pcm_open)
> >     Freed by task ... (snd_pcm_release_substream/snd_pcm_detach_substream)
> > 
> >   Negative control (close cancels the work):
> >     sudo insmod ./tascam_poc.ko mode=pcm1 safe=1
> >     sudo ./pcmtest 1
> >   Expected: no KASAN report.
> > 
> >   The module creates a capture PCM at card index 0; if that index is
> >   occupied, check /proc/asound/cards and adjust DEV in pcmtest.c.
> > 
> >   For a real-hardware KASAN run, the proposed procedure is:
> > 
> >     arecord -D hw:CARD=US144MKII,DEV=0 -f S32_LE -r 48000 -c 4 /dev/null &
> >     aplay    -D hw:CARD=US144MKII,DEV=0 -f S32_LE -r 48000 -c 4 /dev/zero
> >     # start playback, then close it while feedback is active;
> >     # repeat open/start/close in a loop and watch dmesg for KASAN
> > 
> >   For the capture-close direction, keep the playback process running
> >   and repeatedly open/start/close the capture stream.  The expected
> >   KASAN top frames are playback_urb_complete(), feedback_urb_complete()
> >   or tascam_capture_work_handler().
> > 
> > 
> > * Suggested direction 
> > 
> >   In .close(), under tascam->lock, clear the active flag and substream
> >   pointer, then call usb_kill_urb() for every feedback/playback URB
> >   (capture close: feedback/capture), and finally cancel_work_sync() for
> >   stop_pcm_work, stop_work and capture_work as appropriate, before
> >   returning to snd_pcm_detach_substream().
> > 
> >   Use a disconnect_lock plus a disconnected flag to serialize this
> >   cleanup with tascam_disconnect()'s tascam_free_urbs(); release the
> >   lock before snd_card_free().  The completion's final
> >   active/pointer check and usb_anchor_urb()/usb_submit_urb() should run
> >   under the same tascam->lock, so a completion that raced with close
> >   cannot submit a new URB after the kill.
> > 
> >   I am happy to test a proposed fix.
> > 
> > 
> > Please keep me in Cc; I am not subscribed to the lists.
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
