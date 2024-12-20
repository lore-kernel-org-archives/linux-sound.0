Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381E51ACDE7;
	Fri, 20 Dec 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684903; cv=none; b=Iy+daNGok8NSH7IHJeKMdVlB3RUCaiJXiNY3zQXA3mcAg23O1UQubFeEUbAkowgZrMmhvW8jV+SZxlujqFatSz7sJqg/3ZMQnWL2SFka9CmprkaKLmcgI2ZSOvr3ZrDJ30pi6hxj3P+aBkNly08SCHF4NcB4Dfgf2w/l/q3+AZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684903; c=relaxed/simple;
	bh=cq6n4Kh6CyG8RrhpH2Ql8b/h+OAH8I1D4yeGhpUNOEE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOPHfTHatRLyJ3f59bg80rzgIlBxMLgx7KjU9PSvhEc0soFsM79vU8UMIs6koAo+YEs0AFpXj5SEXykAAEt4jvamq5PYb9WyAXmBVvGDqEsLvyJFVKsWmw0DGhcpZyZZ6L5MCe+KYgqzjt6DDos9C+TNpTBQRi9Kx13Kb8MHZj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SH6eUUne; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v7AYzpAz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SH6eUUne; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v7AYzpAz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SH6eUUne";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v7AYzpAz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SH6eUUne";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v7AYzpAz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E6C82115C;
	Fri, 20 Dec 2024 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuS82a15vsTRHzOXrPzlufa04nBsn7Jcy9k+KDJr/6w=;
	b=SH6eUUne9f6BqMxs5ZdOyFyjsOrJyfTKJh04At3lxXEfrEUV7erc1SW+kFaXyYemXe2BdX
	epmTAcU4DwCnwTRwpD78Ffhymx9yt5aM1tBKmaBVJqzK8SEsPIuRyCSsdrh4yFxNGz6V2e
	Xtx9QXcOUjWHyUsITuCXREMXLyTYqh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuS82a15vsTRHzOXrPzlufa04nBsn7Jcy9k+KDJr/6w=;
	b=v7AYzpAzAtzWVt0Pbw5uLIQ54aseNboqFK2utJv64WNRhrl7DXuponZz/WzB0N+8OAot4z
	hw4y0QJH4EbEFtDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734684899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuS82a15vsTRHzOXrPzlufa04nBsn7Jcy9k+KDJr/6w=;
	b=SH6eUUne9f6BqMxs5ZdOyFyjsOrJyfTKJh04At3lxXEfrEUV7erc1SW+kFaXyYemXe2BdX
	epmTAcU4DwCnwTRwpD78Ffhymx9yt5aM1tBKmaBVJqzK8SEsPIuRyCSsdrh4yFxNGz6V2e
	Xtx9QXcOUjWHyUsITuCXREMXLyTYqh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734684899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuS82a15vsTRHzOXrPzlufa04nBsn7Jcy9k+KDJr/6w=;
	b=v7AYzpAzAtzWVt0Pbw5uLIQ54aseNboqFK2utJv64WNRhrl7DXuponZz/WzB0N+8OAot4z
	hw4y0QJH4EbEFtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAF3713A63;
	Fri, 20 Dec 2024 08:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id swn1MeIwZWcVbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 08:54:58 +0000
Date: Fri, 20 Dec 2024 09:54:54 +0100
Message-ID: <878qsaraxt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH] ALSA: memalloc: prefer dma_mapping_error() over explicit address checking
In-Reply-To: <20241219203345.195898-1-pchelkin@ispras.ru>
References: <20241219203345.195898-1-pchelkin@ispras.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Thu, 19 Dec 2024 21:33:45 +0100,
Fedor Pchelkin wrote:
> 
> With CONFIG_DMA_API_DEBUG enabled, the following warning is observed:
> 
> DMA-API: snd_hda_intel 0000:03:00.1: device driver failed to check map error[device address=0x00000000ffff0000] [size=20480 bytes] [mapped as single]
> WARNING: CPU: 28 PID: 2255 at kernel/dma/debug.c:1036 check_unmap+0x1408/0x2430
> CPU: 28 UID: 42 PID: 2255 Comm: wireplumber Tainted: G  W L  6.12.0-10-133577cad6bf48e5a7848c4338124081393bfe8a+ #759
> debug_dma_unmap_page+0xe9/0xf0
> snd_dma_wc_free+0x85/0x130 [snd_pcm]
> snd_pcm_lib_free_pages+0x1e3/0x440 [snd_pcm]
> snd_pcm_common_ioctl+0x1c9a/0x2960 [snd_pcm]
> snd_pcm_ioctl+0x6a/0xc0 [snd_pcm]
> ...
> 
> Check for returned DMA addresses using specialized dma_mapping_error()
> helper which is generally recommended for this purpose by
> Documentation/core-api/dma-api.rst.
> 
> Fixes: c880a5146642 ("ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer allocations")
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Closes: https://lore.kernel.org/r/CABXGCsNB3RsMGvCucOy3byTEOxoc-Ys+zB_HQ=Opb_GhX1ioDA@mail.gmail.com/
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
> Decided not to wrap long dmesg lines. If it looks really ugly for the
> commit message, please feel free to adjust them to the standards.

It looks fine, so applied now.  Thanks!


Takashi
