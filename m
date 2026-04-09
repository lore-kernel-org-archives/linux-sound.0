Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4F332610
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716248; cv=none; b=pwkIzxjVFt7rpYoA1P15VQwxvuC6BlUh8W1HywzA7X+hslnsHCO6t4GPLnnlPIMLqFoDApTJD3GzIpHPz3+s/MrsZ/1tHjok1bDanaMQtEYkyUD7Yu7ykjwjn5PMeCZJa3YJmAANT7TZl18WyCO38JUnvanpaD12+13gQlKmjxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716248; c=relaxed/simple;
	bh=UZvJaJ7O16T3/z2qusGdv91qftO90dLzPrz/Q8JzLfY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K06Q9ew0gC3MkSxYgpya5O0NJn9299Rojkvm9VqPqf+ChZH/84qS9l+YsmcnjNoQ4dr6rYMstg27EGk9b84V2X0S0cC1AZeGy4/cEoWENlZKhS5QdYkNH1+JzJMmXxu5ETYKEE4SSlj7B6UqRFVNeg5thrptsj9X0FzkbN/DvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GX2BW+NW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4vizpMDg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GX2BW+NW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4vizpMDg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GX2BW+NW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4vizpMDg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GX2BW+NW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4vizpMDg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BB2C55BCEB;
	Thu,  9 Apr 2026 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775716245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwoUI+QygjSAczHVxoHJknlpKK2vA6sLClcZdsFjbcI=;
	b=GX2BW+NW22Ze9PNjX7hVJ4ZiNduXIPT40XgL+1XJ7kM1xfcSJP3Buhlhvl+IN8yuWPkQq5
	WsGOZPa6XDmBRn2QByb9wBkp0v3kLvSIh9DrDpkSxNhX+UzvKLdFDLszil//BBAca9Aqcs
	u21259EGGsQO900jviwIm3AhyHOC29A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775716245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwoUI+QygjSAczHVxoHJknlpKK2vA6sLClcZdsFjbcI=;
	b=4vizpMDgjSeG0ulXKM7dAhfiamZQ4kgQcVzfQCvAZm7TPa8omCh/t1RTyEm7McBY/i7Dkx
	iu3/N+NqmVthXzDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GX2BW+NW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4vizpMDg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775716245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwoUI+QygjSAczHVxoHJknlpKK2vA6sLClcZdsFjbcI=;
	b=GX2BW+NW22Ze9PNjX7hVJ4ZiNduXIPT40XgL+1XJ7kM1xfcSJP3Buhlhvl+IN8yuWPkQq5
	WsGOZPa6XDmBRn2QByb9wBkp0v3kLvSIh9DrDpkSxNhX+UzvKLdFDLszil//BBAca9Aqcs
	u21259EGGsQO900jviwIm3AhyHOC29A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775716245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwoUI+QygjSAczHVxoHJknlpKK2vA6sLClcZdsFjbcI=;
	b=4vizpMDgjSeG0ulXKM7dAhfiamZQ4kgQcVzfQCvAZm7TPa8omCh/t1RTyEm7McBY/i7Dkx
	iu3/N+NqmVthXzDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D37D4A0B3;
	Thu,  9 Apr 2026 06:30:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PfVAIZVH12nSFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 06:30:45 +0000
Date: Thu, 09 Apr 2026 08:30:45 +0200
Message-ID: <87qzook5m2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
In-Reply-To: <87tstkk5ph.wl-tiwai@suse.de>
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
	<873414lnyf.wl-tiwai@suse.de>
	<84e98864-5858-4bb7-b62a-5b4928f2065b@kylinos.cn>
	<87tstkk5ph.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BB2C55BCEB

On Thu, 09 Apr 2026 08:28:42 +0200,
Takashi Iwai wrote:
> 
> On Thu, 09 Apr 2026 07:58:21 +0200,
> Zhang Heng wrote:
> > 
> > hda-verb /dev/snd/hwC1D0 0x14 0xB 0x40
> >  I think this command is meaningless, so it was not written.
> > hda-verb [ALC662_device] 0x01 SET_GPIO_MASK 0x03
> > hda-verb [ALC662_device] 0x01 SET_GPIO_DIRECTION 0x03
> > hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x03
> > sleep 1
> > hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x01
> > sleep 1
> > hda-verb [ALC662_device] 0x01 SET_GPIO_DATA 0x02
> > 
> > 
> > This user actually used these commands and the audio output was normal.
> > 
> > The last two commands clearly trigger the falling edge of gpio_data 0x03,
> > Referring to these commands, my patch writing should be normal.
> 
> With your code, you're writing GPIO bits 0x03 3 times at each init or
> resume call; at first in alc_auto_init_amp(), then toggling high and
> low in the fixup.  So the first write is obviously superfluous.
> 
> You should be aware of this behavior although the impact is rather
> small.

That said, I'm going to take your patch for now, but we might need to
reconsider the implementation of Realtek codec helpers about GPIO
handling.


thanks,

Takashi
