Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C780F3B9952
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404302; cv=none; b=G8khGiaLn51xnoos7qRQ20KQR2kYMab4qpkZvxP57vY+s7+z4H3TYFrQxxrhSMwautBPc8llKWW2JdHaU45vklS0z2yylgwWHxWoI+EmvoOOGlim83SvVDzCNjUc767RcOX4FcA623dXoRR86s8DjOnM3m4pDEPYYYmYo2ZhopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404302; c=relaxed/simple;
	bh=KTwZZm6mCXYegovms4AL/ocB2EU7dg6C2WEqO2oCOIU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjHLD7viyUBKbIhXEckbaZjYG/r951P+87rVJomffDAmxH73RRdgu2iEpGnj/y4+ZwrCn2EypLIvyyvTEFULOP8hHsX5VeNlVpxKZcQw+HG0pWnNqpuS6Cf7NRy0Xr1meccKJ/GoPVoPnLUTTgoHnQ9/KpmziA/sEAtuxrqa4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jywLVyGo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oa11pc3o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P2qI4aMK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4XXKSVSw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jywLVyGo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oa11pc3o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P2qI4aMK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4XXKSVSw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 868E01FAB3;
	Mon, 14 Sep 2026 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789404294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5TE+0WsHm402evYhMOvAcZkWOZTIP2sbo5eAY4FbS8E=;
	b=jywLVyGoBxHd46+rbBmZccxD6E+uojN+SDDaXSsOZ7hKq3vpuQOmnVgAAS1Edl+SEl0UpG
	N43imX9Uu+Fv1SisS/FlEFuoflwEzcCaNbh0IYzAP4Gpt+lGf3ZD1tjYilm8FsWSejYFUH
	kKYf+9hUfS/NY5KQy1pVkPhempPDYjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789404294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5TE+0WsHm402evYhMOvAcZkWOZTIP2sbo5eAY4FbS8E=;
	b=oa11pc3o4mOR+p2gGWswfD18jv4eRU/TwZunXnH8vzbPQVZeKdkNdQ3ArhNKvmM2ZxHwZA
	xiuMBFEynFiTtXCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789404290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5TE+0WsHm402evYhMOvAcZkWOZTIP2sbo5eAY4FbS8E=;
	b=P2qI4aMK/wWk+GLmid0/SzLr/nq4IzwqRmGaovtWvTivgnKEHhEhMAs1d0riZnBnxTJK7w
	bXDZknnjyxabh1Iw/+k5jkzGeRcJQRWKfeqqZw5cMSwx2JbVAQZVC8nPDuQPvHcjATv29C
	DRnMOq5MkyxMQEvpF41zlL08LMVsKXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789404290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5TE+0WsHm402evYhMOvAcZkWOZTIP2sbo5eAY4FbS8E=;
	b=4XXKSVSwQIvu54w2Hta6Qukg4w6xGjdz61j/+5tAjpWoQPnr/O37aFjNoIF/njTTqGrs0G
	VMrOOdJmDZTLb4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21D8313515;
	Mon, 14 Sep 2026 16:44:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M6DuBoIkqGrEPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:44:50 +0000
Date: Mon, 14 Sep 2026 18:44:49 +0200
Message-ID: <87tsnrn5oe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module param
In-Reply-To: <9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
	<87bj9zom8l.wl-tiwai@suse.de>
	<9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,alsa-project.org:url,suse.de:mid]

On Mon, 14 Sep 2026 18:29:19 +0200,
Cezary Rojewski wrote:
> 
> On 9/14/2026 6:01 PM, Takashi Iwai wrote:
> > On Mon, 14 Sep 2026 12:22:53 +0200,
> > Cezary Rojewski wrote:
> >>
> >> Model selection allows for customization of codec behaviour and thus
> >> dealing with various problems on very specific configurations. The
> >> parameter already exists but is part of snd_hda_intel specifically.
> >> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
> >> from it.
> >>
> >> The common place for all the bus drivers is snd_hda_codec. Add modelname
> >> parameter there and honor it when initializing codec->modelname field.
> >>
> >> Link: https://github.com/thesofproject/linux/issues/5683
> >> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> > 
> > The handling of the model option is a very long-standing PITA.
> > A few years ago, I proposed a change like:
> >   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
> > but it didn't reach to agreement.  So I'm not 100% sure whether adding
> > here is the best choice, either.
> Thank you for the link, Takashi.
> 
> IMHO patch presented here addresses the feedback. I too prefer
> one-location-for-all approach. Also, I do believe having no option for
> specifying the model is worse than choosing either of the approaches for
> the model selection.
> 
> snd_hda_codec module is *everywhere* and given the param is an array, it
> supports even very complicated scenarios when multiple HDAudio codecs
> are engaged.

The multi-codec is exactly the problem I've been seeing (of course in
addition to the lack of the option in ASoC HD-audio).  You'll have to
be very careful how to pass the option, and it can be even fragile.
That's why I hesitated to take this...


thanks,

Takashi
