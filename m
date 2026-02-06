Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2379F2DEA9D
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380929; cv=none; b=bbXuht7fKeeye5iYILFw9b1ha/3+Sz81U1WQvPasjnmj3m+0mtvKmX1wmfQ0L33iNeAJ9Ips4IEUcRW162TiRa3gAeq6NpthVCW24uDnaOc6DCfIgFHREKL2VIRCW4s6dq15RbFoNILzinsyJbf35l2hjwaFRMHyineIsYIW9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380929; c=relaxed/simple;
	bh=Vz/XN7EH0NLI+xATl8mLxaldn5EfdzqNhCz47gArzVc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvyLOslQgJgVsyEmgBEzGHyPLVslSGL2dqB4cT95EcXmotpZ7ROA6xrSkBtWiMFLbdiravkOUI4WiwgMmQFS+z4BfF9jBHZlmt76rO7DAfWi1NTDnDAaKAYbo2OSpkg8K3bCrCDuc3yAAt6G5wBYqmzhZG4XbiAnK4MkOxKfNmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M1Pfi+bN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sUORogiU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RpyN2yzc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FuZOsb6Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M1Pfi+bN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sUORogiU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RpyN2yzc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FuZOsb6Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56E375BD09;
	Fri,  6 Feb 2026 12:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770380927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5l6zh8Ni/hQTqhpj5qZo6Prsn2tzg5aqyB+IkPRm8Zg=;
	b=M1Pfi+bNOKi4CFSFRsfTMhq8RFF7mobi5BHg121ILVUgXdrec0duib53J2HF+RgVwQQYVi
	q2fZDDZa40qVJB3qvynV6sYs8MFGNEhCNo68Vc7tMiiOTXcS1v9OCOXbpDrQqPYR/1e4NU
	dlBzQJ07t0KbdRxcRKVUKHZIn5q7YSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770380927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5l6zh8Ni/hQTqhpj5qZo6Prsn2tzg5aqyB+IkPRm8Zg=;
	b=sUORogiUVHxsJ0bIg4aFKG8SFXF8g+9adendZOY/DVk5K/pgX+5KK534kKAj/KYSoNjPMh
	RDdnvkwymmPdz2Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RpyN2yzc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FuZOsb6Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770380926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5l6zh8Ni/hQTqhpj5qZo6Prsn2tzg5aqyB+IkPRm8Zg=;
	b=RpyN2yzc8z4EY2pcZQdAwkM8u/t2ZYaamF3EikRjThXgF7GaFGb88m13Din9uunExpicwU
	hJtllGGqB3BQgp3C4MBiX/QnkCaimI7ApUqx9xSFCysbsBJ7qSeHf7UR2nvpuKc0bpEwwt
	ToCJgvHX+4ccl2zu6dTpHpq4+uV26AA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770380926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5l6zh8Ni/hQTqhpj5qZo6Prsn2tzg5aqyB+IkPRm8Zg=;
	b=FuZOsb6ZXETDAH7h2Z8M5IO23M8NmKaBXWxYemlmzFefxmPZq6/Z85kCloJ9IMxThtqAcf
	ywQdQMYs28HIxqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 123F93EA63;
	Fri,  6 Feb 2026 12:28:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OAcsA37ehWndTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Feb 2026 12:28:46 +0000
Date: Fri, 06 Feb 2026 13:28:45 +0100
Message-ID: <87ms1m9htu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <20260206113250.207179-1-cezary.rojewski@intel.com>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[intel.com:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 56E375BD09
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 06 Feb 2026 12:32:50 +0100,
Cezary Rojewski wrote:
> 
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
> 
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks, it looks better now.

A few remaining concerns:

> ---
> 
> Changes in v3:
> 
> - simplified the memcmp() as suggested by Jaroslav
> - added ->access verification for SKIP_CHECK and VOLATILE as suggested
>   by Jaroslav and Takashi. For that very purpose I've deviced to use the
>   kcontrol-volatile (vd) pointer that already part of
>   snd_ctl_elem_write().
> 
> - as things are more complex now, replaced snd_ctl_put() macros with
>   functions. This aligns with suggestion previously provided by Kuninori
> 
> - reordered operations within snd_ctl_put_verify() so that it's more
>   intuitive to read, at least in my opinion:
>   get/info/put -> info/get/put
> 
> 
> Changes in v2:
> 
> A number of fixes as suggested by Mark and Takashi. The initial version
> did not account for possibility of invalid payload sent from the userspace
> and was buggy.
> - enlisted ->info() operation and reused existing
>   fill_remaining_elem_value() to sanitize the 'new' value provided by
>   user
> - fixed size provided to memcmp()
> - the 'original' value is now initilized with memset()
> 
> Readability improvements suggested by Kuninori.
> - added conditional #define snd_ctl_put() so that no additional
>   if-statements are needed in the actual code.
> 
> 
>  sound/core/control.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 9c3fd5113a61..18ddae138795 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -1264,6 +1264,60 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
>  	return result;
>  }
>  
> +#if IS_ENABLED(CONFIG_SND_CTL_DEBUG)
> +static int snd_ctl_put_verify(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control)
> +{
> +	struct snd_ctl_elem_value original;
> +	struct snd_ctl_elem_info info;

Those will consume too much on stack.
Maybe snd_ctl_elem_info is acceptable, but snd_ctl_elem_value is too
big.  That's why we use a temporary kmalloc() for storing the values
in other places, and I'm afraid you'd need to follow it here, too.

If the performance matters, we may introduce a shared
snd_ctl_elem_value object with some protection, too.  IIRC, this code
path is already protected exclusively with card->control_rwsem write,
it can be per-card basis.

> +	if (retcmp == ret)
> +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
> +	else
> +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);

So this prints out a message at each access even if it succeeds.
I believe this would flood too many messages unnecessarily.  Can it be
better to be with debug level?

Also, this message doesn't show any relevant information about which
card, device and which control caused the error, and that makes
debugging harder.  Put some prefix to identify the problematic
control.


thanks,

Takashi
