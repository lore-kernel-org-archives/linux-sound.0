Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE41131E82D
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297275; cv=none; b=lELt1e/X+uTY1zjkle1Fw9+qrTE/yPm7f3fko7urWIaAavtn7jQmhSo1QmiJh9U+65UJ57JofTBjbS6Dno6A5uHqw43+NQHmTQ34PKVzXyKkg1xGAJgbYVVYmr5R11cZAZsmyCiM+fZbgzNst/YYuFbOxyOcM4Pzr3lnGkwaB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297275; c=relaxed/simple;
	bh=b0Vo82+eZuGNjRdpJ0iBdgl1anMj+Q4iPpK3/MvMcco=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZurlFi3LwPLuzOFK3Zhb4GIO2E/1/56nu6MOrZeSxFhUiS9GtUrIiA5+cyijU+8019JjLG/33CaHfD1e4XmCEUtwWnEk1U2DRU0Cwvapbo6bRwrOrrllmZ0kYuc02BQ4I4k7MHbgzmYMbM7hOs9vkLdlsUp2inTGFEv01NQP/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=09mL68zV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wb1eKXJP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=09mL68zV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wb1eKXJP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="09mL68zV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wb1eKXJP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="09mL68zV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wb1eKXJP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3EB6F4D336;
	Thu, 12 Mar 2026 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773297271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ccKlMi6j5KQTfuov03oFwcV3Us2aGFdAxgl9b6Uv/2E=;
	b=09mL68zVZ95EwNMJRHJQctH+qYXwfCi2SEtnf1jIU945YDQPm6DxutfKe+s1j4N10w6e9K
	NRiaF0PHbQ9YzVL+qY/gSINDDJhJ2AWrx29UxNcARf718NetsVoguNCDi3PXQUCo2CMDRF
	Xz9hbQC414DiILa98NRrjhcr3PBdqyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773297271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ccKlMi6j5KQTfuov03oFwcV3Us2aGFdAxgl9b6Uv/2E=;
	b=Wb1eKXJP+NpGLS8L5tAabQos4Erd9GMl3arx/Uf66EaIKz5FastdKIQB1BbPnV3fCrK1En
	TAmZWlim3V1T1NDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773297271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ccKlMi6j5KQTfuov03oFwcV3Us2aGFdAxgl9b6Uv/2E=;
	b=09mL68zVZ95EwNMJRHJQctH+qYXwfCi2SEtnf1jIU945YDQPm6DxutfKe+s1j4N10w6e9K
	NRiaF0PHbQ9YzVL+qY/gSINDDJhJ2AWrx29UxNcARf718NetsVoguNCDi3PXQUCo2CMDRF
	Xz9hbQC414DiILa98NRrjhcr3PBdqyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773297271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ccKlMi6j5KQTfuov03oFwcV3Us2aGFdAxgl9b6Uv/2E=;
	b=Wb1eKXJP+NpGLS8L5tAabQos4Erd9GMl3arx/Uf66EaIKz5FastdKIQB1BbPnV3fCrK1En
	TAmZWlim3V1T1NDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15DD43FE26;
	Thu, 12 Mar 2026 06:34:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ap8zBHdesmnMcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Mar 2026 06:34:31 +0000
Date: Thu, 12 Mar 2026 07:34:30 +0100
Message-ID: <87tsuld095.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: usb-audio: use kzalloc_flex
In-Reply-To: <20260311232748.18697-1-rosenp@gmail.com>
References: <20260311232748.18697-1-rosenp@gmail.com>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 12 Mar 2026 00:27:48 +0100,
Rosen Penev wrote:
> 
> Saves one allocation by using a flexible array member.

As it's a fixed size array, it doesn't have to be a flex array at all,
so it can be even simpler.


thanks,

Takashi

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/usb/mixer.c | 22 +++++++---------------
>  sound/usb/mixer.h |  5 +++--
>  2 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 7007e0c9489b..337815b9e72c 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1393,7 +1393,7 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
>  		if (!cval->initialized) {
>  			get_min_max_with_quirks(cval, 0, kcontrol);
>  			if (cval->initialized && cval->dBmin >= cval->dBmax) {
> -				kcontrol->vd[0].access &= 
> +				kcontrol->vd[0].access &=
>  					~(SNDRV_CTL_ELEM_ACCESS_TLV_READ |
>  					  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK);
>  				snd_ctl_notify(cval->head.mixer->chip->card,
> @@ -3006,15 +3006,12 @@ static void snd_usb_mixer_free(struct usb_mixer_interface *mixer)
>  	snd_usb_mixer_disconnect(mixer);
>  
>  	/* Unregister controls first, snd_ctl_remove() frees the element */
> -	if (mixer->id_elems) {
> -		for (id = 0; id < MAX_ID_ELEMS; id++) {
> -			for (list = mixer->id_elems[id]; list; list = next) {
> -				next = list->next_id_elem;
> -				if (list->kctl)
> -					snd_ctl_remove(mixer->chip->card, list->kctl);
> -			}
> +	for (id = 0; id < MAX_ID_ELEMS; id++) {
> +		for (list = mixer->id_elems[id]; list; list = next) {
> +			next = list->next_id_elem;
> +			if (list->kctl)
> +				snd_ctl_remove(mixer->chip->card, list->kctl);
>  		}
> -		kfree(mixer->id_elems);
>  	}
>  	if (mixer->urb) {
>  		kfree(mixer->urb->transfer_buffer);
> @@ -3652,16 +3649,11 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif)
>  
>  	strscpy(chip->card->mixername, "USB Mixer");
>  
> -	mixer = kzalloc_obj(*mixer);
> +	mixer = kzalloc_flex(*mixer, id_elems, MAX_ID_ELEMS);
>  	if (!mixer)
>  		return -ENOMEM;
>  	mixer->chip = chip;
>  	mixer->ignore_ctl_error = !!(chip->quirk_flags & QUIRK_FLAG_IGNORE_CTL_ERROR);
> -	mixer->id_elems = kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
> -	if (!mixer->id_elems) {
> -		kfree(mixer);
> -		return -ENOMEM;
> -	}
>  
>  	mixer->hostif = &usb_ifnum_to_if(chip->dev, ctrlif)->altsetting[0];
>  	switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
> diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
> index 167fbfcf01ac..30dd30b925fc 100644
> --- a/sound/usb/mixer.h
> +++ b/sound/usb/mixer.h
> @@ -19,8 +19,6 @@ struct usb_mixer_interface {
>  	struct list_head list;
>  	unsigned int ignore_ctl_error;
>  	struct urb *urb;
> -	/* array[MAX_ID_ELEMS], indexed by unit id */
> -	struct usb_mixer_elem_list **id_elems;
>  
>  	/* the usb audio specification version this interface complies to */
>  	int protocol;
> @@ -42,6 +40,9 @@ struct usb_mixer_interface {
>  	void *private_data;
>  	void (*private_free)(struct usb_mixer_interface *mixer);
>  	void (*private_suspend)(struct usb_mixer_interface *mixer);
> +
> +	/* array[MAX_ID_ELEMS], indexed by unit id */
> +	struct usb_mixer_elem_list *id_elems[];
>  };
>  
>  #define MAX_CHANNELS	16	/* max logical channels */
> -- 
> 2.53.0
> 
