Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093073;
	b=Wl5Akwueq9PgLeKooPQG6A2vIyt2sLEpyiabfJjveqoEIOJUJKXMMPehifMr/uNDpk3p
	 6CB+Uiu8T80bauyRv32vz3oaV8DhgNZM1e1790Q7SNnw+qF3yogKvAOAwbAv7IoNN2yjk
	 nFZQi2NlyEACr4ZfjAT1yKtBmou2DuA4uIzgl31qq3tdmG8DnCIMNB7+09zLwAmItAicy
	 gNI+jiZN+oqocFUnWTklGTy8YYcqscrJ5FHMlh37GW7bMP8/qaBl0pw2Bg2WGaWdIBI6i
	 KZWxLmL2e0t1z8nlVsUdB6RyGhMZ9bAdiRtLR0sjgcUcpDwXgd4xg6HDI70BZh7a/pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093073;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=mo5oq+QW7HH5b93hVH61wMtRjnuHSB1wKq4BNvhl0m8=;
	b=g5XFM8Z8UrtZ5vFwjATRXvAowlbAEkAugWPQwtW6e5iuJG+fj+fj73p8IbWfROs7d5ex
	 fjN0awzQW472Uq7rpyu7gXF0nZH+z6tEKK8REeAnSOY3eaPC7+0KIW7JnKcF865NJmKuW
	 xXRP3IpQo4OWDYXNyuxgEQBUhtrkWmQHqkmTs8Ju8S0NcYzpqjLSjv/XYimTFnBUvv089
	 X2d/EBFJlagPTavPtyXTei/0W6FEvBC/ZY+L6XDgyeefFobrwtdsattoRkUGc4sE8f5TD
	 p6Mb2eQOEDAogoVL0K6UxaZtB46yW4UGB07L86p3S03cFsqTskJWxeRTHazw5nUvHEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RxJ4iKJL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tg5l1WN4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RxJ4iKJL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tg5l1WN4;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A274B606A320;
	Thu, 19 Nov 2026 12:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A274B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RxJ4iKJL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tg5l1WN4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RxJ4iKJL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tg5l1WN4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2AA322329;
	Thu, 19 Nov 2026 12:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795093070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mo5oq+QW7HH5b93hVH61wMtRjnuHSB1wKq4BNvhl0m8=;
	b=RxJ4iKJL8SovSI8VD/zLjYn5oezP982TvMWEN/zmiTuof/8rAuom0sfFHi9ikX+m65pLG8
	3xBaVCfCTb6plqYzcRmE7zi0MN6dONsitqXQ6tinQJJA7JsVOp23PhP5CwCUv5yFjT/6ZD
	39qkntgoO1oFAPEByISUgk9AYxCwJLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795093070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mo5oq+QW7HH5b93hVH61wMtRjnuHSB1wKq4BNvhl0m8=;
	b=tg5l1WN48RoGY/jNIDaCUYnTm9RVGNZmllAKBaPf1fzHOcC+UsMriwuYSymjZXpxK75tyA
	U6Ew8pzVOq7FGuAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RxJ4iKJL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tg5l1WN4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795093070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mo5oq+QW7HH5b93hVH61wMtRjnuHSB1wKq4BNvhl0m8=;
	b=RxJ4iKJL8SovSI8VD/zLjYn5oezP982TvMWEN/zmiTuof/8rAuom0sfFHi9ikX+m65pLG8
	3xBaVCfCTb6plqYzcRmE7zi0MN6dONsitqXQ6tinQJJA7JsVOp23PhP5CwCUv5yFjT/6ZD
	39qkntgoO1oFAPEByISUgk9AYxCwJLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795093070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mo5oq+QW7HH5b93hVH61wMtRjnuHSB1wKq4BNvhl0m8=;
	b=tg5l1WN48RoGY/jNIDaCUYnTm9RVGNZmllAKBaPf1fzHOcC+UsMriwuYSymjZXpxK75tyA
	U6Ew8pzVOq7FGuAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B1FC1342D;
	Thu, 19 Nov 2026 12:57:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hrJDDU7y/mpMKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:57:50 +0000
Date: Thu, 19 Nov 2026 13:57:49 +0100
Message-ID: <87qzghugfm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
In-Reply-To: <20261117160151.2624-1-sreekuttan2156239@gmail.com>
References: <87qzgjxzh7.wl-tiwai@suse.de>
	<20261117160151.2624-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A2AA322329
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Tue, 17 Nov 2026 17:01:51 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> Thanks for reviewing.
> 
> Regarding dma_buf_put(), get_dma_buf() takes an extra reference 
> for each DMA-BUF. This reference is intended to be transferred 
> to the file descriptor through fd_install(). If copy_to_user() 
> fails before fd_install(), these extra references must be 
> released separately.
> 
> snd_compr_task_free_one() releases the task's original DMA-BUF 
> references through snd_compr_task_free(). So both the explicit 
> dma_buf_put() calls and snd_compr_task_free_one() are needed.
> 
> Regarding the file descriptor ordering, I moved fd_install() 
> after copy_to_user() so that the file descriptors are installed 
> only after the task information is successfully copied to userspace.
> 
> There is a small time gap between copying the descriptor numbers and 
> installing the file descriptors. Userspace should use these descriptors 
> only after the ioctl completes.
> 
> Please let me know if you have any further concerns.
> 
> Best regards,
> Sreeraj

OK, now I applied to for-next branch.  Thanks.


Takashi
