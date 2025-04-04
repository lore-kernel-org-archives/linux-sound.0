Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F5AB672
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763470; cv=none; b=Olp/Zg4heE38ix8TGRgxsQw+OS88UV/6uUK0Znx7c+vKT9y/H2TgYyrxUWK5Zm6g0GY2gx5b9i/saGS+Ye0PJX+75HeNOw6OZRyLxuw5VpeYzPQIOYD3vhtzbXygWzdVsI7hIJtNnm6r/sA3PEBwvkJ3Kj1PlB/KVJuc7ixKugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763470; c=relaxed/simple;
	bh=hke8D2GfLeK85rst4LdpBOXbUZVmbwqLnG6LH6oWAZM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UpfssxpjmRRnnEReZdWXMS1pXi5S95VmX3X0pDUPQyhFswJZURSsBJ3I8m7JaYi6HEJ+oel8FbqYPxNlk51ISFHYjypuuuJWUQGmnQzb0/lihthbXjIHn9+R2kwKwO1iVGsO6Q+k6JpkSeFbDwxr56kVNUi2vmbSS8EeKw8w0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U6Kwf9d7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ECZFGREr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U6Kwf9d7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ECZFGREr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U6Kwf9d7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ECZFGREr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U6Kwf9d7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ECZFGREr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15B0A211B3;
	Fri,  4 Apr 2025 10:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743763467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tyKOaVzzKMwl4WMHaMdVudSyxi43lvLKXo3RuKWIQQc=;
	b=U6Kwf9d7iWAjBTfFX0uh3ABVbC1Bylu5vx2J73x2H1Qky5j8ZEBcsmUlJfZpC34Zzo+xnu
	TB3oQWLiIZHsI4pCr6HFzd5aOoTSsX6cfXzGsvxObrJAlHLkZm46jCphCsTHpT+ANiwJi5
	mmMkQWBTX1OP5/dp2jTWQ8AlSSM4TFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743763467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tyKOaVzzKMwl4WMHaMdVudSyxi43lvLKXo3RuKWIQQc=;
	b=ECZFGREr5ttFNNs9DNYbsqrqJwLdC1p/dfbofZNOlPcnH1GnKNkkyKaFOk/hn8X0R5S97Q
	hqQVF7hIqbCc0TAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743763467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tyKOaVzzKMwl4WMHaMdVudSyxi43lvLKXo3RuKWIQQc=;
	b=U6Kwf9d7iWAjBTfFX0uh3ABVbC1Bylu5vx2J73x2H1Qky5j8ZEBcsmUlJfZpC34Zzo+xnu
	TB3oQWLiIZHsI4pCr6HFzd5aOoTSsX6cfXzGsvxObrJAlHLkZm46jCphCsTHpT+ANiwJi5
	mmMkQWBTX1OP5/dp2jTWQ8AlSSM4TFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743763467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tyKOaVzzKMwl4WMHaMdVudSyxi43lvLKXo3RuKWIQQc=;
	b=ECZFGREr5ttFNNs9DNYbsqrqJwLdC1p/dfbofZNOlPcnH1GnKNkkyKaFOk/hn8X0R5S97Q
	hqQVF7hIqbCc0TAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B501213691;
	Fri,  4 Apr 2025 10:44:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5igOKwq472fjJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Apr 2025 10:44:26 +0000
Date: Fri, 04 Apr 2025 12:44:26 +0200
Message-ID: <87zfgw2ol1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,	=?ISO-8859-1?Q?P=E9ter?= Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	lgirdwood@gmail.com,	broonie@kernel.org,
	tiwai@suse.com,	linux-sound@vger.kernel.org,	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,	liam.r.girdwood@intel.com
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
In-Reply-To: <b9d457b9-4645-4876-b6a1-82bb658a3b8f@perex.cz>
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
	<87r02cym1c.wl-tiwai@suse.de>
	<9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
	<87jz83ztn7.wl-tiwai@suse.de>
	<206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
	<87h637znpp.wl-tiwai@suse.de>
	<35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
	<8734eryn21.wl-tiwai@suse.de>
	<ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
	<87v7rmylc5.wl-tiwai@suse.de>
	<d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
	<87o6xeyfkk.wl-tiwai@suse.de>
	<69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
	<87jz82ye7b.wl-tiwai@suse.de>
	<8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
	<87o6xe7l4q.wl-tiwai@suse.de>
	<51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
	<871pu95oon.wl-tiwai@suse.de>
	<2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
	<87plht447q.wl-tiwai@suse.de>
	<b9d457b9-4645-4876-b6a1-82bb658a3b8f@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
	FREEMAIL_CC(0.00)[suse.de,linux.intel.com,gmail.com,kernel.org,suse.com,vger.kernel.org,linux.dev,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, 03 Apr 2025 21:05:51 +0200,
Jaroslav Kysela wrote:
> 
> On 03. 04. 25 18:09, Takashi Iwai wrote:
> 
> > Last but not least, the ASoC PCM core has its own DPCM state, and the
> > trigger-SUSPEND skips the operation unless the stream has been
> > running.  I believe that's the very starting point of the problem
> > Peter's patch tries to address.
> 
> Unfortunately, after all discussions, I'm not convinced about Peter's patch. It smells like an workaround rather than a fix for forever. The problem is there for years so we should not concentrate on a quick fix.
> 
> >> Also, I would consider to call suspend/resume triggers (depending on a
> >> flag like can_pause_release_stop) when the stream is paused, too. Some
> >> drivers may want this scheme.
> > 
> > Do you mean drivers that do share the same operation for
> > suspend/resume and pause?
> 
> Many drivers supporting pause may use it when we allow PAUSE -> SUSPEND and SUSPEND -> PAUSE transitions.
> 
> Something like:
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index ac8f3aef9205..6d6882973883 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -541,6 +541,8 @@ struct snd_pcm {
>         bool internal; /* pcm is for internal use only */
>         bool nonatomic; /* whole PCM operations are in non-atomic context */
>         bool no_device_suspend; /* don't invoke device PM suspend */
> +       bool do_suspend_and_resume_in_pause; /* allow direct PAUSED -> SUSPENDED and
> +                                               SUSPENDED -> PAUSED transitions */
>  #if IS_ENABLED(CONFIG_SND_PCM_OSS)
>         struct snd_pcm_oss oss;
>  #endif
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 4057f9f10aee..3ec4ef7809ea 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1694,8 +1694,11 @@ static int snd_pcm_do_suspend(struct snd_pcm_substream *substream,
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         if (runtime->trigger_master != substream)
>                 return 0;
> -       if (! snd_pcm_running(substream))
> -               return 0;
> +       if (! snd_pcm_running(substream)) {
> +               if (!runtime->do_suspend_and_resume_in_pause ||
> +                   runtime->state != SNDRV_PCM_STATE_PAUSED)
> +                       return 0;
> +       }
>         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>         runtime->stop_operating = true;
>         return 0; /* suspend unconditionally */
> @@ -1798,8 +1801,11 @@ static int snd_pcm_do_resume(struct snd_pcm_substream *substream,
>         /* DMA not running previously? */
>         if (runtime->suspended_state != SNDRV_PCM_STATE_RUNNING &&
>             (runtime->suspended_state != SNDRV_PCM_STATE_DRAINING ||
> -            substream->stream != SNDRV_PCM_STREAM_PLAYBACK))
> -               return 0;
> +            substream->stream != SNDRV_PCM_STREAM_PLAYBACK)) {
> +               if (!runtime->do_suspend_and_resume_in_pause ||
> +                   runtime->suspend_state != SNDRV_PCM_STATE_PAUSED)
> +                       return 0;
> +       }
>         return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_RESUME);
>  }
> 
> This will allow to address this problem correctly without any pause release just to put all parts to the running state and immediately stop the stream. Ideally, all drivers should be migrated to this state scheme and the condition may be removed at the end.

OK, this should work, too.
If we deal with another corner case such as PAUSED -> STOP, a new flag
can be added, too. (Or make one flag indicating both meanings.)

Or, there can be a driver that wants to receive trigger SUSPEND even
for the non-running substreams, too.  We need to check the details
before moving forward...

And, if there can be multiple flags, I'd rather introduce a new field
to snd_pcm_hardware, e.g. extra_flags field to keep the internal bit
flags that aren't exposed to user-space.  Otherwise the setup can be
cumbersome for each driver.

Unfortunately, the existing flags in snd_pcm like nonatomic and
no_device_suspend can't be put there, though, as those are referred
for the closed substreams, too.


thanks,

Takashi
