Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26211DF738
	for <linux-sound@vger.kernel.org>; Mon, 31 Mar 2025 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743419353; cv=none; b=LAtPppkVvqP1a2qOlYWIQoH1sXkKxqKSKJ+HC4qBWlbqnn5dmo5aJDiRBF5YFcjLlbW4dIDIeAasikdnvJcZ0U7q1i0OPKVebzA7ZQHLIq2IEI2eQhT0G+Qlye3jL7boavTLFMCFjxOsbmkH1O84zBYDOZb546Ty9ySRZauO+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743419353; c=relaxed/simple;
	bh=DphGFJ8ON5DxK3TzSe/DMM+ispjcPSoLZIQ2g6bYPvA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gepeOciRbcGTXfQ0yWwSTcNfkRjyVIqeM+un7rQ3q9dLz5AsNHIR+GwJL4ImQoP8ZlE/UnNkLh04jZvFaXwnJrJwSf++Fh4fme/Ap9KRJ5Qr2yN3v9/BtswFQTm2hC3DEaQIOePSos59CbvXOU51tdA3kOhGhFX81URCS01YCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QIYPQlsc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zV9ri1La; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s9DPrgys; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T3k2N3W/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QIYPQlsc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zV9ri1La";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s9DPrgys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T3k2N3W/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E26B51F38E;
	Mon, 31 Mar 2025 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743419350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHDf9zlaIA2oocDMHh2IipmGLXj2T7llEuPILkeg6k=;
	b=QIYPQlsclCqGBh5DIUHseK6L75vqFTHYSYlvtTsjhehMf987WNDCEERbo5RilZRYpyVH86
	FLR7vdnNud6vNS0kqn2GLhROBulHGAQuErItgJjfvyCHU9+seH0FeYvACHsGqOQfIlQcli
	j2UT9hcoIBHr9t6Kt4hkQ0HP7NcW91I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743419350;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHDf9zlaIA2oocDMHh2IipmGLXj2T7llEuPILkeg6k=;
	b=zV9ri1LaYgQhtwEP0un6ULSZCETQvIM9BHQqlVBbDj4OGFhoQmvC7N9nMPqwcrgVVNlnGm
	MbkdUA9fbCb82vDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s9DPrgys;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="T3k2N3W/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743419349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHDf9zlaIA2oocDMHh2IipmGLXj2T7llEuPILkeg6k=;
	b=s9DPrgys8yVC51dUOyDg3df+u3lmiCbLFGllAcU5o0xh1h/lO/TywLf/O2+E2WJaeD+5gD
	YdJYDwvtktNBl6Fu5MrLOsivdzuH4xXVl1JawjRqwf9gwiw+7IWi2MAdS6Bs0tCn837uLL
	trOsnEFPuQpKfaOLEUpxXgeSbjw6qSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743419349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHDf9zlaIA2oocDMHh2IipmGLXj2T7llEuPILkeg6k=;
	b=T3k2N3W/0lJTIxR6YFvkcKL8gwL98bHAWLP02X0j3kB5sbnu9j3E4f5jbtKYug/1PKeCTQ
	jRytSifGBplR9uCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99C6513A1F;
	Mon, 31 Mar 2025 11:09:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yMZiJNV36mf1cQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Mar 2025 11:09:09 +0000
Date: Mon, 31 Mar 2025 13:09:09 +0200
Message-ID: <87wmc5319m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
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
In-Reply-To: <20250331105631.7436-1-peter.ujfalusi@linux.intel.com>
References: <20250331105631.7436-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E26B51F38E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.com,perex.cz,vger.kernel.org,linux.intel.com,linux.dev,intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 31 Mar 2025 12:56:31 +0200,
Peter Ujfalusi wrote:
> 
> Paused streams will not receive a suspend trigger, they will be marked by
> ALSA core as suspended and it's state is saved.
> Since the pause stream is not in a fully stopped state, for example DMA
> might be still enabled (just the trigger source is removed/disabled) we
> need to make sure that the hardware is ready to handle the suspend.
> 
> This involves a bit more than just stopping a DMA since we also need to
> communicate with the firmware in a delicate sequence to follow IP
> programming flows.
> To make things a bit more challenging, these flows are different between
> IPC versions due to the fact that they use different messages to implement
> the same functionality.
> 
> To avoid adding yet another path, callbacks and sequencing for handling the
> corner case of suspending while a stream is paused, and do this for each
> IPC versions and platforms, we can move the stream back to running just to
> put it to stopped state.
> 
> Explanation of the change:
> Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
> does not support RESUME then on system resume the RESUME trigger is not
> sent, the stream's state and suspended_state remains untouched.
> When the user space releases the pause then the core will reject this
> because the state of the stream is _not_ PAUSED, it is still SUSPENDED.
> 
> From this point user space will do the normal (hw_params) prepare and
> START, PAUSE_RELEASE trigger will not be sent by the core after the
> system has resumed.
> 
> Link: https://github.com/thesofproject/linux/issues/5035
> Link: https://github.com/thesofproject/linux/issues/5341
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi,
> 
> Please see the problem statement and details of the issue in the commit
> message.
> 
> I'm not sure if this should be done in ALSA+ASoC level instead. My fear
> is that this is changing how things has been working since almost
> forever and it really puzzles me why it is not affecting other drivers.
> It is true that in SOF the PAUSED state is not equal to STOPED while
> it might be so for other vendors (it is for TI stuff for sure).
> 
> The main point is that when we do a system suspend and a stream is in
> PAUSED state, it will not be triggered (PAUSED == SUSPENDED/STOPPED
> assumption?). On resume, if the platform is not supporting RESUME then
> nothing will be done for the PAUSED stream, but a PAUSE_RELEASE will
> fail and all sorts of state machine assumption will break in SOF/ASoC
> stack.
> 
> I have a PR open for quite long [1] but we would like to find the best
> solution for us and possibly for others facing the same issue as well.
> 
> [1] https://github.com/thesofproject/linux/pull/5058

IMO, this kind of thing should be handled in ALSA core side.
If we want to avoid possible breakage, a flag can be introduced and
perform this conditionally, too.  It'll become a bit complex, but
that's because of the subtle hardware behavior differences,
unfortunately.

AFAIK, dmaengine PCM code assumes that the paused device can be safely
suspended / resumed as is.  There is a special handling to do pause at
snd_dmaengine_pcm_trigger(), for example.

Also, the suspend/resume after pause worked on other legacy devices,
as it seems, too.


thanks,

Takashi

> 
> Thank you,
> Peter
> ---
>  sound/soc/sof/pcm.c      | 76 ++++++++++++++++++++++++++++++++++++++++
>  sound/soc/sof/pm.c       | 11 ++++++
>  sound/soc/sof/sof-priv.h |  2 ++
>  3 files changed, 89 insertions(+)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index d584a72e6f52..0b78aa585cd5 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -760,6 +760,82 @@ static snd_pcm_sframes_t sof_pcm_delay(struct snd_soc_component *component,
>  	return 0;
>  }
>  
> +static int sof_pcm_trigger_suspended_paused_streams(struct snd_sof_dev *sdev,
> +						    int cmd)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct snd_pcm_runtime *runtime;
> +	struct snd_sof_pcm *spcm;
> +	int dir, ret;
> +
> +	list_for_each_entry(spcm, &sdev->pcm_list, list) {
> +		for_each_pcm_streams(dir) {
> +			substream = spcm->stream[dir].substream;
> +			if (!substream || !substream->runtime)
> +				continue;
> +
> +			/*
> +			 * The stream supports RESUME, it is expected that it
> +			 * is handling the corner case of suspending while
> +			 * a stream is paused
> +			 */
> +			runtime = substream->runtime;
> +			if (runtime->info & SNDRV_PCM_INFO_RESUME)
> +				continue;
> +
> +			/* Only send the trigger to a paused and suspended stream */
> +			if (runtime->state != SNDRV_PCM_STATE_SUSPENDED ||
> +			    runtime->suspended_state != SNDRV_PCM_STATE_PAUSED)
> +				continue;
> +
> +			ret = substream->ops->trigger(substream, cmd);
> +			if (ret) {
> +				spcm_err(spcm, substream->stream,
> +					 "trigger %d failed\n", cmd);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int sof_pcm_stop_paused_on_suspend(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +
> +	/*
> +	 * Handle the corner case of system suspend while at least one stream is
> +	 * paused.
> +	 * Paused streams will not receive the SUSPEND triggers, they are
> +	 * 'silently' moved to SUSPENDED state.
> +	 *
> +	 * The workaround for the corner case is applicable for streams not
> +	 * supporting RESUME.
> +	 *
> +	 * First we need to move (trigger) the paused streams to RUNNING state,
> +	 * then we need to stop them
> +	 *
> +	 * Explanation: Streams moved to SUSPENDED state from PAUSED without
> +	 * trigger. If a stream does not support RESUME then on system resume
> +	 * the RESUME trigger is not sent, the stream's state and suspended_state
> +	 * remains untouched. When the user space releases the pause then the
> +	 * core will reject this because the state of the stream is _not_ PAUSED,
> +	 * it is still SUSPENDED.
> +	 * From this point user space will do the normal (hw_params) prepare and
> +	 * START, PAUSE_RELEASE trigger will not be sent by the core after the
> +	 * system has resumed.
> +	 */
> +	ret = sof_pcm_trigger_suspended_paused_streams(sdev,
> +						       SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
> +	if (ret)
> +		return ret;
> +
> +	return sof_pcm_trigger_suspended_paused_streams(sdev,
> +							SNDRV_PCM_TRIGGER_STOP);
> +}
> +EXPORT_SYMBOL(sof_pcm_stop_paused_on_suspend);
> +
>  void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
>  {
>  	struct snd_soc_component_driver *pd = &sdev->plat_drv;
> diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
> index 8e3bcf602beb..e257d23d9d19 100644
> --- a/sound/soc/sof/pm.c
> +++ b/sound/soc/sof/pm.c
> @@ -210,6 +210,17 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
>  	if (runtime_suspend && !sof_ops(sdev)->runtime_suspend)
>  		return 0;
>  
> +	/*
> +	 * On system suspend we need special handling of paused streams
> +	 * For more details, see the comment section in
> +	 * sof_pcm_stop_paused_on_suspend)(
> +	 */
> +	if (!runtime_suspend) {
> +		ret = sof_pcm_stop_paused_on_suspend(sdev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	/* we need to tear down pipelines only if the DSP hardware is
>  	 * active, which happens for PCI devices. if the device is
>  	 * suspended, it is brought back to full power and then
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index abbb5ee7e08c..5750d9038647 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -706,6 +706,8 @@ void snd_sof_complete(struct device *dev);
>  
>  void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
>  
> +int sof_pcm_stop_paused_on_suspend(struct snd_sof_dev *sdev);
> +
>  /*
>   * Compress support
>   */
> -- 
> 2.49.0
> 
