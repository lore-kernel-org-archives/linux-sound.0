Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF41F03C1
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596771; cv=none; b=EaRj/+Ztr81ORAMC+KxTY3HD1SIMyn92WibRO0KTk+lYczDGqefqYOeM6qIrLuifrw8XIraeriRhextDWtHvB7gioFKT6y9K55ulz4zE1Ek1CtG9o3Ji3utUhJiYcyFgvWYpMW87N3yrhphUtJpaAeTrbDTDrkUQCBY1gDFAXqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596771; c=relaxed/simple;
	bh=8mbq71kLiqdKyJBRwS8lYRCek/7qvNIUsxCaOWNhkfk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXwf2r+ToWdJubYhQMcGyVB+CeE759ctW7iRKMAcUGIS4IwX7kwU3W+ETpvVftuZJATTVbnyVQky0L/0c4olFEINIOOkppD3T8SJUXdA2it4lCceVh+Jnxxz1sWosTmum5Mg56J5cM53pnTJvzXjj3RSD6CTWZWa/f82JoRELaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0QZnIfuA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pwpmUrWq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CHuMwQ9U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FH8Tjapj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0QZnIfuA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pwpmUrWq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CHuMwQ9U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FH8Tjapj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2AF8421169;
	Wed,  2 Apr 2025 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743596768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYQTi/V+e2H/ubwWqfyTAXW6/bgPhTRTIBx6bigqHvc=;
	b=0QZnIfuA/icANKOlQMK9ZApasK9gZFkKokpJQUulDofDZJkz1nPbdXx/I2rG0jZfUc34qM
	ZSQ+dUN1c4tN492DX6p4JHhbnUKYFcD4nGUZMlytX1o7EtGX7onDQ5CztRYoeKycM9RDb7
	H0cjr6nStEInLqX5M2TpJqz1emo9pYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743596768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYQTi/V+e2H/ubwWqfyTAXW6/bgPhTRTIBx6bigqHvc=;
	b=pwpmUrWqCXiwK4WeBBlVwsn0lvBoi7TkEdNCouybV5AUY3s3k+gM2zTsQc35S5YPWO6hBU
	oxsaG7gAKjocZyCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CHuMwQ9U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FH8Tjapj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743596767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYQTi/V+e2H/ubwWqfyTAXW6/bgPhTRTIBx6bigqHvc=;
	b=CHuMwQ9U9K9SqnnykuT7bWDiQW0vJKBXzQ/A0DYV9tdIZ76tQDqWU5bEi9pbzq7+S3hSWW
	86P5oT3+apM0hZHICc0ODPpz0YVZO4kfxFgokS1KC5+sJHrSEvwkX7HF+u5dMQY+v1eLRI
	AgmyUH4p+07uT/r5lnBUV6/ZzkzZsVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743596767;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYQTi/V+e2H/ubwWqfyTAXW6/bgPhTRTIBx6bigqHvc=;
	b=FH8Tjapjaf4F+m8E60Z84u+mRaxQEkgWOh4M6FbOEGaZNqwlAtVjYgKWtQXwMdjXFfMxUn
	hHxTmIRM8ne8slAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 081BD137D4;
	Wed,  2 Apr 2025 12:26:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AETEAN8s7WewfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 12:26:07 +0000
Date: Wed, 02 Apr 2025 14:26:06 +0200
Message-ID: <87bjteyckh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-merge-window
In-Reply-To: <fb75f883b177ba9e2505680fb1c45b9d.broonie@kernel.org>
References: <fb75f883b177ba9e2505680fb1c45b9d.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2AF8421169
X-Spam-Score: -3.51
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Apr 2025 13:59:36 +0200,
Mark Brown wrote:
> 
> The following changes since commit 9ef52d529bb75071e03cf85078f724d69c4abe89:
> 
>   ASoC: SDCA: Correct handling of selected mode DisCo property (2025-03-21 15:45:25 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-merge-window
> 
> for you to fetch changes up to 93d34608fd162f725172e780b1c60cc93a920719:
> 
>   ASoC: imx-card: Add NULL check in imx_card_probe() (2025-04-01 17:01:10 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A relatively large set of fixes that came in since the release, mostly
> for Qualcomm platforms.  The biggest block of fixes is the set from
> Srini which fixes various quality and glitching issues on AudioReach
> systems.

Thanks, pulled now.


Takashi
