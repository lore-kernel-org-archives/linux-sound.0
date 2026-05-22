Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E17392825
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437023; cv=none; b=rUka0iix9vYdVsx8+Pm7Ob9IOUKOIKhdQcyz/8jL6bYPEk+HKfV7QE6+rzQBCQ7aG6n6VHXZewrTj4j4eVhc2c96e85vDaO9pIF9Ud7mTEpucRYU+32F9ttpZR14UGHKe5a0bnR7yoYpQiGSocH5SSJOPzDMAeQtIYMzCBq+EBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437023; c=relaxed/simple;
	bh=FG36n5rI8ytB4pzPFcI60c/5FReybSIcQ8cI/amvm2U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBbsKL8ZKQKBNWnqpy57JK9ocJYjWeJu1QqdNWYuQNOih9ewUcxCSpcXdtZmu598aRSGD4iPhq3bNGD5UPfr16TjiqGJXWME+7YKJHaTQdIFVNLijR8L30kDtIZcdqw+JLxUHvvvOEaupRUvsorg5Dv/u2JbS5v8t17B3K0ltq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u9iQAyNC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CdO+KYKZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DVFvC7Z5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V7DOtVEi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u9iQAyNC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CdO+KYKZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DVFvC7Z5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V7DOtVEi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AFEC6794F;
	Fri, 22 May 2026 08:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779437018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84cc6ARVjkJIeKL/WhtsX0tQyERjYN9aPbPG3YOx/I8=;
	b=u9iQAyNCNqGVbFD7Zr/aoVdpW8aqDJ08pmBBr73S6OQIOOf+y5a4YLSGcWqZ3c+WYDsTLD
	7FMUiZOeObsfTn/MKU22U3GVQy1U/p9SLFwRYRq3+uaXNhgGqpGnAB4aHGxlggYPp2YRJL
	+kl/jAt4antX1DJT6/dGm1oYXxZ6K3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779437018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84cc6ARVjkJIeKL/WhtsX0tQyERjYN9aPbPG3YOx/I8=;
	b=CdO+KYKZj0pifFETQL50YeIQHkw1Py+gFBLJZpHMwNotRD4jxBv4cSiGIThERJiipKz/HC
	jBuKstOnZK1I2IAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779437017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84cc6ARVjkJIeKL/WhtsX0tQyERjYN9aPbPG3YOx/I8=;
	b=DVFvC7Z5pZFgUwblwkm4d1woj4qnz5nlJreQDiX9AQGzXpn68hQwla9S9enSNnctMWGbBy
	ugeGVXRWn7+UCx7oeq7j5HKEPTyEPhl9krTBfZ3Y6cHV2F/J9IahCwxi08ioyO5Oy9uGWy
	fg738+BLyS10dT18tdskf6Ybh0lheFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779437017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84cc6ARVjkJIeKL/WhtsX0tQyERjYN9aPbPG3YOx/I8=;
	b=V7DOtVEiGsmW1Dt/6eHRE/4dMK1w+UBXgkF2jnScFyVfq1xNdixe7AoxF3TOc6x9M0j3dC
	GUK3XTYr6MJJVICw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76601593A8;
	Fri, 22 May 2026 08:03:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P0G7G9kNEGr2bQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 May 2026 08:03:37 +0000
Date: Fri, 22 May 2026 10:03:37 +0200
Message-ID: <87o6i7j2g6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.1-rc4
In-Reply-To: <330b62a00eb5358e06742f419308fa7e@kernel.org>
References: <330b62a00eb5358e06742f419308fa7e@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 22 May 2026 01:22:11 +0200,
Mark Brown wrote:
> 
> The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:
> 
>   Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc4
> 
> for you to fetch changes up to 09e8f9a9aa19aa8c1b0cc7a0ebc68f6ecf86a660:
> 
>   ASoC: codecs: pcm512x: fix null-ptr dereference in pcm512x_overclock_xxx_put() (2026-05-21 19:28:24 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.1
> 
> A bigger batch of fixes than usual due to -next not happeing last week,
> this is mostly stuff for laptops - a lot of quirks and small fixes,
> mainly for x86 and SoundWire.  Nothing too big or exciting individually,
> just two week's worth.

Pulled now.  Thanks.


Takashi
 
