Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A214B5AE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578495; cv=none; b=eOTbY8inyn/U3wXWNlc06J77aldaCziEg2N5hbCm8zl7MIbnAfm/yV5njyLp0zgPycPgeQB8R2ZuEz1VtyW/Hx1SCzYKI42ZV6feqQK+WqDcUtYXfEosBasfTvA3MUTRtxKMdjRGZM2x8xELcv9B6Er4JkaDi/nBMcDCvwZsywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578495; c=relaxed/simple;
	bh=vGtG3Xj6OTTgJNRnUx51vwJ6ar8tEyKW/zQSTELPtiI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PACENErHDc1qS2UH7eaAWG1I6xRGKtWONF4+hs8Mr1hcts1u1icqtBKYn33C8HX9G9YAZRhcVr8bG1czJ20cXzo5HNGbFsnGD8Q8pSYawNH1linFuJWrL4zITViAW7SIfTO7Fk9BEOsk65r/Pd5BQ4KYkRujLNM1MZA3AVEH5Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LJTzm91s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmMGuhp3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EfQvHbmb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=afbI9cAF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LJTzm91s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmMGuhp3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EfQvHbmb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="afbI9cAF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EF54A21170;
	Wed, 26 Feb 2025 14:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740578492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwxu0MXBuD9Mqd9aCuVvWjdS/V3foYvAimw90gqFadg=;
	b=LJTzm91sfwajW0PynBIl+X1SrPnEvqhJ2rn9RWkCF4X6lHhUWKPFxJxSmkQIC+CNUSxBNG
	oGy6P9rqRlKsIQAivni9Hwo55YkNRMCWPUmjCZHCXh/WqIHfUCmyyV/Suws60rsFuCWp/M
	sl7HdCXIAkog03DLG5+CxZTmeCOH7sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740578492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwxu0MXBuD9Mqd9aCuVvWjdS/V3foYvAimw90gqFadg=;
	b=NmMGuhp3wOqyiufszbATGl7ahOrKJQOfhceqMQvy2aj9A079VrAZ80Kfn8NNvthJqf52L/
	cmGLR2mhn4P1UzAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EfQvHbmb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=afbI9cAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740578491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwxu0MXBuD9Mqd9aCuVvWjdS/V3foYvAimw90gqFadg=;
	b=EfQvHbmbLZ+vDIfwJbRrZQPu5kX+LoeUrIHnbuHEa0wUKFyBc8i8LhPF+0zt3CPt5r45ll
	vNCppURaqAAwVfw3CKRtuU8xs9SW8Rtvd007eLnnj7m1EarpQvFaG3noMIoOfz9PhNGL27
	Qbm7WbEorQwbj4V/wH/pzH5jmKg1ph4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740578491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwxu0MXBuD9Mqd9aCuVvWjdS/V3foYvAimw90gqFadg=;
	b=afbI9cAFK3g4diOGEWBrcBq/pXRlnwBAxI/8XN5YpM6q9zKFPhjEPPCHw5goxl4MDgcOOs
	0rrgv3pIHfyMBLCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC39713A53;
	Wed, 26 Feb 2025 14:01:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UcgfNbsev2fTOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Feb 2025 14:01:31 +0000
Date: Wed, 26 Feb 2025 15:01:27 +0100
Message-ID: <87mse84xfs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc4
In-Reply-To: <7ff673840a72f27faae049d16ea12029.broonie@kernel.org>
References: <7ff673840a72f27faae049d16ea12029.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: EF54A21170
X-Spam-Level: 
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 26 Feb 2025 13:45:14 +0100,
Mark Brown wrote:
> 
> The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:
> 
>   ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc4
> 
> for you to fetch changes up to 9da0ed4a85027063441fa1c73967cafc38f0677c:
> 
>   ASoC: Intel: don't check number of sdw links when set (2025-02-25 17:47:04 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> More driver specific fixes, the firmware change is part of fixing the
> race conditions in the Cirrus driver.

Pulled now.  Thanks.


Takashi
