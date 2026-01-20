Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64F34D4EC
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939775; cv=none; b=MxSd8i9o5abgazaH3TYd5bEIsi7LKCSVsQYCtm3FkxghRgn2fhb0QVZFp20ZSmj//RMtUFhXlr/XlCBHv76f7GiRxNeEVJEIp3fYJHSb8vnAzx4lYo4mCddb/xRqgma6rNgLPzFp4QdlM2UgYi9jEf3flGO+kSUevEHOMP6z9+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939775; c=relaxed/simple;
	bh=RZAZOcFftgqiOUqdetZ4qJufpsPtVj4pn7RSezgEOqA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ych2J6BYrHyZhnXGyl4RNr14nGxzGHY95XFelkjYyKfWHTNGbCANfMHeLwuGnxdZoDNSQpYkvV5wp+cVYco5Jx4LuMJQ4PWcG6N6zpTVy0Wmdw7R28HV5UpmKl5e/byWaqTJRwAv0s76hEKlo5Qko2J+mkMHc0iAR9wUEsJIPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-65f66b8be64so13829372eaf.3
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 12:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939772; x=1769544572;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JyllCYGHWtGpqdkbEf3fWZjzQT6BUA8wzTUSY8dsow=;
        b=e+yasqGPvTq0hAedvN84cPkHrrSZzxPGUrBThiQ8KH9RFGT3SZ1Rdah71PZh2Kc4ir
         xS6P7QF9nboNpabmmQeAYy54N3qwX4xCzWo6GhVOFjLMjTma5bYIMG7BIl9WcHU5btNO
         vBOyi+1LNND1xFcPjGWTiknJhqubN/zqGns0op+hCvY4rV+1mCEhPePps1sr4D2RjCzC
         Azzg1dNimzKj5vQr01PQdHWsTaAJipDaZDawrmrrxpvfblLKTKE6eTLbrLBQDm7HkbsQ
         nWmaqQQO7MOETw5lZ7wzL0osSx9RleiKLCoHTK24/DpejJfSGIwpy4UxhAh84hzrntyR
         7RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlqTBBZxEdZF6dIYr3rJ20PifZN+Pd7IXtFZSs8RDG16Z9OvSZuE7+9D0flWkYrx44YHqpnsirnc5GIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxHVKK11DaV7RR0U1ad7pkoN0NLSrUgw+Ar2QKJU2LAQ1O/Qy
	ZFaYclfFRbCfxr8oedfojRdhgZrzorJlEaCeAJ00Sc/p83nFDtegqHQoepYDSyjCrqFysrLB7yH
	14y6mYms2I5m3Y/qywPIIBwGelYLyJ2uCsoA7fuRU3X68rpCwj/THXeeIZcs=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4a0d:b0:659:9a49:8f9a with SMTP id
 006d021491bc7-661188e745amr4701684eaf.19.1768939772459; Tue, 20 Jan 2026
 12:09:32 -0800 (PST)
Date: Tue, 20 Jan 2026 12:09:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696fe0fc.050a0220.706b.0001.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: slab-use-after-free Read in snd_pcm_post_stop
From: syzbot <syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e84d960149e7 Merge tag 'for-6.19-rc5-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15277522580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7b058fb1d7dbe6b1
dashboard link: https://syzkaller.appspot.com/bug?extid=16b2b67ae905feb8a289
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/09af5f7a987e/disk-e84d9601.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9b42fe73e088/vmlinux-e84d9601.xz
kernel image: https://storage.googleapis.com/syzbot-assets/37e4d5c70177/bzImage-e84d9601.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
Read of size 1 at addr ffff88802fee8170 by task syz.0.79/6271

CPU: 1 UID: 0 PID: 6271 Comm: syz.0.79 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x84/0x340 kernel/locking/lockdep.c:5842
 rt_spin_lock+0x88/0x3e0 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:44 [inline]
 __wake_up_common_lock+0x2f/0x1e0 kernel/sched/wait.c:124
 snd_pcm_post_stop+0x14a/0x1e0 sound/core/pcm_native.c:1550
 snd_pcm_action_single sound/core/pcm_native.c:-1 [inline]
 snd_pcm_action+0x1f4/0x240 sound/core/pcm_native.c:1398
 loopback_check_format sound/drivers/aloop.c:363 [inline]
 loopback_trigger+0xb82/0x1b60 sound/drivers/aloop.c:411
 snd_pcm_do_start+0xb7/0x180 sound/core/pcm_native.c:1459
 snd_pcm_action_single sound/core/pcm_native.c:1315 [inline]
 snd_pcm_action+0xe7/0x240 sound/core/pcm_native.c:1398
 __snd_pcm_lib_xfer+0x1762/0x1d00 sound/core/pcm_lib.c:2405
 snd_pcm_oss_write3+0x1bc/0x350 sound/core/oss/pcm_oss.c:1243
 snd_pcm_plug_write_transfer+0x2cb/0x4c0 sound/core/oss/pcm_plugin.c:630
 snd_pcm_oss_write2 sound/core/oss/pcm_oss.c:1375 [inline]
 snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1441 [inline]
 snd_pcm_oss_write+0xa31/0xf20 sound/core/oss/pcm_oss.c:2796
 vfs_write+0x287/0xb40 fs/read_write.c:684
 ksys_write+0x14b/0x260 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0e7667f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0e748a4038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f0e768d6180 RCX: 00007f0e7667f749
RDX: 0000000000004000 RSI: 00002000000012c0 RDI: 0000000000000007
RBP: 00007f0e76703f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0e768d6218 R14: 00007f0e768d6180 R15: 00007ffe1e187e28
 </TASK>

Allocated by task 6270:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x1fb/0x6d0 mm/slub.c:5776
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 snd_pcm_attach_substream+0x5b7/0xb30 sound/core/pcm.c:938
 snd_pcm_open_substream+0xb6/0x2410 sound/core/pcm_native.c:2761
 snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2439 [inline]
 snd_pcm_oss_open+0xf2a/0x1bd0 sound/core/oss/pcm_oss.c:2520
 chrdev_open+0x4cf/0x5e0 fs/char_dev.c:414
 do_dentry_open+0x7d0/0x1270 fs/open.c:962
 vfs_open+0x3b/0x350 fs/open.c:1094
 do_open fs/namei.c:4637 [inline]
 path_openat+0x342a/0x3df0 fs/namei.c:4796
 do_filp_open+0x1fa/0x410 fs/namei.c:4823
 do_sys_openat2+0x121/0x200 fs/open.c:1430
 do_sys_open fs/open.c:1436 [inline]
 __do_sys_openat fs/open.c:1452 [inline]
 __se_sys_openat fs/open.c:1447 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1447
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6268:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6670 [inline]
 kfree+0x1bd/0x900 mm/slub.c:6878
 snd_pcm_detach_substream+0x1e1/0x290 sound/core/pcm.c:1003
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2398 [inline]
 snd_pcm_oss_release+0x184/0x250 sound/core/oss/pcm_oss.c:2577
 __fput+0x45b/0xa80 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
 exit_to_user_mode_loop+0xef/0x4e0 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x2c1/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802fee8000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 368 bytes inside of
 freed 2048-byte region [ffff88802fee8000, ffff88802fee8800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2fee8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff27000 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff27000 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 0080000000000003 ffffea0000bfba01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 12, tgid 12 (kworker/u8:0), ts 112751171195, free_ts 112474179646
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1884
 prep_new_page mm/page_alloc.c:1892 [inline]
 get_page_from_freelist+0x28c0/0x2960 mm/page_alloc.c:3945
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5240
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
 __alloc_skb+0x204/0x3a0 net/core/skbuff.c:690
 alloc_skb include/linux/skbuff.h:1383 [inline]
 mld_newpack+0x13c/0xc40 net/ipv6/mcast.c:1775
 add_grhead+0x5a/0x2a0 net/ipv6/mcast.c:1886
 add_grec+0x1452/0x1740 net/ipv6/mcast.c:2025
 mld_send_initial_cr+0x288/0x550 net/ipv6/mcast.c:2268
 ipv6_mc_dad_complete+0x88/0x410 net/ipv6/mcast.c:2279
 addrconf_dad_completed+0x58d/0xd70 net/ipv6/addrconf.c:4340
page last free pid 5166 tgid 5166 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0xfe1/0x1170 mm/page_alloc.c:2973
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x149/0x170 mm/slub.c:3886
 __slab_free+0x2af/0x330 mm/slub.c:5952
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kvmalloc_node_noprof+0x3b4/0x940 mm/slub.c:7136
 seq_buf_alloc fs/seq_file.c:38 [inline]
 seq_read_iter+0x203/0xe20 fs/seq_file.c:210
 new_sync_read fs/read_write.c:491 [inline]
 vfs_read+0x563/0xa30 fs/read_write.c:572
 ksys_read+0x14b/0x260 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802fee8000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802fee8080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802fee8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                             ^
 ffff88802fee8180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802fee8200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
