Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81843E63BD;
	Tue, 25 Aug 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651057; cv=none; b=Azqrhkneyklb0si10udnaJOQuXqsuH6tvHiUHWCbZADHtvJrvI3mWrb44UBU+UfeFQj50BrS+PtvyM6/BctS4IR14EKu6AEwelphnWHJ49lNSSx/mXtia2aXzjtfN3CNegNRhv9IU7x8QFZGhS90KEr5R8Q1qXWuNgqGnckK88Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651057; c=relaxed/simple;
	bh=uDT34B6m2RVD6wCLp1ia2NLGef3B3Q5lqNFK4sltH0A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGhJQTtGApgjuPYijWfMzSTTy+6M1AT9O6vK42ijMKPGfaq5Wg1ewkjacqE50HgW+WpLsRCazrNs1stEs/A8uSKl4+ccJfe2Ck5OLsAOMKA5B6clmL8j1NRntYpYYV+iXStlZbhUecFWfieuFJi9YXM4yUd+6cOypkm54/DE15A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CoWsf+8/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZH3niDBm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nfamS3J3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wObDh/da; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CoWsf+8/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZH3niDBm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nfamS3J3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wObDh/da"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7C651F7AB;
	Tue, 25 Aug 2026 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787651049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MNFFCuWbm5K6Qb2JvIzeJklk+kdolLeavoxFU0go5/8=;
	b=CoWsf+8/kib9xrTFXRjyS1A3sYLUFUFgT4QfXYAE+YRZQjgJeyhF7IXvTHgB8gn/G8TDqH
	gMJ3mmsH6OL283rnxzfBQUQPJF4urezFtpwh48NGOBoCKcux3NvpOzNILtly4KFKrdElEv
	BL1Sac5eaB7BgmjLIxGuuEUImLUjdIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787651049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MNFFCuWbm5K6Qb2JvIzeJklk+kdolLeavoxFU0go5/8=;
	b=ZH3niDBmjnULhwzzeSrRf75jwlH58uG4wugHy73NplsYFoKuXR5YGoLCQzthYv5NUOXRBs
	zgUj4tHDOSGB2XCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787651045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MNFFCuWbm5K6Qb2JvIzeJklk+kdolLeavoxFU0go5/8=;
	b=nfamS3J3q6x1rue5GoEjPO/zZqZr0cg82c+nMySNK5FZ7tbtooHaKj5hAs2Bduxr9UhQDr
	xcSDCS28H2iYvEizRC1yhZGYL+yZaPHK75i/Pya9MpV1VnVxMIRfxRErz/8VW4WfSdexsk
	Egf0b5bCapQTyWfvWB01eNBYM39vlZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787651045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MNFFCuWbm5K6Qb2JvIzeJklk+kdolLeavoxFU0go5/8=;
	b=wObDh/dasEcXbXW8NTMgdgKP5FeD8ublyM+YlM1jjVvHulWBAdVZrpzuU0cC0GXgSCWIJR
	k2Al4q3PZB0bsjDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FC9D13331;
	Tue, 25 Aug 2026 09:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cO1mJuVjjWqmWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 09:44:05 +0000
Date: Tue, 25 Aug 2026 11:44:05 +0200
Message-ID: <871pbmttzu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+d4d7ac4a87bb2d52a822@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [syzbot] [sound?] possible deadlock in snd_seq_deliver_event (2)
In-Reply-To: <6a6aaffd.86abc875.e5c3d.005b.GAE@google.com>
References: <6a6aaffd.86abc875.e5c3d.005b.GAE@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -0.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=145fa60d73086782];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[d4d7ac4a87bb2d52a822];
	MIME_TRACE(0.00)[0:+];
	REDIRECTOR_URL(0.00)[goo.gl];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]

On Thu, 30 Jul 2026 03:59:25 +0200,
syzbot wrote:
> 
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    fc02acf6ac0c Merge tag 'platform-drivers-x86-v7.2-4' of gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17a0b8c6580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
> dashboard link: https://syzkaller.appspot.com/bug?extid=d4d7ac4a87bb2d52a822
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/67251350dd03/disk-fc02acf6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e4edd57a8c61/vmlinux-fc02acf6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/04ff166cc853/bzImage-fc02acf6.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d4d7ac4a87bb2d52a822@syzkaller.appspotmail.com
> 
> ============================================
> WARNING: possible recursive locking detected
> syzkaller #0 Not tainted
> --------------------------------------------
> kworker/1:3/5615 is trying to acquire lock:
> ffff888032c85128 (&grp->list_lock){.+.+}-{3:3}, at: __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
> ffff888032c85128 (&grp->list_lock){.+.+}-{3:3}, at: deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
> ffff888032c85128 (&grp->list_lock){.+.+}-{3:3}, at: snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813
> 
> but task is already holding lock:
> ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
> ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
> ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813
> 
> other info that might help us debug this:
>  Possible unsafe locking scenario:
> 
>        CPU0
>        ----
>   lock(&grp->list_lock);
>   lock(&grp->list_lock);
> 
>  *** DEADLOCK ***
> 
>  May be due to missing lock nesting notation
> 
> 3 locks held by kworker/1:3/5615:
>  #0: ffff88801bc0f140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x12b1/0x1940 kernel/workqueue.c:3297
>  #1: ffffc900039c7d08 ((work_completion)(&runtime->event_work)){+.+.}-{0:0}, at: process_one_work+0x988/0x1940 kernel/workqueue.c:3298
>  #2: ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
>  #2: ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
>  #2: ffff8880269b0128 (&grp->list_lock){.+.+}-{3:3}, at: snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813
> 
> stack backtrace:
> CPU: 1 UID: 0 PID: 5615 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
> Workqueue: events snd_rawmidi_input_event_work
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>  print_deadlock_bug.cold+0xbd/0xca kernel/locking/lockdep.c:3041
>  check_deadlock kernel/locking/lockdep.c:3093 [inline]
>  validate_chain kernel/locking/lockdep.c:3895 [inline]
>  __lock_acquire+0x1256/0x1a40 kernel/locking/lockdep.c:5237
>  lock_acquire kernel/locking/lockdep.c:5868 [inline]
>  lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
>  __raw_read_lock include/linux/rwlock_api_smp.h:163 [inline]
>  _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:232
>  __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:723 [inline]
>  deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
>  snd_seq_deliver_event+0x230/0x860 sound/core/seq/seq_clientmgr.c:813
>  snd_seq_kernel_client_dispatch+0x16f/0x1b0 sound/core/seq/seq_clientmgr.c:2439
>  queue_broadcast_event.isra.0+0x143/0x1b0 sound/core/seq/seq_queue.c:585
>  snd_seq_queue_process_event sound/core/seq/seq_queue.c:634 [inline]
>  snd_seq_control_queue+0x709/0xb70 sound/core/seq/seq_queue.c:659
>  __snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:626 [inline]
>  __snd_seq_deliver_single_event+0x127/0x1c0 sound/core/seq/seq_clientmgr.c:613
>  _snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:672 [inline]
>  snd_seq_deliver_single_event+0x31f/0x8c0 sound/core/seq/seq_clientmgr.c:687
>  snd_seq_deliver_event+0x44b/0x860 sound/core/seq/seq_clientmgr.c:815
>  snd_seq_kernel_client_dispatch+0x16f/0x1b0 sound/core/seq/seq_clientmgr.c:2439
>  send_timer_event.isra.0+0x130/0x190 sound/core/seq/oss/seq_oss_timer.c:140
>  snd_seq_oss_timer_start+0x1db/0x320 sound/core/seq/oss/seq_oss_timer.c:161
>  send_midi_event sound/core/seq/oss/seq_oss_midi.c:576 [inline]
>  snd_seq_oss_midi_input+0x467/0xa30 sound/core/seq/oss/seq_oss_midi.c:501
>  snd_seq_oss_event_input+0x194/0x250 sound/core/seq/oss/seq_oss_event.c:429
>  __snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:626 [inline]
>  __snd_seq_deliver_single_event+0x127/0x1c0 sound/core/seq/seq_clientmgr.c:613
>  _snd_seq_deliver_single_event sound/core/seq/seq_clientmgr.c:672 [inline]
>  snd_seq_deliver_single_event+0x31f/0x8c0 sound/core/seq/seq_clientmgr.c:687
>  __deliver_to_subscribers sound/core/seq/seq_clientmgr.c:735 [inline]
>  deliver_to_subscribers sound/core/seq/seq_clientmgr.c:763 [inline]
>  snd_seq_deliver_event+0x2c1/0x860 sound/core/seq/seq_clientmgr.c:813
>  snd_seq_kernel_client_dispatch+0x16f/0x1b0 sound/core/seq/seq_clientmgr.c:2439
>  snd_midi_input_event+0x32f/0x470 sound/core/seq/seq_midi.c:93
>  snd_rawmidi_input_event_work+0x61/0x80 sound/core/rawmidi.c:127
>  process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
>  process_scheduled_works kernel/workqueue.c:3405 [inline]
>  worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
>  kthread+0x370/0x450 kernel/kthread.c:436
>  ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

#syz fix: ALSA: seq: Use RCU for the port subscriber list
