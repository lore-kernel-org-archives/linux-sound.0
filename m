Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B28D271471
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316949; cv=none; b=jViejMjBKV+Nog6dp/uW9uLjXAHuDMjtaDTeKASHAm+HqDRBVnMAhOKMFW6d9mK8a6qqgXfSxkTUFUPwcXzXi22n6eyfn7GcWxHNWPgmpdqVlXuX/JqINA/v2hq6dlqZHSUVik8D8lLotqLGbt8YRtL93a0zWWrsQnQuOqYQ2L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316949; c=relaxed/simple;
	bh=KO2X8n+gNRTwA0BIThpp9YVmB9obxw6zIQuA6Ohyczg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UI6zUwOHdGtiqYcsqE3SJrtRe6eSpgtpvCrE3yYTLMsOadj7RoakNvI7/d7fhqmB+g4/8n4sQY1p2xZy6P58JtBlSsZ+EITk4/alDT1ckY4HXtT5aZ9vBKs/A59hzwnEFY0CotzE1jHTRuqzRSGciTiwzSMa4jqVg3CEQ5zV9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h/Zl1Ldm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yZjNiAz3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SCKVcU5z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jz0fwl9x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h/Zl1Ldm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yZjNiAz3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SCKVcU5z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jz0fwl9x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D72FF5BCE6;
	Thu, 12 Mar 2026 12:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773316945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec9fzR+A6CjpkoYwv7AGzep0FTm+72PGgotu1eBELeg=;
	b=h/Zl1LdmdqeCps33s1d6qNnHgp/ObmkpL68meQ6KngLmiGOjpZ/w+lP04LK8gqGoaHL1rx
	R6d7z6HhaVo0IyFAshE2kyCjOGE/69v1h+Sz2jva1gSTa9Ri7UEjgZpK7/NlF+OJ3eZsYm
	urwLriPjv1fs4ysS1LLgxgBoCsc35zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773316945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec9fzR+A6CjpkoYwv7AGzep0FTm+72PGgotu1eBELeg=;
	b=yZjNiAz3ZhZZLDIh+NnVRZZhzj3vkVH5lO5zj7oC7R1rvsb1m8EvK7I1qZCqQFIYPrfCEX
	GHGAH2044HiJ8rBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SCKVcU5z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jz0fwl9x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773316944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec9fzR+A6CjpkoYwv7AGzep0FTm+72PGgotu1eBELeg=;
	b=SCKVcU5z+VlmDQoOl/BbG4E+KhgGruGqEwqmVrfZZFZX4ZQBTC0rZxrWLHj5ArZL2lY3xC
	8NxzbUMaNW/ZUXmwU3sQjPs1y4hSr0BDMrlOFqdH1Mk6gcJGNfVp6LpNHoJg3BZVZJJEd8
	j6oi4BQgPFFj3xhOQqNAyf86uxmaDq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773316944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec9fzR+A6CjpkoYwv7AGzep0FTm+72PGgotu1eBELeg=;
	b=jz0fwl9x5GFSq3I79/3PrQqQssPasZ11EurqBvRJJB1vpSq7NajUru6U3f/WIdKpYdF72G
	n9PzYfQPAd62C9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8A223FF65;
	Thu, 12 Mar 2026 12:02:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SVD0J1CrsmlPTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Mar 2026 12:02:24 +0000
Date: Thu, 12 Mar 2026 13:02:24 +0100
Message-ID: <87bjgtcl2n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc3
In-Reply-To: <eb05b65e322575e31cd3566b267c5686@kernel.org>
References: <eb05b65e322575e31cd3566b267c5686@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D72FF5BCE6

On Thu, 12 Mar 2026 12:53:15 +0100,
Mark Brown wrote:
> 
> The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:
> 
>   Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc3
> 
> for you to fetch changes up to 30c64fb9839949f085c8eb55b979cbd8a4c51f00:
> 
>   ASoC: amd: acp-mach-common: Add missing error check for clock acquisition (2026-03-11 19:18:17 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.0
> 
> Quite a large pull request, but nothing too concerning here - everything
> is fairly small.  We've got a couple of smaller core fixes for races on
> card teardown from Matteo Cotifava, a fix for handling dodgy DMI
> information generated by u-boot, some driver specific fixes and some new
> device IDs for Tegra.

Pulled now.  Thanks.


Takashi
