Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2121F0E56
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511246; cv=none; b=tPU/wCQtu8wxs+CbpVNyrMa3fuVXm7qSrLsmHlkd5SnskOfGOeZEejRXpRb0yYbZxO4Ampf+zH+XLAQmGBAnNr4GOtpwNVKM5l16JVOswFz4TY+NcoYmv38zN4Xb32cdn0O5IBlaw+CiV00xvQoI+zO/2raNbz4Ut6SStL8sMlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511246; c=relaxed/simple;
	bh=vUl+RlYclDLX8lfvvKdacqWRmleZoyfCKtapH+8kj+4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+gm7VZm4ew1tQoujmWeXoxwDl9odArXcfERqMX8MiqtJXt1oE82+WK8AspyEf+Sja0mbQABmGoC56+WN9kEK/KwYY2ul/M4rhWeh637eU4KSxZta9oIDuNJgVrqcKqnw7agnLVcOIqYKNHkJ7UbDZ5MrXNNNzCZB38JJ7nlnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LmGw+mn2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mJUzE8hk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LmGw+mn2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mJUzE8hk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LmGw+mn2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mJUzE8hk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LmGw+mn2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mJUzE8hk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 701AB1F458;
	Tue,  1 Apr 2025 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743511242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXCPko00RiTian7W7DgCFBBOH5M6w37pwtDEBWJhp/4=;
	b=LmGw+mn2bYKHoA1bXifwKOMzIzdX7c6IpiFhtNjWyO5gx1ukytmp2En9CupKfozZSzHg+L
	RZDswetzvK2UlNMGSImu2BMPTAEXNqCLintmVT0hWjEXCdkugK25FwvzOa8iWxQJ87SNfk
	MtdlrYTN2f+KFeX8PehV1SnhwLFLMMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743511242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXCPko00RiTian7W7DgCFBBOH5M6w37pwtDEBWJhp/4=;
	b=mJUzE8hkkawknneAXM15RIqgRfspQjOz3o/QuTfupJ5zWXfxgsg1jenfzxxeObfrjgXUGG
	MflbPzUlXWjjKDBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743511242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXCPko00RiTian7W7DgCFBBOH5M6w37pwtDEBWJhp/4=;
	b=LmGw+mn2bYKHoA1bXifwKOMzIzdX7c6IpiFhtNjWyO5gx1ukytmp2En9CupKfozZSzHg+L
	RZDswetzvK2UlNMGSImu2BMPTAEXNqCLintmVT0hWjEXCdkugK25FwvzOa8iWxQJ87SNfk
	MtdlrYTN2f+KFeX8PehV1SnhwLFLMMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743511242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXCPko00RiTian7W7DgCFBBOH5M6w37pwtDEBWJhp/4=;
	b=mJUzE8hkkawknneAXM15RIqgRfspQjOz3o/QuTfupJ5zWXfxgsg1jenfzxxeObfrjgXUGG
	MflbPzUlXWjjKDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4917313691;
	Tue,  1 Apr 2025 12:40:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Em5FEcre62cVQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Apr 2025 12:40:42 +0000
Date: Tue, 01 Apr 2025 14:40:41 +0200
Message-ID: <87ikno12d2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [RFC] ASoC: SOF: sof-pcm/pm: Stop paused streams before the system suspend
In-Reply-To: <52a4cc86-8982-48a5-ad4c-35c8d6d52cde@linux.intel.com>
References: <20250331105631.7436-1-peter.ujfalusi@linux.intel.com>
	<87wmc5319m.wl-tiwai@suse.de>
	<648a5d66-6e68-4287-9dce-20c2a2541e5c@linux.intel.com>
	<52a4cc86-8982-48a5-ad4c-35c8d6d52cde@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kernel.org,suse.com,perex.cz,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,intel.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 01 Apr 2025 14:20:14 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 01/04/2025 14:28, Péter Ujfalusi wrote:
> > 
> > 
> > On 31/03/2025 14:09, Takashi Iwai wrote:
> >> On Mon, 31 Mar 2025 12:56:31 +0200,
> >> Peter Ujfalusi wrote:
> >>>
> >>> Paused streams will not receive a suspend trigger, they will be marked by
> >>> ALSA core as suspended and it's state is saved.
> >>> Since the pause stream is not in a fully stopped state, for example DMA
> >>> might be still enabled (just the trigger source is removed/disabled) we
> >>> need to make sure that the hardware is ready to handle the suspend.
> >>>
> >>> This involves a bit more than just stopping a DMA since we also need to
> >>> communicate with the firmware in a delicate sequence to follow IP
> >>> programming flows.
> >>> To make things a bit more challenging, these flows are different between
> >>> IPC versions due to the fact that they use different messages to implement
> >>> the same functionality.
> >>>
> >>> To avoid adding yet another path, callbacks and sequencing for handling the
> >>> corner case of suspending while a stream is paused, and do this for each
> >>> IPC versions and platforms, we can move the stream back to running just to
> >>> put it to stopped state.
> >>>
> >>> Explanation of the change:
> >>> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
> >>> does not support RESUME then on system resume the RESUME trigger is not
> >>> sent, the stream's state and suspended_state remains untouched.
> >>> When the user space releases the pause then the core will reject this
> >>> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
> >>>
> >>> From this point user space will do the normal (hw_params) prepare and
> >>> START, PAUSE_RELEASE trigger will not be sent by the core after the
> >>> system has resumed.
> >>>
> >>> Link: https://github.com/thesofproject/linux/issues/5035
> >>> Link: https://github.com/thesofproject/linux/issues/5341
> >>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> >>> ---
> >>> Hi,
> >>>
> >>> Please see the problem statement and details of the issue in the commit
> >>> message.
> >>>
> >>> I'm not sure if this should be done in ALSA+ASoC level instead. My fear
> >>> is that this is changing how things has been working since almost
> >>> forever and it really puzzles me why it is not affecting other drivers.
> >>> It is true that in SOF the PAUSED state is not equal to STOPED while
> >>> it might be so for other vendors (it is for TI stuff for sure).
> >>>
> >>> The main point is that when we do a system suspend and a stream is in
> >>> PAUSED state, it will not be triggered (PAUSED == SUSPENDED/STOPPED
> >>> assumption?). On resume, if the platform is not supporting RESUME then
> >>> nothing will be done for the PAUSED stream, but a PAUSE_RELEASE will
> >>> fail and all sorts of state machine assumption will break in SOF/ASoC
> >>> stack.
> >>>
> >>> I have a PR open for quite long [1] but we would like to find the best
> >>> solution for us and possibly for others facing the same issue as well.
> >>>
> >>> [1] https://github.com/thesofproject/linux/pull/5058
> >>
> >> IMO, this kind of thing should be handled in ALSA core side.
> >> If we want to avoid possible breakage, a flag can be introduced and
> >> perform this conditionally, too.  It'll become a bit complex, but
> >> that's because of the subtle hardware behavior differences,
> >> unfortunately.
> > 
> > I had hard time to define that flag to act upon for months ;)
> > 
> > It is something of a mix of conditions that needs to be present and
> > _might_ not really need a new flag:
> > 
> > The PCM device must support SNDRV_PCM_INFO_PAUSE and must not support
> > SNDRV_PCM_INFO_RESUME.
> > Given that ALSA core will not trigger the PAUSED streams on suspend,
> > they just moved to SUSPENDED.
> > On resume the RESUME is going to be skipped as well as it is not
> > supported, the PAUSED stream remains SUSPENDED.
> > If the RESUME is supported then the driver will receive the trigger and
> > _might_ be able to move things around to match the paused state it was
> > before suspend.
> > 
> > This patch in a way plays with these rules knowing that on resume the
> > paused stream is going to fail to release and we will go to a new start,
> > so internally it would bluntly stops anything which is paused, they will
> > never going to PAUSE_RELEASE, they will be started w/o the driver's
> > knowledge of a skipped pause release.
> > 
> > What I'm not sure is how this can be done legitimately in core. Move the
> > stream from PAUSED to STOPPED without user space knowing it? So after
> > resume the it thinks that the stream is paused, but the kernel has moved
> > it to stopped?
> > 
> > In SOF we need a bit higher level triggers to have the delicate
> > sequencing right for the BE/FE and for the IPC versions.
> > 
> > I think this is where I thought that this is a bit more complicated than
> > just add a flag and do the trigger.
> 
> Having said all of this, the following small diff works well with SOF
> stack, for aplay this is fine at least ;)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 6c2b6a62d9d2..6d8389642e37 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1694,8 +1694,14 @@ static int snd_pcm_do_suspend(struct
> snd_pcm_substream *substream,
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	if (runtime->trigger_master != substream)
>  		return 0;
> -	if (! snd_pcm_running(substream))
> -		return 0;
> +	if (! snd_pcm_running(substream)) {
> +		if (runtime->info & SNDRV_PCM_INFO_RESUME ||
> +		    runtime->state != SNDRV_PCM_STATE_PAUSED)
> +			return 0;
> +
> +		/* release the paused stream to suspend */
> +		snd_pcm_pause(substream, false);
> +	}
>  	substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>  	runtime->stop_operating = true;
>  	return 0; /* suspend unconditionally */
> 
> So, if the PCM device does not support resuming, then release the pause
> before going the suspend.

Yeah, I had this kind of change in mind, too.  I thought a bit
different conditional, but the check of SNDRV_PCM_INFO_RESUME bit
should be enough.

But, calling snd_pcm_pause() from that point is dangerous; it's in a
messy loop of linked substream traversals.  I'd call in
snd_pcm_suspend() before the suspend action instead, something like:

--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1731,6 +1731,9 @@ static const struct action_ops snd_pcm_action_suspend = {
 static int snd_pcm_suspend(struct snd_pcm_substream *substream)
 {
 	guard(pcm_stream_lock_irqsave)(substream);
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED &&
+	    !(runtime->info & SNDRV_PCM_INFO_RESUME))
+		snd_pcm_pause(substream, false);
 	return snd_pcm_action(&snd_pcm_action_suspend, substream,
 			      ACTION_ARG_IGNORE);
 }


thanks,

Takashi
