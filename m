Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA52D876A
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441854; cv=none; b=l5gXOfDJEKXeAWUq/21F/wteJdw6b4LPDqVgvO2b25LXSv2vXxrdD07/pVQEyEgR+rkTJttRbId4eF4QFnvLO1B/bQVj4US7Fdp8jc3uK7XFJtjts7ywqVr9grrJ7//aidoCQC28WXHNcYx6G9A/Hkhl2WUW9MGoY5psyGD+Z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441854; c=relaxed/simple;
	bh=Ks8xqUo4nFunsJDzaFT8wRLJsrM8THAtbBp+OlBeEKM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dq4FnQdCnocfLG9CSNklqlcZm0f+uZPmOVlNuQuYtPitHKijsJK1jiw0b+l/Ii2d809DCCdkjOwMhSpxVqMoSc9vxLtGtbZaTDnKXcUoOzoMM9HIxef1+k15WlW5tT/Vk0C2O4h9z2H/MV7UnAWYRH33F0gMBu7Au4swKZwyVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2WVLYpka; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+Hl5HztV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2WVLYpka; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+Hl5HztV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2WVLYpka";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Hl5HztV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2WVLYpka";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+Hl5HztV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8BE46A7FC;
	Wed, 29 Apr 2026 05:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfkzRoCTWbtx83JlfJ9OhSs1yOQfzIK3aCQ6jA1q3VE=;
	b=2WVLYpkaMdwkLt8nrgdSz++Zkn019/7QjyM/c3fJMrnw4bj4c5HA81r4r8Wlab6POYokWa
	I2UwY2tE01z+aTeyRbfgrXMsWQJnHEcLvCeemmE7uIWaQYo+6glHm6TsJQYOPqEMP0iaF7
	paRa571z0il+OOYkQomDQqFoha9Js+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfkzRoCTWbtx83JlfJ9OhSs1yOQfzIK3aCQ6jA1q3VE=;
	b=+Hl5HztViF7et0Ito3/fHmw6O7Zf7aJPpiepX/QXlVTws9gV/3HqE4FFJLfBGKY6iXC+/m
	uuEC4yraCrieBgDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfkzRoCTWbtx83JlfJ9OhSs1yOQfzIK3aCQ6jA1q3VE=;
	b=2WVLYpkaMdwkLt8nrgdSz++Zkn019/7QjyM/c3fJMrnw4bj4c5HA81r4r8Wlab6POYokWa
	I2UwY2tE01z+aTeyRbfgrXMsWQJnHEcLvCeemmE7uIWaQYo+6glHm6TsJQYOPqEMP0iaF7
	paRa571z0il+OOYkQomDQqFoha9Js+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BfkzRoCTWbtx83JlfJ9OhSs1yOQfzIK3aCQ6jA1q3VE=;
	b=+Hl5HztViF7et0Ito3/fHmw6O7Zf7aJPpiepX/QXlVTws9gV/3HqE4FFJLfBGKY6iXC+/m
	uuEC4yraCrieBgDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A83CE593B0;
	Wed, 29 Apr 2026 05:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9yiqJzuc8WmfLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 05:50:51 +0000
Date: Wed, 29 Apr 2026 07:50:51 +0200
Message-ID: <874ikuqpqc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.1-rc1
In-Reply-To: <20260429054234.CBC321AC5855@finisterre.sirena.org.uk>
References: <20260429054234.CBC321AC5855@finisterre.sirena.org.uk>
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

On Wed, 29 Apr 2026 07:42:28 +0200,
Mark Brown wrote:
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.1-rc1
> 
> for you to fetch changes up to 03dcb5b68a96b51157ec2d17042fa2f0106828ae:
> 
>   ASoC: spacemit: adjust FIFO trigger threshold to half FIFO size (2026-04-29 11:41:32 +0900)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.1
> 
> We've had quite a lot of fixes come in this past week, all driver stuff
> rather than any broad systematic issue.  All quite routine stuff.

Thanks, merged now.


Takashi
