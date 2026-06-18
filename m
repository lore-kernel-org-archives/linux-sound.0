Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15A310763
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778896; cv=none; b=FlXtlc3qRfwwqjSinqEvCMkYYzWdZoQJj7Ub+eHOV8EzeGHFIwufsveAPeHF2JlV8KznJcyeOMhzxiBVQ0mUCDcYn0a/ncsPSgmkM137twNUGLdnA8H1GyKoREdVVhwwfrKRLhTYkL3ymZpeITRHy3bAZVpzggFMdEeXyoP6es4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778896; c=relaxed/simple;
	bh=iT8oOx38kcb7l28FVbzWDflIjsmokMy3M/Ett7rG7DU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RASo+qLJboQqF+5MfYC30l9l9UHNhNyYytQXYNpvVogdwroUlZce0V6vgtNPu17Qi+scg1+h8/wSHPq547tgdcm0ZjI+p+S83CWHKxvFlVLnXVDBg+eqvaqFDC1vVCdbBw3uTEvntTSt+ODgVqu+3oYEwAagihO505A3oGNaW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dO+7vRHZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lNKyBzIc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M7FyIGqS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lnO5wXEN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dO+7vRHZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lNKyBzIc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M7FyIGqS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lnO5wXEN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D735E6D205;
	Thu, 18 Jun 2026 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781778894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pOlrTzU9U/JfBXkDKGOgZubO0xBqj5DGB6NHebMurVM=;
	b=dO+7vRHZjTEKAAHjMRXuO24vUac9zzEV6x6wyeBcsdyepBOePVxZNTZA3fx1CALeuV6cMv
	+ZNvuVuL3jlZUL4UsKgsyrNhCcp9ZUXzl8TprjmDWZfIWp36SaZI5N/tNwktd07hAe2rJX
	x2ktrcupae2GE+8vpqNH8MAeZ2RpQf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781778894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pOlrTzU9U/JfBXkDKGOgZubO0xBqj5DGB6NHebMurVM=;
	b=lNKyBzIcpPUsPnK6Lm/PaUYV+qallwlY7FuWCg6ylUtHIuVViTDsiEFfaalOy69B+Mgtri
	0DNaAaSWyJoXrKDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781778893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pOlrTzU9U/JfBXkDKGOgZubO0xBqj5DGB6NHebMurVM=;
	b=M7FyIGqSgsuxH0IOR/3cIyviWC/lYxdfxEvrvkd7lc261+bvVqLKd47rhe+p/X9rhrjrnY
	a6dWivw6BwibVlcWmjhIYoMmpR6+h9xQOiVKwKHvBXhZFgdzDEZF3KhiPLV0R+07L1qduh
	s51y1dtdVOZVKI8OmIfxMEx1PVKmRdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781778893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pOlrTzU9U/JfBXkDKGOgZubO0xBqj5DGB6NHebMurVM=;
	b=lnO5wXENvUxOY/YHI9BZXeYW2+VP6ApYID6gWEydsDD9qLcuINTBpUTTU3OrqbLTCa9gDv
	1VCVuOMje3+NTZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5E09779A8;
	Thu, 18 Jun 2026 10:34:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BAM6J83JM2r0LwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 10:34:53 +0000
Date: Thu, 18 Jun 2026 12:34:53 +0200
Message-ID: <87eci4nnle.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: pcm: fix __le32 cast warning in snd_pcm_set_sync_per_card
In-Reply-To: <20260617102943.893950-1-ben.dooks@codethink.co.uk>
References: <20260617102943.893950-1-ben.dooks@codethink.co.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[codethink.co.uk:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, 17 Jun 2026 12:29:43 +0200,
Ben Dooks wrote:
> 
> In snd_pcm_set_sync_per_card() the le32 value is written to an u32
> instead of an __le32 pointer. Fix the following warning by fixing
> the type:
> 
> sound/soc/soc-pcm.c:2166:9: warning: incorrect type in argument 7 (different base types)
> sound/soc/soc-pcm.c:2166:9:    expected int
> sound/soc/soc-pcm.c:2166:9:    got restricted snd_pcm_format_t
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied now (with the correction of the subject prefix -- it's ALSA
core, not ASoC-specific).


thanks,

Takashi
