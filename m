Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D02D249A
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800907; cv=none; b=mbqSDB7Uq/5o/wxt8vzeqqaGbI2EeCnQNQmi79V5nWJ8vzF8sCVsbTElLlBxjeISHQNbi76BJv0TzLK9/3KUgYIudfXy7nwpzriYBznhdSrFb4WnIYWkGTE1O7pSbdm0HsQn3hzok1q2/k+xLLQgCf/rA5c6jVbxsXcU5421cvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800907; c=relaxed/simple;
	bh=rDZ1xwuhRo4ryZwDa2OqtcCRrId6lcfiwucWNayBvsI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXVmD7uhM2ClW1PGEvvZrKA7H80TrXS9h4DunGfUW6/sUNjd5l8SK8JZYaMhhjiGIYnEceolQR2ykXg8mIjZvjLYGthUAC95dnEiszzo8RMtF+lYvIwI6VvGtK24qrl+h9iV2aHj/l9QFlzumC8Axj6HNa6LmVYbca5o6jn/Co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G7+P46sF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U16GAMeG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T9ZS6HhU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dRlJ2/0M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G7+P46sF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U16GAMeG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T9ZS6HhU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dRlJ2/0M"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8168337CD;
	Mon, 15 Dec 2025 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765800904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fc3fYrePzA8xcxg0QVp5Ghfrjd4jNlgpfCWuAUdW9qQ=;
	b=G7+P46sFxhh3uLOP+42rwrTAmExIqTpObLOHb4eZLY2eoqu57lyuKbjBYJd42TIFo1kDfC
	bUsxwixxwKm0/PW4e7XnYNvoxhXho91S/bUydReCzpBuow/QdRhQ4CNIG3GSxspU4XbjZQ
	5AVmiT0ZwomXX2Ri1HzYvV68pM0N0Hc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765800904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fc3fYrePzA8xcxg0QVp5Ghfrjd4jNlgpfCWuAUdW9qQ=;
	b=U16GAMeGpCGMzN6y4IXjKzC4lxdL83Q6lzUSEUuv2a/m4P8bmWoyhxMCuRkg7AotLgF2Vd
	pHg8sELCmcmpn5Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765800903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fc3fYrePzA8xcxg0QVp5Ghfrjd4jNlgpfCWuAUdW9qQ=;
	b=T9ZS6HhU4IiZ0XMOyaigWdw1RNsYnlqfbFKnuovga/xWUGULYfJBTTdf67ZpoM2mN/y5nd
	2GmJBsPH6wD+O6kykwcUtvSeEl99tbHxLl98Eny9/4f8h5EyPb6F/Es7Bm1rfSCHVBFBdq
	0lNzYH2FzlSVX5TuSrRANOVeHPz0M3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765800903;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fc3fYrePzA8xcxg0QVp5Ghfrjd4jNlgpfCWuAUdW9qQ=;
	b=dRlJ2/0M+NJUr0hr65PolZlmqzuQBvhcqP0SKx+B2yvWF+kwblx8YUkVqbdVBGsYGHOE8U
	Q5C3tqXfAYv06kDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B49813EA63;
	Mon, 15 Dec 2025 12:15:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id THvZKsf7P2mRJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Dec 2025 12:15:03 +0000
Date: Mon, 15 Dec 2025 13:15:03 +0100
Message-ID: <87v7i8eybc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Leo Tsai <antivirus621@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cm9825: Add new project GENE_TWL7 for AAEON
In-Reply-To: <20251215112246.37980-1-antivirus621@gmail.com>
References: <20251215112246.37980-1-antivirus621@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.19)[-0.958];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.29

On Mon, 15 Dec 2025 12:22:46 +0100,
Leo Tsai wrote:
> 
> The GENE_TWL7 project is an AAEON platform with a fixed audio
> configuration consisting of line-out, line-in, and mic-in.
> The audio routing and pin assignments are defined according to
> the board-level hardware design and are not intended to be
> dynamically changed.
> 
> Signed-off-by: Leo Tsai <antivirus621@gmail.com>

It's good that you react quickly, and the patch looks much better
now.  But don't rush; we have time.

Before resubmission, re-read your patch again and again.  At each
change, you might have broken something else, too.
And, verify whether the patch really works as expected, as well as
verify it doesn't break other models.

Last but not least, please re-read what the previous reviews told.
You forgot the version prefix in the subject again, for example.
(And if there are fixes of the existing models, rather split it as
another fix patch as a preliminary.)


About the code changes:

> +/*
> + * Enable CLK/ADC to start recording.
> + */
> +static const struct hda_verb cm9825_gene_twl7_d0_verbs[] = {
> +	{0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},

In general, we set EAPD at init phase.  It's OK to do it dynamically
here, though.

> +	{0x43, CM9825_VERB_SET_SNR, 0x38},
> +	{0x43, CM9825_VERB_SET_PLL, 0x00},
> +	{0x43, CM9825_VERB_SET_ADCL, 0xcf},
> +	{0x43, CM9825_VERB_SET_DACL, 0xaa},
> +	{0x43, CM9825_VERB_SET_MBIAS, 0x1c},
> +	{0x43, CM9825_VERB_SET_VNEG, 0x56},
> +	{0x43, CM9825_VERB_SET_D2S, 0x62},
> +	{0x43, CM9825_VERB_SET_DACTRL, 0x00},
> +	{0x43, CM9825_VERB_SET_PDNEG, 0x0c},
> +	{0x43, CM9825_VERB_SET_CDALR, 0xf4},
> +	{0x43, CM9825_VERB_SET_OTP, 0xcd},
> +	{0x43, CM9825_VERB_SET_MTCBA, 0x61},
> +	{0x43, CM9825_VERB_SET_OCP, 0x33},
> +	{0x43, CM9825_VERB_SET_GAD, 0x07},
> +	{0x43, CM9825_VERB_SET_TMOD, 0x26},
> +	{0x43, CM9825_VERB_SET_HPF_1, 0x40},
> +	{0x43, CM9825_VERB_SET_HPF_2, 0x40},
> +	{0x40, AC_VERB_SET_CONNECT_SEL, 0x00},
> +	{0x3d, AC_VERB_SET_CONNECT_SEL, 0x01},

What's the reason to tweak the node connections here?
Isn't it wired properly beforehand?

> +static void cm9825_unsol_linein_delayed(struct work_struct *work)
> +{
> +	struct cmi_spec *spec =
> +	    container_of(to_delayed_work(work), struct cmi_spec,
> +			 unsol_linein_work);
> +	struct hda_jack_tbl *jack;
> +
> +	hda_nid_t linein_pin = spec->gen.autocfg.inputs[1].pin;

This blindly assumes that this second input is the line-in.
It means that the primary input is mic-in, and mic-in doesn't need the
delayed jack detection...?

> +static void linein_callback(struct hda_codec *codec,
> +			    struct hda_jack_callback *cb)
> +{
> +	struct cmi_spec *spec = codec->spec;
> +	struct hda_jack_tbl *tbl;
> +
> +	/* Delay enabling the line, to let the linein-detection
> +	 * state machine run.
> +	 */
> +
> +	codec_dbg(codec, "%s, cb->nid 0x%X, line%d\n", __func__,
> +		    (int)cb->nid, __LINE__);
> +
> +	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
> +	if (tbl)
> +		tbl->block_report = 1;
> +	schedule_delayed_work(&spec->unsol_linein_work, msecs_to_jiffies(200));
> +}

Basically for all three (hp, line-out, line-in), the code itself is
identical except for the pin ID.  They can be unified somehow better.

>  static void cm9825_setup_unsol(struct hda_codec *codec)
>  {
>  	struct cmi_spec *spec = codec->spec;
>  
>  	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
>  
> -	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
> +	hda_nid_t lineout_pin = spec->gen.autocfg.line_out_pins[0];
> +
> +	hda_nid_t linein_pin = spec->gen.autocfg.inputs[1].pin;

Again, taking inputs[1] is flaky.

>  static int cm9825_init(struct hda_codec *codec)
> @@ -179,26 +378,61 @@ static int cm9825_init(struct hda_codec *codec)
>  	return 0;
>  }
>  
> -static void cm9825_remove(struct hda_codec *codec)
> +static void cm9825_cm_std_remove(struct hda_codec *codec)
>  {
>  	struct cmi_spec *spec = codec->spec;
>  
>  	cancel_delayed_work_sync(&spec->unsol_hp_work);
> +}
> +
> +static void cm9825_gene_twl7_remove(struct hda_codec *codec)
> +{
> +	struct cmi_spec *spec = codec->spec;
> +
> +	cancel_delayed_work_sync(&spec->unsol_linein_work);
> +	cancel_delayed_work_sync(&spec->unsol_lineout_work);

The initializations of those work rather depend on the pin
configuration, and strictly speaking, they aren't tied with the
models.  e.g. user/BIOS may override the pin configurations.

That said, the cancel calls should be conditional for each work
instatiation.  You can introduce some flags, for example.

> -static int cm9825_resume(struct hda_codec *codec)
> +static int cm9825_cm_std_resume(struct hda_codec *codec)
>  {
>  	struct cmi_spec *spec = codec->spec;
>  	hda_nid_t hp_pin = 0;
> @@ -213,7 +447,7 @@ static int cm9825_resume(struct hda_codec *codec)
>  
>  	msleep(150);		/* for depop noise */
>  
> -	snd_hda_codec_init(codec);
> +	snd_hda_sequence_write(codec, spec->chip_d0_verbs);

This really changes the behavior.  Are you sure that you don't miss
anything?  e.g. snd_hda_codec_init() calls snd_hda_gen_init(), which
will be lost by your patch.

> @@ -258,6 +506,36 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
>  	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
>  
> +	switch (codec->core.subsystem_id) {
> +	case QUIRK_CM_STD:
> +		snd_hda_codec_set_name(codec, "CM9825 STD");
> +		INIT_DELAYED_WORK(&spec->unsol_hp_work,
> +				  cm9825_unsol_hp_delayed);
> +		spec->chip_d0_verbs = cm9825_std_d0_verbs;
> +		spec->chip_d3_verbs = cm9825_std_d3_verbs;
> +		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
> +		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
> +		cm9825_setup_unsol(codec);

Why it's called here; cm9825_setup_unsol() is called later, no?

> +		break;
> +	case QUIRK_GENE_TWL7_SSID:
> +		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
> +		INIT_DELAYED_WORK(&spec->unsol_linein_work,
> +				  cm9825_unsol_linein_delayed);
> +		INIT_DELAYED_WORK(&spec->unsol_lineout_work,
> +				  cm9825_unsol_lineout_delayed);
> +		spec->chip_d0_verbs = cm9825_gene_twl7_d0_verbs;
> +		spec->chip_d3_verbs = cm9825_gene_twl7_d3_verbs;
> +		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
> +		snd_hda_codec_set_pincfg(codec, 0x37, 0x24A70100);

Don't put a magic number.  I guess it's a mic pin?  Define it properly
with a comment.


thanks,

Takashi
