Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74C13D8B1
	for <linux-sound@vger.kernel.org>; Thu,  1 Jan 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767261790; cv=none; b=BroWDkKcAn9ly9iRxYL1LTNQ1yPUrwXnJrjPBtU1W1Xhm9t4nz3Nq1JoDIxXob9UMD4e912t97nd8s7eNkwgTBUjCEj+k0BAJozl99Rw5PW3Nhrq/GXxM/Bif4xV0I37ACzaKlicvKr0SP/u/blPAChYu8QUO733cLreoQmSNJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767261790; c=relaxed/simple;
	bh=6T0eA6HBlO6H3oiXyPCq6b6G7ruCAqVjNL3Ds6CTDuw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbAOEXEsXc7a3TZQTT/QsBw2Z6dFiM+Ix5pTGgbliesjNzzoaXf666rxTLici00SKekllEcVLiQU5MsZtZDujXGruz2DyrSImLWgerGoOiK081Fjym2nUIWNzO/8cKkrAyHRuGgmti2+GoeFUseT/g772qwZclTadYtDAvGJYo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uf3Dew59; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vJjZ5MOC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uf3Dew59; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vJjZ5MOC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uf3Dew59";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vJjZ5MOC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uf3Dew59";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vJjZ5MOC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A898D33682;
	Thu,  1 Jan 2026 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767261785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6gTp/Lgh/mJJ+1LckOGm8f+mp6zs+hW5SJe5o1N6Eg=;
	b=uf3Dew59Yyvjc2CJoiESJy3ACb4qIMvDRZZzEhunm2n1NDVH3tfFfht9PRPzCaWDyoN29Z
	CcWakz6mR4AujDLMwZMtSizAmS6nj7MFCuX2Y54QOk8RGeP+ByWB/AkQ3/d3Ftz6rTCkHD
	iYkyyXDMgp/uGH632XTzOD+5jil8jbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767261785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6gTp/Lgh/mJJ+1LckOGm8f+mp6zs+hW5SJe5o1N6Eg=;
	b=vJjZ5MOCgW2Gx9V1v4tncb56/YfikKtzsnxnikKKqU3PRQ14Sik70e1So89i7lkb8QPtcJ
	Ykb9GLgBkRRtuQBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767261785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6gTp/Lgh/mJJ+1LckOGm8f+mp6zs+hW5SJe5o1N6Eg=;
	b=uf3Dew59Yyvjc2CJoiESJy3ACb4qIMvDRZZzEhunm2n1NDVH3tfFfht9PRPzCaWDyoN29Z
	CcWakz6mR4AujDLMwZMtSizAmS6nj7MFCuX2Y54QOk8RGeP+ByWB/AkQ3/d3Ftz6rTCkHD
	iYkyyXDMgp/uGH632XTzOD+5jil8jbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767261785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6gTp/Lgh/mJJ+1LckOGm8f+mp6zs+hW5SJe5o1N6Eg=;
	b=vJjZ5MOCgW2Gx9V1v4tncb56/YfikKtzsnxnikKKqU3PRQ14Sik70e1So89i7lkb8QPtcJ
	Ykb9GLgBkRRtuQBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 561CE1376C;
	Thu,  1 Jan 2026 10:03:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 45SgE1lGVmlEAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Jan 2026 10:03:05 +0000
Date: Thu, 01 Jan 2026 11:03:04 +0100
Message-ID: <87344py7jb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	cryolitia.pukngae@linux.dev,
	kuninori.morimoto.gx@renesas.com,
	lhi0729@kaist.ac.kr,
	pav@iki.fi,
	rene@exactco.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
In-Reply-To: <5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
References: <20251229093130.3202058-1-zhangheng@kylinos.cn>
	<87ecoay7vt.wl-tiwai@suse.de>
	<5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Flag: NO
X-Spam-Score: -3.27
X-Spam-Level: 
X-Spamd-Result: default: False [-3.27 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.17)[-0.845];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]

On Thu, 01 Jan 2026 02:18:21 +0100,
zhangheng wrote:
> 
> Sorry, this is not a new standard. It's just my personal idea. Can we
> promote
> 
> the addition of this, adding this Line Out, so that it can be similar
> to hda,
> 
> simplifying the adaptation task of the core outer layer? The jack events
> 
> are relatively unified. Otherwise, for the current sound card, the
> 
> rear jack event is Speaker, which requires separate adaptation.

Well, the question is how this 0x0308 came up.
It's the value that is used actually by the descriptor, right?
That is, the vendor uses this non-standard number regularly?
If so, we may define it as a de facto standard and implement as you
suggested.

Basically I like the idea, but I'd like to know more about the current
situation at first.


thanks,

Takashi


> 在 2025/12/31 23:43, Takashi Iwai 写道:
> > On Mon, 29 Dec 2025 10:31:29 +0100,
> > Zhang Heng wrote:
> >> There are three jack events for a sound card on a desktop computer,
> >> namely Speaker, Headphone, and Desktop Speaker. When both audio
> >> devices are available, users cannot distinguish which audio device
> >> is being used. Can we consider adding Line Out? similar to the HDA
> >> sound card. This can change one of them and reduce the complexity
> >> of the upper layer adaptation of the sound card.
> >> 
> >> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> > Is 0x0308 something properly defined standard?
> > If so, we can add the entry, of course.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > 
> >> ---
> >>   sound/usb/mixer.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> >> index 3af71d42b9b9..bdde4261d994 100644
> >> --- a/sound/usb/mixer.c
> >> +++ b/sound/usb/mixer.c
> >> @@ -615,6 +615,7 @@ static struct iterm_name_combo {
> >>   	{ 0x0305, "Room Speaker" },
> >>   	{ 0x0306, "Com Speaker" },
> >>   	{ 0x0307, "LFE" },
> >> +	{ 0x0308, "Line Out" },
> >>   	{ 0x0600, "External In" },
> >>   	{ 0x0601, "Analog In" },
> >>   	{ 0x0602, "Digital In" },
> >> -- 
> >> 2.47.1
> >> 
