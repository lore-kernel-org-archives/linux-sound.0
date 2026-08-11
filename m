Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C02777FC
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786407810; cv=none; b=DNxw/03msFeeWuBNWVaxSVAS+WJJz4Sm8Ns5HcJ5Izrhi1Tq7s/NgoeaabP8dTEw4W6yenp9GjK6jx+itnznl6FpiqoqKjleXwKqGIfcPH18A+Gj8BvB9LsvE7Fxc2F/4QjYQMbysqY7C64o9uBFRX4prgbiNBGr+lV3cmSQTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786407810; c=relaxed/simple;
	bh=1YSawyyNBtOflkc/GK8vJ8vbPb2vnfAvbLw6lxe2oAw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fciecZqDRSdWBE91IOwZtk72NxxU4bhtfbAlJIO+aBF/XIL/wifCOg178ZMkLfHc9SWFpc7mmFLgGgW2Ur2G+KnjH9EGDOjhNYEYS95vmhELw8ZcPpUwsWdGqkyAD+85eaaUy7soHPiYGcD4Bso+aXIkP1RZtKXpG8AlXQip02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a41f46d629so3469631b6e.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 17:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786407808; x=1787012608;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYRPWE3P3C+J7CtGtED7RNYHGLNq9cBH5UEbb3TLn34=;
        b=Dssozp4dNOy6GLgjDBrw0gESmcSqs6z7eU3O20jE2H8yrAma2q7+EHp9z7aJus8GW8
         cyAuHP+l7Tz6UidAzYO/GZq3wS5j+ZAopfP/0eVaoA19OYrbdsBspj+S/3ZMN0z6rBjg
         vJcAGccKJ6YQ26ku3NP0OTjvMlJENUtdgUsFCsx47sqtOn5HdC/E86z/eqRNXiSfQrVr
         FhRWceI6wMnGKKgD8yJfIWFz+KIgk5O444UockILhCxFpSqy1yOFwkcoz0duBX5qAhet
         aQFY3hhYmB5Qb0h7IZQqGGEhhNKPyqjylxKmsxklLJykTfEhOO+ja8hsSvM0ZPm8VX0L
         jiew==
X-Forwarded-Encrypted: i=1; AHgh+RpzukmQgIQHHzN2f0mdnci3XlraXGejgdLr+iAo/7l8/RFTBzKCoWB9Ie2EN6bhbY2WK5CTEXeN0q/LqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjy0QgSXPE+CrA3Q3p7F5/x5k1/WQLvFrKJZU5R8SkNeAT1KmN
	QZUrMoI0fVIymxxZX1dznPv8Lm5lAxLz4p4iebcflMIsusOp2Rb9fEZZNvjKvQ7fyM9TkvJ+oqY
	f27j+nwE2yXQI8zVWdgbVz8SX0vnn41BXjQTldfZcbUQsRO/a8YNIgmYSpGo=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14cc:b0:492:5b42:ab02 with SMTP id
 5614622812f47-4b1a08de5a3mr13710297b6e.0.1786407808090; Mon, 10 Aug 2026
 17:23:28 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:23:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a6b80.9c11d2ce.289b96.00f9.GAE@google.com>
Subject: [syzbot] [sound?] BUG: unable to handle kernel paging request in snd_hdac_bus_parse_capabilities
From: syzbot <syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0d8395707651 Merge tag 'soc-fixes-7.2-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10f63e49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=acc0a882b963ae23
dashboard link: https://syzkaller.appspot.com/bug?extid=10cd2d1efe8eeb604bee
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2018c5f56c1d/disk-0d839570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bfeae099eec/vmlinux-0d839570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/37bf23e44126/bzImage-0d839570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: 000000000001c094
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 3b4a3067 P4D 3b4a3067 PUD 0 
Oops: Oops: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: events azx_probe_work
RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
RIP: 0010:snd_hdac_bus_parse_capabilities+0x42/0x6d0 sound/hda/core/controller.c:412
Code: 98 f8 48 8d 45 20 48 89 c2 48 89 44 24 10 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 f8 05 00 00 48 8b 45 20 <66> 44 8b 68 14 4c 8b 7c 24 10 48 89 e8 45 0f b7 ed 45 31 f6 48 ba
RSP: 0018:ffffc900000e7ab0 EFLAGS: 00010246
RAX: 000000000001c080 RBX: ffff88805268e058 RCX: ffffffff897da916
RDX: 1ffff1100a4d1c0b RSI: ffffffff8971ecda RDI: ffff88805268e038
RBP: ffff88805268e038 R08: 0000000000000005 R09: 0000000000000003
R10: 0000000000000003 R11: 0000000000000000 R12: 0000000000000003
R13: ffff88801e6d4f44 R14: ffff888023aca000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123ded000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c094 CR3: 000000009bf8c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 azx_first_init sound/hda/controllers/intel.c:1936 [inline]
 azx_probe_continue sound/hda/controllers/intel.c:2365 [inline]
 azx_probe_work+0x1d8e/0x2640 sound/hda/controllers/intel.c:1737
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
CR2: 000000000001c094
---[ end trace 0000000000000000 ]---
RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
RIP: 0010:snd_hdac_bus_parse_capabilities+0x42/0x6d0 sound/hda/core/controller.c:412
Code: 98 f8 48 8d 45 20 48 89 c2 48 89 44 24 10 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 f8 05 00 00 48 8b 45 20 <66> 44 8b 68 14 4c 8b 7c 24 10 48 89 e8 45 0f b7 ed 45 31 f6 48 ba
RSP: 0018:ffffc900000e7ab0 EFLAGS: 00010246
RAX: 000000000001c080 RBX: ffff88805268e058 RCX: ffffffff897da916
RDX: 1ffff1100a4d1c0b RSI: ffffffff8971ecda RDI: ffff88805268e038
RBP: ffff88805268e038 R08: 0000000000000005 R09: 0000000000000003
R10: 0000000000000003 R11: 0000000000000000 R12: 0000000000000003
R13: ffff88801e6d4f44 R14: ffff888023aca000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123ded000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c094 CR3: 000000009bf8c000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	98                   	cwtl
   1:	f8                   	clc
   2:	48 8d 45 20          	lea    0x20(%rbp),%rax
   6:	48 89 c2             	mov    %rax,%rdx
   9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   e:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  15:	fc ff df
  18:	48 c1 ea 03          	shr    $0x3,%rdx
  1c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  20:	0f 85 f8 05 00 00    	jne    0x61e
  26:	48 8b 45 20          	mov    0x20(%rbp),%rax
* 2a:	66 44 8b 68 14       	mov    0x14(%rax),%r13w <-- trapping instruction
  2f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
  34:	48 89 e8             	mov    %rbp,%rax
  37:	45 0f b7 ed          	movzwl %r13w,%r13d
  3b:	45 31 f6             	xor    %r14d,%r14d
  3e:	48                   	rex.W
  3f:	ba                   	.byte 0xba


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
