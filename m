Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69206A55
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766362285; cv=none; b=vF7jnEj1yZV0qA94BQP2XcROFGYqFpq9zfcmFmfKx46e4f1U2JUXIRsZ0RAMXBT4a9eVXLcEK8RBCk9dyOX5d1Fmr88ANSsvEgc1dDf05PXFG78BBVdholnFkwuTc4CPNUTbnprOc8eItLcI6ayBbsbVbPQDR9oVcqnPvX26dxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766362285; c=relaxed/simple;
	bh=mGR64Wo8FfVJo0IZ1I9PHxP6ZR7cmABM9+6f1/M9HYI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TaeowJwnCGZBSioR66mOdjDaaRqLHfkDRhx1JUED3Kz5Bj/h0IIVV861mjE0YWYkmVvk0Ki/iyS/apllWHvLWDW9PkZlPh+2hCfqACLrFrSml7IPxavipSM78jNUEYLWN7jm8uuhtVxGsvo85dH8reptlsj6xoGPkaT5F8mtli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7c70268301aso3366772a34.3
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 16:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766362282; x=1766967082;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgRdDEYth0Pvof85jgoTRtTafudFR8BtXUhwgD5mzIs=;
        b=c5C0VjWKFAnQNAPvX1eDZrOWQ2oP106YUb6mjQE97GBlueANDw43NURN323IpkGU0R
         OrXCWFW0ghfblA3RVJvjo75bDcb5r3e+OmGVS4mU54Wty1mH8WA0UMfZaSqjrrYG6BNf
         e4e7qafhqD/pSl6Q3fUpy1TojZ/iETtDDZxxHI/BuZW32WGXoJEIy4EQkHuz5ZvUsI/W
         Q38o4DnwrsFkK6ru1HFSRK760VRYHpHvxKVRBRgsuZbmjcVm7dYck498E+vFAMHGwby4
         BvkgBEk8NuxPRNiiYYnbdR1orb0oADntHGJVIgORC4ouC3DWv/HR0FYz3J8hM57o0aqL
         2Vmg==
X-Forwarded-Encrypted: i=1; AJvYcCUGNp954ihw+zLhyy6c/iQG8cfym4jlqc6Po3TDMT8ghhHwUjvmIlIZ5n3bx9NaLQimMJNA0t5E0yzoIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4nNqxclsOwC92QG4vkK9GXvXhE4TOtiIM3PX0fPo8l13I9WVi
	fZ0crpqr92UqROVcdaaS9o6FNLvn9vzdWF6KsUT7uysDh4N4KUMJkYsMopM7mnZLS//dsH8Tyqg
	08CRSZYJMAPLZcahbMSB0rTD6SvSVFaKgpJB2ewqRMpzan7MZcRHWInmapag=
X-Google-Smtp-Source: AGHT+IEP6gKRZNTXWduDko9gPPLUrLRgLmoChxSC3kuiI4Yv5x8EQaYhaNoMzbHLoGJ6Htf0QRcW4pLFPCXWhICPzo5o8fNkD6G9
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:162a:b0:65b:2997:add6 with SMTP id
 006d021491bc7-65d0e963ef8mr4181467eaf.2.1766362282421; Sun, 21 Dec 2025
 16:11:22 -0800 (PST)
Date: Sun, 21 Dec 2025 16:11:22 -0800
In-Reply-To: <68f764fe.050a0220.346f24.0011.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69488caa.050a0220.1b4e0c.002d.GAE@google.com>
Subject: Re: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_pcm_action
From: syzbot <syzbot+addf1973f8732e2cc468@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9094662f6707 Merge tag 'ata-6.19-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1568ddb4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f2b6fe1fdf1a00b
dashboard link: https://syzkaller.appspot.com/bug?extid=addf1973f8732e2cc468
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13b343c2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1762db1a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/024031cc0ef1/disk-9094662f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ba00f3b9b8e7/vmlinux-9094662f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a92db982c114/bzImage-9094662f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+addf1973f8732e2cc468@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
Read of size 1 at addr ffff888034ea7200 by task syz.1.1236/9742

CPU: 1 UID: 0 PID: 9742 Comm: syz.1.1236 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:573
 kasan_check_byte include/linux/kasan.h:401 [inline]
 lock_acquire+0x84/0x340 kernel/locking/lockdep.c:5842
 rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 __wake_up_common_lock+0x2f/0x1e0 kernel/sched/wait.c:124
 snd_pcm_action_single sound/core/pcm_native.c:-1 [inline]
 snd_pcm_action+0x1f4/0x240 sound/core/pcm_native.c:1393
 loopback_check_format sound/drivers/aloop.c:363 [inline]
 loopback_trigger+0xb82/0x1b60 sound/drivers/aloop.c:411
 snd_pcm_do_start+0xb7/0x180 sound/core/pcm_native.c:1454
 snd_pcm_action_single sound/core/pcm_native.c:1310 [inline]
 snd_pcm_action+0xe7/0x240 sound/core/pcm_native.c:1393
 __snd_pcm_lib_xfer+0x1762/0x1d00 sound/core/pcm_lib.c:2405
 snd_pcm_oss_write3+0x1bc/0x350 sound/core/oss/pcm_oss.c:1241
 snd_pcm_plug_write_transfer+0x2cb/0x4c0 sound/core/oss/pcm_plugin.c:630
 snd_pcm_oss_write2 sound/core/oss/pcm_oss.c:1373 [inline]
 snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1439 [inline]
 snd_pcm_oss_write+0xa31/0xf20 sound/core/oss/pcm_oss.c:2794
 vfs_write+0x287/0xb40 fs/read_write.c:684
 ksys_write+0x14b/0x260 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1277acf749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1277115038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f1277d26090 RCX: 00007f1277acf749
RDX: 0000000000004000 RSI: 00002000000012c0 RDI: 0000000000000008
RBP: 00007f1277b53f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1277d26128 R14: 00007f1277d26090 R15: 00007ffea9722d18
 </TASK>

Allocated by task 9740:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x1fb/0x6d0 mm/slub.c:5776
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 snd_pcm_attach_substream+0x5b7/0xb30 sound/core/pcm.c:938
 snd_pcm_open_substream+0xb6/0x2410 sound/core/pcm_native.c:2756
 snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2437 [inline]
 snd_pcm_oss_open+0xf2a/0x1bd0 sound/core/oss/pcm_oss.c:2518
 chrdev_open+0x4cf/0x5e0 fs/char_dev.c:414
 do_dentry_open+0x7d0/0x1270 fs/open.c:962
 vfs_open+0x3b/0x350 fs/open.c:1094
 do_open fs/namei.c:4628 [inline]
 path_openat+0x342a/0x3df0 fs/namei.c:4787
 do_filp_open+0x1fa/0x410 fs/namei.c:4814
 do_sys_openat2+0x121/0x200 fs/open.c:1430
 do_sys_open fs/open.c:1436 [inline]
 __do_sys_openat fs/open.c:1452 [inline]
 __se_sys_openat fs/open.c:1447 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1447
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 9740:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6670 [inline]
 kfree+0x1bd/0x900 mm/slub.c:6878
 snd_pcm_detach_substream+0x1e1/0x290 sound/core/pcm.c:1003
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2396 [inline]
 snd_pcm_oss_release+0x184/0x250 sound/core/oss/pcm_oss.c:2575
 __fput+0x45b/0xa80 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:233
 get_signal+0x11c4/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x7a0 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:41 [inline]
 exit_to_user_mode_loop+0x87/0x4e0 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x2b7/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888034ea7000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 512 bytes inside of
 freed 2048-byte region [ffff888034ea7000, ffff888034ea7800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x34ea0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff27000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff27000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000003 ffffea0000d3a801 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd28c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5917, tgid 5917 (syz-executor), ts 127811454833, free_ts 125843464373
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1846
 prep_new_page mm/page_alloc.c:1854 [inline]
 get_page_from_freelist+0x28c0/0x2960 mm/page_alloc.c:3915
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
 alloc_pages_mpol+0xd1/0x380 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xb10/0x13e0 mm/slub.c:4656
 __slab_alloc+0xc6/0x1f0 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kmalloc_node_track_caller_noprof+0x2bf/0x810 mm/slub.c:5764
 kmalloc_reserve+0x136/0x290 net/core/skbuff.c:608
 pskb_expand_head+0x19d/0x1160 net/core/skbuff.c:2282
 netlink_trim+0x1b3/0x2c0 net/netlink/af_netlink.c:1299
 netlink_broadcast_filtered+0xd6/0x1000 net/netlink/af_netlink.c:1512
 nlmsg_multicast_filtered include/net/netlink.h:1165 [inline]
 nlmsg_multicast include/net/netlink.h:1184 [inline]
 nlmsg_notify+0xf0/0x1a0 net/netlink/af_netlink.c:2593
 rtnl_notify net/core/rtnetlink.c:958 [inline]
 rtmsg_ifinfo_send net/core/rtnetlink.c:4436 [inline]
 rtmsg_ifinfo_event net/core/rtnetlink.c:4452 [inline]
 rtnetlink_event+0x224/0x270 net/core/rtnetlink.c:7018
 notifier_call_chain+0x19d/0x3a0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2268 [inline]
 call_netdevice_notifiers net/core/dev.c:2282 [inline]
 netif_change_name+0x5db/0x970 net/core/dev.c:1490
page last free pid 5966 tgid 5966 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xfe1/0x1170 mm/page_alloc.c:2943
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x149/0x170 mm/slub.c:3886
 __slab_free+0x2af/0x330 mm/slub.c:5952
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:349
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 kmem_cache_alloc_noprof+0x18d/0x6c0 mm/slub.c:5270
 getname_flags+0xb8/0x540 fs/namei.c:146
 user_path_at+0x24/0x60 fs/namei.c:3566
 user_statfs+0x94/0x170 fs/statfs.c:103
 __do_sys_statfs fs/statfs.c:193 [inline]
 __se_sys_statfs fs/statfs.c:190 [inline]
 __x64_sys_statfs+0xe0/0x1b0 fs/statfs.c:190
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888034ea7100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888034ea7180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888034ea7200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888034ea7280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888034ea7300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
