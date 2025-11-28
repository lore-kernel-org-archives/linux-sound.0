Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D628134C
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 17:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764350690; cv=none; b=rWueKE4bKq/x4fhkIyZOvx4v4moXiO4XgG2/GJetNv5CBJM819u7sQPDUHjgFLIWiAjwoxpVvrDuk6sb0tFnK/KkyAlokl3JiYWdHN4m/BAGYs0GLBeJfNlL6Olmj2yrHhI6RcnVBFQ1tPIBzzrnaNDXa8mL9t4hjIVdHZ+m2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764350690; c=relaxed/simple;
	bh=7xPUXfUJgLQHc5wa+HvPMYSQiApR7ZeSaBPlJv86M3s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kEtM5ohXwweL9xG/TctffAeE1410q/duNgStyJFsGFCyqnPkaFpc0rTdV14pvt+1qbmZvnH4o8gNx45xFDRX8Ge05YqRGgoFWzRDpMyda8GiV66/nQSLt5D1TqdCyGxNK/FKapackq2DVPHMcSDRcnwnCKplmMXypycTxZOtqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QURXpmsL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EhmDZnDo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TqJ9VVaY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gjEBadP+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QURXpmsL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EhmDZnDo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TqJ9VVaY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gjEBadP+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 391635BDA5;
	Fri, 28 Nov 2025 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764350686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNQG1vDIjyuI7APaW8OagC8vv1ooBxNd5zb0PpNo5Oc=;
	b=QURXpmsLfUmPOrSxZo+LLDhBD0B/FvCWWqjHZXU3ZG3rtsBcZ9flKhg4MwXf1BhLNjfCaa
	TTHQ0ojR795oYpx/v6Xxk1cMMJeq/fsEeuCIlwMEWqRHI/t3e8pPIBFAxCu+h8ZJAatN0j
	bjzQowLqi1KqL4ax9zd6Ml+64rWLPVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764350686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNQG1vDIjyuI7APaW8OagC8vv1ooBxNd5zb0PpNo5Oc=;
	b=EhmDZnDo86prTBLdUzkGlfp6G14hFTMFeCVJhNIWrfwaFlbK24H6thgXa33KLI0g9g5GoA
	ZiyZhebDgLj9LcAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TqJ9VVaY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gjEBadP+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764350684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNQG1vDIjyuI7APaW8OagC8vv1ooBxNd5zb0PpNo5Oc=;
	b=TqJ9VVaYV95xZyvkUFO/x2UnOWwwztjQV0LxHHk9fnSsXxpVlCVDK68H5bXobRLAhQHQDl
	XBsQCqzpQZzRmyWKvFMZK92oxBapfYMzggsKl4UzX7xfv8SzbF3avdqCnLueZZFTGqamM4
	Myf6zQYDu99stKfjHQECuyf/Pz+RpQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764350684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LNQG1vDIjyuI7APaW8OagC8vv1ooBxNd5zb0PpNo5Oc=;
	b=gjEBadP+5alkmHU/FZOFCyuBWiO3XciD33l4k8Xdmo/Jr2torwmtPpH7dP0eW+yPkhc88k
	LSjwHQ+QuGSh6eDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00ECA3EA63;
	Fri, 28 Nov 2025 17:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kqVbOtvaKWmvBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Nov 2025 17:24:43 +0000
Date: Fri, 28 Nov 2025 18:24:43 +0100
Message-ID: <87a50683z8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	waxhead <waxhead@dirtcellar.net>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	1121535@bugs.debian.org
Subject: Re: UBSAN: array-index-out-of-bounds in [...]sound/pci/ctxfi/ctamixer.c:347:48
In-Reply-To: <aSk8KJI35H7gFru6@eldamar.lan>
References: <176428476762.2962.8176922083972711750.reportbug@main.localdomain>
	<aSk8KJI35H7gFru6@eldamar.lan>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 391635BDA5

On Fri, 28 Nov 2025 07:07:36 +0100,
Salvatore Bonaccorso wrote:
> 
> Hi Jaroslav, hi Takashi
> 
> A user in Debian reported (in https://bugs.debian.org/1121535) an
> array-index-out-of-bounds affecting ctxfi/ctamixer.c:
> 
> On Fri, Nov 28, 2025 at 12:06:07AM +0100, waxhead wrote:
> >  ------------[ cut here ]------------
> > Nov 27 23:46:53 main kernel: UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/sound/pci/ctxfi/ctamixer.c:347:48
> > Nov 27 23:46:53 main kernel: index 8 is out of range for type 'unsigned char [8]'
> > Nov 27 23:46:53 main kernel: CPU: 4 UID: 0 PID: 468 Comm: (udev-worker) Not tainted 6.17.8+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.8-1 
> > Nov 27 23:46:53 main kernel: Hardware name: FUJITSU /D3446-S2, BIOS V5.0.0.12 R1.26.0 for D3446-S2x                    02/11/2020
> > Nov 27 23:46:53 main kernel: Call Trace:
> > Nov 27 23:46:53 main kernel:  <TASK>
> > Nov 27 23:46:53 main kernel:  dump_stack_lvl+0x5d/0x80
> > Nov 27 23:46:53 main kernel:  ? __pfx_amixer_set_x+0x10/0x10 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  ubsan_epilogue+0x5/0x2b
> > Nov 27 23:46:53 main kernel:  __ubsan_handle_out_of_bounds.cold+0x54/0x59
> > Nov 27 23:46:53 main kernel:  sum_output_slot+0x44/0x70 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  amixer_set_input+0x4b/0x80 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  amixer_setup+0x1b/0x50 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  ct_mixer_create+0x193/0x570 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  ct_atc_create+0x3cb/0x530 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  ct_card_probe+0x104/0x2c0 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  local_pci_probe+0x3f/0x90
> > Nov 27 23:46:53 main kernel:  pci_device_probe+0xda/0x2b0
> > Nov 27 23:46:53 main kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
> > Nov 27 23:46:53 main kernel:  really_probe+0xdb/0x340
> > Nov 27 23:46:53 main kernel:  ? pm_runtime_barrier+0x55/0x90
> > Nov 27 23:46:53 main kernel:  __driver_probe_device+0x78/0x140
> > Nov 27 23:46:53 main kernel:  driver_probe_device+0x1f/0xa0
> > Nov 27 23:46:53 main kernel:  ? __pfx___driver_attach+0x10/0x10
> > Nov 27 23:46:53 main kernel:  __driver_attach+0xcb/0x1e0
> > Nov 27 23:46:53 main kernel:  bus_for_each_dev+0x82/0xd0
> > Nov 27 23:46:53 main kernel:  bus_add_driver+0x10b/0x1f0
> > Nov 27 23:46:53 main kernel:  ? __pfx_ct_driver_init+0x10/0x10 [snd_ctxfi]
> > Nov 27 23:46:53 main kernel:  driver_register+0x75/0xe0
> > Nov 27 23:46:53 main kernel:  do_one_initcall+0x58/0x300
> > Nov 27 23:46:53 main kernel:  do_init_module+0x62/0x250
> > Nov 27 23:46:53 main kernel:  ? init_module_from_file+0x8a/0xe0
> > Nov 27 23:46:53 main kernel:  init_module_from_file+0x8a/0xe0
> > Nov 27 23:46:53 main kernel:  idempotent_init_module+0x114/0x310
> > Nov 27 23:46:53 main kernel:  __x64_sys_finit_module+0x6d/0xd0
> > Nov 27 23:46:53 main kernel:  ? syscall_trace_enter+0x8d/0x1d0
> > Nov 27 23:46:53 main kernel:  do_syscall_64+0x82/0x320
> > Nov 27 23:46:53 main kernel:  ? restore_fpregs_from_fpstate+0x46/0xa0
> > Nov 27 23:46:53 main kernel:  ? switch_fpu_return+0x5b/0xe0
> > Nov 27 23:46:53 main kernel:  ? do_syscall_64+0x200/0x320
> > Nov 27 23:46:53 main kernel:  ? exc_page_fault+0x74/0x180
> > Nov 27 23:46:53 main kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > Nov 27 23:46:53 main kernel: RIP: 0033:0x7f77238f3779
> > Nov 27 23:46:53 main kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48
> > Nov 27 23:46:53 main kernel: RSP: 002b:00007ffc398103f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > Nov 27 23:46:53 main kernel: RAX: ffffffffffffffda RBX: 000055e0eb622480 RCX: 00007f77238f3779
> > Nov 27 23:46:53 main kernel: RDX: 0000000000000004 RSI: 00007f77239f744d RDI: 000000000000001b
> > Nov 27 23:46:53 main kernel: RBP: 0000000000000004 R08: 0000000000000000 R09: 00007f7723ef6280
> > Nov 27 23:46:53 main kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00007f77239f744d
> > Nov 27 23:46:53 main kernel: R13: 0000000000020000 R14: 000055e0eb61e630 R15: 0000000000000000
> > Nov 27 23:46:53 main kernel:  </TASK>
> > Nov 27 23:46:53 main kernel: ---[ end trace ]---
> 
> This was specifically with 6.17.8 but up to the current stable 6.17.9
> there should be no related changes afaics.

Thanks for the report.  As a wild guess, a simple fix like below
should suffice for this case?


Takashi

-- 8< --
--- a/sound/pci/ctxfi/ctamixer.h
+++ b/sound/pci/ctxfi/ctamixer.h
@@ -22,7 +22,7 @@
 /* Define the descriptor of a summation node resource */
 struct sum {
 	struct rsc rsc;		/* Basic resource info */
-	unsigned char idx[8];
+	unsigned char idx[8 + 1]; /* msr + master */
 };
 
 /* Define sum resource request description info */
