Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EC2E06EA
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185590; cv=none; b=IT5ozWD5eoPHGFaj8T7CIhKNYMs1ngsof+MH4d/EDpnYVDE/rOUJ6ZYO/7hS8Ra18Jeeo97wSTve05Laxs3Jtv9dX1SqmcsW28hkBOaQMOB5jQiC8TPdNEjBng+NyPZSFnssNIl/BdJOG61XWDxGS/FHIIRbxy8PhWHLx5sC9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185590; c=relaxed/simple;
	bh=yHaQsxJijS0Rn6LTycMZR5A30fW70pKzIoC9uN6EJD4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5lIn2Y0omslyloj2OqsButjJ5HnVa4GBttFOMjWGBmss6jsIJrXLS5NPc5k/7HyC3KqTXmwH54MWAXbwgT0rfozqDaIi40yH8L5W3oGtyJtupsqWsnY11gWfBm794U+iP7WyESjM1dyusB/1b7glOtDPSFEK+L46AchLGXMSsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YAA98etW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9C9RGzZ/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nNdI4zFu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZPLBQcPX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YAA98etW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9C9RGzZ/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nNdI4zFu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZPLBQcPX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0CD43382B;
	Fri, 23 Jan 2026 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769185587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PGM5w9E73bse/ZUf8K1KgRhxrENwihyfAQzlBXqc+4E=;
	b=YAA98etWA1Ti3C56l/I1POg72rg2eNcVg1nM91vtTT42IFfxYnpxLcvHXhsTvWhuJN9+lf
	wYQsjTRshV+C9/1f9Y4OGro68v0YRlnDolmPMLJc48Tl6ASTjDg8RiEBoyQ9MlYbc0DMHB
	ODqkPbGAoMdqPP8k2YHORSQK6WgY8LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769185587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PGM5w9E73bse/ZUf8K1KgRhxrENwihyfAQzlBXqc+4E=;
	b=9C9RGzZ/MNJW326TBqLy/FKcErR+AixFNgQYnmb53xKQEqzJQoCO9WFuNdpNvilcxInYPq
	Q1KTvq4vL3rP6CDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nNdI4zFu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZPLBQcPX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769185586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PGM5w9E73bse/ZUf8K1KgRhxrENwihyfAQzlBXqc+4E=;
	b=nNdI4zFupmRDUG/lTKWd4tkZgOtv2UbrrJKpS9w3hERVqfmhx7qX3q/zBOLzGk6lkBF/3r
	kgHgRAvgtHJPN5bdx3I7PL/fqrvevDGVKofhve/K6tHMKJ1upkiGD0j5K9R26QT+CJAWIw
	ZDHNonTgwfT5lHSnPYoUKG7BJO8y9LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769185586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PGM5w9E73bse/ZUf8K1KgRhxrENwihyfAQzlBXqc+4E=;
	b=ZPLBQcPX5atoEHQqq5FZAL1DEwsaWEnZ//1z3vu8Hvz8vKRqgsMPYyjHvls0QOq1qZKA0e
	rTv5h4YkFOGj6FBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF8571395E;
	Fri, 23 Jan 2026 16:26:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jgp6LTKhc2m/IAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 16:26:26 +0000
Date: Fri, 23 Jan 2026 17:26:26 +0100
Message-ID: <87343we1n1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc6
In-Reply-To: <b9a26fcf7ebc08d3deb132f538a592cb@kernel.org>
References: <b9a26fcf7ebc08d3deb132f538a592cb@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: F0CD43382B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Fri, 23 Jan 2026 16:28:30 +0100,
Mark Brown wrote:
> 
> The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:
> 
>   Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc6
> 
> for you to fetch changes up to 018b211b1d321a52ed8d8de74ce83ce52a2e1224:
> 
>   ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list (2026-01-20 12:56:03 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A couple of device IDs and a couple of small fixes, nothing hugely
> remarkable.

Pulled now.  But it slipped from the PR I already sent just today, so
will be included in the next PR for 6.19 final in the next week.


thanks,

Takashi
