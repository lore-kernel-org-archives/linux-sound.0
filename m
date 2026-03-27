Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B903E6DF1
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618995; cv=none; b=NFRtbT2CNnotl2rJ6DFGfvaQJPoY2cCrPP1hm5jLwiNuY7TyCXIA/QxbOOQeTVuGwJI+ii5Rn3eqV5K5mzAvAk2LukwHGAdftBggSoKEQlGYLdkDY7ZY3aQW59vBGeQeoucAZipW4Sxh3xTeWnA1Me07UuRGaa3w10ioq8a2VuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618995; c=relaxed/simple;
	bh=0CpV3JysPUFuBc+zHkfQPkqXbRvr5kdMO99dL9l2Bcc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAobvJSnR4pKCDrw5ZvU8peGKMJR0o7t62+gw68X6YRAxhHRJ1ttGv7q5eLe1XLNWbQJRLACIzE1t/WnpKMKRqY6N86dl6SuwwKN8lQDeWIUcBvjC3oubN7utaBBkN4E/vx21ohUZ7CfNcjaCRN6/VxCxUceaNKB8JihfbOlr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OeXYd5u/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vXUsDjFq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OeXYd5u/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vXUsDjFq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OeXYd5u/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vXUsDjFq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OeXYd5u/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vXUsDjFq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9892E5BE12;
	Fri, 27 Mar 2026 13:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774618991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ClFCgBd5f2f047jCPD6zJpSGFLfNlMz6by/f/vMf6vI=;
	b=OeXYd5u/VRT/qj7lYMO3CJsnkbh5VLWWkeTEJKXPWjJshrFWhDRVRYtLTW0KWdIHZAVT9J
	Bh60glIXog1li/Qk0fKmtY+pIZPzxLvWI6YNoiYFdzeOcHmvNTQJqjhJpHaLkO89Au07UQ
	QdnHHMY78q4XH+lCN5Tz1vgOWVJ2pOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774618991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ClFCgBd5f2f047jCPD6zJpSGFLfNlMz6by/f/vMf6vI=;
	b=vXUsDjFqdysJeUeSW/2HlBqupByCHPXMwdJeuAMFQ4aeGNNp22KEP62QYidl45goRle2d3
	xNVayzb/ogXcWkAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774618991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ClFCgBd5f2f047jCPD6zJpSGFLfNlMz6by/f/vMf6vI=;
	b=OeXYd5u/VRT/qj7lYMO3CJsnkbh5VLWWkeTEJKXPWjJshrFWhDRVRYtLTW0KWdIHZAVT9J
	Bh60glIXog1li/Qk0fKmtY+pIZPzxLvWI6YNoiYFdzeOcHmvNTQJqjhJpHaLkO89Au07UQ
	QdnHHMY78q4XH+lCN5Tz1vgOWVJ2pOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774618991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ClFCgBd5f2f047jCPD6zJpSGFLfNlMz6by/f/vMf6vI=;
	b=vXUsDjFqdysJeUeSW/2HlBqupByCHPXMwdJeuAMFQ4aeGNNp22KEP62QYidl45goRle2d3
	xNVayzb/ogXcWkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B9A94A0B1;
	Fri, 27 Mar 2026 13:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZGXvFG+JxmksIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 13:43:11 +0000
Date: Fri, 27 Mar 2026 14:43:10 +0100
Message-ID: <87a4vtqtg1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA:usb-audio: Disable Arturia Audiofuse 16Rig
In-Reply-To: <3610608.LZWGnKmheA@linux-workstation>
References: <20260319143212.149090-1-willerz@gmail.com>
	<20260319143212.149090-2-willerz@gmail.com>
	<87fr5lqx90.wl-tiwai@suse.de>
	<3610608.LZWGnKmheA@linux-workstation>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 27 Mar 2026 14:22:01 +0100,
Phil Willoughby wrote:
> 
> On Friday, 27 March 2026 12:20:59 Greenwich Mean Time you wrote:
> > On Thu, 19 Mar 2026 15:32:12 +0100,
> > Phil Willoughby wrote:
> > > 
> > > There's an out of tree driver which works for some use-cases here:
> > > 
> > > Link: https://github.com/WillerZ/arturia-af16rig-driver
> > > 
> > > Signed-off-by: Phil Willoughby <willerz@gmail.com>
> > > Tested-by: Phil Willoughby <willerz@gmail.com>
> > 
> > In general, we don't care much about the out-of-tree driver.
> > If it's upstreamed, of course we'd love to help.  But this kind of
> > change is no-go.
> 
> I'm happy to work on patches for an in-tree driver.
> 
> It would need the patch chain you sent me that replaces the
> hardcoded channel max with MAX_CHANNELS and makes the channel mask
> 64-bits, because it has 34 channels.

If it's confirmed to work, I can submit and merge this beforehand.

> I'd also need to add one or two new quirk flags or device-id matching
> branches: which approach is preferred?

Well, it's hard to tell without comparing both changes...


thanks,

Takashi
