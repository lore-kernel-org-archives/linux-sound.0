Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C222FE02
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759075839; cv=none; b=cWZMXxcNGs/skQPD0Ee1A/l8DS0EOuPiLc+6bOBFxE9ZiU7myiVk7NRzDEANUZFIbiJ7YY/GMoHn/WqothQtO6bE8MZhJzlBKcdrh7JnMvv2Aqz6Mw/iZi9qL2QXy+P2QAJnMlZrCVmKlDCZf6qvlU1g+U3Xb76f7U4RiQ14dhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759075839; c=relaxed/simple;
	bh=7orVEUf4CW+CNfFaMOR/f9zrpazPhfbAInxVnp7vRUY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPTxd45ZUCEdvKM/v9geWwW0xBzhVGTtJPU2Zql4cRmOdVzOf25SHss2syJcp/diu79PVO5Qv7j5n1KDJe3fvrxh8sB0denALD2XCqiPB/zQtuOyI/GMOncoNpHZv9WlnOEZB10rYeJq8z0YVol0BoNOrNZtmSQmMPTWDmcfLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DfafcFp1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6fJdU8yW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e++hQbhr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7KGEE4nG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DfafcFp1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6fJdU8yW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e++hQbhr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7KGEE4nG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 259C866D2A;
	Sun, 28 Sep 2025 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759075830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s3EPBlJNE5FFqG8z/x+0UvThvagWK42jv3jEHZIjHI=;
	b=DfafcFp1ZiQcZzdO+tE11q2O22eRA40vzxpUJHeoCLs7Q15l+OcHhw7pDe0uPFGUqI3LNS
	cAQz10Mjx3sicHEi5oMIss1Pickg3AQ8xEtlzOgCtOp6aNxMhndEJLxgv+Etk61G8c6Qq6
	rNuc5BWFyU314k4yKplEV+RM8CLn5CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759075830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s3EPBlJNE5FFqG8z/x+0UvThvagWK42jv3jEHZIjHI=;
	b=6fJdU8yWRJn6imF91s8kWBHdQuRYTXM7VFQ792vr6VjMTpw5H3EfTXFFOfn2GdmlyqkEO1
	RumpvlwjXP9jpJDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e++hQbhr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7KGEE4nG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759075829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s3EPBlJNE5FFqG8z/x+0UvThvagWK42jv3jEHZIjHI=;
	b=e++hQbhr9kFSpYOrX7JO69OiL5JQvpgcNdLh/Hn9rDsOurza0DPJEIfZcKjkPULYdWmpkB
	CzCfjq51EABpte6xPkx6W4/gWxeuMqdB/L7waFhBzLg3qElt74NWL1/Fr4aLX1jVsfnlbI
	d3eYicN2Jiw9/tl/2s47SFTY35y5DWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759075829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s3EPBlJNE5FFqG8z/x+0UvThvagWK42jv3jEHZIjHI=;
	b=7KGEE4nGcpxbEaozUJuDRfEEqk0UMjEv1ZpYauGRr5wDs5Jae0PSxdWGolWvmO/csWnTTt
	wNL88NVhhJOzytCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1D1E1333E;
	Sun, 28 Sep 2025 16:10:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NtyfOfRd2WgGLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Sep 2025 16:10:28 +0000
Date: Sun, 28 Sep 2025 18:10:28 +0200
Message-ID: <87h5wm8snf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.18-2
In-Reply-To: <b2f1f4f97038d06dce09f750ca53571e@kernel.org>
References: <b2f1f4f97038d06dce09f750ca53571e@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 259C866D2A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.51

On Sun, 28 Sep 2025 13:54:00 +0200,
Mark Brown wrote:
> 
> The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0615f:
> 
>   Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.18-2
> 
> for you to fetch changes up to f8b9c819ea20d1101656a91ced843d9e47ba0630:
> 
>   ASoc: tas2783A: Fix an error code in probe() (2025-09-26 12:43:33 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.18 round 2
> 
> Some more updates for v6.18, mostly fixes for the earlier pull request
> with some cleanups and more minor fixes for older code.  We do have one
> new driver, the TI TAS2783A, and some quirks for new platforms.

Pulled now.  Thanks.


Takashi
