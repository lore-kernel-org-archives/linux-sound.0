Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D98042A79B
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435426; cv=none; b=NS2Zq+YiohhfHJuD61d6s02xcCQnmIY503Fp8oYRwxxoZnQ/6ZLEVv33MQ5OFyPve/vn/c0Uma3bj3QzcHywYLw9eOtwz18EooKaiCSnNTrD2l8k7lJawHJYcDXQahQ1X0ESK6HyT1FnGkY6AlQStjFAhvme2VvtU+ioKLr8mqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435426; c=relaxed/simple;
	bh=0NNsygKXueQa5ECWnWHZHhr2tQdfI9ChOwVV6rZ2tAM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmfoQL1ju3bQHBdpb+THLd3dv4cEope/MaIVutu+hT+W/Gv5BwouXgLM7LgkXTZupAq+R1xO4YLiFYKXgk8VSEH645TqMvEk0xpwrzzlzkzfuZp/li1rvi6d7d85PGaGLb/hIj0J0xImgwQ7euxmEAI6xCJqtn6hlAQKxcjqP60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gjBiOcx2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XGl68UcP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gjBiOcx2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XGl68UcP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gjBiOcx2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XGl68UcP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gjBiOcx2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XGl68UcP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FAA775C39;
	Tue,  7 Jul 2026 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783435423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ATeQkCeEtQldH2TorX7CQ5luW+nqyeFDDu2TbIQm1ds=;
	b=gjBiOcx2uHNA0LIMFU++wqauKE9791vP7UW+p//SeNWPg09ZMPRN1x5VlxVBEyutBSbPie
	B8/Tn8RIVln0UK51UmW1jVv+AR1nh9ZKo9hYYd+wwnw/F+kOcvG4SPuVQZEdGr5ctMhAL2
	7v5kzYXuglwlfcJYHkgFwVJq1L/P9HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783435423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ATeQkCeEtQldH2TorX7CQ5luW+nqyeFDDu2TbIQm1ds=;
	b=XGl68UcP2QFZQNw3XAhwVyAEgF76fSjU9kgHouJhfOPgeTHe30JqvOt4/PE5iM5UxK/aLX
	IuS9nzBSZC5tCXDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gjBiOcx2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XGl68UcP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783435423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ATeQkCeEtQldH2TorX7CQ5luW+nqyeFDDu2TbIQm1ds=;
	b=gjBiOcx2uHNA0LIMFU++wqauKE9791vP7UW+p//SeNWPg09ZMPRN1x5VlxVBEyutBSbPie
	B8/Tn8RIVln0UK51UmW1jVv+AR1nh9ZKo9hYYd+wwnw/F+kOcvG4SPuVQZEdGr5ctMhAL2
	7v5kzYXuglwlfcJYHkgFwVJq1L/P9HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783435423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ATeQkCeEtQldH2TorX7CQ5luW+nqyeFDDu2TbIQm1ds=;
	b=XGl68UcP2QFZQNw3XAhwVyAEgF76fSjU9kgHouJhfOPgeTHe30JqvOt4/PE5iM5UxK/aLX
	IuS9nzBSZC5tCXDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41841779AE;
	Tue,  7 Jul 2026 14:43:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SeFmD58QTWoCeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jul 2026 14:43:43 +0000
Date: Tue, 07 Jul 2026 16:43:43 +0200
Message-ID: <87tsqa6esg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: preserve snd_card_file_add() error code in snd_ctl_open()
In-Reply-To: <20260707090958.794852-1-phucduc.bui@gmail.com>
References: <20260707090958.794852-1-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,kernel.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5FAA775C39
X-Spam-Score: -2.01

On Tue, 07 Jul 2026 11:09:58 +0200,
phucduc.bui@gmail.com wrote:
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_ctl_open() unconditionally overwrites the return value of
> snd_card_file_add() with -ENODEV on failure, discarding the actual
> error code.
> This also preserves the original error code returned by
> snd_card_file_add() (e.g. -ENOMEM or -ENODEV), instead of
> unconditionally overwriting it with -ENODEV.
> No functional change other than the returned error code in this
> failure path.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/core/control.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 0ca9fff56e51..f64b2dec746a 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -64,7 +64,6 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
>  	}
>  	err = snd_card_file_add(card, file);
>  	if (err < 0) {
> -		err = -ENODEV;
>  		goto __error1;
>  	}

Please drop superfluous braces, too, as it becomes a single-line now.


thanks,

Takashi
