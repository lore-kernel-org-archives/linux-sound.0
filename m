Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8D49B479
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 11:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593377; cv=none; b=d4ygphpVzdLD4LbprXlWLGiT6T77xHrjHkhQMgvSUjrRhg+DeMUmRFN5OqJ+ouQLKfg15rVvRC42q5R4+uXTAD7bkic71kDuOJQ5IHj28jsHj7D3Wvtrd42YMbQYr7jbIDY+pWHpB6+biH4MK+za+/HxkbTXFpEh9tx9rFw7dJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593377; c=relaxed/simple;
	bh=lN7FDdxC2mL6jHb0e797cYW2kKCoZMJhHgMbvuNvuSA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyQfzgx9yGigPC0Xjqh7VsD5xrgg4hjS9/ImJcBFU1jQ4c8iXCdBADgQq2dioI+ZdQkcLk3cjQ3EQIBOBgF9fUUrV0RybuP8MA96puW8brjiT/aki0BGuhCgtWaGDzw8S9M7BFTlPFYB2F9rfRQWKYgKeKgakYtJst0p5ojtgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OVylJJOU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DXAMKXmX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KtC0Cb7/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v9m/htec; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OVylJJOU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DXAMKXmX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KtC0Cb7/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v9m/htec"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6297C22722;
	Mon, 28 Sep 2026 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBofPK4L7YDbPk9mbILAHCVioYgIRV4Gb3k2UDxfE0=;
	b=OVylJJOU2RriBYNf4Ug03EguyFMQL0KrA9A4Wzh6j74OLTq73/j3yBSQfOhaztvwWevc2U
	Ci4/BJXED0z2QOfvauUezbFKWUt/1jlOIBLhcY3lxuoU2oo2IAtsMReK3OxqCHWjzytUd+
	c6F5+E1kJRhw9NuOG0Py2ERvKxl3S7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBofPK4L7YDbPk9mbILAHCVioYgIRV4Gb3k2UDxfE0=;
	b=DXAMKXmXGEVn7qooCzBpQTVRJXdqfcxcHZoukTObuKmyqTKP3yZIEuJcr45VfQ2YY2mG77
	qkaSZFWhJ663CaAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="KtC0Cb7/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="v9m/htec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBofPK4L7YDbPk9mbILAHCVioYgIRV4Gb3k2UDxfE0=;
	b=KtC0Cb7/czty8gxnhZlcA7amxbqh/NbF23T8LhcPIE894+LG/B/NhxrnTBpHzJ6T+SdMXv
	4fWgGgHNxNWj8R6V5b/658lBgCVMvy0H08cAjASSzvnYmLJLx/xziwszS4sfVuj3IRkP8o
	Q7+WX6/8V2uy39Txh906ODHWkS+23KM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBofPK4L7YDbPk9mbILAHCVioYgIRV4Gb3k2UDxfE0=;
	b=v9m/htecYIAf9qQ3nYKW9rrzYE/8YdFW6Z7g+uBaCTqaEAJGe/aC/FX+CdzV+E6qEbBUh8
	4q4IGDGWm4CCV+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A168133F1;
	Mon, 28 Sep 2026 11:02:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4TWlNFRJumpNIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:02:45 +0000
Date: Mon, 28 Sep 2026 13:02:44 +0200
Message-ID: <87h5j97i5n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module param
In-Reply-To: <63cef80c-7040-4a21-8fa8-3c258d123fde@intel.com>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
	<87bj9zom8l.wl-tiwai@suse.de>
	<9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
	<87tsnrn5oe.wl-tiwai@suse.de>
	<1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
	<87a4pin4v2.wl-tiwai@suse.de>
	<36644426-3302-47da-a720-f353c307348b@intel.com>
	<87ik46lcz6.wl-tiwai@suse.de>
	<0f1397fb-4ec8-4644-8fea-717f57354b25@intel.com>
	<87wlsljweu.wl-tiwai@suse.de>
	<63cef80c-7040-4a21-8fa8-3c258d123fde@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6297C22722
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 18 Sep 2026 10:33:00 +0200,
Cezary Rojewski wrote:
> 
> On 9/16/2026 12:57 PM, Takashi Iwai wrote:
> 
> >>>>> In theory, it can be a hotplug device, and in that case, we may have
> >>>>> two device configurations for multiple codecs of the same codec chip.
> >>>>> But, that's an exception, and I wonder whether we should care for the
> >>>>> model option that is mainly used for debugging or workaround.
> >>>> On reference setups we do anything. 2+ standalone codecs on HDAudio bus
> >>>> in our lab is not some kind of sorcery. Obviously right now we
> >>>> workaround the kernel by applying a bunch of patches. But adding a
> >>>> module param (of type array) covers both: any userspace and any
> >>>> reference scenario.
> >>>
> >>> Well, using an array itself isn't a big problem.  The codec module
> >>> option could be an array, too.
> >>>
> >>> The problem I've been seeing is, however, that it's cumbersome to pass
> >>> the arrays correctly if there are multiple devices.  Currently it
> >>> depends on the controller probe order, and that's often unintuitive
> >>> for users.  This problem still remains with your proposed change --
> >>> even more confusing because now there are multiple entries but
> >>> digested differently (imagine a combination of hda-intel and SOF).
> >>>
> >>> So, obviously, I haven't found any good solution yet...
> >> snd_hda_codec is fetched with SND_HDA kconfig which is always on when
> >> SND_HDA_CORE is selected - this is true for both DSP drivers, avs-driver
> >> and the sof-driver as both depend on SND_HDA_EXT_CORE:
> >>
> >> 	SND_HDA <- SND_HDA_CORE <- SND_HDA_EXT_CORE
> >>
> >> Depending on dsp_driver, not selected drivers will quit probe() early
> >> before the code gets to model assignment part.
> >>
> >> And thus I'm not sure what you meant by "combination of hda-intel and
> >> SOF".  At the same time not quite sure about "controller probe order"
> >> issue either - bus->modelname and codec's model are two different
> >> things.  It's likely I've missed something and if so, I'd greatly
> >> appreciate additional input.
> > 
> > Basically the model option is passed per controller, not per codec.
> > 
> > So, if you have two HDMI controllers (e.g. built-in audio and HDMI on
> > d-GPU), it's common that they are bound to different drivers (ASoC and
> > hda-intel) on the same machine.
> > Now when you pass the model option to snd-hda-intel, only the HDMI
> > controller takes it.  Meanwhile, if you pass the same model option to
> > snd-hda-codec, it's taken from both, and the order matters, and you'd
> > have to be very careful at which position you'd have to put.
> > That is, the same model option, but they have different values.
> 
> Marvelous! Thank you for the example.  I was typically using a FPGA for
> multi-bus tests, oh well..
> In such case I do not see us avoiding the bus' modelname when specifying
> the quirks e.g.:
> 
> 	// array param, [SND_MAX_CARDS]
> 	model=my_bus_xyz:my_codec_abc,my_bus_123:my_codec_890

There is already a handling with a colon in the model option as an
alias, so this syntax would conflict.  I think it can be something
with '@', e.g. model=something@bus. (Or other way round).
It's still an open question how the bus should be represented, though.

And, there can be the cases where you want to specify a different
quirk per codec address for multiple codecs.  This would need an
extension of the model string syntax, too.

So, overall, we need some redesign, I suppose.


thanks,

Takashi
