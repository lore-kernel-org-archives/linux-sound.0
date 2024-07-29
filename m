Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81138002E
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722269902; cv=none; b=r1ddZr5BaY2UJPMD6WzjpSBTZYssd3eYMUeXYv4b7/f9Rb0YLVzecDHTf/+zowPJ3UrL+My9yA7MSA4fpcDFiJaKbVFKEUEQPm1d/kj24mp2U6EISQACerysgxnqhc7uJaxVQJXewQCWs3AqoU4j7Xdf5jrphmGJxTsAGElNqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722269902; c=relaxed/simple;
	bh=zmXL/ci9dfupNewv/ILag2YUbDdf+pqxInQRUcB+X8s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FDIAPwlqd/YjZ9DP7zGycIi71v19Z/Ah4O8jzH5q3HBaWEggIotDwDub06kLwCJYwmaZlab0NN4C4Nv7WwKq0drbpziMvGPpSCRdXsnvbn12kPyamlQRnXgzFs6j2SgJq0MkBIVpvD7umPKQmAgnrDqEN62op7UoBPjP1Oq+dqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=useC7fyd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W4fBuk7o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wE11NXdI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MmJ6M3qf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="useC7fyd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W4fBuk7o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wE11NXdI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MmJ6M3qf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C601D21AF5;
	Mon, 29 Jul 2024 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722269895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UCl/Z1s85/8VEnQ2xP+D3ZQqbYkB/nLCqxLmW404JE8=;
	b=useC7fydO5PGwm0kLmDUIVum/54R55vVfgHom59aIYiZTTRlDDlCHvz68T9iiDXj+hZuUg
	3cgXSTh8muWiZoKvMl1cEa/KmZ/S7NfRdc6O53i9OFpbmQTEIQI3G/mo2Y4mEDxrtiPLkm
	UWOmeDDl/rOWsT9/RtoeRDZvnhWPcjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722269895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UCl/Z1s85/8VEnQ2xP+D3ZQqbYkB/nLCqxLmW404JE8=;
	b=W4fBuk7oYfa93VtzT8Wyx6tbYX579rBztnOj2T1K/szNuHov2TqSxSDtGei6Y5pVE21rIp
	OV5x+jVab3fT1XDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wE11NXdI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MmJ6M3qf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722269894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UCl/Z1s85/8VEnQ2xP+D3ZQqbYkB/nLCqxLmW404JE8=;
	b=wE11NXdIkQ6RMCOyr19C4d/dPSoP9ib0ugKbp8qPmxx6pGmTn2O0efDiPJAYWtvh1hlS7c
	7QxnenZX+okVvGh60WotV06UkjOkJVKEsu4rdTbR3gXZtVmMzVi1sgyrnphY49txOplekq
	bphCHJy5xNv55yJt2Ut2HkqQnhNW/JI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722269894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UCl/Z1s85/8VEnQ2xP+D3ZQqbYkB/nLCqxLmW404JE8=;
	b=MmJ6M3qfSj4d0nbBhuf3yfXlJVZdcn8s7QveDLtiYEH2Z/9Joi2PTylgEDLDz0Z7q9dVMJ
	vqzSnSdxEGvkPeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A7AF138A7;
	Mon, 29 Jul 2024 16:18:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cuSDJMbAp2bUCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 16:18:14 +0000
Date: Mon, 29 Jul 2024 18:18:50 +0200
Message-ID: <87plqw9no5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker thread
In-Reply-To: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C601D21AF5
X-Spam-Score: -3.31
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,opensource.cirrus.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]

On Mon, 29 Jul 2024 17:59:32 +0200,
Charles Keepax wrote:
> 
> The microphone/speaker privacy shutter ALSA control handlers need to
> call pm_runtime_resume, since the hardware needs to be powered up to
> check the hardware state of the shutter. The IRQ handler for the
> shutters also needs to notify the ALSA control to inform user-space
> the shutters updated. However this leads to a mutex inversion, between
> the sdw_dev_lock and the controls_rwsem.

That's bad, how does the mutex inversion look like?  Generally
speaking, a call of snd_ctl_notify() from an irq handler is a very
standard procedure, and it should work without too much workaround.


thanks,

Takashi

> 
> To avoid this mutex inversion add a work item for handling the shutter
> IRQ and move the notifies into that.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs42l43.c | 43 +++++++++++++++++++++++++++-----------
>  sound/soc/codecs/cs42l43.h |  3 +++
>  2 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index 92674314227c4..74cb396ec0576 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -249,9 +249,10 @@ CS42L43_IRQ_COMPLETE(spkr_startup)
>  CS42L43_IRQ_COMPLETE(spkl_startup)
>  CS42L43_IRQ_COMPLETE(load_detect)
>  
> -static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
> +static void cs42l43_mic_shutter_work(struct work_struct *work)
>  {
> -	struct cs42l43_codec *priv = data;
> +	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
> +						  mic_shutter_work);
>  	static const char * const controls[] = {
>  		"Decimator 1 Switch",
>  		"Decimator 2 Switch",
> @@ -263,32 +264,47 @@ static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
>  	dev_dbg(priv->dev, "Microphone shutter changed\n");
>  
>  	if (!priv->component)
> -		return IRQ_NONE;
> +		return;
>  
>  	for (i = 0; i < ARRAY_SIZE(controls); i++) {
> -		ret = snd_soc_component_notify_control(priv->component,
> -						       controls[i]);
> +		ret = snd_soc_component_notify_control(priv->component, controls[i]);
>  		if (ret)
> -			return IRQ_NONE;
> +			dev_err(priv->dev, "Failed to notify control %s: %d\n",
> +				controls[i], ret);
>  	}
> +}
> +
> +static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
> +{
> +	struct cs42l43_codec *priv = data;
> +
> +	queue_work(system_wq, &priv->mic_shutter_work);
>  
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t cs42l43_spk_shutter(int irq, void *data)
> +static void cs42l43_spk_shutter_work(struct work_struct *work)
>  {
> -	struct cs42l43_codec *priv = data;
> +	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
> +						  mic_shutter_work);
> +	const char * const control = "Speaker Digital Switch";
>  	int ret;
>  
>  	dev_dbg(priv->dev, "Speaker shutter changed\n");
>  
>  	if (!priv->component)
> -		return IRQ_NONE;
> +		return;
>  
> -	ret = snd_soc_component_notify_control(priv->component,
> -					       "Speaker Digital Switch");
> +	ret = snd_soc_component_notify_control(priv->component, control);
>  	if (ret)
> -		return IRQ_NONE;
> +		dev_err(priv->dev, "Failed to notify control %s: %d\n", control, ret);
> +}
> +
> +static irqreturn_t cs42l43_spk_shutter(int irq, void *data)
> +{
> +	struct cs42l43_codec *priv = data;
> +
> +	queue_work(system_wq, &priv->spk_shutter_work);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -2280,6 +2296,9 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
>  	INIT_WORK(&priv->button_release_work, cs42l43_button_release_work);
>  	INIT_WORK(&priv->hp_ilimit_work, cs42l43_hp_ilimit_work);
>  
> +	INIT_WORK(&priv->mic_shutter_work, cs42l43_mic_shutter_work);
> +	INIT_WORK(&priv->spk_shutter_work, cs42l43_spk_shutter_work);
> +
>  	pm_runtime_set_autosuspend_delay(priv->dev, 100);
>  	pm_runtime_use_autosuspend(priv->dev);
>  	pm_runtime_set_active(priv->dev);
> diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
> index 9924c13e1eb53..5592aab5c8042 100644
> --- a/sound/soc/codecs/cs42l43.h
> +++ b/sound/soc/codecs/cs42l43.h
> @@ -100,6 +100,9 @@ struct cs42l43_codec {
>  	struct delayed_work hp_ilimit_clear_work;
>  	bool hp_ilimited;
>  	int hp_ilimit_count;
> +
> +	struct work_struct mic_shutter_work;
> +	struct work_struct spk_shutter_work;
>  };
>  
>  #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
> -- 
> 2.39.2
> 
> 
