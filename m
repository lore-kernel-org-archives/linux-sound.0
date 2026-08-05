Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7303E0093
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970000; cv=none; b=QEIQqgUUXVTLyH4XxlPr+FjCeEiITS08t1Uv2YR9p5mc4DonjX7GY1zZ85oB29C9s9GAq/+gibuBYr/9ohDyBEsXNRrTVkJ4DcE4F4xBN0ScymqPRIydQ/jLFFZ5r1AVWPQMfFp87fkICvG2SKGA65uZFAPCWDRXcomEaFS1naI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970000; c=relaxed/simple;
	bh=/yOF01hkIklfTFx9HG6q7rsT6aOBsUggDTygsh5TvXc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bLwsUGLMjnVeNWv8sDSpWJIde1T2kqY1Fpiw8YBfFUyn9CqFTaVu+fTCOSzc13H+Hd52XSaSg6TMlp2Sh8ZmHDxHT9QtmhDytyLCh+Z4TMGCtp8gJk19x6M1qOrGJX3fUz43hgTv//tg2qt2+KRSYHwQCy9C6eYYaEve4HxXJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6ae41d34275so1156234eaf.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 15:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969998; x=1786574798;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgCQmEE3xI0NHHk8RtfFju2eTPuLMb565Ugt4IwdZPw=;
        b=o4RbOhFTqImvubXRS9/M6z4n0qONMLfwbPhtwP9jPJalQht6HWt9X8KpeiRHl6GWnx
         rhCrFhCwQU/FpQxl7sD0I+9SztGEN2GpmnzfGHGXQKH1S/PLxMMps6aMFY/oGGl6VCZ0
         10VhTp4WeOu7ZvY9IbRKDMXaHXADI/67H87idztlg04TMEZl6GBfCxv/RktBMbM6GOjS
         6M0S2ojPgvsvJA8ngA4FL7EB8FUOOVtHUTnbTpwAkWjZUnq4G7Knq05JinqQ6ekWVp/7
         Usbbe2iztGnR2XsFc/JrmaCKv+0mPTQ7slbK2B7lj4gOpgSeo4SfAuvqEexZCRaltkbW
         SE5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoOzQCTlXMywOTqvJR9VUbsDN7PGx1oAa/Y6U8i7/7smG+xfs7jGgRfaPA+EoO3YdM6P5ENyKzh/kfJ8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJUYGVQvTUYlUvnfT/KWS3Uyxv8ZejDEuTIVbS/cy7Laa6w9Pc
	EmMnuVtkzobc+euYZ6PYB4ZpXNRDgkaRuqvD+PJbFtu+7n6qOjpSFEgQFbq/VN/Qwt8wukPOxJT
	sfwbXC2JRBJ94Jzgwhs8vg7DQmeEEryGwF0AjZOPw5RuFKcs6zgwKtEmTOt0=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a03:b0:6a1:77ce:1b09 with SMTP id
 006d021491bc7-6ae96c3a950mr5627874eaf.6.1785969997874; Wed, 05 Aug 2026
 15:46:37 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:46:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bd4d.01d0871a.3a0d52.0005.GAE@google.com>
Subject: [syzbot] [sound?] UBSAN: array-index-out-of-bounds in snd_dummy_probe
From: syzbot <syzbot+2fb5d1f7cc4c1f132bcc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=176c5bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=2fb5d1f7cc4c1f132bcc
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125d13b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14287e32580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/375d27e96ecb/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ba19a656b9d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c2a17aaee7c/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2fb5d1f7cc4c1f132bcc@syzkaller.appspotmail.com

------------[ cut here ]-[   99.286460][ T5617] ------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in sound/drivers/dummy.c:1020:40
index -1 is out of range for type 'int[8]'
CPU: 0 UID: 0 PID: 5617 Comm: syz-executor633 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xe8/0xf0 lib/ubsan.c:455
 snd_dummy_probe+0x12c6/0x18f0 sound/drivers/dummy.c:1020
 platform_probe+0xf9/0x190 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
 bind_store+0x1d3/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f978d6bd609
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc5d9d4028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f978d6bd609
RDX: 0000000000000007 RSI: 0000200000000180 RDI: 0000000000000004
RBP: 0000000000000001 R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000006 R11: 0000000000000246 R12: 00007ffc5d9d4198
R13: 0000200000000004 R14: 00007f978d750c40 R15: 0000000000000002
 </TASK>
---[ end trace ]---


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
