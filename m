Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81C315D48
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403870; cv=none; b=WsCOGtUkggNxYFK865qxTKQZk8dMRVRLpTjHr8S9dojCR6UFIK9q1SNowm43qySmnTZRgmqfFjOr4dZdYrktOZHnI8K33qcobVtT/LXwW3BGCxvBRTpG52UiH565vAo1KM9Th8j6kPkSoePZWMR9pDHyhOVY5WKGZObm1zE+wiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403870; c=relaxed/simple;
	bh=+RJtkrXLgI7k1ghu9KifXpJPxIdTsB+/1oqKkHqYO/0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYSiaz6ALynZu8IkkKUkk2xR7CQdWvaTsvd/iBNJ0L1liz79fGr0um0QPbTBPr51j7KFbjuS7ZZNZ8XWQr8FjkjNe5ZIzjcM8V+U+0cYgQFYP25YrdacXCuj5z5u3vZctuXV6PH9hX7zzJ1feZJ6cDwYMrzlWOhOgKFEgYqbUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wq5jmpbB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vqKSjiFe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uhr1LIrl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HWos6X5V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wq5jmpbB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vqKSjiFe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uhr1LIrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWos6X5V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFEBD3E704;
	Wed, 18 Feb 2026 08:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771403867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzEPaz6eQdeuUaxqksAZ8+D2XKFQy54Ar+tONBVKmls=;
	b=Wq5jmpbB6GI3Kvlgn4U2Viaj6ixrx1fN780Ffzwsit8sxC81J8N6VS2M1ES+mQ1+7UmJef
	TEAmqAE+ykctp9/j3to8B9teIphAdiWng35a1Vy8OXeWg8u20IY/dFxlE4GA8Ojsswb5wU
	pWl0WQosFGmdJwFzmaHy4Fbyy5+ruZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771403867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzEPaz6eQdeuUaxqksAZ8+D2XKFQy54Ar+tONBVKmls=;
	b=vqKSjiFenwl3lo+KO9r/RIddTIHt4NbYjMI/9GemoMVlanqtJe3hDpOaR/hZuaWBnDae+9
	e2SeEj7BGj7Va/CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771403866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzEPaz6eQdeuUaxqksAZ8+D2XKFQy54Ar+tONBVKmls=;
	b=Uhr1LIrlNH2BU3pz8XNWgAGA4zv6Ik/fBTD9yaiJcdjYryA9SKSkFM1NKExFwyBSoJZxwM
	wuXnb2DOYTNIviG5nrha57B0pfFqWRfyBUtj9jmuXzR5WbU/I+iU0EPvtp6hb927HhQIak
	mRQ7OzBMnwbUE/kjzq3vHLbZLfxtUVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771403866;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzEPaz6eQdeuUaxqksAZ8+D2XKFQy54Ar+tONBVKmls=;
	b=HWos6X5VrtPlSIYsJEjz+BvidZpGfRuPtZD7JQxLV3PjedPl05LYYkQOc0Tr9lF1JsFjYF
	n3Q9csLO3S6wAYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EB363EA65;
	Wed, 18 Feb 2026 08:37:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y0CcIVp6lWkPLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 08:37:46 +0000
Date: Wed, 18 Feb 2026 09:37:46 +0100
Message-ID: <87seaya1lx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	tiwai@suse.com,
	david.henningsson@canonical.com,
	perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	edip@medip.dev,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs
In-Reply-To: <CABtds-3QpFkofJydHXindqvABH8uT=t0p-vdMyfQDH04B4=cPQ@mail.gmail.com>
References: <CABtds-3QpFkofJydHXindqvABH8uT=t0p-vdMyfQDH04B4=cPQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 18 Feb 2026 09:18:42 +0100,
Sean Rhodes wrote:
> 
> From a673e45b345d494b7ec7143a8ace72faf6aa85f1 Mon Sep 17 00:00:00 2001
> From: Sean Rhodes <sean@starlabs.systems>
> Date: Tue, 17 Feb 2026 11:53:41 +0000
> Subject: [PATCH v2] ALSA: hda/realtek: Fix speaker pop on Star Labs
>  StarFighter
> To: linux-kernel@vger.kernel.org
> Cc: tiwai@suse.com,
>     perex@perex.cz,
>     sbinding@opensource.cirrus.com,
>     kailang@realtek.com,
>     chris.chiu@canonical.com,
>     edip@medip.dev,
>     david.henningsson@canonical.com,
>     linux-sound@vger.kernel.org

Those lines appear in the patch description by some reason.
I guess your mailer put it wrongly...

> On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
> emit an audible pop when entering or leaving runtime suspend.
> 
> The default Realtek shutup path powers down the codec by toggling EAPD and
> adjusting pin widget control. When the speaker path is still unmuted, this
> can lead to a pop.
> 
> Mute the speaker output paths via snd_hda_gen_shutup_speakers() before
> running the normal Realtek shutup path.

Actually, with this setup, any other shutup function is called.
That is, solely muting the outputs suffices for your machine.

> Test results: fixes the runtime PM suspend/resume speaker pop.
> Pops that can occur on cold boot (G3 exit) and around display manager
> start/shutdown are not addressed.

The cold boot might be harder to tackle, but I wonder how the display
manager start/shutdown causes the pop noise.  Does it mean a runtime
resume causes the pop noise, too?


Takashi
