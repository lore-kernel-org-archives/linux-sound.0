Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C07E105;
	Tue, 25 Aug 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651239; cv=none; b=AKOXrf31/teAp+7tFEQb4bmALgnIRM28+ZdlXcjHi1W5ouW9f4eEm39ITVIzRQwPtPQuTofo3tRctWp6B5LAw1CtnQzwdhA2G8ebcX3RVdrSTc1+N1i3FKu9zm3HqbsMNLHME0HB4aYfC1OiBeIaARVoQlYMqAJapS1jffEpGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651239; c=relaxed/simple;
	bh=C9Ib1h9fLtnqgBR2Jr9IPXt12YoiaZfg/NQN+1kinMI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lc9J9JqCrMKkAA49btRljR3aYaFCI+y2tuWuK6hnJyDgCXexhWNtzUC09m+8kFTo62j0xkCKwXK8eH7u+c2gM7QGVxhMS6EV665ibGRIBIbVvC5nV0du2HyjX6hAml2psFGT+weDtdn/j3I3t8G85dmvSzIaTHqo2QyqhjpNv1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tx5IayB7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VeSdo91j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p9oSPnuq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0hiqsDcv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tx5IayB7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VeSdo91j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p9oSPnuq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0hiqsDcv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71FF41F38A;
	Tue, 25 Aug 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787651231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gmRMIRNeqIICUUbFkSSpYakOFAvAQLq2l0wD3Xyn8iQ=;
	b=Tx5IayB7S5XkQwFFtOLR16//U+VwK8mfTiwytK72+SPaIZ1oP8NJqTmVy698OGED9OyXaE
	D0zDhlG4vcT1A0JExYT4TPyzcwdoQADzMmcSOheq2x0PAhQjI+TkaCyaAiGN3SEwOfGF47
	HQmkD+hDhSww5QZJ592PocM9uSdOQ/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787651231;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gmRMIRNeqIICUUbFkSSpYakOFAvAQLq2l0wD3Xyn8iQ=;
	b=VeSdo91jXipJ8lGCRQ+QWxQSiZCu5mYJOssjJWQc2m2rgwt1jZc8PXnQTEx1C6iyLsTX1T
	ezaPi+trMkdwE5CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787651227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gmRMIRNeqIICUUbFkSSpYakOFAvAQLq2l0wD3Xyn8iQ=;
	b=p9oSPnuqxRm2zJ3ez5Vc8b8DjnUsKajtdU7V6UUq3NoZN5WBqxXqRJqt2/JjHUCk7lczTJ
	hhi5we54caYGEjBhN8dGX18uq7q42zvs500DGv4YQm1Sd2WOwGZ8hCi1gH3UmV8DRVX5Aq
	CPOY3PVgUwijt/r1yOEy1JIbXCxTgs4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787651227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gmRMIRNeqIICUUbFkSSpYakOFAvAQLq2l0wD3Xyn8iQ=;
	b=0hiqsDcv0peFrJa4RMhA2NhFJmfE/N+IzsZZVrcMxps9kR4SstoJf46a2L7GdpArLOYARl
	I8RXHDkpfEUm4EBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 587ED13331;
	Tue, 25 Aug 2026 09:47:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OTzsFJtkjWqfWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 09:47:07 +0000
Date: Tue, 25 Aug 2026 11:47:07 +0200
Message-ID: <87y0dusfac.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+b6cab840e6a85641c7ad@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [syzbot] [sound?] KASAN: invalid-free in snd_rawmidi_free
In-Reply-To: <6a68c3cb.e3659fcc.2a40b8.0014.GAE@google.com>
References: <6a68c3cb.e3659fcc.2a40b8.0014.GAE@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -0.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=20c9876b0f77b546];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[b6cab840e6a85641c7ad];
	MIME_TRACE(0.00)[0:+];
	REDIRECTOR_URL(0.00)[goo.gl];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,syzkaller.appspot.com:url,googlegroups.com:email,imap1.dmz-prg2.suse.org:helo,storage.googleapis.com:url,goo.gl:url,appspotmail.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]

On Tue, 28 Jul 2026 16:59:23 +0200,
syzbot wrote:
> 
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    48a5a7ab8d6a Merge tag 'v7.2-rc4-smb3-client-fixes' of git..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10edc499580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=20c9876b0f77b546
> dashboard link: https://syzkaller.appspot.com/bug?extid=b6cab840e6a85641c7ad
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-48a5a7ab.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/cca5551ec121/vmlinux-48a5a7ab.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/30b6e710a3ae/bzImage-48a5a7ab.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b6cab840e6a85641c7ad@syzkaller.appspotmail.com
> 
> FAULT_INJECTION: forcing a failure.
> name failslab, interval 1, probability 0, space 0, times 1
> CPU: 0 UID: 0 PID: 5324 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  fail_dump lib/fault-inject.c:73 [inline]
>  should_fail_ex+0x40c/0x560 lib/fault-inject.c:174
>  should_failslab+0xa8/0x100 mm/failslab.c:46
>  slab_pre_alloc_hook mm/slub.c:4567 [inline]
>  slab_alloc_node mm/slub.c:4925 [inline]
>  __kmalloc_cache_noprof+0xa8/0x660 mm/slub.c:5511
>  _kmalloc_noprof include/linux/slab.h:969 [inline]
>  _kzalloc_noprof include/linux/slab.h:1290 [inline]
>  snd_rawmidi_new+0x92/0x140 sound/core/rawmidi.c:1894
>  snd_ump_attach_legacy_rawmidi+0x44e/0x8c0 sound/core/ump.c:1363
>  f_midi2_create_card drivers/usb/gadget/function/f_midi2.c:1605 [inline]
>  f_midi2_bind+0x11c5/0x2c40 drivers/usb/gadget/function/f_midi2.c:1948
>  usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
>  configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
>  gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
>  __driver_attach+0x339/0x600 drivers/base/dd.c:1292
>  bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
>  bus_add_driver+0x345/0x670 drivers/base/bus.c:763
>  driver_register+0x23a/0x320 drivers/base/driver.c:174
>  usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x612/0xba0 fs/read_write.c:687
>  ksys_write+0x150/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f7aaef9de99
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f7aafe09fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007f7aaf225fa0 RCX: 00007f7aaef9de99
> RDX: 000000000000000b RSI: 0000200000000940 RDI: 000000000000000a
> RBP: 00007f7aafe0a050 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
> R13: 00007f7aaf226038 R14: 00007f7aaf225fa0 R15: 00007ffdb2f50ea8
>  </TASK>
> ==================================================================
> BUG: KASAN: double-free in snd_rawmidi_free+0x3cb/0x420 sound/core/rawmidi.c:1934
> Free of addr ffff8880342b6000 by task syz.0.0/5324
> 
> CPU: 0 UID: 0 PID: 5324 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
>  print_report+0x58/0x70 mm/kasan/report.c:482
>  kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
>  check_slab_allocation mm/kasan/common.c:-1 [inline]
>  __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:261
>  kasan_slab_pre_free include/linux/kasan.h:199 [inline]
>  slab_free_hook mm/slub.c:2650 [inline]
>  slab_free mm/slub.c:6405 [inline]
>  kfree+0x173/0x640 mm/slub.c:6720
>  snd_rawmidi_free+0x3cb/0x420 sound/core/rawmidi.c:1934
>  snd_rawmidi_dev_free+0x38/0x50 sound/core/rawmidi.c:1945
>  __snd_device_free sound/core/device.c:76 [inline]
>  snd_device_free_all+0x2c7/0x7a0 sound/core/device.c:233
>  snd_card_do_free sound/core/init.c:592 [inline]
>  release_card_device+0x75/0x1b0 sound/core/init.c:153
>  device_release+0xc4/0x1f0 drivers/base/core.c:-1
>  kobject_cleanup lib/kobject.c:689 [inline]
>  kobject_release lib/kobject.c:720 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x222/0x550 lib/kobject.c:737
>  f_midi2_free_card drivers/usb/gadget/function/f_midi2.c:1516 [inline]
>  f_midi2_create_card drivers/usb/gadget/function/f_midi2.c:1623 [inline]
>  f_midi2_bind+0x1441/0x2c40 drivers/usb/gadget/function/f_midi2.c:1948
>  usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
>  configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
>  gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
>  __driver_attach+0x339/0x600 drivers/base/dd.c:1292
>  bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
>  bus_add_driver+0x345/0x670 drivers/base/bus.c:763
>  driver_register+0x23a/0x320 drivers/base/driver.c:174
>  usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x612/0xba0 fs/read_write.c:687
>  ksys_write+0x150/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f7aaef9de99
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f7aafe09fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007f7aaf225fa0 RCX: 00007f7aaef9de99
> RDX: 000000000000000b RSI: 0000200000000940 RDI: 000000000000000a
> RBP: 00007f7aafe0a050 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
> R13: 00007f7aaf226038 R14: 00007f7aaf225fa0 R15: 00007ffdb2f50ea8
>  </TASK>
> 
> Allocated by task 5324:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
>  kasan_kmalloc include/linux/kasan.h:263 [inline]
>  __kmalloc_cache_noprof+0x32d/0x660 mm/slub.c:5515
>  _kmalloc_noprof include/linux/slab.h:969 [inline]
>  _kzalloc_noprof include/linux/slab.h:1290 [inline]
>  snd_ump_attach_legacy_rawmidi+0xb3/0x8c0 sound/core/ump.c:1355
>  f_midi2_create_card drivers/usb/gadget/function/f_midi2.c:1605 [inline]
>  f_midi2_bind+0x11c5/0x2c40 drivers/usb/gadget/function/f_midi2.c:1948
>  usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
>  configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
>  gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
>  __driver_attach+0x339/0x600 drivers/base/dd.c:1292
>  bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
>  bus_add_driver+0x345/0x670 drivers/base/bus.c:763
>  driver_register+0x23a/0x320 drivers/base/driver.c:174
>  usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x612/0xba0 fs/read_write.c:687
>  ksys_write+0x150/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Freed by task 5324:
>  kasan_save_stack mm/kasan/common.c:57 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>  kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:253 [inline]
>  __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
>  kasan_slab_free include/linux/kasan.h:235 [inline]
>  slab_free_hook mm/slub.c:2705 [inline]
>  slab_free mm/slub.c:6405 [inline]
>  kfree+0x1c5/0x640 mm/slub.c:6720
>  snd_ump_attach_legacy_rawmidi+0x4c3/0x8c0 sound/core/ump.c:1367
>  f_midi2_create_card drivers/usb/gadget/function/f_midi2.c:1605 [inline]
>  f_midi2_bind+0x11c5/0x2c40 drivers/usb/gadget/function/f_midi2.c:1948
>  usb_add_function+0x2e1/0x9f0 drivers/usb/gadget/composite.c:333
>  configfs_composite_bind+0xde0/0x1410 drivers/usb/gadget/configfs.c:1802
>  gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
>  __driver_attach+0x339/0x600 drivers/base/dd.c:1292
>  bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
>  bus_add_driver+0x345/0x670 drivers/base/bus.c:763
>  driver_register+0x23a/0x320 drivers/base/driver.c:174
>  usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
>  gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x612/0xba0 fs/read_write.c:687
>  ksys_write+0x150/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The buggy address belongs to the object at ffff8880342b6000
>  which belongs to the cache kmalloc-4k of size 4096
> The buggy address is located 0 bytes inside of
>  4096-byte region [ffff8880342b6000, ffff8880342b7000)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x342b0
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 04fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
> raw: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
> head: 04fff00000000040 ffff88801b042140 dead000000000100 dead000000000122
> head: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
> head: 04fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 22281528312, free_ts 22268577245
>  set_page_owner include/linux/page_owner.h:32 [inline]
>  post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
>  prep_new_page mm/page_alloc.c:1867 [inline]
>  get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
>  __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
>  alloc_slab_page mm/slub.c:3294 [inline]
>  allocate_slab+0x79/0x5e0 mm/slub.c:3408
>  new_slab mm/slub.c:3454 [inline]
>  refill_objects+0x2d5/0x350 mm/slub.c:7338
>  refill_sheaf mm/slub.c:2832 [inline]
>  __pcs_replace_empty_main+0x2bf/0x6b0 mm/slub.c:4703
>  alloc_from_pcs mm/slub.c:4801 [inline]
>  slab_alloc_node mm/slub.c:4933 [inline]
>  __kmalloc_cache_noprof+0x3a7/0x660 mm/slub.c:5511
>  _kmalloc_noprof include/linux/slab.h:969 [inline]
>  _kzalloc_noprof include/linux/slab.h:1290 [inline]
>  kobject_uevent_env+0x289/0x9e0 lib/kobject_uevent.c:543
>  device_add+0x544/0xb80 drivers/base/core.c:3738
>  __video_register_device+0x3bd7/0x4a90 drivers/media/v4l2-core/v4l2-dev.c:1081
>  video_register_device include/media/v4l2-dev.h:390 [inline]
>  vivid_create_devnodes+0x1f7c/0x2c60 drivers/media/test-drivers/vivid/vivid-core.c:1679
>  vivid_create_instance drivers/media/test-drivers/vivid/vivid-core.c:2042 [inline]
>  vivid_probe+0x5038/0x70c0 drivers/media/test-drivers/vivid/vivid-core.c:2095
>  platform_probe+0xf9/0x190 drivers/base/platform.c:1439
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
> page last free pid 1 tgid 1 stack trace:
>  reset_page_owner include/linux/page_owner.h:25 [inline]
>  __free_pages_prepare mm/page_alloc.c:1406 [inline]
>  __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
>  __slab_free+0x274/0x2c0 mm/slub.c:5767
>  qlink_free mm/kasan/quarantine.c:163 [inline]
>  qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
>  kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
>  __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
>  kasan_slab_alloc include/linux/kasan.h:253 [inline]
>  slab_post_alloc_hook mm/slub.c:4612 [inline]
>  slab_alloc_node mm/slub.c:4945 [inline]
>  __kmalloc_cache_noprof+0x2ab/0x660 mm/slub.c:5511
>  _kmalloc_noprof include/linux/slab.h:969 [inline]
>  _kzalloc_noprof include/linux/slab.h:1290 [inline]
>  media_devnode_create+0x60/0x380 drivers/media/mc/mc-entity.c:1550
>  video_register_media_controller drivers/media/v4l2-core/v4l2-dev.c:881 [inline]
>  __video_register_device+0x4160/0x4a90 drivers/media/v4l2-core/v4l2-dev.c:1094
>  video_register_device include/media/v4l2-dev.h:390 [inline]
>  vivid_create_devnodes+0x12cb/0x2c60 drivers/media/test-drivers/vivid/vivid-core.c:1632
>  vivid_create_instance drivers/media/test-drivers/vivid/vivid-core.c:2042 [inline]
>  vivid_probe+0x5038/0x70c0 drivers/media/test-drivers/vivid/vivid-core.c:2095
>  platform_probe+0xf9/0x190 drivers/base/platform.c:1439
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x254/0xae0 drivers/base/dd.c:706
>  __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
>  driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
>  __driver_attach+0x339/0x600 drivers/base/dd.c:1292
>  bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
> 
> Memory state around the buggy address:
>  ffff8880342b5f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff8880342b5f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ffff8880342b6000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                    ^
>  ffff8880342b6080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff8880342b6100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

#syz fix: ALSA: ump: fix double free of out_cvts on rawmidi error
