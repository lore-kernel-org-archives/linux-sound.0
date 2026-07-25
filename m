Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC31130CD92
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784962436; cv=none; b=PcVZFdhF4MzwJrRpg57jhY1p/FIyS37jb3i3apJ4GUweG73uZaIQJTO4qvn0a3Ou+MHQeMLeDSXezbtQl9zjgM7CTO6xG/HeM6HP6jxpzDdAu2g0YRrbKda8hRu8rlDYZdiYUZ8k+fjteUM+zOg0o7Fd85S1hnn3sPd/w3setsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784962436; c=relaxed/simple;
	bh=bhkwJoYNQ5LPlLklCMjnc2s/W8QsleX0Eub7qWrm8hE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebTZkuEKx4PiMS0qSdL2jrg6K7sUjECufETUGGXAUi87mReE8q7e8DSPU/U3I/KF8s9T1nnS3Brfu8Ij7U/0136kgVlcnxkRPmxjw9IAaYTib8V4PCOcSTyL0cv5zlBYBObptzsN03qZJWAJyLzg/OOI9BMzTQ1R2bx/r9/E+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rs6b8o2R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/n+0zg0R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rs6b8o2R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/n+0zg0R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rs6b8o2R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/n+0zg0R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rs6b8o2R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/n+0zg0R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 827E77C13B;
	Sat, 25 Jul 2026 06:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784962432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aV4QhpimtuHzG5VoHM46VGYUqHQ/va9Qf28pdQbxoaA=;
	b=rs6b8o2RVRAG2d82CTlzksRGh9nAsOvxrpg3BPnQ5dGjWqxdarFv7SBoFA+AZyUxIpS8P2
	1Laud8Cb59tdBz3wr0hewKkMc03wuPyYJL46kajVD5qULlx9pdCcVMs9uygyJXldaYBZbH
	MZiNwC0Jocyhexse77MvkhkpevvvSys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784962432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aV4QhpimtuHzG5VoHM46VGYUqHQ/va9Qf28pdQbxoaA=;
	b=/n+0zg0RLhZkCkOiPaSQ+Cso6DZBEZnl7ZGAIl6iAVi7IqmVwQW76hRrQCkbIF4SqighJb
	yZjeq23Lktqh8aDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rs6b8o2R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/n+0zg0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784962432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aV4QhpimtuHzG5VoHM46VGYUqHQ/va9Qf28pdQbxoaA=;
	b=rs6b8o2RVRAG2d82CTlzksRGh9nAsOvxrpg3BPnQ5dGjWqxdarFv7SBoFA+AZyUxIpS8P2
	1Laud8Cb59tdBz3wr0hewKkMc03wuPyYJL46kajVD5qULlx9pdCcVMs9uygyJXldaYBZbH
	MZiNwC0Jocyhexse77MvkhkpevvvSys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784962432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aV4QhpimtuHzG5VoHM46VGYUqHQ/va9Qf28pdQbxoaA=;
	b=/n+0zg0RLhZkCkOiPaSQ+Cso6DZBEZnl7ZGAIl6iAVi7IqmVwQW76hRrQCkbIF4SqighJb
	yZjeq23Lktqh8aDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E8C9779B9;
	Sat, 25 Jul 2026 06:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id moahFYBdZGqHZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 25 Jul 2026 06:53:52 +0000
Date: Sat, 25 Jul 2026 08:53:52 +0200
Message-ID: <87tspnblvj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Norbert Szetei <norbert@doyensec.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: seq: Fix division by zero in initialize_timer()
In-Reply-To: <DF8A3844-AD5E-4B8A-9CFC-BD83C212BA38@doyensec.com>
References: <DF8A3844-AD5E-4B8A-9CFC-BD83C212BA38@doyensec.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 827E77C13B
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sat, 25 Jul 2026 08:33:45 +0200,
Norbert Szetei wrote:
> 
> A userspace-driven ALSA timer (SND_UTIMER) lets an unprivileged user set
> the backing snd_timer's hardware resolution to an arbitrary 64-bit value
> via SNDRV_TIMER_IOCTL_CREATE. snd_utimer_create() only rejects zero.
> 
> When such a timer is bound to a sequencer queue, initialize_timer()
> computes the tick period as
> 
> 	tmr->ticks = 1000000000 / (r * freq);
> 
> where r is that user-controlled resolution and freq is the sequencer
> update rate in Hz, clamped to MIN_FREQUENCY..MAX_FREQUENCY (10..6250).
> A resolution of 2^63 makes the 64-bit product r * freq wrap to zero for
> any even freq, including DEFAULT_FREQUENCY (1000), so the division faults
> with a divide-by-zero.
> 
> The division runs under tmr->lock with interrupts disabled, so the oops
> leaves the spinlock held and hangs the CPU. It is reachable by an
> unprivileged user with access to /dev/snd/timer and /dev/snd/seq.
> 
>   Oops: divide error: 0000 [#1] SMP KASAN PTI
>   CPU: 7 UID: 1000 PID: 456 Comm: alsa_seq_utimer Not tainted 7.2.0-rc4+
>   RIP: 0010:initialize_timer.constprop.0+0x20a/0x2d0
>    snd_seq_timer_start+0x15e/0x2b0
>    snd_seq_control_queue+0x56f/0xba0
>    snd_seq_write+0x3e0/0x730
> 
> Reject an overflowing product with check_mul_overflow() and fall back to
> a single tick, which also avoids feeding a wrapped-but-nonzero divisor
> (e.g. 2^63 * 1000 mod 2^64 == 0, or other resolutions wrapping to a small
> value) into the period computation.
> 
> Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven timers")
> Cc: <stable@vger.kernel.org>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>

Thanks, applied now.


Takashi
