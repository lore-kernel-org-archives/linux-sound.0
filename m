Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA41925BC
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195803; cv=none; b=DR1LwQRJ4lKS2boKx+s+jLYaip+LNePrQKDcgHOEisA0aU0XUdCpPh327mt21+mv/zjReTWaXfKUKgHWTiT8h0C7EQCGhIc8rcGNU9KciTHhrj8JCEvIvB8lthnaB4287w2swh/xCkZBpf+PLd88SIOYnv0nbIGDo8fgFIgD0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195803; c=relaxed/simple;
	bh=XUkjKm6gWhS87cAAgyI+wO+zCjn+h5RyP/Gjg0iENVY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r4mGDUnvyFZSJuibm5cenOF0+yBud7lOn0mdQ8wZo73AxXEfP20Z5lKd1r6SMcTVAs5LR68kSB7qH1u4mwVTOBSGnIs6eKcuMbo6OUZZY/CPPjwap/piXU1DfouGIuHmw1rLxSFJy703vMREG4IMeq3sXC7qAsMEmeYIhZ0HkbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pzHJQ+XS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EKSto7Eh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iw6E18yt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QVHUbdme; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pzHJQ+XS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EKSto7Eh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iw6E18yt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QVHUbdme"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDAB25BD41;
	Wed, 31 Dec 2025 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zFrCNLC1dsgw7E+vdvXdqyZCXg4jWNy36nnjCLxujA=;
	b=pzHJQ+XSpXqBCdOt5ULlt+C0rgLPiobk60vneEemXwCsxjcvJu4MkjaqTQFgTsmmtARI6O
	/EJdc03uCeskDocgBdoPxrvdfpIlQ1MKaV/JLDXn2jqwUCS5BujlGCXQ94i7EMSMXheF6f
	NOl0mt2g40PNgvOwLLnuQ9jp3bpqS5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zFrCNLC1dsgw7E+vdvXdqyZCXg4jWNy36nnjCLxujA=;
	b=EKSto7EhTJvMGqAw/NitEmKSs83qz4KRlDivRT21Y6H9J+FWvinHeB/eKjlFfiaIeBDTEU
	KVlt7yYNhyiucvBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iw6E18yt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QVHUbdme
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zFrCNLC1dsgw7E+vdvXdqyZCXg4jWNy36nnjCLxujA=;
	b=iw6E18ytBFdvoc17uBEA5MxcJZNcAdiNwYGlMvGBec/SzcUKdkCD0LalGU2HZgoLfx4Cl1
	9SgH76zx+fhYXp2wgKfM2OzEtE/uXp2ijZwPExXZTKjTOLB3yvaE3gy2IQff+G+zwpd9jC
	W35NxRnERcTEIRL9OJD2eDdXxqyWM3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zFrCNLC1dsgw7E+vdvXdqyZCXg4jWNy36nnjCLxujA=;
	b=QVHUbdmeVcFYO3iZgp7j94GbKoMzaI4OHJqOKcvSQ33/HmOQ8sMGlDAx3f2VOSLZJJmIDg
	dsWv+ixVI1ztE3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92091137FE;
	Wed, 31 Dec 2025 15:43:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T3pYIpZEVWkuaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:43:18 +0000
Date: Wed, 31 Dec 2025 16:43:18 +0100
Message-ID: <87ecoay7vt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cryolitia.pukngae@linux.dev,
	kuninori.morimoto.gx@renesas.com,
	lhi0729@kaist.ac.kr,
	pav@iki.fi,
	rene@exactco.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
In-Reply-To: <20251229093130.3202058-1-zhangheng@kylinos.cn>
References: <20251229093130.3202058-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: DDAB25BD41
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 29 Dec 2025 10:31:29 +0100,
Zhang Heng wrote:
> 
> There are three jack events for a sound card on a desktop computer,
> namely Speaker, Headphone, and Desktop Speaker. When both audio
> devices are available, users cannot distinguish which audio device
> is being used. Can we consider adding Line Out? similar to the HDA
> sound card. This can change one of them and reduce the complexity
> of the upper layer adaptation of the sound card.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Is 0x0308 something properly defined standard?  
If so, we can add the entry, of course.


thanks,

Takashi


> ---
>  sound/usb/mixer.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 3af71d42b9b9..bdde4261d994 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -615,6 +615,7 @@ static struct iterm_name_combo {
>  	{ 0x0305, "Room Speaker" },
>  	{ 0x0306, "Com Speaker" },
>  	{ 0x0307, "LFE" },
> +	{ 0x0308, "Line Out" },
>  	{ 0x0600, "External In" },
>  	{ 0x0601, "Analog In" },
>  	{ 0x0602, "Digital In" },
> -- 
> 2.47.1
> 
