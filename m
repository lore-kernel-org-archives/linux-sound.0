Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04831579B
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 04:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769487268; cv=none; b=S4RZBIwIcfbSj8CmgMI4IidlcEf4gned1/B2gLYIcYeSuI24ISmi2S8HuLgWQ8Afm2E0KkaUqPJKAv1gwtACqvdnEmrrPYiA9xhjhgJrrd0Ks2cuM1lkkXsefv3PbzvO7KK+7pkGiVXeLMg2I4dNYcWxFxls2Qdldc5fs1KXDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769487268; c=relaxed/simple;
	bh=ZoiRh1nNKsHX2SdltBD3Ld2QDnHm0bzGCoG0EQ6HQVI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FCBlDzg7s0ZScDvsQMwUgJ9xvTjyLIQ/9ezcn/FTnM44j6Xr1QHGgnkw2/6eFHpCGK4QxSj8GSBx8GvsudXbMlHDAnQyveCi7iG0Si4IqjYTYsMRtMsNwQSD2L6O2uzd+zKloVJOThxLgaL4f1Fw/LbR0i3m1dYfDl0b6mK8vo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7cfde680bf1so10281019a34.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 20:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769487265; x=1770092065;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpQ9nyOHmXTn0zNcvsaNCK7R2fdVzWZdJLa8u51/n9w=;
        b=AucPS/mni5H0xFOqtt97X9F1RlAANojQofVEEnJe4RSMOTz3dbVe6zQRjyMIFrCitv
         wP3D/Pu53ftOI7diGGDBcy4XO7z1sND3aRoofrY1HHsfzElJNa3b8/6F7/1j2HL+YH5R
         9BuZPIWxk4hHXM3HHzL60jRVm3pkWQMoUzAj9y2hqJdLUL0wf8evdP42kuru7KXgeRlY
         nOxoVl/a3xTD7HXGS4U9+xq7eaV7/KwectYzTxn6X5wvLFTWzT4i75Ym0erNEfF6OWfb
         XIBtoUvx2jYiQh76HjRxtOcOK8QIR0McHThck5sj78Ak8kF0eRU/T/b8dPcNnLDc9hyB
         mfkg==
X-Forwarded-Encrypted: i=1; AJvYcCVhCWLjzMleXuGfSjjac4njJDEFSCm+KKqH6WDqr2JDokXV5Ge0A6fNsKvwrKv4RyLkBUN9jL3b1Iqg7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfBJpN+1PawzcdhdStUNKUJC3aWPerTSGUqQDCMKognmuNBJj
	5norVaqHBhomsFqDGAKQlWOViEcKcpuiEGnKW9aC6m9f+9RjtCKa4OPAfOL/CQ3AMg9N+hOiu9o
	A1XoireqJ2iOTCKUhF456MaRhuEM87s+PocSIDl4rmefwoDLbXsJA8gN9y24=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f028:b0:661:1c57:1b3d with SMTP id
 006d021491bc7-662f202a51amr286161eaf.11.1769487265306; Mon, 26 Jan 2026
 20:14:25 -0800 (PST)
Date: Mon, 26 Jan 2026 20:14:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69783ba1.050a0220.c9109.0011.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_pcm_stop
From: syzbot <syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    63804fed149a Linux 6.19-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13bbb05a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4
dashboard link: https://syzkaller.appspot.com/bug?extid=5f8f3acdee1ec7a7ef7b
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13f7abfa580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11040322580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c4e63ddea039/disk-63804fed.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/957e5dcfa400/vmlinux-63804fed.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6abf4282db94/bzImage-63804fed.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
Read of size 1 at addr ffff88803c59a200 by task syz.0.88/6375

CPU: 1 UID: 0 PID: 6375 Comm: syz.0.88 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/13/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x84/0x330 kernel/locking/lockdep.c:5842
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 __wake_up_common_lock+0x2f/0x1e0 kernel/sched/wait.c:124
 snd_pcm_post_stop sound/core/pcm_native.c:1551 [inline]
 snd_pcm_action_single sound/core/pcm_native.c:-1 [inline]
 snd_pcm_action sound/core/pcm_native.c:1398 [inline]
 snd_pcm_stop+0x428/0x550 sound/core/pcm_native.c:1571
 loopback_check_format sound/drivers/aloop.c:363 [inline]
 loopback_trigger+0xb82/0x1b60 sound/drivers/aloop.c:411
 snd_pcm_do_start sound/core/pcm_native.c:1459 [inline]
 snd_pcm_action_single sound/core/pcm_native.c:1315 [inline]
 snd_pcm_action sound/core/pcm_native.c:1398 [inline]
 snd_pcm_start+0x43d/0x5d0 sound/core/pcm_native.c:1506
 __snd_pcm_lib_xfer+0x175a/0x1d10 sound/core/pcm_lib.c:2405
 snd_pcm_oss_write3+0x1bc/0x350 sound/core/oss/pcm_oss.c:1243
 snd_pcm_plug_write_transfer+0x2d1/0x4d0 sound/core/oss/pcm_plugin.c:630
 snd_pcm_oss_write2+0x283/0x440 sound/core/oss/pcm_oss.c:1375
 snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1441 [inline]
 snd_pcm_oss_write+0x6d1/0xbe0 sound/core/oss/pcm_oss.c:2796
 vfs_write+0x2a3/0xba0 fs/read_write.c:684
 ksys_write+0x156/0x270 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3b93ffaeb9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3b9363d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f3b94276090 RCX: 00007f3b93ffaeb9
RDX: 0000000000004000 RSI: 00002000000012c0 RDI: 0000000000000008
RBP: 00007f3b94068c1f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f3b94276128 R14: 00007f3b94276090 R15: 00007ffd3534b678
 </TASK>

Allocated by task 6371:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x1f2/0x6b0 mm/slub.c:5780
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 snd_pcm_attach_substream+0x5b7/0xb20 sound/core/pcm.c:938
 snd_pcm_open_substream+0xbd/0x2420 sound/core/pcm_native.c:2761
 snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2439 [inline]
 snd_pcm_oss_open+0xfc2/0x1c50 sound/core/oss/pcm_oss.c:2520
 chrdev_open+0x4d0/0x5f0 fs/char_dev.c:414
 do_dentry_open+0x7d0/0x1270 fs/open.c:962
 vfs_open+0x3b/0x350 fs/open.c:1094
 do_open fs/namei.c:4637 [inline]
 path_openat+0x34c9/0x3e70 fs/namei.c:4796
 do_filp_open+0x22d/0x490 fs/namei.c:4823
 do_sys_openat2+0x12f/0x220 fs/open.c:1430
 do_sys_open fs/open.c:1436 [inline]
 __do_sys_openat fs/open.c:1452 [inline]
 __se_sys_openat fs/open.c:1447 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1447
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6371:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6674 [inline]
 kfree+0x1bb/0x8f0 mm/slub.c:6882
 snd_pcm_detach_substream+0x1e1/0x290 sound/core/pcm.c:1003
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2398 [inline]
 snd_pcm_oss_release+0x184/0x250 sound/core/oss/pcm_oss.c:2577
 __fput+0x45e/0xa80 fs/file_table.c:468
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 get_signal+0x11c3/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0xbc/0x830 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:41 [inline]
 exit_to_user_mode_loop+0x86/0x480 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x2b7/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803c59a000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 512 bytes inside of
 freed 2048-byte region [ffff88803c59a000, ffff88803c59a800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3c598
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813fe27000 0000000000000000 0000000000000001
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813fe27000 0000000000000000 0000000000000001
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000003 ffffea0000f16601 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5877, tgid 5877 (syz-executor), ts 111431951832, free_ts 111238160378
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x228/0x280 mm/page_alloc.c:1884
 prep_new_page mm/page_alloc.c:1892 [inline]
 get_page_from_freelist+0x28bb/0x2950 mm/page_alloc.c:3945
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5240
 alloc_pages_mpol+0xd1/0x380 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3a0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xaf8/0x13d0 mm/slub.c:4656
 __slab_alloc+0xc5/0x1f0 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __kmalloc_cache_noprof+0x100/0x6b0 mm/slub.c:5775
 kmalloc_noprof include/linux/slab.h:957 [inline]
 rtnl_newlink+0x136/0x1be0 net/core/rtnetlink.c:3972
 rtnetlink_rcv_msg+0x7d5/0xbe0 net/core/rtnetlink.c:6958
 netlink_rcv_skb+0x232/0x4b0 net/netlink/af_netlink.c:2550
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x831/0x9f0 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg net/socket.c:742 [inline]
 __sys_sendto+0x72a/0x7d0 net/socket.c:2206
 __do_sys_sendto net/socket.c:2213 [inline]
 __se_sys_sendto net/socket.c:2209 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2209
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
page last free pid 1102 tgid 1102 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0xfd0/0x1160 mm/page_alloc.c:2973
 __slab_free+0x2e6/0x330 mm/slub.c:6008
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 kmem_cache_alloc_node_noprof+0x22f/0x6d0 mm/slub.c:5315
 __alloc_skb+0x1d7/0x390 net/core/skbuff.c:679
 alloc_skb include/linux/skbuff.h:1383 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 inet_netconf_notify_devconf+0x173/0x240 net/ipv4/devinet.c:2209
 __devinet_sysctl_unregister net/ipv4/devinet.c:2704 [inline]
 devinet_sysctl_unregister net/ipv4/devinet.c:2728 [inline]
 inetdev_destroy net/ipv4/devinet.c:334 [inline]
 inetdev_event+0x79e/0x1610 net/ipv4/devinet.c:1655
 notifier_call_chain+0x19d/0x3a0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2281 [inline]
 call_netdevice_notifiers net/core/dev.c:2295 [inline]
 unregister_netdevice_many_notify+0x186a/0x2360 net/core/dev.c:12396
 ops_exit_rtnl_list net/core/net_namespace.c:187 [inline]
 ops_undo_list+0x3d3/0x940 net/core/net_namespace.c:248
 cleanup_net+0x4e5/0x7b0 net/core/net_namespace.c:696
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xaec/0x17a0 kernel/workqueue.c:3340
 worker_thread+0xda6/0x1360 kernel/workqueue.c:3421
 kthread+0x726/0x8b0 kernel/kthread.c:463

Memory state around the buggy address:
 ffff88803c59a100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803c59a180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803c59a200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88803c59a280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803c59a300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
