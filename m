Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD56282F2A
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530521; cv=none; b=p1oauZekmQkwIWgxGbtzGtfwFwlQugKi3cUsiIlpuiw5alqZwNfbLUoQAK6odLZJfE6a8prpTWBYGOXvOQItM0j90x0K0Lc/c0SsN5zCjqDbuhU4yHtfyj8J0OxKM/uBcbtgIQVPJ1cd3DlrfcET78Cv3JFinXQwfI9P7J1O8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530521; c=relaxed/simple;
	bh=qJStxGKHr6BZIaD2cBu+Kn8KYop/LcAS8GKd0lbUDPU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mAgwinmsWZNkpv9DcjHTgHewSGxO3WGez89q2hj1vrjGMmL2TGJwFVPbSDrUH1Afvi4erB9N0pmbPgrupD6sMx6PKJyQJIfi99pm+HclrPrYJ4cMQlEobmYNsPxpXyyiyXn1CCHGCP3TtBbOiPV3wAprIznPv2pIykuxDth8HZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso937355b6e.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 03:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530518; x=1787135318;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oxIZyKHXxI2cxhA+aALeKKdWjnpLcBKqwe8XMFjZgrA=;
        b=fxHm8nfrb01AYg0OEqx0kR9sJIZhZX+P9Vd+0ZaFTsh4KoLBWtKu3nYfHcbhqREGsV
         zVwbADRpr80R/QcTpPWwRGpo5IYSoo3Z8GbqCaSEFEqqMeEXhpmjgd86RFNy/LzTni+o
         h+ofrcSmJXb+dhKfR67nBT68M6rz3U0j/OEMiwTjw6um+KhFPPCjBBuOBjhmJB/rTC7x
         rFAFXBDZDNQfrDkptsPheSnLaKh/dC3eu00NhEBUWzl7lI/UwpAn7Z5BdMN4KYvNAYyu
         Nb25punlVzNC8kuRCVDd6jrrPn0vi+hleQTspeCvMm73xmKIOe1gVkFMN0rszO+5uRBE
         YFzg==
X-Forwarded-Encrypted: i=1; AHgh+RorzgX5yHyabjyuRA4MR1ACEujMpKoSxKqV3X4Qi3ESTZTN1mNRoaz8jOZtMsKfttdQtk1Xota6J4Iaew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5/cCQheq5SFzL0x1kdsv3486HsFCCSDo6T658kTl/v+tiOk/
	+2rrXELW57RTvjXrTAFSP4aRDO7sCUUUqyAzU7J8GJ/Yd9mBlDbfqMP+StGoKy2lbrebxdCsEUD
	yKPO3FiaXticqzLbMZ+h4v8w/H+8DFQjoBN74HeAmm08JOpZDyBsquTWoYe4=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c3:b0:495:f8a6:81f8 with SMTP id
 5614622812f47-4b210bed622mr3952391b6e.13.1786530518543; Wed, 12 Aug 2026
 03:28:38 -0700 (PDT)
Date: Wed, 12 Aug 2026 03:28:38 -0700
In-Reply-To: <6a7a6b80.9c11d2ce.289b96.00f9.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7c4ad6.ed659fcc.23056a.0082.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: unable to handle kernel paging request in snd_hdac_bus_parse_capabilities
From: syzbot <syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f5bbbfec59b4 Merge tag 'probes-fixes-v7.2-rc7' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=142eb479580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=10cd2d1efe8eeb604bee
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103a1149580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: 000000000001c0b4
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: Oops: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 1039 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events azx_probe_work
RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
RIP: 0010:snd_hdac_bus_parse_capabilities+0x42/0x6d0 sound/hda/core/controller.c:412
Code: 97 f8 48 8d 45 20 48 89 c2 48 89 44 24 10 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 f8 05 00 00 48 8b 45 20 <66> 44 8b 68 14 4c 8b 7c 24 10 48 89 e8 45 0f b7 ed 45 31 f6 48 ba
RSP: 0018:ffffc90005537ab0 EFLAGS: 00010246
RAX: 000000000001c0a0 RBX: ffff888027304058 RCX: ffffffff897e8c06
RDX: 1ffff11004e6080b RSI: ffffffff8972cfca RDI: ffff888027304038
RBP: ffff888027304038 R08: 0000000000000005 R09: 0000000000000003
R10: 0000000000000003 R11: 000000000000759b R12: 0000000000000003
R13: ffff8880294e4f44 R14: ffff888022d6c000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5eec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c0b4 CR3: 000000005526e000 CR4: 0000000000352ef0
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
CR2: 000000000001c0b4
---[ end trace 0000000000000000 ]---
RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
RIP: 0010:snd_hdac_bus_parse_capabilities+0x42/0x6d0 sound/hda/core/controller.c:412
Code: 97 f8 48 8d 45 20 48 89 c2 48 89 44 24 10 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 f8 05 00 00 48 8b 45 20 <66> 44 8b 68 14 4c 8b 7c 24 10 48 89 e8 45 0f b7 ed 45 31 f6 48 ba
RSP: 0018:ffffc90005537ab0 EFLAGS: 00010246
RAX: 000000000001c0a0 RBX: ffff888027304058 RCX: ffffffff897e8c06
RDX: 1ffff11004e6080b RSI: ffffffff8972cfca RDI: ffff888027304038
RBP: ffff888027304038 R08: 0000000000000005 R09: 0000000000000003
R10: 0000000000000003 R11: 000000000000759b R12: 0000000000000003
R13: ffff8880294e4f44 R14: ffff888022d6c000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880d5eec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c0b4 CR3: 000000005526e000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	97                   	xchg   %eax,%edi
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
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
