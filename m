Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313F266B72
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235239; cv=none; b=GX13E71v53ME8s6iMbQLFEahprqwI0okz/3JR6VdrAf25zGPiGx9C4WF767Sc/D2ODrKj993yzQ1dKlosOYAlAsxhC3yDT8cLBA4gi0Z/4WC/oND26KHw+4babZMsvBcCjtotRmSGddsMVRDtTJYXSaFoo6Asc7rRnlpj2QoLa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235239; c=relaxed/simple;
	bh=gcaVTQxdZHlSh/lmmtsSJEEjgO3BOUxYv6RlUqpUiTk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iLo1W/pMAKZ6wd7ggJQarB8qhHlMTw97Y2NLoYLoiWPWwep7dwkUfgyPGeeRK64++29TpiEzvsS+8+BWbLKxOji4aShPGv2JlYmrSzxSg3nmmO0w5R08W61d7PlCyDqtPJ6XYuh0CB03g9eA7bISpzVSHbYZXZ4rS+GcLCGkpFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-66b612efb4aso10589522eaf.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 23:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776235236; x=1776840036;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6Yv04sBT998Lc5iojnf91qzNx9zFwzDljdNrX+MLm4=;
        b=VojsS4pnHIP99Z9SS9NZKu5ez9dayKTVIs0acDwjDdNM5GZqlYIc+I71cl+zWo/GCm
         5ssriV0EudYuKOEoZ4ItsCN3DBczM/LNPmjrRRoBcSOAAAxRVzx/pPt16V9Y4Caj6I1T
         yjRXwO3AGPbmHcdon07NsISwS5BYaPVrvNhDYBUcrzy7Ht/XFaqy+h2bE0Qq9XdbgMK4
         RLA+ysCNkyMJ7DyOZU/OhKDH6ScNU9sA0X2iZDkOjSNsHvfxR+FXrZfsPe1MO9nSe6Ot
         WPdMbP2aW0Blg2Dm7zWreFLxrSoHpUulDYnF3UZEnhw9P9JtsAYG7MzCzTrLwYpyJ3t/
         rv2g==
X-Forwarded-Encrypted: i=1; AFNElJ/LR4K1xUjLcvOOcZyCdRvdrXkz9H3YiLFZa29YPYH6NzGZnsXmegkJ1T+ihmAsIZ5tTUAN7jvXXfN+Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4TmKNxB+UIFkWp25g8aUyGSpsVSwIYb/XYzTbW6XPuo+JcFc
	/G/ZpLQ93icpvp6zsARL2zsPoy/TcJxZvjRYzabj8c4JZcCabj4zRBWj2/HC0r1QuuEmupPIVE0
	KEUQ5pFJ6jJSlNvlrTVhVjnoLQ8cRgWYJYL2Ldt9gsFSytyhXrQZvRr0I2wM=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:de14:0:b0:689:232a:a9ba with SMTP id
 006d021491bc7-68a6ae80e37mr9522817eaf.35.1776235236116; Tue, 14 Apr 2026
 23:40:36 -0700 (PDT)
Date: Tue, 14 Apr 2026 23:40:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69df32e4.a00a0220.468cb.0072.GAE@google.com>
Subject: [syzbot] [sound?] INFO: task hung in usb_audio_probe (5)
From: syzbot <syzbot+d56178c27a4710960820@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e774d5f1bc27 Merge tag 'riscv-for-linus-v7.0-rc8' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f9c0ce580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a3e5e8c17cc174e
dashboard link: https://syzkaller.appspot.com/bug?extid=d56178c27a4710960820
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b45f9fc18e21/disk-e774d5f1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a2845b2d7513/vmlinux-e774d5f1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bbe4dafde49f/bzImage-e774d5f1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d56178c27a4710960820@syzkaller.appspotmail.com

INFO: task kworker/1:0:16674 blocked for more than 155 seconds.
      Tainted: G             L      syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:0     state:D stack:23592 pid:16674 tgid:16674 ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0xfee/0x6120 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0xdd/0x390 kernel/sched/core.c:7008
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7065
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc9a/0x1b90 kernel/locking/mutex.c:776
 class_mutex_constructor include/linux/mutex.h:253 [inline]
 usb_audio_probe+0x38f/0x3a90 sound/usb/card.c:950
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:643 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:721
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:863
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:893
 __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1021
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1093
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x64/0x160 drivers/base/bus.c:613
 device_add+0x11d9/0x1950 drivers/base/core.c:3690
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2266
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:643 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:721
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:863
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:893
 __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1021
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1093
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x64/0x160 drivers/base/bus.c:613
 device_add+0x11d9/0x1950 drivers/base/core.c:3690
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x19a0 kernel/workqueue.c:3276
 process_scheduled_works kernel/workqueue.c:3359 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3440
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz.0.3730:20915 blocked for more than 155 seconds.
      Tainted: G             L      syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.3730      state:D stack:25144 pid:20915 tgid:20914 ppid:17507  task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0xfee/0x6120 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0xdd/0x390 kernel/sched/core.c:7008
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7065
 __mutex_lock_common kernel/locking/mutex.c:692 [inline]
 __mutex_lock+0xc9a/0x1b90 kernel/locking/mutex.c:776
 device_lock include/linux/device.h:949 [inline]
 usbdev_open+0x1b6/0x870 drivers/usb/core/devio.c:1054
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6d8/0x1660 fs/open.c:949
 vfs_open+0x82/0x3f0 fs/open.c:1081
 do_open fs/namei.c:4677 [inline]
 path_openat+0x208c/0x31a0 fs/namei.c:4836
 do_file_open+0x20e/0x430 fs/namei.c:4865
 do_sys_openat2+0x10d/0x1e0 fs/open.c:1366
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_openat fs/open.c:1388 [inline]
 __se_sys_openat fs/open.c:1383 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1383
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x106/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7e9b95d04e
RSP: 002b:00007f7e99bf5b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f7e99bf66c0 RCX: 00007f7e9b95d04e
RDX: 0000000000000082 RSI: 00007f7e99bf5c00 RDI: ffffffffffffff9c
RBP: 00007f7e99bf5c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007f7e9bc16038 R14: 00007f7e9bc15fa0 R15: 00007fffd3225b88
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8e7e7920 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #0: ffffffff8e7e7920 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #0: ffffffff8e7e7920 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
5 locks held by kworker/0:2/946:
1 lock held by klogd/5168:
1 lock held by udevd/5179:
2 locks held by getty/5566:
 #0: ffff8880393080a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1500 drivers/tty/n_tty.c:2211
6 locks held by kworker/1:6/7844:
 #0: ffff888022af2548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x1310/0x19a0 kernel/workqueue.c:3251
 #1: 
ffffc900031e7d08
 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x988/0x19a0 kernel/workqueue.c:3252
 #2: ffff88802afac1e0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #2: ffff88802afac1e0 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888020bbf1e0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #3: ffff888020bbf1e0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1068
 #4: ffff888076d9f1a8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #4: ffff888076d9f1a8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1068
 #5: ffffffff905108a8 (register_mutex#6){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #5: ffffffff905108a8 (register_mutex#6){+.+.}-{4:4}, at: usb_audio_probe+0x38f/0x3a90 sound/usb/card.c:950
6 locks held by kworker/0:1/15301:
6 locks held by kworker/1:0/16674:
 #0: ffff888022af2548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x1310/0x19a0 kernel/workqueue.c:3251
 #1: ffffc900058bfd08 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x988/0x19a0 kernel/workqueue.c:3252
 #2: ffff88802aec31e0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #2: ffff88802aec31e0 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff8880560af1e0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #3: ffff8880560af1e0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1068
 #4: ffff88807a2561a8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #4: ffff88807a2561a8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1068
 #5: ffffffff905108a8 (register_mutex#6){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #5: ffffffff905108a8 (register_mutex#6){+.+.}-{4:4}, at: usb_audio_probe+0x38f/0x3a90 sound/usb/card.c:950
4 locks held by udevd/19902:
 #0: ffff88803fbbfc30 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xe1/0x1270 fs/seq_file.c:183
 #1: ffff888038d35488 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:172
 #2: ffff88802a047b48 (kn->active#17){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff88802a047b48 (kn->active#17){++++}-{0:0}, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:173
 #3: ffff888020bbf1e0 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:954 [inline]
 #3: ffff888020bbf1e0 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
4 locks held by udevd/19903:
 #0: ffff8880576b38b8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xe1/0x1270 fs/seq_file.c:183
 #1: ffff888048f8b888 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:172
 #2: ffff8880571d4968 (kn->active#17){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff8880571d4968 (kn->active#17){++++}-{0:0}, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:173
 #3: ffff88808d0311e0 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:954 [inline]
 #3: ffff88808d0311e0 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
1 lock held by udevd/19909:
4 locks held by udevd/19913:
 #0: ffff88804802ec30 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xe1/0x1270 fs/seq_file.c:183
 #1: ffff8880786f2488 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:172
 #2: ffff88802cd57d28 (kn->active#17){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff88802cd57d28 (kn->active#17){++++}-{0:0}, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:173
 #3: ffff8880568551e0 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:954 [inline]
 #3: ffff8880568551e0 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
4 locks held by udevd/20043:
 #0: ffff8880846a4e80 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xe1/0x1270 fs/seq_file.c:183
 #1: ffff88807d180888 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x4f/0x2a0 fs/kernfs/file.c:172
 #2: ffff8880237c8788 (kn->active#17){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff8880237c8788 (kn->active#17){++++}-{0:0}, at: kernfs_seq_start+0xbc/0x2a0 fs/kernfs/file.c:173
 #3: ffff8880560af1e0 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:954 [inline]
 #3: ffff8880560af1e0 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
2 locks held by udevd/20907:
1 lock held by syz.0.3730/20915:
 #0: ffff88802af5b1e0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:949 [inline]
 #0: ffff88802af5b1e0 (&dev->mutex){....}-{4:4}, at: usbdev_open+0x1b6/0x870 drivers/usb/core/devio.c:1054
3 locks held by udevd/21448:
3 locks held by syz-executor/21655:
1 lock held by sed/22098:
4 locks held by syz.0.3949/22103:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x1d7/0x230 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:161 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x141/0x190 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
 watchdog+0xd25/0x1050 kernel/hung_task.c:515
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 15301 Comm: kworker/0:1 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:check_preemption_disabled+0x24/0xe0 lib/smp_processor_id.c:54
Code: 90 90 90 90 90 90 41 54 55 53 48 83 ec 08 65 8b 1d 35 1c 7d 08 65 f7 05 26 1c 7d 08 ff ff ff 7f 74 0f 48 83 c4 08 89 d8 5b 5d <41> 5c e9 c5 17 03 00 9c 58 f6 c4 02 74 ea 65 4c 8b 25 ee 1b 7d 08
RSP: 0018:ffffc90000007bb0 EFLAGS: 00000096
RAX: 0000000000000000 RBX: ffff8880b843b220 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8de55096 RDI: ffffffff8c1b1ea0
RBP: ffff88803196a4c0 R08: 0000000000000000 R09: fffffbfff21b3b42
R10: ffffffff90d9da17 R11: 0000000000000001 R12: 00000000ffffffff
R13: 0000000000000046 R14: ffff88803196b130 R15: 0000000000000007
FS:  0000000000000000(0000) GS:ffff888124338000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055814b148bd0 CR3: 000000007fb77000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000c DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 lockdep_recursion_finish kernel/locking/lockdep.c:470 [inline]
 lock_is_held_type+0xca/0x140 kernel/locking/lockdep.c:5941
 lock_is_held include/linux/lockdep.h:249 [inline]
 lockdep_assert_rq_held kernel/sched/sched.h:1603 [inline]
 rq_clock_pelt kernel/sched/pelt.h:71 [inline]
 cfs_rq_clock_pelt kernel/sched/pelt.h:179 [inline]
 update_load_avg+0xf7/0x1ba0 kernel/sched/fair.c:4757
 enqueue_entity kernel/sched/fair.c:5301 [inline]
 enqueue_task_fair+0x2e3/0x2be0 kernel/sched/fair.c:6996
 enqueue_task+0x74/0x4f0 kernel/sched/core.c:2107
 activate_task kernel/sched/core.c:2147 [inline]
 ttwu_do_activate+0x176/0x7c0 kernel/sched/core.c:3667
 ttwu_queue kernel/sched/core.c:3918 [inline]
 try_to_wake_up+0xc48/0x1a80 kernel/sched/core.c:4242
 hrtimer_wakeup+0x47/0x60 kernel/time/hrtimer.c:2021
 __run_hrtimer kernel/time/hrtimer.c:1785 [inline]
 __hrtimer_run_queues+0x50e/0xa70 kernel/time/hrtimer.c:1849
 hrtimer_interrupt+0x397/0x8c0 kernel/time/hrtimer.c:1911
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1045 [inline]
 __sysvec_apic_timer_interrupt+0x109/0x490 arch/x86/kernel/apic/apic.c:1062
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x9e/0xc0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:console_trylock_spinning kernel/printk/printk.c:2039 [inline]
RIP: 0010:vprintk_emit+0x553/0x6b0 kernel/printk/printk.c:2478
Code: 00 4d 85 ed 0f 85 1b 01 00 00 e8 c8 2d 21 00 9c 5d 81 e5 00 02 00 00 31 ff 48 89 ee e8 96 28 21 00 48 85 ed 0f 85 27 01 00 00 <e8> a8 2d 21 00 45 31 c9 41 b8 01 00 00 00 31 c9 48 8d 05 00 00 00
RSP: 0018:ffffc9000453e688 EFLAGS: 00000246
RAX: 0000000000100000 RBX: 000000000000001b RCX: ffffc9001ad73000
RDX: 0000000000100000 RSI: ffffffff81e7cb14 RDI: ffff88803196a4c0
RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff920008a7cd3
R13: 0000000000000200 R14: ffff88801eeb4980 R15: ffffc9000453e848
 dev_vprintk_emit+0x394/0x3e0 drivers/base/core.c:4914
 dev_printk_emit+0xd2/0x10d drivers/base/core.c:4925
 __dev_printk+0xcb/0x100 drivers/base/core.c:4937
 _dev_err+0xef/0x127 drivers/base/core.c:4980
 parse_uac2_sample_rate_range.cold+0x100/0x135 sound/usb/format.c:468
 parse_audio_format_rates_v2v3+0x2fe/0xf70 sound/usb/format.c:689
 parse_audio_format_ii sound/usb/format.c:847 [inline]
 snd_usb_parse_audio_format.cold+0x48c/0x4cc sound/usb/format.c:868
 snd_usb_get_audioformat_uac12 sound/usb/stream.c:856 [inline]
 __snd_usb_parse_audio_interface+0xa85/0x4710 sound/usb/stream.c:1201
 snd_usb_parse_audio_interface+0x81/0x110 sound/usb/stream.c:1282
 create_standard_audio_quirk+0x6b/0x120 sound/usb/quirks.c:101
 snd_usb_create_quirk sound/usb/quirks.c:541 [inline]
 create_composite_quirk+0x257/0x510 sound/usb/quirks.c:49
 snd_usb_create_quirk+0xad/0xf0 sound/usb/quirks.c:541
 usb_audio_probe+0x992/0x3a90 sound/usb/card.c:1023
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:643 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:721
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:863
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:893
 __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1021
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1093
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x64/0x160 drivers/base/bus.c:613
 device_add+0x11d9/0x1950 drivers/base/core.c:3690
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2266
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:643 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:721
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:863
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:893
 __device_attach_driver+0x1df/0x340 drivers/base/dd.c:1021
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1093
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x64/0x160 drivers/base/bus.c:613
 device_add+0x11d9/0x1950 drivers/base/core.c:3690
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x19a0 kernel/workqueue.c:3276
 process_scheduled_works kernel/workqueue.c:3359 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3440
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
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
