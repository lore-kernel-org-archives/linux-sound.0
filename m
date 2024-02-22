Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC381EA95
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708626838; cv=none; b=KycWZLn/CoFyi7DyRd4QHTp4oh9QPO/UALDjFAlbHfCDxAK6SCivtpGdmoHI7kUCC52jhljOQimNZ8Xb0URnBAMyVaq2ywinjdc25cJw7652+5zP591B1MArMAE5QP+GdGXheVRx2hFGtoW7zqkvo8bxdnOYLrvjfzUbWrJn2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708626838; c=relaxed/simple;
	bh=TccGcIR4/J9ndWH9SEcf1+EdZcpEwkbb1zolLgwnaRc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3DePtJCDds1jNXP5fmsfuDx/nkM6NwAowXddfdvbX5JAbinZY6JNBH2JC1pdglZtMJdZSjz5HdDqBK4DsQZ+r/ajFBeXsRxxyeGReUgSYE2AZqZ/h7VY7y9BRYkItqMZnjiNHL+UvAfuN6kFqhchAL9vjaa+yOKw/vmsafYlXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oq+tFe8L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XmGQ5lFB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oq+tFe8L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XmGQ5lFB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oq+tFe8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XmGQ5lFB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oq+tFe8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XmGQ5lFB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C1D11FBA9;
	Thu, 22 Feb 2024 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708626833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6K+7ok9mFCUsMHovhem0kenlydmGmqrNUQf5yxahaw=;
	b=oq+tFe8LfO3xb1UACiK/aYsXX+MJdiNMOELBVEO2o1tY2qbBRaOnH7mf9tkkyqaGg1p8LU
	Y0DjFtXdMhgBU2CV6JqZNCIBBTJdIpUdY5DnQv2hmOkAYf0YOu2RKB5WO246Wu9i6z87Y9
	hWE8dd6isHxj7wcCuCnSBiHjD/bn6y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708626833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6K+7ok9mFCUsMHovhem0kenlydmGmqrNUQf5yxahaw=;
	b=XmGQ5lFB0UHdQ39TahBBR/IQ9LPE5f4z9F8dsIOUt7xzEEr3SlFIjv0jzI2yqG6hopSRps
	1dhhA3rzhS8XC4CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708626833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6K+7ok9mFCUsMHovhem0kenlydmGmqrNUQf5yxahaw=;
	b=oq+tFe8LfO3xb1UACiK/aYsXX+MJdiNMOELBVEO2o1tY2qbBRaOnH7mf9tkkyqaGg1p8LU
	Y0DjFtXdMhgBU2CV6JqZNCIBBTJdIpUdY5DnQv2hmOkAYf0YOu2RKB5WO246Wu9i6z87Y9
	hWE8dd6isHxj7wcCuCnSBiHjD/bn6y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708626833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n6K+7ok9mFCUsMHovhem0kenlydmGmqrNUQf5yxahaw=;
	b=XmGQ5lFB0UHdQ39TahBBR/IQ9LPE5f4z9F8dsIOUt7xzEEr3SlFIjv0jzI2yqG6hopSRps
	1dhhA3rzhS8XC4CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0E01133DC;
	Thu, 22 Feb 2024 18:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ugFHNZCT12VUBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 18:33:52 +0000
Date: Thu, 22 Feb 2024 19:33:52 +0100
Message-ID: <87jzmw4acv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: clarify and fix default msbits value for all formats
In-Reply-To: <20240222173649.1447549-1-perex@perex.cz>
References: <20240222173649.1447549-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On Thu, 22 Feb 2024 18:36:49 +0100,
Jaroslav Kysela wrote:
> 
> Return used most significant bits from sample bit-width rather than the whole
> physical sample word size. The starting bit offset is defined in the format
> itself.
> 
> The behaviour is not changed for 32-bit formats like S32_LE. But with this
> change - msbits value 24 instead 32 is returned for 24-bit formats like S24_LE
> etc.
> 
> Also, commit 2112aa034907 ("ALSA: pcm: Introduce MSBITS subformat interface")
> compares sample bit-width not physical sample bit-width to reset MSBITS_MAX bit
> from the subformat bitmask.
> 
> Probably no applications are using msbits value for other than S32_LE/U32_LE
> formats, because no drivers are reducing msbits value for other formats (with
> the msb offset) at the moment.
> 
> For sanity, increase PCM protocol version, letting the user space to detect
> the changed behaviour.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Hmm, the idea is nice, but I hesitate to take this as is.

Basically the kernel should keep the backward compatibility, and this
won't (although the feature is very minor).

IMO, it'd be safer to check user_pversion and applies the new behavior
only with it being >= 2.0.17, for example.


thanks,

Takashi

> ---
>  include/uapi/sound/asound.h | 4 ++--
>  sound/core/pcm_native.c     | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index d5b9cfbd9cea..628d46a0da92 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
>   *                                                                           *
>   *****************************************************************************/
>  
> -#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 16)
> +#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
>  
>  typedef unsigned long snd_pcm_uframes_t;
>  typedef signed long snd_pcm_sframes_t;
> @@ -416,7 +416,7 @@ struct snd_pcm_hw_params {
>  	unsigned int rmask;		/* W: requested masks */
>  	unsigned int cmask;		/* R: changed masks */
>  	unsigned int info;		/* R: Info flags for returned setup */
> -	unsigned int msbits;		/* R: used most significant bits */
> +	unsigned int msbits;		/* R: used most significant bits (in sample bit-width) */
>  	unsigned int rate_num;		/* R: rate numerator */
>  	unsigned int rate_den;		/* R: rate denominator */
>  	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index f5ff00f99788..21baf6bf7e25 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -486,6 +486,11 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
>  		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
>  		if (snd_interval_single(i))
>  			params->msbits = snd_interval_value(i);
> +		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +		if (snd_mask_single(m)) {
> +			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
> +			params->msbits = snd_pcm_format_width(format);
> +		}
>  	}
>  
>  	if (params->msbits) {
> -- 
> 2.43.0
> 
