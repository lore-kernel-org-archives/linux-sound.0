Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF56299927
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376768; cv=none; b=KAebc5iVk06EjQDYxGFjHdnns4dJ7ZDM/eYRJlgfNHk/pNLMjFx6vED7l2kLJtVbKZo4WmRhQWFH4gavVGLQITe9hX+QOO2A+Ve2tVetImYFUJKRWJXhC7IUENNHJ03em0+M2e9TtyajW/wGI9p2bJu5tG1IOBMHbK74ikZVQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376768; c=relaxed/simple;
	bh=I3wFUoQXOKceQfTuokGJdaqo6XZR30zAAggw8oiZkcY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=p/uL7IvcEEWn9HgjnSoZYQ33VNMlw9dVZ5PEBRmGIWex9RP5NCfbaMBn0dQehLP8jih+7hfDYa64ZSFt5A8zJtmZm6FX6IRqVEsLz9JoRdt1vRxcvZL1MaZ+ku5kdCm5ThAisvHvSdRMWV2Jd1FqDgRslk9z+9Od+AG0Mk/aGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-49d4cb3ca23so1903648b6e.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 18:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785376765; x=1785981565;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7u3xdayCRJynv9VqPZio6IuoyTlELBUlNGEE5CXoAmk=;
        b=GGbNYKx9iwpq7BAQ5vnTZ8lGmYGFuI7ivvC9EkPVF+aS/ROEMhVDcOmbBdRXRGlEcy
         cMDyWhOStHB3JzSQONMnrTj0W59XQY6HJ0LHc1uwut9PbFenukcjmXgFbfF6eJmGx2wY
         CJjOTVLF/jn941G+nf5nupELT4S58cj1LF0JfaAnKkwlg/gA6LxvqHeSlbXOYTGwPJzN
         CNgByTflLsm/k70owujiDwkJGWWNebgbdfOh6iPA73BeVIbnbkDQa1GOG0mVtHp1mmQ6
         gi3KZiwGRjVB3tmD5dB7BBPHUH3fKyG5B/zBKkcnBa4ZEtQoUxUbcDjubmgUE6hlF9aC
         9NEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Fce49Q3dhbzbiFcsnKWA9dZVJiYRfUYyHI8vBjNYOEGUOjnRuttPf/kje8jJJFb2swhQLFPkDG2sAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDkwy6GxkylHBgnwR9Fs0+3y6+Gv1YMtIRPwEv33HtvRgypU+J
	183zlXsdvRpxAC+kC3uhc7Tj5jYyTK739qeFL7dykIehAFWuK8KMtCPNWVAvP8Z4TPetnbPCOpw
	xLeT3bgBhUtVLMdwg5307IfhYpRovKHJ+7gFqDt9Iy6+r23YRJz+CHRsx3eg=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23d4:b0:495:f519:70f0 with SMTP id
 5614622812f47-4ad877f8f8bmr546381b6e.19.1785376765496; Wed, 29 Jul 2026
 18:59:25 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:59:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6aaffd.86abc875.e5c3d.005b.GAE@google.com>
Subject: [syzbot] [sound?] possible deadlock in snd_seq_deliver_event (2)
From: syzbot <syzbot+d4d7ac4a87bb2d52a822@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc02acf6ac0c Merge tag 'platform-drivers-x86-v7.2-4' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17a0b8c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=d4d7ac4a87bb2d52a822
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/67251350dd03/disk-fc02acf6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e4edd57a8c61/vmlinux-fc02acf6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/04ff166cc853/bzImage-fc02acf6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d4d7ac4a87bb2d52a822@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
kworker/1:3/5615 is trying to acquire lock:
ffff888032c85128 (&grp->list_lock){.+.+}-{3:3}, at: __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
ffff888032c85128 (&grp->list_lock){.+.+}-{3:3}, at: deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
ffff888032c85128 (&grp->list_lock){.+.+}-{3:3}, at: snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813

but task is already holding lock:
ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&grp->list_lock);
  lock(&grp->list_lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

3 locks held by kworker/1:3/5615:
 #0: ffff88801bc0f140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x12b1/0x1940 kernel/workqueue.c:3297
 #1: ffffc900039c7d08 ((work_completion)(&runtime->event_work)){+.+.}-{0:0}, at: process_one_work+0x988/0x1940 kernel/workqueue.c:3298
 #2: ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
 #2: ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
 #2: ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813

stack backtrace:
CPU: 1 UID: 0 PID: 5615 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events snd_rawmidi_input_event_work
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
 __raw_read_lock include/linux/rwlock_api_smp.h:163 [inline]
 _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:232
 __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
 deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
 snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813
 snd_seq_kernel_client_dispatch+0x16f/0x1b0 sound/core/seq/seq_clientmgr.c:2439
 queue_broadcast_event.isra.0+0x143/0x1b0 sound/core/seq/seq_queue.c:585
 snd_seq_queue_process_event sound/core/seq/seq_queue.c:634 [inline]
 snd_seq_control_queue+0x709/0xb70 sound/core/seq/seq_queue.c:659
 __snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:626 [inline]
 __snd_seq_deliver_single_event+0x127/0x1c0 sound/core/seq/seq_clientmgr.c:613
 _snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:672 [inline]
 snd_seq_deliver_single_event+0x31f/0x8c0 sound/core/seq/seq_clientmgr.c:687
 snd_seq_deliver_event+0x44b/0x860 sound/core/seq/seq_clientmgr.c:815
 snd_seq_kernel_client_dispatch+0x16f/0x1b0 sound/core/seq/seq_clientmgr.c:2439
 send_timer_event.isra.0+0x130/0x190 sound/core/seq/oss/seq_oss_timer.c:140
 snd_seq_oss_timer_start+0x1db/0x320 sound/core/seq/oss/seq_oss_timer.c:161
 send_midi_event sound/core/seq/oss/seq_oss_midi.c:576 [inline]
 snd_seq_oss_midi_input+0x467/0xa30 sound/core/seq/oss/seq_oss_midi.c:501
 snd_seq_oss_event_input+0x194/0x250 sound/core/seq/oss/seq_oss_event.c:429
 __snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:626 [inline]
 __snd_seq_deliver_single_event+0x127/0x1c0 sound/core/seq/seq_clientmgr.c:613
 _snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:672 [inline]
 snd_seq_deliver_single_event+0x31f/0x8c0 sound/core/seq/seq_clientmgr.c:687
 __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:735 [inline]
 deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
 snd_seq_deliver_event+0x2c1/0x860 sound/core/seq/seq_clientmgr.c:813
 snd_seq_kernel_client_dispatch+0x16f/0x1b0 sound/core/seq/seq_clientmgr.c:2439
 snd_midi_input_event+0x32f/0x470 sound/core/seq/seq_midi.c:93
 snd_rawmidi_input_event_work+0x61/0x80 sound/core/rawmidi.c:127
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
