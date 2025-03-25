Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A3CEC4
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900065; cv=none; b=FFL01N+4V4vBsO7ZL8kX8PPDXc4Qjrh1xiMpdV/2LK2m1dwiDefN3qohM2x11DgXmjebKYIKWFiMX3P5++JS+wwAg9oRypW4wYgYvMvAudajvU50CxVQDgnkF73FOyM6F9EkX4t8H7J6XlkE8R8bofcQ7Z7r5RQW7nV4zwS+3aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900065; c=relaxed/simple;
	bh=2xEKrPrRayuqAXFwcev71pOTPCIZ6SWsuixUIX4JwV8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuaG7kH2Ikp9rTukft58TqWwAuiPfEuCtExSrlRJSMIirbRI9pmxOK5aNpRzMPCJkCyC120W8Xdeya2NMsCGLfzRlADOSCMXp5I3qSnoZ0z8c7YELdzGm/ORXQUvzPBVtQ+9kJLA+JtfQ6LdJhEXPs+y6S+WhmywncqLjaERZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=070vSYZK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ZJ3KHuW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ClXEIASh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7NcR3zdr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="070vSYZK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ZJ3KHuW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ClXEIASh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7NcR3zdr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5F7321157;
	Tue, 25 Mar 2025 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742900061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlPRtfXQa4TMAgFqDWHLEgZgjuGE5VD56oKdlA+rtcc=;
	b=070vSYZKXyuj47sZ4iKzPFIHqU8jht85wuW8ERAFulp+ugDr64ZyWW/kuAGS7ydcCyDpuT
	lqYSvFTwuRRf7rIOMV9MkWnnPf513hDY2GBRoq1hR/oUwcVsbxW8+aoHYDIZ5SUhBc5MB6
	jqlfje2rBpCjzmRo95kakXQzULcolrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742900061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlPRtfXQa4TMAgFqDWHLEgZgjuGE5VD56oKdlA+rtcc=;
	b=+ZJ3KHuWGicYM3O6iFusquqaeqNM9So89WnXw8jz6A9bzO6vkPu1/JNEYyMSS/QNLdK7na
	j9j+uqnd5c5hy9AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742900060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlPRtfXQa4TMAgFqDWHLEgZgjuGE5VD56oKdlA+rtcc=;
	b=ClXEIAShUpjZLF+Kbt1sbYzdV5qTYcHAuiFwsM+NHzlz3gRi6IKv/kriVTh8u3u1hGPWt8
	SWUhqnKGq10vWwzFlOMH2+hEMfKvFhIEyLIodSmqolTQBura5GZYxRc8L+tsHV/3zZO8sl
	igUmhJu4JHtgjM0WDUPthPGBPxXqnHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742900060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlPRtfXQa4TMAgFqDWHLEgZgjuGE5VD56oKdlA+rtcc=;
	b=7NcR3zdrqF3zyc39eXp7tFglZhf1h9CDhcFWAsnkdi7qpCt5y/W3Biy6P5sJKjEeQ0GzZs
	ijRRfySe8h/2g3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B432D137AC;
	Tue, 25 Mar 2025 10:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FUa2KlyL4mcQUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Mar 2025 10:54:20 +0000
Date: Tue, 25 Mar 2025 11:54:20 +0100
Message-ID: <87msd9crdv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: bo liu <bo.liu@senarytech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH V4] Initialize the gain and boost values of the ADC in the SN6180 chip to achieve a better recording experience.
In-Reply-To: <20250325060956.1139955-1-bo.liu@senarytech.com>
References: <20250325060956.1139955-1-bo.liu@senarytech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 25 Mar 2025 07:09:56 +0100,
bo liu wrote:
> 
> Signed-off-by: bo liu <bo.liu@senarytech.com>

First off, could you use a proper subject line?  It should be more
concise, and have a prefix such as "ALSA: hda/conexant:".

Then put more information in the patch description, instead of putting
to the subject line.

About the code change:
>  
> +static void cxt_setup_capture_default_boost_gain(struct hda_codec *codec)
> +{

Better to give more comments about what this function actually does.

> +	struct conexant_spec *spec = codec->spec;
> +	struct hda_gen_spec *gen = &(spec->gen);

No need for parentheses.

> +	hda_nid_t adc_id = 0, nid = 0;

Why initializing those?

> +	int nids;

This should be either u32 or unsigned int.

> +	size_t i = 0;

It's superfluous initialization.

> +
> +	for (i = 0; i < gen->num_all_adcs; i++) {
> +		int index;
> +
> +		adc_id = gen->all_adcs[i];
> +
> +		index = snd_hda_codec_read(codec, adc_id, 0, AC_VERB_GET_CONNECT_SEL, 0);
> +		nids = snd_hda_codec_read(codec, adc_id, 0, AC_VERB_GET_CONNECT_LIST, 0);
> +		nid = ((nids & (0xFF << (8*index))) >> (8*index));

It's simpler and clearer to do right-shift at first, then mask.

> +		if (nid < codec->core.start_nid || nid > codec->core.end_nid) {
> +			codec_err(codec, "Error, invalid nid 0x%02x.\n", nid);
> +			continue;
> +		}
> +
> +		snd_hda_codec_write(codec, adc_id, 0, (0x370|(index&0xF)), 0x4A);

Too cryptic.  Use the defined verbs.

> +		snd_hda_codec_write(codec, nid, 0, 0x370, 0x2);

Ditto.

> +	}
> +}
> +
> +static void cxt_init_capture_boost_gain(struct hda_codec *codec)
> +{
> +	cxt_setup_capture_default_boost_gain(codec);
> +}

Why nested calls...?


thanks,

Takashi
