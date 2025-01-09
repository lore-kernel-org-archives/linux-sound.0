Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4314F98
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433100; cv=none; b=MTeqDEKKIo2cKfMzDa53iI9ZlRpMHgaBLdrau2Y8f8Erw8xu7aRVbPsRpqVnuu0z4ocJr/76ymBntUroN2+lHy03SRyu89PX6NBs9GjY/Cmh02DbEw9Hq2GXHFOk4JJmave3y+UWYZ4Ks+im87UcQFHMY1LHH+pkSHebVnHDMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433100; c=relaxed/simple;
	bh=XA/uysTjnsieAem+0rkgMENesqli+4CvOJmIr7+Ujys=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHDTjhVck4KbMGQY6T7h5u6igcG9X6kvpoiuA6U7GNRryQXR3IAtR18iNkzfQ5FHXcbhEIqxQFBxz/dKCGHZYI8T/Tgnl6HVA/WUpK5HJMu4gbZHZf4Zp2eEaxptNSMokDfnXFw4VgKCOUfxADREy0gQMidol2B9tjV7E4HmXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yse+nytd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4DAV+ofC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yse+nytd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4DAV+ofC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yse+nytd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4DAV+ofC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yse+nytd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4DAV+ofC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 806421F393;
	Thu,  9 Jan 2025 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736433096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FhQtPMpoEnTaOIYk83NP7l/sfG9i1/hXT7Uz53XyobA=;
	b=yse+nytdr/WlHguSulW29pmMlreRlbPpLGf+HiQ21w3X5zyoYDFuYF6c9TEvdNX5d2zzkT
	XKKqPQxqGmEEVs5JXIVJUpBd+U9AD62PhbDFs8FmByohK72ozeTw3THsy2gHWvwCBoH8Rt
	nM7fmFlUJTpeVeCJnz84DiaktdoMrdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736433096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FhQtPMpoEnTaOIYk83NP7l/sfG9i1/hXT7Uz53XyobA=;
	b=4DAV+ofCQ/1eRdZmPwaFYmFgletWssU9nCBXTgTHYh9Sw0uibNeGKWPIoQ6xnw8RjMEKle
	G6+PueutmzAmszBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yse+nytd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4DAV+ofC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736433096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FhQtPMpoEnTaOIYk83NP7l/sfG9i1/hXT7Uz53XyobA=;
	b=yse+nytdr/WlHguSulW29pmMlreRlbPpLGf+HiQ21w3X5zyoYDFuYF6c9TEvdNX5d2zzkT
	XKKqPQxqGmEEVs5JXIVJUpBd+U9AD62PhbDFs8FmByohK72ozeTw3THsy2gHWvwCBoH8Rt
	nM7fmFlUJTpeVeCJnz84DiaktdoMrdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736433096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FhQtPMpoEnTaOIYk83NP7l/sfG9i1/hXT7Uz53XyobA=;
	b=4DAV+ofCQ/1eRdZmPwaFYmFgletWssU9nCBXTgTHYh9Sw0uibNeGKWPIoQ6xnw8RjMEKle
	G6+PueutmzAmszBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CF37139AB;
	Thu,  9 Jan 2025 14:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xpOQEcjdf2fzYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 14:31:36 +0000
Date: Thu, 09 Jan 2025 15:31:35 +0100
Message-ID: <87wmf45a9k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH 3/3] ALSA: control: Fix argument type mismatch
In-Reply-To: <20250109125204.3668961-4-cezary.rojewski@intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
	<20250109125204.3668961-4-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 806421F393
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Thu, 09 Jan 2025 13:52:04 +0100,
Cezary Rojewski wrote:
> 
> strscpy() expects argument of type "char *", not "unsigned char *".
> Found out by Coverity static analyzer.
> 
> Fixes: 68fa05d4a82b ("ALSA: control: Introduce snd_ctl_find_id_mixer()")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

The conversion between char and unsigned char pointers isn't taken
seriously in the kernel code.  The compiler warning was disabled
intentionally, too.  In general, such an unnecessary cast is more
harmful.


thanks,

Takashi

> ---
>  include/sound/control.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sound/control.h b/include/sound/control.h
> index e07f6b960641..f7e18a1d144f 100644
> --- a/include/sound/control.h
> +++ b/include/sound/control.h
> @@ -161,7 +161,7 @@ snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
>  	struct snd_ctl_elem_id id = {};
>  
>  	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> -	strscpy(id.name, name, sizeof(id.name));
> +	strscpy((char *)id.name, name, sizeof(id.name));
>  	return snd_ctl_find_id(card, &id);
>  }
>  
> -- 
> 2.25.1
> 
