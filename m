Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD873407570
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458751; cv=none; b=i2u5T13IIe8M9lyr55eX4XlckGgC/8sSta1JJbat0kkplzaQ0loknyXqpbFGbrgJn5jH/XME24eqdAvcrRxmgvRK7NVzdUKKNuBBmZCo2XYv+jwupKI0WQ2hp8nHf8Pmwn6rgpVPwhht/0Qz2zNPG1lvyZHi11uL3OFIPZcnAX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458751; c=relaxed/simple;
	bh=53WAMty960onyx+uULkWfvkJXjJxSe29ATNZ+Id6eVY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qXhPMkU/oZcRAcB3tk4k3IqmeXDEfNaryndcaYGM5mvQtgQ6a/YSaPVKRTER1xgnjvVZ9n/9jRFALO8nrvS68GmxKNbXTXemiToBdaCqxPJ1hiTorQgstpU1D6nJvMAJPuhlzNGQGffPrkCtnffelDAjSxPI6JnRpieeFd8vivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-484af6e4d26so5543594b6e.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 07:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458743; x=1780063543;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZIiWkn0A9nMZoxqIl5sEKCHY941oTcWCUaSE0Q1Czs=;
        b=oQQbvq7uUseo8e+tyypUyK9q0QPIOTYzxvTm2az+noH8RvIdI1Z5PAXKTy238nSn9r
         KY0pzJ9Eahhd0rxmFFGqL4AzgJ1pkjOvUi+RuD921sJDVrj4Bs3e76fmjDvT3mXisPpV
         mWBZlD4+3AoupJ1w+j14TgNP3Q0pSHkNNr73DfQQLrVkI1L5voPXn3Zc4BqSVfXV98c6
         jz0WCvkS5sw9o+FSJVtU7qAQFzxCjRPNUE8tw6ZlhAR7IcKdoPBSGxsZebARO54MY33Y
         v+1QNw/HcgGyWU5ZJzID5nBl/4vb8Khu4ob4KnLI+WWAPfG6gLJzadbPMk0icjMMtmoI
         HSsg==
X-Forwarded-Encrypted: i=1; AFNElJ8eUjFG8tXvmW8atM0fB6TXQEYeNVfhQaAYUnqxpJdKVN/RxyGMZwZEw+3aqGV1RjtX62BdcyXaB3x0BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wvd+vkGPD2UfJDjiEGufK5B9r2oFQHKDBpqLrXOpncebcEyf
	DfpDD7zxVmQM4ypYCA0Ag1L1rZQIcUQeiACmVTeBfdGFglkFF8Gc/wtyIZxRLZqDVuLDjdMcIpg
	sGzC0lnH4JsNGBtyrhhGyqB1rP1su+lNhYh7SPJHxsLQbxrvjEDSNyqBINhk=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe6:b0:479:ffcf:52dc with SMTP id
 5614622812f47-4854a3af8f8mr2153338b6e.44.1779458743571; Fri, 22 May 2026
 07:05:43 -0700 (PDT)
Date: Fri, 22 May 2026 07:05:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1062b7.170a0220.35b2b7.0003.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: slab-use-after-free Read in
 snd_pcm_oss_look_for_setup (2)
From: syzbot <syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6916d5703ddf Merge tag 'drm-fixes-2026-05-16' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15012536580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0f0911eedbc130a
dashboard link: https://syzkaller.appspot.com/bug?extid=8e498074a794999eb41c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1efefe7c73e1/disk-6916d570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1dcf16f12a0f/vmlinux-6916d570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7bc2e1f3e5cd/bzImage-6916d570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in snd_pcm_oss_look_for_setup+0x2d3/0x370 sound/core/oss/pcm_oss.c:2355
Read of size 8 at addr ffff888022f56d00 by task syz.1.988/10837

CPU: 0 UID: 0 PID: 10837 Comm: syz.1.988 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1d0 mm/kasan/report.c:595
 snd_pcm_oss_look_for_setup+0x2d3/0x370 sound/core/oss/pcm_oss.c:2355
 snd_pcm_oss_open+0xddc/0x1390 sound/core/oss/pcm_oss.c:2521
 soundcore_open+0x2e3/0x5a0 sound/sound_core.c:594
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6d8/0x1660 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x208c/0x31a0 fs/namei.c:4858
 do_file_open+0x20e/0x430 fs/namei.c:4887
 do_sys_openat2+0x10d/0x1e0 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x10b/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fda1919ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fda1a0fa028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fda19416090 RCX: 00007fda1919ce59
RDX: 0000000000020342 RSI: 00002000000001c0 RDI: ffffffffffffff9c
RBP: 00007fda19232d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fda19416128 R14: 00007fda19416090 R15: 00007ffdc6f4a5c8
 </TASK>

Allocated by task 10831:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kmalloc_noprof include/linux/slab.h:950 [inline]
 snd_pcm_oss_proc_write+0x736/0x9a0 sound/core/oss/pcm_oss.c:3058
 snd_info_text_entry_release+0xfb/0x260 sound/core/info.c:386
 close_pdeo.part.0+0xdf/0x2e0 fs/proc/inode.c:242
 close_pdeo fs/proc/inode.c:540 [inline]
 proc_reg_release+0x2df/0x350 fs/proc/inode.c:546
 __fput+0x3ff/0xb50 fs/file_table.c:510
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
 exit_to_user_mode_loop+0x107/0x4f0 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:238 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x6f2/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 10831:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6250 [inline]
 kfree+0x223/0x6c0 mm/slub.c:6565
 snd_pcm_oss_proc_write+0x7b1/0x9a0 sound/core/oss/pcm_oss.c:3072
 snd_info_text_entry_release+0xfb/0x260 sound/core/info.c:386
 close_pdeo.part.0+0xdf/0x2e0 fs/proc/inode.c:242
 close_pdeo fs/proc/inode.c:540 [inline]
 proc_reg_release+0x2df/0x350 fs/proc/inode.c:546
 __fput+0x3ff/0xb50 fs/file_table.c:510
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
 exit_to_user_mode_loop+0x107/0x4f0 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:238 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x6f2/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888022f56d00
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 0 bytes inside of
 freed 32-byte region [ffff888022f56d00, ffff888022f56d20)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888022f56240 pfn:0x22f56
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88813fe2f780 ffffea0000d47510 ffffea0000ca7a10
raw: ffff888022f56240 000000080040003f 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5387, tgid 5387 (getty), ts 194081637728, free_ts 194058318447
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x153/0x170 mm/page_alloc.c:1858
 prep_new_page mm/page_alloc.c:1866 [inline]
 get_page_from_freelist+0x11a6/0x33b0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x27c/0x2bc0 mm/page_alloc.c:5226
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab mm/slub.c:3467 [inline]
 new_slab+0xa6/0x6c0 mm/slub.c:3525
 refill_objects+0x277/0x420 mm/slub.c:7271
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x375/0x650 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __kmalloc_cache_noprof+0x493/0x6f0 mm/slub.c:5414
 kmalloc_noprof include/linux/slab.h:950 [inline]
 slab_free_hook mm/slub.c:2641 [inline]
 slab_free mm/slub.c:6250 [inline]
 kmem_cache_free+0x41e/0x6c0 mm/slub.c:6377
 tear_down_vmas+0x2a5/0x600 mm/mmap.c:1262
 exit_mmap+0x469/0xa10 mm/mmap.c:1320
 __mmput+0x12a/0x410 kernel/fork.c:1178
 mmput+0x67/0x80 kernel/fork.c:1201
 exit_mm kernel/exit.c:582 [inline]
 do_exit+0x8b2/0x2af0 kernel/exit.c:964
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1119
 __do_sys_exit_group kernel/exit.c:1130 [inline]
 __se_sys_exit_group kernel/exit.c:1128 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1128
 x64_sys_call+0x102c/0x1530 arch/x86/include/generated/asm/syscalls_64.h:232
page last free pid 15 tgid 15 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0x747/0x1040 mm/page_alloc.c:2943
 __pagetable_free include/linux/mm.h:3661 [inline]
 pagetable_free include/linux/mm.h:3685 [inline]
 pagetable_dtor_free include/linux/mm.h:3784 [inline]
 __tlb_remove_table include/asm-generic/tlb.h:221 [inline]
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x2cf/0x380 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2617 [inline]
 rcu_core+0x5a2/0x10d0 kernel/rcu/tree.c:2869
 handle_softirqs+0x1ea/0xa00 kernel/softirq.c:622
 run_ksoftirqd kernel/softirq.c:1076 [inline]
 run_ksoftirqd+0x38/0x60 kernel/softirq.c:1068
 smpboot_thread_fn+0x3d3/0xaa0 kernel/smpboot.c:160
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888022f56c00: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
 ffff888022f56c80: 00 00 00 fc fc fc fc fc fa fb fb fb fc fc fc fc
>ffff888022f56d00: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
                   ^
 ffff888022f56d80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff888022f56e00: 00 00 00 fc fc fc fc fc fa fb fb fb fc fc fc fc
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
