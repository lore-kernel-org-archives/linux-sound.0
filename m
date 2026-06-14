Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053A2EB5B8
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781427498; cv=none; b=h+VLcRAqOneYO7JYbDJQwwnmBm/CdK/Bose5yNsDWT0x51gt9HVUhh3jxlKVqBSbenDT74Ni1481Ayb2WeqwrEXTPWzA8KTikDRQYLLjcR6d5qfhi0P26T1FELvFw12HC8PdCl/m4g28GwOjBLw4/SIW+JdQBh4nJa7hWunDsGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781427498; c=relaxed/simple;
	bh=6M2LosQ17iXnEBTey+yJb6+Td6SbPTW79Ez2GVwfZHA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cblajLyGVPwg/YEBdf3oY2a03h5+r+qM75aBpixtxyvikLNj3Qw7t4u1QYtMKRNolQT9s/gB3lpW2rsKBwE96R65IFMvwd5eUSFGLR1yHLY5O25/khis8JR1JuVpnVOKjDOlKgpCTDnyb8AFJNv++N52AB859GmyviSyY+k/J6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f8Z2LQ9m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zwcnB5cS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f8Z2LQ9m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zwcnB5cS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f8Z2LQ9m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zwcnB5cS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f8Z2LQ9m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zwcnB5cS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38E276A81D;
	Sun, 14 Jun 2026 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781427489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sxl+JHwqrTgzddJCqAkcNO4dkkKXlGakMXoMXc/jgRw=;
	b=f8Z2LQ9mkOcfXfbgMQMI7eLfPt9ifxHhOynA2WPESFAaheXmzi8dXb6XuRQ8y+U77Pxw4j
	z3qCO1dWurpl4+gdMv2qewwjUV2n/FYQ8h8M17PsLsaFBoQItd5m7/gE+ra1VWGHVNArsM
	rOCDrBbw0EwQvc6vFuTGvhgQUDSTYlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781427489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sxl+JHwqrTgzddJCqAkcNO4dkkKXlGakMXoMXc/jgRw=;
	b=zwcnB5cSJwsfYA1UBHnPxYvwVnJNYSppQUj3YQSyhKm0LGASwnL2DftdsfTAI79fljFo49
	GD6/vCo7F7rBzbAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f8Z2LQ9m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zwcnB5cS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781427489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sxl+JHwqrTgzddJCqAkcNO4dkkKXlGakMXoMXc/jgRw=;
	b=f8Z2LQ9mkOcfXfbgMQMI7eLfPt9ifxHhOynA2WPESFAaheXmzi8dXb6XuRQ8y+U77Pxw4j
	z3qCO1dWurpl4+gdMv2qewwjUV2n/FYQ8h8M17PsLsaFBoQItd5m7/gE+ra1VWGHVNArsM
	rOCDrBbw0EwQvc6vFuTGvhgQUDSTYlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781427489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sxl+JHwqrTgzddJCqAkcNO4dkkKXlGakMXoMXc/jgRw=;
	b=zwcnB5cSJwsfYA1UBHnPxYvwVnJNYSppQUj3YQSyhKm0LGASwnL2DftdsfTAI79fljFo49
	GD6/vCo7F7rBzbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08415779A7;
	Sun, 14 Jun 2026 08:58:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NfC9ACFtLmqWYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Jun 2026 08:58:09 +0000
Date: Sun, 14 Jun 2026 10:58:08 +0200
Message-ID: <87y0ghmrbz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2 1/2] ALSA: seq: oss: Serialize readq reset state with q->lock
In-Reply-To: <20260614004801.3507773-1-zzzccc427@gmail.com>
References: <20260614004801.3507773-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 38E276A81D
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sun, 14 Jun 2026 02:48:00 +0200,
Cen Zhang wrote:
> 
> snd_seq_oss_readq_clear() resets qlen, head, and tail without
> q->lock even though the normal reader and producer paths serialize the
> same ring state under that spinlock. A reset can therefore race
> snd_seq_oss_readq_free() or snd_seq_oss_readq_put_event() and leave
> stale records in the queue, drop freshly queued ones, or report the
> wrong readiness after wakeup. KCSAN reports a data race between
> snd_seq_oss_readq_clear() and snd_seq_oss_readq_free().
> 
> Take q->lock while clearing the ring and resetting input_time. Factor
> the enqueue logic into a caller-locked helper so
> snd_seq_oss_readq_put_timestamp() updates its suppression state under
> the same lock instead of racing the reset path.
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
> reset path:                      locked readq updater:
> 1. snd_seq_oss_reset() or        1. A reader or callback producer
>    release reaches                  takes q->lock on the same queue.
>    snd_seq_oss_readq_clear().
> 2. snd_seq_oss_readq_clear()     2. The updater tests or modifies
>    resets qlen, head, tail,         qlen, head, and tail.
>    and input_time.
> 3. snd_seq_oss_readq_clear()     3. The updater completes its
>    wakes sleepers on                read-modify-write sequence.
>    q->midi_sleep.
> 4. Without q->lock, the reset    4. The resulting ring state drives
>    can overlap the locked           later reads and readiness.
>    update.
> 
> KCSAN reports:
> 
> BUG: KCSAN: data-race in snd_seq_oss_readq_clear /
> snd_seq_oss_readq_free
> 
> write to 0xffff8881069fe608 of 4 bytes by task 120516 on cpu 0:
>   snd_seq_oss_readq_free+0x6c/0x80
>   snd_seq_oss_read+0xcb/0x250
>   odev_read+0x38/0x60
>   vfs_read+0xff/0x600
>   ksys_read+0xb4/0x140
>   __x64_sys_read+0x46/0x60
>   do_syscall_64+0xbb/0x2f0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> read to 0xffff8881069fe608 of 4 bytes by task 120517 on cpu 1:
>   snd_seq_oss_readq_clear+0x1f/0x90
>   snd_seq_oss_reset+0xa7/0xf0
>   snd_seq_oss_ioctl+0x6f6/0x7e0
>   odev_ioctl+0x56/0xc0
>   __x64_sys_ioctl+0xd1/0x120
>   do_syscall_64+0xbb/0x2f0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> value changed: 0x00000001 -> 0x00000000
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied both patches now to for-next branch.  Thanks.


Takashi
