Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA217C8B
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737046138; cv=none; b=Gz3jmlzu+C8tsXTcqXmK7+IIHzVTgk0Pai8BiYxGM9x4Jgl4tNfnEfEbbXeYkw/G+CuWUiqKH2Vkqcz1o538itDN0EGDS69UH/0RbtSE8S+YfMs9yWHLd7Cq6yCU/TUrm0jPZywfyKfXV3rcNak/5g7mxRQ6LePqjq2mxLUGP3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737046138; c=relaxed/simple;
	bh=tGz4gRE+Sg+Lsu5nb9TtYJEgxjH610F/xg9q8I4fmcw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fd1a9+VPwVWzRlSz1Jqe79jA9yEN4Osc/itwaYhQanL92h37zoSQsGLSkZioEghklik4GdqT29UbnV1eYLWd7FgK2bwWjY8JTFaqz8fDBZNBihQeSv9RPKyoLDI8J2WOEa0GkU1gLFm1O4635dlpCjJJnkZNcnrKJB03SaFMgaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dWhp6aXg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXhuKHo+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dWhp6aXg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXhuKHo+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dWhp6aXg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXhuKHo+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dWhp6aXg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXhuKHo+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 463F521183;
	Thu, 16 Jan 2025 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737046135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tjcALRSZKcpHREoTs0jq2906dlN7JP/pebSSr5/W9Cg=;
	b=dWhp6aXgU1UMApyF013gfnqryQxhRRME1CIc5pEPZ11YfvO362TQex7nQa7wrvZvu06Q1A
	405mSzW89KjbpcPXcGNLpJyH0n6aOslVyy6kr9oV5XYUv1fiLy5bAt9B78eTXywHZytpNu
	fB2rdyesJQ6u2KhaSxD2zaG7zz66Xng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737046135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tjcALRSZKcpHREoTs0jq2906dlN7JP/pebSSr5/W9Cg=;
	b=nXhuKHo+664V8JJz+mct5StTAtIag2/AsfJ9d3NVuI6gf6IP0OhjN//olbW8yCfI8Pbqyt
	ZhHUjPmH3ze4n3CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737046135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tjcALRSZKcpHREoTs0jq2906dlN7JP/pebSSr5/W9Cg=;
	b=dWhp6aXgU1UMApyF013gfnqryQxhRRME1CIc5pEPZ11YfvO362TQex7nQa7wrvZvu06Q1A
	405mSzW89KjbpcPXcGNLpJyH0n6aOslVyy6kr9oV5XYUv1fiLy5bAt9B78eTXywHZytpNu
	fB2rdyesJQ6u2KhaSxD2zaG7zz66Xng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737046135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tjcALRSZKcpHREoTs0jq2906dlN7JP/pebSSr5/W9Cg=;
	b=nXhuKHo+664V8JJz+mct5StTAtIag2/AsfJ9d3NVuI6gf6IP0OhjN//olbW8yCfI8Pbqyt
	ZhHUjPmH3ze4n3CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DA7E13A57;
	Thu, 16 Jan 2025 16:48:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AXwLBnc4iWfoSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Jan 2025 16:48:55 +0000
Date: Thu, 16 Jan 2025 17:48:54 +0100
Message-ID: <87a5bqu2kp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
In-Reply-To: <Z4k3M7S1Bo2EDlDO@m.b4.vu>
References: <cover.1737017960.git.g@b4.vu>
	<7355f25d9b57386c280aef651b6ba2b96cf0d5a7.1737017960.git.g@b4.vu>
	<878qraiywb.wl-tiwai@suse.de>
	<Z4k3M7S1Bo2EDlDO@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 16 Jan 2025 17:43:31 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> A couple of questions for clarification:
> 
> On Thu, Jan 16, 2025 at 04:03:48PM +0100, Takashi Iwai wrote:
> > On Thu, 16 Jan 2025 10:03:35 +0100,
> > Geoffrey D. Bennett wrote:
> [...]
> > > +#define SNDRV_CTL_TLVT_LABELS		0x110	/* channel labels */
> > 
> > IMHO, the data definition looks too ambiguous here to be put as a
> > public API.  It can be also a more specific name such as
> > *_CHANNEL_LABELS, too.
> 
> Do you mean e.g. SNDRV_CTL_TLVT_FCP_CHANNEL_LABELS ?
> 
> But still define in include/uapi/sound/tlv.h?
> 
> And 0x110 is okay to use?

All yes.


thanks,

Takashi
