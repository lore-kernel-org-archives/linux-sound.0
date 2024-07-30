Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076DF198E82
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339226; cv=none; b=PHxPV2dVMr9BulHTLq72PQTCN4BNFeSFPYhAUwmhf/Z9oT/McHnGTVqU4NIFKH6hWTrANula3dFis7hc3O6kLZeKqC0Niv4ubiSXFsn4B2kYpkb4Ks2dccDSZFmrYCGvWWWADNFuv2e5iNsd2OCYMAFHe0Q/hq/UkPcE+MKiukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339226; c=relaxed/simple;
	bh=nt6stVS+nRd8P6mnn1HiBb0sJACPos70ClaJMnspM10=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7AufbtkBYWztwafJz0/fU+NuoJuYUtGAZz/GuvA1lmsCqd62dN5mcfkAOsqqyhvHJtXBIK/c2U2jFqKwCZ5g4TTSHxm6D1s7e4SkQonNQ90vTEwv66XQzLTM4Vvva3a8iUnNYVhmxpnfl2sJ40eDG4JDQAD01zerfO3SQGAyA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fdrob6sX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dCI8pxgj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fdrob6sX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dCI8pxgj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fdrob6sX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dCI8pxgj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fdrob6sX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dCI8pxgj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C0BC21A6C;
	Tue, 30 Jul 2024 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722339223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rc7BBgwl17bstdsZ/vUka+DMqespiVZuWm0efktDhs=;
	b=fdrob6sXIg47uUl/6nhHjynh+7pWELFUvtPJuIGhKuJCBFKdKmAq1b11LOa1uhsn5cQlGz
	2c3ALgqau5qP5/cT4h3dwgbWO+X3H5+j3fSAYfVfUXQVEKg7O0vM2jQLp6s1xIykF1UEHI
	FdPLeIqdiPmSiFXeGXsVT7V9wNADA44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722339223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rc7BBgwl17bstdsZ/vUka+DMqespiVZuWm0efktDhs=;
	b=dCI8pxgj0XC/lqylcwjbbNrleH5vwYXOM0IdL4+gNf4iUfNAqWVQIvedFAglAxGyJ6EvAq
	TiHVI8rzDEEkOsCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722339223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rc7BBgwl17bstdsZ/vUka+DMqespiVZuWm0efktDhs=;
	b=fdrob6sXIg47uUl/6nhHjynh+7pWELFUvtPJuIGhKuJCBFKdKmAq1b11LOa1uhsn5cQlGz
	2c3ALgqau5qP5/cT4h3dwgbWO+X3H5+j3fSAYfVfUXQVEKg7O0vM2jQLp6s1xIykF1UEHI
	FdPLeIqdiPmSiFXeGXsVT7V9wNADA44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722339223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rc7BBgwl17bstdsZ/vUka+DMqespiVZuWm0efktDhs=;
	b=dCI8pxgj0XC/lqylcwjbbNrleH5vwYXOM0IdL4+gNf4iUfNAqWVQIvedFAglAxGyJ6EvAq
	TiHVI8rzDEEkOsCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3843F13983;
	Tue, 30 Jul 2024 11:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OJHsDJfPqGbnOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Jul 2024 11:33:43 +0000
Date: Tue, 30 Jul 2024 13:34:19 +0200
Message-ID: <87jzh33yh0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Take power_ref lock primarily
In-Reply-To: <f0e4eea2-4250-42a7-af4a-d0e058452935@perex.cz>
References: <20240729160659.4516-1-tiwai@suse.de>
	<f0e4eea2-4250-42a7-af4a-d0e058452935@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.10

On Tue, 30 Jul 2024 12:18:03 +0200,
Jaroslav Kysela wrote:
> 
> On 29. 07. 24 18:06, Takashi Iwai wrote:
> > The code path for kcontrol accesses have often nested locks of both
> > card's controls_rwsem and power_ref, and applies in that order.
> > However, what could take much longer is the latter, power_ref; it
> > waits for the power state of the device, and it pretty much depends on
> > the user's action.
> > 
> > This patch swaps the locking order of those locks to a more natural
> > way, namely, power_ref -> controls_rwsem, in order to shorten the time
> > of possible nested locks.  For consistency, power_ref is taken always
> > in the top-level caller side (that is, *_user() functions and the
> > ioctl handler itself).
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> It looks fine, but perhaps, we can DEFINE_GUARD for
> snd_power_ref_and_wait and use this scoped guard, too? It would
> greatly simplify code.

I thought of that, but it's a bit more complicated because it's a
version with *_try (so you have to define more).  I'd replace as a
refactoring later.


thanks,

Takashi
