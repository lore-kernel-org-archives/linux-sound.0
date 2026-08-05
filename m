Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15B31C567
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888746; cv=none; b=VFQt/jCLI3rDA2NbHWzCW7eEVInE4OnLZWv7cGgOmQTAGY1nN6cK4eVkz8/vRI8zmHtZqjL1jcqtt2Fu51llOIqipHsRXzX1OkRQo+WQWjnpSIAz8HUMepMrYy6VQTWI9yzPpTl1umNSW2D0qMlb1qUskVL3rvoeYF2XbC1HAOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888746; c=relaxed/simple;
	bh=iKQFq2awJhVx5dnO3MmIrLu9lHB12oARtMLZDm/CJzI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RplwmfF7PpTy7aCZQWyzxQLO9vzgOKBtJEJZ+ytGA/j1pIGLmz4r++GamCuIa7UQnW+uVsFb8R8M3LxPxvNZGpxpP2w2zXfDuKR5uplQ9msg6oe3qpKRi/QHR0CmqFgUF0bCbupHJ4ayxZGLVQfNDvDktfcGiAGWbj3jhNPtfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7f18aff8226so472401a34.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 17:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785888743; x=1786493543;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeSTomcLxdr/GN0kMzMRKTQzqOUyqtThUPsCFcfh+L8=;
        b=qgxO6HhvM20gkmTGmt7e0VCBnkMVY3VXZOPOCdXiQ7/mYWiWXs6utTFGRF1BCsqqa3
         NobuqQTXovfCHQrRUACWpEC6zMuNlZdeC3rh25FNzE1PHNiPyF/BZZGBibnzFcWuPDvg
         /hvzfoi266a0Do6Y+DHVRIuu1QJFXi3BkwFfzhcnMYmLavTt3z0Keddjv9MkwR2TR66S
         l/iuh2dkgBO500x+M0eciBj4S1xEK0+CTFdpnVnCkkQVCQRKsVtkhcmE7FUT3j25frDf
         4ddsImxCZCDwlBM+cU3oi/+NH+Qer1aADGmRk+/v+aoxUJYvXo+GiiBRSo0QKQhIyjPg
         XQvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYGqoJqR8JXs9V7e5SyL9X+hEJsvBsf74xdiIYz7+CAcIKjGiNs1tkvLIWbo9+WEZlW6enCl5CBtlL0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC2xUFJH0w7oRdBwns8GkBWaURzYMaH7mV1BenTWbW/wNrGRZA
	y25qzSdmVk97vmSG/tUIG70YFC8rJlZAWH5OBBbof6mHsqLXAsWt8kXDFtkU/mBu4Bk0BsHMsZO
	HAdchJrnsEU0oMixYwVLcSwuoxTScspaz9EugbMHIPuwdFatho2e/pgcPIVs=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2916:b0:6ac:aa4c:5d93 with SMTP id
 006d021491bc7-6ae97038ea5mr1665644eaf.36.1785888743381; Tue, 04 Aug 2026
 17:12:23 -0700 (PDT)
Date: Tue, 04 Aug 2026 17:12:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a727fe7.13623e66.bdc14.003c.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: use-after-free Read in release_card_device
From: syzbot <syzbot+7061d72c26b7daebe2b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0131b508c0e2 Merge tag 'ntfs-for-7.2-rc6' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=109f4c9e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=7061d72c26b7daebe2b4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/237b6b227f6e/disk-0131b508.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/90a5294c2a5d/vmlinux-0131b508.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54d17924c110/bzImage-0131b508.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7061d72c26b7daebe2b4@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in snd_card_do_free sound/core/init.c:604 [inline]
BUG: KASAN: use-after-free in release_card_device+0x17d/0x1a0 sound/core/init.c:153
Read of size 1 at addr ffff88814a70c909 by task syz.5.630/8206

CPU: 0 UID: 0 PID: 8206 Comm: syz.5.630 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 snd_card_do_free sound/core/init.c:604 [inline]
 release_card_device+0x17d/0x1a0 sound/core/init.c:153
 device_release+0xd2/0x270 drivers/base/core.c:2636
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3880
 snd_card_file_remove+0x38f/0x560 sound/core/init.c:1125
 snd_pcm_oss_release+0x217/0x300 sound/core/oss/pcm_oss.c:2596
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x951/0x2ae0 kernel/exit.c:1009
 do_group_exit+0xd5/0x2a0 kernel/exit.c:1152
 get_signal+0x1ec7/0x21e0 kernel/signal.c:3046
 arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x139/0x6f0 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x666/0x870 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f883d59e019
Code: Unable to access opcode bytes at 0x7f883d59dfef.
RSP: 002b:00007f883e4a40e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007f883d825fa8 RCX: 00007f883d59e019
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f883d825fa8
RBP: 00007f883d825fa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f883d826038 R14: 00007fff416628d0 R15: 00007fff416629b8
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14a70c
flags: 0x57ff00000000000(node=1|zone=2|lastcpupid=0x7ff)
raw: 057ff00000000000 ffff8880b8541800 ffff8880b8541800 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_ZERO|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 17137786410, free_ts 237675753363
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_pages_mpol+0x1fb/0x540 mm/mempolicy.c:2490
 ___kmalloc_large_node+0xe5/0x120 mm/slub.c:5274
 __kmalloc_large_node_noprof+0x1c/0x70 mm/slub.c:5305
 __do_kmalloc_node mm/slub.c:5322 [inline]
 __kmalloc_node_track_caller_noprof+0x5ac/0x830 mm/slub.c:5471
 alloc_dr drivers/base/devres.c:141 [inline]
 __devres_alloc_node+0x6e/0x1e0 drivers/base/devres.c:189
 snd_devm_card_new+0x9d/0x190 sound/core/init.c:235
 loopback_probe+0x140/0x11a0 sound/drivers/aloop.c:1805
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
page last free pid 8220 tgid 8219 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 free_node drivers/base/devres.c:50 [inline]
 release_nodes+0xc3/0x120 drivers/base/devres.c:547
 devres_release_all+0x112/0x180 drivers/base/devres.c:576
 device_unbind_cleanup+0x81/0x270 drivers/base/dd.c:597
 __device_release_driver drivers/base/dd.c:1354 [inline]
 device_release_driver_internal+0x4c4/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88814a70c800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88814a70c880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88814a70c900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                      ^
 ffff88814a70c980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88814a70ca00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
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
