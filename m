Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF3239E6C
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960244; cv=none; b=UGA26/MyvU+Ajm39/5/1K9VGNIZDNish5yOOfg1DF1YeCbEOj7kowLX6XyRv2HrwFK0jjRnInWg5oNqAdHxoeWABRtvizaFlgfs3aFhGsdpUDb3x/EsbycZnLDho781PbP2rKVk6OYZ63bm4+yfJh/Z1QIK7KOlJ5DoXITPI0sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960244; c=relaxed/simple;
	bh=GYnVzj+q1Wu7v1UF4StkuO/kObd70o22yPLOHteGCIg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eveHQh6TElie59M7CobiWWYUT6z0I4JE3+vMaQ+gF28xCmC3YqsSHSjhnnXXK8ylA8VXaVQ/CYt9fr5nkRPWA+uU74zL2KInufc6q2fhA7EpGia9Os5vds71HohGLwARP9/RDLtxSVcHQCCXsLwiMqLTuaq4XChoTsl7oLZkwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ekubzTrf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Dzd/L+E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V+T6psGs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oT9gz8Ta; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ekubzTrf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Dzd/L+E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V+T6psGs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oT9gz8Ta"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D02F4336CF;
	Wed, 17 Dec 2025 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765960234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aP4oilje46/OIqWKzabTmidngv8a63z/d+bvLucarGI=;
	b=ekubzTrfKmYOhbluVnjJ46xhqKuqoZ33oRUWswO67Jij5H//J8LAXcdOuTazXvIxQbFFAQ
	EtWuZB13i1yR7FTQ8lKzzsBIp7rLLVb0eUbhNRlglVA2r/G6Hv8/EJVnm1d9GgFgQ4I4Rq
	XPD0tThy5y/IeyBJZKla6ppOYCgqeVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765960234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aP4oilje46/OIqWKzabTmidngv8a63z/d+bvLucarGI=;
	b=1Dzd/L+E7+ngTdS9Oyf47hu3XFLx6qSjSVQ3rsOOFXCLMxfXYMnt6Um0HHI6iAF9e4ukL/
	H2gF5kXlMmTMZQAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V+T6psGs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oT9gz8Ta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765960232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aP4oilje46/OIqWKzabTmidngv8a63z/d+bvLucarGI=;
	b=V+T6psGsL7xdBIjkixvlxmurNTKtOWcHrwjLNlJ6grzsEghbQdhntC13LEiF1Ak+7l7PBm
	E1i9JBy/FZN7fSa/o8hlEgHP/jc/DvWPKx1k+UkNWjQHEhD95EtJPeKNCM3Kn8QkGL9wrh
	CsWlGUEhZwahzBQyZ3ATYODyQn7S7xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765960232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aP4oilje46/OIqWKzabTmidngv8a63z/d+bvLucarGI=;
	b=oT9gz8Tas37BvYwNrwGLY9HHTjq9SDq12h/xPB7FEbFmgximDIpTxHH2eUkW2ZpHxLHyJn
	ttRGbjpT/VS06TDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF2E83EA63;
	Wed, 17 Dec 2025 08:30:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CdODKShqQmluLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Dec 2025 08:30:32 +0000
Date: Wed, 17 Dec 2025 09:30:32 +0100
Message-ID: <874ippecif.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-sound@vger.kernel.org
Subject: Re: About component->card
In-Reply-To: <87v7i5esrk.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7i5esrk.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: D02F4336CF
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 17 Dec 2025 03:39:27 +0100,
Kuninori Morimoto wrote:
> 
> 
> Hi Mark, Lars-Peter
> 
> I would like to confirm/suggest about restriction of component->card.
> See also this commit
> 
> 	45655ec69cb954d7fa594054bec33d6d5b99f8d5
> 	("ASoC: soc-core.c: enable multi Component")
> 
> We might have complex system, like this
> 
> 	+-- Basic Board ---------+
> 	|+--------+      +------+|
> 	|| CPU ch0| <--> |CodecA||
> 	||     ch1| <-+  +------+|
> 	|+--------+   |          |
> 	+-------------|----------+
> 	+-- expansion board -----+
> 	|             |  +------+|
> 	|             +->|CodecB||
> 	|                +------+|
> 	+------------------------+
> 
> We would like to implement it as below, it is intuitive.
> This means 1 Component connects to multi Cards.
> 
> 	 +-driver------+
> 	 |+-component-+|
> 	+-card0-------------------------+
> 	|||           || +-driver------+|
> 	|||           || |+-component-+||
> 	|||    ch0 dai|<=>|dai        |||
> 	|||           || |+-----------+||
> 	|||           || +-------------+|
> 	+-------------------------------+
> 	 ||           ||
> 	+-card1-------------------------+
> 	|||           || +-driver------+|
> 	|||           || |+-component-+||
> 	|||    ch1 dai|<=>|dai        |||
> 	|||           || |+-----------+||
> 	|||           || +-------------+|
> 	+-------------------------------+
> 	 |+-----------+|
> 	 +-------------+
> 
> But, we can't this today, beucase we have restriction (A) that 1 Component
> can't connect to multi Cards, because of component->card.
> 
> 	static int soc_probe_component(...)
> 	{
> 		...
> 		if (component->card) {
> (A)			if (component->card != card) {
> 				dev_err(...);
> 				return -ENODEV;
> 			}
> 			return 0;
> 		}
> 		...
> 	}
> 
> I haven't fully analyzed it, but I guess this restriction came from
> each driver want to access to card, but FW doesn't hand over card pointer ?
> 
> 	-- ASoC FW --
> 
> 	/* ASoC hand over component pointer only */
> 	ops->callback(component);
> 
> 	-- driver --
> 
> 	/*
> 	 * It gets component pointer only, but want to access
> 	 * to card, too. component->card is added for it.
> 	 */
> 	callback(component)
> 	{
> 		struct snd_soc_card *card = component->card;
> 		...
> 	}
> 
> If this is the reason why restriction was created, do you think we can
> remove it if ASoC FW hand over both card and component pointer ?
> 
> 	-- ASoC FW --
> 
> 	/* ASoC hand over both card and component pointer */
> 	ops->callback(card, component);
> 	              ^^^^
> 	-- driver --
> 
> 	/*
> 	 * It gets both card and component pointer.
> 	 * component->card is no longer needed ?
> 	 */
> 	callback(card, component)
> 	{        ^^^^
> 		 ...
> 	}
> 
> But are there any other reasons ?
> 
> I think it is not strange that DAI has Component pointer.
> It is fixed.
> 
> 	dai->component;
> 
> But, Component might be connected to multi Cards, we shouldn't fix it
> 
> 	component->card;
> 
> If above was sane, I would like to cleanup it.
> I think ASoC need to hand over Card and DAI pointer (instead of Component) ?
> But what do you think ?

Well, managing multiple cards would lead to a complete mess of
locking, I'm afraid.  And, conceptually the card is the top-level
abstraction, so it'd be unnatural to go beyond that in the ASoC
component.

Of course, we may use multiple cards, but its handling needs really a
careful manner, so it won't be that trivial, especially if DPCM plays
a role.


thanks,

Takashi
