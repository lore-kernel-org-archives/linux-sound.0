Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECA34753B
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785052447; cv=none; b=fi1ekACMKJDdAU6dQBLbuoCPZCBtEoxo0n5IRcE0WeX/6MjBoTlFinp+Bm0BJU9qjW+J3Qc+uTQz5yC0veLnmG9/pPm2xTSgMvPz9o2pEHdqgdm8CfjRFKp1HjIx4E0InWMl4yymIP0OsIKangfmONHioO3cD9MTmhCge1rSZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785052447; c=relaxed/simple;
	bh=9jE3erIb14OiiFoM9Hr8SmGHEP4XD5YKjOJXpmg35fU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mX9JpVpXljykHYPkNLBUopQ7ct5nAEbr3WiPKigmyJYb0HNsiWVFtdBiySamNAA4uNC25TJiLUUHLkp6NcZ2rS7O8ViO+nMzkhAB3Gg4y6xhcbhRIeNEBsMD5GoqaWTDFaKDj7Uv2N79yDWAMN8PzRbiXgq5HIhQ7TqZFk3aA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=miKoUijF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o0JZ5uts; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=toNxEKo7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VunJ1zpP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="miKoUijF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o0JZ5uts";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="toNxEKo7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VunJ1zpP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DAEFA4F61;
	Sun, 26 Jul 2026 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785052444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9xFRflfhQJSxtKfo/LxhCwvUV+rwG87rVlPwk2lBGE=;
	b=miKoUijFDRhzKBAMDHVZEttpJFECU1t+31tBGT95TkzIXkJXJX2DKo3b/x3WdDGHByqY99
	RRB9hIQ+7yiJCGDuxYT2zKzyU39PGHfq7JLJUfuGAmO8QbUzu8X+cpYxx/2k7YNDNBJKzz
	K4inCaAq3abRPmUC1barhvor1QfthL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785052444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9xFRflfhQJSxtKfo/LxhCwvUV+rwG87rVlPwk2lBGE=;
	b=o0JZ5utsTVDzhrxX8k3dhNNnoPaHh+R6WELmfOPxMcvtCmar9FmyJBHswK5pikm+2ps626
	td0aHBJO3vtsd0Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=toNxEKo7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VunJ1zpP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785052443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9xFRflfhQJSxtKfo/LxhCwvUV+rwG87rVlPwk2lBGE=;
	b=toNxEKo7SdLPkrYgLt0rlK/P87cpR3ci9hJRUbcsMySXB64agch6vqMDuxI0cmqqvW+EjF
	RfSTrpXvmLinHwiMK/8xlBUjvbuv4encAVeL6NVN/kBloH1UnWuwdhhyfNMN9Kr5M1ir+v
	BIjGvUbcIbAPZRP7lBC3IQ7mQHFpFy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785052443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9xFRflfhQJSxtKfo/LxhCwvUV+rwG87rVlPwk2lBGE=;
	b=VunJ1zpPoGYQgHI7qLVVfSWeoxo4JkXmt9CJ+2rKESTcA2C4g9L2AzQdo2PjQqP3jUvg93
	qNnMZAk9qFnnBqCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A953A779B9;
	Sun, 26 Jul 2026 07:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k69AJxu9ZWrGLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 07:54:03 +0000
Date: Sun, 26 Jul 2026 09:54:03 +0200
Message-ID: <87y0ey9of8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gunal S <gunal2002@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Infinix INBOOK X3 Slim
In-Reply-To: <20260725140241.28524-1-gunal2002@gmail.com>
References: <20260725140241.28524-1-gunal2002@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DAEFA4F61
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sat, 25 Jul 2026 16:02:18 +0200,
Gunal S wrote:
> 
> The Infinix INBOOK X3 Slim (ALC269VB, subsystem 0x2782:0250) has its
> internal speakers wired to pin 0x1b, but the BIOS pin configuration
> table declares 0x1b as "no physical connection" (0x411111f0). It instead
> declares pin 0x14 as the internal speaker, although nothing is connected
> to 0x14.
> 
> As a result the internal speakers are silent under Linux while the
> headphone jack works correctly. The codec output path to 0x14 is fully
> open (DAC assigned and streaming, mixer and pin unmuted, EAPD asserted),
> so the failure is silent with no error reported. The speakers work under
> Windows, where the vendor driver supplies its own pin table.
> 
> Add a fixup that disables the unconnected pin 0x14 and declares pin
> 0x1b as the internal speaker.
> 
> Reusing the existing ALC269VC_FIXUP_INFINIX_Y4_MAX was tried first, since
> it also remaps 0x1b to an internal speaker. It is not sufficient here: it
> leaves 0x14 declared, so autoconfig finds two line_outs
> 
>   line_outs=2 (0x14/0x1b/0x0/0x0/0x0) type:speaker
> 
> and binds the primary "Speaker" control to the unconnected pin 0x14 while
> demoting the working speaker at 0x1b to "Bass Speaker". Audio is audible
> that way, but the volume and mute controls a desktop actually uses end up
> attached to a pin that is not wired to anything. Disabling 0x14 is what
> produces a single correct Speaker output.
> 
> Verified on the affected machine: with the corrected pin
> configuration the driver's autoconfig reports
> 
>   line_outs=1 (0x1b/0x0/0x0/0x0/0x0) type:speaker
> 
> both channels play, headphone auto-mute switches correctly in both
> directions, and audio survives codec runtime suspend (D3) and resume.
> 
> Signed-off-by: Gunal S <gunal2002@gmail.com>

Could you use a full name for Signed-off-by (and From) line?
Signed-off-by is a legal requirement, and we prefer a full real name
shown there.


thanks,

Takashi
