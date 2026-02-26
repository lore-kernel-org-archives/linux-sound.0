Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BB3290C3
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125171; cv=none; b=iNdCPW8Pr1Ve6kODFgzN3Pf2nobFRolAq1xLVUSvsf2nf+lReGCvXko0F79rExQsRkxhRAH3gB+/X35FeMUwIy/2iSf/8o5quxCCGpqRl8BRXBQ5CD3IGSH47oDKWTrpxxgODi/hGJ6L/rLZIc7n/jOiJiG7MjzrHA1D4Ycy4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125171; c=relaxed/simple;
	bh=IXAtEeV7m9zIpGVJxlz2NTCNsPqPn6tthh3D2M8EbJE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clB9RXzrt5SUWgKyXVLcLd+If89QlGyIxA8q1zOEtLq5iw3bmHYx30KTyVstlZ2zwjo7AB2M88R3NYlacpO+Je0kKuxQ+ZqUg9sjKKc0dwtP/HUAZxjYaenbLZc04WzGnZr3mnaOAop5EoAazK6fJ2cCwKIzPOb3cJNTJr76aqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ina9FHKv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hvS0qcrN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ina9FHKv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hvS0qcrN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ina9FHKv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hvS0qcrN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ina9FHKv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hvS0qcrN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DAF41FAB3;
	Thu, 26 Feb 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772125168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkLSL+H9zoe1QulwO02E36WEVTivH6+YHjxCzuHkd7I=;
	b=Ina9FHKvgouAuBUbdbifZyh5oCIfJxVKNfwSa35v5WrH2XfQkTzzrVY77nUFRM+ZivSBbj
	jdl/TaLwlKzBn2xMepYKF+MjEpK7ibM+BlzDYEPfj1oypooxsWzaAi14CX09HAuXwTYVVO
	WDmGZwRiPho117ewLBZtEpsv9zKV/S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772125168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkLSL+H9zoe1QulwO02E36WEVTivH6+YHjxCzuHkd7I=;
	b=hvS0qcrN9L4Stpp9qe8ALlWilWwk4eIiDnajZyJOoDWY4gzaLevQNCyPyxtsdzCBDZKs+6
	fb4+LdITg04AuVBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772125168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkLSL+H9zoe1QulwO02E36WEVTivH6+YHjxCzuHkd7I=;
	b=Ina9FHKvgouAuBUbdbifZyh5oCIfJxVKNfwSa35v5WrH2XfQkTzzrVY77nUFRM+ZivSBbj
	jdl/TaLwlKzBn2xMepYKF+MjEpK7ibM+BlzDYEPfj1oypooxsWzaAi14CX09HAuXwTYVVO
	WDmGZwRiPho117ewLBZtEpsv9zKV/S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772125168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkLSL+H9zoe1QulwO02E36WEVTivH6+YHjxCzuHkd7I=;
	b=hvS0qcrN9L4Stpp9qe8ALlWilWwk4eIiDnajZyJOoDWY4gzaLevQNCyPyxtsdzCBDZKs+6
	fb4+LdITg04AuVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1F063EA62;
	Thu, 26 Feb 2026 16:59:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b5fDOe97oGkaOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 16:59:27 +0000
Date: Thu, 26 Feb 2026 17:59:27 +0100
Message-ID: <87ikbja1ao.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: SDCA: Fix comments for sdca_irq_request()
In-Reply-To: <c41f115e-b8ba-417d-86b6-0548fd86caaf@sirena.org.uk>
References: <20260226154753.1083320-1-tiwai@suse.de>
	<c41f115e-b8ba-417d-86b6-0548fd86caaf@sirena.org.uk>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 26 Feb 2026 16:53:09 +0100,
Mark Brown wrote:
> 
> On Thu, Feb 26, 2026 at 04:47:52PM +0100, Takashi Iwai wrote:
> > The kernel-doc comments for sdca_irq_request() contained some typos
> > that lead to build warnings with W=1.  Let's correct them.
> > 
> > Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
> 
> Probably easiest if you apply this directly for sending a PR to Linus:
> 
> Acked-by: Mark Brown <broonie@kernel.org>

OK, as it's a trivial fix, I took now.


thanks,

Takashi
