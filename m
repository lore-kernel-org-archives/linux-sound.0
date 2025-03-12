Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6A17C219
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741791023; cv=none; b=n9n5h87G000G/PEmDSfWxcDuytXZITQEgCZu5XkWWyMdBPiRiLqE93XdOqC6WSMM9LSCWVl7I8zRqLGaZYPlXjHsl7131Yx2xPo+36db7N8kUA6a0PCSMaeUILhf1AxKSys7WPybeQqxb/Q5WH1LUyhc63foEgu9gwFxx87Xt00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741791023; c=relaxed/simple;
	bh=ZJH47BS51vcf2c6lBX0xT6flaBRz9vNqC20UYWo1yjw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afGTG5O5M9WaSvb/4XNL00AB4GD4qOkpr3G9P9EoHqF8Ca0UPwKWSulVvUGhWV21ooXajeZ80V8SWcy2FJl+B9reRTDYH4DTJ51EEVURbHe6ABQSYwWEZqRRzOqcs14IKidgYpIP/AJUCnNMoj0sqfPIQBWh+M4e/2fxcyN/9cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FZUFD2wM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eVvUOHmN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Miw4Vjso; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dh7fGeUs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FZUFD2wM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eVvUOHmN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Miw4Vjso";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dh7fGeUs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79E8C1F443;
	Wed, 12 Mar 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741791019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=FZUFD2wMrFUMAgUcoHMRpFNP53c2D4/cP2IPoJX9Z3WehHgWVx1AYDErpqJ2ZSQsJ8J3QJ
	H7d8C2/DcP8mDgI/o9MLfpEto1ZAWumGfpWmMYijZ5ZCtx8qsi0upz3+1XIts3SLfo5jx5
	CIEzU6cFXRC9R0GhgXqtknGlfJQWMJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741791019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=eVvUOHmNQgZRU4mwDZaBrR8ZmQeQdU4kzyM5AyObhQB8Q14TRB6AySmDTaos26GzJczCpT
	VlokVijrJQENLSAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Miw4Vjso;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dh7fGeUs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741791018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=Miw4VjsomqCDt2+/oQMzdZN9x9A9HVpl4iKkI8IOlEa/nAF3kO4RNZ8oda7507r1TY6qig
	UKTburLhMmwrCwfsjJ2jYSYavAzTGFLL10QdSE4CNlgqDH0dVe/BwSfsMZ6JjutrFk0xBy
	6jo4JSv+fnw7WeAt4+EI0l4Sl872iPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741791018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dOFdKjywZF8QIJ75G2gDhIuEm0zcFzQpuqcYivCve0k=;
	b=dh7fGeUslUIZTUCRkiW+Ac96XZKUaRzipfm//0rQCIK4T+Y9AQI0RAW+UET+g6P3a0fBbt
	tPjbRAZe1V6hZrAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53DB3132CB;
	Wed, 12 Mar 2025 14:50:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VyJOEyqf0WeofgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 14:50:18 +0000
Date: Wed, 12 Mar 2025 15:50:17 +0100
Message-ID: <87cyemz4k6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc6
In-Reply-To: <3e8be5877ad35b6bc8fb2d148378ea90.broonie@kernel.org>
References: <3e8be5877ad35b6bc8fb2d148378ea90.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 79E8C1F443
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 12 Mar 2025 15:08:20 +0100,
Mark Brown wrote:
> 
> The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:
> 
>   Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6
> 
> for you to fetch changes up to ed92bc5264c4357d4fca292c769ea9967cd3d3b6:
> 
>   ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe() (2025-03-11 13:51:52 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> The bulk of this is driver specific fixes, mostly unremarkable.  There's
> also one core fix from Charles, fixing up confusion around the limiting
> of maximum control values.
> 
> ----------------------------------------------------------------
> Alexey Klimov (1):
>       ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
> 
> Bard Liao (2):
>       ASoC: rt1320: set wake_capable = 0 explicitly
>       ASoC: rt722-sdca: add missing readable registers
> 
> Charles Keepax (2):
>       ASoC: ops: Consistently treat platform_max as control value
>       ASoC: cs42l43: Fix maximum ADC Volume
> 
> Christophe JAILLET (1):
>       ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()
> 
> Maciej Strozek (1):
>       ASoC: cs42l43: Add jack delay debounce after suspend

This one causes a build error without CONFIG_PM.


Takashi
