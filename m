Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2022155B
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026008; cv=none; b=mMzuN6Un4aXWNAAlZXGBaT7q8wTKF9mGdjuNVw3ItERgl+WFJoNNB+XmnpSkEh6ItUsvYUAkaotV6s9gHkFovafVJRvgqz27PJNm5l3K4vWU45ybu3Pt17iIj/dx4jhSJ43beBAYFLArA/A2WB37ov0xVxuiqXzbRNmJVWYQop8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026008; c=relaxed/simple;
	bh=exfZi28LK/trzOKnywSoFWt3RzoqLBk1xldJvN7sRY4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rukC4314kbXlC2zSjLbbDW07I3fyjRPHISWMnvTWgiwNoqU3IpogiYhVGCZ3csfseJCMsY0DeOz3T0m60lUgmLpHivM1lT98bVUtMUSf4D0+vmWqwaA/AwLb51KeLaEbJEpAMCeDmGamxmPB7xcvslMIfRsHE7eQPiO9Cuu8cRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fEmuNfxC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Zvaq3hc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fEmuNfxC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Zvaq3hc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fEmuNfxC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Zvaq3hc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fEmuNfxC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Zvaq3hc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 866551F79B;
	Fri, 23 May 2025 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748025998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=fEmuNfxCr+Q5xU6FhQ7N+Aj31rKNMlzdsnmfy0NPXlmIP4Ju1jcQa9yaYX6RpIKNVKmCgC
	bfTvjUHwgfd4RpcpL9ZQVboyqWijCtE9xxxRwiUpqppz4XMXZVAMncvHYxyeVl8wpC1Hna
	jjuPpsaFprQBLgfj4kpwtBHLhwclRYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748025998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=5Zvaq3hctCjJZneJPqNsXUbOuSBe7rXInFoBgMWmwqV6PRn7Cr1BMk0f5z31oIWTlc5eSS
	mGan64QXvnzjd4AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fEmuNfxC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5Zvaq3hc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748025998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=fEmuNfxCr+Q5xU6FhQ7N+Aj31rKNMlzdsnmfy0NPXlmIP4Ju1jcQa9yaYX6RpIKNVKmCgC
	bfTvjUHwgfd4RpcpL9ZQVboyqWijCtE9xxxRwiUpqppz4XMXZVAMncvHYxyeVl8wpC1Hna
	jjuPpsaFprQBLgfj4kpwtBHLhwclRYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748025998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=niEhvUg1XdS8BQFNH7rtfCp0gZEze/BQKS1gzlmZs7A=;
	b=5Zvaq3hctCjJZneJPqNsXUbOuSBe7rXInFoBgMWmwqV6PRn7Cr1BMk0f5z31oIWTlc5eSS
	mGan64QXvnzjd4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DD27137B8;
	Fri, 23 May 2025 18:46:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /LzCFI7CMGiPUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 May 2025 18:46:38 +0000
Date: Fri, 23 May 2025 20:46:37 +0200
Message-ID: <87h61brwqa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.16-2
In-Reply-To: <ba7f879f929f53a179738402df6f13e9.broonie@kernel.org>
References: <ba7f879f929f53a179738402df6f13e9.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 866551F79B
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 23 May 2025 19:51:28 +0200,
Mark Brown wrote:
> 
> The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:
> 
>   Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.16-2
> 
> for you to fetch changes up to 43a38a0ff8c63ee156d997cd13063c63cd55d812:
> 
>   ASoC: codecs: add support for ES8375 (2025-05-23 16:52:28 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Additional v6.16 updates
> 
> A couple more updates on top of the last set I sent you, a new driver
> for the ES8375 and a fix for the Cirrus KUnit tests from Jaroslav.

Pulled now.  Thanks.


Takashi
