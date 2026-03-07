Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240D3385AC
	for <linux-sound@vger.kernel.org>; Sat,  7 Mar 2026 23:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772927972; cv=none; b=gsmHcd44ZDWV2JaWbprpICKWd13MAdYYYbIcL5d7iuvIXgB++Vc2fD0/maLqe9cbjDKv5ZJgFSvnfL89baVHqGmGzpb4ag1b03Oh+7ofmVp9XHR8eqy8XmLeXAY6/RCxPClMTneqxecnDJssvsi2N08A6+jQqifeBknL8Qd+Hho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772927972; c=relaxed/simple;
	bh=qbTT0jw2UstrhbuoFzuqIFkLYKYNRPlNSIbRiM67570=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZyCNMRi585KTa2yWz2jRJl3mHR3RXueBwEjxZe2Q1xKnFsOjNSO4Qf6m/Q1pFXGSseyE96ViU00BU2hY9IJdphbfKBoX7o5Zxrd2PddNzYs6Sp7a5/Fx70teeRmf161kXmethyZAWFD2N3/njcTS/48MduVAVnvXUIS+uJzjbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-679deba5e9fso144030403eaf.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Mar 2026 15:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772927970; x=1773532770;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9KrVekL8wvecl/jQdgCkITuCbsNTCuksC3KZ4x0pg0=;
        b=uf/LY5AQml5PK4ozlA3eDaWBWTzZO+WhYkQK9A0Z09Qmu2MTtKIRX4Z5eB4J6QVZdm
         Yzd5PSZhJ3gXeFnSm7Z/MaeWglPMd/fyd4K7oEtFH93vRDDBMY9MicH0iXQHkx1ajleh
         ATyApHWhwj6/+n6nkZ07rMXWeyKYxmTnXecIQhwV2P39NkY02crXPUwoopa3OKgQVKPm
         Jpx4lbL2ACASQy9HgqwI6P8/J1l15+aYpUjBEcMM5QynRas5/AfdCYWUiBZKaPFYGlQH
         eK0rVtQ5ewOiA7xk9Rm3pwwVSOD9YI3+jDcNy2+UhgtCI3hjxtMAEgNlffURH6lnQjwo
         EuXA==
X-Forwarded-Encrypted: i=1; AJvYcCWv6QaSb2DVAq0gstS6CR8a6BiypGaY1ZOdA75JkPwZEbYfQoLB0pQ982GkMvTnIxXoncsQtuGU4oDvVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqse730YA3+Q4bHk6aj0sTojipi5BVYgXtwBgOEbLoTSuTvKa4
	PfvH1FgwLNjNG2StpbZwvTLay6Fia04oRrV9qTMIfK15i0nwLChtnKkNnqGaaBOjF0UlMD6EXKK
	9mjan+Ll2nEZukovIu46mCAXQJz5350WE9NjDZpg3Kbmwr5h+y+tMdOLcekk=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ec43:0:b0:67b:af79:4c1f with SMTP id
 006d021491bc7-67baf794efemr86249eaf.40.1772927969970; Sat, 07 Mar 2026
 15:59:29 -0800 (PST)
Date: Sat, 07 Mar 2026 15:59:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69acbbe1.050a0220.310d8.0001.GAE@google.com>
Subject: [syzbot] [sound?] general protection fault in snd_scarlett2_controls_create
From: syzbot <syzbot+8f29539ef9a1c8334f42@syzkaller.appspotmail.com>
To: g@b4.vu, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c025f6cf4209 Add linux-next specific files for 20260303
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1347bb5a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=54b410fabe2a4318
dashboard link: https://syzkaller.appspot.com/bug?extid=8f29539ef9a1c8334f42
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12242b5a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143f1b5a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e2497bde352d/disk-c025f6cf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/36827cb45429/vmlinux-c025f6cf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7ebf1ed6bb73/bzImage-c025f6cf.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f29539ef9a1c8334f42@syzkaller.appspotmail.com

usb 1-1: 0:6 : does not exist
usb 1-1: 0:7 : does not exist
usb 1-1: 0:8 : does not exist
usb 1-1: 0:9 : does not exist
usb 1-1: 0:10 : does not exist
usb 1-1: Focusrite Scarlett Gen 3 Mixer Driver enabled (pid=0x8215); report any issues to https://github.com/geoffreybennett/scarlett-gen2/issues
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 1215 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8257 [inline]
RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8291 [inline]
RIP: 0010:snd_scarlett2_controls_create+0x998/0x4f70 sound/usb/mixer_scarlett2.c:8680
Code: 10 4c 8d b2 48 02 00 00 4c 89 f0 48 c1 e8 03 42 0f b6 04 20 84 c0 0f 85 ea 31 00 00 45 88 3e 4c 8d 73 02 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 20 84 c0 48 8b 7c 24 38 0f 85 ea 31 00 00 45 0f b6 3e
RSP: 0018:ffffc90005abe4c0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff888076018000 RSI: 00000000000000ff RDI: ffff888027a637a0
RBP: ffffc90005abe8d8 R08: ffffffff8cd90234 R09: ffffffff8cd90248
R10: dffffc0000000000 R11: fffffbfff20684b7 R12: dffffc0000000000
R13: ffff888027a6378a R14: 0000000000000002 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888124ff5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005603857c86e0 CR3: 0000000035240000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 snd_scarlett2_init+0x42f/0x6a0 sound/usb/mixer_scarlett2.c:9403
 snd_usb_mixer_apply_create_quirk+0x15a8/0x1be0 sound/usb/mixer_quirks.c:4446
 snd_usb_create_mixer+0x1b5d/0x2890 sound/usb/mixer.c:3641
 usb_audio_probe+0x1874/0x2330 sound/usb/card.c:1033
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb70 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2208
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb70 drivers/base/core.c:3689
 usb_new_device+0xa08/0x16f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a1c/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work+0x963/0x1720 kernel/workqueue.c:3285
 process_scheduled_works kernel/workqueue.c:3376 [inline]
 worker_thread+0xb46/0x1140 kernel/workqueue.c:3457
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8257 [inline]
RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8291 [inline]
RIP: 0010:snd_scarlett2_controls_create+0x998/0x4f70 sound/usb/mixer_scarlett2.c:8680
Code: 10 4c 8d b2 48 02 00 00 4c 89 f0 48 c1 e8 03 42 0f b6 04 20 84 c0 0f 85 ea 31 00 00 45 88 3e 4c 8d 73 02 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 20 84 c0 48 8b 7c 24 38 0f 85 ea 31 00 00 45 0f b6 3e
RSP: 0018:ffffc90005abe4c0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff888076018000 RSI: 00000000000000ff RDI: ffff888027a637a0
RBP: ffffc90005abe8d8 R08: ffffffff8cd90234 R09: ffffffff8cd90248
R10: dffffc0000000000 R11: fffffbfff20684b7 R12: dffffc0000000000
R13: ffff888027a6378a R14: 0000000000000002 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888124ff5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005603857c86e0 CR3: 0000000076b5e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	10 4c 8d b2          	adc    %cl,-0x4e(%rbp,%rcx,4)
   4:	48 02 00             	rex.W add (%rax),%al
   7:	00 4c 89 f0          	add    %cl,-0x10(%rcx,%rcx,4)
   b:	48 c1 e8 03          	shr    $0x3,%rax
   f:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
  14:	84 c0                	test   %al,%al
  16:	0f 85 ea 31 00 00    	jne    0x3206
  1c:	45 88 3e             	mov    %r15b,(%r14)
  1f:	4c 8d 73 02          	lea    0x2(%rbx),%r14
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
  36:	0f 85 ea 31 00 00    	jne    0x3226
  3c:	45 0f b6 3e          	movzbl (%r14),%r15d


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
