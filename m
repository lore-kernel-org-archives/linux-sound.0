Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A848989F
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569594; cv=none; b=Bv/gi8eftTiqNyZ13fFk0Gir3KCTOK5klzNvZqV5ol7bPBm/7XoUefnAVZrVbeZ8D5NMQAIdcb370HvWjXzpWZ44ry7CCegVmTYE1sPl4W4pgWUz7emL8iEuk/2a/BIbLAUj1K1pNbgYiXCXyO1dgHFpOA8XmIiaz3stNMdPgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569594; c=relaxed/simple;
	bh=i2OsbGNh7busLZujNnZjk0EfI9pBuKtoE2LGOCTQMTY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bl7aDA4SiIQW5atUJBGhbFvVVET+n293Mu7CDIeuNa7QVe/0EiAQLPI+GE5Rd0IzjGXVMqNl0Mt+7BjJ3tCl94EW3ndccxxj5kH9NCXLGpYzBh6huP9RF389I9krPg+r/FVHbUpVoIrYDFbqbSs3zENNIvQoPMwrijzwAig5Rds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R56IfNCh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UqiSNjgx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q9d9JspA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6jo340p; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R56IfNCh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UqiSNjgx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q9d9JspA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6jo340p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 497BA4368;
	Sat,  1 Aug 2026 07:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785569587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zc1Sza81blDIPIFfOAma4hMYgzUu+YlG+380s2zb52o=;
	b=R56IfNCh3TDp4fMTbbRQ2vh217yfdqzr3GUYUX2HWlpo/fK5IVKd8TdnCWndVi/IghRxCN
	avlTtDTnLh4xuKXzR0zAAhT4oYaTW5QNvw8b3lp2fMv70nAcVnObl1LPZwgIn4cXihzi/G
	MPzS88KIMj078nbdRsMq6reYbvefOew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785569587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zc1Sza81blDIPIFfOAma4hMYgzUu+YlG+380s2zb52o=;
	b=UqiSNjgxJ8hw+XuURvRXxFMEIp8Wquxtkaf0xzuboMPwnj1XrFp8YgxpPgLrkqWd88rH6C
	V40svqWe6OhSM2DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785569583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zc1Sza81blDIPIFfOAma4hMYgzUu+YlG+380s2zb52o=;
	b=q9d9JspAJEYhZfYIBdKTEfN4w06rbuwCfUQ70AzCCxO/GFo4sygpqNUq6gKMOHmv1z/A2+
	FWusz1qPWDxRWxMynD5SW+s+/3Xk53AMffFLMEbzGYEk62F6d3qZMMTAtll2glGcmWztNC
	/Gnc9qeawklu/B6k90uX8wqYvQKQIWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785569583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zc1Sza81blDIPIFfOAma4hMYgzUu+YlG+380s2zb52o=;
	b=f6jo340pEqjWYQUwqy7hCeaQLbkYqO3L2HlPUS8LKej8WvbOFacw4DxG7LVijScO52H9Se
	A0lVaMnTG/XWyGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EFEC779BF;
	Sat,  1 Aug 2026 07:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A5fcAS+hbWoMOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 01 Aug 2026 07:33:03 +0000
Date: Sat, 01 Aug 2026 09:33:02 +0200
Message-ID: <8733wycn2p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Cc: linux-kernel@vger.kernel.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: aloop: Fix spinlock deadlock in loopback_hrtimer_stop()
In-Reply-To: <20260731074255.1513402-1-yuhsuan@chromium.org>
References: <20260731074255.1513402-1-yuhsuan@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 31 Jul 2026 09:39:35 +0200,
Yu-Hsuan Hsu wrote:
> 
> In loopback_hrtimer_stop(), calling hrtimer_cancel() while holding
> cable->lock triggers an AB-BA spinlock deadlock if the hrtimer softirq
> is executing concurrently on another CPU:
> 
> 1) CPU A runs loopback_trigger(STOP), acquires spin_lock(&cable->lock),
>    and calls hrtimer_cancel(). Since hrtimer_cancel() is synchronous,
>    it spins waiting for the executing callback to complete before
>    returning.
> 2) CPU B executes loopback_hrtimer_function(), which immediately tries
>    to acquire spin_lock(&cable->lock).
> 
> This mutual dependency leads to a CPU hard lockup and NMI watchdog
> panic when multiple streams start and stop concurrently with small
> period sizes.
> 
> Replace hrtimer_cancel() in loopback_hrtimer_stop() with the non-blocking
> hrtimer_try_to_cancel(), matching the behavior of jiffies timers
> (timer_delete vs timer_delete_sync). If try_to_cancel returns -1
> because the handler is running, CPU A releases cable->lock cleanly.
> When the running handler subsequently acquires cable->lock, it observes
> that the stream is no longer in running state (cleared by trigger STOP)
> and terminates without re-arming the timer. Synchronous hrtimer_cancel()
> remains preserved in loopback_hrtimer_stop_sync() where cable->lock is
> not held.
> 
> Fixes: bf08a5f698dc ("ALSA: aloop: Add 'hrtimer' option to timer_source")
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

While I find it's fine to change like this, I wonder whether you
really hit a CPU deadlock.  Or it's just hypothetical?


thanks,

Takashi
