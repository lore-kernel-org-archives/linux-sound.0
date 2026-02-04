Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92960156F45
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207715; cv=none; b=GDKOcmW0P+69i9UjqYRzeFaNTi9BQBsPUoe4+hsABWUnAe6R+1tz42/I4kTOYPNtiwPcQeVboLoMoo4ZdPtNFPx3xv0B8fQ6b1nM7ted1LFnVrBaZpME+ScMnkkfhE1UYru0PBq3+jFaEaFqSZJhHQo52MnM74nBkXFgadplk2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207715; c=relaxed/simple;
	bh=r/2bZPaq7VzEyz8hvR66DGdJ6O9v+4RVh+1a6t4MAdk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YksdnePtDGW7y+WxX681s9m6Fo5+STmxwTJDCgbgVezx2JpT225VMCTzHR3LUwTaGncUVN6dVRgSgJ0jZTW3Z3BXDtkZHz1RxrCn5DDhd0CLBL2MoMB5IxfJiVdzVQ5tEHp3UDvIGFOdh7o6fDLZU3SD2T8BJqtlBf2cll7ug1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eYJSaZXV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BoMbX2yY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eYJSaZXV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BoMbX2yY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eYJSaZXV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BoMbX2yY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eYJSaZXV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BoMbX2yY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDA8B3E719;
	Wed,  4 Feb 2026 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770207713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+WkgsEZvTVzvJnlKrZtftIbcZAIo3q/mFkTZK3LM76Y=;
	b=eYJSaZXVsLHLA/up7KElqtJeTW0nWCADCLCHFjK/wIPrEvH4VVjx6PSclfQKRQB5JExMCz
	7XKN8IaHGJlqM2NuVfk7Qn8J/QAcPuM8BJtYxX5sehM6i0IYg5I/APtu2sc5Dz4369ZQ8N
	hZm3UNIoVx426nGhAuSBb3o1EBvkgIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770207713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+WkgsEZvTVzvJnlKrZtftIbcZAIo3q/mFkTZK3LM76Y=;
	b=BoMbX2yYYGSuGQBrORcx9khlrLFDmChZWX++dRO41vVZemXLx5umSt3wEujcQVpftk2dgv
	zWYxKdc4s5pje3Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eYJSaZXV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BoMbX2yY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770207713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+WkgsEZvTVzvJnlKrZtftIbcZAIo3q/mFkTZK3LM76Y=;
	b=eYJSaZXVsLHLA/up7KElqtJeTW0nWCADCLCHFjK/wIPrEvH4VVjx6PSclfQKRQB5JExMCz
	7XKN8IaHGJlqM2NuVfk7Qn8J/QAcPuM8BJtYxX5sehM6i0IYg5I/APtu2sc5Dz4369ZQ8N
	hZm3UNIoVx426nGhAuSBb3o1EBvkgIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770207713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+WkgsEZvTVzvJnlKrZtftIbcZAIo3q/mFkTZK3LM76Y=;
	b=BoMbX2yYYGSuGQBrORcx9khlrLFDmChZWX++dRO41vVZemXLx5umSt3wEujcQVpftk2dgv
	zWYxKdc4s5pje3Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CF193EA63;
	Wed,  4 Feb 2026 12:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EEXdBeE5g2keRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Feb 2026 12:21:53 +0000
Date: Wed, 04 Feb 2026 13:21:52 +0100
Message-ID: <87y0l8r95r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
In-Reply-To: <d122b672-468c-4122-aa46-5dad427b7a7c@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
	<aX4D1VodQ8Ksrad6@sirena.co.uk>
	<87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
	<b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
	<45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
	<877bssopsk.wl-tiwai@suse.de>
	<d122b672-468c-4122-aa46-5dad427b7a7c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,renesas.com,vger.kernel.org,metafoo.de];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Queue-Id: CDA8B3E719
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Wed, 04 Feb 2026 13:10:41 +0100,
Mark Brown wrote:
> 
> On Wed, Feb 04, 2026 at 09:50:51AM +0100, Takashi Iwai wrote:
> 
> > Basically it should be relatively easy to implement a mechanism to
> > make kcontrols invisible, though; e.g. by introducing a new kcontrol
> > flag like SNDRV_CTL_ELEM_ACCESS_INVISIBLE, and some machine drivers or
> > codec drivers may set it up depending on the demands.
> 
> We already have some support for marking controls as not visible by
> default IIRC (I'm not immediately remembering the term that was used),
> the trick is more finding a sensible way to turn it on - with so few
> custom machine drivers these days it's much harder to enable sensibly.

IIRC, the existing mechanism isn't about visibility but accessibility
via SNDRV_CTL_ELEM_ACCESS_INACTIVE flag.
kcontrols are still exposed to user-space unless they are explicitly
removed.


thanks,

Takashi
