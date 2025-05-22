Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4779770FE
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938920; cv=none; b=K1j/d9prDYg89KppF5zz7wJZTykyCfUlrpOAEa8oZfPuxKZSCFvPdZ4QT7ye/6ji9TsaEkLhocOimUIVQuJ0g59Ax3pPUavfx79EJj/xYAyGnNHiPu0qLhSiuCCmib17c/8qvRf+VvrKdPBIrwZc2R5dicr4chOEV2vtIfVOMGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938920; c=relaxed/simple;
	bh=B7kjcrh/Zn1LpLtn1DXdZmcM9ev6/ThkZGcCmN4LFAE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odCQbThKVYWROlckCRcZHTCwEqH4GWgN9c7UAix0KwNflYxG800nzsZoR4MCkLWTay10sBnzDjDugpzlxgq6t7RIgGtVwd8YHxIgWntJp4G9RLMNqBDXzZ1a7ztkqETDSy8YUzB1Veb3O71U7HBpY8IjsVM70rr7VoqmeT3wj34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sn2hRaeE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0rdtmnkG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sn2hRaeE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0rdtmnkG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sn2hRaeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0rdtmnkG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sn2hRaeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0rdtmnkG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C0F4A1F891;
	Thu, 22 May 2025 18:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747938916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=Sn2hRaeEiI3n0vfMAFc3sN16wBUr3xAQYpn8g2olDcUdqEwqWDJdO9COwx41U1yEjLW3xe
	gduVpKTpSkc3vjo2OG6GMxxV41Wb/KbH5Zys+XA8hL4J2+UA4+iODFrdtUmkUaaMazAqub
	qT8t0oJfU1UY+CQAThSR7ETjGRZiP28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747938916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=0rdtmnkG0h9k9dyg53aarh30oRG2S2gj6+95VeCI3Y5RYPn3kioUSjVO/sDlnphxGifIMd
	dwQpZZRVri76ihCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Sn2hRaeE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0rdtmnkG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747938916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=Sn2hRaeEiI3n0vfMAFc3sN16wBUr3xAQYpn8g2olDcUdqEwqWDJdO9COwx41U1yEjLW3xe
	gduVpKTpSkc3vjo2OG6GMxxV41Wb/KbH5Zys+XA8hL4J2+UA4+iODFrdtUmkUaaMazAqub
	qT8t0oJfU1UY+CQAThSR7ETjGRZiP28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747938916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKgSFcPtm997gDT5HOWw+E2t1KMf5f4lcOUPP6K2aHQ=;
	b=0rdtmnkG0h9k9dyg53aarh30oRG2S2gj6+95VeCI3Y5RYPn3kioUSjVO/sDlnphxGifIMd
	dwQpZZRVri76ihCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A802A137B8;
	Thu, 22 May 2025 18:35:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mhItKGRuL2gaXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 18:35:16 +0000
Date: Thu, 22 May 2025 20:35:16 +0200
Message-ID: <871psg8pej.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.16
In-Reply-To: <db1ca3958fd5a955bbe43f3191bf4bfd.broonie@kernel.org>
References: <db1ca3958fd5a955bbe43f3191bf4bfd.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: C0F4A1F891
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 May 2025 18:05:36 +0200,
Mark Brown wrote:
> 
> The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:
> 
>   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.16
> 
> for you to fetch changes up to 7ce3bf76c3adfbfcfa712d5090428f67c97db201:
> 
>   Add Tegra264 support in AHUB drivers (2025-05-22 14:38:05 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.16
> 
> The changes in this release are quite large, mainly in drivers rather
> than the core.  This is partly due to cleanups that touch a lot of
> drivers and partly due to several relatively large new drivers.
> 
>  - Support for automatically enumerating DAIs from standards conforming
>    SoundWire SDCA devices, further work is required for these to be
>    useful in an actual card.
>  - Conversion of quite a few drivers to newer GPIO APIs.
>  - More helpers and cleanups from Mormimoto-san.
>  - Support for a wider range of AVS platforms.
>  - Support for AMD ACP 7.x platforms, Cirrus Logic CS35L63 and CS48L32,
>    Everest Semiconductor ES8389, Longsoon-1 AC'97 controllers, nVidia
>    Tegra264, Richtek ALC203 and RT9123 and Rockchip SAI controllers.

Pulled now to for-next branch.


thanks,

Takashi
