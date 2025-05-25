Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50521D63DD
	for <linux-sound@vger.kernel.org>; Sun, 25 May 2025 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748158953; cv=none; b=BXm50tMNL42M1FAp1nyQVNZ0Bg6iE+W2HwRCUD+TIPC9G8A2i7ZUkFur6JHxwtQEB7iwmd9BssdjLHIDTf0ODtq1A5ReVyQLPppov3uAyeZ2LXot4SQH/oFZwOHzyvGp5RPmGqNlnLrNWljMGXBk7315rjdTxoM4jxOHK7kup28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748158953; c=relaxed/simple;
	bh=EiTBAm8Cjq1dLNwa50SlUHY34S7BzE2h5cLFgVj6BoE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUsOcicQ/Qia2VOjenz6wk7jMvD7jgDkowrnUoZDqad0OvFiZHZL+Dt+UYwrMAoqN/kK+4EyRJPdYH+MgApX2ZN52P6s6khMrPcTTywYBzSwDAAEN+I7koI7Qwex4gfg62lte/RJmW9qZQcsl3BM/bFzSWlxz433YHdCrgH8rxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GhQNrpVv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6iL6es4l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GhQNrpVv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6iL6es4l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GhQNrpVv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6iL6es4l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GhQNrpVv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6iL6es4l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D1EEC1FDF4;
	Sun, 25 May 2025 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748158949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyQEsu8+Kc0Z0N3KtOYPqaTrUjwc2vl9a/GydsJEmiM=;
	b=GhQNrpVvb9Gk53VauKAGy22M8mlt0r1rzn0YwfCTlz0902l2De2wia5dFRRbiTtzopyRSD
	JR8K9juUm8sm778A3GhMcbVNCPw7M4VLKlcQeH8mP+cM/P6KWGxB6pbk2fZeAXolsecIm3
	fHW1uKK5TiLuRSp7GYpRWigFVlrot4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748158949;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyQEsu8+Kc0Z0N3KtOYPqaTrUjwc2vl9a/GydsJEmiM=;
	b=6iL6es4lM8rsSXbKc7DedezIvfPWEgP+6K/dae7dFgCZ90yds4O4xo42GzRQSkfmOVQ20H
	5ella6BsfWjUiXCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748158949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyQEsu8+Kc0Z0N3KtOYPqaTrUjwc2vl9a/GydsJEmiM=;
	b=GhQNrpVvb9Gk53VauKAGy22M8mlt0r1rzn0YwfCTlz0902l2De2wia5dFRRbiTtzopyRSD
	JR8K9juUm8sm778A3GhMcbVNCPw7M4VLKlcQeH8mP+cM/P6KWGxB6pbk2fZeAXolsecIm3
	fHW1uKK5TiLuRSp7GYpRWigFVlrot4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748158949;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IyQEsu8+Kc0Z0N3KtOYPqaTrUjwc2vl9a/GydsJEmiM=;
	b=6iL6es4lM8rsSXbKc7DedezIvfPWEgP+6K/dae7dFgCZ90yds4O4xo42GzRQSkfmOVQ20H
	5ella6BsfWjUiXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E64313794;
	Sun, 25 May 2025 07:42:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rCZtH+XJMmiJZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 25 May 2025 07:42:29 +0000
Date: Sun, 25 May 2025 09:42:28 +0200
Message-ID: <874ix9rva3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc7
In-Reply-To: <c5f1dacf2885ff4eb1c04fa0faadd0b9.broonie@kernel.org>
References: <c5f1dacf2885ff4eb1c04fa0faadd0b9.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.16)[-0.816];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.26
X-Spam-Level: 

On Sun, 25 May 2025 00:34:38 +0200,
Mark Brown wrote:
> 
> The following changes since commit 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:
> 
>   ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc7
> 
> for you to fetch changes up to 688abe2860fd9c644705b9e11cb9649eb891b879:
> 
>   ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params() (2025-05-20 10:24:59 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A couple more small fixes for v6.15, both of which could also easily
> wait until the merge window.

This was already pulled.


thanks,

Takashi
