Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65722412266
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 22:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969820; cv=none; b=EH4nIf7kRk3ewF7GHdAAEQMgAWakls26sp48qmTxGBWLVJXeMMpTYjAauDiP7oaHx7u+2yXmFfvK29CWvHk3ejPH4xQ7+q223IICITGjBvPRiOixapK5Wuj4TWh6ucbL4fbI8YlmNIpeQqOYggmQyC9dVeGB58HKytVPQbWva9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969820; c=relaxed/simple;
	bh=cmDNEgAvrbAoQ2n0nzZcW16CXhC1/xo2Il7DKLH8LDA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XJzHb79O7hp8WopBG+sUkY6QJArNLExyqRl7IJ9bT4juZUu12AR2DZbU73Q+Lo1UoL6kaDGfLWWCOLRUeC0wXBUuOm+Ph4SoyMZyOnOqzdkuhoY9Sr6ZTWANQogJin5v36CYpYPSzwkCRt/28RXyaGe4zWCoH4KzhhF/Sz/1FrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6ae8d87a96eso1205088eaf.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 15:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969807; x=1786574607;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFcrdy2sSMQoF1zQ9rfqcIBl7nC0xdY3U/GX4Kr4Eis=;
        b=ZVDIpRk0pSXNISmRQKiqm1DTUt0gPiOFusrg4DqHBKGPUMwRxTvlYUA0tvI9uyLoAe
         1KoWpW+viEBKuKjxg7jsScFIAzOVbKK2KeAw5VewMt018TQjK8DLxzA8th9BebvKxDkg
         IhYQiYzdfVFp7ix3tkS377d5JFcPG4kWMTlQ+G5Eyy4gfhwiw8E741M6XjFxuYmQIoG3
         j/X9GMJMNXfQQfYMZSQqQrSh9iQXZNdTNgvE+rcIOwwxOw3x6cdtVmHsp+Oo05JiQCpb
         1pHOyghNwe5cOqkzXQeZaOGzbqRn5W9PIvEB/L1shP5wOxyg/YRs04aJwZ1eWNlJL8uS
         Mj4g==
X-Forwarded-Encrypted: i=1; AHgh+RqtpObU3+DmvhLfzdufOyHlAtM/tk5GB26bqNE8JmwvX8JvNgrm9G4sLm7BW4B2FLxXfV6TkGWPng4AqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMKl7qL8eYmaQL5Su87hp7iksIh6VyYXkZ/H8A/cgPC4j3pwk
	2xXmD4bhf5fR9fUAIoMjJoMVME2G3EN5PTjG9MZVdJljyXGvDJf8zHyXcGcxyNP+6Ibwyg1daot
	FSHj0bKG8e911R/ogfqIUdj4+fWhb4jn4goGKJQwPEwfmLxifugDKq1CwkTQ=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3089:b0:6ac:b9d7:2173 with SMTP id
 006d021491bc7-6ae96c84877mr5951252eaf.12.1785969807308; Wed, 05 Aug 2026
 15:43:27 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:43:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bc8f.5aeeccc9.207e63.0002.GAE@google.com>
Subject: [syzbot] [sound?] BUG: unable to handle kernel paging request in azx_probe_work
From: syzbot <syzbot+5ebe7cd17e48b4293660@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d38bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=5ebe7cd17e48b4293660
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1671be32580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d38bb9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5ebe7cd17e48b4293660@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: 000000000001c0a0
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: Oops: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 5806 Comm: kworker/1:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events azx_probe_work
RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
RIP: 0010:azx_first_init sound/hda/controllers/intel.c:1953 [inline]
RIP: 0010:azx_probe_continue sound/hda/controllers/intel.c:2365 [inline]
RIP: 0010:azx_probe_work+0xa44/0x2640 sound/hda/controllers/intel.c:1737
Code: 4c 89 f7 e8 9e 3a dd fb 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 61 1a 00 00 48 8b 85 68 f7 ff ff <66> 44 8b 28 45 89 ef 0f 1f 44 00 00 e8 7b 9e 8a f8 48 8b 54 24 40
RSP: 0018:ffffc90003137b00 EFLAGS: 00010246
RAX: 000000000001c0a0 RBX: ffff88802d5d8058 RCX: 0000000000000000
RDX: 1ffff11005abb00b RSI: ffffffff855cfff2 RDI: 0000000000000001
RBP: ffff88802d5d88f0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88802e0b04c4 R14: ffff888022f3c000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5ed8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c0a0 CR3: 000000003f65b000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
CR2: 000000000001c0a0
---[ end trace 0000000000000000 ]---
RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
RIP: 0010:azx_first_init sound/hda/controllers/intel.c:1953 [inline]
RIP: 0010:azx_probe_continue sound/hda/controllers/intel.c:2365 [inline]
RIP: 0010:azx_probe_work+0xa44/0x2640 sound/hda/controllers/intel.c:1737
Code: 4c 89 f7 e8 9e 3a dd fb 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 61 1a 00 00 48 8b 85 68 f7 ff ff <66> 44 8b 28 45 89 ef 0f 1f 44 00 00 e8 7b 9e 8a f8 48 8b 54 24 40
RSP: 0018:ffffc90003137b00 EFLAGS: 00010246
RAX: 000000000001c0a0 RBX: ffff88802d5d8058 RCX: 0000000000000000
RDX: 1ffff11005abb00b RSI: ffffffff855cfff2 RDI: 0000000000000001
RBP: ffff88802d5d88f0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88802e0b04c4 R14: ffff888022f3c000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5ed8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c0a0 CR3: 000000003f65b000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	4c 89 f7             	mov    %r14,%rdi
   3:	e8 9e 3a dd fb       	call   0xfbdd3aa6
   8:	48 89 da             	mov    %rbx,%rdx
   b:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  12:	fc ff df
  15:	48 c1 ea 03          	shr    $0x3,%rdx
  19:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  1d:	0f 85 61 1a 00 00    	jne    0x1a84
  23:	48 8b 85 68 f7 ff ff 	mov    -0x898(%rbp),%rax
* 2a:	66 44 8b 28          	mov    (%rax),%r13w <-- trapping instruction
  2e:	45 89 ef             	mov    %r13d,%r15d
  31:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  36:	e8 7b 9e 8a f8       	call   0xf88a9eb6
  3b:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx


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
