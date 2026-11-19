Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092975;
	b=GWpveoEwaA6iLeF46EVkJ32LOBBWkiYxh63Pcr/SaSFwjo8Uh87R1V5wBF7OJORuUwH8
	 kYD5PmLne+u3Is3iKhv6ySTPFc3hF2mxqeVv3ECtu9dZutepKVyFFaReKeS2qLvI1Ymay
	 sd86JSV3g2G90DXWQQkbEZccsZg+oO9sNdFe01JAhAy4bhg6WImi6Kk6WQmk/itflQf3t
	 pSQrU6uAcqJJ3N6iGSTIddiLb/nUhhkIRrFkEDKCJXrNIbr/jd3ePG11uqOXYxjhCe+sh
	 anQrFHN8/APZxelgh//G/SMbRbGDdAJZD6620Q7vfSxOaPJcJlHw4NKrWXXHRhkiLPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092975;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=F0pa9gWhqyXxe2Sk7NVmR2UagSMxHZk/HiZVHbbMNjc=;
	b=2CEZn8nk5CaKOW56Xvi8f9U0rpWqgbc/9gL13c3WkXORMMPc4Ff/kmfv6KUgvj1/8tKD
	 DFd2xP9P2xFHxiKS5BMxIxtpdXjRSoDBAKP7rzU8D3RRGIWvwEcrbc4M6Anob3HfX9XhI
	 fLtQ5pqclKFa4c4P2CZpSpzyE5kdnZUMFFe+PhK/3A6TjIABeL8huLz2FqJRWuzDLzuxd
	 CCyaqXKSLKyOvFGX+hiuTn902hkXScWuUX5IhcPYS/ztTDYubcym54pkFynGC0IDcAmFk
	 Qf8cHDslMb6ITEaEbFSVMz13AwQe+dF2eU+lhYKBDD2rrVm41rv2nga9GinMyinY6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ePORaXAg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EODEqCsA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ePORaXAg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EODEqCsA;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2360A260F;
	Thu, 19 Nov 2026 12:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D2360A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ePORaXAg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EODEqCsA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ePORaXAg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EODEqCsA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 942AE1F80E;
	Thu, 19 Nov 2026 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795092972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0pa9gWhqyXxe2Sk7NVmR2UagSMxHZk/HiZVHbbMNjc=;
	b=ePORaXAgBgC6wixBo3rceLFQ/3BHVGVD1wAhmsvEVmXcGyyA724YpKJRJhNtBmNQeiYw46
	MH0ylDdXpndR5r0aEF5VjsY+21b2Z1P0LbZGX7S9gjQAsMDX2YlZOI3Ld8s30b5bIgN/pj
	GDu9x1ALyqfwVOf+up8fbmczooNHD6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795092972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0pa9gWhqyXxe2Sk7NVmR2UagSMxHZk/HiZVHbbMNjc=;
	b=EODEqCsACbJsTkpFM2uY6XlBEMIcJ2TI2j8FYpg6pTzF03ETJr/UlNtbk8dKA6dh7QaG6w
	LLSFb99A8WbswzBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ePORaXAg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EODEqCsA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795092972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0pa9gWhqyXxe2Sk7NVmR2UagSMxHZk/HiZVHbbMNjc=;
	b=ePORaXAgBgC6wixBo3rceLFQ/3BHVGVD1wAhmsvEVmXcGyyA724YpKJRJhNtBmNQeiYw46
	MH0ylDdXpndR5r0aEF5VjsY+21b2Z1P0LbZGX7S9gjQAsMDX2YlZOI3Ld8s30b5bIgN/pj
	GDu9x1ALyqfwVOf+up8fbmczooNHD6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795092972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F0pa9gWhqyXxe2Sk7NVmR2UagSMxHZk/HiZVHbbMNjc=;
	b=EODEqCsACbJsTkpFM2uY6XlBEMIcJ2TI2j8FYpg6pTzF03ETJr/UlNtbk8dKA6dh7QaG6w
	LLSFb99A8WbswzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46D9C1342D;
	Thu, 19 Nov 2026 12:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id moOaB+zx/mooKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:56:12 +0000
Date: Thu, 19 Nov 2026 13:56:11 +0100
Message-ID: <87se0xugic.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: dmaengine: Check DMA submission errors
In-Reply-To: <20261119073653.2632-1-sreekuttan2156239@gmail.com>
References: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
	<20261119073653.2632-1-sreekuttan2156239@gmail.com>
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 942AE1F80E

On Thu, 19 Nov 2026 08:36:53 +0100,
Sreeraj S Kurup wrote:
> 
> The dmaengine_pcm_prepare_and_submit() function does not check
> the return value of dmaengine_submit().
> 
> dmaengine_submit() can return a negative DMA cookie if the
> submission fails. However, the function currently returns
> success unconditionally.
> 
> This makes the PCM trigger path believe that DMA has been
> successfully submitted, even when the submission has failed.
> 
> Use dma_submit_error() to check the returned DMA cookie and
> propagate the error to the caller.
> 
> This ensures that DMA submission failures are properly
> reported instead of allowing the PCM stream to continue
> as if the DMA transfer had started successfully.
> 
> Fixes: e7f73a161356 ("ASoC: Add dmaengine PCM helper functions")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied now.  Thanks.


Takashi
