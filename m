Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30D30C62D
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586523; cv=none; b=SBItuSp51vbHqJZF1euHehYftrDbEXJ3kuFWKHQhDE+JhulnGc9ULRmRi2ypByEztL2xakc0nHGUmBrE1684n2qAzwHa9I4H0REAeyhMwHncb+Wv+AevqH+KC5BgY4yY/cIQ5csREnJ5oXomsOHa/77MHnVzvFjYqGTdX3JNp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586523; c=relaxed/simple;
	bh=RQ4hLi+TacwxV/QmZJsmjymeL8+5AS/LfUeWBJE+4ws=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkzraTAPpgAR4YjnERLUbiIsKjysiIvxs0gpd4FJW6Wdy7GumzAhBAT0jpRAyoOIzZVhssG49SCVZdBMl+Qi5JVYLeuQZsadyg1tGLm6wFGlnXRlrw3QUYI4zHvn2aLl2kD0C1LW+pW9CvAmR1FCqmGw92SyYH6R8C43VD8N+7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZR3zhJeR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ao6tIgX1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZR3zhJeR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ao6tIgX1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZR3zhJeR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ao6tIgX1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZR3zhJeR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ao6tIgX1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64D45683EF;
	Thu,  4 Jun 2026 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTsAb+TsYO8EqTBfY4MK8zKt2wQxn4kAjBXQbZFYrl0=;
	b=ZR3zhJeR1A95McPBTS2ydpJeoLS4MhgS0Zy+er9yngaxDIl+L4de6XDT4ec4GIjfb6BE7x
	HmdVcJQL3fu0cY0pnUAGCCJvMn5XE3Xoo1Cf7jbwnkUENaiiUpF4QPBO1egeynK0sOF5nq
	YK6fPyaNICQsFJG64Q5dUsTTWACreuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTsAb+TsYO8EqTBfY4MK8zKt2wQxn4kAjBXQbZFYrl0=;
	b=Ao6tIgX14txm56ebbqv7x6r1j0U0FzsYx20fRBWU+jo6MzABmmMLzjnHxhgxNkeDAzbBXR
	glsP0/hj43ldNSDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTsAb+TsYO8EqTBfY4MK8zKt2wQxn4kAjBXQbZFYrl0=;
	b=ZR3zhJeR1A95McPBTS2ydpJeoLS4MhgS0Zy+er9yngaxDIl+L4de6XDT4ec4GIjfb6BE7x
	HmdVcJQL3fu0cY0pnUAGCCJvMn5XE3Xoo1Cf7jbwnkUENaiiUpF4QPBO1egeynK0sOF5nq
	YK6fPyaNICQsFJG64Q5dUsTTWACreuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTsAb+TsYO8EqTBfY4MK8zKt2wQxn4kAjBXQbZFYrl0=;
	b=Ao6tIgX14txm56ebbqv7x6r1j0U0FzsYx20fRBWU+jo6MzABmmMLzjnHxhgxNkeDAzbBXR
	glsP0/hj43ldNSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40ABF779A8;
	Thu,  4 Jun 2026 15:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nj+jDhiYIWoeIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 15:22:00 +0000
Date: Thu, 04 Jun 2026 17:21:59 +0200
Message-ID: <87y0guuy94.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.1-rc6
In-Reply-To: <b99a86ce19505d0016af56bcfe4ad81f@kernel.org>
References: <b99a86ce19505d0016af56bcfe4ad81f@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Thu, 04 Jun 2026 16:59:17 +0200,
Mark Brown wrote:
> 
> The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:
> 
>   Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc6
> 
> for you to fetch changes up to d2dcd85f9e09fe3566d4cdcd357856a42ac73f93:
> 
>   ASoC: amd: acp70: add standalone RT721 SoundWire machine (2026-06-04 11:35:06 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.1
> 
> There's only one actual fix here, for the TDM configuration on the
> Freescale SAI controller, everytihng else is DMI quirks for AMD systems.
> One of those is relatively large as it adds a bunch of different structs
> but it's all data.

Pulled now.  Thanks.


Takashi
