Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B85734C820
	for <linux-sound@vger.kernel.org>; Fri,  5 Dec 2025 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960270; cv=none; b=Qj5eoTCqaTNwaeh6NZ0THYorg7P+ka1woHkLGx8tX249QasVk6YuHAzS0m6J3pYTTDxJdYsvULZI94Inbne3MKjoYmQsmXTggGl/FMeWMUipsagwr6At5OzeoDbISqmD9oTEqdOP0Hx1CH/JS8dGa+5WrRm/qEHSahH/v9jdzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960270; c=relaxed/simple;
	bh=376EkUtstyPqokHyLamdbeNZmypuQg9mNXcum3Q5wiY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=V3JnuGMMYrr0Tziq31XUJp0HB48gqvx6BlbpXBPdwwZPHHtDrXT1E0272XIyn7VNuZZusSPxVOGMvWHOOJoEFzUdtSan4xS524q1wnW52TwUbhHgET2ThODTCtF5sNbqiAkjGLjuVgrSRKwDbsdhPmDmEeaR2hF55mafKJxgHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7c75290862cso5171802a34.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Dec 2025 10:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960268; x=1765565068;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0tNLufnTK9KOyNdYBdVYrKtKFg5E2kjtYO+X5LmUZU=;
        b=QQiE88UZJLowSz5Q1jd48pVhnyB8vTZNr6gXYoBSBJvtG9WqnsG54GUS4J/+GDQeGk
         aM/5CjbfQ6kYiSSOLfoOori4bNIaMmyYxIvU02v+JurY9vzra+ygPaZgMtpfRcJAyZX9
         Nzs4VNvxbu5eOsgSIdwTlh3V/I4lZtog5ANi69nsIFKaV/jbKIA+2OOTbJrmqMytF4gP
         8EE2+mwR1nYyPLkt96Q8dV/oETsRdCmIWC/USRwxlhVJcxlM0GJL9wYmK0M2Al+fJTdB
         UrOCzRTNaAMQn2O88RCuQITYoJY/eb/XOfO2hT7HLNZsSIs1p/dwTTSMfDPyKdsKjbVW
         G60Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6UNLiypBXrhNUoJMTJEuofjcFslQ2+tAPGXlufQMHJ84ivM3+oosc05tGikdShVRE4oDvPHsoZgpEpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFN7SJ0gQDmQYo12N4FLrBYA0gooUG/EAvr9b+g8a357/de4K
	Rtylx2ZRaIWrNU/75iXhm9hLGgVQ0kNi5xLIq+UFgr/ybQ66DDQM3F99fa1uuuI9Nwntj0gARh4
	p27fyFfBVftHSv9uZJc84IXddiGBpa/89DjBConAE7VaIh5+LBINcemSeUGE=
X-Google-Smtp-Source: AGHT+IEHvG4rrvyz1HtIqlk5O58y+LO2xwRpMieXcAeIFkehYhebEw9sLsxuxthhHkbed7iZZeXGF4LOXMz2VlTLJakBMMlhgto+
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f016:b0:659:9a49:8e8c with SMTP id
 006d021491bc7-6599a8a007bmr101225eaf.16.1764960268181; Fri, 05 Dec 2025
 10:44:28 -0800 (PST)
Date: Fri, 05 Dec 2025 10:44:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6933280c.a70a0220.243dc6.000f.GAE@google.com>
Subject: [syzbot] [sound?] WARNING in update_rq_clock
From: syzbot <syzbot+9bcc3c097b2741b0b3d4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3f9f0252130e Merge tag 'random-6.19-rc1-for-linus' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139954c2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d26d579b55a35755
dashboard link: https://syzkaller.appspot.com/bug?extid=9bcc3c097b2741b0b3d4
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/31d3e2efa35c/disk-3f9f0252.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/289b98490179/vmlinux-3f9f0252.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bdf40a8f97b1/bzImage-3f9f0252.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9bcc3c097b2741b0b3d4@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: kernel/sched/sched.h:1547 at lockdep_assert_rq_held kernel/sched/sched.h:1547 [inline], CPU#0: syz.2.23/6074
WARNING: kernel/sched/sched.h:1547 at lockdep_assert_rq_held kernel/sched/sched.h:1545 [inline], CPU#0: syz.2.23/6074
WARNING: kernel/sched/sched.h:1547 at update_rq_clock+0x34a/0xc70 kernel/sched/core.c:837, CPU#0: syz.2.23/6074
Modules linked in:
CPU: 0 UID: 0 PID: 6074 Comm: syz.2.23 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:lockdep_assert_rq_held kernel/sched/sched.h:1547 [inline]
RIP: 0010:lockdep_assert_rq_held kernel/sched/sched.h:1545 [inline]
RIP: 0010:update_rq_clock+0x34a/0xc70 kernel/sched/core.c:837
Code: ab 48 0b 00 00 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc a8 04 0f 84 9c fd ff ff 90 0f 0b 90 e9 93 fd ff ff 90 <0f> 0b 90 e9 4f fd ff ff 48 8d bb 18 0e 00 00 48 b8 00 00 00 00 00
RSP: 0018:ffffc900053179a0 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffff8880b853ab80 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8d87a111 RDI: ffffffff8bd1d700
RBP: 0000000000000001 R08: ffff8880b843b688 R09: fffffbfff20cc09a
R10: ffffffff906604d7 R11: 0000000000000001 R12: ffffffff90663534
R13: ffffffff8db376a0 R14: ffff88801f3f0000 R15: ffff8880b853ab80
FS:  00007f4eba4206c0(0000) GS:ffff888124ba3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000417000 CR3: 0000000023368000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 pick_next_task kernel/sched/core.c:6080 [inline]
 __schedule+0x212d/0x6150 kernel/sched/core.c:6797
 preempt_schedule_common+0x44/0xc0 kernel/sched/core.c:7039
 preempt_schedule_thunk+0x16/0x30 arch/x86/entry/thunk.S:12
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
 _raw_spin_unlock_irq+0x44/0x50 kernel/locking/spinlock.c:202
 spin_unlock_irq include/linux/spinlock.h:401 [inline]
 snd_rawmidi_write+0x48c/0xc10 sound/core/rawmidi.c:1615
 vfs_write+0x2a0/0x11d0 fs/read_write.c:684
 ksys_write+0x1f8/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4eb958f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4eba420038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f4eb97e5fa0 RCX: 00007f4eb958f7c9
RDX: 000000100000e3d9 RSI: 00002000000000c0 RDI: 0000000000000002
RBP: 00007f4eb9613f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f4eb97e6038 R14: 00007f4eb97e5fa0 R15: 00007ffe623eab68
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
