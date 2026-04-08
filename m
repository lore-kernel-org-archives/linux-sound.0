Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8C39C004
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636425; cv=none; b=JTwCs09sVfZSKh5Ftbo03rWzVvHXm2Gsc13HrccKTjgX71TGAfkGUXauzc6jn/jOQVf4Kum56q9xyTP4x/9wccRq1jhNp+bhlCVVCPXeNBs8Bl+ic5Tl110JtrsWINYtbbEshUYwk3eZq0jTtJfuJ5aDP9dJwir6ifZ5z4kFa9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636425; c=relaxed/simple;
	bh=IklpLWTaZiZkjbWx+sAxeqHDHxPdAW0jZVjPFGpJz8M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/zP0GKpiCeoo5v00GazRB7Uwk2B8r/Zl7/0kZvf4cGhMVT8Fa3XHkt4SiGFLMRovx71LFS40n6I3Y44QWy7A35jKG5T256EqjHdYnB/WmXSBccuQ8+fIOjbsyANI8ZbrBdsRO9/leiydyCanlcArSs2d5G11DJJjY2MlBQRA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wPbsZqT0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C5nTEl2P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WbVH2wzd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GXAchg1F; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wPbsZqT0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C5nTEl2P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WbVH2wzd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GXAchg1F"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61A6A4E8CB;
	Wed,  8 Apr 2026 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775636422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRytrr1Bk12cMOiNMSSB2iN6lU1+2s2xxIN4jH/s8xA=;
	b=wPbsZqT0/5kYZicvTBvrbQlZDdCv0axYtUES+tGfznjsRf6AN1v8Gzx6em0GJ35n+OpVCc
	n/3N+vVSeTSPD+wE8VFvAacvdvrRGlUU/uFlk0IU+LHrtd9X1VWQln5jUShYHZ5LWoTP6z
	KlfDiVcNzTeMxc1+Z5XwDggSamfMSdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775636422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRytrr1Bk12cMOiNMSSB2iN6lU1+2s2xxIN4jH/s8xA=;
	b=C5nTEl2PnUMM1DwlVKXX+AM96hajLlWGXyX+EbpuwPq7JM+jY7pdDdgmAQUMcWpOvfWMRc
	qRluNCgDaEFDTfAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WbVH2wzd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GXAchg1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775636421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRytrr1Bk12cMOiNMSSB2iN6lU1+2s2xxIN4jH/s8xA=;
	b=WbVH2wzd4DI5UE/EkE1glD6vprWnVnKwnfMtWpu+jlCAm6h5eqG2rjlWstvmt5FqDWF0/i
	wa5J5viNQA47BEAFQKDl1lzCMbfU4d1dKeMH3Ddrjg7aNsfRJX7HbDT+H5pS+9w1Wxg8WY
	XY+JSIZJl5/8bUOXALSi3Dzl84ly5lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775636421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRytrr1Bk12cMOiNMSSB2iN6lU1+2s2xxIN4jH/s8xA=;
	b=GXAchg1F32sIEKIoJXKtu/l5pe9cmfnFkgxlxFPRZwdLKd+T7kd5U/LWwukluTFCmrH5+s
	LkPIMBIwpdnZKnBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 317504A0B3;
	Wed,  8 Apr 2026 08:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UxqxCsUP1mnxagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Apr 2026 08:20:21 +0000
Date: Wed, 08 Apr 2026 10:20:20 +0200
Message-ID: <87y0ixlv7f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Fix incorrect type in enable_audio_stream
In-Reply-To: <20260408054304.497277-1-songxiebing@kylinos.cn>
References: <20260408054304.497277-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 61A6A4E8CB
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 08 Apr 2026 07:43:04 +0200,
songxiebing wrote:
> 
> Fix sparse warning:
> sound/usb/qcom/qc_audio_offload.c:943:27: sparse: incorrect type in argument 2
> expected unsigned int val but got snd_pcm_format_t.
> 
> Explicitly cast pcm_format to unsigned int for snd_mask_leave().
> 
> Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604062109.Oxi8JjWW-lkp@intel.com/
> Signed-off-by: songxiebing <songxiebing@kylinos.cn>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index f161eb29f911..423e4a9b62e2 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -947,7 +947,7 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
>  	_snd_pcm_hw_params_any(&params);
>  
>  	m = hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT);
> -	snd_mask_leave(m, pcm_format);
> +	snd_mask_leave(m, (unsigned int)pcm_format);

I believe you need __force prefix for cast, as it's strong-typed.


thanks,

Takashi
