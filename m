Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F13BA34
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858984; cv=none; b=X4FEXQKJUaaZY/ImP2CqGqEB+PXXjrCTW+InnXXnBQNxZhDsxdi9fxbaEHlihkFfz4YBcy65PtsQczlzupok7pI3XV5pbEDbyiklNor3ibQzlaie7oZygRsL1WaDIi2jW58kLFJ3NWMrtTqf6tb3XXilQL8Ig/XfcbS+K1Inkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858984; c=relaxed/simple;
	bh=MBeFmpVa0nvRgd11LrsNrJRvyhSnsVLHPP+EXuyX2lQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsCipVCE8lEFnkRRLgnzPUnEq0eV0bMUpdHyoshdtwBOPWbPHU6ameTDIA7aXFq4YxLYfWDL4rZOMn5Z+s61WLzR10Utdj9hdowfSqWo7W32d0EKtGH/UwdNAxfSWuWtL46m+bjo8x/i3DfkKorxsc4EmgK7PVGsq/sBTnpyfSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e28LJABC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=17Gm3lRE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e28LJABC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=17Gm3lRE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e28LJABC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="17Gm3lRE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e28LJABC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="17Gm3lRE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50D1C6D9AB;
	Fri, 19 Jun 2026 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781858981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DtvHiaEjA/t6oWw0sA/0dNAtjN8/iz/ew7ZA7/X9Nw=;
	b=e28LJABCqAVYqzSdO6p0w6FLyVcO7Ru42VYuMWLKicz1aKWGcgx/1aBuyzpNDvzEPHPPGx
	eGLiKjZ9DiChiGtFugUBMY2IHh+8IlpNZ0iCjjKSOCFBuMiM/dem8ggalNY2F2dbTstP95
	LvOq8eMN0AVCJRYTaAihbbrFXC5fGrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781858981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DtvHiaEjA/t6oWw0sA/0dNAtjN8/iz/ew7ZA7/X9Nw=;
	b=17Gm3lREopUO68u8b9db1/lBPlcQeXMglnLvGTKTV9Pgogl/hP325y+OoJXGTnEKDpZIL7
	zTxpDL4WhT/XAzCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e28LJABC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=17Gm3lRE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781858981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DtvHiaEjA/t6oWw0sA/0dNAtjN8/iz/ew7ZA7/X9Nw=;
	b=e28LJABCqAVYqzSdO6p0w6FLyVcO7Ru42VYuMWLKicz1aKWGcgx/1aBuyzpNDvzEPHPPGx
	eGLiKjZ9DiChiGtFugUBMY2IHh+8IlpNZ0iCjjKSOCFBuMiM/dem8ggalNY2F2dbTstP95
	LvOq8eMN0AVCJRYTaAihbbrFXC5fGrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781858981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DtvHiaEjA/t6oWw0sA/0dNAtjN8/iz/ew7ZA7/X9Nw=;
	b=17Gm3lREopUO68u8b9db1/lBPlcQeXMglnLvGTKTV9Pgogl/hP325y+OoJXGTnEKDpZIL7
	zTxpDL4WhT/XAzCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 221AB779A8;
	Fri, 19 Jun 2026 08:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pO4MB6UCNWoeSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 08:49:41 +0000
Date: Fri, 19 Jun 2026 10:49:40 +0200
Message-ID: <877bnukj8b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v3] ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
In-Reply-To: <20260618170010.191433-1-zzzccc427@gmail.com>
References: <20260618170010.191433-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 50D1C6D9AB
X-Spam-Score: -3.51

On Thu, 18 Jun 2026 19:00:10 +0200,
Cen Zhang wrote:
> 
> MIDI 2.0 input URBs are started during snd_usb_midi_v2_create(). A
> later setup failure can still jump to snd_usb_midi_v2_free(), which
> currently frees each endpoint and its coherent URB buffers without first
> stopping the submitted URBs. A completion can then dereference the
> embedded URB context and endpoint state after they have been freed, or
> try to resubmit from the stale endpoint.
> 
> This was observed as a KASAN slab-use-after-free in
> input_urb_complete().
> 
> The buggy scenario involves two paths, with each column showing the order
> within that path:
> 
> probe error path:                         USB completion path:
> 1. start_input_streams() submits          1. The HCD still owns a
>    input URBs.                               submitted input URB.
> 2. A later setup helper returns           2. input_urb_complete() runs
>    an error.                                 with urb->context in ep.
> 3. snd_usb_midi_v2_free() frees           3. The completion reads ep
>    endpoint storage and URB buffers.         state and can requeue URBs.
> 
> Make the endpoint destructor follow the same teardown ordering used for
> disconnect when the endpoint has not already been disconnected: publish
> ep->disconnected, kill the URBs synchronously, and drain the endpoint
> before freeing URB buffers and endpoint storage. The guard avoids
> repeating the stop sequence after the normal
> snd_usb_midi_v2_disconnect_all() path, while still synchronizing the
> direct MIDI 2.0 create-error free path.
> 
> Validation reproduced this kernel report:
> BUG: KASAN: slab-use-after-free in input_urb_complete+0x37/0x1b0
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:_raw_spin_unlock_irq+0x2e/0x50
> Read of size 8
> Call trace:
>   dump_stack_lvl+0x77/0xb0
>   print_report+0xce/0x5f0
>   input_urb_complete+0x37/0x1b0 (sound/usb/midi2.c:186)
>   srso_alias_return_thunk+0x5/0xfbef5
>   __virt_addr_valid+0x19f/0x330
>   kasan_report+0xe0/0x110
>   __usb_hcd_giveback_urb+0x112/0x1d0
>   dummy_timer+0xaaa/0x19a0
>   lock_is_held_type+0x9a/0x110
>   __lock_acquire+0x467/0x28b0
>   mark_held_locks+0x40/0x70
>   _raw_spin_unlock_irqrestore+0x44/0x60
>   lockdep_hardirqs_on_prepare+0xbb/0x1a0
>   __hrtimer_run_queues+0x101/0x520
>   hrtimer_run_softirq+0xd0/0x130
>   handle_softirqs+0x15b/0x670
>   __irq_exit_rcu+0xd0/0x170
>   irq_exit_rcu+0xe/0x20
>   sysvec_apic_timer_interrupt+0x6c/0x80
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20
> 
> Fixes: d9c99876868c ("ALSA: usb-audio: Create UMP blocks from USB MIDI GTBs")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied now.  Thanks.


Takashi
