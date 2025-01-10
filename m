Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1120E70F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736515889; cv=none; b=kUSx3JhmHyQpLzFW9F0RmnV/ZFnqgaDaApGsIhQxNoaZtVHeggp4ZGkUSjtg7zrlZa3/aYXeduB4Z8ueONYmnLCfTR0UJZXN/fW87cIDexD4y/pmsx+jExyqFAdLuPUWTSEdrSxr9XSiJR0yBb1n+A6m6QpSVnIM8+w/GMjsUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736515889; c=relaxed/simple;
	bh=SmVAq/BnmifUT2yAdeMGt1pW8LI2KqbzwvH+UKYq1jo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mK197OB1tw4Hm1JxCEjX3w5MUD+UYJplnPWOApe8N7WPaiNBP2t1FR0HwCYiSd7f6ETrrjecT6nr5GGm2p+ap5IxvM5yIzP7KfVBT7MNKvVZ/7AlrlAtEFXpN+VKNAcOy8fhe0ZWrRTGEJ+4lsTFnNBGrSvlhHS6PeBdM9pamPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a815ab079cso38055785ab.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 05:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515886; x=1737120686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbHxS+fNFpijCabYhKjWlox7rG4l6VKopUPk7HRwe2g=;
        b=n3kbF8RJrScinIwnWbAtQ0heYwA+PQCoaIzuo0mVkSJWqK7EbAzL3LQ/riUTwSnZkG
         tDIJB02J1Y4lpX9YIcbNWtxBVBkeDjDRgLlRoBFjYV2uWY3ab0Q6TZjNpwBDUORX7d5S
         A3kzp9pQuERkpzGD7V2ZAoDzuj7w6d9mbh7nktK9pdMYuFwEoAqteW5KOhq1hxD5+hn8
         YVz2H/rR1iika1LcA4AeNsrDtYwLRDJsHNui39yVc5yZtgVXyCriT+VaUxTGh8V9jile
         2Y8GAhgWExZ9kPhlaL4xKuSPySFDprREsnjquJOKZyLyGXSk/+74qn3ubUWrJnBP0B3s
         1ReQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8VKXefU+C+e5iBnvb0Zt+10O2ozYKtS5X4k3eBQNkiuufjosiGpPZhfc5WMzXCAKgC36UdpN2AxR7TA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfc0rLTBnzu/dQYT2eCmcPUZIzYeMS1UncuK4b5sE4IAO2hNB3
	z/SkN3Xa9KXcr5gfg1BWnwm1+O1c3Sv1H1m7cE2BEbBkcJqvcLd0oqTPu+Iajfy8FQ0Edno34F7
	4OB+AbT55REJ1SyV8Pku9tIaupBH8el88cQgK975JUb7BDrlNQ5Je1Vs=
X-Google-Smtp-Source: AGHT+IFzyggac5przxIsOjsC4NWCmN2tKPYEeAZ0YG10B4T5mZUhBYKI4S1qoDS/bhuc8Xj6Mg1pC5OcyfikynZl2txzxkTKdWYF
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26d:0:b0:3a7:87f2:b00e with SMTP id
 e9e14a558f8ab-3ce3a8bb3cbmr79662655ab.19.1736515886617; Fri, 10 Jan 2025
 05:31:26 -0800 (PST)
Date: Fri, 10 Jan 2025 05:31:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6781212e.050a0220.216c54.000d.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_pcm_action_single
From: syzbot <syzbot+0c88dda7b07b78c42447@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0bc21e701a6f MAINTAINERS: Remove Olof from SoC maintainers
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e198b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=86dd15278dbfe19f
dashboard link: https://syzkaller.appspot.com/bug?extid=0c88dda7b07b78c42447
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-0bc21e70.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7552d06d3231/vmlinux-0bc21e70.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0d1494ecdf2f/bzImage-0bc21e70.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0c88dda7b07b78c42447@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __lock_acquire+0x2d90/0x3c40 kernel/locking/lockdep.c:5089
Read of size 8 at addr ffff888027e94180 by task syz.1.27/6174

CPU: 0 UID: 0 PID: 6174 Comm: syz.1.27 Not tainted 6.13.0-rc5-syzkaller-00012-g0bc21e701a6f #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 __lock_acquire+0x2d90/0x3c40 kernel/locking/lockdep.c:5089
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5849
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:162
 __wake_up_common_lock kernel/sched/wait.c:105 [inline]
 __wake_up+0x1c/0x60 kernel/sched/wait.c:127
 snd_pcm_action_single+0x10a/0x150 sound/core/pcm_native.c:1295
 snd_pcm_action+0x70/0x90 sound/core/pcm_native.c:1376
 loopback_check_format sound/drivers/aloop.c:362 [inline]
 loopback_trigger+0xd5a/0x1e60 sound/drivers/aloop.c:410
 snd_pcm_do_start sound/core/pcm_native.c:1437 [inline]
 snd_pcm_do_start+0xd1/0x1f0 sound/core/pcm_native.c:1430
 snd_pcm_action_single+0x7d/0x150 sound/core/pcm_native.c:1293
 snd_pcm_action+0x70/0x90 sound/core/pcm_native.c:1376
 __snd_pcm_lib_xfer+0x13f5/0x1ea0 sound/core/pcm_lib.c:2405
 snd_pcm_oss_write3+0xd5/0x1e0 sound/core/oss/pcm_oss.c:1242
 snd_pcm_oss_write2+0x318/0x3f0 sound/core/oss/pcm_oss.c:1382
 snd_pcm_oss_sync1+0x1bf/0x510 sound/core/oss/pcm_oss.c:1616
 snd_pcm_oss_sync+0x617/0x7f0 sound/core/oss/pcm_oss.c:1692
 snd_pcm_oss_release+0x28b/0x310 sound/core/oss/pcm_oss.c:2575
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 __do_fast_syscall_32+0x80/0x120 arch/x86/entry/common.c:389
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f81579
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000ffda252c EFLAGS: 00000202 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000000000001e
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Allocated by task 6175:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 snd_pcm_attach_substream+0x414/0xd20 sound/core/pcm.c:940
 snd_pcm_open_substream+0x8e/0x17c0 sound/core/pcm_native.c:2739
 snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2439 [inline]
 snd_pcm_oss_open+0x754/0x1400 sound/core/oss/pcm_oss.c:2520
 soundcore_open+0x409/0x580 sound/sound_core.c:594
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0xf59/0x1ea0 fs/open.c:945
 vfs_open+0x82/0x3f0 fs/open.c:1075
 do_open fs/namei.c:3828 [inline]
 path_openat+0x1e6a/0x2d60 fs/namei.c:3987
 do_filp_open+0x20c/0x470 fs/namei.c:4014
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_compat_sys_openat fs/open.c:1479 [inline]
 __se_compat_sys_openat fs/open.c:1477 [inline]
 __ia32_compat_sys_openat+0x16e/0x210 fs/open.c:1477
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0x73/0x120 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Freed by task 6175:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x14f/0x4b0 mm/slub.c:4761
 snd_pcm_detach_substream+0x1d0/0x380 sound/core/pcm.c:1005
 snd_pcm_release_substream+0x5b/0x70 sound/core/pcm_native.c:2712
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2398 [inline]
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2390 [inline]
 snd_pcm_oss_release+0x16f/0x310 sound/core/oss/pcm_oss.c:2577
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 __do_fast_syscall_32+0x80/0x120 arch/x86/entry/common.c:389
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

The buggy address belongs to the object at ffff888027e94000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 384 bytes inside of
 freed 2048-byte region [ffff888027e94000, ffff888027e94800)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x27e90
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801ac42f00 0000000000000000 dead000000000001
raw: 0000000000000000 0000000080080008 00000001f5000000 0000000000000000
head: 00fff00000000040 ffff88801ac42f00 0000000000000000 dead000000000001
head: 0000000000000000 0000000080080008 00000001f5000000 0000000000000000
head: 00fff00000000003 ffffea00009fa401 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 5955, tgid 5955 (syz-executor), ts 98015514588, free_ts 97994974159
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3476
 __alloc_pages_slowpath mm/page_alloc.c:4288 [inline]
 __alloc_pages_noprof+0x6a6/0x25b0 mm/page_alloc.c:4766
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_slab_page mm/slub.c:2425 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0xca/0x410 mm/slub.c:2642
 ___slab_alloc+0xce2/0x1650 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __kmalloc_cache_node_noprof+0xfb/0x3f0 mm/slub.c:4337
 kmalloc_node_noprof include/linux/slab.h:924 [inline]
 alloc_mem_cgroup_per_node_info mm/memcontrol.c:3441 [inline]
 mem_cgroup_alloc mm/memcontrol.c:3539 [inline]
 mem_cgroup_css_alloc+0x9fb/0x1cf0 mm/memcontrol.c:3580
 css_create kernel/cgroup/cgroup.c:5631 [inline]
 cgroup_apply_control_enable+0x4b6/0xc80 kernel/cgroup/cgroup.c:3239
 cgroup_mkdir+0x398/0x1150 kernel/cgroup/cgroup.c:5847
 kernfs_iop_mkdir+0x14a/0x1d0 fs/kernfs/dir.c:1246
 vfs_mkdir+0x57d/0x860 fs/namei.c:4311
 do_mkdirat+0x301/0x3a0 fs/namei.c:4334
 __do_sys_mkdirat fs/namei.c:4349 [inline]
 __se_sys_mkdirat fs/namei.c:4347 [inline]
 __ia32_sys_mkdirat+0x82/0xb0 fs/namei.c:4347
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0x73/0x120 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
page last free pid 6019 tgid 6019 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0x1080 mm/page_alloc.c:2659
 __put_partials+0x14c/0x170 mm/slub.c:3157
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 kmem_cache_alloc_noprof+0x1c8/0x3b0 mm/slub.c:4175
 vm_area_alloc+0x1f/0x1c0 kernel/fork.c:472
 __mmap_new_vma mm/vma.c:2340 [inline]
 __mmap_region+0x1091/0x2760 mm/vma.c:2456
 mmap_region+0x127/0x320 mm/mmap.c:1348
 do_mmap+0xc00/0xfc0 mm/mmap.c:496
 vm_mmap_pgoff+0x1ba/0x360 mm/util.c:580
 ksys_mmap_pgoff+0x7d/0x5c0 mm/mmap.c:542
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0x73/0x120 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Memory state around the buggy address:
 ffff888027e94080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027e94100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888027e94180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888027e94200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027e94280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess), 2 bytes skipped:
   0:	10 06                	adc    %al,(%rsi)
   2:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   6:	10 07                	adc    %al,(%rdi)
   8:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   c:	10 08                	adc    %cl,(%rax)
   e:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1e:	00 51 52             	add    %dl,0x52(%rcx)
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	0f 34                	sysenter
  26:	cd 80                	int    $0x80
* 28:	5d                   	pop    %rbp <-- trapping instruction
  29:	5a                   	pop    %rdx
  2a:	59                   	pop    %rcx
  2b:	c3                   	ret
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop
  30:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  37:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
