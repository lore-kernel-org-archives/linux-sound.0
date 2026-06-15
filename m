Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAC3093B5
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781548516; cv=none; b=DN/tCyIrjOmhuwYKqWdJvUR4W7FMPC96bKFr2PjGfKVGyX0cyowk09wAvTuP/oYhAJcc2uuQgO+cIS/19AnPOTzb981vp8/YVFRdWcZ/mirBculdo6BtFOW94OMn6fUZ+6g4KMmqDe+CRyqT2ocE0PzEEhG1emZ/y3sz/zATIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781548516; c=relaxed/simple;
	bh=ApRAvi7Nywv2gqyuY6pOh3b7XUek4mBjIND9Zi9Pnw4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJcXEWLw2llNeR8n6Z8MeFLcCoBtt3+zCrKCYk+HYgZvCVERk+CLltBJa8zooanFcWLCUem84SHlI9Sn5MOh+gHkvtRrVSnrZGGmAoymxuL0DTc6wSyXjd0rfnh9ur6wx6LAbBtYqr2WdhMeFrUlfWCAGUQRZN0phzR0UEXQc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fK8nE3Rk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SxbjfsZ8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fK8nE3Rk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SxbjfsZ8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fK8nE3Rk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SxbjfsZ8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fK8nE3Rk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SxbjfsZ8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCECA6AEC4;
	Mon, 15 Jun 2026 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781548512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okFSlXFrgGUn7DCyrUClTuTmJWMYurc5ucqR0mwgRt0=;
	b=fK8nE3RkiaayALf4Wp+iE/KPWZxCj7Ob2107D8ZhNcvrAeCUYwueOTG45tX9Gy+7m9SOHC
	5q0oEUq4HbNe5zHC6yu8HQ54VqagMJDwIFAuE7tkiNrgC8Wvr+2GgtyGLP+vGaWEeaKLj9
	z0aYQCEZnXvHFR845kFRh77A8OH6SK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781548512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okFSlXFrgGUn7DCyrUClTuTmJWMYurc5ucqR0mwgRt0=;
	b=SxbjfsZ8W9nVrNQem7MFIkdnhekEm6zNTBFuiQ0fklrXgWnut8TDQ+M4IuOKnkE/0JVqv8
	SaOSWWyOYnst5QDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781548512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okFSlXFrgGUn7DCyrUClTuTmJWMYurc5ucqR0mwgRt0=;
	b=fK8nE3RkiaayALf4Wp+iE/KPWZxCj7Ob2107D8ZhNcvrAeCUYwueOTG45tX9Gy+7m9SOHC
	5q0oEUq4HbNe5zHC6yu8HQ54VqagMJDwIFAuE7tkiNrgC8Wvr+2GgtyGLP+vGaWEeaKLj9
	z0aYQCEZnXvHFR845kFRh77A8OH6SK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781548512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=okFSlXFrgGUn7DCyrUClTuTmJWMYurc5ucqR0mwgRt0=;
	b=SxbjfsZ8W9nVrNQem7MFIkdnhekEm6zNTBFuiQ0fklrXgWnut8TDQ+M4IuOKnkE/0JVqv8
	SaOSWWyOYnst5QDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CD10779A7;
	Mon, 15 Jun 2026 18:35:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cnyeJOBFMGqGYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jun 2026 18:35:12 +0000
Date: Mon, 15 Jun 2026 20:35:12 +0200
Message-ID: <87a4svslcv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v7.2
In-Reply-To: <ade83b6e856043bf84685b229f85a4d4@kernel.org>
References: <ade83b6e856043bf84685b229f85a4d4@kernel.org>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 15 Jun 2026 19:04:15 +0200,
Mark Brown wrote:
> 
> The following changes since commit 310628484ef06f95c5589374fade917a5689787b:
> 
>   spi: rzv2h-rspi: Fix SPDR read access width for 16-bit RX (2026-06-10 16:39:13 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v7.2
> 
> for you to fetch changes up to 4346d91cfa47b0d9303533edde8acd33e4b9ca40:
> 
>   ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type (2026-06-14 01:03:38 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v7.2
> 
> There's been quite a lot of framework improvements this time around,
> though mainly cleanups and robustness rather than user visible features.
> The same pattern is seen with a lot of the driver work that's going on,
> there are new features but a huge proportion of this is bug fixing and
> cleanup work.  We also have a good selectio of new device support.
> 
>  - Improvements to SDCA jack handling from Charles Keepax.
>  - Use of device links to make suspend handling more robust from Richard
>    Fitzgerald.
>  - Use of a new helper to factor out a common pattern in SoundWire
>    enmeration from Charles Keepax.
>  - Slimming down of the component from Kuninori Morimoto.
>  - Simplification of format auto selection from Kuninori Morimoto.
>  - Lots of conversions to guard() from Bui Duc Phuc.
>  - Addition of a simple-amplifier driver supporting more featureful GPIO
>    controller amplifiers than the previous basic driver from Herve
>    Codina.
>  - Support for AMD ACP 7.x, Cirrus Logic CS42448/CS42888, Everest Semi
>    ES9356, Mediatek MT2701 and MT8196, Renesas RZ/G3E, Spacemit K3,
>    Texas Instruments TAC5xx2 and TAS67524.

Pulled now.  Thanks.


Takashi
