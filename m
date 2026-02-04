Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7A9392C2C
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195054; cv=none; b=SsNHgGD2tBD3yiK988Jee+YyDPkZseUQHwt1KrkFw8gRhcl/Wn2gzIv49qs3A33gkgaO01HCsT1YfO3GAtyNfqT6l9HqP4D2PFeXF5vwD6ZRSnKmuZKqW9jL12oHcw2/D/zaxTGK8vlDDxn3vHYjOpQpfq78Q2D7wt4F0bxUwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195054; c=relaxed/simple;
	bh=SnlpQYnA2tbfVIMMRJc3oM7sp6jsMdyd3hjmNoT0QZs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3adGaiN919m8CNpoBFIRgLbIzIiLHO5SHrUOMkzcuzHDXf+DLio4YyH4hCCobiSsFUhniHTnvogTq21FRWdM9GxPtDXD2nvag4nVMvPJb+lXc+7CydXVFpJFMmJ0JMFVXHOJQXVfiJUSePPdZ399s77P8pt5jfV+XclGKCXK2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HijzUjNo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zkAs29Ik; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HijzUjNo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zkAs29Ik; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HijzUjNo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zkAs29Ik";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HijzUjNo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zkAs29Ik"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FC545BCCE;
	Wed,  4 Feb 2026 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770195052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bJdhUi+IEROB7swjHj9GIfaOXSN8lLpQWbLzUyWWlI=;
	b=HijzUjNoMrhBdLGuF2GjLKYpmb16BwadYbZCpfqQr58ZP390rPEKaFeoPF4M6kO60sV8hr
	NZGHxfmsZtERAPHiljPO+hNd0DyRNR803Z/C/56oQaoO3V6oKes8PPt+0qBh8hka9UlWOd
	0y/a15P0/LHDUMIvf+KTowEULhsYIlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770195052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bJdhUi+IEROB7swjHj9GIfaOXSN8lLpQWbLzUyWWlI=;
	b=zkAs29IkV8fbokNk0ENnLYQNpCV5P7Fdv5TtQzlYVQD5ZpGxj5Mp1zqY/IH0++EJSgfVNk
	BobmmXfjGnwwJ6Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HijzUjNo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zkAs29Ik
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770195052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bJdhUi+IEROB7swjHj9GIfaOXSN8lLpQWbLzUyWWlI=;
	b=HijzUjNoMrhBdLGuF2GjLKYpmb16BwadYbZCpfqQr58ZP390rPEKaFeoPF4M6kO60sV8hr
	NZGHxfmsZtERAPHiljPO+hNd0DyRNR803Z/C/56oQaoO3V6oKes8PPt+0qBh8hka9UlWOd
	0y/a15P0/LHDUMIvf+KTowEULhsYIlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770195052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bJdhUi+IEROB7swjHj9GIfaOXSN8lLpQWbLzUyWWlI=;
	b=zkAs29IkV8fbokNk0ENnLYQNpCV5P7Fdv5TtQzlYVQD5ZpGxj5Mp1zqY/IH0++EJSgfVNk
	BobmmXfjGnwwJ6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0F1E3EA63;
	Wed,  4 Feb 2026 08:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z/HENWsIg2lBcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Feb 2026 08:50:51 +0000
Date: Wed, 04 Feb 2026 09:50:51 +0100
Message-ID: <877bssopsk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
In-Reply-To: <45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
	<aX4D1VodQ8Ksrad6@sirena.co.uk>
	<87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
	<b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
	<45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.51
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,vger.kernel.org,metafoo.de];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4FC545BCCE
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Tue, 03 Feb 2026 19:17:15 +0100,
Mark Brown wrote:
> 
> On Tue, Feb 03, 2026 at 06:07:00PM +0000, Liam Girdwood wrote:
> > On 2/3/26 06:27, Kuninori Morimoto wrote:
> 
> > > Whether having default volume or not should not mandatory, should be just
> > > option. We want to have flexible framework, like some board want to use same
> > > style as before (= setup full routing etc via amixer), and/or some board want
> > > to have default routing/volumes, etc.
> 
> > I think hiding any kcontrols or hard coding kcontrols that change audio
> > processing or routing will break all client use cases, yes this may be nice
> > on IoT where there is no sound server or userspace audio infra and very
> > simple audio is needed, but on client we need the soundserver e.g. Pipewire,
> > CRAS or audio HAL to configure and control the use case/policy.
> 
> Yeah, we need anything in this area to be some combination of opt in and
> focused more on trying to pick defaults so there's less need to write
> and distribute UCM configurations for trivial cases.  The things we can
> do safely for everyone are pretty limited, things like hiding controls
> that we know through routing to disconnected pins can never possibly be
> part of a valid path (I always wanted to do that...) for example.

That's a topic that has been discussed since many many years ago :)
Making all setups controllable via kconfig (that is user-space) is one
of key concepts in ASoC, but certainly that shows too much details to
anyone on the system.

Basically it should be relatively easy to implement a mechanism to
make kcontrols invisible, though; e.g. by introducing a new kcontrol
flag like SNDRV_CTL_ELEM_ACCESS_INVISIBLE, and some machine drivers or
codec drivers may set it up depending on the demands.
But justification to do that would become rather a bigger question.


thanks,

Takashi
