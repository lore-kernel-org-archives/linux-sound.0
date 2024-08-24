Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8F4A05
	for <linux-sound@vger.kernel.org>; Sat, 24 Aug 2024 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=169.235.156.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724540995; cv=none; b=ErxRlindre0SGSCB0pg66DbgOQtT28BM9uKIR1dCtM68q/la1SUxxOGvDiOgacx7lX7I64PfM0gzkV5i/DVoT968yjKgNoLAr9iTTJ66UvTegIlN/2r8QRJpfa55/nSVPDwX9AJn4Z5oGHEBX5CVdK10nSo/uf4paijjNcse94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724540995; c=relaxed/simple;
	bh=KwTEpTJVyQ8anR7mVpiMXWx+OVdxWj9gjO3TLdEJWJM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=snzOZrdFGUnnEHtk+zzK0rtphQwSEvhOW5UCw91ipGuFTHoYmCdHTg2ZaZdpHx0jV3/Doj4xj1h6sd6VaQJti7Dc3Jn1iMOrAM2z/HnNLKyV8wkSb1gdMuSFg9xr7FKL0dbpJu2OrWQMwxw+Kk4Mnpw/cxiOpIWl28kcPexRb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=PTAyKVt+; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=IRQfGRi/; arc=none smtp.client-ip=169.235.156.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="PTAyKVt+";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="IRQfGRi/"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1724540994; x=1756076994;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:
   x-google-smtp-source:mime-version:from:date:message-id:
   subject:to:content-type:x-cse-connectionguid:
   x-cse-msgguid;
  bh=KwTEpTJVyQ8anR7mVpiMXWx+OVdxWj9gjO3TLdEJWJM=;
  b=PTAyKVt+EoR+bUTjXKbi6NAy10xboi+pKuHNQldh+IYyCkiKqp6Uf6LB
   MRUmod9xb5rDRoTdPJ+WgLtOyxglzxdDQqpCTNoIErsNyHkWKBQzxBJq3
   mgGeJyBJJ7fl3uzlDa8v8FgJ4us9ERVEXMV0PhmTsACBMVW8+bEIweVxh
   brpEOkLS/wiaZC1x3HWp2+j7xFpLxAlqy9IWZG/Wm0I84r3WiN7zGG2j1
   Wm4a38OSSuwvEYFxjWILk8AmiJjUy0bNMjLBQvv43/ap4X9NlxmBTtJDq
   sGTKuw5zHyqDvzV3NXzQi7W0yxvyUElBUKjvNReOf+ki49bpUYRe0Ymde
   g==;
X-CSE-ConnectionGUID: dkupGUDiToeL/FNhvHcuZA==
X-CSE-MsgGUID: IiHckuusR8CePCwnbGMFSQ==
Received: from mail-io1-f71.google.com ([209.85.166.71])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2024 16:08:46 -0700
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-81fc0896188so345323539f.1
        for <linux-sound@vger.kernel.org>; Sat, 24 Aug 2024 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1724540924; x=1725145724; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vnM6WbLG1jGTZoQIBdsIE1GJVAwXQu433koNWvzjUdo=;
        b=IRQfGRi/jreYOvgD5+16aToc8XGgOoQdB8xgX/Q01stTz2ZylUnNUrhWFJST3KpPUG
         CPb1bn3n04vCSrOv7v78whj+eFD9HaJgliXhE8pOmfpMbiT/0NZaElE3cdBqlvZ2uHBW
         pmEZj9uOYoijzo9iz2OVFansEgam+iQPwKtyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724540924; x=1725145724;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vnM6WbLG1jGTZoQIBdsIE1GJVAwXQu433koNWvzjUdo=;
        b=ssSnZrGHa5ZbT5qdeLn+qut3310Kb5Ic0DvM1gfRh7lsz9ZzqVdOisEA8iEYtDr/JE
         q39xYeB21WSxFa0yXGQzhh/U6KontB/PLb0E3vrphINVdHXshrkVv/xJOT+KHiTIi1bY
         jAZ2BctNb6It3MY+5feobdFk1Uf8HA/nUgS9eOsWD4b2NJltT8u/jJETtryqsRagT3Yp
         T2+qfkACs252XCGz2yiY/sw0WDlGHTuDRBxDcLEMXCxByFPi2X4Z0vRJpVlyCz1buAEO
         xZnitje51EHXuya0qFZrcrqiVzljTsENfGNG275JKWvfUcHyFo+ohI2i6vlofeWRh4SE
         sPZw==
X-Forwarded-Encrypted: i=1; AJvYcCXA3VtGzrTQ/fyLXSqNZYntAf4HvGeBLz8D1C+VjyBtplIqSkHMJfnt5WvhPo7LDJ09BGDvU2zZ5kCHyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPKFjlli2kWSfx51XzKygulLYsorWo+fByzshsyUsRbrHL5ih
	seI/30eVv0wtXBy4imBfskNhHG9Gfc3SWZUw9V/m2Q8x35mAbbWaeM+jIGBKhMeOidJ3A916H4e
	bCaoffx+i0CIklvBSg9JEslh8GOdPq3N3kZ4RobQec4me9CLA2eQ2DdQ7wtR5Q7Hhbd6gtBCVtF
	IhpA2vWVm9QPc/apFzqo0JIjLlA1xUDY48u66N
X-Received: by 2002:a05:6602:3d1:b0:824:e864:569 with SMTP id ca18e2360f4ac-8278738088dmr908947439f.11.1724540924517;
        Sat, 24 Aug 2024 16:08:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXTcaR1Ppk2Bb3VJgWGtpkd5sYNwtoN/eS7aYKU5BH7mQpHbujNN3DDaXzr2VnHYOPY7ku2i7vpDXXFZpPMuA=
X-Received: by 2002:a05:6602:3d1:b0:824:e864:569 with SMTP id
 ca18e2360f4ac-8278738088dmr908945539f.11.1724540924105; Sat, 24 Aug 2024
 16:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juefei Pu <juefei.pu@email.ucr.edu>
Date: Sat, 24 Aug 2024 16:08:32 -0700
Message-ID: <CANikGpe4pbGxQV+CCvSF6U+4cGHLWBzY_WXGSV9m+prBE6tYEQ@mail.gmail.com>
Subject: BUG: INFO: task hung in seq_free_client
To: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
We found the following issue using syzkaller on Linux v6.10.
In `seq_free_client`,  the task hangs when trying to acquire lock
`register_mutex`.

Unfortunately, the syzkaller failed to generate a reproducer.
But at least we have the report:

INFO: task syz.0.38:8767 blocked for more than 143 seconds.
      Not tainted 6.10.0 #13
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.38        state:D stack:24680 pid:8767  tgid:8767
ppid:8050   flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5407 [inline]
 __schedule+0xf4a/0x15e0 kernel/sched/core.c:6748
 __schedule_loop kernel/sched/core.c:6825 [inline]
 schedule+0x143/0x310 kernel/sched/core.c:6840
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6897
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x69a/0xd50 kernel/locking/mutex.c:752
 seq_free_client+0x27/0x180 sound/core/seq/seq_clientmgr.c:298
 snd_seq_release+0x44/0xc0 sound/core/seq/seq_clientmgr.c:387
 __fput+0x24a/0x8a0 fs/file_table.c:422
 task_work_run+0x239/0x2f0 kernel/task_work.c:180
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x12d/0x280 kernel/entry/common.c:218
 do_syscall_64+0x8a/0x150 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x67/0x6f
RIP: 0033:0x7f9a0cf809b9
RSP: 002b:00007ffc31b75f88 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f9a0d147a80 RCX: 00007f9a0cf809b9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f9a0d147a80 R08: 0000000000000006 R09: 00007ffc31b7626f
R10: 00000000003ffcd0 R11: 0000000000000246 R12: 00000000000248af
R13: 00007ffc31b76080 R14: 00007ffc31b760a0 R15: ffffffffffffffff
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/0:1/10:
 #0: ffff88801307a948 ((wq_completion)events){+.+.}-{0:0}, at:
process_one_work kernel/workqueue.c:3223 [inline]
 #0: ffff88801307a948 ((wq_completion)events){+.+.}-{0:0}, at:
process_scheduled_works+0x8fb/0x1410 kernel/workqueue.c:3329
 #1: ffffc900000cfd20
((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at:
process_one_work kernel/workqueue.c:3224 [inline]
 #1: ffffc900000cfd20
((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at:
process_scheduled_works+0x922/0x1410 kernel/workqueue.c:3329
 #2: ffff888100af7240 (&data->fib_lock){+.+.}-{3:3}, at:
nsim_fib_event_work+0x2de/0x4050 drivers/net/netdevsim/fib.c:1489
1 lock held by khungtaskd/25:
 #0: ffffffff8db32fe0 (rcu_read_lock){....}-{1:2}, at:
rcu_lock_acquire include/linux/rcupdate.h:329 [inline]
 #0: ffffffff8db32fe0 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock
include/linux/rcupdate.h:781 [inline]
 #0: ffffffff8db32fe0 (rcu_read_lock){....}-{1:2}, at:
debug_show_all_locks+0x54/0x2d0 kernel/locking/lockdep.c:6614
2 locks held by kworker/u4:9/2825:
1 lock held by systemd-udevd/4506:
1 lock held by in:imklog/7643:
1 lock held by syz.1.37/8761:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
seq_free_client+0x27/0x180 sound/core/seq/seq_clientmgr.c:298
1 lock held by syz.0.38/8767:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
seq_free_client+0x27/0x180 sound/core/seq/seq_clientmgr.c:298
1 lock held by syz.0.44/9437:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.46/9506:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.46/9508:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.46/9509:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.53/10021:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.53/10022:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.57/10085:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.57/10091:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.64/10607:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.66/10653:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.70/11162:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.68/11179:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.71/11691:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.72/11705:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.1.74/12211:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.81/12259:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
2 locks held by syz-executor/12269:
1 lock held by systemd-udevd/12279:
2 locks held by syz-executor/12313:
1 lock held by syz.1.82/12748:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
1 lock held by syz.0.83/12763:
 #0: ffffffff8ecc0b08 (register_mutex#3){+.+.}-{3:3}, at:
snd_seq_open+0x42/0x4a0 sound/core/seq/seq_clientmgr.c:335
