Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE54501A
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644524; cv=none; b=KAsSA96dQC3Cv5BfEDEV3Wjqg/C4i9bbkgiSlzf6fbtoRWqCCLuwEPj3dLHlZ689p/xrV36XRqWPKyXj6OQnBNmJ4Vs2vQPtOX/Ewak9kA3A6+R+SnUKHb4z83H0FtGBVf8RMUFKKqb7ZoJYHni4uszUKtePu4fbSnx1ZsPsjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644524; c=relaxed/simple;
	bh=ZuDqs2gRF/BTvZx6U91WzWuc+kqmiaxA1olVTLM6RfI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfdPx6bFrVP0YsMW9AlAkkYs/dx7kbq1QiUyLqsow1LDZ1xjZJfygpqDrTJew6n3XEizKf3lz0nnMRrtC0RaA8U0BgzplVAmV0Moux2N5dTIjFuRvlqmNrauCijXKXgT9292uBtKKkjbVzkUB6M2PaUbUbku7XWJqIjUCRXsusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XXmKjm9A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVHhDQJg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XXmKjm9A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RVHhDQJg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XXmKjm9A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVHhDQJg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XXmKjm9A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RVHhDQJg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4552D211A8;
	Fri,  4 Jul 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751644521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=XXmKjm9A0vko4PetJH3gqgArfQN/ljbmAUu/wMHWBS1vpTrZhQ4nkEM0Yfa5Ii9+b6s+HJ
	AMXZiE0PpWLDZ8DvM84QYj0fc3QaQ/aQMCC0kZR3RAXxDIUzBYgRliVxH0svRQWXllBGNZ
	ob7nFQ2sk+HntHbpZ+nX976Sgf2TDUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751644521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=RVHhDQJgfGDuquot1X1BJOJYQAN6Uo+/rp7g6j/0zrkaM4zmyyuBhlpkrmIAX2pU0gyf/E
	nh57oYvo7BzEtxDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XXmKjm9A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RVHhDQJg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751644521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=XXmKjm9A0vko4PetJH3gqgArfQN/ljbmAUu/wMHWBS1vpTrZhQ4nkEM0Yfa5Ii9+b6s+HJ
	AMXZiE0PpWLDZ8DvM84QYj0fc3QaQ/aQMCC0kZR3RAXxDIUzBYgRliVxH0svRQWXllBGNZ
	ob7nFQ2sk+HntHbpZ+nX976Sgf2TDUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751644521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9jFbQM4TeBsgTQMfB02qwGjVXY3XZzVySh+Y2KKGks=;
	b=RVHhDQJgfGDuquot1X1BJOJYQAN6Uo+/rp7g6j/0zrkaM4zmyyuBhlpkrmIAX2pU0gyf/E
	nh57oYvo7BzEtxDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2180613757;
	Fri,  4 Jul 2025 15:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m63vBmn5Z2h0EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 15:55:21 +0000
Date: Fri, 04 Jul 2025 17:55:20 +0200
Message-ID: <87cyagne6v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-rc4
In-Reply-To: <899a3ae90cddad5bfe1de7f228960674.broonie@kernel.org>
References: <899a3ae90cddad5bfe1de7f228960674.broonie@kernel.org>
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
X-Rspamd-Queue-Id: 4552D211A8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Fri, 04 Jul 2025 17:06:42 +0200,
Mark Brown wrote:
> 
> The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:
> 
>   Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc4
> 
> for you to fetch changes up to 3b3312f28ee2d9c386602f8521e419cfc69f4823:
> 
>   ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> An update for the MAINTAINERS file, plus a number of small driver
> specific fixes and device quirks.

Pulled now.  Thanks.


Takashi
