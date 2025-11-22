Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1BC23AB88
	for <linux-sound@vger.kernel.org>; Sat, 22 Nov 2025 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763803750; cv=none; b=iPusfaJg8aP81OcWzpOj0u3GOp/Dp3RKRNDHNUTyuL2TUg0dWt5wWA/wkJau/XGHQxSQsdWaMqtO6R+0FnlM9s5YSk72ZrbP1sre2pZkv8Nsh+yap/2BsQYYR4mPNNPnp+KW5vbkAmEw43wietIaHzzKJyqVYofmRr7GkkHpD2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763803750; c=relaxed/simple;
	bh=9FZdf8A1lplJD+n9g14l7up7wiLMrOX9c43KuuFeUrk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxxK+nriVTxNfNqMRa7PWEOYHwWMLONUtmv6rsqEEM787UfPYF0xi0BJ1DigZ1v1k/OICEgmY4qp7Y1ZIG/jm+sNg/r2zHnCvb2IbaUw/0RGBW9nIkbyXbzQ/CLg8tGlI8mhdvVX6z/fGfSYMHZx7TaPa5xhiZOwOmaCTi/O6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jQKkUkuy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eaM4miFw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jQKkUkuy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eaM4miFw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jQKkUkuy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eaM4miFw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jQKkUkuy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eaM4miFw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADB43216F2;
	Sat, 22 Nov 2025 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763803744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRe8y09yavxirZ7+TkwTcPDViry7q34xKFrVo4oDVU0=;
	b=jQKkUkuytunj3AAkI53zRyP1TErhVnlB5Oip+MRhhSu7OVT/QP8NU8LwOwYTyjoD3SX8CE
	kwRnrXxxpmaKxVpoBzvwanqoNeb7oCQGFM6b4knDEfO88Tg5jXBD99Lw2urFm6qEOgUwzE
	/B6pYaK3Zvur1EKwbWeTKGN5pq0VbS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763803744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRe8y09yavxirZ7+TkwTcPDViry7q34xKFrVo4oDVU0=;
	b=eaM4miFw0CTnUfZDR5xtkIYIZ2tTjrIBzIInJNsCi07pkl5UjT1psID1S4+eJdgX/5zXvH
	zrDcsQsWP7gIQ7Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763803744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRe8y09yavxirZ7+TkwTcPDViry7q34xKFrVo4oDVU0=;
	b=jQKkUkuytunj3AAkI53zRyP1TErhVnlB5Oip+MRhhSu7OVT/QP8NU8LwOwYTyjoD3SX8CE
	kwRnrXxxpmaKxVpoBzvwanqoNeb7oCQGFM6b4knDEfO88Tg5jXBD99Lw2urFm6qEOgUwzE
	/B6pYaK3Zvur1EKwbWeTKGN5pq0VbS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763803744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRe8y09yavxirZ7+TkwTcPDViry7q34xKFrVo4oDVU0=;
	b=eaM4miFw0CTnUfZDR5xtkIYIZ2tTjrIBzIInJNsCi07pkl5UjT1psID1S4+eJdgX/5zXvH
	zrDcsQsWP7gIQ7Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 772443EA61;
	Sat, 22 Nov 2025 09:29:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /vzMG2CCIWktMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 22 Nov 2025 09:29:04 +0000
Date: Sat, 22 Nov 2025 10:29:04 +0100
Message-ID: <87o6oul8kf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
In-Reply-To: <4df3c2ac-88cd-42d1-9f1e-c5c2c5a2b00f@harin.net>
References: <20251121152221.1152523-1-me@harin.net>
	<4df3c2ac-88cd-42d1-9f1e-c5c2c5a2b00f@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 22 Nov 2025 10:00:29 +0100,
Harin Lee wrote:
> 
> I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
> safe due to the bounds check, I plan to switch it to 'unsigned int' for
> strict correctness.
> 
> I also have two questions regarding conventions:
> 
> 1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
> acceptable, or would you prefer a simpler name?

I personally prefer a simpler one, but maybe it'd be a question how
this (or equivalent) control is called on Windows or other OS.
If it's also "Dedicated Output", then we can use it as is, too.

> 2. CA20K2 port logic (on patch 6): The condition
> 'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
> the non-standard RCA port mapping. Does this line require additional
> comments or a helper function for better readability?

Sure, a more comment wouldn't hurt.


thanks,

Takashi

> Please let me know if you would prefer me to send a v3.
> 
> On 11/22/25 12:22 AM, Harin Lee wrote:
> > I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
> > CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
> > DAC for 7.1ch output, and a CS5364 ADC. This model differs
> > significantly from other CA20K2-based variants.
> > 
> > Since official driver support for this hardware was discontinued a long
> > time ago, this patch series enables the card to be used on modern
> > platforms.
> > 
> > This patch series was developed using QEMU vfio tracing, and PCIe BAR
> > dumps. Tested with analog output (up to 192kHz) and line/microphone
> > input (up to 96kHz) at various sample rates.
> > 
> > Changes in v2:
> >   - Fix coding style issue (mixed declaration and code) in
> >     dedicated_rca_put().
> > 
> > Harin Lee (6):
> >    ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
> >    ALSA: ctxfi: Add ADC helper functions for GPIO
> >    ALSA: ctxfi: Use explicit output flag for DAIO resources
> >    ALSA: ctxfi: Refactor resource alloc for sparse mappings
> >    ALSA: ctxfi: Add support for dedicated RCA switching
> >    ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
> > 
> >   sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
> >   sound/pci/ctxfi/ctatc.h      |  8 +--
> >   sound/pci/ctxfi/ctdaio.c     | 18 ++++---
> >   sound/pci/ctxfi/ctdaio.h     |  3 ++
> >   sound/pci/ctxfi/cthardware.h |  4 +-
> >   sound/pci/ctxfi/cthw20k1.c   |  3 +-
> >   sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
> >   sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
> >   8 files changed, 223 insertions(+), 62 deletions(-)
> > 
> 
