Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4141F7CE
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433799; cv=none; b=UzJDqyknx9rLdcTX+VKgao1y1k7Zk9KY0NgqJRzc5srR0NoeH917aAeIXkG6fMDdjuxwidng6HNhXWiqughALHqpMDSfVT4bOVxu92qNIZ0jGO6Dey9TrFTyNAUOeGn29aHo4rhkl4q9cqTLcvPW7zwMDmqv3J+CMug/5p85faI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433799; c=relaxed/simple;
	bh=iNGcdZFIovI7BTlUrl3NRs0mtJ/fAS/8MzwoC5z6JeY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXBgbL/EU8WKoK3kTBx23GZeO4A4oHH8rcgnbChvSHtgMcNgNhMCwRnv6ulW7aOYaVlDRDC8atvx5VHgzuDYC893T6j/nDjLaUTGQ+bo68pqC3K8hGtrXDbiOpp5Zd1prV8vTnG9FyByHjtJs0PaJ51a9teLSt6Qsjkt8SWysX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bnxI8D+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LJAT3fIo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bnxI8D+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LJAT3fIo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bnxI8D+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LJAT3fIo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bnxI8D+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LJAT3fIo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A40B75C0C;
	Tue,  7 Jul 2026 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783433796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kopB5Vx6D/X5JhHVZBQMGzISKkGFHF1Y3hjKO9k3BQ=;
	b=bnxI8D+Ayw8GCdlBEPm/nNDe0frn6HlhpH/MA5lnpzrlcDjEQ+d8uhqf59zzVlVBbL58ps
	4FVA1KwU144cnD1huyDWXYZpVyCgVJDuXJMl/dFFXT78pWG/7rlVTsV0/jKxnRqcEfhHFf
	ttAiqGA5PrgShHrW858BhqmREaP3yKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783433796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kopB5Vx6D/X5JhHVZBQMGzISKkGFHF1Y3hjKO9k3BQ=;
	b=LJAT3fIoRWMAaQIx+syLOXhoGjqaV16hf0Gfv3jZRgTcTnaYBXUqikUBWnFJy6UukUOpoX
	U4L/9e9Q7t8dlNDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bnxI8D+A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LJAT3fIo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783433796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kopB5Vx6D/X5JhHVZBQMGzISKkGFHF1Y3hjKO9k3BQ=;
	b=bnxI8D+Ayw8GCdlBEPm/nNDe0frn6HlhpH/MA5lnpzrlcDjEQ+d8uhqf59zzVlVBbL58ps
	4FVA1KwU144cnD1huyDWXYZpVyCgVJDuXJMl/dFFXT78pWG/7rlVTsV0/jKxnRqcEfhHFf
	ttAiqGA5PrgShHrW858BhqmREaP3yKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783433796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kopB5Vx6D/X5JhHVZBQMGzISKkGFHF1Y3hjKO9k3BQ=;
	b=LJAT3fIoRWMAaQIx+syLOXhoGjqaV16hf0Gfv3jZRgTcTnaYBXUqikUBWnFJy6UukUOpoX
	U4L/9e9Q7t8dlNDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2828B779AE;
	Tue,  7 Jul 2026 14:16:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yuigCEQKTWpLXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jul 2026 14:16:36 +0000
Date: Tue, 07 Jul 2026 16:16:31 +0200
Message-ID: <8733xu7um8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	joakim.zhang@cixtech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/core: add cleanup in snd_hdac_bus_alloc_stream_pages()
In-Reply-To: <tencent_8E5BBBD19D53B1EFCDB6E89F3B6246A70B06@qq.com>
References: <tencent_8E5BBBD19D53B1EFCDB6E89F3B6246A70B06@qq.com>
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
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kylinos.cn:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4A40B75C0C
X-Spam-Score: -3.51

On Tue, 07 Jul 2026 04:11:39 +0200,
Zhao Dongdong wrote:
> 
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> 
> The current error handling in snd_hdac_bus_alloc_stream_pages()
> returns directly on failure without cleaning up already allocated
> resources. While callers are supposed to release those via
> snd_hdac_bus_free_stream_pages() at destructor, adding explicit
> cleanup makes the function more self-contained and safer against
> future misuse.
> 
> Add proper error cleanup path using goto labels to free previously
> allocated BDL DMA buffers, position buffer, and ring buffer in
> reverse allocation order.
> 
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> ---
> v2: Update subject and description.
> v1: https://lore.kernel.org/all/87pl108lp1.wl-tiwai@suse.de/

Applied now to for-next branch.  Thanks.


Takashi
