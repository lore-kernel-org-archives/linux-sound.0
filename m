Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006603;
	b=XwyR5WTQrIopK+kRORg9lPbKtzg2L6LNugmhjVtCSfozVBc6FcQSCMacQ4wBtfy6Zei4
	 EeFE48Y8a2zrXC6k6nygwJULBs/hpgmSDi9sGnqLn9RMkDQ2i69JLmsao1Zc2DwMWx43O
	 PgXI5htMbUCZch39e3SrPwH62n1K25M2hpPxey9KD7399OIXaJ6GT41uYbTz3sJxg11Po
	 8pr/I+YlC0nLsun9VNny3byc6Q5XAUnA1j9n6ofzXyJ81YfqkBikkpl02FFLx6ucgpXhP
	 WtdHTsvmHdWzVAuVje6YlMBtXztrhAam+UB0a4S+kTAFpA4YUWuTjlBZ0G0PZuo9qDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006603;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=hS1E52m3GHN2di7JwIjnbczC35GMM/wj7u7IwogqX7k=;
	b=k8rkxHuER3heRno3eJ1KEsP4Z+aJmN9fTc/JTGczC/RdcHGhe4lBP76QcHbMvq1kHNZe
	 05nS28M7ujou0IGBZpRAINY8XE3tax93TMdue7WgWr5Fl0th8nRSddpA5oyB5In6NdrKq
	 rgHwhBkYpuTVJlKtapEWiioI26ieLHQDd6iNnJjs4rt9fDh3LG5Rc5cX6Qz7j5Vp4909M
	 qiqJanqMByl29u/V7+PTIJADjMwCm8iNNu7Yu+LRhLTkwIfvLYonElHFqIaokabgJhKSF
	 I+sQuivkZ/ZgXjmZBMFhF4AirCFTCwg3jIGxeZh0OfQ8oGNoJ3ODe8FcN3GFFBZYS2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U4I9aGRO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GnR+Ikmf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U4I9aGRO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GnR+Ikmf;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2BC606A31C;
	Wed, 18 Nov 2026 12:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U4I9aGRO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GnR+Ikmf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U4I9aGRO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GnR+Ikmf
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E43E1F76B;
	Wed, 18 Nov 2026 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS1E52m3GHN2di7JwIjnbczC35GMM/wj7u7IwogqX7k=;
	b=U4I9aGROWXVQHYdv9gWVDcS73lj0pDJMghyFq2AgD0iuJvr3+0y5DoeNjWFbiwDpJwtp8f
	wMNFfKERXIF+kvCSw8TV3n8EtDl+c+iCVaVvUaDT0fcweiJZi1QVyc/Hk5w54CHbLPHpni
	VnneOq1BDU0wMMqckjf4XbIKyfVz8XU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS1E52m3GHN2di7JwIjnbczC35GMM/wj7u7IwogqX7k=;
	b=GnR+Ikmf1TPD8Re+dxE/kCuHy89GiJ62U9PLcWGDTWtzpOV5z9pPh9D3hfh6Zi9aKuP9bI
	kkYpk0x27BJvlHCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS1E52m3GHN2di7JwIjnbczC35GMM/wj7u7IwogqX7k=;
	b=U4I9aGROWXVQHYdv9gWVDcS73lj0pDJMghyFq2AgD0iuJvr3+0y5DoeNjWFbiwDpJwtp8f
	wMNFfKERXIF+kvCSw8TV3n8EtDl+c+iCVaVvUaDT0fcweiJZi1QVyc/Hk5w54CHbLPHpni
	VnneOq1BDU0wMMqckjf4XbIKyfVz8XU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS1E52m3GHN2di7JwIjnbczC35GMM/wj7u7IwogqX7k=;
	b=GnR+Ikmf1TPD8Re+dxE/kCuHy89GiJ62U9PLcWGDTWtzpOV5z9pPh9D3hfh6Zi9aKuP9bI
	kkYpk0x27BJvlHCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09A4D134E9;
	Wed, 18 Nov 2026 12:56:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yiu7NIig/WqaWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:56:41 +0000
Date: Wed, 18 Nov 2026 13:56:40 +0100
Message-ID: <87qzgiwb5j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shredrum <alex0plays007@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix quiet speakers on HP 250 G6
In-Reply-To: <20261118033901.322505-1-zhangheng@kylinos.cn>
References: <20261118033901.322505-1-zhangheng@kylinos.cn>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Wed, 18 Nov 2026 04:39:01 +0100,
Zhang Heng wrote:
> 
> The HP 250 G6 (ALC3227, subsystem 103c:832e) has much quieter internal
> speakers than on Windows. The Windows driver writes coef 0x6d = 0x0900
> and four EQ coefficients framed by 0x22 writes, while Linux leaves the
> high nibble of 0x6d at its hardware default (0xe900) and never writes
> the EQ coefficients. Add a fixup to apply the same coefficients on init.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222283
> Tested-by: Shredrum <alex0plays007@gmail.com>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
