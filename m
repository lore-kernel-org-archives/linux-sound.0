Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023A1B4156
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568735; cv=none; b=iUGiCbkC8tGyNuuFT0NTeAjV7UNxbnAKsb+bN5nMAMOWt3MZHMWZR7gJZnNa8k4cqlZky54jiWtSPl9ZGqNC+W3jvN8a/eoY1veGOSdNIWlNSEsIqwNGzeL584REt8XFNeKkwWhoFlzw9Kv4SvrgIwuBCKIgeE6bwvc8sRX8duI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568735; c=relaxed/simple;
	bh=38nMtq0tNVM/C3DDXwzPSxU86lDCGJ2qz9eGJNpfybQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3RCnGXXX9NO3VLQQHGN2yDA4CqymNPHERmptGvVHB7Uiaqn0gfw8yeOlUC09Yo4S56NHmAzy+wgESnbwye7kci38lwLcTa/evDuxTGw6XXVb3KPZu17igzkAnq9qHCibncn+nZ2RBaKQt9zgU3tRGooShzwNE78plvJ+GNevvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NQlquHya; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X07CSxzl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NQlquHya; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X07CSxzl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQlquHya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X07CSxzl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQlquHya";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X07CSxzl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1DA0F4D2D5;
	Tue,  7 Apr 2026 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775568732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l22sfCBxEd7ruid6Zse7EcmU6hzQaQFMg439S66bKrQ=;
	b=NQlquHyaW7v+tAhfFMgqkspC7YIhnY+IyRjImroyNy6pDPfeTGVS3atokVh91YwScoxHE2
	RroRIFQ5/b2iTPT8wFhzRrERz3hh0i3uOnLwR+4jalZZ6NOSjjfFPORwI/NxfmkLakC18G
	la+r6V7JiMFBIpq5anUE3AsxEF3GKg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775568732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l22sfCBxEd7ruid6Zse7EcmU6hzQaQFMg439S66bKrQ=;
	b=X07CSxzlZvBejizqIs0ZUhGnW/R1B5iR5H0k2MUwSmJ7LvwDwzznurzk/ybCn+z3cCDPVm
	2uMiiUYx3pmybKBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NQlquHya;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X07CSxzl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775568732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l22sfCBxEd7ruid6Zse7EcmU6hzQaQFMg439S66bKrQ=;
	b=NQlquHyaW7v+tAhfFMgqkspC7YIhnY+IyRjImroyNy6pDPfeTGVS3atokVh91YwScoxHE2
	RroRIFQ5/b2iTPT8wFhzRrERz3hh0i3uOnLwR+4jalZZ6NOSjjfFPORwI/NxfmkLakC18G
	la+r6V7JiMFBIpq5anUE3AsxEF3GKg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775568732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l22sfCBxEd7ruid6Zse7EcmU6hzQaQFMg439S66bKrQ=;
	b=X07CSxzlZvBejizqIs0ZUhGnW/R1B5iR5H0k2MUwSmJ7LvwDwzznurzk/ybCn+z3cCDPVm
	2uMiiUYx3pmybKBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 013204A0B0;
	Tue,  7 Apr 2026 13:32:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3doqO1sH1WnlVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Apr 2026 13:32:11 +0000
Date: Tue, 07 Apr 2026 15:32:11 +0200
Message-ID: <87eckqnbfo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maarten Lankhorst <m.b.lankhorst@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ctxfi: Limit PTP to a single page
In-Reply-To: <81e252e0-98a9-43ba-af54-e2ed152345b7@harin.net>
References: <20260406074857.216034-1-me@harin.net>
	<871pgsmpzv.wl-tiwai@suse.de>
	<81e252e0-98a9-43ba-af54-e2ed152345b7@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1DA0F4D2D5

On Mon, 06 Apr 2026 12:32:43 +0200,
Harin Lee wrote:
> 
> On 4/6/26 5:50 PM, Takashi Iwai wrote:
> > On Mon, 06 Apr 2026 09:48:57 +0200,
> > Harin Lee wrote:
> >> 
> >> Commit 391e69143d0a increased CT_PTP_NUM from 1 to 4 to support 256
> >> playback streams, but the additional pages are not used by the card
> >> correctly. The CT20K2 hardware already has multiple VMEM_PTPAL
> >> registers, but using them separately would require refactoring the
> >> entire virtual memory allocation logic.
> >> 
> >> ct_vm_map() always uses PTEs in vm->ptp[0].area regardless of
> >> CT_PTP_NUM. On AMD64 systems, a single PTP covers 512 PTEs (2M). When
> >> aggregate memory allocations exceed this limit, ct_vm_map() tries to
> >> access beyond the allocated space and causes a page fault:
> >> 
> >>    BUG: unable to handle page fault for address: ffffd4ae8a10a000
> >>    Oops: Oops: 0002 [#1] SMP PTI
> >>    RIP: 0010:ct_vm_map+0x17c/0x280 [snd_ctxfi]
> >>    Call Trace:
> >>    atc_pcm_playback_prepare+0x225/0x3b0
> >>    ct_pcm_playback_prepare+0x38/0x60
> >>    snd_pcm_do_prepare+0x2f/0x50
> >>    snd_pcm_action_single+0x36/0x90
> >>    snd_pcm_action_nonatomic+0xbf/0xd0
> >>    snd_pcm_ioctl+0x28/0x40
> >>    __x64_sys_ioctl+0x97/0xe0
> >>    do_syscall_64+0x81/0x610
> >>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >> 
> >> Revert CT_PTP_NUM to 1. The 256 SRC_RESOURCE_NUM and playback_count
> >> remain unchanged.
> >> 
> >> Fixes: 391e69143d0a ("ALSA: ctxfi: Bump playback substreams to 256")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Harin Lee <me@harin.net>
> > 
> > Applied to for-next branch now, as it's no regression in 7.0, per se.
> > 
> > But, I wonder whether fixing in ctvmem.c would be relatively easy.
> > Isn't it only about ct_vm_map() and ct_get_ptp_phys()?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> Hi Takashi.
> 
> info.vm_pgt_phys is set in atc_create_hw_devs().
> 
>   ...
>   /* Initialize card hardware. */
>   info.rsr = atc->rsr;
>   info.msr = atc->msr;
>   info.vm_pgt_phys = atc_get_ptp_phys(atc, 0);
>   err = hw->card_init(hw, &info);
>   if (err < 0)
>     return err;
>   ...
> 
> The atc_get_ptp_phys() function actually calls ct_get_ptp_phys().
> However, the index is 0, which only retrieves the address of the
> first PTP.
> 
> The hw_trn_init() for CT20K1 and CT20K2 writes the value of
> info.vm_pgt_phys to the hardware registers.
> 
>   ...
>   ptp_phys_low = (u32)info->vm_pgt_phys;
>   ptp_phys_high = upper_32_bits(info->vm_pgt_phys);
>   ...
> 
> CT20K1 implementation writes to the PTPALX and PTPAHX registers.
> CT20K2 implementation writes same single PTP address to all 64
> VMEM_PTPAL and VMEM_PTPAH registers.
> 
> We don't know if CT20K2 hardware actually supports independent PTPs,
> and refactoring would be risky. So I think the current approach is
> the safest for now.
> 
> This is what I've found so far.

Makes sense.  As already mentioned, your patch was applied.
If any further development to extend PTPs again, feel free to
resubmit.


thanks,

Takashi
