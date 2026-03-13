Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7836F432
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392474; cv=none; b=TimaBaeTtW9LdEKhe8qShpTSZrJrU0QYdUEg51D6pk0zU33xJ8TE+foRXbww07aQCSg0+Lf+81F/lyOS8vpnzPyskYCOFMKfnKovWNcosK2k2/iCnXFgf3OC7KwHCmuSWpCFxFr0znr6Xu9QSIbpa6UsgWa3IZKiss2UyQrLOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392474; c=relaxed/simple;
	bh=JlTx5a63wTAZhBfrfLCzEgH9ZDJQki+0O5324I7oOas=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qgH4EUippbXiCjy6sl9uysmoxap4hsH87KkdKmWCJ5qCwPEQ89QpaMWworg3bqOiHLQElwWrMrGfcVJi4GNVxnuCFsHmiEsavJO3OfkMHHRMpD01IccCKPx6HDZZRuiLaUTQ6yfEm6fqfZyyjtSLY8dnybEekXZywhcdAGIhd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iXQSgIlf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kytg5uAx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iXQSgIlf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kytg5uAx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iXQSgIlf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kytg5uAx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iXQSgIlf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kytg5uAx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F2395C4B5;
	Fri, 13 Mar 2026 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773392470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ldHnN4HuVyCnGiQQzwoktGmkoN/pHuvhtVz0qzi88I=;
	b=iXQSgIlfU0Y9IWs76mdE5ILxYsapUMjC2pNpK05D6JIivER0nUarj4cZJZ+JHX0YIfRj1h
	JlhKIwWL6LKBCCN/LmTRuvf5oVCz3fdnyDiWNjt1JH0144esUDoK94Ij4JkoKtPJOINlNp
	Ez7TNOPXfc4Op8bT6qgpj5dgixW/kkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773392470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ldHnN4HuVyCnGiQQzwoktGmkoN/pHuvhtVz0qzi88I=;
	b=kytg5uAx8zOtZHmYvB9HUdRfeLy4jnSEGyCyyqVH1c33QIPnt3jo1pn2kKznU3hO4B/8/v
	8DZEBgUpav/sEPDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773392470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ldHnN4HuVyCnGiQQzwoktGmkoN/pHuvhtVz0qzi88I=;
	b=iXQSgIlfU0Y9IWs76mdE5ILxYsapUMjC2pNpK05D6JIivER0nUarj4cZJZ+JHX0YIfRj1h
	JlhKIwWL6LKBCCN/LmTRuvf5oVCz3fdnyDiWNjt1JH0144esUDoK94Ij4JkoKtPJOINlNp
	Ez7TNOPXfc4Op8bT6qgpj5dgixW/kkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773392470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ldHnN4HuVyCnGiQQzwoktGmkoN/pHuvhtVz0qzi88I=;
	b=kytg5uAx8zOtZHmYvB9HUdRfeLy4jnSEGyCyyqVH1c33QIPnt3jo1pn2kKznU3hO4B/8/v
	8DZEBgUpav/sEPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F0F04043F;
	Fri, 13 Mar 2026 09:01:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kuggBlbSs2kkZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Mar 2026 09:01:10 +0000
Date: Fri, 13 Mar 2026 10:01:09 +0100
Message-ID: <87qzpoaysq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Martin Pechstein <martin.pechstein@posteo.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: BUG: snd_ctxfi Oops in set_field() with Creative X-Fi Titanium (EMU20k2, 1102:000b) on Linux 6.19.x, regression from 6.18
In-Reply-To: <170a3c247d8b94a2e5714ca0641a91511c9808d3.camel@posteo.de>
References: <170a3c247d8b94a2e5714ca0641a91511c9808d3.camel@posteo.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.37
X-Spam-Level: 
X-Spamd-Result: default: False [-1.37 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	R_MIXED_CHARSET(1.93)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

[ Let's move to linux-sound ML as it's the main ML for kernel issues ]

On Fri, 13 Mar 2026 05:40:41 +0100,
Martin Pechstein wrote:
> 
> Hi,
> 
> I am reporting a reproducible kernel Oops in the ALSA driver snd_ctxfi
> (sound/pci/ctxfi) with a Creative Sound Blaster X-Fi Titanium
> (EMU20k2, PCI ID 1102:000b, subsystem 1102:0042).
> 
> This appears to be a regression in Linux 6.19.x.
> 
> Good:
> - linux-lts 6.18.x: driver loads normally, no crash, card works
> 
> Bad:
> - linux 6.19.5.arch1-1
> - linux 6.19.6.arch1-1
> - linux-zen 6.19.5.zen1-1
> - linux-zen 6.19.6.zen1-1

To be exact: does 6.18.8 work for you?  This kernel contains my recent
upstream fix 61006c540cbd ("ALSA: ctxfi: Fix potential OOB access in
audio mixer handling"), and I'd like to know whether this one is the
culprit or not.

> The crash happens during early boot when udev loads snd_ctxfi.
> The kernel hits:
> 
>   BUG: unable to handle page fault
>   RIP: set_field+0x30/... [snd_ctxfi]
> 
> Call trace includes:
> 
>   daio_mgr_enb_dai
>   daio_mgr_enb_daio
>   get_daio_rsc
>   atc_get_resources
>   ct_atc_create
>   ct_card_probe
> 
> Hardware:
> 05:00.0 Audio device [0403]: Creative Labs EMU20k2
> [Sound Blaster X-Fi Titanium Series] [1102:000b] (rev 04)
> Subsystem: Creative Labs Device [1102:0042]
> Kernel driver in use: snd_ctxfi
> 
> System:
> - Mainboard: ASRock B450 Pro4
> - BIOS: P10.44 (2025-11-26)
> 
> Kernel:
> Linux PC 6.19.6-arch1-1 #1 SMP PREEMPT_DYNAMIC Wed, 04 Mar 2026
> 18:25:08 +0000 x86_64 GNU/Linux
> 
> Important note:
> The attached trace was reproduced with no out-of-tree modules loaded,
> so the kernel is untainted for this report.
> 
> Workarounds:
> - blacklisting snd_ctxfi avoids the crash
> - booting linux-lts 6.18.x works correctly
> 
> I have attached:
> - journal-from-oops.txt
> 
> Please let me know if you want me to test additional kernels, patches,
> or provide more debug output.

There have been not so many changes since 6.18, the major ones are
about the support for Onkyo SE-300PCIE with cleanups.

As a quick test, you can simply your working 6.18.x code from
sound/pci/ctxfi/* into 6.19.x kernel, rebuild and check whether the
issue persists or not.  If yes, something in a lower layer broke.


thanks,

Takashi

> 
> Thanks.
> 
> Kind regards
> Mape6
> Mär 11 05:00:57 Sancezz-PC kernel: BUG: unable to handle page fault for address: ffff88cb88dc37b0
> Mär 11 05:00:57 Sancezz-PC kernel: #PF: supervisor read access in kernel mode
> Mär 11 05:00:57 Sancezz-PC kernel: #PF: error_code(0x0000) - not-present page
> Mär 11 05:00:57 Sancezz-PC kernel: PGD 283001067 P4D 283001067 PUD 0 
> Mär 11 05:00:57 Sancezz-PC kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Mär 11 05:00:57 Sancezz-PC kernel: CPU: 1 UID: 0 PID: 707 Comm: (udev-worker) Not tainted 6.19.6-arch1-1 #1 PREEMPT(full)  a70f585a3574c37bff18875a6cf7bd8652b4cbca
> Mär 11 05:00:57 Sancezz-PC kernel: Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./B450 Pro4, BIOS P10.44 11/26/2025
> Mär 11 05:00:57 Sancezz-PC kernel: RIP: 0010:set_field+0x30/0x60 [snd_ctxfi]
> Mär 11 05:00:57 Sancezz-PC kernel: Code: 44 00 00 49 89 f8 85 f6 74 31 31 c9 40 f6 c6 01 75 18 0f 1f 84 00 00 00 00 00 83 c1 01 b8 01 00 00 00 d3 e0 85 f0 74 f2 d3 e2 <41> 8b 00 31 c2 21 f2 31 c2 41 89 10 e9 5f 80 e7 e2 0f 0b e9 58 80
> Mär 11 05:00:57 Sancezz-PC kernel: RSP: 0018:ffffd07300f1f768 EFLAGS: 00010202
> Mär 11 05:00:57 Sancezz-PC kernel: RAX: 00000000ffffffea RBX: ffff88c788dc37e0 RCX: 0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff88cb88dc37b0
> Mär 11 05:00:57 Sancezz-PC kernel: RBP: 00000000ffffffea R08: ffff88cb88dc37b0 R09: 0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: R10: ffffd07300f1f798 R11: ffff88c780b27a20 R12: 0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: R13: ffffffffc0597390 R14: ffff88c788dc3ca8 R15: ffff88c788dc3660
> Mär 11 05:00:57 Sancezz-PC kernel: FS:  00007f5b6bfc0840(0000) GS:ffff88cb09904000(0000) knlGS:0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Mär 11 05:00:57 Sancezz-PC kernel: CR2: ffff88cb88dc37b0 CR3: 000000010fd04000 CR4: 0000000000350ef0
> Mär 11 05:00:57 Sancezz-PC kernel: Call Trace:
> Mär 11 05:00:57 Sancezz-PC kernel:  <TASK>
> Mär 11 05:00:57 Sancezz-PC kernel:  daio_mgr_enb_dai+0x27/0x40 [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  daio_mgr_enb_daio+0x57/0x70 [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  get_daio_rsc+0xd5/0x2c0 [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  atc_get_resources+0x161/0x380 [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  ct_atc_create.cold+0x19e/0x25d [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  ct_card_probe+0xd9/0x200 [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  local_pci_probe+0x42/0x90
> Mär 11 05:00:57 Sancezz-PC kernel:  pci_device_probe+0xda/0x280
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
> Mär 11 05:00:57 Sancezz-PC kernel:  really_probe+0xde/0x380
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  __driver_probe_device+0x78/0x150
> Mär 11 05:00:57 Sancezz-PC kernel:  driver_probe_device+0x1f/0xa0
> Mär 11 05:00:57 Sancezz-PC kernel:  ? __pfx___driver_attach+0x10/0x10
> Mär 11 05:00:57 Sancezz-PC kernel:  __driver_attach+0xcb/0x200
> Mär 11 05:00:57 Sancezz-PC kernel:  bus_for_each_dev+0x85/0xd0
> Mär 11 05:00:57 Sancezz-PC kernel:  bus_add_driver+0x118/0x200
> Mär 11 05:00:57 Sancezz-PC kernel:  ? __pfx_ct_driver_init+0x10/0x10 [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> Mär 11 05:00:57 Sancezz-PC kernel:  driver_register+0x75/0xe0
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  do_one_initcall+0x5b/0x300
> Mär 11 05:00:57 Sancezz-PC kernel:  do_init_module+0x62/0x250
> Mär 11 05:00:57 Sancezz-PC kernel:  init_module_from_file+0xd8/0x140
> Mär 11 05:00:57 Sancezz-PC kernel:  idempotent_init_module+0x114/0x310
> Mär 11 05:00:57 Sancezz-PC kernel:  __x64_sys_finit_module+0x71/0xe0
> Mär 11 05:00:57 Sancezz-PC kernel:  ? syscall_trace_enter+0x8d/0x1d0
> Mär 11 05:00:57 Sancezz-PC kernel:  do_syscall_64+0x81/0x610
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? __x64_sys_pread64+0x9c/0xd0
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? do_syscall_64+0x23b/0x610
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? vfs_statx+0x7a/0x160
> Mär 11 05:00:57 Sancezz-PC kernel:  ? strncpy_from_user+0x30/0x110
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? vfs_fstatat+0x75/0xa0
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? __do_sys_newfstatat+0x3b/0x80
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? do_syscall_64+0x81/0x610
> Mär 11 05:00:57 Sancezz-PC kernel:  ? srso_return_thunk+0x5/0x5f
> Mär 11 05:00:57 Sancezz-PC kernel:  ? exc_page_fault+0x7e/0x1a0
> Mär 11 05:00:57 Sancezz-PC kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Mär 11 05:00:57 Sancezz-PC kernel: RIP: 0033:0x7f5b6b92706d
> Mär 11 05:00:57 Sancezz-PC kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 ec 0c 00 f7 d8 64 89 01 48
> Mär 11 05:00:57 Sancezz-PC kernel: RSP: 002b:00007ffeb3ab14e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> Mär 11 05:00:57 Sancezz-PC kernel: RAX: ffffffffffffffda RBX: 0000562f7269ae50 RCX: 00007f5b6b92706d
> Mär 11 05:00:57 Sancezz-PC kernel: RDX: 0000000000000004 RSI: 00007f5b6bf772f2 RDI: 000000000000002b
> Mär 11 05:00:57 Sancezz-PC kernel: RBP: 00007ffeb3ab1580 R08: 0000000000000000 R09: 0000562f728173f0
> Mär 11 05:00:57 Sancezz-PC kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5b6bf772f2
> Mär 11 05:00:57 Sancezz-PC kernel: R13: 0000000000020000 R14: 0000562f7280ffa0 R15: 0000562f7269ae50
> Mär 11 05:00:57 Sancezz-PC kernel:  </TASK>
> Mär 11 05:00:57 Sancezz-PC kernel: Modules linked in: amdgpu(+) amd_atl intel_rapl_msr snd_hda_codec_atihdmi intel_rapl_common snd_hda_codec_hdmi snd_hda_intel amdxcp drm_panel_backlight_quirks snd_hda_codec gpu_sched drm_buddy snd_hda_core drm_exec kvm_amd drm_suballoc_helper snd_intel_dspcfg drm_ttm_helper snd_intel_sdw_acpi r8169 ee1004 snd_hwdep snd_ctxfi(+) ttm kvm i2c_algo_bit realtek snd_pcm mdio_devres snd_timer irqbypass drm_display_helper libphy snd cec i2c_piix4 rapl wmi_bmof pcspkr video mdio_bus k10temp soundcore i2c_smbus joydev gpio_amdpt mousedev gpio_generic mac_hid dm_mod nfnetlink nvme nvme_core ghash_clmulni_intel nvme_keyring aesni_intel nvme_auth sp5100_tco ccp hkdf wmi zram 842_decompress 842_compress lz4hc_compress crypto_user pkcs8_key_parser ntsync lz4_compress i2c_dev
> Mär 11 05:00:57 Sancezz-PC kernel: CR2: ffff88cb88dc37b0
> Mär 11 05:00:57 Sancezz-PC kernel: ---[ end trace 0000000000000000 ]---
> Mär 11 05:00:57 Sancezz-PC kernel: RIP: 0010:set_field+0x30/0x60 [snd_ctxfi]
> Mär 11 05:00:57 Sancezz-PC kernel: Code: 44 00 00 49 89 f8 85 f6 74 31 31 c9 40 f6 c6 01 75 18 0f 1f 84 00 00 00 00 00 83 c1 01 b8 01 00 00 00 d3 e0 85 f0 74 f2 d3 e2 <41> 8b 00 31 c2 21 f2 31 c2 41 89 10 e9 5f 80 e7 e2 0f 0b e9 58 80
> Mär 11 05:00:57 Sancezz-PC kernel: RSP: 0018:ffffd07300f1f768 EFLAGS: 00010202
> Mär 11 05:00:57 Sancezz-PC kernel: RAX: 00000000ffffffea RBX: ffff88c788dc37e0 RCX: 0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff88cb88dc37b0
> Mär 11 05:00:57 Sancezz-PC kernel: RBP: 00000000ffffffea R08: ffff88cb88dc37b0 R09: 0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: R10: ffffd07300f1f798 R11: ffff88c780b27a20 R12: 0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: R13: ffffffffc0597390 R14: ffff88c788dc3ca8 R15: ffff88c788dc3660
> Mär 11 05:00:57 Sancezz-PC kernel: FS:  00007f5b6bfc0840(0000) GS:ffff88cb09904000(0000) knlGS:0000000000000000
> Mär 11 05:00:57 Sancezz-PC kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Mär 11 05:00:57 Sancezz-PC kernel: CR2: ffff88cb88dc37b0 CR3: 000000010fd04000 CR4: 0000000000350ef0
> Mär 11 05:00:57 Sancezz-PC kernel: note: (udev-worker)[707] exited with irqs disabled
> Mär 11 05:00:58 Sancezz-PC kernel: EXT4-fs (nvme0n1p3): mounted filesystem aca38ff5-c0d5-41f1-bc55-601b911d072a r/w with ordered data mode. Quota mode: none.
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu: Virtual CRAT table created for CPU
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu: Topology: Add CPU node
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: enabling device (0006 -> 0007)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: initializing kernel modesetting (NAVY_FLOUNDER 0x1002:0x73DF 0x1458:0x2408 0xC0).
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: register mmio base: 0xFCA00000
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: register mmio size: 1048576
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 0 <common_v1_0_0> (nv_common)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 1 <gmc_v10_0_0> (gmc_v10_0)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 2 <ih_v5_0_0> (navi10_ih)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 3 <psp_v11_0_0> (psp)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 4 <smu_v11_0_0> (smu)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 5 <dce_v1_0_0> (dm)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 6 <gfx_v10_0_0> (gfx_v10_0)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 7 <sdma_v5_2_0> (sdma_v5_2)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 8 <vcn_v3_0_0> (vcn_v3_0)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: detected ip block number 9 <jpeg_v3_0_0> (jpeg_v3_0)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: Fetched VBIOS from VFCT
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu: ATOM BIOS: 113-D5270300-KXT
> Mär 11 05:01:00 Sancezz-PC kernel: Console: switching to colour dummy device 80x25
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: vgaarb: deactivate vga console
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: VRAM: 12272M 0x0000008000000000 - 0x00000082FEFFFFFF (12272M used)
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> Mär 11 05:01:00 Sancezz-PC kernel: [drm] Detected VRAM RAM=12272M, BAR=16384M
> Mär 11 05:01:00 Sancezz-PC kernel: [drm] RAM width 192bits GDDR6
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: amdgpu: 12272M of VRAM memory ready
> Mär 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: amdgpu: 7957M of GTT memory ready.
> Mär 11 05:01:00 Sancezz-PC kernel: [drm] GART: num cpu pages 131072, num gpu pages 131072
> Mär 11 05:01:00 Sancezz-PC kernel: [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
> Mär 11 05:01:01 Sancezz-PC kernel: input: ckb1: CORSAIR STRAFE RGB MK.2 Mechanical Gaming Keyboard vKB as /devices/virtual/input/input17
> Mär 11 05:01:01 Sancezz-PC kernel: input: ckb1: CORSAIR STRAFE RGB MK.2 Mechanical Gaming Keyboard vM as /devices/virtual/input/input18
> Mär 11 05:01:02 Sancezz-PC kernel: Generic FE-GE Realtek PHY r8169-0-800:00: attached PHY driver (mii_bus:phy_addr=r8169-0-800:00, irq=MAC)
> Mär 11 05:01:02 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0: Link is Down
> Mär 11 05:01:02 Sancezz-PC kernel: bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
> Mär 11 05:01:02 Sancezz-PC kernel: u32 classifier
> Mär 11 05:01:02 Sancezz-PC kernel:     Performance counters on
> Mär 11 05:01:02 Sancezz-PC kernel:     input device check on
> Mär 11 05:01:02 Sancezz-PC kernel:     Actions configured
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: STB initialized to 2048 entries
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: [drm] Loading DMUB firmware via PSP: version=0x02020021
> Mär 11 05:01:02 Sancezz-PC kernel: [drm] use_doorbell being set to: [true]
> Mär 11 05:01:02 Sancezz-PC kernel: [drm] use_doorbell being set to: [true]
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: [VCN instance 0] Found VCN firmware Version ENC: 1.33 DEC: 4 VEP: 0 Revision: 14
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: reserve 0xa00000 from 0x82fd000000 for PSP TMR
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: RAS: optional ras ta ucode is not available
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: SECUREDISPLAY: optional securedisplay ta ucode is not available
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: smu driver if version = 0x0000000e, smu fw if version = 0x00000012, smu fw program = 0, version = 0x00413f00 (65.63.0)
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: SMU driver if version not matched
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: use vbios provided pptable
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: SMU is initialized successfully!
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: [drm] Display Core v3.2.359 initialized on DCN 3.0
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: [drm] DP-HDMI FRL PCON supported
> Mär 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: [drm] DMUB hardware initialized: version=0x02020021
> Mär 11 05:01:02 Sancezz-PC kernel: snd_hda_intel 0000:0b:00.1: bound 0000:0b:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: kiq ring mec 2 pipe 1 q 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu: HMM registered 12272MB device memory
> Mär 11 05:01:03 Sancezz-PC kernel: kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> Mär 11 05:01:03 Sancezz-PC kernel: kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu: Virtual CRAT table created for GPU
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu: Topology: Add dGPU node [0x73df:0x1002]
> Mär 11 05:01:03 Sancezz-PC kernel: kfd kfd: amdgpu: added device 1002:73df
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 10, active_cu_number 40
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring gfx_0.1.0 uses VM inv eng 1 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 4 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 5 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 12 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring sdma0 uses VM inv eng 13 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring sdma1 uses VM inv eng 14 on hub 0
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 8
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on hub 8
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on hub 8
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 8
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdgpu: Using BACO for runtime pm
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: [drm] Registered 6 planes with drm panic
> Mär 11 05:01:03 Sancezz-PC kernel: [drm] Initialized amdgpu 3.64.0 for 0000:0b:00.0 on minor 1
> Mär 11 05:01:03 Sancezz-PC kernel: fbcon: amdgpudrmfb (fb0) is primary device
> Mär 11 05:01:03 Sancezz-PC kernel: [drm] pre_validate_dsc:1667 MST_DSC dsc precompute is not needed
> Mär 11 05:01:03 Sancezz-PC kernel: Console: switching to colour frame buffer device 240x67
> Mär 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> Mär 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0: Link is Up - 1Gbps/Full - flow control off
> Mär 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0: Link is Up - 1Gbps/Full - flow control off
> Mär 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) entered blocking state
> Mär 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) entered disabled state
> Mär 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0: entered allmulticast mode
> Mär 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0: entered promiscuous mode
> Mär 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) entered blocking state
> Mär 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) entered forwarding state
> Mär 11 05:01:06 Sancezz-PC kernel: nvme nvme0: using unchecked data buffer
