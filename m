Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2635E94F
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592272; cv=none; b=hLIS3Y0rHQp4BriLfRALiYdWAsnKjyLCTbTzdsWyB7qC0aiw00m6ycTsk113tF7XBQDiRboDszVTFBWciK8urX0M4QWTpgJJVXxHwfniW+pApIivJpgRN9qXiKAtEoQeO7o4lU61odjyvJPiZfr/wwAgWdWS2RrjwXZqMnNn1uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592272; c=relaxed/simple;
	bh=lQwBJcYe4HGSztLpEq5r/XxNuBtWNglyRh4c2/HetRw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZQnYVfIOAPsHST6P2mHG548DK7d8Vkt94/ThGuhs3/FCpxLOI6CRss+5zvv6Pp9CtTk2xhny+uPH741bHdteg7oNjecSGAW/eO5ttQ/9aKUjTqfOjQBS5BnJkNPGbySMeseVoC7GodF1l7pAw3+el6uyOsORmNAFHeCfZFS+rd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4af7b6a2349so1691959b6e.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787592269; x=1788197069;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IpoK5mGpVvd7seW9F/U8EzzJ1RgOKGijTXpNX2gbEk=;
        b=kVNtj0fqDJMtn+5QHlgVPAaQ8I1xDK6Bw6AC1fJHUqsmFYzIU6JjFIACUR0L/qWqYf
         QWjJoFZ1w3h2yYmeV1tIox3IDut1xN+cg/IXQe52nxNSTpOr+xD4QYtWnx/FLyR1VAXR
         rem/8MOnO43iaZYhdcuiBxKJUw032WghVP873MtUSmE9hO3B0KiL/P9cM2Ba5qPwU09M
         oE5fNT0H611sRHapKoe4HwmyOoyiA16sWXuuZpPWc6yifeB9HJ29xdLMZfSMvWQpL7xp
         8JUgOkSBIEK37FyGMrqxze2Ppji8PP7GS+5oKnlcLQuK56VNf7ZI97TcXVVC8cT9VjKg
         9aIw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ78mX1KUAEKQV6dCSzL+PuU/+RdcN58IzCsCSe24r1j38GVglJI9xrjL1IqkWnHbq9TLtEGXpzWClbg==@vger.kernel.org
X-Gm-Message-State: AFuF++nfQs468ZLY/kGAdERJEbm/DVu4CiDmXD8ZmgnhWAijHOrroPDS
	nzkuMCX307hOCIPZYVZaZXQVsm52asW++SGx8bMgE7lxvEVC3WFS9GeGkuvur15qzd5+7ceVyMF
	R53ORMoeMt0cMog1RGjBbw3Fc+arx+s2ojHQ1PVBe4IDeW786PYITzXtqh2w=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1809:b0:4b1:ba28:5df5 with SMTP id
 5614622812f47-4b350713058mr687552b6e.18.1787592269462; Mon, 24 Aug 2026
 10:24:29 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:24:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8c7e4d.4d75e56a.c9a88.0052.GAE@google.com>
Subject: [syzbot] [sound?] possible deadlock in rawmidi_release_priv
From: syzbot <syzbot+7d1edf0ff6a05961020c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1798a179580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=7d1edf0ff6a05961020c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1058a179580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7d1edf0ff6a05961020c@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.0.43/5949 is trying to acquire lock:
ffff88802e25c160 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
ffff88802e25c160 (&rmidi->open_mutex){+.+.}-{4:4}, at: rawmidi_release_priv+0x45/0x280 sound/core/rawmidi.c:574

but task is already holding lock:
ffff8880541aa160 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
ffff8880541aa160 (&rmidi->open_mutex){+.+.}-{4:4}, at: rawmidi_release_priv+0x45/0x280 sound/core/rawmidi.c:574

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&rmidi->open_mutex);
  lock(&rmidi->open_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.0.43/5949: 2, last CPU#1:
 #0: ffff8880541aa160 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #0: ffff8880541aa160 (&rmidi->open_mutex){+.+.}-{4:4}, at: rawmidi_release_priv+0x45/0x280 sound/core/rawmidi.c:574
 #1: ffff88802e25c460 (&ump->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #1: ffff88802e25c460 (&ump->open_mutex){+.+.}-{4:4}, at: snd_ump_legacy_close+0x117/0x300 sound/core/ump.c:1182

stack backtrace:
CPU: 1 UID: 0 PID: 5949 Comm: syz.0.43 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_deadlock_bug.cold+0xbd/0xca kernel/locking/lockdep.c:3057
 check_deadlock kernel/locking/lockdep.c:3109 [inline]
 validate_chain kernel/locking/lockdep.c:3911 [inline]
 __lock_acquire+0x1343/0x1ec0 kernel/locking/lockdep.c:5253
 lock_acquire kernel/locking/lockdep.c:5886 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
 class_mutex_constructor include/linux/mutex.h:253 [inline]
 rawmidi_release_priv+0x45/0x280 sound/core/rawmidi.c:574
 snd_rawmidi_kernel_release+0x3a/0xd0 sound/core/rawmidi.c:596
 snd_ump_legacy_close+0x234/0x300 sound/core/ump.c:1187
 close_substream.part.0+0x16b/0x860 sound/core/rawmidi.c:560
 close_substream include/linux/mutex.h:253 [inline]
 rawmidi_release_priv+0x210/0x280 sound/core/rawmidi.c:580
 snd_rawmidi_release+0x5a/0xf0 sound/core/rawmidi.c:610
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1d8/0x700 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 do_syscall_64+0x661/0x790 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0821b9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffd162af08 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007fffd162aff0 RCX: 00007f0821b9e0d9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 000000000000dfa7 R08: 0000000000000001 R09: 0000000000000000
R10: 0000001b31d20000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0821e25fac R14: 00007f0821e25fa8 R15: 00007f0821e25fa0
 </TASK>


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
