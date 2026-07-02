Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B63537FB
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977065; cv=none; b=HUuiF/4ArzVv9HeQeyP9UgngBz7J+BsXCkMyQhHaRo0kdhsy9iUCxV4xfzvBNAtPvnWtsyKGYKbK6x0fqnN20Z0KwAhmwDnXy/xnM0z59Pkxp1bOnj/sTwPjyCK5Yx0hgB1jEXG6gxz7BBjGRT/F9bUr+Upimb72S2GAwsaKAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977065; c=relaxed/simple;
	bh=C5EJalEpbTq1zTjP+eG4qO5ubes8G4WpRpQ2w/xUEIw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k4AjuyE4cILml7ahEu5UstZgy2sHZeWJUEdYGyLJoSbiOcqKcpzTylstaOpJRP7VtJuiTbfdp/sNUox99pWKLYCn/uSVdx+7tFL9OMF+3YBL8vSBM3z9MfCtBpFoQWGBCsasGrSqy1QvXylLo4gCabW54lC8N0Nhab1P8hasngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XRfI7mSk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MGsBop/W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XRfI7mSk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MGsBop/W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XRfI7mSk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MGsBop/W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XRfI7mSk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MGsBop/W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AFB8F727B2;
	Thu,  2 Jul 2026 07:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782977062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wJUEQArF+jgD03zH7p0kcxjju9aThl4S1v4j2Q2QR+I=;
	b=XRfI7mSkkU2XyMb3tohzG1OyfLDCvzma9ZHWrYapMzOOcGsLnnqlpr3XRUkib+fnlew89W
	t/0GRA+bRVjbmpWiYHIpTgTrxmVB3BRtGusWua7USJLoZ5UbAuD/bzQ8TzsT7kSMhTKK1f
	WYbIds68XI1aapz44chMBnyJLLgKAbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782977062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wJUEQArF+jgD03zH7p0kcxjju9aThl4S1v4j2Q2QR+I=;
	b=MGsBop/WIQzdNAwTr+1dRzzxVi+lQZvT0kRJcEaRlERJOkpTqfwVpH01eRpqnqnucoGJ9d
	AUta/5T8qEWQjJAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XRfI7mSk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="MGsBop/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782977062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wJUEQArF+jgD03zH7p0kcxjju9aThl4S1v4j2Q2QR+I=;
	b=XRfI7mSkkU2XyMb3tohzG1OyfLDCvzma9ZHWrYapMzOOcGsLnnqlpr3XRUkib+fnlew89W
	t/0GRA+bRVjbmpWiYHIpTgTrxmVB3BRtGusWua7USJLoZ5UbAuD/bzQ8TzsT7kSMhTKK1f
	WYbIds68XI1aapz44chMBnyJLLgKAbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782977062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wJUEQArF+jgD03zH7p0kcxjju9aThl4S1v4j2Q2QR+I=;
	b=MGsBop/WIQzdNAwTr+1dRzzxVi+lQZvT0kRJcEaRlERJOkpTqfwVpH01eRpqnqnucoGJ9d
	AUta/5T8qEWQjJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57C38779AA;
	Thu,  2 Jul 2026 07:24:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KDgYFCYSRmqCewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Jul 2026 07:24:22 +0000
Date: Thu, 02 Jul 2026 09:24:22 +0200
Message-ID: <87echlam6x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Mehul Rao <mehulrao@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	eilaimemedsnaimel@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Drop reduntant nonseekable_open() return check
In-Reply-To: <20260702035704.27092-1-phucduc.bui@gmail.com>
References: <20260702035704.27092-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AFB8F727B2
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,linutronix.de,renesas.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Thu, 02 Jul 2026 05:57:04 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> nonseekable_open() always returns 0, so the error check is unnecessary.
> Remove the dead error handling path.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/core/pcm_native.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 7dc0060617f1..b245b596d95a 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2874,8 +2874,7 @@ static int snd_pcm_playback_open(struct inode *inode, struct file *file)
>  {
>  	struct snd_pcm *pcm;
>  	int err = nonseekable_open(inode, file);
> -	if (err < 0)
> -		return err;
> +

We don't have to assign err here, right?
Keeping it looks rather confusing.

>  	pcm = snd_lookup_minor_data(iminor(inode),
>  				    SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
>  	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
> @@ -2888,8 +2887,7 @@ static int snd_pcm_capture_open(struct inode *inode, struct file *file)
>  {
>  	struct snd_pcm *pcm;
>  	int err = nonseekable_open(inode, file);
> -	if (err < 0)
> -		return err;
> +

Ditto.

I see a similar pattern in your other patches.  Please try to address
it and resubmit -- at best, as a v2 series of patches.


thanks,

Takashi
