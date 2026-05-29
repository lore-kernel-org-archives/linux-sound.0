Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4663DDDD4
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063499; cv=none; b=bz3AzKh6Q1JzbQ9vt9DIxVZ9obugLbbGwzoe1F0UKjwxxUAOohthQDxf5Ol3H0ZgHHZyB5WmGhTr/qv3BGRvH264pcCy1kg8awgJDzkeT/kyeh6XWMV/LCmouHFUeOClLHI0lT8Hz+RWpbjkRs54JCAutj8PZhrxfiV1QIpp3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063499; c=relaxed/simple;
	bh=ssdk4TllqrUyQ9iw/EhrLrRpYTqEOcBzNmEBr+yHLqM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EGG9A7AqBYpNzgDQoRgajV5kAmsvxYG6MNNCBdyWDQwv3kdg10Q5BOEsUs87cEOaEaYMIrKFp0c25KBxpnAg8+LeabrFCq/DjS/fNzZyqxtscOrZoxHVHW8M+sP1wtwe78w7DMiBCtN5njeY9RrWsLqBNMXOPHqQdNpMUNPs4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W10l1mO4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OC88svKk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z3PjI4iD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d+Qqm2Or; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W10l1mO4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OC88svKk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z3PjI4iD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d+Qqm2Or"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E61306AD49;
	Fri, 29 May 2026 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780063495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ynohfOhiCGgB7gP2Vr3jlZz5yvfdJjwr6zoGdetjqQ=;
	b=W10l1mO4fLYrypiKG59ZsiXLLHY9tFS4rsvd0ZbndNOMY7p4EjDOI29B6KYSwUMAyJfKab
	XPPKx4SN1ZQ+7OnVWxrSG/Mx6rXU6+ZdScuWz4lPghRmi7fUc8C3SW2oVLywX/81GmHMPz
	BTVFM2Jkv5A4JKToMktEKaTRjgR5F/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780063495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ynohfOhiCGgB7gP2Vr3jlZz5yvfdJjwr6zoGdetjqQ=;
	b=OC88svKkBYC2Ba3D2IB00IhdxZiQryh0jr5RRPsIa/XTyFtm65ZQa2cEZSR1BYCVej/SD7
	TVMRz2ZgmacmBhAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z3PjI4iD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d+Qqm2Or
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780063494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ynohfOhiCGgB7gP2Vr3jlZz5yvfdJjwr6zoGdetjqQ=;
	b=z3PjI4iDSnvWOyHo75ieL27CVNhmenv4xeSkGIlKmfVeYQsIfsiR5JKZE3B5etolaMjO+n
	2qjEv+hHSGWTsUXIoCUmv6QNSfbuaqgcZa5VpBztMVF0tmur3ZN9DpTXYY61mLU5wvYtHS
	+9STtuklsmHc0hGn0ZP3jCNLZC57toU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780063494;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ynohfOhiCGgB7gP2Vr3jlZz5yvfdJjwr6zoGdetjqQ=;
	b=d+Qqm2OrMCOOJf0VdYBXDk3RDwQK3YW6Ah9cFlAaTQxHX3OQZBDZtPG6x+Z8cGrzJp3Iyk
	PmzbydVPDqszeEAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC55B779A7;
	Fri, 29 May 2026 14:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C1bDKAadGWpGaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 May 2026 14:04:54 +0000
Date: Fri, 29 May 2026 16:04:54 +0200
Message-ID: <878q92qpkp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: lijun <lijun01@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: loongson: Fix invalid position error in ls_pcm_pointer
In-Reply-To: <55194c42-91ac-43cc-9891-86604fb2618d@kylinos.cn>
References: <20260529024830.3078886-1-lijun01@kylinos.cn>
	<87zf1ir3me.wl-tiwai@suse.de>
	<55194c42-91ac-43cc-9891-86604fb2618d@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E61306AD49
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 29 May 2026 15:23:18 +0200,
lijun wrote:
> 
> When the addr is abnormal, such as when the DMA controller is abnormal,
> I think x=0 should not be a point, but a range, which includes the addr
> address being less than runtime ->dma1-adr, and the addr exceeding
> the DMA address range.

The question is how often it happens.  If this happens frequently,
reporting a position jump just confuses user-space.
If it's an abnormal situation, one can treat it rather like an XRUN
and let stop the stream / restart, too.


Takashi

> 
> 在 2026/5/29 17:01, Takashi Iwai 写道:
> > On Fri, 29 May 2026 04:48:30 +0200,
> > Li Jun wrote:
> >> The "invalid position" error occurred when the DMA position descriptor
> >> returned an invalid address value (e.g., pos = -1048838144). This happened
> >> because the `bytes_to_frames()` function returns a signed value, but when
> >> `addr < runtime->dma_addr`, the subtraction produces a negative result that
> >> gets interpreted as a large unsigned integer in comparisons.
> >> 
> >> [   32.834431][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> [   32.845019][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> [   32.855588][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> [   32.866145][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> [   32.995394][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> [   33.006025][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> [   33.016748][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> >> 
> >> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> > Since it's a change for ASoC, use "ASoC" prefix for the subject line.
> > 
> > About the code change: how does this negative position come?  Is it an
> > utterly bogus value to be ignored, or is it a position overlap or
> > such?  Your change seems just ignoring and returning 0, and if it's a
> > spontaneous bogus value, it may lead to an unexpected jump of the PCM
> > position, too, for example.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> >> ---
> >>   sound/soc/loongson/loongson_dma.c | 10 ++++++++--
> >>   1 file changed, 8 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
> >> index a149b643175c..f0a7065ddae7 100644
> >> --- a/sound/soc/loongson/loongson_dma.c
> >> +++ b/sound/soc/loongson/loongson_dma.c
> >> @@ -207,9 +207,15 @@ loongson_pcm_pointer(struct snd_soc_component *component,
> >>   	desc = dma_desc_save(prtd);
> >>   	addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
> >>   -	x = bytes_to_frames(runtime, addr - runtime->dma_addr);
> >> -	if (x == runtime->buffer_size)
> >> +	if (addr < runtime->dma_addr ||
> >> +	    addr >= runtime->dma_addr + runtime->dma_bytes) {
> >>   		x = 0;
> >> +	} else {
> >> +		x = bytes_to_frames(runtime, addr - runtime->dma_addr);
> >> +		if (x >= runtime->buffer_size)
> >> +			x = 0;
> >> +	}
> >> +
> >>   	return x;
> >>   }
> >>   
> >> -- 
> >> 2.25.1
> >> 
