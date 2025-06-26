Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DFE1A0BF1
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917640; cv=none; b=jvCIpw83SprnoOJ4+tiA3EQm1OkV6su3YIunhzvPu9qRpLspt64EkXbMaMDkZRp2PUjW0ZwE/L5TZCLLlRQfeDYe5XXNlSq5uT9s5x1pcF9OOK/153YP4Mvy9FSR4kNtj83qrBJKsXRVxPpM6V+gPJN0fsuAlQVGyG3bZPhnQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917640; c=relaxed/simple;
	bh=kt8S1AwRVp2f2Q7HzwOBSEqicSROuvwWzZwUUdwCpoM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qUioHp5+FqiAA08fQaA6KPmN7YitEqnfqFhf/2sJn1PgI4mVToMvgUlgiZ7h6qmbjluVwWyQoppFODbBGmCP9nKn/LhA3JKnxxNgSt65OZNSyeu371+P69pSwa7SseeooJuELBxnZ+Scbs6CZvPtB7g7O1p8gKv7OwXOmOnlCy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XZVR+Uou; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2kfKKdqw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2MJkZ0nm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S2mDMiTo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XZVR+Uou";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2kfKKdqw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2MJkZ0nm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S2mDMiTo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5CBFE1F441;
	Thu, 26 Jun 2025 06:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750917635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=XZVR+UouBh/liivfC3lf3DR47rqfOZXZzeZtaVankrfziSAORaw6yf2LCde+C1/STK5y0q
	AA9Tq6kFs0GJQIjBFZHc5jBsK5jk395BfOFwW/Na9ZzEXbIvQdR31GxGt9fkKzwAGr7v19
	Pzz7PhlPatCWQ7s4Chtzic7yngKlpAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750917635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=2kfKKdqwHDH83z9mhLC11Dal1BJTo8yQwZ3rRwvZsNa3xR9aH5vpzrU5peB+p599eYq4JB
	f5WuibcKs9kPYmBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2MJkZ0nm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S2mDMiTo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750917634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=2MJkZ0nm/tWUdhUUgpcb4ZoOTu7/JyVtM2ES2thgf4PlO+nwvH8PmyKVwLawH7js8/mxds
	PfcIiYL5RoiaqqeO8NfRrjkHlq1d2TWvKYk6tQNSG7VghnWszG0qSDxLNw7Djdj0OjaTtS
	dChw8ZcyefrjTEDGn9HrWZlfTX+BEGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750917634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q8QIzfyUARkcqlvcPaQ0iw0lpqqWetSOtoj4xBjSsI=;
	b=S2mDMiToDmHDZgTEOlH+dDu40ceaArSuj40AkLym8HWK1VWBgayIF+l4GHbratfgu4wtdN
	393gO55XQm1/5HCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3657B138A7;
	Thu, 26 Jun 2025 06:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kBWXCwLiXGjyEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Jun 2025 06:00:34 +0000
Date: Thu, 26 Jun 2025 08:00:33 +0200
Message-ID: <8734bnhwji.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc3
In-Reply-To: <053302a805a2cc9f35f96bcf6e29c640.broonie@kernel.org>
References: <053302a805a2cc9f35f96bcf6e29c640.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5CBFE1F441
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Wed, 25 Jun 2025 20:52:55 +0200,
Mark Brown wrote:
> 
> The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:
> 
>   Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc3
> 
> for you to fetch changes up to 6c038b58a2dc5a008c7e7a1297f5aaa4deaaaa7e:
> 
>   ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak. (2025-06-24 16:39:42 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A small collection of fixes, the main one being a fix for resume from
> hibernation on AMD systems, plus a few new quirk entries for AMD
> systems.

Pulled now.  Thanks.


Takashi
