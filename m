Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B0D3CF049
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680733; cv=none; b=AdM8GjDb+KEjEvjT1MJjNqZcfBq9BSq75DKEkmUzl1LzTBw/BmNyPwJWScCRb1PUnPKKnkw0bujg1Y17LUbgL8/xB8PzZrqgPY32uLyqypT70DysSeKTa8zK7beTCHj0cmAU8WA4cWlgaju6X0Lq0dEzRYsoAIfEFq7USSuzwm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680733; c=relaxed/simple;
	bh=tOFuCTjfbH/4wPwEra+tfISOjSlfMYsW0l8DPj5A5tI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pf81+RBKcZz2iSbyuSGcvt2ir0Fc7SQGB7/1fuo/AjJbBMtV0q9X01kHuqGSoiztwBfM7qcVv1fTxzXYr2Yz7LoUYdKCT8+8z/kYlNKo0QlBVU2U+hgDdsrVy5pdhY23xvGKALrQHjFs6I0nxi+lqt8PYuJMtEYKRd7+8h7pF9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UeY79lxi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wg0ea+fi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jVkL9XlU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XC1OxeMB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UeY79lxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wg0ea+fi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jVkL9XlU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XC1OxeMB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25F484D321;
	Mon, 16 Mar 2026 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773680730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OEoVEji5N0NzoNmZoGoJNjzgLZ7K6w75VKJJowM2YY=;
	b=UeY79lxir2jHaP68d4Oq2xTJOw1/l+XOQ41yFd/DruvBcsKnf9ASdtc7hf3AN0ylI5jN/N
	Omr6dGAI2PVXC1b+4LAYHgrURq/Bl3tt+XnlbBHHnk/vynTwa8/u0MJFqn66I26yGBtpom
	wM4Y6wCaVUVdCaWE49oRibvj/baDmM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773680730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OEoVEji5N0NzoNmZoGoJNjzgLZ7K6w75VKJJowM2YY=;
	b=wg0ea+fiHqAguVGmxm0ENPItLLPuQqk4JP0Y47h14GkDR2nW912XceUgE9cAl9m1MF0U+Y
	N7qY5f73XrOSI9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773680729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OEoVEji5N0NzoNmZoGoJNjzgLZ7K6w75VKJJowM2YY=;
	b=jVkL9XlUep8zDFroFadTcYWqM97NS4O3lSbM1s41bIplzKD3yyTUAJa2QdQd/cSbUHZMJn
	hzS5d4u8YObdQMGw8xaQ4Ij7OYCO2kKRomf3Um2I/7NwIn5Q/gR/pYmJYI3pDnMb1ff2rK
	1UGqBa82Sez+MRBDL3pC4himn/cTZlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773680729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OEoVEji5N0NzoNmZoGoJNjzgLZ7K6w75VKJJowM2YY=;
	b=XC1OxeMBL11baWNXTcfVHgEqtgB09FunbJKCtS9LF8oyx9TlzANydIrmEhnVqIBTlUw5ZS
	rQCffCcUl2kYBeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D640C4273B;
	Mon, 16 Mar 2026 17:05:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f4AhM1g4uGlRQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 17:05:28 +0000
Date: Mon, 16 Mar 2026 18:05:28 +0100
Message-ID: <87ms077lif.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Edip Hazuri <edip@medip.dev>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
In-Reply-To: <20260315201127.33744-1-sean@starlabs.systems>
References: <20260314193434.8237-1-sean@starlabs.systems>
	<20260315201127.33744-1-sean@starlabs.systems>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,perex.cz:email,starlabs.systems:email,suse.de:mid,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 15 Mar 2026 21:11:27 +0100,
Sean Rhodes wrote:
> 
> The initial StarFighter quirk fixed the runtime suspend pop by muting
> speakers in the shutup callback before power-down. Further hardware
> validation showed that the speaker path is controlled directly by LINE2
> EAPD on NID 0x1b together with GPIO2 for the external amplifier.
> 
> Replace the shutup-delay workaround with explicit sequencing of those
> controls at playback start and stop:
> - assert LINE2 EAPD and drive GPIO2 high on PREPARE
> - deassert LINE2 EAPD and drive GPIO2 low on CLEANUP
> 
> This avoids the runtime suspend pop without a sleep, and also fixes pops
> around G3 entry and display-manager start that the original workaround
> did not cover.
> 
> Fixes: 1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Kailang Yang <kailang@realtek.com>
> Cc: Chris Chiu <chris.chiu@canonical.com>
> Cc: Edip Hazuri <edip@medip.dev>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Sean Rhodes <sean@starlabs.systems>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Applied now.  Thanks.


Takashi
