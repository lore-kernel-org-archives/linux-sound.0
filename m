Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B09390C98
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710747; cv=none; b=pQoOGcwldAytjer4gjOry9pn9t0yVU+vVczYPtAH++/GI4VYVFLYbrAk8AkajTqSPN0FU0NJdAe97NzXrwQe+Hte2XNumtlrM5r5EoL1p5nNjF3f3IA+HYwMbiShtn3lp1HYL7JbX46HYZr83GMSgorb4jxLnpu/4MnkIwOAV2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710747; c=relaxed/simple;
	bh=gAwbqVAbvtovkWNbvxGpZhOb4EGTwqcQ+sA9C3aQ5TQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOT8IFr+Apgc5TOuzD8+PpDUpU1AUd9FooSLWm+vVAuXNRarBBlCm5uF7FTiwRuGjs6ZH11FKoqG1LhSlCE1IVGF98FULUC68WZqaj/Xzp9XaIGqwx7KAT2xMdCvfwBR692sQBWhadmHufQ5TgoX5AcwgAinKkJLyIYn78SqRL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OkuNjZeE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4z9q5Osh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OkuNjZeE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4z9q5Osh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OkuNjZeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4z9q5Osh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OkuNjZeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4z9q5Osh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 877F15BCD5;
	Thu,  5 Mar 2026 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl9nlUpIuPmsiULjqlseAdMCGZg93IbIU9y6iXHzfOM=;
	b=OkuNjZeEmy68xYzfFEcfqfNAvR7rsglAtqWu2iZUkOt/4tsj2wppOyiiYpYOD4Z7RIECAl
	DrYIPLJaf+ai5UXOOIo3EobHUY1uUE6RMH9BSdDLFmM3QjqxDhnrfxDgyH7auOCuuEJ0QK
	FcfHQb4bf0HeNwbiqobDtZAv6VyZT7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl9nlUpIuPmsiULjqlseAdMCGZg93IbIU9y6iXHzfOM=;
	b=4z9q5OshCKDVOhH+zvVYR+ux6JTo9k6xymoXMUSWAaJN29mdgV0FjUt0/KpaNMyirXlNR0
	3Y/9TSGUKYSmI3Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772710742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl9nlUpIuPmsiULjqlseAdMCGZg93IbIU9y6iXHzfOM=;
	b=OkuNjZeEmy68xYzfFEcfqfNAvR7rsglAtqWu2iZUkOt/4tsj2wppOyiiYpYOD4Z7RIECAl
	DrYIPLJaf+ai5UXOOIo3EobHUY1uUE6RMH9BSdDLFmM3QjqxDhnrfxDgyH7auOCuuEJ0QK
	FcfHQb4bf0HeNwbiqobDtZAv6VyZT7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772710742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl9nlUpIuPmsiULjqlseAdMCGZg93IbIU9y6iXHzfOM=;
	b=4z9q5OshCKDVOhH+zvVYR+ux6JTo9k6xymoXMUSWAaJN29mdgV0FjUt0/KpaNMyirXlNR0
	3Y/9TSGUKYSmI3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C7D83EA68;
	Thu,  5 Mar 2026 11:39:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kfFZEVZrqWkDPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 11:39:02 +0000
Date: Thu, 05 Mar 2026 12:39:01 +0100
Message-ID: <87cy1iy08a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH 4/4] ALSA: hda/senary: Fix microphone boost stability
In-Reply-To: <20260305032756.236440-1-wangdich9700@163.com>
References: <20260305032756.236440-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 05 Mar 2026 04:27:56 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Some SN6186 platforms experience microphone gain fluctuation.

What does this mean actually...?

> This patch adds a capture sync hook to lock the microphone boost
> to a default value read during initialization, ensuring stable
> recording levels.

But it means that the mic boost value changed by users (via mixer)
won't be followed at all?  Sounds fishy.


thanks,

Takashi

> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/senarytech.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
> index c589b3b01171..9c6bad6e3866 100644
> --- a/sound/hda/codecs/senarytech.c
> +++ b/sound/hda/codecs/senarytech.c
> @@ -31,6 +31,7 @@ struct senary_spec {
>  	unsigned int parse_flags; /* flag for snd_hda_parse_pin_defcfg() */
>  
>  	int mute_led_polarity;
> +	unsigned char default_mic_boost[0x25];
>  	unsigned int gpio_led;
>  	unsigned int gpio_mute_led_mask;
>  	unsigned int gpio_mic_led_mask;
> @@ -162,6 +163,30 @@ static void senary_playback_hook(struct hda_pcm_stream *hinfo,
>  	}
>  }
>  
> +static void senary_fixed_mic_boost(struct hda_codec *codec, hda_nid_t nid)
> +{
> +	unsigned char value;
> +	struct senary_spec *spec = codec->spec;
> +
> +	if (!spec->default_mic_boost[nid])
> +		return;
> +
> +	value = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
> +	if (value != spec->default_mic_boost[nid])
> +		snd_hda_codec_amp_stereo(codec, nid, HDA_INPUT, 0,
> +				HDA_AMP_VOLMASK, spec->default_mic_boost[nid]);
> +}
> +
> +static void senary_cap_sync_hook(struct hda_codec *codec,
> +		struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct senary_spec *spec = codec->spec;
> +	hda_nid_t nid = spec->gen.imux_pins[spec->gen.cur_mux[0]];
> +
> +	senary_fixed_mic_boost(codec, nid);
> +}
> +
>  static void senary_auto_turn_eapd(struct hda_codec *codec, int num_pins,
>  			      const hda_nid_t *pins, bool on)
>  {
> @@ -251,6 +276,7 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  {
>  	struct senary_spec *spec;
>  	int err;
> +	int i;
>  
>  	codec_info(codec, "%s: BIOS auto-probing.\n", codec->core.chip_name);
>  
> @@ -307,6 +333,13 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	if (codec->core.vendor_id == 0x1fa86186)
>  		spec->gen.pcm_playback_hook = senary_playback_hook;
>  
> +	/* Initialize and fix mic boost */
> +	for (i = 0; i < ARRAY_SIZE(spec->default_mic_boost); i++) {
> +		spec->default_mic_boost[i] = snd_hda_codec_read(codec, i, 0,
> +				AC_VERB_GET_AMP_GAIN_MUTE, 0);
> +	}
> +	spec->gen.cap_sync_hook = senary_cap_sync_hook;
> +
>  	/* Some laptops with Senary chips show stalls in S3 resume,
>  	 * which falls into the single-cmd mode.
>  	 * Better to make reset, then.
> -- 
> 2.25.1
> 
