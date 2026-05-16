Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6126158B
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934286; cv=none; b=vD9kVdnh2i6JQijzQ4k/4SVm2OtCJIzmuPtGeZmU+FtOwyDRnignkd5NhnjVEllJl5iNJC+mT6DFi67a1z++gs1Mr6ABZyKPe8dskV283pDp5wT9OdHGlRlxK0ksNc5OHfpFs1804JqCQ/pU1dm6Gmh6Du//I5o05yPW1tgGKBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934286; c=relaxed/simple;
	bh=CWErFH1Hz5K/iVV80JrqHb5WRgYIX54PMeOPUmyqUJc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iq9mJpg5vYzqs9lnkzSCVK4LY7qICrRJxHr64CyAyJMtJ4X+exafsX/MrdGHfATEOuK4wIzO/2YqiQS9RyhN3J+5XTBpeTx2FEtW0mu6bypUmy6BYAALXTHTKvRsoNKpJQ3NAAHMhhwO/mGhMuK4Xw8tCrB11alB4GV57MBCVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NGcnFDCL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7azXWeLn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ptFudi5h; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qeNzBNy3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NGcnFDCL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7azXWeLn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ptFudi5h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qeNzBNy3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 615185C5C4;
	Sat, 16 May 2026 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778934283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vL4YJoYZlRv+rQ8BEqn8rpyVnGOVE7tQf6ecrdfqCJc=;
	b=NGcnFDCLo47xYOEmlNHerXpESaXFqugaG9ioPDhQuXHu5o/RlvzsZQkBVgCdoEbzUNVsKM
	X/nwvEzFjs/22fFUoAphdiVYOGXQWFmaaCUmw+8vODZLnj15LiCW8t9IYVn60PJFh1envC
	NpSoiyGuXY8juaatxZvSbsFgq2wi0ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778934283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vL4YJoYZlRv+rQ8BEqn8rpyVnGOVE7tQf6ecrdfqCJc=;
	b=7azXWeLn+vnAUB54EztQ0ItjLVdBjZCJchPXi4utPeNIw8oWst9iMXkeqDwhDxkRUYHrzG
	/edy4qwl0SLYzCDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ptFudi5h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qeNzBNy3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778934282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vL4YJoYZlRv+rQ8BEqn8rpyVnGOVE7tQf6ecrdfqCJc=;
	b=ptFudi5htWjwKvcrWcpZuACMhJq5O0WXjWHgsjZOCi9BMjPLGBg98Fisg0AdKkN/dE05JR
	hlCtmzumA3qGuPZk61XzyIpQjMrvKQUDBBVB5ttFO7vqOglS4ZZsJBzOetDRpcJ90YqI/4
	vjYLqZbV9orTTZvC/zYSbrtYr2B5fQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778934282;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vL4YJoYZlRv+rQ8BEqn8rpyVnGOVE7tQf6ecrdfqCJc=;
	b=qeNzBNy3Y/fya04SD74pnWJeeYIl4j/uv+z07UiOVCUw+rrNmOuRX0L7dMuoF5LZw78JNG
	m/zJt5VxE95H4vDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F423593A8;
	Sat, 16 May 2026 12:24:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9sc+CgpiCGrIFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 16 May 2026 12:24:42 +0000
Date: Sat, 16 May 2026 14:24:41 +0200
Message-ID: <87zf1zy22e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sav <pavone.lawyer@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sav <62543096+dongioia@users.noreply.github.com>
Subject: Re: [PATCH] ALSA: pcm_drm_eld: rate-limit ELD parsing errors
In-Reply-To: <20260515155836.58993-1-pavone.lawyer@gmail.com>
References: <MSG-ID-Takashi>
	<20260515155836.58993-1-pavone.lawyer@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[dongioia];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 615185C5C4
X-Spam-Level: 

On Fri, 15 May 2026 17:58:36 +0200,
Sav wrote:
> 
> From: Sav <62543096+dongioia@users.noreply.github.com>
> 
> snd_parse_eld() is the generic helper used by ASoC hdmi-codec, equivalent
> to the hdac_hdmi parse path Mark Brown rate-limited in
> lkml.kernel.org/lkml/2025/6/13/1380. The same spam shows up here for the
> same reason.
> 
> When a HDMI sink is not connected (for example a board with two HDMI
> outputs and a cable in only one of them), userspace audio servers like
> PipeWire keep opening the empty card. snd_parse_eld() then logs
> 
>     HDMI: Unknown ELD version 0
> 
> on every retry. On rk3588 that easily produces 30+ messages per burst.
> A malformed ELD (MNL out of range) hits the same code path. Neither is
> worth a separate dev_info() per occurrence; switch both to
> dev_info_ratelimited().
> 
> Signed-off-by: Sav <62543096+dongioia@users.noreply.github.com>

Could you use the proper name (a real name or a known identity) and
the mail address for Signed-off-by and From, and resubmit?  It's a
legal requirement for the upstreaming.


thanks,

Takashi

> ---
>  sound/core/pcm_drm_eld.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
> index cb2eebaac85f..1941ee520063 100644
> --- a/sound/core/pcm_drm_eld.c
> +++ b/sound/core/pcm_drm_eld.c
> @@ -334,7 +334,7 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
>  	e->eld_ver = GRAB_BITS(buf, 0, 3, 5);
>  	if (e->eld_ver != ELD_VER_CEA_861D &&
>  	    e->eld_ver != ELD_VER_PARTIAL) {
> -		dev_info(dev, "HDMI: Unknown ELD version %d\n", e->eld_ver);
> +		dev_info_ratelimited(dev, "HDMI: Unknown ELD version %d\n", e->eld_ver);
>  		goto out_fail;
>  	}
>  
> @@ -357,7 +357,7 @@ int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
>  	e->product_id	  = get_unaligned_le16(buf + 18);
>  
>  	if (mnl > ELD_MAX_MNL) {
> -		dev_info(dev, "HDMI: MNL is reserved value %d\n", mnl);
> +		dev_info_ratelimited(dev, "HDMI: MNL is reserved value %d\n", mnl);
>  		goto out_fail;
>  	} else if (ELD_FIXED_BYTES + mnl > size) {
>  		dev_info(dev, "HDMI: out of range MNL %d\n", mnl);
> -- 
> 2.54.0
> 
