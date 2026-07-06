Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAE3BED6A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325531; cv=none; b=KshrCwjJGacfPeMfyWONAEAduJh9bjv2KYyEVM938MfPWJMbVGdE2xCQAn4W3mHpA796DSsQ3fec0e5rZDX33Qn2JdSdt4uu49TqEFm/FWWws8JIx9xiMA2ERRwuqOi8bdzJIuIC7u1Iq+ePCpyj/1BukGLBwGWUOp31QVFkfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325531; c=relaxed/simple;
	bh=YQ+rOY4DWphwHxNj4fO6xocSOJK8H/Rx4u+nIqVu6iA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVImpeLYuFTXDMdbkOWcBpV9n9QiIVYjbw+aHHHKotQ7w4ZNRFuJDn0AN/XU1VcAcHO9E0qKVXM9cwJ/+olHTGS3zjNW0fUO0GIECp4+axrF/8rUOVdbUiJ//riCMlOfHu9bO3hcobnmXI78wD5RH051jnbetP/4u7zwbLiyEA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WHdOpImn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iyJ8SmYu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pGXUYvgK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FLtnf4Cg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WHdOpImn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iyJ8SmYu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pGXUYvgK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FLtnf4Cg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1707775A86;
	Mon,  6 Jul 2026 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783325518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zv89bnVTcxQlMEd58+vDBhJIUTnQRf6LaamYiSsdNe0=;
	b=WHdOpImnZmi5P4zu+x6Yqaq+VO+LkI3M3xumdNnLat4ZXll+Snk5kHp5JqbgjtZfxrCg3K
	4f9FA0u+xPyGKNqDYPZcP92K5/VXdnTNKyXydXRMQ/+CKEjTdvqbyIcwsJhsn1N/JcuTSf
	n1csAFevz+3JK2HS8hc+e2oC56d57Mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783325518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zv89bnVTcxQlMEd58+vDBhJIUTnQRf6LaamYiSsdNe0=;
	b=iyJ8SmYu+5cybQhb8cSLtxE1Z3eu0hwwgO/zzWJZ/1t21RnZpYVbJTpNLpAtOFtsaaPpYI
	xc+2qL48BjkNZQCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783325517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zv89bnVTcxQlMEd58+vDBhJIUTnQRf6LaamYiSsdNe0=;
	b=pGXUYvgKxDJNdFjl8gEUn9z4J+i9oyQ79q7/oG7FP0xSmJJFWtyDdVni+ringcxxa2SkQv
	HM8xgobyDBPSXL6aJ2smyXfOI60GovSurZbiSXrSDn9WMOHW7FWgEonUHmfZMmxV5DYWFg
	SEviSIAC9CLhaVqd5YxDYXwb1lYuVO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783325517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zv89bnVTcxQlMEd58+vDBhJIUTnQRf6LaamYiSsdNe0=;
	b=FLtnf4Cg2XhZ9rTJXZo+DdI72hhi6Xzb1R4oWirJnVCpRXLkV10DeGFdcnJO7bubj7+A8A
	031tUs/Sf/jw7HBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1A2D779AA;
	Mon,  6 Jul 2026 08:11:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YZ61MUxjS2o8HQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Jul 2026 08:11:56 +0000
Date: Mon, 06 Jul 2026 10:11:56 +0200
Message-ID: <878q7o5ygj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	joakim.zhang@cixtech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/core: fix memory leak in snd_hdac_bus_alloc_stream_pages()
In-Reply-To: <tencent_B59DA88C3B51869ACB72BBD81D6171C24D06@qq.com>
References: <tencent_B59DA88C3B51869ACB72BBD81D6171C24D06@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[foxmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Mon, 06 Jul 2026 09:41:10 +0200,
Zhao Dongdong wrote:
> 
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> 
> In snd_hdac_bus_alloc_stream_pages(), there are three memory leak paths:
> 
>   1. If snd_dma_alloc_pages() for the BDL fails at stream i, the
>      previously allocated BDL DMA buffers (0..i-1) are not freed.
> 
>   2. If snd_dma_alloc_pages() for the position buffer fails, all
>      previously allocated BDL DMA buffers are leaked.
> 
>   3. If snd_dma_alloc_pages() for the ring buffer fails, all
>      previously allocated BDL DMA buffers and the position buffer
>      are leaked.
> 
> Add proper error cleanup: free buffers that have been allocated
> before each failure point.
> 
> Fixes: b2660d1ebde1 ("ALSA: hda: Move HD-audio core stuff into sound/hda/core")
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>

They don't actually leak, as those are supposed to be released by
callers (via snd_hdac_bus_free_stream_pages() call at destructor).
That is, it's no bug, per se.

Of course, it won't be bad to clean up in the function itself, which
is more self-contained and safer.  But please rephrase the patch
subject and description, so that it won't be taken as a security issue
incorrectly.


thanks,

Takashi
