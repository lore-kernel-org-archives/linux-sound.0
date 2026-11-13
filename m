Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556294;
	b=5Ivks2GOiLKkg55PspIJH3+1DpRaUeEDtW7wJR0azHKjNlKIw4wWDEynT4SuPiMA8n8E
	 G/6IozBU1WWW0oEWv/Fiqlzghp3LX68U3+1Uc9HUD8rpeu4dFOxaGVgRAQmvZwtgNWM9l
	 dpOhTmNneeRag1orewCOcpLsjDZzagBOk6LEgqkv72xVmkTHXE+IpU2OKP1ZnFibLSm3A
	 WyODl5PjdB3hI7jpUnqwEeIwwILmam6maMUPTCQ+jCTT5sfZsP5FzXdv0ieGP7AgKsVI+
	 2MZ8s7jVNayEIzaiDqTOghqOhOIjdQv6jpycM+aI7ExHihBLLXBSxN3uXJIToE4qWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556294;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=GTrNb72e3UZ/aCsehypATNb6lFPLqpvLaCvAfBKmJ7g=;
	b=whlLcUIU4ZWfUKiTHfbREycqJjOoFmZOiBizr/yUiKBoW54bg/V98X+XdLa/QwAsVR2j
	 d6ZO8xNYbYQYquv4KtIPfMYr4Of+uaPKv+tDGK7MVrpLPKpb74L4PBj4qS7uzaFNldw0M
	 SduXJ3jOxjsBSwf4F5H3B5WxdkDQ5Mf1r/mbc/Y8FWThaJgDGGs9s5Gyy4eE9MUGlwRtj
	 3NejTT0kmX9X6C3ljvYZGO+dWzE7obAgX9RqQyZy+oRHdySVRBdz6Nk+VGCO1xhOUvYev
	 Yq5AuYrbFVPUAMQEb5tm2j/TSv/hc9oFiD7UNxLAFMeVjPNgXrmJrAUYi68svbfQQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CLe7A21F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="+oW/bxjd";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CLe7A21F;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="+oW/bxjd";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB0606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CLe7A21F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+oW/bxjd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CLe7A21F;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+oW/bxjd
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A53C220B7;
	Fri, 13 Nov 2026 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794556292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GTrNb72e3UZ/aCsehypATNb6lFPLqpvLaCvAfBKmJ7g=;
	b=CLe7A21FklmaTQsR1j+vcCAj0GlS1WUzTCxfoLvDce3hdcbvPdkkRrhOfpFjKF6AniAlu6
	2ul5vkQmnTYEkh5RSP1JTMMkOPyv1Ktw5c45XMv9tTpr0FeZyNHLOF4Q0Zf2fR0RyS2vmy
	F8azlY3GYeC0kgyi+kMXZZaHBrivEEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794556292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GTrNb72e3UZ/aCsehypATNb6lFPLqpvLaCvAfBKmJ7g=;
	b=+oW/bxjd1i1yNtiebDNFQsmYoVs0JrJFofGERQqUnoJjbm3qbrcAFJgrkOiI1OGy90inTd
	KnjpWXesV/o40gDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794556292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GTrNb72e3UZ/aCsehypATNb6lFPLqpvLaCvAfBKmJ7g=;
	b=CLe7A21FklmaTQsR1j+vcCAj0GlS1WUzTCxfoLvDce3hdcbvPdkkRrhOfpFjKF6AniAlu6
	2ul5vkQmnTYEkh5RSP1JTMMkOPyv1Ktw5c45XMv9tTpr0FeZyNHLOF4Q0Zf2fR0RyS2vmy
	F8azlY3GYeC0kgyi+kMXZZaHBrivEEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794556292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GTrNb72e3UZ/aCsehypATNb6lFPLqpvLaCvAfBKmJ7g=;
	b=+oW/bxjd1i1yNtiebDNFQsmYoVs0JrJFofGERQqUnoJjbm3qbrcAFJgrkOiI1OGy90inTd
	KnjpWXesV/o40gDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E1651344A;
	Fri, 13 Nov 2026 07:51:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GdekD4TB9mr8WgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Nov 2026 07:51:32 +0000
Date: Fri, 13 Nov 2026 08:51:31 +0100
Message-ID: <87cxs9qid8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.4-rc2
In-Reply-To: <da3d9a0821be2c6200c0af618dda6256@kernel.org>
References: <da3d9a0821be2c6200c0af618dda6256@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 12 Nov 2026 19:55:28 +0100,
Mark Brown wrote:
> 
> The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:
> 
>   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc2
> 
> for you to fetch changes up to 58d51fa6ff1d21e79c3c340bfb3155dfa3025ca3:
> 
>   ASoC: max98090: keep the MIC boost across mic input power-up (2026-11-11 18:05:03 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.4
> 
> Another week, another pile of driver specific fixes and quirks.  We do
> have one major fix which addresses a bug introduced by confusion with
> the counted_by interfaces that was causing major disruption for a number
> of platforms.

Pulled now.  Thanks.


Takashi
