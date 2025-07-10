Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FAB1EF39F
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141600; cv=none; b=id2iWk298N8CnO0WiiOAi8dJLYvVMRSAxjJV6w9YKPHU9GX1GCsMYfl5/4+Pqm7s/JxMsOhYeIRyW3WVmsLAn37tn/cfMh6RexXa0vojFGf4AdrZJT6f76oPT3RYKwILcDqP74aMirBhHr0arUz9TVUf7zQzjYYyYVQZAh2Dm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141600; c=relaxed/simple;
	bh=TtLlzQqd5tZvNnxw3qyfQUR7Ez3lkqF6UaW2GqdHwAU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjCe/EDrZrOdVnFAq14YafJb5Rm4KtweaSgm3uQvJ9HNh8N8o+ASktAzQX2lXRmpoEWe56BpZmMVbmU3csQ5AoYj657U0gd+ZCDulPxqU2aGIESH7FU+Z+/IH05srY3SvOeVAlUB/pzdYiWh9QQTwyiJl9naxqm0H/UXn3wRChE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZCaEufIS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MAPAj1p7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZCaEufIS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MAPAj1p7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCaEufIS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MAPAj1p7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZCaEufIS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MAPAj1p7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2498F1F453;
	Thu, 10 Jul 2025 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752141596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4daigcXA6tja+Mm6/mzxvC5Qfz85uJL8Hw8olTbMzBw=;
	b=ZCaEufISCMWZSNfeuv9eJs5WFe4jDTrnMj5PM9knCLBjFgh+m7qU7AuDHon3Ylk2mpd+lH
	JQkS/PxXqgs8rFBasf5qwKS3AkGGMe2ihybjt2toMjThQwL1BKjszfT45oT8skb4jwxfPb
	vAH4RuO9gvZ29qSc38Saq6QVtm5tUFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752141596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4daigcXA6tja+Mm6/mzxvC5Qfz85uJL8Hw8olTbMzBw=;
	b=MAPAj1p7p0iU/iQ1n9iGMYvHNeaktwLoKgBU5LoTT3AwxXEfoTqFiXe6QF87sUMz1WChDc
	Oaif5FhGY5k73nDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZCaEufIS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MAPAj1p7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752141596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4daigcXA6tja+Mm6/mzxvC5Qfz85uJL8Hw8olTbMzBw=;
	b=ZCaEufISCMWZSNfeuv9eJs5WFe4jDTrnMj5PM9knCLBjFgh+m7qU7AuDHon3Ylk2mpd+lH
	JQkS/PxXqgs8rFBasf5qwKS3AkGGMe2ihybjt2toMjThQwL1BKjszfT45oT8skb4jwxfPb
	vAH4RuO9gvZ29qSc38Saq6QVtm5tUFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752141596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4daigcXA6tja+Mm6/mzxvC5Qfz85uJL8Hw8olTbMzBw=;
	b=MAPAj1p7p0iU/iQ1n9iGMYvHNeaktwLoKgBU5LoTT3AwxXEfoTqFiXe6QF87sUMz1WChDc
	Oaif5FhGY5k73nDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 020FD136DC;
	Thu, 10 Jul 2025 09:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 453sOhuPb2jyVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 09:59:55 +0000
Date: Thu, 10 Jul 2025 11:59:55 +0200
Message-ID: <87bjpsxt5w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc5
In-Reply-To: <cb13b10edfb1dac2bb7bee3d2f50f44c.broonie@kernel.org>
References: <cb13b10edfb1dac2bb7bee3d2f50f44c.broonie@kernel.org>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2498F1F453
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Thu, 10 Jul 2025 10:53:07 +0200,
Mark Brown wrote:
> 
> The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:
> 
>   ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc5
> 
> for you to fetch changes up to a609bd74b8680dba62c44f7e6d00d381ddb2d3c0:
> 
>   ASoC: Intel: avs: Fix NULL ptr deref on rmmod (2025-07-08 14:54:40 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> Two patches here, one quirk for an AMD system and a fix for an issue on
> remove of the AVS driver.

Pulled now.  Thanks.


Takashi
