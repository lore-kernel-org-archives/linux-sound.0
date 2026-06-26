Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7DC379EE8
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471819; cv=none; b=jJUOkXSL+SZzpgmxIUDl2XCvrlEe7ETGHsz+Y4zcdXE6XImPh5T/x8LN0pYNY3MYzUKUXV1W6iXEbZyr6V3lUqEU7iui3wvUxqJ07qR273+4qnU7LwA9n8iJEm1Vd1Vncqowk4H0Sr+svug8KLp8bd07K953cdUksk8iHAGk5BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471819; c=relaxed/simple;
	bh=EzRQM6OI2kppfwj8kWMT2isITc9GVWsvpHmLQyd6QX4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PzQZ1NqZni9H2KP9da63J4O6AR+GJA+p8B/xaHkNq1pjZDVI3uQxtnvVH/N9rp/Xxa/HauTSllEggF0/fE9Upb6jnaVgqTrsd5vEQcSvdFxfAkk2hFODmURT8KfAvhhkBVtU3vR6ALhgxsYwNK4txL0+6fQosF3+3GlyEkJzAWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JvOeDnui; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PxqVVgGK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JvOeDnui; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PxqVVgGK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JvOeDnui";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PxqVVgGK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JvOeDnui";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PxqVVgGK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7896275B33;
	Fri, 26 Jun 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782471810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+A4ISRCw2qaxZ8t9GACjOAIzRGA5qLb/RtkUaiNEQI=;
	b=JvOeDnuiK9n68PM9RY4QmA4naapQXmH+p68PsvixoY96jhSIKwoHbDrnEW9WGK2t14zaA8
	uQLtHYs6cb0NsMwTAanfduugVFr1balT/rfv1Yc1IYr7zc2Yxpz/bLty69PTkc4eanURjK
	ApT0VdWzDWLwN+q1EbW5/zgg7hi8LQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782471810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+A4ISRCw2qaxZ8t9GACjOAIzRGA5qLb/RtkUaiNEQI=;
	b=PxqVVgGK6t5uczBACJuNei4BzJLL8Bw0VzUa2cbj34RvdF8MzmcDN/uh3RJhDA2+3ULKZe
	gVFcR47c7nKpG4CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782471810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+A4ISRCw2qaxZ8t9GACjOAIzRGA5qLb/RtkUaiNEQI=;
	b=JvOeDnuiK9n68PM9RY4QmA4naapQXmH+p68PsvixoY96jhSIKwoHbDrnEW9WGK2t14zaA8
	uQLtHYs6cb0NsMwTAanfduugVFr1balT/rfv1Yc1IYr7zc2Yxpz/bLty69PTkc4eanURjK
	ApT0VdWzDWLwN+q1EbW5/zgg7hi8LQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782471810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+A4ISRCw2qaxZ8t9GACjOAIzRGA5qLb/RtkUaiNEQI=;
	b=PxqVVgGK6t5uczBACJuNei4BzJLL8Bw0VzUa2cbj34RvdF8MzmcDN/uh3RJhDA2+3ULKZe
	gVFcR47c7nKpG4CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59AE4779A8;
	Fri, 26 Jun 2026 11:03:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N2LMFIJcPmrgHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jun 2026 11:03:30 +0000
Date: Fri, 26 Jun 2026 13:03:26 +0200
Message-ID: <87bjcxtvgh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-merge-window
In-Reply-To: <8d888870bec370f9abaad606055cdb75@kernel.org>
References: <8d888870bec370f9abaad606055cdb75@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
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

On Thu, 25 Jun 2026 19:01:19 +0200,
Mark Brown wrote:
> 
> The following changes since commit 4346d91cfa47b0d9303533edde8acd33e4b9ca40:
> 
>   ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type (2026-06-14 01:03:38 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.2-merge-window
> 
> for you to fetch changes up to cf6f56990ea21172e085f0588e5bbf2089ce8f58:
> 
>   ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count (2026-06-25 14:56:27 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.2
> 
> We've got a good collection of device specific fix here, plus a couple
> of stand out things:
> 
>  - Richard fixed some special cases with the new device_link creation
>    by more gracefully handling any errors during creation.
>  - Charles did some light refactoring of the SoundWire interfaces to
>    fix some persistent randconfig issues that people kept running into.

Thanks, pulled now.


Takashi
