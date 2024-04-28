Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253173513
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714328146; cv=none; b=F0n8wBNkKUrGZJVP7eSbJrcFdiqE8QM/Q6QaYIm2Iume5Oe/FC61Z6W1nAQtCHIHL7wfW4wT1axreoI2/2KLYV0IrtUzI5W5BqLae/rRMd97sFsxJU9rN8HAOgqksO0Rr8JGsdBPzgDxiajO4Fqn0xYgoP505cQmjdVgYk8tGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714328146; c=relaxed/simple;
	bh=JhqAP2OMKRA0CLfhzoj+MYDgDKW78mwRST3e9bPVOV8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vlm8Gax+1R92CIgG1RokIzP3lIrT2mZu3a369nc0Q9agmLqcx8lctiiWFT2tKzwwwjywJ63PBTnqCu/HtBXSIHPdEmU9JrCIYX8c7q5/6yBDi66xosC9omwNeNoPVJCgZdCxiZNPf5DLjIP3uui6tLFRWmcAB3oitt4jm2H5H8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ou9/Z51k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bg2xVVm0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ou9/Z51k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bg2xVVm0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ou9/Z51k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bg2xVVm0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ou9/Z51k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bg2xVVm0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BD2221C62;
	Sun, 28 Apr 2024 18:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714328142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ev5evniS7K6Wt360nEgyOUbMrLS3tF+cG5KPifvsvNc=;
	b=Ou9/Z51kmSzXDlplX6x9eK/lbOlq2pcHWL31FD4xtrDhOmIQFkLCdV+qv7B47cui+tLbCg
	C0MhBvXgqjxxckEjXmh2nVUZ41BViaS0PtsCqi8ir62zv8yw9YBSrxsImXt21ZmIruJjhq
	6f5E674Ijyr2fnXoLc3NeKNq3yISDxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714328142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ev5evniS7K6Wt360nEgyOUbMrLS3tF+cG5KPifvsvNc=;
	b=bg2xVVm06rH2Zn2CDZ6oiLLEP6CBKwnbtU6+QwuPFpIvpo6EDFu+W+PB0JjOc/5KtZZtin
	vOO+JRXpdZjjBCBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Ou9/Z51k";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bg2xVVm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714328142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ev5evniS7K6Wt360nEgyOUbMrLS3tF+cG5KPifvsvNc=;
	b=Ou9/Z51kmSzXDlplX6x9eK/lbOlq2pcHWL31FD4xtrDhOmIQFkLCdV+qv7B47cui+tLbCg
	C0MhBvXgqjxxckEjXmh2nVUZ41BViaS0PtsCqi8ir62zv8yw9YBSrxsImXt21ZmIruJjhq
	6f5E674Ijyr2fnXoLc3NeKNq3yISDxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714328142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ev5evniS7K6Wt360nEgyOUbMrLS3tF+cG5KPifvsvNc=;
	b=bg2xVVm06rH2Zn2CDZ6oiLLEP6CBKwnbtU6+QwuPFpIvpo6EDFu+W+PB0JjOc/5KtZZtin
	vOO+JRXpdZjjBCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ACC7136DB;
	Sun, 28 Apr 2024 18:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EwRBEE6SLmYXNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Apr 2024 18:15:42 +0000
Date: Sun, 28 Apr 2024 20:15:53 +0200
Message-ID: <87sez51hgm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: Re: [PATCH v2 0/6] ALSA: emu10k1: fixes related to uploading firmware to the E-MU dock
In-Reply-To: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
References: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-4.34 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	BAYES_HAM(-1.83)[93.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,perex.cz,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7BD2221C62
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.34

On Sun, 28 Apr 2024 11:37:10 +0200,
Oswald Buddenhagen wrote:
> 
> patches 1, 3 & 5 fix the regression(s), patch 4 fixes a related pre-existing
> problem, patch 6 is a speculative fix on top of patch 4, and patch 2 is
> logically part of patch 3, just factored out for legibility.
> 
> i don't think it really makes sense to revert fbb64eedf5a3 (ALSA: emu10k1: make
> E-MU dock monitoring interrupt-driven) and re-do things from scratch, as we'd
> also need to revert the unrelated c960b012ec47 (ALSA: emu10k1: track loss of
> external clock on E-MU cards) first.
> 
> so i'd just fast-track the series as-is, and cherry-pick it to stable.
> 
> ---
> 
> the series (and a bunch of failed experiments) is fully tested by pietro with
> both rev1 and rev2 1010 cards, a 0202 cardbus card, and their respective docks.
> he'll get permanent testing credits in the card capability table later on, so i
> didn't bother adding a tested-by footer to each patch.
> 
> ---
> v2:
> - split off non-bugfix part of the series
> - add quotes around summaries in Fixes footers

Applied to for-linus branch.  Thanks.


Takashi
