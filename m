Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A16844E04A
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076927; cv=none; b=jm/6FZg8PXr4309/VP6pb8/y9B8BXtvZQePo2SzyUkGPMO0v3nFU24Z3m/PthDSJ8JapwfyMIc5S0V6Pt4wUgotDbTHkrVnQvUGFHNazTALtJAtejDmC2jk7E3rveipG6pCQXCW56eZnvLU3fzmVdmznpKzK3dpPjt4puntrljE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076927; c=relaxed/simple;
	bh=GYi/8rau8QID9F0RMixFHAHkmPzR4Vq34031HLA9o9w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pR70UwB8vJ0Qc1qlQj05vsAfGigQsaX3QsPCltdL3SPqUAh+Amb9+BGyIou5xI6uUpalAfrFkQ/M4OKu/3zw+vj4kk4TUEyXJPtJf2M7kgHAspDrF04KT69OsGF/z+ZO0ZVdD82757kev39qS894Mw4Tnm/IHky0uD9kAZI/LEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UpC/1h4Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/XEQl1rc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZuFYKN1x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X6mXjgUa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UpC/1h4Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/XEQl1rc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZuFYKN1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X6mXjgUa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B539E6B5F6;
	Wed,  6 May 2026 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778076923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P3hgveFw+6av6mvlhRfcu8ucBtZF9w8+O4HhgmFcUh8=;
	b=UpC/1h4YObwBNhlkgDcimEHfx38YxobG5jt1+/oMQ2jnJz2ZWvHxGdciSDbuZyQuujit1s
	GRLSLv0mNq6Zrm4P53IhyCi6CKzvZJxtmmteLjVMP1nsvztpnqcZe18RlrF029++sD80dv
	RIaBkjYmQ8RHZ9yHbtvors3pSk6nA7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778076923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P3hgveFw+6av6mvlhRfcu8ucBtZF9w8+O4HhgmFcUh8=;
	b=/XEQl1rc7hUBLp7MehR/f0ROL3VanMZIGUAQCY0aJfaknCclvGBKbWGT4WsqV+9jRjVE8g
	MGEdVfl24ouO0EDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778076919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P3hgveFw+6av6mvlhRfcu8ucBtZF9w8+O4HhgmFcUh8=;
	b=ZuFYKN1xyRpiirZeFeS2FuEY1IgzmL97OO7LpBOhqsjgzrdKI2jemShsUXzl/MC+QvgV9q
	3DyQLDiYgW8s6MRCEfd4BAZF08PLadREg+xiIE85xPSAapXPR94LGpZ/c5r7CkIG97gk9D
	BOgimqagXx/jZ/pNCdCAcFzU68rDZi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778076919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P3hgveFw+6av6mvlhRfcu8ucBtZF9w8+O4HhgmFcUh8=;
	b=X6mXjgUaapMWro9cYPRgx5wFIW/7CnhGDdN8ZM03FWjr9BgCvlC8U75p4FbAeM4EPF7tHS
	GX09n5wrauTIDFAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F497593A3;
	Wed,  6 May 2026 14:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ahS9IfdM+2kZHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 14:15:19 +0000
Date: Wed, 06 May 2026 16:15:19 +0200
Message-ID: <87a4ucsjyg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.1-rc2
In-Reply-To: <20260506140552.603EF1AC587E@finisterre.sirena.org.uk>
References: <20260506140552.603EF1AC587E@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 06 May 2026 16:05:47 +0200,
Mark Brown wrote:
> 
> The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:
> 
>   Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc2
> 
> for you to fetch changes up to 5776bcdf4dccac8edc1160482792b512da5c08b4:
> 
>   ASoC: cs35l56: Fixes for driver cleanup (2026-05-06 21:22:53 +0900)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.1
> 
> Another batch of fixes, plus a couple of quirks (mostly AMD ones, as has
> been the case recently).  All driver changes, including fixes for the
> KUnit tests for the Cirrus drivers that could cause memory corruption.

Pulled now.  Thanks.


Takashi
