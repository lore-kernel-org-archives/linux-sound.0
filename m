Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C519F135
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769691537; cv=none; b=tA1VmFLLJHFgdVYuASQcY6+TdVLqwM0XUw4lvoMcyjw90OY7DlR9yCUVdGAbOevr7raMOie15QDY8ElsS7KDQXjLApoytGJyDbMKiG/MFW9u48esl44YutKtTrDjW8XZsiW9BzKKGDTazHbgFa/3pYdW6A9kZLIb3oXUicY/KLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769691537; c=relaxed/simple;
	bh=E/moniw5IgW5qga1tPjgA9h0Uv+/p8jMen8k2z9pUOw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=poMa7A9ipzzQhkVsOglGaG+jvV7ZtZMrPU+Ki+p6z0eZVZOqL3zoEAG0LL1ZvjjNsOP1CmrtXbnEefvx3MpgQH0Shm9rsKs5+vhwmN5TeOfWZ4feujKpRgUPdjc+OWPs+riqcu+UpttzjZMKrJFkFQMcMcuNdVF7HUNipuZpybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ksD2F0Ak; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rg5c015I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fTUs7H14; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AH2QODPl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ksD2F0Ak";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rg5c015I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fTUs7H14";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AH2QODPl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4207F5BCEB;
	Thu, 29 Jan 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769691534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zl3YdbF+jyS4JvFDRXw88iHC9/97o3GfJ+hiVH/2owU=;
	b=ksD2F0AkP5fe0hNyj15DTii5VLX+7xGwaIW14ywHRpmK5El/I0HPJihZ6TBuAcMkRI5VsU
	7+enf0Xd8jBby5PVNXRjwHN3tQq8TWz5w06027uwolHO5GarM+OCh5GexoUEWYe24Jo1WT
	cBxO97wA9ywvotxpUa+Ga76TDORpQE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769691534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zl3YdbF+jyS4JvFDRXw88iHC9/97o3GfJ+hiVH/2owU=;
	b=rg5c015IhfSocNBDWx6pRlzMrZE1+vryxI528HDURETbZvJJ7pQyGVfDOfXLhSFpPYuSTe
	sr0s0/vzOi7Wx5Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fTUs7H14;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AH2QODPl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769691532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zl3YdbF+jyS4JvFDRXw88iHC9/97o3GfJ+hiVH/2owU=;
	b=fTUs7H14zVSzW8E4JEElLcimFRa7uzTI+aIMRVlzcZO6SBgZ9ttvy9dV/2/qw3JB/gzvzs
	Qi0uSVU30bPaMpDEX0e6BtPjGHiGGX8+Zg/hbsF5u5MfXfIDxQR8CW/haDPOdNN09cN3F7
	6nl3zj2DlyDWpmVD7YwzOmPjZYlxmqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769691532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zl3YdbF+jyS4JvFDRXw88iHC9/97o3GfJ+hiVH/2owU=;
	b=AH2QODPllG+/08l+I5EQawWnmrxsjeYZGo68yo65eWHlfacOja2j/iWIA8NXhLt3nuS3lR
	E4errZ7nh4mFUdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FD2B3EA61;
	Thu, 29 Jan 2026 12:58:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n8mcAoxZe2nbfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 29 Jan 2026 12:58:52 +0000
Date: Thu, 29 Jan 2026 13:58:51 +0100
Message-ID: <87v7gkzib8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc7
In-Reply-To: <0ae6fdf736731e11afa19b5e0a3d6001@kernel.org>
References: <0ae6fdf736731e11afa19b5e0a3d6001@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4207F5BCEB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 29 Jan 2026 13:14:05 +0100,
Mark Brown wrote:
> 
> The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:
> 
>   Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc7
> 
> for you to fetch changes up to 94e5baff3ee3cd1a5246c85b0744092eab1c5d42:
> 
>   ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43 (2026-01-29 11:41:54 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A couple of small fixes and a couple of quirks, nothing major

Pulled now.  Thanks.


Takashi
