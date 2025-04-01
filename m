Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D11E51E7
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535671; cv=none; b=fuJiWTEol/0AOvz+I1kfTYb2FPReHxQe3SIvN8FX217q69ueL2GN19ZIadaWaE+zD0mET+jMjYbPb/ytJLfE58/ASUEyrISXu+IUsGfigBd1VADoUS52bnY3djvUCqX3hvNeQnUc4w/44d00AY8Kc2d3iKW28ZrEKyHImCOLlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535671; c=relaxed/simple;
	bh=0r2TA5qeuZbcS2CZDbrVikg44rN70+lXszFlgwYnd5o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+wcFa2tfXi7J7jeqOMXoQ9AOn8ZciOrkcTreguMNfWtC7KggDCdvmsBEgzmF94jZJnxuxdfL6mxvKLbvVeI1nKcOjrw0nTRePevBK2KhoAJ13YvWVmEE6MBtQSTRks0ZiDbkcI+CyfriYF1acsGAWqRmi9KkF3HxAir+v+cn/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CEBeqBEI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oxiOw42j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CEBeqBEI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oxiOw42j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CEBeqBEI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oxiOw42j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CEBeqBEI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oxiOw42j"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 854981F445;
	Tue,  1 Apr 2025 19:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743535667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5Wot1Tw5M8xoqHPNIhmii5e+l1G5q6lABXZfCADh9Q=;
	b=CEBeqBEIJJ0lxIviPJHwlJ3pD4Lq6Ef+Q+NCQrUwoErPNR5wp1F7gpGnw9zQ1s/IQfpQ/4
	h4/Y4x6xB0oIPXlrl7duFRFXR+0UwHKHBGAinTj06LYBOe9yffd28d72xDYwPexyFtMomw
	XGxATJAjPKo+96jjhVhrXJ8E+ZPBbm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743535667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5Wot1Tw5M8xoqHPNIhmii5e+l1G5q6lABXZfCADh9Q=;
	b=oxiOw42jggmOGAp5w4jJJMN0eDbG/EWb7zxuh7EBd0HMMGD80u/ibRSH7a9vL5oEgfcWfu
	OMKYeQM52gaZbUBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CEBeqBEI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oxiOw42j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743535667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5Wot1Tw5M8xoqHPNIhmii5e+l1G5q6lABXZfCADh9Q=;
	b=CEBeqBEIJJ0lxIviPJHwlJ3pD4Lq6Ef+Q+NCQrUwoErPNR5wp1F7gpGnw9zQ1s/IQfpQ/4
	h4/Y4x6xB0oIPXlrl7duFRFXR+0UwHKHBGAinTj06LYBOe9yffd28d72xDYwPexyFtMomw
	XGxATJAjPKo+96jjhVhrXJ8E+ZPBbm0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743535667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5Wot1Tw5M8xoqHPNIhmii5e+l1G5q6lABXZfCADh9Q=;
	b=oxiOw42jggmOGAp5w4jJJMN0eDbG/EWb7zxuh7EBd0HMMGD80u/ibRSH7a9vL5oEgfcWfu
	OMKYeQM52gaZbUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3492513691;
	Tue,  1 Apr 2025 19:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lt6WCzM+7GdBQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Apr 2025 19:27:47 +0000
Date: Tue, 01 Apr 2025 21:27:46 +0200
Message-ID: <87h637znpp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 854981F445
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,linux.intel.com,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.dev,intel.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 01 Apr 2025 20:46:15 +0200,
Jaroslav Kysela wrote:
> 
> On 01. 04. 25 19:19, Takashi Iwai wrote:
> > On Tue, 01 Apr 2025 18:58:40 +0200,
> > Jaroslav Kysela wrote:
> >> 
> >> On 01. 04. 25 16:49, Takashi Iwai wrote:
> >>> On Tue, 01 Apr 2025 15:36:52 +0200,
> >>> Peter Ujfalusi wrote:
> >>>> 
> >>>> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
> >>>> does not support RESUME then on system resume the RESUME trigger is not
> >>>> sent, the stream's state and suspended_state remains untouched.
> >>>> When the user space releases the pause then the core will reject this
> >>>> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
> >>>> 
> >>>>   From this point user space will do the normal (hw_params) prepare and
> >>>> START, PAUSE_RELEASE trigger will not be sent by the core after the
> >>>> system has resumed.
> >> 
> >> Why you expect to see PAUSE_RELEASE trigger before SUSPEND trigger
> >> when resume is not supported ? I think that the driver has complete
> >> information:
> >> 
> >> PAUSE -> SUSPEND [-> no RESUME]
> >> 
> >> The driver should stay in the suspend state until a new stream
> >> re-initialization is invoked.
> >> 
> >> It looks like that other logic should be moved to the end driver (if
> >> some parts must be reinitialized in the suspend phase when the resume
> >> is not supported). I don't think that this is job for PCM core nor SoC
> >> PCM core routines.
> >> 
> >> The SUSPEND trigger is always invoked, isn't?
> > 
> > No, that's a part of the problems.  The ops->suspend is called only
> > for the running state, while at snd_pcm_post_suspend(), the state is
> > changed to SUSPENDED.  The original state is saved as
> > suspended_state, and this can be restored via snd_pcm_resume(), but
> > only if the driver supports the full resume.
> > 
> > We may allow calling ops->suspend also for PAUSED state, too.  But
> > then each driver would need to have to handle this state change, too.
> > Currently, when snd_pcm_prepare(), *_drop() or *_drain() is called at
> > PAUSED state, the core automatically releases the pause beforehand.
> 
> Thanks for those hints. I don't think that the pause release is sufficient
> for this case - the stream must be stopped, too. Actually, all mentioned
> prepare/drop/drain routines immediately changes state when the pause is
> released.

Actually, this patch follows the same pattern, too.  It calls
snd_pcm_pause(false) to set the state to RUNNING again, then proceed
to the suspend action immediately that sets to SUSPENDED.

> Maybe a new trigger may be added to notify drivers like:
> 
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1694,8 +1694,10 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         if (runtime->trigger_master != substream)
>                 return 0;
> -       if (! snd_pcm_running(substream))
> +       if (! snd_pcm_running(substream)) {
> +               substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND_WHEN_IDLE);
>                 return 0;
> +       }
>         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>         runtime->stop_operating = true;
>         return 0; /* suspend unconditionally */
> 
> With this, the states won't be changed - the driver without resume support
> can shut down all necessary things.

That's another possibility, yes.  Though, IMO, it makes the
pause-handling a bit more cumbersome.  With Peter's proposal, the
pause state change is always paired, so the driver doesn't consider
about that too much; that's the biggest merit.

But I'm all ears about this issue.  Let's see.

(BTW, I thought the state change PAUSED -> XRUN were possible, but
actually it's not; this is another corner case to be addressed, I
guess.)


Takashi
