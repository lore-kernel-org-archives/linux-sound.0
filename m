Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553302877E6
	for <linux-sound@vger.kernel.org>; Sun, 14 Dec 2025 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765708212; cv=none; b=LfH9KaMRF0su8pyCfxb4e9Abo03Q7pi84EHADgk4iqHxhWOHfMnOb7X5Zg2y9cxmw+iVEeDwJ+c01HAXdMOqOuJzC1Uz6EgX8n3QFsG8hizthS7xZWjX1f/tzv2zpuskwbTqRLTFkbCEFsjkPUEq2I5LZv83pBr3frHYFyhR/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765708212; c=relaxed/simple;
	bh=b+5nAyED6XaCE/5sNnPPl8vC5q3p3REi2y0Hd3TiBdw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ie3ADfh+Ae8LvLppayZOPz62HERaoibZgT7gHb7p+4B8iZwKb3x09ZN6dgj56Z7pBZ/0k56wQy9X1n6lrKQ54Z6YPjoYSzD9O+HAHwJ79mBk2OBOjQnlRpTjvRs8veaZzRD0+iJfJC6nXFmkWK06OeTUvMoJyyMdLqGhe6P33WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rjsOqSQ9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5txGF+mv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rjsOqSQ9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5txGF+mv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rjsOqSQ9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5txGF+mv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rjsOqSQ9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5txGF+mv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C7F85BD52;
	Sun, 14 Dec 2025 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765708207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6ypDReYoOtlzusmnMocnPzKnPzGLqEWgSxPhWTRg6E=;
	b=rjsOqSQ9eJCr5iC5fDxRnlhY+iTLQgTxjIsr2pmWg+tFaPGaTS/Ix50N7HNGN4guOmEsOu
	nmZgj78VDkmXich/OVc/C7RltwEaKl3fLmsSWV/nSF2Y8Ch6eoZn4OsZyvkofBEHPBhTxs
	u9I9DEoQxQ1CL5hcyDqpBlSpFSrZadM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765708207;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6ypDReYoOtlzusmnMocnPzKnPzGLqEWgSxPhWTRg6E=;
	b=5txGF+mva4jxgPijbhAFU/txai1ek4h6jqBl/WoL1i3PUIqToESmt85Ww0MsrGsj/EtQAF
	xzn6Wsno8pFFy2Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765708207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6ypDReYoOtlzusmnMocnPzKnPzGLqEWgSxPhWTRg6E=;
	b=rjsOqSQ9eJCr5iC5fDxRnlhY+iTLQgTxjIsr2pmWg+tFaPGaTS/Ix50N7HNGN4guOmEsOu
	nmZgj78VDkmXich/OVc/C7RltwEaKl3fLmsSWV/nSF2Y8Ch6eoZn4OsZyvkofBEHPBhTxs
	u9I9DEoQxQ1CL5hcyDqpBlSpFSrZadM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765708207;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6ypDReYoOtlzusmnMocnPzKnPzGLqEWgSxPhWTRg6E=;
	b=5txGF+mva4jxgPijbhAFU/txai1ek4h6jqBl/WoL1i3PUIqToESmt85Ww0MsrGsj/EtQAF
	xzn6Wsno8pFFy2Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43A633EA63;
	Sun, 14 Dec 2025 10:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zLy8Dq+RPmm8LQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Dec 2025 10:30:07 +0000
Date: Sun, 14 Dec 2025 11:30:06 +0100
Message-ID: <87345d8ifl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Leo Tsai <antivirus621@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cm9825: Add new project GENE_TWL7 for AAEON
In-Reply-To: <20251212093157.5618-1-antivirus621@gmail.com>
References: <20251212093157.5618-1-antivirus621@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.29

On Fri, 12 Dec 2025 10:31:57 +0100,
Leo Tsai wrote:
> 
> Update CM9825 to support GENE_TWL7 which supports Line-out, Line-in, and Mic-in.
> 
> Signed-off-by: Leo Tsai <antivirus621@gmail.com>

Thanks for the update.  But it still doesn't look good enough.

First off, you gave still too few descriptions.  What is GENE_TWL7 at
all?  And, why there are tons of code changes just for add the support
line-out, line-in and mic-in?  Those need more clarifications.

And, judging from the previous patch, I guess this is only a part of
the whole changes.  If more changes are planned, it's often worth to
mention it.

More about the code changes:

> @@ -80,10 +87,8 @@ static const struct hda_verb cm9825_std_d0_verbs[] = {
>  	{0x43, CM9825_VERB_SET_OCP, 0x33},	/* OTP set */
>  	{0x43, CM9825_VERB_SET_GAD, 0x07},	/* ADC -3db */
>  	{0x43, CM9825_VERB_SET_TMOD, 0x26},	/* Class D clk */
> -	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
> -		AC_AMP_SET_OUTPUT | AC_AMP_SET_RIGHT, 0x2d},	/* Gain set */
> -	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
> -		AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT, 0x2d},	/* Gain set */
> +	{0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0xa0, 0x2d},	/* Gain set */
> +	{0x3c, AC_VERB_SET_AMP_GAIN_MUTE | 0x90, 0x2d},	/* Gain set */

Why you replaced the symbols with numbers?  That worsens the code
readability.

> +static const struct hda_verb cm9825_gene_twl7_d3_verbs[] = {
> +	{0x43, CM9825_VERB_SET_D2S, 0x62},
> +	{0x43, CM9825_VERB_SET_PLL, 0x01},
> +	{0x43, CM9825_VERB_SET_NEG, 0xc2},
> +	{0x43, CM9825_VERB_SET_ADCL, 0x00},
> +	{0x43, CM9825_VERB_SET_DACL, 0x02},
> +	{0x43, CM9825_VERB_SET_MBIAS, 0x00},
> +	{0x43, CM9825_VERB_SET_VNEG, 0x50},
> +	{0x43, CM9825_VERB_SET_PDNEG, 0x04},
> +	{0x43, CM9825_VERB_SET_CDALR, 0xf6},
> +	{0x43, CM9825_VERB_SET_OTP, 0xcd},
> +	{}
> +};

What does those verbs do?

> +static const struct hda_verb cm9825_gene_twl7_d0_verbs[] = {
> +	{0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},
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
> +	{0x46, CM9825_VERB_SET_P3BCP, 0x20},
> +	{}
> +};

Ditto.

> +static const struct hda_verb cm9825_gene_twl7_playback_start_verbs[] = {
> +	{0x43, CM9825_VERB_SET_D2S, 0xf2},
> +	{0x43, CM9825_VERB_SET_VDO, 0xd4},
> +	{0x43, CM9825_VERB_SET_SNR, 0x30},
> +	{}
> +};
> +
> +static const struct hda_verb cm9825_gene_twl7_playback_stop_verbs[] = {
> +	{0x43, CM9825_VERB_SET_VDO, 0xc0},
> +	{0x43, CM9825_VERB_SET_D2S, 0x62},
> +	{0x43, CM9825_VERB_SET_VDO, 0xd0},
> +	{0x43, CM9825_VERB_SET_SNR, 0x38},
> +	{}
> +};

... and those, too.  Please give comments what those verbs do and why
they are needed explicitly.

>  static void cm9825_unsol_hp_delayed(struct work_struct *work)
>  {
>  	struct cmi_spec *spec =
> @@ -120,6 +179,9 @@ static void cm9825_unsol_hp_delayed(struct work_struct *work)
>  	bool hp_jack_plugin = false;
>  	int err = 0;
>  
> +	if (spec->codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
> +		hp_pin = 0x36;

Is it 100% sure that the headphone pin is fixed only to this node?
And why this pin isn't assigned to the autocfg.hp_pins[0] at the first
place?  Is BIOS broken?

>  	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
>  
>  	codec_dbg(spec->codec, "hp_jack_plugin %d, hp_pin 0x%X\n",
> @@ -132,10 +194,13 @@ static void cm9825_unsol_hp_delayed(struct work_struct *work)
>  		if (err)
>  			codec_dbg(spec->codec, "codec_write err %d\n", err);
>  
> -		snd_hda_sequence_write(spec->codec, spec->chip_hp_remove_verbs);
> +		if (spec->codec->core.subsystem_id == QUIRK_CM_STD)
> +			snd_hda_sequence_write(spec->codec,
> +					       spec->chip_hp_remove_verbs);
>  	} else {
> -		snd_hda_sequence_write(spec->codec,
> -				       spec->chip_hp_present_verbs);
> +		if (spec->codec->core.subsystem_id == QUIRK_CM_STD)
> +			snd_hda_sequence_write(spec->codec,
> +					       spec->chip_hp_present_verbs);

The check of subsystem_id is too ugly here and there.
If this is a conditional setup, set spec->chip_hp_present_verbs to
non-NULL only for the required model, and just check NULL instead of
subsystem_id.

> +static void cm9825_unsol_line_delayed(struct work_struct *work)
> +{
> +	struct cmi_spec *spec =
> +	    container_of(to_delayed_work(work), struct cmi_spec,
> +			 unsol_line_work);
> +	struct hda_jack_tbl *jack;
> +	hda_nid_t lineout_pin = 0x3b;

Again, a fixed node ID.  That's a very bad way.

>  static void cm9825_setup_unsol(struct hda_codec *codec)
>  {
>  	struct cmi_spec *spec = codec->spec;
>  
>  	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
>  
> +	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
> +		hp_pin = 0x36;

Here again....

>  	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
> +
> +	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {

This could be in better way instead of checking subsystem_id at each
place.  It's error-prone.

> +		hda_nid_t linein_pin = 0x3b;

Here...

> +static void cm9825_init_hook(struct hda_codec *codec)
> +{
> +	unsigned int val;
> +
> +	codec_dbg(codec, "init hook\n");
> +
> +	/* OMTP */
> +	val = snd_hda_codec_read(codec, 0x46, 0, 0xfec, 0x0);
> +	snd_hda_codec_write(codec, 0x46, 0, 0x7ef, (val >> 24) & 0x7f);

What does this more exactly?
And this sequence wasn't present for STD model before the patch.
Is it safe to apply unconditionally?

> +	// link reset
> +	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
> +		snd_hda_sequence_write(codec, cm9825_gene_twl7_d0_verbs);

Need more comment.  Also, you should reconsider whether subsystem_id
check is the best way here, too.


> +static void cm9825_playback_pcm_hook(struct hda_pcm_stream *hinfo,
> +				     struct hda_codec *codec,
> +				     struct snd_pcm_substream *substream,
> +				     int action)
> +{
> +	struct cmi_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_GEN_PCM_ACT_PREPARE:
> +		if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
> +			snd_hda_sequence_write(spec->codec,
> +					       cm9825_gene_twl7_playback_start_verbs);
> +		}
> +		break;
> +	case HDA_GEN_PCM_ACT_CLEANUP:
> +		if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID) {
> +			snd_hda_sequence_write(spec->codec,
> +					       cm9825_gene_twl7_playback_stop_verbs);
> +		}
> +		break;
> +	default:
> +		return;
> +	}

If it's model-specific, rather set up the hook conditionally, instead
of checking subsystem_id in the callback.

>  static int cm9825_init(struct hda_codec *codec)
> @@ -184,6 +340,7 @@ static void cm9825_remove(struct hda_codec *codec)
>  	struct cmi_spec *spec = codec->spec;
>  
>  	cancel_delayed_work_sync(&spec->unsol_hp_work);
> +	cancel_delayed_work_sync(&spec->unsol_line_work);

You're calling here unconditionally, while...

>  	snd_hda_gen_remove(codec);
>  }
>  
> @@ -195,6 +352,9 @@ static int cm9825_suspend(struct hda_codec *codec)
>  
>  	snd_hda_sequence_write(codec, spec->chip_d3_verbs);
>  
> +	if (codec->core.subsystem_id == QUIRK_GENE_TWL7_SSID)
> +		cancel_delayed_work_sync(&spec->unsol_line_work);

... here conditionally.  And I believe your patch breaks STD model
when the module is unloaded, because the work isn't initialized but
calling cancel_delayed_work_sync() in the above.

And, again, the conditional call with the subsystem_id check is
error-prone.
> @@ -213,7 +373,7 @@ static int cm9825_resume(struct hda_codec *codec)
>  
>  	msleep(150);		/* for depop noise */
>  
> -	snd_hda_codec_init(codec);
> +	snd_hda_sequence_write(codec, spec->chip_d0_verbs);

Why is this change...?  It'll certainly break other things.


>  	hp_pin = spec->gen.autocfg.hp_pins[0];
>  	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
> @@ -229,7 +389,9 @@ static int cm9825_resume(struct hda_codec *codec)
>  		if (err)
>  			codec_dbg(codec, "codec_write err %d\n", err);
>  
> -		snd_hda_sequence_write(codec, cm9825_hp_remove_verbs);
> +		if (codec->core.subsystem_id == QUIRK_CM_STD)
> +			snd_hda_sequence_write(codec,
> +					       spec->chip_hp_remove_verbs);

Here again ugly subystem_id conditional...

>  	}
>  
>  	snd_hda_regmap_sync(codec);
> @@ -248,9 +410,13 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	if (spec == NULL)
>  		return -ENOMEM;
>  
> +	codec_dbg(codec, "chip_name: %s, ssid: 0x%X\n",
> +		   codec->core.chip_name, codec->core.subsystem_id);
> +
>  	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
>  	codec->spec = spec;
>  	spec->codec = codec;
> +	spec->gen.init_hook = cm9825_init_hook;
>  	cfg = &spec->gen.autocfg;
>  	snd_hda_gen_spec_init(&spec->gen);
>  	spec->chip_d0_verbs = cm9825_std_d0_verbs;
> @@ -258,6 +424,41 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
>  	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
>  
> +	switch (codec->core.subsystem_id) {
> +	case QUIRK_CM_STD:
> +		snd_hda_codec_set_name(codec, "CM9825 STD");
> +		spec->chip_d0_verbs = cm9825_std_d0_verbs;
> +		spec->chip_d3_verbs = cm9825_std_d3_verbs;
> +		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
> +		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
> +		break;
> +	case QUIRK_GENE_TWL7_SSID:
> +		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
> +		INIT_DELAYED_WORK(&spec->unsol_line_work,
> +				  cm9825_unsol_line_delayed);
> +		spec->gen.hp_mic = 0;
> +		cfg->line_outs = 1;
> +		cfg->line_out_pins[0] = 0x36;
> +		cfg->line_out_type = AUTO_PIN_LINE_OUT;
> +		cfg->num_inputs = 2;
> +		cfg->inputs[0].pin = 0x3b;
> +		cfg->inputs[0].type = AUTO_PIN_LINE_IN;
> +		cfg->inputs[1].pin = 0x37;
> +		cfg->inputs[1].type = AUTO_PIN_MIC;
> +		cfg->inputs[1].is_headphone_mic = 1;
> +		spec->chip_d0_verbs = cm9825_gene_twl7_d0_verbs;
> +		spec->chip_d3_verbs = cm9825_gene_twl7_d3_verbs;
> +		spec->gen.pcm_playback_hook = cm9825_playback_pcm_hook;
> +		snd_hda_codec_set_pincfg(codec, 0x37, 0x24A70100);
> +		break;
> +	default:
> +		spec->chip_d0_verbs = cm9825_std_d0_verbs;
> +		spec->chip_d3_verbs = cm9825_std_d3_verbs;
> +		spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
> +		spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
> +		break;

The default should be QUIRK_CM_STD, or handle it as an error.  There
is no reason to define differently for default.


thanks,

Takashi
