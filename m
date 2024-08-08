Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E4633F7
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723095574; cv=none; b=WN+j2zF9sBBD9zY1XRqW0vf2YMNHxEaaO4EtX1osBz9+CjNr7WM11f3dM8MzXzCDRA58ZiWS/fRRSjG6kWDy2HbA3KVUWkzvPBsmeBduA0SJLs6etxJYuJLVYrJ/vE+oK4ajeTZ3YsOfaHmMXFKAOkMjzFUkXLgDPQoJ8qYjgIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723095574; c=relaxed/simple;
	bh=+4bjkO+fspaJI9TTKxO/SLaKzeMDrAjonbRbv9TMfpE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWOk4xFM6X3ToF/aEy3YM7UPku6n0nplptGAjpFUv1IsXVRolZnOamWb8e0bMJcqmFeE8rzM9thh2t0ZjXsCmJcngpWTeS7uKMY7nXi/CbYdrdxC6Tb9QxiQi/9cdNKRc2Np9np1Lph8oHY+dj3eCxrXI8DAWQyjkCCUXe7uz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m0tzhKf2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VuTewyK8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m0tzhKf2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VuTewyK8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m0tzhKf2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VuTewyK8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m0tzhKf2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VuTewyK8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B50E11FBAA;
	Thu,  8 Aug 2024 05:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723095568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INuVOAP7xraIxh870I7UZyPZu0tEy9/oAXc5CwnrA6g=;
	b=m0tzhKf2I4c954DcE47kPjY/YY5kqjEkhfIOmKclt/lhAg74xF72879OvzJgw03DRj2h7y
	J5ZJCOCiXqEV0MkbhePJOBnemCqGjOdS0ck8LHBzx6TOHTW36knyip6xXzoxbGUx/KTTbd
	u9bzxGzd1KAKnsfIvlBhViOgAmto6zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723095568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INuVOAP7xraIxh870I7UZyPZu0tEy9/oAXc5CwnrA6g=;
	b=VuTewyK8MfiUnqrn37OkS2wsnybIaj+s/bQK/eBrudzjFeJxvf7V8udPpN6Ls+tIOvX09x
	z9TBIo7dPxIxLYBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723095568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INuVOAP7xraIxh870I7UZyPZu0tEy9/oAXc5CwnrA6g=;
	b=m0tzhKf2I4c954DcE47kPjY/YY5kqjEkhfIOmKclt/lhAg74xF72879OvzJgw03DRj2h7y
	J5ZJCOCiXqEV0MkbhePJOBnemCqGjOdS0ck8LHBzx6TOHTW36knyip6xXzoxbGUx/KTTbd
	u9bzxGzd1KAKnsfIvlBhViOgAmto6zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723095568;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INuVOAP7xraIxh870I7UZyPZu0tEy9/oAXc5CwnrA6g=;
	b=VuTewyK8MfiUnqrn37OkS2wsnybIaj+s/bQK/eBrudzjFeJxvf7V8udPpN6Ls+tIOvX09x
	z9TBIo7dPxIxLYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 924A813770;
	Thu,  8 Aug 2024 05:39:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G9wOIhBatGb4XgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 05:39:28 +0000
Date: Thu, 08 Aug 2024 07:40:07 +0200
Message-ID: <875xsb6094.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Stistrup <sstistrup@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: usb-audio: Add input gain and master output mixer elements for RME Babyface Pro
In-Reply-To: <20240807191121.68614-1-sstistrup@gmail.com>
References: <20240807191121.68614-1-sstistrup@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-0.30 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -0.30

On Wed, 07 Aug 2024 21:11:21 +0200,
Stefan Stistrup wrote:
> 
> Add missing input gain and master output mixer controls for RME Babyface Pro
> 
> This patch implements:
> 
> 1. Input gain controls for 2 mic and 2 line inputs
> 2. Master output volume controls for all 12 output channels
> 
> These additions allow for more complete control of the Babyface Pro under Linux.
> 
> Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
> ---
> Changes in v2:
>  - Check invalid negative values in snd_bbfpro_gain_put
>  - Coding style fixes, blank line in snd_bbfpro_gain_update and checkpatch.pl errors

There are a few other errors and warnings detected by checkpatch.pl.
Please fix those and resubmit.


thanks,

Takashi

> 
>  sound/usb/mixer_quirks.c | 164 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 163 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 065a4be0d771..4c050110004b 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -2541,14 +2541,23 @@ enum {
>  #define SND_BBFPRO_CTL_REG2_PAD_AN1 4
>  #define SND_BBFPRO_CTL_REG2_PAD_AN2 5
> 
> -#define SND_BBFPRO_MIXER_IDX_MASK 0x1ff
> +#define SND_BBFPRO_MIXER_MAIN_OUT_CH_OFFSET 992
> +#define SND_BBFPRO_MIXER_IDX_MASK 0x3ff
>  #define SND_BBFPRO_MIXER_VAL_MASK 0x3ffff
>  #define SND_BBFPRO_MIXER_VAL_SHIFT 9
>  #define SND_BBFPRO_MIXER_VAL_MIN 0 // -inf
>  #define SND_BBFPRO_MIXER_VAL_MAX 65536 // +6dB
> 
> +#define SND_BBFPRO_GAIN_CHANNEL_MASK 0x03
> +#define SND_BBFPRO_GAIN_CHANNEL_SHIFT 7
> +#define SND_BBFPRO_GAIN_VAL_MASK 0x7f
> +#define SND_BBFPRO_GAIN_VAL_MIN 0
> +#define SND_BBFPRO_GAIN_VAL_MIC_MAX 65
> +#define SND_BBFPRO_GAIN_VAL_LINE_MAX 18 // 9db in 0.5db incraments
> +
>  #define SND_BBFPRO_USBREQ_CTL_REG1 0x10
>  #define SND_BBFPRO_USBREQ_CTL_REG2 0x17
> +#define SND_BBFPRO_USBREQ_GAIN 0x1a
>  #define SND_BBFPRO_USBREQ_MIXER 0x12
> 
>  static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
> @@ -2695,6 +2704,115 @@ static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
>  	return snd_bbfpro_ctl_update(list->mixer, reg, idx, value);
>  }
> 
> +static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
> +				  u8 channel, u8 gain)
> +{
> +	int err;
> +	struct snd_usb_audio *chip = mixer->chip;
> +
> +	if (channel < 2) {
> +		// XLR preamp: 3-bit fine, 5-bit coarse; special case >60
> +		if (gain < 60)
> +			gain = ((gain % 3) << 5) | (gain / 3);
> +		else
> +			gain = ((gain % 6) << 5) | (60 / 3);
> +	}
> +
> +	err = snd_usb_lock_shutdown(chip);
> +	if (err < 0)
> +		return err;
> +
> +	err = snd_usb_ctl_msg(chip->dev,
> +				usb_sndctrlpipe(chip->dev, 0),
> +				SND_BBFPRO_USBREQ_GAIN,
> +				USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> +				gain, channel, NULL, 0);
> +
> +	snd_usb_unlock_shutdown(chip);
> +	return err;
> +}
> +
> +static int snd_bbfpro_gain_get(struct snd_kcontrol *kcontrol,
> +                               struct snd_ctl_elem_value *ucontrol)
> +{
> +	int value = kcontrol->private_value & SND_BBFPRO_GAIN_VAL_MASK;
> +	ucontrol->value.integer.value[0] = value;
> +	return 0;
> +}
> +
> +static int snd_bbfpro_gain_info(struct snd_kcontrol *kcontrol,
> +                                struct snd_ctl_elem_info *uinfo)
> +{
> +	int pv, channel;
> +
> +	pv = kcontrol->private_value;
> +	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
> +		  SND_BBFPRO_GAIN_CHANNEL_MASK;
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = SND_BBFPRO_GAIN_VAL_MIN;
> +
> +	if (channel < 2) {
> +		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_MIC_MAX;
> +	} else {
> +		uinfo->value.integer.max = SND_BBFPRO_GAIN_VAL_LINE_MAX;
> +	}
> +
> +	return 0;
> +}
> +
> +static int snd_bbfpro_gain_put(struct snd_kcontrol *kcontrol,
> +                               struct snd_ctl_elem_value *ucontrol)
> +{
> +	int pv, channel, old_value, value, err;
> +
> +	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> +	struct usb_mixer_interface *mixer = list->mixer;
> +
> +	pv = kcontrol->private_value;
> +	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
> +		  SND_BBFPRO_GAIN_CHANNEL_MASK;
> +	old_value = pv & SND_BBFPRO_GAIN_VAL_MASK;
> +	value = ucontrol->value.integer.value[0];
> +
> +	if (value < SND_BBFPRO_GAIN_VAL_MIN)
> +		return -EINVAL;
> +
> +	if (channel < 2) {
> +		if (value > SND_BBFPRO_GAIN_VAL_MIC_MAX)
> +			return -EINVAL;
> +	} else {
> +		if (value > SND_BBFPRO_GAIN_VAL_LINE_MAX)
> +			return -EINVAL;
> +	}
> +
> +	if (value == old_value)
> +		return 0;
> +
> +	err = snd_bbfpro_gain_update(mixer, channel, value);
> +	if (err < 0)
> +		return err;
> +
> +	kcontrol->private_value =
> +		  (channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT) | value;
> +	return 1;
> +}
> +
> +static int snd_bbfpro_gain_resume(struct usb_mixer_elem_list *list)
> +{
> +	int pv, channel, value;
> +
> +	struct snd_kcontrol *kctl = list->kctl;
> +
> +	pv = kctl->private_value;
> +	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
> +		  SND_BBFPRO_GAIN_CHANNEL_MASK;
> +	value = pv & SND_BBFPRO_GAIN_VAL_MASK;
> +
> +	return snd_bbfpro_gain_update(list->mixer, channel, value);
> +}
> +
>  static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
>  				 u32 value)
>  {
> @@ -2790,6 +2908,15 @@ static const struct snd_kcontrol_new snd_bbfpro_ctl_control = {
>  	.put = snd_bbfpro_ctl_put
>  };
> 
> +static const struct snd_kcontrol_new snd_bbfpro_gain_control = {
> +	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
> +	.index = 0,
> +	.info = snd_bbfpro_gain_info,
> +	.get = snd_bbfpro_gain_get,
> +	.put = snd_bbfpro_gain_put
> +};
> +
>  static const struct snd_kcontrol_new snd_bbfpro_vol_control = {
>  	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
>  	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
> @@ -2813,6 +2940,18 @@ static int snd_bbfpro_ctl_add(struct usb_mixer_interface *mixer, u8 reg,
>  		&knew, NULL);
>  }
> 
> +static int snd_bbfpro_gain_add(struct usb_mixer_interface *mixer, u8 channel,
> +                               char *name)
> +{
> +	struct snd_kcontrol_new knew = snd_bbfpro_gain_control;
> +
> +	knew.name = name;
> +	knew.private_value = channel << SND_BBFPRO_GAIN_CHANNEL_SHIFT;
> +
> +	return add_single_ctl_with_resume(mixer, 0, snd_bbfpro_gain_resume,
> +		&knew, NULL);
> +}
> +
>  static int snd_bbfpro_vol_add(struct usb_mixer_interface *mixer, u16 index,
>  			      char *name)
>  {
> @@ -2860,6 +2999,29 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
>  		}
>  	}
> 
> +	// Main out volume
> +	for (i = 0 ; i < 12 ; ++i) {
> +		snprintf(name, sizeof(name), "Main-Out %s", output[i]);
> +		// Main outs are offset to 992
> +		err = snd_bbfpro_vol_add(mixer,
> +					 i + SND_BBFPRO_MIXER_MAIN_OUT_CH_OFFSET,
> +					 name);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	// Input gain
> +	for (i = 0 ; i < 4 ; ++i) {
> +		if (i < 2) {
> +			snprintf(name, sizeof(name), "Mic-%s Gain", input[i]);
> +		} else {
> +			snprintf(name, sizeof(name), "Line-%s Gain", input[i]);
> +		}
> +		err = snd_bbfpro_gain_add(mixer, i, name);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	// Control Reg 1
>  	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
>  				 SND_BBFPRO_CTL_REG1_CLK_OPTICAL,
> --
> 2.45.2
> 
