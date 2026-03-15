Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F31D5CE0
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773567084; cv=none; b=mdLrd30ZYOQSch9YmNP5+NMUYhlT7NC/3rF7Q+RwLJhHv5dy+r0jN75BMqFO9CbWIz5k62mTBO1nd6sdr9S+X/jHsZfG6VpIin1ViHNeGf4Db4Y80A+o9Boy8vFY2Yp1umZY1X85YH6yUU+jPp7UOHeTrSuJ42cYYrZAKJ/ofms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773567084; c=relaxed/simple;
	bh=sx71mQQ8uvswhsDBkVb2sm0xwgN9fX3Obm63xagbibU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kb4YJtxHVg+2KBYW7JdyQFwMB0kAdWEwGMr32lOcwrMk6sfG6UTGSf8sQH3xNkcgXwAf+mbcrgY5LUiX4UqHPDb46vhroHjx+DGkwMVr1ohYsTWOorqHG/z/6lhxJ+x9tvwl/QN0fuoWBqk2F8mDr6AicpJ5bmJ+1Gfs3YgSXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=APwpyDSc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zzsFsSHW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=APwpyDSc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zzsFsSHW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="APwpyDSc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zzsFsSHW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="APwpyDSc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zzsFsSHW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 24A8C5BDCE;
	Sun, 15 Mar 2026 09:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773567081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YoYqQ9Iat6UMAwvUjnT4WGk3eJciImKyvGd7pPFRfxs=;
	b=APwpyDScJ8fyCuak9rcZtkKNb67RsIT7Wu46OlyIhGZDEKDXHQYZanlWBL/uz2uTjJmFL8
	x9NTup9KdNrJJWcujvB73DGz2KbQSilTStyBcmyMXBsODQle0QHqcCUxwR7dfAclA3zRyi
	YCjf9mbs62RV1zQb5toGm6Yzkja2KuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773567081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YoYqQ9Iat6UMAwvUjnT4WGk3eJciImKyvGd7pPFRfxs=;
	b=zzsFsSHW39+OOOCoP9nPUl+UnkpnwfNqcDpmLFVYHjqDzUtiW2CpSD1ppJy+fo+DocsUTq
	rWO3VxoYNEH2AYCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=APwpyDSc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zzsFsSHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773567081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YoYqQ9Iat6UMAwvUjnT4WGk3eJciImKyvGd7pPFRfxs=;
	b=APwpyDScJ8fyCuak9rcZtkKNb67RsIT7Wu46OlyIhGZDEKDXHQYZanlWBL/uz2uTjJmFL8
	x9NTup9KdNrJJWcujvB73DGz2KbQSilTStyBcmyMXBsODQle0QHqcCUxwR7dfAclA3zRyi
	YCjf9mbs62RV1zQb5toGm6Yzkja2KuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773567081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YoYqQ9Iat6UMAwvUjnT4WGk3eJciImKyvGd7pPFRfxs=;
	b=zzsFsSHW39+OOOCoP9nPUl+UnkpnwfNqcDpmLFVYHjqDzUtiW2CpSD1ppJy+fo+DocsUTq
	rWO3VxoYNEH2AYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE90B4273B;
	Sun, 15 Mar 2026 09:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DKr6OGh8tmkDGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 15 Mar 2026 09:31:20 +0000
Date: Sun, 15 Mar 2026 10:31:20 +0100
Message-ID: <87ldfta17b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ~rosset-nocpes <coderpy4@proton.me>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk
In-Reply-To: <u0s-uRVegF9BN0t-4JnOUwsIAR-mVc4U4FJfJHdEHX7ro_laErHD9y35NebWybcN16gVaVHPJo1ap3AoJ1a2gqJImPvThgeNt_SYVY1KaDw=@proton.me>
References: <u0s-uRVegF9BN0t-4JnOUwsIAR-mVc4U4FJfJHdEHX7ro_laErHD9y35NebWybcN16gVaVHPJo1ap3AoJ1a2gqJImPvThgeNt_SYVY1KaDw=@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 24A8C5BDCE
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sun, 15 Mar 2026 02:08:51 +0100,
~rosset-nocpes wrote:
> 
> From d051c71ce849cc8504bb8e00784a830d718c3f00 Mon Sep 17 00:00:00 2001
> From: Andrii Kovalchuk <coderpy4@proton.me>
> Date: Sun, 15 Mar 2026 02:53:09 +0200
> Subject: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk

Those lines shouldn't be in the patch description (except for the
From: line if you need a different author name than the one used for
posting).  Otherwise the git-am would take those lines as is.

> Add a PCI quirk for HP ENVY Laptop 13-ba0xxx (PCI device ID 0x8756)
> to enable proper mute LED and mic mute behavior using the
> ALC245_FIXUP_HP_X360_MUTE_LEDS fixup.
> 
> Signed-off-by: Andrii Kovalchuk <coderpy4@proton.me>

I applied the patch now by manual corrections.
But at the next time, please check whether it's a right submission
process beforehand.  You can test to post to yourself and try to apply
via git-am, then verify whether everything is OK.


thanks,

Takashi
