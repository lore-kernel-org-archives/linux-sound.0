Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A9241695
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794925; cv=none; b=TOeFvgjJwZi1CSYfja0N2kaC5XBGmbRj3qDxfm5EmvOhu1FsCi0BeBsaF16WblGBw4WDcKtQgkQ1NUITU48V6tNEV9bFXvS/0FWFtuoxddg+V8acNFGYOXs3YNTAYsfim+2ws691IqI+maO6jBrr4CCRNhDoG1ikH6WdvqSDg7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794925; c=relaxed/simple;
	bh=vTV07EKv89l07R8Qd30yloK/C0ASiY4K9YK6AkQR/kw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxoEOIpeS4D7jcKOJsweSJQ4s3AAQ67acW80fFRWX6uch4G/fJITw8iXwLpHMb7PECDZ+6QIkHrOOE/XoaK3LTPUnWNI+13e8nfUv25cMHMdoayYygbi39n3iIH0eo5y0rzSItSZolxqYKF/BgHuTXGx//6m8R9M1yxvZ137zh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BsapF1l5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y6isLC0H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BsapF1l5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y6isLC0H; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BsapF1l5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y6isLC0H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BsapF1l5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y6isLC0H"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2A0E21195;
	Wed, 12 Mar 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741794921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yUitq4WPpDndN3ZMGMlsz/jpIyNCsJDFtY002v4YvYY=;
	b=BsapF1l5VuqQBXP6HgHx2psW6UDSv8cABFq9aL9TRmlR9znu38u1LYpHDz7wB08HmznDVA
	I2CEVAs7FyBpRyL7jIdOc1+1VIZkhMEBaa49Rqkok071am2/OqQMXZWXuBCz1qNd5ofj2e
	eTrZEJ5DMq5y3cbpF53DA6AGJ9mierE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741794921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yUitq4WPpDndN3ZMGMlsz/jpIyNCsJDFtY002v4YvYY=;
	b=y6isLC0HO9ymPwm5tuLdgE0imDR3dixL3YWWT9Y+iUkkUcgOK+368Dk5rCxItL9oBP7d+i
	YaZtneaG3LQkdRCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BsapF1l5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y6isLC0H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741794921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yUitq4WPpDndN3ZMGMlsz/jpIyNCsJDFtY002v4YvYY=;
	b=BsapF1l5VuqQBXP6HgHx2psW6UDSv8cABFq9aL9TRmlR9znu38u1LYpHDz7wB08HmznDVA
	I2CEVAs7FyBpRyL7jIdOc1+1VIZkhMEBaa49Rqkok071am2/OqQMXZWXuBCz1qNd5ofj2e
	eTrZEJ5DMq5y3cbpF53DA6AGJ9mierE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741794921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yUitq4WPpDndN3ZMGMlsz/jpIyNCsJDFtY002v4YvYY=;
	b=y6isLC0HO9ymPwm5tuLdgE0imDR3dixL3YWWT9Y+iUkkUcgOK+368Dk5rCxItL9oBP7d+i
	YaZtneaG3LQkdRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71A9A1377F;
	Wed, 12 Mar 2025 15:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FlBZGmmu0WfcFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 15:55:21 +0000
Date: Wed, 12 Mar 2025 16:55:21 +0100
Message-ID: <87y0xaxmza.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Maciej Strozek
	<mstrozek@opensource.cirrus.com>,
	<patches@opensource.cirrus.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
In-Reply-To: <Z9GsxY9xMUFGRB/x@opensource.cirrus.com>
References: <20250312145642.26646-1-tiwai@suse.de>
	<Z9GsxY9xMUFGRB/x@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A2A0E21195
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 12 Mar 2025 16:48:21 +0100,
Charles Keepax wrote:
> 
> On Wed, Mar 12, 2025 at 03:56:39PM +0100, Takashi Iwai wrote:
> > Put __maybe_unused to work around the build error without CONFIG_PM
> > or CONFIG_PM_SLEEP for the newly defined system suspend callback.
> > 
> > Fixes: 164b7dd4546b ("ASoC: cs42l43: Add jack delay debounce after suspend")
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/soc/codecs/cs42l43.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> > index d307b56a7f38..4c7a598f5e73 100644
> > --- a/sound/soc/codecs/cs42l43.c
> > +++ b/sound/soc/codecs/cs42l43.c
> > @@ -2402,7 +2402,7 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
> >  	return 0;
> >  }
> >  
> > -static int cs42l43_codec_runtime_force_suspend(struct device *dev)
> > +static int __maybe_unused cs42l43_codec_runtime_force_suspend(struct device *dev)
> >  {
> >  	struct cs42l43_codec *priv = dev_get_drvdata(dev);
> 
> I believe this should already be fixed by this patch:
> 
> https://patch.msgid.link/20250305172738.3437513-1-arnd@kernel.org
> 
> Which is probably a better fix as well.

Ah that's the one I looked for.  Yes, SYSTEM_SLEEP_PM_OPS() is a
better choice.


thanks,

Takashi
