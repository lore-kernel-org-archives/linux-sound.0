Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B635C6BD
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787475467; cv=none; b=iTksvZ7MhPSebAPOudZC0cw3/U4LsF9BzKD8ZWFQluyZV1LcWlWZoDvpmyBcnOm3j7NX9bo6QmzvNavzBHUDtDke53loiEHwClPeuj/suJfQMMcIyp4IJ5YVkYOx9IalKl+Q7F05MUrzdpX5iGnG2pegHMg6NsEf3BXjqw7+nyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787475467; c=relaxed/simple;
	bh=3yEF8Awo7U3aEZgkuo7607yUpRLu4p5aPuP8ZN9/fQg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kibwSnCGqO8EuuSrAzN0OxL0pGx2kBJCa4IFTEbVNSTq+sAScV+rzRx/uxqMq8sFO1lnFfhWycaJlZ1b2iyZYyRRioNSyX0YWxUX/Fen/89hs6RWu02As7XV4qMuD9b7oy7Lq+cSAvjr0Ir2wS28HhID3jIlGB+NiYYkQbXA0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OR55lZ4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HeyaKHiy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VqRzfylN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/iJEQZu2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OR55lZ4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HeyaKHiy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VqRzfylN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/iJEQZu2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3D3A7861D2;
	Sun, 23 Aug 2026 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxNW4IRzXyWK0vkj4m74M3luPnlArT9L/wG846cgGro=;
	b=OR55lZ4sqU7slBZvkk2k6q459PczwkY1HFnYJQg2elvmQCrNtyyGYovugBpWDi1+l/c9R3
	F6IqcwRE3nRb02R4igpJFCrYxQEinTz9PXBWPRjWfF1rlWlvAsILgnnlQ6qd6fKmnPuDI9
	1w9BfXVcAARpJ6cidZTRCkddVMmEyDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxNW4IRzXyWK0vkj4m74M3luPnlArT9L/wG846cgGro=;
	b=HeyaKHiyAtA+oEYvqFW9BjgrQRkU7VF4Tm80mFxsfOZPAni+4l5NJO4kDhv7ZJ0hGXIKju
	qhzVkNhZkuC6gvDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VqRzfylN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/iJEQZu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787475449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxNW4IRzXyWK0vkj4m74M3luPnlArT9L/wG846cgGro=;
	b=VqRzfylNqNTORJGfhNzLnw+9IQN4y/Wta8Un8g8PhW+zfHREBqBEpB3qVZmY0HbB1cIwuZ
	Dou/baw0C5ksouilHBqA2mfHK2Uj8nQXViJ/w6SWEo6aGX+v/AlMgzsDscK6+PHX9LtSNd
	9T9SOyUccuotbXGDnGg88dL1HkKgK6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787475449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxNW4IRzXyWK0vkj4m74M3luPnlArT9L/wG846cgGro=;
	b=/iJEQZu25Mj+WHPPIdwbyFJQqvEBJz0tSvGtoc8Wu1GyYMVWVgOfKT4V/MBV4N2TfkLPp8
	91mfFAcU7Vu5cxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F384213332;
	Sun, 23 Aug 2026 08:57:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F8kZOfi1imoYBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 23 Aug 2026 08:57:28 +0000
Date: Sun, 23 Aug 2026 10:57:28 +0200
Message-ID: <87ld9xw6x3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Habil_Eren_T=FCrker=22?= <habilerenturker@gmail.com>
Cc: perex@perex.cz,	tiwai@suse.com,	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,	Habil Eren =?ISO-8859-1?Q?T=FCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt speaker mute LED
In-Reply-To: <20260821205717.3219-1-habilerenturker@hotmail.com>
References: <20260821205717.3219-1-habilerenturker@hotmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,alsa-project.org,vger.kernel.org,hotmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 3D3A7861D2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Fri, 21 Aug 2026 22:57:06 +0200,
Habil Eren Türker wrote:
> 
> HP Laptop 15-fd0039nt (SSID 103c:8bb6) has a speaker mute LED that is
> controlled via VREF100 on NID 0x1a. Unlike standard implementations, this
> device requires PIN_VREF100 (0x24) to turn the LED on and PIN_IN (0x20)
> to turn it off, with active-high polarity.
> 
> The existing ALC236_FIXUP_HP_MICMUTE_LED_ONLY quirk only handles the
> microphone mute LED, so this patch adds a new fixup
> ALC236_FIXUP_HP_15_FD0XXX that covers both:
> - Mic mute LED via GPIO0 (active-low)
> - Speaker mute LED via NID 0x1a VREF100
> 
> The patch also adds a custom power_filter to ensure the pin remains
> powered during suspend, and a shutdown hook to restore the pin state.
> 
> Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
> Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 59 ++++++++++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 01b87267f..d19935be3 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1364,16 +1364,57 @@ static void alc269_fixup_hp_gpio_led(struct hda_codec *codec,
>  	alc_fixup_hp_gpio_led(codec, action, 0x08, 0x10);
>  }
>  
> -static void alc236_fixup_hp_micmute_led_only(struct hda_codec *codec,
> -				const struct hda_fixup *fix, int action)
> +/* Patch for HP 15-fd0xxx (8BB6) Speaker Mute LED & Mic-Mute LED */
> +
> +static void hp_8bb6_shutup(struct hda_codec *codec)
> +{
> +	snd_hda_shutup_pins(codec);
> +	snd_hda_set_pin_ctl(codec, 0x1a,
> +			   snd_hda_codec_get_pin_target(codec, 0x1a));
> +}
> +
> +static unsigned int hp_8bb6_power_filter(struct hda_codec *codec,
> +					  hda_nid_t nid,
> +					  unsigned int power_state)
> +{
> +	if (nid == 0x1a)
> +		return AC_PWRST_D0;
> +	return snd_hda_gen_path_power_filter(codec, nid, power_state);
> +}
> +
> +static int hp_8bb6_speaker_mute_led_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +{
> +	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
> +	unsigned int val = (brightness == LED_OFF) ? PIN_IN : PIN_VREF100;
> +
> +	snd_hda_set_pin_ctl_cache(codec, 0x1a, val);
> +	return 0;
> +}
> +
> +static void alc236_fixup_hp_15_fd0xxx(struct hda_codec *codec,
> +				      const struct hda_fixup *fix,
> +				      int action)
>  {
>  	struct alc_spec *spec = codec->spec;
>  
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
>  		spec->micmute_led_polarity = 1;
> -	alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
> -}
> +		alc_fixup_hp_gpio_led(codec, action, 0x00, 0x01);
> +		spec->mute_led_polarity = 0;
> +		snd_hda_gen_add_mute_led_cdev(codec, hp_8bb6_speaker_mute_led_set);
> +		codec->power_filter = hp_8bb6_power_filter;
> +		codec->power_save_node = 0;
> +		spec->shutup = hp_8bb6_shutup;
> +		break;
>  
> +	case HDA_FIXUP_ACT_INIT:
> +		if (spec->gen.vmaster_mute.hook)
> +			snd_hda_sync_vmaster_hook(&spec->gen.vmaster_mute);
> +		break;
> +	}
> +}

Hmm, the whole workarounds look too much.
For example, power_save_node is already turned off as default in
alc269_probe().

And, if the pin-shutup causes a problem, you can simply set
spec->no_shutup_pins flag.

And, this is an enhancement of the existing quirk entry, you can
mention the relevant commit, too.


thanks,

Takashi
