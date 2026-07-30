Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D6B2BD11
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 00:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370167; cv=none; b=JdUi3TxVIN+BVI+V1xH8eO+6fW50eMEQKdIT1bzPg/YliO3gXwS84EdrLURnY+qakhG8srz3ZTOXlVZwCGGsEKfG9dtzQOna2YBgRmoTQ4GsRQramcPYO2lzOyRWQPL5agusA94OZ7e7Bm3wbK6LJVtky6K/YmQgeJIumvR8ZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370167; c=relaxed/simple;
	bh=UVQUev70Ee3bLuNlrd830030ia8rWfgGv4ZjThqZXJs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pw+RjdCrMLGjZO46ycJcUJ2CSSACvb7YKNDywYL58Ors9yRdAbjAFjAE9htryZ9F9r8Amp9Ocd6YNyc2OkL7qL999CixGP5IDTfnSBMVnIYHCBryw01mkoi0/1GiUVclnPWfm6RclFhJnqnKcCYvy2DNHpOHMQd8wVA2nOpBIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4ab7bb257bbso1082212b6e.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 17:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785370164; x=1785974964;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0eFkImV5eXXEbNmd+NdAEIIwGVFVJChvLPXlzW8568=;
        b=AM1sr4kXU3P2c7168N7pXYBbQLsRg5oSoul70B1BWmRtD414yga6zmYTOwSw94MLX9
         kLRePIp6LFSfXaYHX4awvxltE9Ov3sK3rRiNZ/dKKE5A8fGXhVzsi/soFszvB0MPXG6Z
         RVv3riPFiUlh/W3q5iObSuRX1gMePp3S02ojX6aMLpqwoN3X9XEdVYXPOEtzqsS51Ay8
         91tvTOfeLtUFE1pNhFhQx0ZeeGW2nSydATWrCCe3s1ivVmht7b7IRFhOCqk62kbZD7/Y
         p7mVYRhL08bK6wE9po1J73eaD3dsSYOcXrRoAsW/mnkxYQEnIZudgYbSfJwhWaCssYR5
         SV4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoW5hSfVHo5B9/XTR3yweVboCDs5RQcBMBOl6JOA6O1rNF7JF/5LwPURM1ZJtbiH68weEj6hrHJsUJR6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOvRs0GIVtxdlbXUBhf9VqWOSqcA8csnJmsJ0R/O8r2js0Ags
	e5KkNzDrrieCNe4EElM68EgDY7i/zRvwFre9HXipmYaO+FVF7ubmjfJGDLWQ2+3df6lwfKl5Dw3
	iW9NwLah19g7T4pEWAEEtdYCHp0buGrWj1650hnfAPr5OPeI1GYMtuzrnJ0w=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a08:b0:495:db98:cd70 with SMTP id
 5614622812f47-4ad8797db35mr373707b6e.35.1785370164515; Wed, 29 Jul 2026
 17:09:24 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:09:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6a9634.57649fcc.360844.000b.GAE@google.com>
Subject: [syzbot] [sound?] possible deadlock in snd_rawmidi_kernel_open
From: syzbot <syzbot+d10d58fc99caa0489796@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4235cb24ec1e Merge tag 'vfs-7.2-rc5.fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13f66449580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=d10d58fc99caa0489796
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4235cb24.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0220bd6b47b0/vmlinux-4235cb24.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b7fcbec12504/bzImage-4235cb24.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d10d58fc99caa0489796@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Tainted: G             L     
--------------------------------------------
syz.5.2143/13505 is trying to acquire lock:
ffff88802becc160 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
ffff88802becc160 (&rmidi->open_mutex){+.+.}-{4:4}, at: snd_rawmidi_kernel_open+0xa4/0x190 sound/core/rawmidi.c:422

but task is already holding lock:
ffff888057f60960 (&rmidi->open_mutex){+.+.}-{4:4}, at: snd_rawmidi_open+0x296/0xba0 sound/core/rawmidi.c:467

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&rmidi->open_mutex);
  lock(&rmidi->open_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by syz.5.2143/13505:
 #0: ffff888057f60960 (&rmidi->open_mutex){+.+.}-{4:4}, at: snd_rawmidi_open+0x296/0xba0 sound/core/rawmidi.c:467
 #1: ffff88802becc460 (&ump->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #1: ffff88802becc460 (&ump->open_mutex){+.+.}-{4:4}, at: snd_ump_legacy_open+0x120/0x4e0 sound/core/ump.c:1153

stack backtrace:
CPU: 3 UID: 0 PID: 13505 Comm: syz.5.2143 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_deadlock_bug.cold+0xbd/0xca kernel/locking/lockdep.c:3041
 check_deadlock kernel/locking/lockdep.c:3093 [inline]
 validate_chain kernel/locking/lockdep.c:3895 [inline]
 __lock_acquire+0x1256/0x1a40 kernel/locking/lockdep.c:5237
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 class_mutex_constructor include/linux/mutex.h:253 [inline]
 snd_rawmidi_kernel_open+0xa4/0x190 sound/core/rawmidi.c:422
 snd_ump_legacy_open+0x367/0x4e0 sound/core/ump.c:1160
 open_substream+0x480/0x970 sound/core/rawmidi.c:348
 rawmidi_open_priv+0x595/0x6f0 sound/core/rawmidi.c:397
 snd_rawmidi_open+0x4c9/0xba0 sound/core/rawmidi.c:485
 soundcore_open+0x2e3/0x5a0 sound/sound_core.c:594
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcac935e6ce
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007fcaca1f0b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fcaca1f16c0 RCX: 00007fcac935e6ce
RDX: 0000000000000002 RSI: 00007fcaca1f0c00 RDI: ffffffffffffff9c
RBP: 00007fcaca1f0c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007fcac9626038 R14: 00007fcac9625fa0 R15: 00007ffed37eca28
 </TASK>


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
