Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB142EC55C
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904684; cv=none; b=E9/Hirwm0G+QxvCdZ0Wd9db0MoYe3brbBvaQoqhaAYrsEawf9H7kN4ghJFcOLMiQAjdXWSCNN2FGeD3xeSPqOSjArAGJ+0xUatySCs+BFB4tLRtjxNnkQKB6C4KF/KjwRoT0EerL1PTZxzqAnbg77DhJ/bTpZNljXfyoo3rPl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904684; c=relaxed/simple;
	bh=wOg31xVziGgk7pGmtLjbSl2MWPVQmeokT5FEdTsAWa8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QceHWD1auxFtafCOXB233TKZ8jkmxMCkW2mh41JgAbMIgKJ/7ZIM4oJHawqFLz55I8Co3rJ86s0hxqqKT0nJAT3sgEu7f0LA9Q0m5bDqpim9+eu5pDfejfDnBFQxp7hqEu5ELXX/LuopUfDsfmoH7zcP4TxFwVcLM22Uk/4yrwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lDJspcZY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tNrRtdrd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0sQVomU0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CNzQfayG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lDJspcZY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tNrRtdrd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0sQVomU0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNzQfayG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 86F75229DA;
	Fri, 31 Oct 2025 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761904681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KteUBQ5MsyBpr9FeJd3YzRtu1Sy/6J4vuWqw/9ILTgI=;
	b=lDJspcZYbTM0/t85Vsar5heVUP+MgwAm2swt8ZVwyKERb358efbkAw64Lu2PAHUNI2N8GP
	9WTY+ha1iqnBm00sxlMvtzcP7XTn3TMKDw541an7YdkNDb2XfhFRT25dW5lZytyEHO98L9
	5SR5WGpqRs4aCtBu+0eADUksS/CHA/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761904681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KteUBQ5MsyBpr9FeJd3YzRtu1Sy/6J4vuWqw/9ILTgI=;
	b=tNrRtdrdw+gQXvpeoBjXkJhd7ypkYJFz33oZk9v08O2UmYM1RUmHLxDML6fh522V+sD6zJ
	vADLBwukd+yJ0CBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761904680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KteUBQ5MsyBpr9FeJd3YzRtu1Sy/6J4vuWqw/9ILTgI=;
	b=0sQVomU0a3piPDGa/cDHx2h5s708O7c1XYaERbKyGwIY8+cMQxOCg9hy8XoZ8pXSK+iynX
	pJzpxkjAY4ZS7jxQ4fyBR0LoWUR1pZKas3B579g0ny1arbDV2WGRQFSaVX3SXZchdZKyw+
	OKXqrTq844LwDdYMAgrCM55IILBNxGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761904680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KteUBQ5MsyBpr9FeJd3YzRtu1Sy/6J4vuWqw/9ILTgI=;
	b=CNzQfayG+GgNqxGRO/CPdPOJulGUIW1hb5Ky6nN5Iw/2CaZSuJmeCk9LsVBsU/Vmi9HmBm
	EWFxYXWlgxScvRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3840713991;
	Fri, 31 Oct 2025 09:58:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FGeYDCiIBGlWdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 Oct 2025 09:58:00 +0000
Date: Fri, 31 Oct 2025 10:57:59 +0100
Message-ID: <87v7jvjsuw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joakim.zhang@cixtech.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
In-Reply-To: <20251031-wise-cassowary-of-foundation-a2a094@kuoka>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-4-joakim.zhang@cixtech.com>
	<20251031-wise-cassowary-of-foundation-a2a094@kuoka>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[cixtech.com,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,cixtech.com:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80

On Fri, 31 Oct 2025 10:05:01 +0100,
Krzysztof Kozlowski wrote:
> 
> On Thu, Oct 30, 2025 at 07:09:28PM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > +	if (err) {
> > +		dev_err(chip->card->dev,
> > +			"unable to request IRQ %d, disabling device\n",
> 
> Why are you requesting resources outside of probe, in work item? You
> cannot handle here deferred probe.
> 
> How is it supposed to work? How deferred probe would work?

The deferred probe is used for snd-hda-intel as it may require either
the vga_switcheroo binding or the firmware loading before the actual
probe.

OTOH, in this driver case, *_hda_init() call might be better as the
part of the probe callback.  Though, we may still need some deferred
work for probing and configuring the codecs, i.e. azx_probe_codecs()
and azx_codec_configure() calls where explicit module bindings are
involved.

I guess snd-hda-tegra does like snd-hda-intel just because it followed
the code flow of snd-hda-intel.  But it doesn't mean that a new driver
should follow the same, too.  Doing the initialization in the probe
callback would be much easier to handle the errors, for example.


thanks,

Takashi
