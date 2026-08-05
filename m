Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0447B437;
	Wed,  5 Aug 2026 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943524; cv=none; b=qj9hxksMD5TyAD4Wgqiu5S/DqpA8T9FepsV1NMq9q2QImIJHLwI/b4iTmmwen4P272BOCuARGaeFQo0iEsHsIU/5Z8zmr4WkjrEwxnGhqr0e5JEEjOLMYLbf7jOq93nY1mzfLyTKL2cZj08gqVOeLHlcIebtQ+7bmhi7Es2fro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943524; c=relaxed/simple;
	bh=7WuIEanK4R8HBkg4HjHLi0967Pub84lEf/IJ9jjsmio=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2g244QWLogxiJOWPxG9gc9QgSir7rPVTZTpU7eIl3qzFqsI9WEhQlbnua1CFIHtTCfq9z9HtaZZIVCq/u2LwKi9SkaIQvYFRjEwCavuB8l7PVSiT4IH6Pd0VRyfVOf5RrB8Sa0HqkM50Gb+VxFMPb0Uaz2mK4ilX4/FB8QTJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8DELgaS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8bUwi/p3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WuQpWE+T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nSptfe2a; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8DELgaS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8bUwi/p3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WuQpWE+T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nSptfe2a"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 414F67F218;
	Wed,  5 Aug 2026 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785943505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2ZhJZsCj+fDKM9ej4KrtyLsDSOu5Mimk6hC+pb9u5I=;
	b=V8DELgaS1Esmb4EepJKSIA/VFuDRrDQv/9hFdGj6VWR/lyxYWtG4P0We8ukY5Rj2DAosR9
	Nzlu0125HSZ4gU83L0PnAiw53ItyjF85eiRQ6ruq/QDV+JZP2APubZQZRWGmNsAbm7GR/E
	2YM/8Au55DR/r62DdKQB+YHNoIQSyUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785943505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2ZhJZsCj+fDKM9ej4KrtyLsDSOu5Mimk6hC+pb9u5I=;
	b=8bUwi/p3uFA4GkTlUbmDwjHB5j8f53svgdByUEYTbZL2cwZ0zEUbMfRRzaZYE1CbNlC7YW
	JIXba56XSH3kGHBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785943501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2ZhJZsCj+fDKM9ej4KrtyLsDSOu5Mimk6hC+pb9u5I=;
	b=WuQpWE+TJls07tEmaczk9ICVYirzSMUhDqYwcWwN1rHHB1qjxH0gvQ4HXSz4Ag5kWhOVqr
	/NRZXu7hq3+ripGKm+wkgJFXnEMnz5U8dUQOw3MAvO9XIsUcaaU9ygm1jRQ9chttNWu0wH
	3gfXH873T8z6Ybhvc8TcnTANvW7/hc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785943501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J2ZhJZsCj+fDKM9ej4KrtyLsDSOu5Mimk6hC+pb9u5I=;
	b=nSptfe2aOWoFpprkj1fsD9ujOOq8u1gd3xq/nLu7kdVRRmzfeMXn+WeQJPPlatuvuh+Flp
	95wRlYiorbHSyvCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18B92779C2;
	Wed,  5 Aug 2026 15:25:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fPNuAM1Vc2ofJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 15:25:01 +0000
Date: Wed, 05 Aug 2026 17:25:00 +0200
Message-ID: <878q6kfv3n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P  ADR10H
In-Reply-To: <DS7PR19MB7724EE8DED946545C55717C1FCD32@DS7PR19MB7724.namprd19.prod.outlook.com>
References: <DS7PR19MB7724EE8DED946545C55717C1FCD32@DS7PR19MB7724.namprd19.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[outlook.it];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Wed, 05 Aug 2026 10:10:17 +0200,
Marco Giunta wrote:
> 
> Add codec SSID entries for the Lenovo Legion R9000P ADR10H (83RV),
> which uses the same ALC287 + AW88399 smart amplifier configuration
> as the existing supported Legion models.
> 
> DSDT inspection confirms identical AWDZ8399 ACPI device layout with
> reversed I2C addresses (0x35 before 0x34). Register dumps show the
> same BSTS behavior as the other Legions. Both the channel swap and
> BSTS bypass quirks apply.
> 
> Codec SSIDs (Lenovo vendor ID 0x17aa):
> 
> * 0x3936: Legion R9000P ADR10H (AMD)
> * 0x3937: Legion R9000P ADR10H (AMD)
> 
> Signed-off-by: Marco Giunta <marco_giunta@outlook.it>

Applied to for-next branch now.  Thanks.


Takashi
