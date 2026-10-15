Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82F483BE1
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077489; cv=none; b=lVcpjaEzOnzuU61Tio7jGhXmnIuhdtrFXtWPIGv/7htFOuCAKZUMv9bLG/+6phiSWFKogbsBkHly4br8e5DjqhJ5SzYrG4ZRbwN1Dxo5YEX0kaE1ynLnCahvfwK32xlDlziY62P0TXfPZIKsbjQVmTFBZHhUlRv/PW/eGzQ6UM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077489; c=relaxed/simple;
	bh=mITcLME8QrCkaVocHYuqBS9Lza3cEgTwRwuIm2BoJ5c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4UIzRYRlBT4l0/Cy+y6YHRfRkf8JStz7TJ8qAFyll7OH1YDpLngb2ldUoPhDjv9ARaCZQ3rJIa7hBCshEFp6k+mp+5qHAypycFk7aaarVgIlr9FsoKTiiCzkLkzuyIc4+0CXn9K/1JUFcxl+wzWtey7rQga7T4p8tzqCuIgWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wuz7d0gW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMqki1gw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wuz7d0gW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YMqki1gw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wuz7d0gW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMqki1gw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wuz7d0gW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YMqki1gw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4EED1F86C;
	Thu, 15 Oct 2026 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792077485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpT89qE6ibgw5hVmLJgOu0WmGnwDzjP7tOfFmQ4hfGA=;
	b=Wuz7d0gWYsRElW5xCwl8oXS5WzRnL3urUnA9oMY9hw4ucKmL12ahB7QhUs2/a+1Tt/KNFf
	O+2zFsgQvJPe9Y772XbiNCwGHEtioVqw7rLBJ8qyHkfwGfqCA8r1T0P+vOoyZmS0IRzLCq
	biBj2tMGPQXkqDO06tclyYpZvhrkMoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792077485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpT89qE6ibgw5hVmLJgOu0WmGnwDzjP7tOfFmQ4hfGA=;
	b=YMqki1gwB+pcANEZx7DTQjaUtOOQwZ0G0VUNbKcpGMFOh44FrO5GXaPZOMRHdFfBuHuksR
	tXJAsmngYFI3McDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792077485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpT89qE6ibgw5hVmLJgOu0WmGnwDzjP7tOfFmQ4hfGA=;
	b=Wuz7d0gWYsRElW5xCwl8oXS5WzRnL3urUnA9oMY9hw4ucKmL12ahB7QhUs2/a+1Tt/KNFf
	O+2zFsgQvJPe9Y772XbiNCwGHEtioVqw7rLBJ8qyHkfwGfqCA8r1T0P+vOoyZmS0IRzLCq
	biBj2tMGPQXkqDO06tclyYpZvhrkMoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792077485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpT89qE6ibgw5hVmLJgOu0WmGnwDzjP7tOfFmQ4hfGA=;
	b=YMqki1gwB+pcANEZx7DTQjaUtOOQwZ0G0VUNbKcpGMFOh44FrO5GXaPZOMRHdFfBuHuksR
	tXJAsmngYFI3McDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84DC513223;
	Thu, 15 Oct 2026 15:18:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mX8tFq3u0GoFRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 15:18:05 +0000
Date: Thu, 15 Oct 2026 17:18:03 +0200
Message-ID: <87qzhr6lhw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc7
In-Reply-To: <bdcee80ff1b48cbbcfacaa3eb404fbca@kernel.org>
References: <bdcee80ff1b48cbbcfacaa3eb404fbca@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 15 Oct 2026 15:09:26 +0200,
Mark Brown wrote:
> 
> The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:
> 
>   Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc7
> 
> for you to fetch changes up to 2a31b5378c6db9c4a8d399e5d10d32cd4b732bef:
> 
>   ASoC: amd: yc: disable MSI on resume (2026-10-13 14:32:22 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.3
> 
> There's a relatively large block of fixes for errors in register field
> definitions here, resulting from an audit done after review of a prior
> series.  The fixes themselves are very small and can be directly checked
> against the datasheets.  Other than that we've got some driver specific
> fixes, the AMD fix is a little large but fixes a clear issue and won't
> affect other systems.

Pulled now.  Thanks.


Takashi
