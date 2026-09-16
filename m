Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518A2F7EF4
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556295; cv=none; b=QO/IGEl2VDwkzCnLguhUpvVZHROXylogN2go8ecZYinkgZqyb2Y6NRWgu6muY0IhNhwjzeEGUC5KuEI8uycpVZObhAmMUD1oZyOOjeppffWXm9S3yhypvIxUEV4tAM8yWiHVaj1CU4PxbZD+d+Di5IkqlT+xGyp7kxBKuYTEiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556295; c=relaxed/simple;
	bh=YnkZtXe0Rg6JDQqzcRps/Zlbt291bWZjknl05qBDazg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5Q2T5+hpjUrvLNvoRK9VrMJ1vbIBc3MxyApp5qHIwhVCwjc0GXmjOSzqd3jPs5oB/XzUS9o8WrqI9DxFgv8CjUp2CLU6rURC1NDFC1PKYOZVaFxUCJ6TwoRCgSXzmWg84WAx6MLEkUkMtZhRGabjFMbEZFWm24kzqzm2tE8jQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wi47PpV+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mfagihB+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LhTimCHv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eq9hJir2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wi47PpV+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mfagihB+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LhTimCHv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eq9hJir2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27DA221A2A;
	Wed, 16 Sep 2026 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789556270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piADcEQ4mMqHlg/RnHEFOUQDlwa7j40uL7imF5XR148=;
	b=wi47PpV+GK98+p2RdD3BiaSEIDB+Sgnbv7VslnbTGyxUr0d2O20jOzz9g9UqnDFxWOakc2
	Dh0KCNyjd9l5V56mIOW7UbYl1qESdzYMoZvmG/VNnzlrGxhSFWrah8lXX9Bf0J31DCH+bd
	fIoPvcpM9hzUVszE4kEvffruZNTQytU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789556270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piADcEQ4mMqHlg/RnHEFOUQDlwa7j40uL7imF5XR148=;
	b=mfagihB+s6R1VFLwIjAK6oG3NVEg2nYJ42LsDWNpmnjF6HBNm6Lg6k+tn6cnvOXC/A2grE
	muwTNlv8C2na9YBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789556266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piADcEQ4mMqHlg/RnHEFOUQDlwa7j40uL7imF5XR148=;
	b=LhTimCHv5FlThCsdIo2GIm4sA/Yo3+xxdnhudDL6+v2DP0ffmO04vn+AreeJeUYH1m881M
	4cKHPMXyPda+aCRZX2ZKhWnX3bnzRmIhprZaE2okvgnFg/mx5ZCY3C975uVJNQtzhxCw3u
	LZbDDcvo0X2zW8cadpJjdhA/D8QPX5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789556266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piADcEQ4mMqHlg/RnHEFOUQDlwa7j40uL7imF5XR148=;
	b=eq9hJir2fGtxOEHeYRDvfw0MaPd7tlB0X92iZLVWfA2GcUMqg4cWhoM4FqQj9OA8EW9wls
	qzgXGiWtb+4cHUDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C44E61348F;
	Wed, 16 Sep 2026 10:57:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AX9KJil2qmqTeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 10:57:45 +0000
Date: Wed, 16 Sep 2026 12:57:45 +0200
Message-ID: <87wlsljweu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module param
In-Reply-To: <0f1397fb-4ec8-4644-8fea-717f57354b25@intel.com>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
	<87bj9zom8l.wl-tiwai@suse.de>
	<9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
	<87tsnrn5oe.wl-tiwai@suse.de>
	<1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
	<87a4pin4v2.wl-tiwai@suse.de>
	<36644426-3302-47da-a720-f353c307348b@intel.com>
	<87ik46lcz6.wl-tiwai@suse.de>
	<0f1397fb-4ec8-4644-8fea-717f57354b25@intel.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,alsa-project.org:url,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 16 Sep 2026 10:29:49 +0200,
Cezary Rojewski wrote:
> 
> On 9/15/2026 6:02 PM, Takashi Iwai wrote:
> 
> >>>>>>>> Model selection allows for customization of codec behaviour and thus
> >>>>>>>> dealing with various problems on very specific configurations. The
> >>>>>>>> parameter already exists but is part of snd_hda_intel specifically.
> >>>>>>>> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
> >>>>>>>> from it.
> >>>>>>>>
> >>>>>>>> The common place for all the bus drivers is snd_hda_codec. Add modelname
> >>>>>>>> parameter there and honor it when initializing codec->modelname field.
> >>>>>>>>
> >>>>>>>> Link: https://github.com/thesofproject/linux/issues/5683
> >>>>>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >>>>>>>
> >>>>>>> The handling of the model option is a very long-standing PITA.
> >>>>>>> A few years ago, I proposed a change like:
> >>>>>>>   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
> >>>>>>> but it didn't reach to agreement.  So I'm not 100% sure whether adding
> >>>>>>> here is the best choice, either.
> >>>>>> Thank you for the link, Takashi.
> >>>>>>
> >>>>>> IMHO patch presented here addresses the feedback. I too prefer
> >>>>>> one-location-for-all approach. Also, I do believe having no option for
> >>>>>> specifying the model is worse than choosing either of the approaches for
> >>>>>> the model selection.
> >>>>>>
> >>>>>> snd_hda_codec module is *everywhere* and given the param is an array, it
> >>>>>> supports even very complicated scenarios when multiple HDAudio codecs
> >>>>>> are engaged.
> >>>>>
> >>>>> The multi-codec is exactly the problem I've been seeing (of course in
> >>>>> addition to the lack of the option in ASoC HD-audio).  You'll have to
> >>>>> be very careful how to pass the option, and it can be even fragile.
> >>>>> That's why I hesitated to take this...
> >>>> By multi-codec I also meant scenarios where one has 2+ codecs from one
> >>>> vendor e.g.: realtek. Having non-array param e.g.: for
> >>>> snd_hda_codec_realtek would not suffice.
> >>>
> >>> But those 2+ codecs are for the single device, right?  (e.g. driving
> >>> multiple channels with multiple codecs, but all of them are a single
> >>> device for user.)
> >>>
> >>> In theory, it can be a hotplug device, and in that case, we may have
> >>> two device configurations for multiple codecs of the same codec chip.
> >>> But, that's an exception, and I wonder whether we should care for the
> >>> model option that is mainly used for debugging or workaround.
> >> On reference setups we do anything. 2+ standalone codecs on HDAudio bus
> >> in our lab is not some kind of sorcery. Obviously right now we
> >> workaround the kernel by applying a bunch of patches. But adding a
> >> module param (of type array) covers both: any userspace and any
> >> reference scenario.
> > 
> > Well, using an array itself isn't a big problem.  The codec module
> > option could be an array, too.
> > 
> > The problem I've been seeing is, however, that it's cumbersome to pass
> > the arrays correctly if there are multiple devices.  Currently it
> > depends on the controller probe order, and that's often unintuitive
> > for users.  This problem still remains with your proposed change --
> > even more confusing because now there are multiple entries but
> > digested differently (imagine a combination of hda-intel and SOF).
> > 
> > So, obviously, I haven't found any good solution yet...
> snd_hda_codec is fetched with SND_HDA kconfig which is always on when
> SND_HDA_CORE is selected - this is true for both DSP drivers, avs-driver
> and the sof-driver as both depend on SND_HDA_EXT_CORE:
> 
> 	SND_HDA <- SND_HDA_CORE <- SND_HDA_EXT_CORE
> 
> Depending on dsp_driver, not selected drivers will quit probe() early
> before the code gets to model assignment part.
> 
> And thus I'm not sure what you meant by "combination of hda-intel and
> SOF".  At the same time not quite sure about "controller probe order"
> issue either - bus->modelname and codec's model are two different
> things.  It's likely I've missed something and if so, I'd greatly
> appreciate additional input.

Basically the model option is passed per controller, not per codec.

So, if you have two HDMI controllers (e.g. built-in audio and HDMI on
d-GPU), it's common that they are bound to different drivers (ASoC and
hda-intel) on the same machine.
Now when you pass the model option to snd-hda-intel, only the HDMI
controller takes it.  Meanwhile, if you pass the same model option to
snd-hda-codec, it's taken from both, and the order matters, and you'd
have to be very careful at which position you'd have to put.
That is, the same model option, but they have different values.


Takashi
