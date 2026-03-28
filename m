Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B43262BD
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691563; cv=none; b=qwZkj8Tju1Cne2EVuOEEJ9wpy8mzGFwVtpkeQ7h6Jscjv74hRbfXWK4r20/i5g9vUfX4nDuJPnErU3TwqLk/PPrREAfAo5Ji2LZpozKGho7DOfs9hT5vxBc6rP2CtkMMS//iRl/zl+g5CC5LqgGQ6JfjRi5UmSQKu0QU+6zbg0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691563; c=relaxed/simple;
	bh=lNeOAqX3kbRwPNn8qFR22BYEp5Fx0hJo91+nZbE2z5Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/PhUhqYewSjr8azJe+y4wfh08b2t2pYbVSIKTPtlRrGd9UO5QLnng8baO1CAXVcmJD2Saeywf+DblH0YuPHeKZTcTvNY9pBwBbzT8QS5eDaPDINKMSG+peqElBQqWqsKYkPMR4R13tUeID6Vizr7XPdHkAcerLAetB+7DC1/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qlH3RVgV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDPSJgo5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qlH3RVgV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gDPSJgo5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qlH3RVgV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDPSJgo5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qlH3RVgV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gDPSJgo5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4B824D37F;
	Sat, 28 Mar 2026 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774691559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/f05WWLSNQGzhym2U+hK0/L20YOZkn2BeeyzYn0fpBA=;
	b=qlH3RVgV1ljym5GVthnsksapm8ly+m1ig/hlmySWmSbHgP9+QdGCvTcTAJEOeVweQfXEsK
	2D6WgxBx1yX+VPHzB+eu4w/WmbAL2mJ2uau9ZrtVnvDUzfIKZmM5Rib2HfnMwZViXobg6k
	hQK55kFIsMy/U2pEmh7tA5qrMvYAWuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774691559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/f05WWLSNQGzhym2U+hK0/L20YOZkn2BeeyzYn0fpBA=;
	b=gDPSJgo5fuAmBUr3M/Wp1xFLbuxqC8m5JIDAqkuJvN/4dlaWBUdF0gbRgGP2ptk+Ja3tCu
	rzSE11IXEO9fgyBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qlH3RVgV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gDPSJgo5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774691559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/f05WWLSNQGzhym2U+hK0/L20YOZkn2BeeyzYn0fpBA=;
	b=qlH3RVgV1ljym5GVthnsksapm8ly+m1ig/hlmySWmSbHgP9+QdGCvTcTAJEOeVweQfXEsK
	2D6WgxBx1yX+VPHzB+eu4w/WmbAL2mJ2uau9ZrtVnvDUzfIKZmM5Rib2HfnMwZViXobg6k
	hQK55kFIsMy/U2pEmh7tA5qrMvYAWuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774691559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/f05WWLSNQGzhym2U+hK0/L20YOZkn2BeeyzYn0fpBA=;
	b=gDPSJgo5fuAmBUr3M/Wp1xFLbuxqC8m5JIDAqkuJvN/4dlaWBUdF0gbRgGP2ptk+Ja3tCu
	rzSE11IXEO9fgyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91AE04A0A3;
	Sat, 28 Mar 2026 09:52:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OYSgIeekx2m2RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 09:52:39 +0000
Date: Sat, 28 Mar 2026 10:52:39 +0100
Message-ID: <877bqwwaag.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: asihpi: use scnprintf() for control name formatting
In-Reply-To: <20260327234848.64134-1-pengpeng@iscas.ac.cn>
References: <20260323070310.55878-1-pengpeng@iscas.ac.cn>
	<20260327234848.64134-1-pengpeng@iscas.ac.cn>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: C4B824D37F
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 28 Mar 2026 00:48:48 +0100,
Pengpeng Hou wrote:
> 
> asihpi_ctl_init() builds mixer control names in the fixed 44-byte
> hpi_ctl->name buffer with sprintf().
> 
> This is not only a defensive cleanup. The current in-tree name tables and
> format strings can already exceed 44 bytes. For example,
> 
>   "Bitstream 0 Internal 0 Monitor Playback Volume"
> 
> is 46 characters before the trailing NUL, so the current sprintf() call
> writes past the end of hpi_ctl->name.
> 
> Switch the formatting to scnprintf() so the driver truncates control
> names instead of overflowing the fixed ALSA control name storage.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Thanks, now it's clearer.  But if the string overflow can happen
really, it's rather a bigger problem; then we can't blindly truncate
the string as it's used as the control API element key.

I guess this didn't happen in reality because the choice of source and
destination depends on the firmware and the selection like the above
didn't exist so far in the provided firmware data.  But, we still
should address the problem, of course.

Anyways, if the truncation happens, we'd rather need to notify users
that it's basically an error.  That is, we should use snprintf() in
this case and have a return value check.  If it's truncated, the
driver spews the error, showing the truncated string.

Could you revise the patch in that way and resubmit v3?


thanks,

Takashi


> ---
>  sound/pci/asihpi/asihpi.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> index 3a64d0562803..de2859eb3e9f 100644
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -1384,22 +1384,25 @@ static void asihpi_ctl_init(struct snd_kcontrol_new *snd_control,
>  		dir = "Playback "; /* PCM Playback source, or  output node */
>  
>  	if (hpi_ctl->src_node_type && hpi_ctl->dst_node_type)
> -		sprintf(hpi_ctl->name, "%s %d %s %d %s%s",
> -			asihpi_src_names[hpi_ctl->src_node_type],
> -			hpi_ctl->src_node_index,
> -			asihpi_dst_names[hpi_ctl->dst_node_type],
> -			hpi_ctl->dst_node_index,
> -			dir, name);
> +		scnprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
> +			  "%s %d %s %d %s%s",
> +			  asihpi_src_names[hpi_ctl->src_node_type],
> +			  hpi_ctl->src_node_index,
> +			  asihpi_dst_names[hpi_ctl->dst_node_type],
> +			  hpi_ctl->dst_node_index,
> +			  dir, name);
>  	else if (hpi_ctl->dst_node_type) {
> -		sprintf(hpi_ctl->name, "%s %d %s%s",
> -		asihpi_dst_names[hpi_ctl->dst_node_type],
> -		hpi_ctl->dst_node_index,
> -		dir, name);
> +		scnprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
> +			  "%s %d %s%s",
> +			  asihpi_dst_names[hpi_ctl->dst_node_type],
> +			  hpi_ctl->dst_node_index,
> +			  dir, name);
>  	} else {
> -		sprintf(hpi_ctl->name, "%s %d %s%s",
> -		asihpi_src_names[hpi_ctl->src_node_type],
> -		hpi_ctl->src_node_index,
> -		dir, name);
> +		scnprintf(hpi_ctl->name, sizeof(hpi_ctl->name),
> +			  "%s %d %s%s",
> +			  asihpi_src_names[hpi_ctl->src_node_type],
> +			  hpi_ctl->src_node_index,
> +			  dir, name);
>  	}
>  }
>  
> -- 
> 2.50.1 (Apple Git-155)
> 
