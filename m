Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84FF37D12F
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910364; cv=none; b=inXotc2pPxDPYQyy6HihHpkBQ4e94L1Bsc/CCITvl9JYvOiB1wFCkK8U8EMRq20vv6ZD76JDtV4gk18BPEKsRl+76+Skmt4ZDc0KdGCzDrGcRmHqqk76zHGiiLlE78IZgeLYIqEpkU9/55OpeQq6uYcHBX7kcpB8REbeDmlgR8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910364; c=relaxed/simple;
	bh=NBAAk+9tpx66KIM+E0w3N6mCQNEGxYdzWyeG21F6wzA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9dnWc5BGEhP08tmnIHKotpchGvLmJPcoUTOrfPr1mMTNrpbJXYgJdCjnFCqF3LW6s/lX44g/pIyjBVFJmgo5yGYH8DTst0AAtue6Puq3Q1nBUBw9cano1yXztIbHllw+6qTXXk6d2DOy6oexDa4DTdhvRiMcyluaosBYS6Z+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+EIfh+Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vJ590E8I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N2Z0FWuE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NU6WOp5W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+EIfh+Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vJ590E8I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N2Z0FWuE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NU6WOp5W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE0106A807;
	Mon,  4 May 2026 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777910361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qSAzNf8PDzy8pKcY+/1mlLcEcolTjF57o6GuRUexzQ=;
	b=S+EIfh+ZuM7Ek8peE2CuPHMnuIAF7ZJ6dJY8XGzqumDePkAet26EML9+TczWyv6CaRPodl
	ZiLq+pd5ez5XKV5OZ8EPtpEk9lH0a42+O0waFSsBSQhNdj92lefLSN0J+TZo7Ny9YHFBNP
	B6lCckA6qu4IiY0aI3ZWjUL8Cfg+OMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777910361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qSAzNf8PDzy8pKcY+/1mlLcEcolTjF57o6GuRUexzQ=;
	b=vJ590E8I9nIfl28gzuNkL0RgkWDS+bPe2n3y6wqjxj+Pnml2tGQ5RWUNdKYZwwKyX5/j6A
	47W4kG2Ii5aVUoBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N2Z0FWuE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NU6WOp5W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777910360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qSAzNf8PDzy8pKcY+/1mlLcEcolTjF57o6GuRUexzQ=;
	b=N2Z0FWuEwgltpQanVmolvOlShyRRrxHmcbtc7TxvsoUh+AhLFigEZbxYM80VazkbZjSUCo
	pM5HwZBkX0Qr0k1t+7p8qdGJ+zGxXlv13sP17ZewteWEr/63WJKTSymByG6JPqQ6FrbpOI
	gVOtX30VRCgGJiSPvIGhOYhegwJm3Nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777910360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qSAzNf8PDzy8pKcY+/1mlLcEcolTjF57o6GuRUexzQ=;
	b=NU6WOp5WjC+d6M9U5COTO5i0owrYllDWy+DBSlRP7gPq1wt/kaPS1Jzv45ROfpDPjJyCR5
	YP4P9AhOu64WmSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2C5B593A3;
	Mon,  4 May 2026 15:59:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +I9dKljC+GnrNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 May 2026 15:59:20 +0000
Date: Mon, 04 May 2026 17:59:20 +0200
Message-ID: <87mryfw4h3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lucas Poupeau <lucasp.linux@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: ac97: clean up whitespace and move EXPORT_SYMBOLs
In-Reply-To: <20260504153831.18381-1-lucasp.linux@gmail.com>
References: <20260504153831.18381-1-lucasp.linux@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DE0106A807
X-Spam-Level: 

On Mon, 04 May 2026 17:38:31 +0200,
Lucas Poupeau wrote:
> 
> Clean up an unnecessary space in a conditional statement and move
> EXPORT_SYMBOL_GPL(snd_ac97_reset) and EXPORT_SYMBOL(ac97_bus_type)
> to immediately follow their respective definitions.
> 
> This complies with the Linux kernel coding style convention which
> prefers exports to be placed next to the exported symbol for better
> code locality and readability.
> 
> Signed-off-by: Lucas Poupeau <lucasp.linux@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
