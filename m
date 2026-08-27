Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E384252C9
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840529; cv=none; b=unl4dUfJjCvI16I8W1LOyEmUw84A6XOupmnRrE6tse7yXDCgE1pZxyPgBMFzOgh583eubGodks1dQnGWoN/2JdGQl4cbnPMPximC2OgVaaKXlkT3kNXuxjOTwvRUps4FuXymiECERKPYDi+gLoU3yE7vwyViBiWbLg8N2bfRC7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840529; c=relaxed/simple;
	bh=iLXQLGoUqI41trrhyHxHfyWaPwKf76iBzswWgMqkjVE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=icXTX4UlD1KE0jZ/wtokhmxNe058OpvA8Ctw4RUFZJ7lkJmPZsLI3xP3n4hgEgyS3AXC2pysWFiOfpUwtednXhwj8OCwCR2H8326wBxyI+E9OtBm0esZnias6XynSrY8yVd4qQGjfQTx8K7D2KFE3uKs+0tIdI4IuOjWDygwDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IxngVlih; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xyxlj1L1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iO1MlaUM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rC67KEJe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IxngVlih";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xyxlj1L1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iO1MlaUM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rC67KEJe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA89621B35;
	Thu, 27 Aug 2026 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787840521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8OWXyMeKMXqN2dVxCykJf11aI931uGdM6loO15quzjQ=;
	b=IxngVlihtz4Az6hbVqez388ZKVoa9jpcTH7TYmjD+yqR1P1r6rER//I3eDfO9aKDbwkIbP
	xdhKH4wXtvXJ8y5zBwykEN/VEH3kVDzuy0VqwRtXad5fF570IKRhU74BxFBghpsWudlqFw
	NgRSbHRGEKkpEpFFyqPKUGCm1FwIKnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787840521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8OWXyMeKMXqN2dVxCykJf11aI931uGdM6loO15quzjQ=;
	b=xyxlj1L1D5JEkfWDe493p/y75/QIqRJgrnn+RxnePJMLVOF/1eo16/pRTgC/mTxN29bzx3
	iBsB4ae49VFzTBCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iO1MlaUM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rC67KEJe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787840517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8OWXyMeKMXqN2dVxCykJf11aI931uGdM6loO15quzjQ=;
	b=iO1MlaUMR+kN3mqgZKldwq8PPpQ+lgZtj2O8Tz9ukM3X075m/ubuCLPydIslam/T7/tvCU
	SvIUmW3l29gu/JlZQmSjj6gO/+A1oZAbch/oq1/MgLXXxVj12gqkOnVHFI9RE/OyCQ1w4M
	4LfM/A0m+IJeRxdInxa/TjfSIDJZkbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787840517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8OWXyMeKMXqN2dVxCykJf11aI931uGdM6loO15quzjQ=;
	b=rC67KEJebSK+mPhu0RcDzg4qlvg1qQpotq2SoQSHtZz5AzedvGCJ7xF6Sroa3YzcCRZTcT
	+KCRCznszJ4y+5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8441C1352C;
	Thu, 27 Aug 2026 14:21:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rZnhHgVIkGoFJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Aug 2026 14:21:57 +0000
Date: Thu, 27 Aug 2026 16:21:57 +0200
Message-ID: <87zey7ej96.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-merge-window
In-Reply-To: <b334f5b2d0e7c0c73107f54bfee509b1@kernel.org>
References: <b334f5b2d0e7c0c73107f54bfee509b1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AA89621B35
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Thu, 27 Aug 2026 15:22:59 +0200,
Mark Brown wrote:
> 
> The following changes since commit 0c7aeb0f5eceb95b5887bd8e83fef865e5a49a13:
> 
>   ASoC: tas2783-sdw: do not treat read-only Controls as writable (2026-08-14 16:20:47 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-merge-window
> 
> for you to fetch changes up to 15596a87fcc6fa07a162858e5fd00ba31752096b:
> 
>   ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants (2026-08-27 00:15:37 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.3
> 
> A fairly big batch of fixes that came in during the merge window.
> There's a lot of quirks for x86 systems and a bunch of driver specific
> fixes, the most critical being the fixes for Tegra's register
> definitions.  It turned out that they had been relying on the regmap
> default handling bugs that were fixed in v7.2 and so audio was fairly
> badly broken, unfortunately the issue wasn't noticed in time for
> release.

Pulled now.  Thanks.


Takashi
