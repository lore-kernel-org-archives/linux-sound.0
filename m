Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20123B638
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773566844; cv=none; b=bznk7BiRqml5ozBZdh/siVQSDNZgWlNotsvUlujRb5RZuMJTegsIIBMnImgiVzvejTmWASPh7WAoug/I06WisE7aOcNHBICBvynUtiibA0d+UVLwzYm7s83Y03dZ+u5AGCHRSZCfJXtAaP4Ze3clYgcL9o2cFCfD53eZs30kucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773566844; c=relaxed/simple;
	bh=T81WL0PaK+qj3M9vEfUZsT2kSFHMJWNboHezau28HSk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/GtZzQAAf8kRhkJ3wf1eJCFMVse3Bcc2eI91Gj3fGNHNkuKnCUq2DL2EN8p5B52I74ZVAra/5V+aGX3My7aOU1ePMG1fV3215EHpBZG6rXzLYxocWktVDAouD+1HDOjuuU+CpLmuFeaqDQhen7TazEGNFoUdPBjwxH4vp71/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gRrWBdRL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ghmiebER; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wRWiGcwz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lkPNH6bq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gRrWBdRL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ghmiebER";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wRWiGcwz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lkPNH6bq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0A215BDB3;
	Sun, 15 Mar 2026 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773566840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/A0M8m6Z7+mXUg/ebLeJKMIluQ2HlRkZO+6ZQxj94E=;
	b=gRrWBdRLRJR4p8i8/KTC5GQl/Fy/a9sp9GlVnC0+Sb8kIPsdWgb8Q0Uhaon5QJTOC8Zp85
	3k8sV/OAKeWq1zEW3vjBRtxQATgWO5V7WQM0oPh50wuT9Lc8opWmrXEHB2AXqDQ+nGVIue
	HdpOXrPmLJaAi7GqHZJV9XYSKZNFGak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773566840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/A0M8m6Z7+mXUg/ebLeJKMIluQ2HlRkZO+6ZQxj94E=;
	b=ghmiebERsQ3URzpq0gKJE/U+RB6qPWSxUc+Uk5ikauxI85xDb+MrI+fd77enpAHVWGUmmO
	ZHM4S+VKypSm++Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wRWiGcwz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lkPNH6bq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773566838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/A0M8m6Z7+mXUg/ebLeJKMIluQ2HlRkZO+6ZQxj94E=;
	b=wRWiGcwzWyCrSx2x7rz+GhTDGvgh3OcLaD6WATSMBmQNEvQVgJl4TUosCpQsxBlcJKeqQk
	dYIrpZKQbNo/dTeuYMh1aHmB1Q3dzTnCiHmPuta7Bmuk3Ht2Q8HYpnIxZmlz+eZ0rCkFys
	bVLjIzCFk2qtfXOuGoxDSAJR557uO4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773566838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/A0M8m6Z7+mXUg/ebLeJKMIluQ2HlRkZO+6ZQxj94E=;
	b=lkPNH6bq2Wn1GqyFEC1DVajTSiS3aNj5AbqXfU0qw2sTtob0xEAO+Q31L8RH0edrKtg+Wa
	2y7YTSYiZVxBthDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98E8F4273B;
	Sun, 15 Mar 2026 09:27:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GRQuJHZ7tmmpFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 15 Mar 2026 09:27:18 +0000
Date: Sun, 15 Mar 2026 10:27:18 +0100
Message-ID: <87ms09a1e1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Edip Hazuri <edip@medip.dev>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
In-Reply-To: <20260314193434.8237-1-sean@starlabs.systems>
References: <4d5fb71b132bb283fd41c622b8413770b2065242.1771532060.git.sean@starlabs.systems>
	<20260314193434.8237-1-sean@starlabs.systems>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starlabs.systems:email,suse.com:email,perex.cz:email,suse.de:dkim,suse.de:mid,cirrus.com:email,medip.dev:email,realtek.com:email,canonical.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E0A215BDB3

On Sat, 14 Mar 2026 20:34:34 +0100,
Sean Rhodes wrote:
> 
> The initial StarFighter quirk fixed the runtime suspend pop by muting
> speakers in the shutup callback before power-down. Further hardware
> validation showed that the speaker path is controlled directly by LINE2
> EAPD on NID 0x1b together with GPIO2 for the external amplifier.
> 
> Replace the shutup-delay workaround with explicit sequencing of those
> controls at playback start and stop:
> - assert LINE2 EAPD and drive GPIO2 high on PREPARE
> - deassert LINE2 EAPD and drive GPIO2 low on CLEANUP
> 
> This avoids the runtime suspend pop without a sleep, and also fixes pops
> around G3 entry and display-manager start that the original workaround
> did not cover.
> 
> Fixes: 1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Kailang Yang <kailang@realtek.com>
> Cc: Chris Chiu <chris.chiu@canonical.com>
> Cc: Edip Hazuri <edip@medip.dev>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Sean Rhodes <sean@starlabs.systems>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Thanks, it's better than the previous patchset, but...

> ---
>  sound/hda/codecs/realtek/alc269.c | 64 ++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 19 deletions(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 4c49f1195e1b..901314a7af51 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1017,24 +1017,6 @@ static int alc269_resume(struct hda_codec *codec)
>  	return 0;
>  }
>  
> -#define STARLABS_STARFIGHTER_SHUTUP_DELAY_MS	30
> -
> -static void starlabs_starfighter_shutup(struct hda_codec *codec)
> -{
> -	if (snd_hda_gen_shutup_speakers(codec))
> -		msleep(STARLABS_STARFIGHTER_SHUTUP_DELAY_MS);
> -}
> -
> -static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
> -					      const struct hda_fixup *fix,
> -					      int action)
> -{
> -	struct alc_spec *spec = codec->spec;
> -
> -	if (action == HDA_FIXUP_ACT_PRE_PROBE)
> -		spec->shutup = starlabs_starfighter_shutup;
> -}
> -
>  static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
>  						 const struct hda_fixup *fix, int action)
>  {
> @@ -1454,6 +1436,32 @@ static void alc274_hp_envy_pcm_hook(struct hda_pcm_stream *hinfo,
>  	}
>  }
>  
> +#define ALC233_STARFIGHTER_SPK_PIN	0x1b
> +#define ALC233_STARFIGHTER_GPIO2	0x04
> +
> +static void alc233_starfighter_update_amp(struct hda_codec *codec, bool on)
> +{
> +	snd_hda_codec_write(codec, ALC233_STARFIGHTER_SPK_PIN, 0,
> +			    AC_VERB_SET_EAPD_BTLENABLE,
> +			    on ? AC_EAPDBTL_EAPD : 0);
> +	alc_update_gpio_data(codec, ALC233_STARFIGHTER_GPIO2, on);
> +}
> +
> +static void alc233_starfighter_pcm_hook(struct hda_pcm_stream *hinfo,
> +					struct hda_codec *codec,
> +					struct snd_pcm_substream *substream,
> +					int action)
> +{
> +	switch (action) {
> +	case HDA_GEN_PCM_ACT_PREPARE:
> +		alc233_starfighter_update_amp(codec, true);
> +		break;
> +	case HDA_GEN_PCM_ACT_CLEANUP:
> +		alc233_starfighter_update_amp(codec, false);
> +		break;
> +	}
> +}
> +
>  static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
>  				      const struct hda_fixup *fix,
>  				      int action)
> @@ -1467,6 +1475,24 @@ static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
> +					      const struct hda_fixup *fix,
> +					      int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->gpio_mask |= ALC233_STARFIGHTER_GPIO2;
> +		spec->gpio_dir |= ALC233_STARFIGHTER_GPIO2;
> +		spec->gpio_data &= ~ALC233_STARFIGHTER_GPIO2;
> +		break;
> +	case HDA_FIXUP_ACT_PROBE:
> +		spec->gen.pcm_playback_hook = alc233_starfighter_pcm_hook;
> +		break;
> +	}
> +}

... it'd be even better not to move the place of the function but
keeps at the same position.  

>  static void alc_update_coef_led(struct hda_codec *codec,
>  				struct alc_coef_led *led,
>  				bool polarity, bool on)
> @@ -4058,7 +4084,6 @@ enum {
>  	ALC245_FIXUP_CLEVO_NOISY_MIC,
>  	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
>  	ALC233_FIXUP_MEDION_MTL_SPK,
> -	ALC233_FIXUP_STARLABS_STARFIGHTER,
>  	ALC294_FIXUP_BASS_SPEAKER_15,
>  	ALC283_FIXUP_DELL_HP_RESUME,
>  	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
> @@ -4074,6 +4099,7 @@ enum {
>  	ALC288_FIXUP_SURFACE_SWAP_DACS,
>  	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
>  	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
> +	ALC233_FIXUP_STARLABS_STARFIGHTER,
>  	ALC245_FIXUP_BASS_HP_DAC,
>  	ALC245_FIXUP_ACER_MICMUTE_LED,

Ditto, there is no need for move the position.

By keeping the positions, we can concentrate only on what's really
changed.

Please resubmit with those corrections.


thanks,

Takashi
