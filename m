Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566143D1CC1
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413194; cv=none; b=AxTozwfFferWaLX7+EK0LDMVs8gKwb0IaQ3uPC7b7wDrAfIVbCD1FvX8sQ8tZVn/+UPuLJnv3QbWKHJRYcH4sYtC7mBSObJ23LSJkPsO1Zqi0ftGogxHuNnCQ5qw7O3hQk6esEpTYnCpOvW7jEQGjW0o078G1mWPFWu4lZF/9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413194; c=relaxed/simple;
	bh=39mfrrpfYdFv4mNaGGv6I1NIPYSXv2dHfa/zMKTuNTs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCqu9cIm/mFVQiUGg5Nh3Afc1N1kcda5W6fvotzWNRJ5KbKRPglfuntXl7zgTvzrgNINL+HP33tXCmzcgxpaNKvmMiYGfuHDkHIDnqAqItIgWRARWQ9T+bBD7QTTEH/iPJy1PU8LEa5zwMZfoCvCkor/HQzZaOKowhEEyKWaH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LjB0PdZ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=awZhKw2m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KMVH2/2Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fz0584Yb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LjB0PdZ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="awZhKw2m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KMVH2/2Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fz0584Yb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48AC54044;
	Thu, 30 Jul 2026 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785413187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uies+4fiZtJGLP+ytvUX5c7RGybkh/5ohePC6REuE/0=;
	b=LjB0PdZ52gOoV9QV6X65WnZhCU1XnoePl7qZdaHNSuzYdE/MczVNWv8hd4IPlNbzLfkR74
	5II3HOAUkBHSKcPx1kU5HDpUQ+Z02BWwXrswt7YmOP5IfQihdzOxh7u2CwJWnjkkJPV4YV
	5BV8stZ3QCaq7RCD2MVpTpm3f4gq+wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785413187;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uies+4fiZtJGLP+ytvUX5c7RGybkh/5ohePC6REuE/0=;
	b=awZhKw2m4hyGf7YX8tP3FeAUJI4++lqvth8nqCuTNiF6JEyyg+YzTkcAPwwyq1IjxnuFh1
	sVGQY1qoV5TV1QBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785413183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uies+4fiZtJGLP+ytvUX5c7RGybkh/5ohePC6REuE/0=;
	b=KMVH2/2YYBY9BlogjzdGJ3nK46qG3CbvDrPTwHdpPKBPQmq82BW862VmbcYkmTYspMtj8p
	RRKHv5MRmRnJGQJDMfSXJFLFDe790XwyyxyrFBnIqQhxn7AWooSc6zs9ec1rIMtCQgYvJ9
	a3Yu+ZhY7Cf/LF5Jj6fv4fVLHhbipGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785413183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uies+4fiZtJGLP+ytvUX5c7RGybkh/5ohePC6REuE/0=;
	b=fz0584Yb2Cei/Ieo9lvJVLZ26jRQ5l0/eU2b6qrLSd5/gfcbT1x4mGEhILc/j8EIb1qqpG
	tOcRb7c8uoiO8zDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 211E8779D0;
	Thu, 30 Jul 2026 12:06:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ShnZBj8+a2oREwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 12:06:23 +0000
Date: Thu, 30 Jul 2026 14:06:22 +0200
Message-ID: <87cxw43cn5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc5
In-Reply-To: <036cc4fbb2a3c0ffc45ac4373f6f5c9e@kernel.org>
References: <036cc4fbb2a3c0ffc45ac4373f6f5c9e@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Thu, 30 Jul 2026 13:49:18 +0200,
Mark Brown wrote:
> 
> The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:
> 
>   Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-rc5
> 
> for you to fetch changes up to d0ecbedd6a70f2fe768d46de740265dc8a4424e3:
> 
>   ASoC: rt722: reset codec to fix abnormal sound (2026-07-29 23:27:37 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> This is a relatively large set of updates, the biggest batch of things
> is Charles' fixes for the SDCA code which have been through a number of
> iterations on the list and deal with a bunch of issues that have been
> seen as we get more real world usage of SDCA.  We also have the usual
> device specific fix and quirk traffic that we tend to see, there's a
> small pile of fixes for the tas2562 driver since I saw some bugs while
> reviewing fixes sent by Haidar Lee but it's nothing too remarkable.

Pulled now.  Thanks.


Takashi
