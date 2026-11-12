Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489702;
	b=lWf0zEmJK50tOXG2HuxYOWGyxKcCXqJj2SxHkKMEHa/ZOrzc1XAEndwx32qMHHmUh1ev
	 ryFdwxs2loLzvD6JYaWaxD39NZ22yn+8xOYQKuCJmk61NpPQ4XL/wIDV4gRcaA8VxjiCE
	 KGzDk6OX//A8k05lnrMt3gqN77vYwwfs2Orww+1iRGvcKbyRDId2AVKjlkBTuj2rTXKju
	 HdOLMBpEBEUZrpnIjZR3PfAlbpqXZt7msCQFrqoJUnVXGQOIfaboWgg9wfAtWAufeJXxW
	 zSc2jiYRNFb1bxw2Q+/1zuPIPulUEgG2TvEkhVrL3VzZreUT8/VhrBelkUK3gZWdNhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489702;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=hF6KajYzkNTN7KU58eJq4EuxOhi3VUkjCw2Jiifq/D0=;
	b=AjcJ3pfmMv23fqWY0bkvVOUQHiQGBJssffR0mBDVpXxmewi7QIxEavX1Xb8ZboAa+ySm
	 4z7TL6h6g57z11xo1wj0OcCMCAH36rK3G4xiB5HIO2xbG0/xY0F06/q58OSyEcb5/Rhda
	 dBZ+Cm5y/TmnlkVtcZZm3sDQkQKMMe1Q+SZDVhH0nuLavw/cemBltQ9W/AlmVSqC1hrar
	 zF2wLdgsXX+ytGJ35xHv2amx0E8TEluGX8JO9I+trgOMzh9KFpfB5lGYDhBxEqVpRgSVx
	 7eoDp+hfkWlaVIYIy2nhj4HBS1lDvshYeRwLPRHo/OqQhoh0h0IW9FQpBMH+11mVQpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HAVn6PqZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kHBjMkA5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HAVn6PqZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kHBjMkA5;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A59606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HAVn6PqZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kHBjMkA5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HAVn6PqZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kHBjMkA5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 50C431F7F9
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794489700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hF6KajYzkNTN7KU58eJq4EuxOhi3VUkjCw2Jiifq/D0=;
	b=HAVn6PqZZK9yNPsI7KPHI6Tok5cQ484UDBJ9Jd9G0ZARg3H288ExaEoy38qEcRG2DamQnx
	KMjyaX6WGnbofjgfmrFFSCm4I20yzELYB6jDixmnBJ/ODufhaI2dl/ahPQrx6Pc/fEpsVZ
	lA/oS4+QUWl7CYEL9JwcPKtYOdBfHtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794489700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hF6KajYzkNTN7KU58eJq4EuxOhi3VUkjCw2Jiifq/D0=;
	b=kHBjMkA5e7RrYLXHZ26Sm3M0PentaHeW3ZNzCKiWOP70OjI5PX7NmHwIQUaTQMk+OGsjRd
	dOFVlE8slfFSENDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HAVn6PqZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kHBjMkA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794489700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hF6KajYzkNTN7KU58eJq4EuxOhi3VUkjCw2Jiifq/D0=;
	b=HAVn6PqZZK9yNPsI7KPHI6Tok5cQ484UDBJ9Jd9G0ZARg3H288ExaEoy38qEcRG2DamQnx
	KMjyaX6WGnbofjgfmrFFSCm4I20yzELYB6jDixmnBJ/ODufhaI2dl/ahPQrx6Pc/fEpsVZ
	lA/oS4+QUWl7CYEL9JwcPKtYOdBfHtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794489700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hF6KajYzkNTN7KU58eJq4EuxOhi3VUkjCw2Jiifq/D0=;
	b=kHBjMkA5e7RrYLXHZ26Sm3M0PentaHeW3ZNzCKiWOP70OjI5PX7NmHwIQUaTQMk+OGsjRd
	dOFVlE8slfFSENDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 140EB134A0
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:21:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PV7fNmO99Wo+ewAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:21:40 +0000
Date: Thu, 12 Nov 2026 14:21:39 +0100
Message-ID: <87fqx6rxr0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: oss: Compare max buffer size in bytes
In-Reply-To: <sashiko-outbox-211111@kernel.org>
References: <20261112123430.684056-1-tiwai@suse.de>
	<sashiko-outbox-211111@kernel.org>
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
X-Rspamd-Queue-Id: 50C431F7F9
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Thu, 12 Nov 2026 13:49:21 +0100,
sashiko-bot@kernel.org wrote:
> 
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ALSA: oss: array3_size() overflow hits snd_BUG_ON() in
>   snd_pcm_plugin_alloc()
> --
> 
> commit 97a1260d8f9d7c584f3610ce297a74916707f416
> Author: Takashi Iwai <tiwai@suse.de>
> 
> ALSA: pcm: oss: Compare max buffer size in bytes
> 
> This commit moves the 1MB upper-limit check in snd_pcm_plugin_alloc()
> to after the bit-to-byte division so the limit is enforced in bytes
> rather than bits.
> 
> > diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
> > index 3de7137799936..c5b3c67345eeb 100644
> > --- a/sound/core/oss/pcm_plugin.c
> > +++ b/sound/core/oss/pcm_plugin.c
> > @@ -48,12 +48,12 @@ static int snd_pcm_plugin_alloc(struct snd_pcm_plugin *plugin, snd_pcm_uframes_t
> >  	if (width < 0)
> >  		return width;
> >  	size = array3_size(frames, format->channels, width);
> > -	/* check for too large period size once again */
> > -	if (size > 1024 * 1024)
> > -		return -ENOMEM;
> >  	if (snd_BUG_ON(size % 8))
> >  		return -ENXIO;
> >  	size /= 8;
> > +	/* check for too large period size once again */
> > +	if (size > 1024 * 1024)
> > +		return -ENOMEM;
> 
> [Severity: Medium]
> Can a multiplication overflow in array3_size() now trigger snd_BUG_ON()?
> When array3_size() overflows, it saturates to SIZE_MAX, where SIZE_MAX % 8
> is 7.  With the size > 1024 * 1024 check moved past snd_BUG_ON(size % 8),
> a saturated size hits the WARN_ON() in snd_BUG_ON() when CONFIG_SND_DEBUG
> is enabled and returns -ENXIO instead of -ENOMEM.

It's is no practical problem: the size % 8 check is only a sanity
check and this must not be triggered at all.  If it's triggered, it's
a real problem we should catch.

The calculated size can't overflow the integer size, either, because
the passed frame size must have been already limited to the driver's
max buffer size.


Takashi
