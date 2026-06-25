Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BBE3DC4C6
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387883; cv=none; b=ixMoqJ1VNIo4Sf0LErYUNZV0jdE8tvh50sOpRT3omjKH2uwNThh+B44u4HWWrgO9WtFqOYKwQ+41NjPW206kBasr4/B+QsMi+g8i4KLDeWhbpCNKAhzTGlPp7RefZaiKJlVZNKHh3IIdVCILG8i45CLVCgaYbcK4jjPCJnUIi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387883; c=relaxed/simple;
	bh=RaBgv3C5EvMaobvZ71EXhk5iOpI7mpnD93IlLixen90=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KqKFZ41l3F7/51+dPXDTlhrB6N4L5j+vASP7YQmtncNoN8EKnSMNZ4GnRaYMXnV+CAyCIq6O+/Upgcylzt9DSWtm6+UTu8y6wFezxCapAwhVOqi0yiRAO6QMHhqSpOCBV7lYVddKpxLJkGPtUu1V869isa7gBLk/MMKhmj2xL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u2E1CbYc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UGrikbVD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u2E1CbYc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UGrikbVD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u2E1CbYc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UGrikbVD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u2E1CbYc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UGrikbVD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 774C1719E0;
	Thu, 25 Jun 2026 11:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782387879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vpu+YhU6tvPqYSKlTkmG4VIkglOhLO5CZgQ6IrZyJ8=;
	b=u2E1CbYc+aF3tyhDKncsyAYQ0QYVCAuIpwM0YjEiInV6lh2YEMjJPrEHRrwjIsjzIAJKvH
	UcHGaXfUIP8Y08KbZR2yh3d8MzxtHipBgOJ6XDZDxQXLTzTIMhuU9Zgsz9ylm6a/FTsepH
	/zPUwi9qQTtJqaVwXzyFZfj/u19YX9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782387879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vpu+YhU6tvPqYSKlTkmG4VIkglOhLO5CZgQ6IrZyJ8=;
	b=UGrikbVDNE4t4CQFsTtTo7LIzF6E5LZUhFyh9z4ZcjEiGGYtntSyf4N1inSDHhMpiGSSKr
	qDlRtprAz/1w5PDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u2E1CbYc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UGrikbVD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782387879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vpu+YhU6tvPqYSKlTkmG4VIkglOhLO5CZgQ6IrZyJ8=;
	b=u2E1CbYc+aF3tyhDKncsyAYQ0QYVCAuIpwM0YjEiInV6lh2YEMjJPrEHRrwjIsjzIAJKvH
	UcHGaXfUIP8Y08KbZR2yh3d8MzxtHipBgOJ6XDZDxQXLTzTIMhuU9Zgsz9ylm6a/FTsepH
	/zPUwi9qQTtJqaVwXzyFZfj/u19YX9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782387879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Vpu+YhU6tvPqYSKlTkmG4VIkglOhLO5CZgQ6IrZyJ8=;
	b=UGrikbVDNE4t4CQFsTtTo7LIzF6E5LZUhFyh9z4ZcjEiGGYtntSyf4N1inSDHhMpiGSSKr
	qDlRtprAz/1w5PDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ABDA779A8;
	Thu, 25 Jun 2026 11:44:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iscWEacUPWrXdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jun 2026 11:44:39 +0000
Date: Thu, 25 Jun 2026 13:44:34 +0200
Message-ID: <87echuvo7x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jiaming Zhang <r772577952@gmail.com>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	syzkaller@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux Kernel Bug] general protection fault in snd_fcp_init
In-Reply-To: <CANypQFb1EHj0xX8bA1WxSOSK-5xca6ZNKzOQcp12=s=puY7VFw@mail.gmail.com>
References: <CANypQFb1EHj0xX8bA1WxSOSK-5xca6ZNKzOQcp12=s=puY7VFw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 774C1719E0
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Thu, 25 Jun 2026 12:24:49 +0200,
Jiaming Zhang wrote:
> 
> Dear Linux kernel developers and maintainers,
> 
> We are writing to report a general protection fault discovered in the
> sound subsystem with our modified syzkaller. The issue is reproducible
> on the latest version of linux (v7.1, commit
> 8cd9520d35a6c38db6567e97dd93b1f11f185dc6). Below is the KASAN report:
> 
> ---
> input: AT Translated Set 2 keyboard as
> /devices/platform/i8042/serio0/input/input1
> input: ImExPS/2 Generic Explorer Mouse as
> /devices/platform/i8042/serio1/input/input3
> faux_driver regulatory: Direct firmware load for regulatory.db failed
> with error -2
> faux_driver regulatory: Falling back to sysfs fallback for: regulatory.db
> cfg80211: failed to load regulatory.db
> usb 1-1: Using ep0 maxpacket: 32
> usb 1-1: unable to get BOS descriptor or descriptor too short
> usb 1-1: config 1 has an invalid descriptor of length 0, skipping
> remainder of the config
> usb 1-1: config 1 has 2 interfaces, different from the descriptor's value: 3
> usb 1-1: New USB device found, idVendor=1235, idProduct=821d, bcdDevice= 0.40
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: syz
> usb 1-1: Manufacturer: syz
> usb 1-1: SerialNumber: syz
> Oops: general protection fault, probably for non-canonical address
> 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 0 UID: 0 PID: 801 Comm: kworker/0:2 Not tainted 7.1.0 #14 PREEMPT(full)
> Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
> 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:483 [inline]
> RIP: 0010:fcp_find_fc_interface sound/usb/fcp.c:1089 [inline]
> RIP: 0010:snd_fcp_init+0x42a/0x920 sound/usb/fcp.c:1112
> Code: 9a 88 01 00 00 48 89 d8 48 c1 e8 03 42 0f b6 04 38 84 c0 4d 89
> fc 0f 85 bc 03 00 00 44 88 33 49 8d 5d 02 48 89 d8 48 c1 e8 03 <42> 0f
> b6 04 20 84 c0 0f 85 c0 03 00 00 44 0f b6 33 41 80 e6 0f 48
> RSP: 0018:ffffc9000441e760 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
> RDX: ffff888026b71c00 RSI: 00000000000000ff RDI: ffff888041f68b20
> RBP: ffffc9000441e850 R08: 0000000000000003 R09: 0000000000000000
> R10: dffffc0000000000 R11: ffffed1004d6e38b R12: dffffc0000000000
> R13: 0000000000000000 R14: 0000000000000001 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff888098af7000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055efe3be0ff0 CR3: 000000004b5a7000 CR4: 0000000000752ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  snd_usb_mixer_apply_create_quirk+0x1579/0x1a70 sound/usb/mixer_quirks.c:4454
>  snd_usb_create_mixer+0x1ae6/0x27c0 sound/usb/mixer.c:3802
>  usb_audio_probe+0x1892/0x2310 sound/usb/card.c:1035
>  usb_probe_interface+0x659/0xc80 drivers/usb/core/driver.c:396
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x267/0xb10 drivers/base/dd.c:709
>  __driver_probe_device+0x1f7/0x420 drivers/base/dd.c:871
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
>  __device_attach_driver+0x279/0x430 drivers/base/dd.c:1029
>  bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
>  __device_attach+0x2b7/0x430 drivers/base/dd.c:1101
>  device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1156
>  bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
>  device_add+0x7e9/0xbb0 drivers/base/core.c:3706
>  usb_set_configuration+0x1a5c/0x20f0 drivers/usb/core/message.c:2268
>  usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
>  usb_probe_device+0x1c4/0x3c0 drivers/usb/core/driver.c:291
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x267/0xb10 drivers/base/dd.c:709
>  __driver_probe_device+0x1f7/0x420 drivers/base/dd.c:871
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
>  __device_attach_driver+0x279/0x430 drivers/base/dd.c:1029
>  bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
>  __device_attach+0x2b7/0x430 drivers/base/dd.c:1101
>  device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1156
>  bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
>  device_add+0x7e9/0xbb0 drivers/base/core.c:3706
>  usb_new_device+0xb9d/0x1a30 drivers/usb/core/hub.c:2695
>  hub_port_connect drivers/usb/core/hub.c:5567 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
>  port_event drivers/usb/core/hub.c:5871 [inline]
>  hub_event+0x2885/0x4cf0 drivers/usb/core/hub.c:5953
>  process_one_work kernel/workqueue.c:3314 [inline]
>  process_scheduled_works+0xb4b/0x1840 kernel/workqueue.c:3397
>  worker_thread+0x8a3/0xda0 kernel/workqueue.c:3478
>  kthread+0x38a/0x480 kernel/kthread.c:436
>  ret_from_fork+0x509/0xb70 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Modules linked in:
> Dumping ftrace buffer:
>    (ftrace buffer empty)
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:483 [inline]
> RIP: 0010:fcp_find_fc_interface sound/usb/fcp.c:1089 [inline]
> RIP: 0010:snd_fcp_init+0x42a/0x920 sound/usb/fcp.c:1112
> Code: 9a 88 01 00 00 48 89 d8 48 c1 e8 03 42 0f b6 04 38 84 c0 4d 89
> fc 0f 85 bc 03 00 00 44 88 33 49 8d 5d 02 48 89 d8 48 c1 e8 03 <42> 0f
> b6 04 20 84 c0 0f 85 c0 03 00 00 44 0f b6 33 41 80 e6 0f 48
> RSP: 0018:ffffc9000441e760 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
> RDX: ffff888026b71c00 RSI: 00000000000000ff RDI: ffff888041f68b20
> RBP: ffffc9000441e850 R08: 0000000000000003 R09: 0000000000000000
> R10: dffffc0000000000 R11: ffffed1004d6e38b R12: dffffc0000000000
> R13: 0000000000000000 R14: 0000000000000001 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff888098af7000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005645e3e76808 CR3: 000000000e14a000 CR4: 0000000000752ef0
> PKRU: 55555554
> ----------------
> Code disassembly (best guess), 1 bytes skipped:
>    0:   88 01                   mov    %al,(%rcx)
>    2:   00 00                   add    %al,(%rax)
>    4:   48 89 d8                mov    %rbx,%rax
>    7:   48 c1 e8 03             shr    $0x3,%rax
>    b:   42 0f b6 04 38          movzbl (%rax,%r15,1),%eax
>   10:   84 c0                   test   %al,%al
>   12:   4d 89 fc                mov    %r15,%r12
>   15:   0f 85 bc 03 00 00       jne    0x3d7
>   1b:   44 88 33                mov    %r14b,(%rbx)
>   1e:   49 8d 5d 02             lea    0x2(%r13),%rbx
>   22:   48 89 d8                mov    %rbx,%rax
>   25:   48 c1 e8 03             shr    $0x3,%rax
> * 29:   42 0f b6 04 20          movzbl (%rax,%r12,1),%eax <-- trapping
> instruction
>   2e:   84 c0                   test   %al,%al
>   30:   0f 85 c0 03 00 00       jne    0x3f6
>   36:   44 0f b6 33             movzbl (%rbx),%r14d
>   3a:   41 80 e6 0f             and    $0xf,%r14b
>   3e:   48                      rex.W
> ---
> 
> The root cause is that the malicious USB device provides a
> vendor-specific interface with no endpoint descriptors. During USB
> descriptor parsing, no endpoint array is allocated for that alternate
> setting, so altsetting->endpoint remains NULL. fcp_find_fc_interface()
> does not check bNumEndpoints before calling get_endpoint(..., 0), and
> the resulting endpoint descriptor pointer is later dereferenced by
> usb_endpoint_num(), leading to null-ptr-deref.
> 
> A potential fix is as follows:
> 
> ```
> diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
> index 0fc4d063c48a..c45dbe4d4532 100644
> --- a/sound/usb/fcp.c
> +++ b/sound/usb/fcp.c
> @@ -1083,6 +1083,8 @@ static int fcp_find_fc_interface(struct
> usb_mixer_interface *mixer)
> 
>         if (desc->bInterfaceClass != 255)
>             continue;
> +       if (desc->bNumEndpoints < 1)
> +           continue;
> 
>         epd = get_endpoint(intf->altsetting, 0);
>         private->bInterfaceNumber = desc->bInterfaceNumber;
> ```
> 
> On my machine, the reproducer no longer triggers the issue with the
> above patch. If this solution is acceptable, we are happy to submit a
> formal patch.
> 
> The kernel console output, kernel config, syzkaller reproducer, and C
> reproducer are also available at google drive:
> https://drive.google.com/drive/folders/1hE9rfMe-sNFwcrt_tPLiwzpYD1iJ7Hma?usp=sharing
> 
> Please let me know if any further information is required.

The patch looks reasonable.  Could you just submit a proper patch?


thanks,

Takashi
