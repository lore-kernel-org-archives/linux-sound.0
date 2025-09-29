Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46822DA1C
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759174417; cv=none; b=Pg+sDoHbq4bwdA4o3Rx0Hh12eAp6l6gxv+Wa31pmA4fkDUzUOCnvYOI4PigoIC1E6cwPTcWKnlzkHBphyx87CGprDCZUl8+qXovEJknLRL52caiW3iOWnBX6hS4x+RqE9RXoKq/7flAgsgcO3THIo86oYwGu7K7sxxRQY2PDcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759174417; c=relaxed/simple;
	bh=wGiKZAnsb3YEe58NquH0Orcolz5vSAfFGCS6LCnK2rQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kekCsbP7QbnRq+Ort8kTB0N/SaNnj2dlyllS8fIPBt5zA/UdHGhdRWBXLJZPH1kyuW0r5QXjkfCgCaCQIF/GbZ0FTkgS0K5944Gb2HI0hXwtXMZTTgEA77TRI4iG4ruuT9yDEGu/8ycf6KoerjQMLNfCfxvYcWMIgUl8m5gkz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-9228ed70eb7so413011439f.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 12:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759174415; x=1759779215;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJdp0RWEbrFOqFl4UL/kp4fgCgB78oIk7e2Gy0Zc5Cc=;
        b=E91ON3ZFOLeSI1fPc7Nyr/Uf9fZKvNFJlSq3Wq87uW31dQL9db01ec4qxoKk5W5l4p
         nfDYAv83GmyBrX26/fptEpKtPJ3AtSeXKM70y0n3Ic4QOH3CAmdvGLHJJiT5J6VNPBpQ
         vA7Yo+CL7gkgy/+kBxk35DhlEazL3GQxJQvkQAyRhFxOn+nMhEmFAC7mk7jx9h/Pic9E
         ArarWWAPxWT6O3RNhlY1s4eTMaKCw17EqCw0jjtl2dE418t12TC0T8kuUVJH6AuAIC0U
         ZkKrklo9YVkgVj21lID6ie0dv5deI3Muh7kT5QgAzSlX3ud3FiJwGpqTaNqkv3NqL0vq
         kmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvLDZE1Oc+5uPZXZOboqF85I+PNrNmCwi+07ShRr026XJnak7+lr1LcyOdhAU/sD8J3WnVurxCX9teoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0sLbCVSopQyYUhBRmqAbNGosmq2P6ZP3Nt5HmpXCNJSj4GR2a
	4YSonsOf4JJchpBg7vfmiJQYu84iR+GCcK9wrFok+YPVonAmErgwBqHhoRv7BmsmcxrGMfgLnfi
	yIaXUhLt5m5PzK9virPhBLN2uaUs1HmiE6zmYuvnSBiAiV+PE8PjC+79OL/c=
X-Google-Smtp-Source: AGHT+IHkAbZf7WITD2E4VyuVxniXKv3h2j6y3GF0NKq8CmmnMitgMcU9CaXHvRONy9lDWFIRCCrAhT2pcd6CnlTGrU7KNNex8D04
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1686:b0:427:511c:f86f with SMTP id
 e9e14a558f8ab-42bfab93823mr61562015ab.17.1759174414704; Mon, 29 Sep 2025
 12:33:34 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:33:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68dadf0e.050a0220.1696c6.001c.GAE@google.com>
Subject: [syzbot] [sound?] possible deadlock in snd_pcm_drop
From: syzbot <syzbot+c9ab1eb0f8f5ab1f18be@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4ff71af020ae Merge tag 'net-6.17-rc8' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1191c2e2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5b21423ca3f0a96
dashboard link: https://syzkaller.appspot.com/bug?extid=c9ab1eb0f8f5ab1f18be
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1644dd34580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=156d6f12580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3fb4198b5763/disk-4ff71af0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1499875eb2cc/vmlinux-4ff71af0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/182864fb8af7/bzImage-4ff71af0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9ab1eb0f8f5ab1f18be@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.2.2869/8991 is trying to acquire lock:
ffff8880b8823d90 ((softirq_ctrl.lock)){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
ffff8880b8823d90 ((softirq_ctrl.lock)){+.+.}-{3:3}, at: __local_bh_disable_ip+0x264/0x400 kernel/softirq.c:168

but task is already holding lock:
ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: spin_lock_irq include/linux/spinlock_rt.h:93 [inline]
ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: snd_pcm_group_lock_irq sound/core/pcm_native.c:98 [inline]
ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: snd_pcm_stream_lock_irq sound/core/pcm_native.c:137 [inline]
ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: class_pcm_stream_lock_irq_constructor include/sound/pcm.h:679 [inline]
ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: snd_pcm_drop+0x10d/0x270 sound/core/pcm_native.c:2223

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&group->lock#2){+.+.}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       rt_spin_lock+0x88/0x2c0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       _snd_pcm_stream_lock_irqsave+0x7c/0xa0 sound/core/pcm_native.c:171
       class_pcm_stream_lock_irqsave_constructor include/sound/pcm.h:682 [inline]
       snd_pcm_period_elapsed+0x1e/0x80 sound/core/pcm_lib.c:1938
       dummy_hrtimer_callback+0x80/0x180 sound/drivers/dummy.c:386
       __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
       __hrtimer_run_queues+0x54f/0xd40 kernel/time/hrtimer.c:1825
       hrtimer_run_softirq+0x1a3/0x2e0 kernel/time/hrtimer.c:1842
       handle_softirqs+0x22f/0x710 kernel/softirq.c:579
       __do_softirq kernel/softirq.c:613 [inline]
       run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
       smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
       kthread+0x70e/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x436/0x7d0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (&base->softirq_expiry_lock){+...}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       rt_spin_lock+0x88/0x2c0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       hrtimer_cpu_base_lock_expiry kernel/time/hrtimer.c:1383 [inline]
       hrtimer_run_softirq+0x7c/0x2e0 kernel/time/hrtimer.c:1838
       handle_softirqs+0x22f/0x710 kernel/softirq.c:579
       __do_softirq kernel/softirq.c:613 [inline]
       run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
       smpboot_thread_fn+0x53f/0xa60 kernel/smpboot.c:160
       kthread+0x70e/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x436/0x7d0 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 ((softirq_ctrl.lock)){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
       reacquire_held_locks+0x127/0x1d0 kernel/locking/lockdep.c:5385
       __lock_release kernel/locking/lockdep.c:5574 [inline]
       lock_release+0x1b4/0x3e0 kernel/locking/lockdep.c:5889
       __local_bh_enable_ip+0x10c/0x270 kernel/softirq.c:228
       hrtimer_cancel+0x39/0x60 kernel/time/hrtimer.c:1491
       dummy_hrtimer_stop+0xcf/0x100 sound/drivers/dummy.c:410
       snd_pcm_do_stop+0x127/0x1c0 sound/core/pcm_native.c:1525
       snd_pcm_action_single sound/core/pcm_native.c:1305 [inline]
       snd_pcm_action+0xe4/0x240 sound/core/pcm_native.c:1388
       snd_pcm_stop sound/core/pcm_native.c:1561 [inline]
       snd_pcm_drop+0x160/0x270 sound/core/pcm_native.c:2228
       snd_pcm_oss_sync+0x1de/0xc30 sound/core/oss/pcm_oss.c:1733
       snd_pcm_oss_release+0x102/0x250 sound/core/oss/pcm_oss.c:2574
       __fput+0x45b/0xa80 fs/file_table.c:468
       task_work_run+0x1d4/0x260 kernel/task_work.c:227
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:43
       exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
       syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
       syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
       do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  (softirq_ctrl.lock) --> &base->softirq_expiry_lock --> &group->lock#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&group->lock#2);
                               lock(&base->softirq_expiry_lock);
                               lock(&group->lock#2);
  lock((softirq_ctrl.lock));

 *** DEADLOCK ***

2 locks held by syz.2.2869/8991:
 #0: ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: spin_lock_irq include/linux/spinlock_rt.h:93 [inline]
 #0: ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: snd_pcm_group_lock_irq sound/core/pcm_native.c:98 [inline]
 #0: ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: snd_pcm_stream_lock_irq sound/core/pcm_native.c:137 [inline]
 #0: ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: class_pcm_stream_lock_irq_constructor include/sound/pcm.h:679 [inline]
 #0: ffff8880302d0150 (&group->lock#2){+.+.}-{3:3}, at: snd_pcm_drop+0x10d/0x270 sound/core/pcm_native.c:2223
 #1: ffffffff8d9a8d80 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #1: ffffffff8d9a8d80 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #1: ffffffff8d9a8d80 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #1: ffffffff8d9a8d80 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1bb/0x2c0 kernel/locking/spinlock_rt.c:57

stack backtrace:
CPU: 0 UID: 0 PID: 8991 Comm: syz.2.2869 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2043
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 reacquire_held_locks+0x127/0x1d0 kernel/locking/lockdep.c:5385
 __lock_release kernel/locking/lockdep.c:5574 [inline]
 lock_release+0x1b4/0x3e0 kernel/locking/lockdep.c:5889
 __local_bh_enable_ip+0x10c/0x270 kernel/softirq.c:228
 hrtimer_cancel+0x39/0x60 kernel/time/hrtimer.c:1491
 dummy_hrtimer_stop+0xcf/0x100 sound/drivers/dummy.c:410
 snd_pcm_do_stop+0x127/0x1c0 sound/core/pcm_native.c:1525
 snd_pcm_action_single sound/core/pcm_native.c:1305 [inline]
 snd_pcm_action+0xe4/0x240 sound/core/pcm_native.c:1388
 snd_pcm_stop sound/core/pcm_native.c:1561 [inline]
 snd_pcm_drop+0x160/0x270 sound/core/pcm_native.c:2228
 snd_pcm_oss_sync+0x1de/0xc30 sound/core/oss/pcm_oss.c:1733
 snd_pcm_oss_release+0x102/0x250 sound/core/oss/pcm_oss.c:2574
 __fput+0x45b/0xa80 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc9f7ffeec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef674cdc8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000036070 RCX: 00007fc9f7ffeec9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000bf674d0bf
R10: 0000001b31c20000 R11: 0000000000000246 R12: 00007fc9f8255fac
R13: 00007fc9f8255fa0 R14: ffffffffffffffff R15: 0000000000000003
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
