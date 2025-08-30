Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BC2AD0D
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539285; cv=none; b=j5quuwDUn7PKAMPnEH5qdpu9p9jQmMKDNnVij+Iv/ZhlvrlHbMrfmkDyoWQXFHh5tpMZt/8Bg7a3/ApXYo8Yu8DdWSL7zTZoTqyVuKCy2d+KiltwxS2atV9j6e7shwg/lVCGNxvx319ONDBTImTQoiZcbQDLy5BucFT6gZ8xAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539285; c=relaxed/simple;
	bh=ip/7sBW46nt2FYFloYbkxvhxB4+Odu0+riBd9LakzVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nur3BIDGN+s1SIp84sTWjCEztb7N1e/BH9AkEdqeeAr2KW5rK0dEE0aeRjvYKO0nVDuC+jvlS8vUoZnfTjczR9R+rhFgVdIv9XR8w8osk+h3G146L8mn755Q9xUD5lO9+mj2yCKAUHP9hY0ptk7aDinrY1Ihp3B5x9ST+5Q/Pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fii+X9z8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PwLsH5iJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fii+X9z8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PwLsH5iJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fii+X9z8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PwLsH5iJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fii+X9z8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PwLsH5iJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A03111F44F;
	Sat, 30 Aug 2025 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756539281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYEO6faJx20+I+HX+kEtmL5+UG3FP66KezU3N3ArdwA=;
	b=fii+X9z8BSn3aPY5VyOETxVp6ej8XuM+o+A6CEva1D0p++rW1n12RmbU4ukob4JQ2YBJUp
	QVHkPGKHZ9JycVQMpUT/nUc7MifJtmLu5zJW9YkRDnCDkgj89UZc89MTVUYI5qixuILUXF
	5GUwDjODJav8STJiMs0rJwQz8kQE2Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756539281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYEO6faJx20+I+HX+kEtmL5+UG3FP66KezU3N3ArdwA=;
	b=PwLsH5iJMCOiwxhFafC9IFA9ZP9MEIqca1sVgrXeel1BOpESkpQZtc0u8FSQz16jTKKfCU
	7H4iJ71quTvdxRDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fii+X9z8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PwLsH5iJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756539281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYEO6faJx20+I+HX+kEtmL5+UG3FP66KezU3N3ArdwA=;
	b=fii+X9z8BSn3aPY5VyOETxVp6ej8XuM+o+A6CEva1D0p++rW1n12RmbU4ukob4JQ2YBJUp
	QVHkPGKHZ9JycVQMpUT/nUc7MifJtmLu5zJW9YkRDnCDkgj89UZc89MTVUYI5qixuILUXF
	5GUwDjODJav8STJiMs0rJwQz8kQE2Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756539281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYEO6faJx20+I+HX+kEtmL5+UG3FP66KezU3N3ArdwA=;
	b=PwLsH5iJMCOiwxhFafC9IFA9ZP9MEIqca1sVgrXeel1BOpESkpQZtc0u8FSQz16jTKKfCU
	7H4iJ71quTvdxRDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DCC0139B1;
	Sat, 30 Aug 2025 07:34:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uB2aHZGpsmiDGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Aug 2025 07:34:41 +0000
Date: Sat, 30 Aug 2025 09:34:41 +0200
Message-ID: <87v7m5fejy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH v2 00/19] ALSA: firewire: Use auto-cleanup macros
In-Reply-To: <20250829234701.GA362429@workstation.local>
References: <20250828132802.9032-1-tiwai@suse.de>
	<20250829234701.GA362429@workstation.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: A03111F44F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Sat, 30 Aug 2025 01:47:01 +0200,
Takashi Sakamoto wrote:
> 
> Hi,
> 
> Thanks for your updates.
> 
> On Thu, Aug 28, 2025 at 03:27:04PM +0200, Takashi Iwai wrote:
> > This is another patch set for cleaning up the code with the recent
> > auto-cleanup macros like guard() & co, applied to FireWire sound
> > drivers.
> > 
> > Only code refactoring, and no behavior changes intended.
> > 
> > 
> > Takashi
> > 
> > v1->v2:
> > * Fix missing subject prefix for digi00x
> > * Drop superfluous blank lines in scoped_work blocks
> > 
> > ===
> > 
> > Takashi Iwai (19):
> >   ALSA: firewire: bebob: Use guard() for mutex locks
> >   ALSA: firewire: dice: Use guard() for mutex locks
> >   ALSA: firewire: digi00x: Use guard() for mutex locks
> >   ALSA: firewire: fireworks: Use guard() for mutex locks
> >   ALSA: firewire: motu: Use guard() for mutex locks
> >   ALSA: firewire: oxfw: Use guard() for mutex locks
> >   ALSA: firewire: tascam: Use guard() for mutex locks
> >   ALSA: firewire: fireface: Use guard() for mutex locks
> >   ALSA: firewire: isight: Use guard() for mutex locks
> >   ALSA: firewire: lib: Use guard() for mutex locks
> >   ALSA: firewire: bebob: Use guard() for spin locks
> >   ALSA: firewire: dice: Use guard() for spin locks
> >   ALSA: firewire: digi00x: Use guard() for spin locks
> >   ALSA: firewire: fireface: Use guard() for spin locks
> >   ALSA: firewire: fireworks: Use guard() for spin locks
> >   ALSA: firewire: motu: Use guard() for spin locks
> >   ALSA: firewire: oxfw: Use guard() for spin locks
> >   ALSA: firewire: tascam: Use guard() for spin locks
> >   ALSA: firewire: lib: Use guard() for spin locks
> 
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> By the way, I found a bug in ALSA firewire-motu driver (that's on me...)
> when reviewing the patchset, and sent a patch[1] now to fix it on your
> for-linus branch. It could bring a conflict against 16th patch in your set
> ("ALSA: firewire: motu: Use guard() for spin locks"), and I would like
> you to apply it at first (then sent it to upstream), then applying the
> conflicted patch with handy changes.
> 
> [1] https://lore.kernel.org/linux-sound/20250829233749.366222-1-o-takashi@sakamocchi.jp/T/#u

OK, applied the fix now, and will respin the MOTU patch v3 on top of
that.


Takashi
