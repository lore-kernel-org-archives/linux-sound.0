Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE12F37
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 02:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724724754; cv=none; b=SiU6A3mZONpnknFc7PLxwey9NmKCn3py/ZlJCR6TaNhlKpvicfUrs1+AdSjzjq22HTcCq3+eM/nPQ50D5zzNrEA7v5ZRCStWsvnmWc5Agdf+K2myNX8Q8hYvnKIo6H6v8QWcrKaxcEkBbHUvIBmKLkWx4ox3po2iBC8yIsdKNss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724724754; c=relaxed/simple;
	bh=PBJlMclewKlsCt+IGH4PPg3fGtUcOp+uJR/vZ1jx69I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YTaLY1gRsQHv6XKLsqrUrNfwHDjS+MKu93P/q9Ut7hgKNesicK27MRd1fBptAeMylSs5NMveIZ3OCw0MECfUqNgF1sdFrADJc0SFyKHFyoS3Oy3+KJ2yztABDJb2e5QEP0569LqQb1hdCqwFGqSvJECTsHuRq/eBlv2DPES6qO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39d4ba9c42aso63886265ab.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 19:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724724751; x=1725329551;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9h+fqkMkBoiRVkgbbFxpZ3SzgfLCLTAdbi9tiyS+Zs=;
        b=VyHf7ypPMkW7x4jYAfYfAVV3y8hF2R883wskE3vvfebNiKtQFn1/j809c9kG9emsMX
         xWtG5WRoT1hvtcai+h1e7ZzaqovCkGuPiPgPUaji1vEz+ya2J3TnZKHg6PSJaXHwueFc
         loomf7HtMwGJDlZ9zLJqFpTKJ276OxM9voeF5pKbgounj2MvbG93R1xaQN0qiqWrYddb
         SpAhw2+tuTdxDQc877L/KiwKKlEVq21O5faHskNpZII0JbjoeBv+cblMjuAlxE8RRZRH
         DiuBcN4KZP1JwbHvePHUB4GO+kOi6suA9Z56X7TN5+V79qYqMiWrzeoLZBq2SVs3Tzki
         iGYw==
X-Forwarded-Encrypted: i=1; AJvYcCX47HPFsBdqABeTsQ+ZqiDSavuOewtn5rYniyy5YNB8+JHL6fKTPrmEVqzZAdNn59N5OLEuPrqQ0bQepA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0wU74Tsxl/9wMwT949qi1mzy8tVCoOKSMBYYNIq8DNtQw8hEH
	150S/pFi6IJ3+MeuXDUKzVrOA/W1/sxR1b4fjSVLL2S8Dc1S7b3Msk/yn2mV1VHihEkwg1h2XGx
	dXF2UEQb8pkTyspN5nO73BpTdnF5evUg4aUMZHXBRP5mL/wDvzhsXHZQ=
X-Google-Smtp-Source: AGHT+IHjy344hgBY1WzvoMnnho/QcOMBnSH/Y+IgJHyt8vGmPIdid+1D0GSkNrEltpSWSRyz+PXqN/p0qHwhc5EfVr7Mo9h67yhZ
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3594:b0:4c2:8e08:f588 with SMTP id
 8926c6da1cb9f-4ceb51a1a3cmr81984173.2.1724724751525; Mon, 26 Aug 2024
 19:12:31 -0700 (PDT)
Date: Mon, 26 Aug 2024 19:12:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002680930620a0c6b9@google.com>
Subject: [syzbot] [sound?] WARNING in snd_pcm_open
From: syzbot <syzbot+d2b696e5cb7a92fee831@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6a7917c89f21 Add linux-next specific files for 20240822
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11a72e09980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=897bd7c53a10fcfc
dashboard link: https://syzkaller.appspot.com/bug?extid=d2b696e5cb7a92fee831
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/47820545bc51/disk-6a7917c8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e300f3a38860/vmlinux-6a7917c8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9146afef58aa/bzImage-6a7917c8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d2b696e5cb7a92fee831@syzkaller.appspotmail.com

------------[ cut here ]------------
do not call blocking ops when !TASK_RUNNING; state=1 set at [<ffffffff89468b6f>] snd_pcm_open+0x2ff/0x7a0 sound/core/pcm_native.c:2860
WARNING: CPU: 1 PID: 5346 at kernel/sched/core.c:8556 __might_sleep+0xb9/0xe0 kernel/sched/core.c:8552
Modules linked in:
CPU: 1 UID: 0 PID: 5346 Comm: syz.4.9 Not tainted 6.11.0-rc4-next-20240822-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
RIP: 0010:__might_sleep+0xb9/0xe0 kernel/sched/core.c:8552
Code: a1 0e 01 90 42 80 3c 23 00 74 08 48 89 ef e8 ce e6 97 00 48 8b 4d 00 48 c7 c7 c0 60 0a 8c 44 89 ee 48 89 ca e8 f8 02 f1 ff 90 <0f> 0b 90 90 eb b5 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 70 ff ff ff
RSP: 0018:ffffc90004457408 EFLAGS: 00010246
RAX: 0dea8fe797fdb300 RBX: 1ffff11002cf16ac RCX: 0000000000040000
RDX: ffffc90009dd9000 RSI: 00000000000085c7 RDI: 00000000000085c8
RBP: ffff88801678b560 R08: ffffffff8155a632 R09: fffffbfff1cfa364
R10: dffffc0000000000 R11: fffffbfff1cfa364 R12: dffffc0000000000
R13: 0000000000000001 R14: 0000000000000249 R15: ffffffff8c0ab880
FS:  00007fa51e6226c0(0000) GS:ffff8880b9100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32715ff8 CR3: 00000000771dc000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __mutex_lock_common kernel/locking/mutex.c:585 [inline]
 __mutex_lock+0xc1/0xd70 kernel/locking/mutex.c:752
 snd_pcm_open+0x34b/0x7a0 sound/core/pcm_native.c:2863
 snd_pcm_playback_open+0x6e/0xe0 sound/core/pcm_native.c:2810
 chrdev_open+0x523/0x600 fs/char_dev.c:414
 do_dentry_open+0x928/0x13f0 fs/open.c:959
 vfs_open+0x3e/0x330 fs/open.c:1089
 do_open fs/namei.c:3774 [inline]
 path_openat+0x2c87/0x3590 fs/namei.c:3933
 do_filp_open+0x235/0x490 fs/namei.c:3960
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1416
 do_sys_open fs/open.c:1431 [inline]
 __do_sys_openat fs/open.c:1447 [inline]
 __se_sys_openat fs/open.c:1442 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1442
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa51d778810
Code: 48 89 44 24 20 75 93 44 89 54 24 0c e8 19 8f 02 00 44 8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 6c 8f 02 00 8b 44
RSP: 002b:00007fa51e621b70 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fa51d778810
RDX: 0000000000000000 RSI: 00007fa51e621c10 RDI: 00000000ffffff9c
RBP: 00007fa51e621c10 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fa51d915f80 R15: 00007ffc16ca31f8
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
