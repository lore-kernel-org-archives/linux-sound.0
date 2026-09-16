Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2043F482C
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543911; cv=none; b=Tl18ECE8CTvPvg+4NtJC/+xrq/CmYHAQHbReXlNY56ULl6uaoHmfmXDhEAiUe6cyP9MUbNx1lkiiQc4FBOvvyvcQM0Bc2dREG3+CqpUqBP9XkUodiFDmPylbf4XRlN4Pl6ZtaNBZJ2bwvwmvR80kKe2XkcfDsAQqt7XveFHDH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543911; c=relaxed/simple;
	bh=k9/OXOzr29qRShTEbf+KKq1jP5gjyFDeznEktudFN2w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgQ5NpQGLw0QYbbzRIHzWvgyUULIu1pxN98q1yUM9mD6WM6NkcrALx9/jtZxBkS/bCXI44dHpPeDPw+wpX+YjewOv5BkDr3tkoR2CNFz5wqFkTQh8RCT2uiSPqoSOZoyG3jDZNI4nSUTPd0Y02LwN/hA4Vk25QfhHnBkN0SkZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eGqThv2J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iE13cZQC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PaC9pp24; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rX7XHnO0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eGqThv2J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iE13cZQC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PaC9pp24";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rX7XHnO0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4258A21DD6;
	Wed, 16 Sep 2026 07:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789543893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g21hH9i2PAVCsWw8NiYc2dOuSw5+MhGfwC4Z+lwMLTU=;
	b=eGqThv2JOWmnoV/sCARODZ6I7Y2HiN6WE4ayX4laMQuPa5whYc4x0JcZxjPGp93lz3pPnF
	vYFvoJmObhtZ79dgDU5cUjW1Y7lzD7odycbrbT9rzqBM7/dHXPhelq4VFQeEUHqP/j/8Gi
	Bbu+V42grAGFohPFFhMqd7ZURUkYLGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789543893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g21hH9i2PAVCsWw8NiYc2dOuSw5+MhGfwC4Z+lwMLTU=;
	b=iE13cZQCxA1U5YFyEP+wT14pOS4NIBxgwTi3XAZak7y4S2bE0FGhouRi6YwnMmT5hPt/77
	cfY4K4stdPkD4NBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789543889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g21hH9i2PAVCsWw8NiYc2dOuSw5+MhGfwC4Z+lwMLTU=;
	b=PaC9pp24yjYpZOKCdli+X21RrGwJTbFUkN3gujNXCZ+h4avNLZQkEhaKJKkqEzdu5pXeqT
	pTFA9LGFmMf54Qm1lQj5m06vsJjaBSzL1YMg9fcPBjivPVCTQtrftuuoeAe7nO/1Qmxtag
	1y4OUSuWdpdvXNfd/fyveuO0utXHQLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789543889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g21hH9i2PAVCsWw8NiYc2dOuSw5+MhGfwC4Z+lwMLTU=;
	b=rX7XHnO0K1HVItbJADpngNgSSJX4KHW7itCgB0PpEaMwYnC3n3ipQTcZgtGr72555ss3Dx
	yF0XmMZ2hpPKoCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C746E136D1;
	Wed, 16 Sep 2026 07:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n0l/J9BFqmrEEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 07:31:28 +0000
Date: Wed, 16 Sep 2026 09:31:28 +0200
Message-ID: <877bkllkj3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	syzbot+9fe3b8d9f5c64ff410a7@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: usb-audio: fix list_add double-add in push_back_to_ready_list
In-Reply-To: <20260915163110.58124-1-ngocthang2710.1999@gmail.com>
References: <20260915163110.58124-1-ngocthang2710.1999@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[9fe3b8d9f5c64ff410a7];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Tue, 15 Sep 2026 18:31:10 +0200,
Nguyen Ngoc Thang wrote:
> 
> stop_urbs() clears ep->ready_playback_urbs with a bare INIT_LIST_HEAD()
> instead of unlinking each queued snd_urb_ctx. If a URB survives past
> wait_clear_urbs()'s forced STOPPING->STOPPED timeout, its ctx is left
> looking "linked" (stale next/prev) even though the list head has
> forgotten it. When the endpoint later restarts and re-queues that same
> ctx onto the (now real) ready list, and the old URB's completion
> handler then calls push_back_to_ready_list() for it a second time, the
> ctx is still the list's own tail and list_add's double-add check trips:
> 
>   kernel BUG at lib/list_debug.c:35 (list_add double add)
> 
> Guard push_back_to_ready_list() with a list_empty() check so a
> still-linked ctx isn't re-added, and make stop_urbs() actually unlink
> each ctx via list_del_init() instead of only resetting the head, so a
> dropped ctx doesn't keep looking linked to that guard.
> 
> Reported-by: syzbot+9fe3b8d9f5c64ff410a7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9fe3b8d9f5c64ff410a7
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Note: I was not able to trigger the actual crash. dummy_hcd doesn't
> expose isochronous endpoints by default; after patching that locally
> for testing, 1600 PREPARE/START/DRAIN cycles plus a
> WARN_ON(!list_empty(&ctx->ready_list)) probe in push_back_to_ready_list()
> never hit the race window (wait_clear_urbs() never logged a "timeout:
> still N active urbs", so the forced STOPPING->STOPPED path was never
> even exercised in this setup). This fix is based on static analysis of
> the reported stack trace and the stop_urbs()/wait_clear_urbs()/
> push_back_to_ready_list() interaction, not a confirmed repro. Sharing
> in case someone with real hardware or a working reproducer can verify.

Applied now.  Thanks.


Takashi
