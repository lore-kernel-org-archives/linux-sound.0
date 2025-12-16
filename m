Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547B348458
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765886365; cv=none; b=tNJIH5xQo7Q2R4TWNuL2TcxZxpKk+VF/ooU8D57BpBCDK3ghjwLN6BRDQuQeghs/7JRgsV4+oMAzgtIB+Y9I2lfBcej3LC4e7Hv+xKak5POUUjYZOU8CqcSufkq5NdDkWGSvwMZ+w6wKPfGt4TjBj8v5Pp1GN5f+AL9xmJ6Cc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765886365; c=relaxed/simple;
	bh=Su63DNRWUuPoXvWhZr7uqypaBcIvPGaX4LymkT8Vm9c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQZp2IYmnyp05m6QpUJ90RIgn84KNZA55B40gIiNAblPbz3Pswni0RT15iwYpDmquyN9wLg4NnUB6wQS+FDA3StcuAqtc9y3TYI8MA/PZb3AoSOAVsCa2YecOQh5XzkNb/mEXRbOv8n65nAmBwRuRww7bG2+mjxocaY2OzdLGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zWbYyQwC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mcaBODnE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zWbYyQwC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mcaBODnE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zWbYyQwC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mcaBODnE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zWbYyQwC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mcaBODnE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 713BB336A1;
	Tue, 16 Dec 2025 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765886361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0s5qcXOYZX+aQdPdZzui793GgJ1WtGjxIoMAls3d58=;
	b=zWbYyQwCJjZeXpGF/NRT8J1ucpI9tFP9zweH0vvaY9ddP6zU5oAlAMR5YtGLSwsEVA+l5U
	/Bqcu+6p6wKOJx1qusxfEyrRBk9FbTdEGfJ0rVpapDDKR4c0Uld6kysXgecu2EW9EH/VTU
	tg9l8+bxUifP4pDPaGDNEbxFvscq1s8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765886361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0s5qcXOYZX+aQdPdZzui793GgJ1WtGjxIoMAls3d58=;
	b=mcaBODnEiO3sGboqAG9s1uyAvqpwKbkIpufq71fJb1r7pxY83/6An5F9nTfHmK3BdudOnt
	HZronmG256N+beDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765886361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0s5qcXOYZX+aQdPdZzui793GgJ1WtGjxIoMAls3d58=;
	b=zWbYyQwCJjZeXpGF/NRT8J1ucpI9tFP9zweH0vvaY9ddP6zU5oAlAMR5YtGLSwsEVA+l5U
	/Bqcu+6p6wKOJx1qusxfEyrRBk9FbTdEGfJ0rVpapDDKR4c0Uld6kysXgecu2EW9EH/VTU
	tg9l8+bxUifP4pDPaGDNEbxFvscq1s8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765886361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0s5qcXOYZX+aQdPdZzui793GgJ1WtGjxIoMAls3d58=;
	b=mcaBODnEiO3sGboqAG9s1uyAvqpwKbkIpufq71fJb1r7pxY83/6An5F9nTfHmK3BdudOnt
	HZronmG256N+beDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 501C63EA63;
	Tue, 16 Dec 2025 11:59:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJazEplJQWnVQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 11:59:21 +0000
Date: Tue, 16 Dec 2025 12:59:21 +0100
Message-ID: <875xa6fxie.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Leo Tsai <antivirus621@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	leo.tsai@cmedia.com.tw,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH v5] ALSA: hda/cm9825: Add GENE_TWL7 support for AAEON
In-Reply-To: <20251216080148.37686-1-antivirus621@gmail.com>
References: <20251216080148.37686-1-antivirus621@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.956];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.29

On Tue, 16 Dec 2025 09:01:48 +0100,
Leo Tsai wrote:
> 
> The GENE_TWL7 project is an AAEON platform with a fixed audio
> configuration consisting of line-out, line-in, and mic-in.
> The audio routing and pin assignments are defined according to
> the board-level hardware design and are not intended to be
> dynamically changed.

Now it's getting butter, but you can give a bit more details, too.
e.g. mention about the workarounds and the extra code that are added
for this model, and explain why they are needed and how they work.

> +/*
> + * Enable CLK/ADC to start recording.
> + */
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

What do these connections do?  IOW, why it wouldn't work without those
explicit setups?

> +
> +static bool cm9825_jd_cap(struct hda_codec *codec, hda_nid_t pin_id)
> +{
> +	int cap;
> +
> +	cap =
> +	    snd_hdac_read_parm(&codec->core, pin_id,
> +			       AC_PAR_PIN_CAP) & AC_PINCAP_PRES_DETECT;
> +
> +	codec_dbg(codec, "%s, cap 0x%X, line%d\n", __func__, cap, __LINE__);
> +
> +	return (bool)cap;
> +}

I guess you can use the existing is_jack_detectable() function.
It covers more tests.

And, instead of bool, you can keep the pin id in jd_cap_hp, and co.
Then, cm9825_unsol_hp_delayed() can be more simplified like:

	if (cb->nid == spec->jd_cap_hp)
		schedule_delayed_work(&spec->unsol_hp_work,
				      msecs_to_jiffies(200));
	else if (cb->nid == spec->jp_cap_lineout)
		schedule_delayed_work(&spec->unsol_lineout_work,
				      msecs_to_jiffies(200));
	....


> +static void cm9825_unsol_inputs_delayed(struct work_struct *work)
> +{
> +	struct cmi_spec *spec =
> +	    container_of(to_delayed_work(work), struct cmi_spec,
> +			 unsol_inputs_work);
> +	struct hda_jack_tbl *jack;
> +	int i;
> +	bool input_jack_plugin;
> +
> +	for (i = 0; i < spec->gen.autocfg.num_inputs; i++) {
> +		if (!spec->jd_cap_inputs[i])
> +			continue;
> +
> +		input_jack_plugin =
> +		    snd_hda_jack_detect(spec->codec,
> +					spec->gen.autocfg.inputs[i].pin);
> +		jack =
> +		    snd_hda_jack_tbl_get(spec->codec,
> +					 spec->gen.autocfg.inputs[i].pin);
> +		if (jack) {
> +			jack->block_report = 0;
> +			snd_hda_jack_report_sync(spec->codec);
> +		}
> +
> +		codec_dbg(spec->codec,
> +			  "%s, input_jack_plugin %d, linein_pin 0x%X, line%d\n",
> +			  __func__, (int)input_jack_plugin,
> +			  spec->gen.autocfg.inputs[i].pin, __LINE__);
> +	}

This code pattern

	jack_plugin = snd_hda_jack_detect(codec, pin);
	jack = snd_hda_jack_tbl_get(codec, pin);
	if (jack) {
		jack->block_report = 0;
		snd_hda_jack_report_sync(codec);
	}
	codec_dbug(codec, ....);
	
is used in multiple places in your patch, so it can be a common
function.

> @@ -242,13 +504,15 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  {
>  	struct cmi_spec *spec;
>  	struct auto_pin_cfg *cfg;
> -	int err;
> +	int err = 0;
>  
>  	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
>  	if (spec == NULL)
>  		return -ENOMEM;
>  
> -	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
> +	codec_dbg(codec, "chip_name: %s, ssid: 0x%X\n",
> +		  codec->core.chip_name, codec->core.subsystem_id);
> +
>  	codec->spec = spec;
>  	spec->codec = codec;
>  	cfg = &spec->gen.autocfg;
> @@ -258,6 +522,36 @@ static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
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
> +		break;
> +	case QUIRK_GENE_TWL7_SSID:
> +		snd_hda_codec_set_name(codec, "CM9825 GENE_TWL7");
> +		INIT_DELAYED_WORK(&spec->unsol_inputs_work,
> +				  cm9825_unsol_inputs_delayed);
> +		INIT_DELAYED_WORK(&spec->unsol_lineout_work,
> +				  cm9825_unsol_lineout_delayed);

Basically all those delayed works can be initialized unconditionally.
It's safer than leaving as uninitialized.


thanks,

Takashi

