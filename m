Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766781;
	b=wbYIk8+1evU6jHGh9Bs19kRxwVhJv33JnQTYBGlQaQyOfClcRN13e9Vyp+cfTzYYW1Ca
	 MetR9nryipfv4NFdXDNH5WQ22EeRqHTbkzyEYAxgdQv6Vgz4eCHLEUXb6KGW+YgeMGGhN
	 lmhTgV56LaQdP0tB0laep6+ftGm0lCYj4BMBIhffAgFUheaRhkE9RS/WC6KTtDDjbeKHO
	 UDFpZqkH1Em8mAoJ98oMORz6TA/aasZc+hUYLx84BecBqxSJg4XjomEjc9pk/o7YsUxnR
	 t4aC6qTm2QXUp2dG+GU8AKKuhAljyxsShjUf9w0W0gGupx0xo3X475JR/JoXauNz/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766781;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=v+0RxMOMDb+hFbTJU6xh2mJjYBoewcE2nCgwfikzGlo=;
	b=ynY6hlgFcA7MvGncM3RchOiBoJbQXDFqZ0XlEO9m1m0syHRC3r2beZc+483+YSdEH98U
	 nY4UkX21A2c3WRrRwFZBE0JJd+KqdWEMkvzu6wBoq/HId/0P5jzrCdYBBmhUNdo0ZQKCb
	 4b8RKqtMN2zJE/5cH7NxAcxqewLZ82BU4/EOxO7Jvb6z5LvSczfTBN1dS9RwXQmQU8alf
	 5KjcaxGdJDuKLepclwKrqKoEaZrO5QOntlKB7N0EnZpJ08PcJyDO52fF9e5lrThBnHMp/
	 oVVxRHy6uKUpz2OsNlfhcuKUGd8G5tiwc1fcocWOV+acsXSvO5XEH36lIt14HrAVU7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D6e03wxc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AuTA9ILn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D6e03wxc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AuTA9ILn;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64E606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A64E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D6e03wxc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AuTA9ILn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D6e03wxc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AuTA9ILn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 61EE81F7B6;
	Fri, 27 Nov 2026 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795766779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+0RxMOMDb+hFbTJU6xh2mJjYBoewcE2nCgwfikzGlo=;
	b=D6e03wxcW2NG9JaG79KpSirBhvFhYlDljfMn1BEfEtmFBKJvbmwHl+3tSX51wtrcQWHnvc
	aImhoES3iADBuhFWPiqNih411nLos3I2/kW2Vq3Jr6+V3KMUg1BQUznQ7BxU5jCgf8p5d/
	r2zdcu4ah7t5S6mvN/G3S7xj4QFvXDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795766779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+0RxMOMDb+hFbTJU6xh2mJjYBoewcE2nCgwfikzGlo=;
	b=AuTA9ILnqyWJJlBkelpQ+Oh9L2uY0xhEycDfDNm/khrhedUcJpRdcvQhM6QJnfMXVouLBd
	wlhKsnAhr1dLxCDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D6e03wxc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AuTA9ILn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795766779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+0RxMOMDb+hFbTJU6xh2mJjYBoewcE2nCgwfikzGlo=;
	b=D6e03wxcW2NG9JaG79KpSirBhvFhYlDljfMn1BEfEtmFBKJvbmwHl+3tSX51wtrcQWHnvc
	aImhoES3iADBuhFWPiqNih411nLos3I2/kW2Vq3Jr6+V3KMUg1BQUznQ7BxU5jCgf8p5d/
	r2zdcu4ah7t5S6mvN/G3S7xj4QFvXDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795766779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+0RxMOMDb+hFbTJU6xh2mJjYBoewcE2nCgwfikzGlo=;
	b=AuTA9ILnqyWJJlBkelpQ+Oh9L2uY0xhEycDfDNm/khrhedUcJpRdcvQhM6QJnfMXVouLBd
	wlhKsnAhr1dLxCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2010B13432;
	Fri, 27 Nov 2026 08:06:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MU+YOfo5CWuuRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Nov 2026 08:06:19 +0000
Date: Fri, 27 Nov 2026 09:06:18 +0100
Message-ID: <8733sm66md.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.4-rc4
In-Reply-To: <20261127024236.91DB03470DDE@traversing.sirena.org.uk>
References: <20261127024236.91DB03470DDE@traversing.sirena.org.uk>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 61EE81F7B6

On Fri, 27 Nov 2026 03:41:45 +0100,
Mark Brown wrote:
> 
> The following changes since commit f66297be665c067d2e96da9ce1c5767b587e17b7:
> 
>   ASoC: tas2781: Avoid possible zero-division (2026-11-19 17:34:26 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.4-rc4
> 
> for you to fetch changes up to b4378764a58960a016a42506992eac86d4d4eaf9:
> 
>   ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22) (2026-11-26 14:59:44 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.4
> 
> A fairly big but mostly routine pile of driver specific fixes and quirks
> for v7.4.  The new Tegra support is the biggest thing here, it's all
> data required by the newly added device, there's no real code in there
> so while it was on the edge of getting applied for v7.5 it seemed fine
> here.

Pulled now.  Thanks.


Takashi
