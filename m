Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6B3D25BC
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878182; cv=none; b=YjyQhSIEzOxb+OAp5PTDvF6rlYoJbOuB7AczA8t21yHOp6FSAc+uwu9QoUrUhZGswHFhZZNf2UG9hxHto7iydfhnwHCvU0LFY4zs1hLM64m5K2RS2p75gUlGLfh4DQvfipaT0TCxme1GQ4EyytNxnPAdKHeQsIZAYRz+GI6LgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878182; c=relaxed/simple;
	bh=5V/xMWIPP7Fjuzt3FhXRhPiIRy0Nu3keMdZM4BEAv3Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpbLhtmQO6klCAqEidkbetKeW111jfJ1qGKQjUlf1lSbrHuk7QjaUONN8sxwps1lDVmSsfgfAg0brIhgu5XswGpjn4nJN9PaaGqepGmQhxhip5gHV/nRil8jlSWKIRWY+SRInfESa4tSph0zKjjV7nJiwq/1YWTW2+PrnFkPWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W7+W4Hl8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YfhmY6QH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O8Y1QV3z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4BgDQ43M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W7+W4Hl8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YfhmY6QH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O8Y1QV3z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4BgDQ43M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4301666FDA;
	Wed, 27 May 2026 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779878179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vBIE+JdZ3yICMzyEy9GOGItB1weuwIrZMdA3ubuYv50=;
	b=W7+W4Hl8/HSX0EPspJYF9l/rAtauzHm45qRjQuQpF3We1lZxWRRU8DAsEkEcTleWcDb5mZ
	xg+kfA710QBU4qI6FMspkISXGoHQRxLJkVRzzgI+cpXKKrDvXx0vEqLFqINzYqjfWNCG7a
	FdtC005AbEbgcCqi4EtQ04bkE4anRME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779878179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vBIE+JdZ3yICMzyEy9GOGItB1weuwIrZMdA3ubuYv50=;
	b=YfhmY6QHIDvwsfoQekiSjtlko65ngdz6t3ikhoJgP6rVB8djPKo103srZhPnFPEKgiTRc8
	4xsfhd3vApQFT0Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O8Y1QV3z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4BgDQ43M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779878178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vBIE+JdZ3yICMzyEy9GOGItB1weuwIrZMdA3ubuYv50=;
	b=O8Y1QV3zKRFzWbSJY14h3xiRjb93M576c772p9ButK3dqp6NTSjVg2lyrOiiIhiPQhEVJP
	Dhk15QXFYgjQbfKbOmyTKndXt49rwjHeXzLRLHOcHHxRYChMQ00Ic/DuaEc3EHPIkoxi9A
	tDArt14IPodSh98Jn6HCt4k1PMqNv5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779878178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vBIE+JdZ3yICMzyEy9GOGItB1weuwIrZMdA3ubuYv50=;
	b=4BgDQ43MvwOhkvHxarlKnWrKFlCuKfuyk980FOprWo5KdvY3+8hqQfO5cyX6M+w957RrPe
	GrbB0er+vuRX2+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B40C5A7AF;
	Wed, 27 May 2026 10:36:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PV1lASLJFmrocwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 10:36:18 +0000
Date: Wed, 27 May 2026 12:36:17 +0200
Message-ID: <87bje1w34u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH] ALSA: check snd_ctl_new1() return value in multiple drivers
In-Reply-To: <tencent_4D2E7DEDD7773BC54C37A4A210EE3E194E08@qq.com>
References: <tencent_4D2E7DEDD7773BC54C37A4A210EE3E194E08@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4301666FDA
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[foxmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[foxmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 27 May 2026 11:09:23 +0200,
Zhao Dongdong wrote:
> 
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> 
> Check snd_ctl_new1() return value before dereferencing in:
>   - es1938
>   - cmipci
>   - ymfpci
>   - ice1712 (aureon, ice1712, ice1724)
>   - gus
>   - aoa (layout)

Could you split the patch for each driver?  All changes look
individual, and that makes easier to backport to older kernels.


thanks,

Takashi
