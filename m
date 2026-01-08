Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2633BBA0
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767856938; cv=none; b=DVzuyMbVKwzYBO4w/jFM7HcZG9XKZe+NqsCgLSuTCPNGuqcBC81he/vBUNzj57GCc2rOa3X0Ln+wP6gwoSpX/H3GNUwel0Ol3yOLc5H6w/Sp1kbPnx9KCNkZdiShsBTyhvNInDS0yyAtWDxUjISTvA12YMxL9xcg+tTFSTX8Xaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767856938; c=relaxed/simple;
	bh=e4vXx8Er8/JCNaxSscpfLK2AvN9rKiU79r4Bt6FIxQQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2d2JOHNGHBzEmnp9FK6tGVbfr+EWfizIFDQ9BZq89fvO2EEJ8LmviA+OZexR8Gnm5XWY1g+YwPXS8pRY/ZMC2I/0Zm9kobPn3RmQGhX/Ib2Bq21OEflMYuhoH/HBso7eeqededxFeu8G4WzOrEkq5V7pzqrg4MQEoKT25AzJ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MnXBGfpD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/WGC27Rg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MnXBGfpD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/WGC27Rg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MnXBGfpD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/WGC27Rg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MnXBGfpD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/WGC27Rg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4E455BD14;
	Thu,  8 Jan 2026 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767856933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqs6k3eru8Jh+WK4vVorW3WoIJj8rc2N9Je0RfDWa5U=;
	b=MnXBGfpDKbmB9pTxzwD3IakL+GURiQw1d5L81izNNSnwPMwxEpretMgDt1SNdslHTnOKLP
	FaH7etA25lJRVfzDX4Cckg6koEOx7W8vbKvYwXGdPm+ZmeoW02SSRSPPxemJaSpDNbeDZK
	F4gQggdVn5peqYR4lss4JJWRbS2tgGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767856933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqs6k3eru8Jh+WK4vVorW3WoIJj8rc2N9Je0RfDWa5U=;
	b=/WGC27Rg6c0M7XGzDxvy+XoBnaVNE1gnIk4RKYdkOaNCg/RQ972aSOaOeYFylstb3Ny3o2
	I4KhvVNdhqW8RNBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767856933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqs6k3eru8Jh+WK4vVorW3WoIJj8rc2N9Je0RfDWa5U=;
	b=MnXBGfpDKbmB9pTxzwD3IakL+GURiQw1d5L81izNNSnwPMwxEpretMgDt1SNdslHTnOKLP
	FaH7etA25lJRVfzDX4Cckg6koEOx7W8vbKvYwXGdPm+ZmeoW02SSRSPPxemJaSpDNbeDZK
	F4gQggdVn5peqYR4lss4JJWRbS2tgGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767856933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vqs6k3eru8Jh+WK4vVorW3WoIJj8rc2N9Je0RfDWa5U=;
	b=/WGC27Rg6c0M7XGzDxvy+XoBnaVNE1gnIk4RKYdkOaNCg/RQ972aSOaOeYFylstb3Ny3o2
	I4KhvVNdhqW8RNBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C0A83EA63;
	Thu,  8 Jan 2026 07:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WJLnJCVbX2lDIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Jan 2026 07:22:13 +0000
Date: Thu, 08 Jan 2026 08:22:13 +0100
Message-ID: <87h5swh8m2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: fenugrec@mail.com
Cc: linux-sound@vger.kernel.org
Subject: Re: accidental revert of Presonus 1824c quirk ?
In-Reply-To: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
References: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[mail.com];
	FREEMAIL_TO(0.00)[mail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Wed, 07 Jan 2026 17:57:41 +0100,
fenugrec@mail.com wrote:
> 
> Hi,
> I'm looking at this repo
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/
> and it seems a recent merge reverted a commit ?
> 
> Original commit
>   d1d6ad7f6686e208aba06b7af3feef7a7cba61cf ALSA: usb-audio: don't apply interface quirk to Presonus S1824c
> Merge that removes the added quirk:
>   329bdcbbd229731dc5a8b6753aa2409f00869331 Merge branch 'for-linus' into for-next
> 
> - Was this on purpose ?

Looks like yes.  The quirk was confirmed to be superfluous for 1824c.


Takashi
