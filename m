Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69131DDBB
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 02:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117085; cv=none; b=rRP8Wk1tFf/5ixcYX0a6GLXVu7Zr/Mw/AI1jvFVCIFCouMpMY+ZyrWrbMqQyZdssOXFkmLildHXqVuHKSCF3WljiJRmfrJCHKWe+LkhcK8I+s3R2WTZQDYS2R0S2QV7hyazrNeLabVI1dasgWdA9TRuFkWgC/vm1ah812OK6gh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117085; c=relaxed/simple;
	bh=GBFbgKzou55yninokS8DLRi/3/Ccr4x4v6rKeAamxJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lST0dK6273F8Bdagdxux0EM8bOGgw97rtts70yzVEysALzocAkZhBwSRjrPWKO1JFF84vgf8ZO1EFK7W0MzzTUfmFTBus+Ikgl3RzBrXOirrMEORHqg1ELD/+TCfU0JBmz4UyLvcv5j0hKk7FFFDnlTE6RrEtD757xP+MC2CNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJHyxo08; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJHyxo08"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so384811a91.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 19:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792117083; x=1792721883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlzWRF8aDptzQD1ma/Z723oZi8PKFT4bgskbfzy3X34=;
        b=VJHyxo08Ix9V1+PzHwq4qIvNIY8xrtCNZ84yj4LAzLd6UWMMz7IUpPuE/iFBloLT/8
         Iu9ZtgLoA46TfgM+waaVskudsQMXevP/HvoGFhbpUpJrxMxELb8qs5XuS1BNuvNWura0
         52oKFyOcttefxfsi2k8SBEl9A8gXkhWIF7zs3VI7gQ95x0QDb37aCERyiHUK+7ALKY0C
         d6PvlfUUsAAFa8gHkxAlXZJ+s3WwSBPKsD6MPn4YXARr2JQF/DkuEHFS5c6s4rCizBSB
         JA5AZrEqfOsojQd3aDjqbyTi1SQCOh3+e9pAAPy26oahmQTttzuI+jCM4VNz+aJ28XnK
         YgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117083; x=1792721883;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlzWRF8aDptzQD1ma/Z723oZi8PKFT4bgskbfzy3X34=;
        b=HFd4lIahkcwu/JoNhtQVed3Bcga/IJy/yat2Mhg/H2NmU+JL6r77lmOKIDMRfKp03D
         REgKS2OjHsKWUi9uV15DayaRyi4i0EGAWPVe9UWJhCSg7ZeXN5Gosa1YoJgj1m01rmhT
         JdJesXPr0XdrvhoOkZIRahkQl8v+MfRNL5+sbzatvqvnVS8igxnCeuFtvwrqVXl7lK7v
         xG+Wmvg4aRtaSqpRsLspPyChGkqUCMyHRtklZkZIX5Jopx81drnvmuQqPacA4QqcFBW6
         utFYD+NlfanbYTX62BrWe7tU2gGj5H5NeNBPemXVSYYZRrTKYIFMl8Sbr/eEIwWLT5ZS
         gMJg==
X-Gm-Message-State: AFq9FYLfm30519XU/neF01VTjfsxHsG/8DvUgnBpnNekGF1JuDEo8VOk
	NabDIV71cq9pMON8twqmG1DFEeZF9iwyTMIqCV2v/2SDZNpKT4jdqQpp
X-Gm-Gg: AYBFou0ditAnH6eHUTAxx+iFTfQfepIlhhCHwofDV4ukEBvVZxZr4CrLL7G2Fmwp2Jz
	vAwOu04PU6jldRMrTsK5h1/I8whKGW3IktyR0MeJ/qOlh45oUB703+viAOXDNR5QOzlFW6r6fvl
	iUytIM2V6gXXGSTGIFKh7F0L0ynC3wYrxhFe5jn3kQQgyYf6ORTF6ZFSZBx7n9556UeZ4KVrrGm
	f4UEfmTqMHVNWc5lI7d4e80JyD9L8FsWco0EBZK0bYKsmdxUYL4TcI52J/wxLWAtvbFSge/KsSg
	/kYWTnIx4R3cG615sF3llF5MvrjXec9S5FmTBzdLWQKIKgQjEQyzqSjGd89DPImDRQhAaYG1m56
	Ivz/2COgaPAZ1EaZtQ6PL3clPZHAEuypjxY6Ug/wwziG8piZDnvETZB+AAGobx4A2VDTfEtZBd8
	MjkieTFelmlScV4C2E4PQO3bzgi5+HZr0Ep6GNWsoLxxS8u9nFLJjbMjVJ30C6C3K/E1w=
X-Received: by 2002:a17:90b:4a85:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3acbb68a0a3mr1226044a91.3.1792117083210;
        Thu, 15 Oct 2026 19:18:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm6830721a91.14.2026.10.15.19.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:18:02 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: seq: oss: Ignore sync echoes without a write queue
Date: Fri, 16 Oct 2026 10:17:58 +0800
Message-Id: <pm-pmb-3634251be738461947da-v2-64371e8c8d6cbf6956a3@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The sync-echo callback needs a write queue before it can wake up a
synchronizing writer. However, snd_seq_oss_open() publishes the session's
port with snd_seq_oss_event_input() as its callback before allocating
and assigning dp->writeq.

A kernel caller using snd_seq_kernel_client_dispatch() with the OSS
client ID can deliver an ECHO containing SEQ_SYNCTIMER to this port
before the write queue is assigned. The helper stamps the supplied
client ID into the event, so the callback's source-client check accepts
it. Regular userspace events carry their own client ID and are rejected.

The failing ordering is:

    OSS open                          Kernel direct dispatch
    --------                          ----------------------
    Zero-allocate dp
    Set dp->cseq
    Publish callback port
                                      Dispatch ECHO as the OSS client
                                      Look up and pin that port
                                      Enter snd_seq_oss_event_input()
                                      Pass NULL to writeq_wakeup()
    Allocate and assign dp->writeq

Dispatch reaches the callback after port publication and before the
queue assignment. OSS register_mutex serializes open and release, but
direct dispatch does not take it. The port use reference keeps dp alive
through the callback; it does not wait for constructor initialization.
The wakeup helper therefore attempts to acquire sync_lock through a
NULL queue pointer, causing a fault.

Sample dp->writeq once in the SEQ_SYNCTIMER branch and ignore the echo
when the queue is absent, matching the adjacent read-queue check. Pass
the checked pointer to the wakeup helper so a NULL sample cannot reach
the lock access. The existing port reference protects the queue's
lifetime through this call, since port deletion drains callbacks before
free_devinfo() frees the queue.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc000000000d: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
    CPU: 2 UID: 0 PID: 69 Comm: kworker/2:1 Tainted: G        W           7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [W]=WARN
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Workqueue: events pmbd_dispatch_early_sync_echo
    RIP: 0010:do_raw_spin_lock+0x71/0x270
    Code: d0 60 81 49 8d 14 04 c7 02 f1 f1 f1 f1 c7 42 04 04 f3 f3 f3 65 48 8b 15 05 df 88 09 48 89 54 24 60 31 d2 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b9
    RSP: 0018:ffff88810450f878 EFLAGS: 00010013
    RAX: dffffc0000000000 RBX: 0000000000000068 RCX: 0000000000000000
    RDX: 000000000000000d RSI: 0000000000000000 RDI: 000000000000006c
    RBP: 0000000000000293 R08: 0000000000000001 R09: 0000000000000000
    R10: ffffffff8940fe57 R11: 0000000000000000 R12: 1ffff110208a1f10
    R13: 0000000000000068 R14: 0000000000000001 R15: ffff88810450fbee
    FS:  0000000000000000(0000) GS:ffff8881fd885000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00000000006d2890 CR3: 0000000106cbf002 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? pmbd_probe_hit_cookie+0xee/0x1c0
     ? __pfx_do_raw_spin_lock+0x10/0x10
     ? lock_acquire+0x2b8/0x2f0
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     _raw_spin_lock_irqsave+0x44/0x60
     ? snd_seq_oss_writeq_wakeup+0x30/0xf0
     snd_seq_oss_writeq_wakeup+0x30/0xf0
     snd_seq_oss_event_input+0x1e4/0x2a0
     ? do_raw_read_unlock+0x49/0xe0
     ? __pfx_snd_seq_oss_event_input+0x10/0x10
     __snd_seq_deliver_single_event+0x105/0x1a0
     ? snd_seq_port_use_ptr+0x111/0x170
     snd_seq_deliver_single_event+0x2fc/0x770
     ? __pfx_snd_seq_deliver_single_event+0x10/0x10
     ? __pfx_pmbd_hold_maybe+0x10/0x10
     snd_seq_deliver_event+0x45a/0x760
     ? __pfx_do_raw_spin_lock+0x10/0x10
     ? lock_acquire+0x2b8/0x2f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_snd_seq_deliver_event+0x10/0x10
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     snd_seq_kernel_client_dispatch+0x19c/0x1e0
     pmbd_dispatch_early_sync_echo+0x121/0x1c0
     ? __pfx_pmbd_dispatch_early_sync_echo+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? finish_task_switch.isra.0+0x1dc/0x980
     process_one_work+0x908/0x19c0
     ? __pfx_process_one_work+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x175/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     kthread+0x34f/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf80
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    Modules linked in:
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:do_raw_spin_lock+0x71/0x270
    Code: d0 60 81 49 8d 14 04 c7 02 f1 f1 f1 f1 c7 42 04 04 f3 f3 f3 65 48 8b 15 05 df 88 09 48 89 54 24 60 31 d2 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b9
    RSP: 0018:ffff88810450f878 EFLAGS: 00010013
    RAX: dffffc0000000000 RBX: 0000000000000068 RCX: 0000000000000000
    RDX: 000000000000000d RSI: 0000000000000000 RDI: 000000000000006c
    RBP: 0000000000000293 R08: 0000000000000001 R09: 0000000000000000
    R10: ffffffff8940fe57 R11: 0000000000000000 R12: 1ffff110208a1f10
    R13: 0000000000000068 R14: 0000000000000001 R15: ffff88810450fbee
    FS:  0000000000000000(0000) GS:ffff8881fd885000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00000000006d2890 CR3: 0000000106cbf002 CR4: 0000000000770ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    Rebooting in 1 seconds..

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/seq/oss/seq_oss_event.c b/sound/core/seq/oss/seq_oss_event.c
index 122735862044dcc9942ed0f79d4d88f2e0d6f4ba..3c2cfaea94d1de14f70e24ada73172fe6afb75b0 100644
--- a/sound/core/seq/oss/seq_oss_event.c
+++ b/sound/core/seq/oss/seq_oss_event.c
@@ -433,8 +433,12 @@ snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *private_data
 
 	rec = (union evrec*)&ev->data;
 	if (rec->s.code == SEQ_SYNCTIMER) {
+		struct seq_oss_writeq *writeq = READ_ONCE(dp->writeq);
+
+		if (!writeq)
+			return 0;
 		/* sync echo back */
-		snd_seq_oss_writeq_wakeup(dp->writeq, rec->t.time);
+		snd_seq_oss_writeq_wakeup(writeq, rec->t.time);
 		
 	} else {
 		/* echo back event */
