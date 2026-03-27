Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26B379EC6
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611488; cv=none; b=Bfsol/iOWBTkn8hWtzpxqgTzheaCJhH2Grr054lAFGRetdSoZlLEgkloXfoaaAXjPLupIpKBjAB4tSnxGWMnL9O3qS3HLkXCcnPuUFrrL4vZ6UEAvyIvfZTGDbH46x9V4dVO2ln5PNypcyabbHBFIONnFfDkyYWndFRlr2Tjbu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611488; c=relaxed/simple;
	bh=Fv5fH4H8r7SshMvK2rbR56z3xr1l8hJywFYjTQTuDJo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6AjGUpdY1BL9ssJBD6Fbv5T6vUpqp7ADAuxv6GHigmCeM0V5W+gjRjqdl7ObtebhzE1oN3e7Gw5uaCGJEDO7uYZtZwWOg9ju4PN2r6nB2bJpxHwR3c3e8U9VrwAQVYgwgNV5uYmZWzj3m5cG8VDiL2Lj2NlQbYUyPJ+jTUrsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mwhSJMaJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kLsRyBoD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OCIJA99m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Eq/lKgl4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mwhSJMaJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kLsRyBoD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OCIJA99m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Eq/lKgl4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 030764D339;
	Fri, 27 Mar 2026 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emIdjcS02J0wo4uddxwJJvQWTfLKrevrbXq1cOnohnU=;
	b=mwhSJMaJhoHCbno7AoeCgg3gcTabW119Ek81iQeVC3lX3ahoDcBkGlHtYqcXfgqkUKOToX
	IsfiFDY+tP0zeDD09RHRRtMPdob0GrA4MuDza5ifHp3kZJq2u87IReiza/mPEYMiPzkxTI
	7IBvr8sNrB1cEIQAswRobOmMVsQOBMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emIdjcS02J0wo4uddxwJJvQWTfLKrevrbXq1cOnohnU=;
	b=kLsRyBoDyk+HDrtM5iH9R3f0mH87dTuSALxWGZiMjhS24nfjMu1TT9hB4VWwQx2ezAtQfh
	DTfpzzPRfDWsXBBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774611484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emIdjcS02J0wo4uddxwJJvQWTfLKrevrbXq1cOnohnU=;
	b=OCIJA99msYreVWtm7JJrNKbU5ttRbsoA7TWf7xk1DJIUxJTvbVjHva1rSVTamRwIvT9dZR
	tzbLLDQSCjFw9ObdULs9qFdo8lLSaaoqWsdQqqsAuk9nq62wjWzk8diF2ICYSDj8L3LR+6
	y3aJLoa99NkIjYAQKSvcvV82sZOPYEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774611484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emIdjcS02J0wo4uddxwJJvQWTfLKrevrbXq1cOnohnU=;
	b=Eq/lKgl4k6+ZjzmIXkTWNf/YaqIjo1QDnm8WnlWuVvOcXc+mNJkC+VUsQnctMBcUxjthDS
	sQbthTrqFg1ExOBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C79E14A0A2;
	Fri, 27 Mar 2026 11:38:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /odZLxtsxmlTIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 11:38:03 +0000
Date: Fri, 27 Mar 2026 12:38:03 +0100
Message-ID: <87se9lqz8k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Serialize snd_pcm_suspend_all() with open_mutex
In-Reply-To: <20260320-alsa-pcm-suspend-open-close-lock-v1-1-b5992a120335@gmail.com>
References: <20260320-alsa-pcm-suspend-open-close-lock-v1-1-b5992a120335@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Fri, 20 Mar 2026 18:28:35 +0100,
Cássio Gabriel wrote:
> 
> snd_pcm_suspend_all() walks all PCM substreams and uses a lockless
> runtime check to skip closed streams. It then calls snd_pcm_suspend()
> for each remaining substream and finally runs snd_pcm_sync_stop() in a
> second pass.
> 
> The runtime lifetime is still controlled by pcm->open_mutex in the
> open/release path. That means a concurrent close can clear or free
> substream->runtime after the initial check in snd_pcm_suspend_all(),
> leaving the later suspend or sync-stop path to dereference a stale or
> NULL runtime pointer.
> 
> Serialize snd_pcm_suspend_all() with pcm->open_mutex so the runtime
> pointer stays stable across both loops. This matches the existing PCM
> runtime lifetime rule already used by other core paths that access
> substream->runtime outside the stream lock.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

I guess it's safe to take open_mutex from this function, but it's
still worth to mention it in the function description.
Could you update the description of snd_pcm_suspend_all(), too?


thanks,

Takashi
