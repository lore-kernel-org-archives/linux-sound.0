Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27E392C25
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470894; cv=none; b=EK3WdYQl0ckll68MrKnH8r++tZuJ/emGytthkzTzxeurzp7f+n9SBwqWSy90PJiaqbZesJK7fJ2eZLqVnKTaMjazL3R/dDl5IUyJ2MXaJWmmcPdZUK8a+QkVx5BnQU6TmRoTtusrII4ktHzwpUi9bsXNwsOW2YCko3biPeojZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470894; c=relaxed/simple;
	bh=iPwMrdE29jiWxY39SLC9IDMqu95NvsgSvknB/VAluV4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3itR6BcGTUTZfwvpQxYtYGlItBTwzQyQMhM/j7V9pPP4PulLNMQ1jp/ryMargg+gbtfVMOe0CZl1cJ/K0sCatSBHRQpE7NyD8t4kwnFdgwf9eyXhO1D+HyEhU0EhbUIrN7gNYv44TckmDGwExXeq+LmfgzaihzqZjlcRXekArk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V5Sk8Jbr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wt5D6+Qq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NEoRbpFS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2DTiVA4n; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V5Sk8Jbr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wt5D6+Qq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NEoRbpFS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2DTiVA4n"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E03621D7A;
	Tue, 15 Sep 2026 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789470886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYGdEQieapRGKaqH2jQLu552o/BBbPZI8bq3xbi58pA=;
	b=V5Sk8Jbrk36HP+P9asOwS1RgBIGmgZIV4lTqlyKs5ZLf7tMCJh7gBaP0+ebwBjti1TuezH
	kCbi+AbNsenh/lzX7gpIsftqHY7srq+hSx5EsxXI8HrcltTvAQK8z5w4fsa2grV5Qcb4r4
	Yt0Njt+rxpZ5LK9vkbzvHllGKUFmL9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789470886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYGdEQieapRGKaqH2jQLu552o/BBbPZI8bq3xbi58pA=;
	b=Wt5D6+QqgKEIblZwkIB9omjxUiaTkj9a8PC+bepG/rpHytAAMvAB/9I3wHmPBUc/8Ya/K/
	ZhWROnPNfVky3ZDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NEoRbpFS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2DTiVA4n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789470882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYGdEQieapRGKaqH2jQLu552o/BBbPZI8bq3xbi58pA=;
	b=NEoRbpFSKPMVO2xtt2ktjERcyYqCKFeuo0jISWAmFAKhRs+2ACJ1YnxpwPv98xjuaBm/m+
	Lucp+/ORAfv5kitAnYLGqGZnrlTdLG6XyMCOcTrhQvJjwkXYCvy5Zk7Xr170OJXGYaQplI
	w0v6VtAOI3lmn267mGAK41dfcd+g33s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789470882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYGdEQieapRGKaqH2jQLu552o/BBbPZI8bq3xbi58pA=;
	b=2DTiVA4n9gwAp1rWOrTfZnG8nO+IxiIDsPUDk8uYMTtesnhl1Ur/5ny9MdymIOaqKJJJfd
	mwIws0ZbAFOfIZBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AB0413693;
	Tue, 15 Sep 2026 11:14:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uz2MAKIoqWoEXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Sep 2026 11:14:42 +0000
Date: Tue, 15 Sep 2026 13:14:41 +0200
Message-ID: <87a4pin4v2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module param
In-Reply-To: <1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
	<87bj9zom8l.wl-tiwai@suse.de>
	<9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
	<87tsnrn5oe.wl-tiwai@suse.de>
	<1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 7E03621D7A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, 14 Sep 2026 19:58:05 +0200,
Cezary Rojewski wrote:
> 
> On 9/14/2026 6:44 PM, Takashi Iwai wrote:
> 
> >>>> Model selection allows for customization of codec behaviour and thus
> >>>> dealing with various problems on very specific configurations. The
> >>>> parameter already exists but is part of snd_hda_intel specifically.
> >>>> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
> >>>> from it.
> >>>>
> >>>> The common place for all the bus drivers is snd_hda_codec. Add modelname
> >>>> parameter there and honor it when initializing codec->modelname field.
> >>>>
> >>>> Link: https://github.com/thesofproject/linux/issues/5683
> >>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >>>
> >>> The handling of the model option is a very long-standing PITA.
> >>> A few years ago, I proposed a change like:
> >>>   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
> >>> but it didn't reach to agreement.  So I'm not 100% sure whether adding
> >>> here is the best choice, either.
> >> Thank you for the link, Takashi.
> >>
> >> IMHO patch presented here addresses the feedback. I too prefer
> >> one-location-for-all approach. Also, I do believe having no option for
> >> specifying the model is worse than choosing either of the approaches for
> >> the model selection.
> >>
> >> snd_hda_codec module is *everywhere* and given the param is an array, it
> >> supports even very complicated scenarios when multiple HDAudio codecs
> >> are engaged.
> > 
> > The multi-codec is exactly the problem I've been seeing (of course in
> > addition to the lack of the option in ASoC HD-audio).  You'll have to
> > be very careful how to pass the option, and it can be even fragile.
> > That's why I hesitated to take this...
> By multi-codec I also meant scenarios where one has 2+ codecs from one
> vendor e.g.: realtek. Having non-array param e.g.: for
> snd_hda_codec_realtek would not suffice.

But those 2+ codecs are for the single device, right?  (e.g. driving
multiple channels with multiple codecs, but all of them are a single
device for user.)

In theory, it can be a hotplug device, and in that case, we may have
two device configurations for multiple codecs of the same codec chip.
But, that's an exception, and I wonder whether we should care for the
model option that is mainly used for debugging or workaround.


thanks,

Takashi
