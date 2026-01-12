Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E469B238C03
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 01:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182872; cv=none; b=B0XONCZiNV/e/vdtI4dAp92NLHB0XbvaQxGKwQR9y40zvytax7IawKXz6yGWnc2GowXecI4x3Z6zXJGu7faGfWu1uJ6OoedJLbUpx6azifsuar2luZ3Unp9FP5SStcICwCvVNcB0xzwzBmj8W1VE8fz8OQ4OxT5r/5GAuJhS2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182872; c=relaxed/simple;
	bh=j3aSXKUzTJLaR9Wt4LiszXaWhMrorCdJNAyrvwj/M5w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KRvqeKHkRpWGI7MDHg5rltevELwz3NQboeqrroIvUWXQg/yO2QFgpCXtT7OQnqBVCUkPgW2xHDnvCCXt9nSjQMBZQo4bxpUK8iImVdSg3guNLZTiVt7i02KxR/otjffRt9B5ppBbD0W2CSeInY6UhOZ6DDhDsjnntT7Y3j5Fess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7cdaa241243so6895450a34.1
        for <linux-sound@vger.kernel.org>; Sun, 11 Jan 2026 17:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768182870; x=1768787670;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUSaaR17bUYA4ctVYAbELNSqYaGD6nPhdqbk6WLUXII=;
        b=qhJAPcNSiv0chfG0h3C92RmGpMb9G0exaOXKoW1gqGom61R7mPzAY6XpcE/WYxxyvs
         RfsmZpqyh40Th0Lpt+LoM+EwbKtGgiBkoBln/AMCbvcJLd4CAMjL8k6sgeUFHTPfn1cq
         lsMQllopA9gLp6wj9h4MwUZV93VMGMpJMDgTzbkypGCP8p+MpMOzDaQahGFxUI0DNaQz
         dTBCBJa9NQlYvu5sZt/8WDTS6Tevvryo61Onzl+rPMgaRwgpDgczj7Je7uvSjZWQQhqS
         vt5U58kdh/BJE/v89qvJ5KFG3GkPrsqqgyUqWr0DhRqqWr3i8u/JTuVF1GptSUkyygst
         5z6g==
X-Forwarded-Encrypted: i=1; AJvYcCXm6haHUgHPlwu6zbBGsFFrL3vNds7Jf3IqSiBViOpc4+GCQCOqQ8p2iMB5SnSjw0VPr6PcXdRQklQr0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw899gwvjpfH+nM6BCRk3Z1dms3A5Dq5SYuFimdN/fFhCLbv4HA
	iqyasm2NgkCDOMPLOdH7VLKNrNTtKFrmtcccd/rZ+QCoAG0TR1DKGMnVCo3YMLzna6/Ir3+4yLz
	QPVeY710GSjFYocDGOrKmV2O7CG8eqE/xyPPGdFsa0EARUbqFaXlMQb4jonI=
X-Google-Smtp-Source: AGHT+IFjOK4x3pdzBsYqtH63X8tKHj1Gx3FDDHY+3fnACt2alhjAW6ClqZtTUh3r9imlxvLcyJ8xULm6Mo15fny8P0uybzsMxacN
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:613:b0:65f:66c5:c6b with SMTP id
 006d021491bc7-65f66c510d6mr4330110eaf.9.1768182869972; Sun, 11 Jan 2026
 17:54:29 -0800 (PST)
Date: Sun, 11 Jan 2026 17:54:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69645455.050a0220.eaf7.007d.GAE@google.com>
Subject: [syzbot] [sound?] WARNING in snd_usb_endpoint_start/usb_submit_urb
From: syzbot <syzbot+a8a8041d41f9655c601b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f0b9d8eb98df Merge tag 'nfsd-6.19-3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c5e074580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f2b6fe1fdf1a00b
dashboard link: https://syzkaller.appspot.com/bug?extid=a8a8041d41f9655c601b
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/200586687016/disk-f0b9d8eb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d56481335522/vmlinux-f0b9d8eb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12cfd8855d89/bzImage-f0b9d8eb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a8a8041d41f9655c601b@syzkaller.appspotmail.com

usb 3-1: timeout: still 3 active urbs on EP #4
------------[ cut here ]------------
URB ffff88805dd05000 submitted while active
WARNING: drivers/usb/core/urb.c:380 at usb_submit_urb+0x7b/0x18d0 drivers/usb/core/urb.c:380, CPU#1: syz.4.1023/9599
Modules linked in:
CPU: 1 UID: 0 PID: 9599 Comm: syz.4.1023 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x7e/0x18d0 drivers/usb/core/urb.c:380
Code: 89 f0 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 77 26 a7 fb 49 83 3e 00 74 40 e8 2c ef 44 fb 48 8d 3d e5 27 6c 08 48 89 de <67> 48 0f b9 3a b8 f0 ff ff ff eb 11 e8 11 ef 44 fb eb 05 e8 0a ef
RSP: 0018:ffffc9000cd6f5e0 EFLAGS: 00010287
RAX: ffffffff867abd04 RBX: ffff88805dd05000 RCX: 0000000000080000
RDX: ffffc9000ec48000 RSI: ffff88805dd05000 RDI: ffffffff8ee6e4f0
RBP: ffffc9000cd6f7c0 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10065221b8 R12: 0000000000000820
R13: 0000000000000000 R14: ffff88805dd05008 R15: dffffc0000000000
FS:  00007fd14e1dd6c0(0000) GS:ffff888126def000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555575be0808 CR3: 0000000036704000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 snd_usb_endpoint_start+0x8a0/0x1520 sound/usb/endpoint.c:1610
 start_endpoints+0xa1/0x280 sound/usb/pcm.c:291
 snd_usb_substream_playback_trigger+0x3e0/0x830 sound/usb/pcm.c:1711
 snd_pcm_do_start sound/core/pcm_native.c:1454 [inline]
 snd_pcm_do_drain_init+0x7d9/0xd10 sound/core/pcm_native.c:2046
 snd_pcm_action_single sound/core/pcm_native.c:1310 [inline]
 snd_pcm_action+0xe7/0x240 sound/core/pcm_native.c:1393
 snd_pcm_drain+0x261/0xdf0 sound/core/pcm_native.c:2129
 snd_pcm_oss_sync+0xf6/0x9d0 sound/core/oss/pcm_oss.c:1718
 snd_pcm_oss_release+0x102/0x250 sound/core/oss/pcm_oss.c:2573
 __fput+0x45b/0xa80 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:233
 get_signal+0x11c4/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0x9a/0x7a0 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:41 [inline]
 exit_to_user_mode_loop+0x87/0x4e0 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x2c1/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd14ff9f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd14e1dd038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: 0000000000003ac5 RBX: 00007fd1501f6090 RCX: 00007fd14ff9f749
RDX: 00000000fffffcd9 RSI: 0000200000002200 RDI: 0000000000000006
RBP: 00007fd150023f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd1501f6128 R14: 00007fd1501f6090 R15: 00007ffd58df2118
 </TASK>
----------------
Code disassembly (best guess):
   0:	89 f0                	mov    %esi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 77 26 a7 fb       	call   0xfba7268c
  15:	49 83 3e 00          	cmpq   $0x0,(%r14)
  19:	74 40                	je     0x5b
  1b:	e8 2c ef 44 fb       	call   0xfb44ef4c
  20:	48 8d 3d e5 27 6c 08 	lea    0x86c27e5(%rip),%rdi        # 0x86c280c
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  34:	eb 11                	jmp    0x47
  36:	e8 11 ef 44 fb       	call   0xfb44ef4c
  3b:	eb 05                	jmp    0x42
  3d:	e8                   	.byte 0xe8
  3e:	0a ef                	or     %bh,%ch


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
