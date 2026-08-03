Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112B495E5
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740180; cv=none; b=BtAcbIBAXIQaBe0I/V3YIFsrkOSS6rcaglKZlYECyOr6BSUJ8i75Vz6byHETgDEKtMj0f/3BQgKyNj6abyBSXDDMC5ttoHadA1Sbr5PyZ4t+hmJltp5EmgygxAK6pgKzyTF3eSqmYjYOxYXTXKYMXQ69Y7HlLDlXpA+YsOOAj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740180; c=relaxed/simple;
	bh=jyLVhAID7ODIwCWw+cVwxilXIen2kIdIHzi++vjstW8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S10rqd8q83Ei/akqyAarHDPeFWa4EcJQgGcWJ5BErtBM4XwUXt75hsEKqqImTW6/NA6oBPZw38Osg5E6obH2C6D+fl6eotgjto42qkXvdcxxq6GddGmiWM0UqADp3k8CPT5P322RasTasCcHSiH+uzYf0NTKjNOpR2DWJ5QCYhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hvrBn7Ey; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=heKoZlNg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OUoj3Mrx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SApKYQ+9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hvrBn7Ey";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="heKoZlNg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OUoj3Mrx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SApKYQ+9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EAC97EF33;
	Mon,  3 Aug 2026 06:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74bHUJ6GsLbuCpuJh6YZGkUooX9CS9fpkKdZGw4/xHA=;
	b=hvrBn7EyuoPKdQi04Jpw+YApePB7Xs8AVdFZjhmy5y+YM+SHLvVnURMHzLORg29H+3e3WK
	OOWyaZ8zteJOdDkHyCNY1A0YzQAB8aR6XF0eIgQc5FbM5HlzuX5A1a6X7Fd1FpOQV8WGlZ
	Omaupm3F6L8kgjmgXiMTlIO0tj/JnrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740172;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74bHUJ6GsLbuCpuJh6YZGkUooX9CS9fpkKdZGw4/xHA=;
	b=heKoZlNgXuhKwPNWyJywSaA3e9dS2FIwlOFfzW0V4YA8fseUKzugi39IiSF4+NCws7Bf5j
	J1ZOpXdGbKML4nAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OUoj3Mrx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SApKYQ+9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74bHUJ6GsLbuCpuJh6YZGkUooX9CS9fpkKdZGw4/xHA=;
	b=OUoj3Mrx+zORMUeRnXcItUaPLwfwZf/LCiE5C5n4038EpARslfH9vdW1kRRpjnpvD8Odfe
	uAlhnhvAh8suZ2AOjMy+LObq8CSy8maWpoV4EsfzlMh1kBgS1mf+7Evdp5a4747r82YGWa
	oZJh+FF07FinfJ2LjFICUzNwr1KaW8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740168;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=74bHUJ6GsLbuCpuJh6YZGkUooX9CS9fpkKdZGw4/xHA=;
	b=SApKYQ+9N4SRaMJs+ibPntxBmGRVquFcmpxrBKu0HBYhx8oCgYyaT7B4d9P3Stodzpkf9A
	IU0gDHJSNCqtUABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69DCD779A1;
	Mon,  3 Aug 2026 06:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oIlkGIg7cGqCBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 06:56:08 +0000
Date: Mon, 03 Aug 2026 08:56:07 +0200
Message-ID: <87ecgfbsl4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Cc: Takashi Iwai <tiwai@suse.de>,	linux-kernel@vger.kernel.org,	Jaroslav
 Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-1?Q?C?=
 =?ISO-8859-1?Q?=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: aloop: Fix spinlock deadlock in loopback_hrtimer_stop()
In-Reply-To: <CAGvk5PoFzm3FyMhyDgqbVKQWC7j4EXh65W2j29L7BWw8xCO1MQ@mail.gmail.com>
References: <20260731074255.1513402-1-yuhsuan@chromium.org>
	<8733wycn2p.wl-tiwai@suse.de>
	<CAGvk5PoFzm3FyMhyDgqbVKQWC7j4EXh65W2j29L7BWw8xCO1MQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,perex.cz,suse.com,gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[chromium.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 9EAC97EF33
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sun, 02 Aug 2026 15:58:26 +0200,
Yu-Hsuan Hsu wrote:
> 
> Hi Takashi,
> 
> Thanks. I actually encountered a CPU deadlock during the aloop stress
> test. (Resent as plain text.)

Thanks for confirmation.  I asked it to judge for 7.2-rc7 fix, but I
missed the point that it's the fix for the new change for 7.3 :)
Now applied to for-next branch.


thanks,

Takashi


> 
> Best,
> Yu-Hsuan
> 
> Takashi Iwai <tiwai@suse.de> 於 2026年8月1日週六 下午3:33寫道：
> >
> > On Fri, 31 Jul 2026 09:39:35 +0200,
> > Yu-Hsuan Hsu wrote:
> > >
> > > In loopback_hrtimer_stop(), calling hrtimer_cancel() while holding
> > > cable->lock triggers an AB-BA spinlock deadlock if the hrtimer softirq
> > > is executing concurrently on another CPU:
> > >
> > > 1) CPU A runs loopback_trigger(STOP), acquires spin_lock(&cable->lock),
> > >    and calls hrtimer_cancel(). Since hrtimer_cancel() is synchronous,
> > >    it spins waiting for the executing callback to complete before
> > >    returning.
> > > 2) CPU B executes loopback_hrtimer_function(), which immediately tries
> > >    to acquire spin_lock(&cable->lock).
> > >
> > > This mutual dependency leads to a CPU hard lockup and NMI watchdog
> > > panic when multiple streams start and stop concurrently with small
> > > period sizes.
> > >
> > > Replace hrtimer_cancel() in loopback_hrtimer_stop() with the non-blocking
> > > hrtimer_try_to_cancel(), matching the behavior of jiffies timers
> > > (timer_delete vs timer_delete_sync). If try_to_cancel returns -1
> > > because the handler is running, CPU A releases cable->lock cleanly.
> > > When the running handler subsequently acquires cable->lock, it observes
> > > that the stream is no longer in running state (cleared by trigger STOP)
> > > and terminates without re-arming the timer. Synchronous hrtimer_cancel()
> > > remains preserved in loopback_hrtimer_stop_sync() where cable->lock is
> > > not held.
> > >
> > > Fixes: bf08a5f698dc ("ALSA: aloop: Add 'hrtimer' option to timer_source")
> > > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> >
> > While I find it's fine to change like this, I wonder whether you
> > really hit a CPU deadlock.  Or it's just hypothetical?
> >
> >
> > thanks,
> >
> > Takashi
