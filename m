Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8BE42314B
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770221239; cv=none; b=dfDkrpSSwEKWDE/1VWv5VWgYVCcXYGIAXKycqBtfR9EOcKampNLOYNfWD3k09C9prArTWzURLO5GL94VUprV7rK14bctfBPp6+br16L9z2Ouy/oPdI38DK0nyJ7LB2U/GgSEr/v6c9qwnbbtuGIF1OiBjdvURbgG0i45/ju11G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770221239; c=relaxed/simple;
	bh=yXDSiNAmmoYqI9i85dG+5A2eojt0SXIE2dkLvtAnXvE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qv2nfm5dL/BkiVgN5qKwm5W4D+UVfZ7/9KAAB3ma85R4kOtrlxoryqo8VvTYAGngw50SeLNx8xRXiJhP8ggf8vKBJmecZAVRTddp2Lp8dufkpGGoDcGJFJVskmgD/iMjnY3XAJZ1N5aL7Esk0F295uEr9QT3Vba0NM6xUECIC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T29xDOcw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VRk+n1zS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T29xDOcw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VRk+n1zS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T29xDOcw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VRk+n1zS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T29xDOcw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VRk+n1zS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 18E9B3E754;
	Wed,  4 Feb 2026 16:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770221238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV9RASLqvMw2Xxgu9YaOwuBLcgmHDdPUFpetHXVimPc=;
	b=T29xDOcw/cnLsCPj10CKu8xul+VPNorw6di1q2tGHW85w6KzTkmo96U5Wwz2y7UmTRMdOx
	xVaD5927sdQa2GK9+XNxtu36aNQ6KUs8QzHVUb95lGy0rxQVKhMxGUuBBofLOhijAChyVy
	bD0/P7R1V+5UOmhz9lpEpWc/zfENc9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770221238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV9RASLqvMw2Xxgu9YaOwuBLcgmHDdPUFpetHXVimPc=;
	b=VRk+n1zSk9jIDDXu+2dXgjJC8qOb2Qq1BEdVc4tZBmlOCe8+KKh7RjFq8y4ROc2J/5C7ei
	6lGsbVMKU+f8wcDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770221238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV9RASLqvMw2Xxgu9YaOwuBLcgmHDdPUFpetHXVimPc=;
	b=T29xDOcw/cnLsCPj10CKu8xul+VPNorw6di1q2tGHW85w6KzTkmo96U5Wwz2y7UmTRMdOx
	xVaD5927sdQa2GK9+XNxtu36aNQ6KUs8QzHVUb95lGy0rxQVKhMxGUuBBofLOhijAChyVy
	bD0/P7R1V+5UOmhz9lpEpWc/zfENc9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770221238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MV9RASLqvMw2Xxgu9YaOwuBLcgmHDdPUFpetHXVimPc=;
	b=VRk+n1zSk9jIDDXu+2dXgjJC8qOb2Qq1BEdVc4tZBmlOCe8+KKh7RjFq8y4ROc2J/5C7ei
	6lGsbVMKU+f8wcDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB9603EA63;
	Wed,  4 Feb 2026 16:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UAhzNLVug2keegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Feb 2026 16:07:17 +0000
Date: Wed, 04 Feb 2026 17:07:17 +0100
Message-ID: <87343gebm2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc8
In-Reply-To: <dea287404ba003dd74f4976e9141e0b0@kernel.org>
References: <dea287404ba003dd74f4976e9141e0b0@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 04 Feb 2026 16:54:36 +0100,
Mark Brown wrote:
> 
> The following changes since commit 213c4e51267fd825cd21a08a055450cac7e0b7fb:
> 
>   ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion (2026-01-27 12:45:47 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc8
> 
> for you to fetch changes up to f514248727606b9087bc38a284ff686e0093abf1:
> 
>   ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put() (2026-02-04 11:29:58 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A bunch more small fixes here, plus some more of the constant stream of
> quirks.   The most notable change here is Richard's change to the cs_dsp
> code for the KUnit tests which is relatively large, mostly due to
> boilerplate.  The tests were triggering large numbers of error messages
> as part of verifying that problems with input data are appropriately
> detected which in turn caused runtime issues for the framework due to
> the performance impact of pushing the logging out, while the logging is
> valuable in normal operation it's basically useless while doing tests
> designed to trigger it so rate limiting is an appropriate fix.

Pulled now.  Thanks.


Takashi
