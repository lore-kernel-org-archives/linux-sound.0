Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B99236728F
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610140; cv=none; b=T5lHrZNZ57e/15BqwRjnodxmYEp1rH5X4a09wvAZFsVjlk1ZVvHp/eoxoX5HfI7WPQBYTnpbivuDfozhvoOEvBVrfbeYXIWUtEBBb2aZBG9DQ7XbouHfpGfZg9umqWQMHc4ga7ZBl2eh4IzsiOS+NR1z3yzj18MYoa+iQdKGNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610140; c=relaxed/simple;
	bh=pBhcfDANr+8xzXXk+YHnIrSDGE9fW+cemHlNX30oXzU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Lr46js7oezfIZqCBT6Jal5XDnfCl8dfLIZZd1K4GNYXnUzU6ijNuvHU9DYwyeYlekmwph/RHuhSRlm5QoAOt4SzSdnYXdAWJ6MYEbTGPUnkv8k6j4khkvbzhuBveZlnDu2CqGCkqYnDk8sPqGgeJzblr7qloEiP6bTpaBUTWMJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6aca189b5a9so1208913eaf.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 01:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610137; x=1787214937;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZRFuA8wXVZT5yttkomsNL/08nmfPkvAT00ScrANO5o=;
        b=bAiHsEZbo4lBkS9651nBqdSNgrDneYFuBNssgUJeicY8CHqL8Y6nGJIP9bRfdvapVB
         nPIzP3R3TLmVlEYKSFaFkABr5PG9V/zzIxHduH1RB0JZfgpoGDAYdu/9ix0SW7vy0FhE
         Aj/BJq96RA1DP0If4brpeIjMqd2FM+GdKqsOGzvUH355f8scfF/WDY8XioRryd0TZQ8O
         Yg9fs+a1JEvcAC4ebDpTb3ivCPuuu7owRjutbwezPhyLb3K5mzmr7xAMxQyPz19clCrI
         Iel53AuqVTTRXmzwDM1i8IW0NXgNtLHCYDyj2c4wfmsAtHUHNdfOFA2zyCPGpDpZxfs9
         eexw==
X-Forwarded-Encrypted: i=1; AHgh+RqSkOKByMZpgEr/42ymSfrDhL8bpSPAQCkgFK4W/ClwK6iiVUeCKK43TdLkbGdCQi5eHJb+F/77Hx1tsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIbIyRkHE768szX0qCQjLLBqEtwYlsC+ukgERKkI8QB9tsbddK
	AMi2LJfRYyjVkN55P1jRDh6cfVJfhx9l8+7ICfiGL7wP9hseVR8kypmkUBAsMmQbJxd7VGrxM9E
	DB7McBC1bCasGLyDKFW3qlvMbJVfggXJtEierN2jxRyhgyNMsBsgLHreNniI=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d49:b0:6a0:ff94:df7b with SMTP id
 006d021491bc7-6b0c4634ffbmr4114585eaf.35.1786610137192; Thu, 13 Aug 2026
 01:35:37 -0700 (PDT)
Date: Thu, 13 Aug 2026 01:35:37 -0700
In-Reply-To: <6a727fe7.13623e66.bdc14.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7d81d9.d5f0ebe7.22d851.0014.GAE@google.com>
Subject: Re: [syzbot] [sound?] KASAN: use-after-free Read in release_card_device
From: syzbot <syzbot+7061d72c26b7daebe2b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1729f479580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aaf0da806f995318
dashboard link: https://syzkaller.appspot.com/bug?extid=7061d72c26b7daebe2b4
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=120e8ac6580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7061d72c26b7daebe2b4@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in snd_card_do_free sound/core/init.c:604 [inline]
BUG: KASAN: use-after-free in release_card_device+0x1ab/0x1b0 sound/core/init.c:153
Read of size 1 at addr ffff8880331d8909 by task syz-executor144/6080

CPU: 0 UID: 0 PID: 6080 Comm: syz-executor144 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 snd_card_do_free sound/core/init.c:604 [inline]
 release_card_device+0x1ab/0x1b0 sound/core/init.c:153
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 snd_card_file_remove+0x331/0x390 sound/core/init.c:1125
 snd_pcm_release+0x12c/0x160 sound/core/pcm_native.c:2986
 __fput+0x418/0xa50 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:617
 __do_sys_close fs/open.c:1511 [inline]
 __se_sys_close fs/open.c:1496 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1496
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f26958f02de
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007f269508d118 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f269508d6c0 RCX: 00007f26958f02de
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
RBP: 00007f2695964d40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000002 R14: 00007ffe4c4b2ad0 R15: 00007ffe4c4b2bb8
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880331d9c00 pfn:0x331d8
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0001c3d308 ffff8880b8641140 0000000000000000
raw: ffff8880331d9c00 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_ZERO|__GFP_COMP), pid 6065, tgid 6065 (syz-executor144), ts 116170038251, free_ts 116442889522
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_pages_mpol+0x212/0x380 mm/mempolicy.c:2490
 ___kmalloc_large_node+0x4c/0x120 mm/slub.c:5274
 __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:5305
 __do_kmalloc_node mm/slub.c:5322 [inline]
 __kmalloc_node_track_caller_noprof+0x164/0x730 mm/slub.c:5471
 alloc_dr drivers/base/devres.c:141 [inline]
 __devres_alloc_node+0x4c/0x160 drivers/base/devres.c:189
 snd_devm_card_new+0x84/0x160 sound/core/init.c:235
 loopback_probe+0x150/0x13d0 sound/drivers/aloop.c:1805
 platform_probe+0xf9/0x190 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
 bind_store+0x1d0/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
page last free pid 6077 tgid 6065 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
 free_node drivers/base/devres.c:50 [inline]
 release_nodes drivers/base/devres.c:547 [inline]
 devres_release_all+0x1ce/0x260 drivers/base/devres.c:576
 device_unbind_cleanup drivers/base/dd.c:597 [inline]
 __device_release_driver drivers/base/dd.c:1354 [inline]
 device_release_driver_internal+0x5d9/0x880 drivers/base/dd.c:1372
 unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880331d8800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880331d8880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff8880331d8900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                      ^
 ffff8880331d8980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880331d8a00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
