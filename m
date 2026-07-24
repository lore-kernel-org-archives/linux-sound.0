Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CE3AD50D
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879106; cv=none; b=ASjfXoyu4kUxEN8vqpzdnzEPtl5vhi0VV2+pyf8h4J/nStBn43rOOtoAGeeNvG2D4WENXk2zMunJtiRFb9wDv8nC1Y0cF4voMsDh9viK9m8csmQs5e/QJ5FYsDnq5Ftvjg5FGu0CSpWSAlm1YAZYvprOKT5cN2odGgUYb5mJZME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879106; c=relaxed/simple;
	bh=+xAdmtBxHOpeBSxwwUHONGybk3sBXV5/JscU00Kn1G8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCLT0TpXmHEob7C2xXnEx0zLR/stnl3OsrZOh4O2utjvm9SHqwGSgfLPKv0qURHOM3dd9denKUU60CZ6WyWA05RyfNiwwP9BYI1M1DJGr1STRYRqVCz3Rt2RZry9/gr1eSUmdchLQbAW1GE7TFKINq5YjMshyjvaZNxe7I49fgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ruvny4fu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0GpIbbnM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ruvny4fu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0GpIbbnM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ruvny4fu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0GpIbbnM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ruvny4fu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0GpIbbnM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 43EA03DFB;
	Fri, 24 Jul 2026 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784879102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lTgYXP8+4t2Dis1iHYQlB38l4Xa/gc21p7Bi3mTk3TM=;
	b=ruvny4fuBHfPrxnxQo0+wpF1n3BLn4eqp8peiL121LfsjeqUhYTJigjr5LKTFFNgNKvEBc
	CDc4Di0nb/QhrJXQE1no22ZH1GkTCVIAQ/f8TzoL299Tc2+bbTxnzO4SdQuAc8G25fQQDM
	YkH6UUPUhHsyvo6ItGOlAiQlXHoak3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784879102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lTgYXP8+4t2Dis1iHYQlB38l4Xa/gc21p7Bi3mTk3TM=;
	b=0GpIbbnM0PP1fqX/ZLjkHfyHJh57YS+JjeS/dgi6q0xxvrk5V+ZawwxjvZIgNjv7/1dU8x
	WkFRZg75ADPhUDCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ruvny4fu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0GpIbbnM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784879102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lTgYXP8+4t2Dis1iHYQlB38l4Xa/gc21p7Bi3mTk3TM=;
	b=ruvny4fuBHfPrxnxQo0+wpF1n3BLn4eqp8peiL121LfsjeqUhYTJigjr5LKTFFNgNKvEBc
	CDc4Di0nb/QhrJXQE1no22ZH1GkTCVIAQ/f8TzoL299Tc2+bbTxnzO4SdQuAc8G25fQQDM
	YkH6UUPUhHsyvo6ItGOlAiQlXHoak3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784879102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lTgYXP8+4t2Dis1iHYQlB38l4Xa/gc21p7Bi3mTk3TM=;
	b=0GpIbbnM0PP1fqX/ZLjkHfyHJh57YS+JjeS/dgi6q0xxvrk5V+ZawwxjvZIgNjv7/1dU8x
	WkFRZg75ADPhUDCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12C67779BA;
	Fri, 24 Jul 2026 07:45:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rWVuA/4XY2oGTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Jul 2026 07:45:02 +0000
Date: Fri, 24 Jul 2026 09:45:01 +0200
Message-ID: <87bjbwesqq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] ALSA: usb: 6fire: KASAN slab-use-after-free in dummy_timer
In-Reply-To: <20260724030900.1984491-1-shuangpeng.kernel@gmail.com>
References: <20260724030900.1984491-1-shuangpeng.kernel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 43EA03DFB
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 24 Jul 2026 05:07:50 +0200,
Shuangpeng Bai wrote:
> 
> Hi Kernel Maintainers,
> 
> I hit the following report while testing current upstream kernel:
> 
> KASAN: slab-use-after-free in dummy_timer
> 
> on commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a (2026-07-16)
> 
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/a410bc05b4f22d1ba4ce7ef059043fea
> 
> I'm happy to test debug patches or provide additional information.
> 
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> 
> [  400.891255][    C0] BUG: KASAN: slab-use-after-free in dummy_timer (drivers/usb/common/usb-otg-fsm.c:393)
> [  400.891273][    C0] Read of size 4 at addr ffff8881789bc20c by task kworker/0:2/773
> [  400.891276][    C0]
> [  400.891291][    C0] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  400.891294][    C0] Workqueue: usb_hub_wq hub_event
> [  400.891299][    C0] Call Trace:
> [  400.891301][    C0]  <IRQ>
> [  400.891302][    C0]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> [  400.891306][    C0]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> [  400.891322][    C0]  kasan_report (mm/kasan/report.c:595)
> [  400.891330][    C0]  dummy_timer (drivers/usb/common/usb-otg-fsm.c:393)
> [  400.891397][    C0]  __hrtimer_run_queues (kernel/time/hrtimer.c:2032 kernel/time/hrtimer.c:2096)
> [  400.891403][    C0]  hrtimer_run_softirq (kernel/time/hrtimer.c:2113)
> [  400.891414][    C0]  handle_softirqs (kernel/softirq.c:622)
> [  400.891420][    C0]  __irq_exit_rcu (kernel/softirq.c:656 kernel/softirq.c:496 kernel/softirq.c:735)
> [  400.891423][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 arch/x86/kernel/apic/apic.c:1062)
> [  400.891427][    C0]  </IRQ>
> [  400.891428][    C0]  <TASK>
> [  400.891579][    C0]  really_probe (drivers/base/dd.c:644 drivers/base/dd.c:706)
> [  400.891582][    C0]  __driver_probe_device (drivers/base/dd.c:868)
> [  400.891585][    C0]  driver_probe_device (drivers/base/dd.c:898)
> [  400.891588][    C0]  __device_attach_driver (drivers/base/dd.c:1026)
> [  400.891593][    C0]  bus_for_each_drv (drivers/base/bus.c:500)
> [  400.891615][    C0]  __device_attach (drivers/base/dd.c:1098)
> [  400.891631][    C0]  device_initial_probe (drivers/base/dd.c:1153)
> [  400.891634][    C0]  bus_probe_device (drivers/base/bus.c:620)
> [  400.891637][    C0]  device_add (drivers/base/core.c:3772)
> [  400.891641][    C0]  usb_set_configuration (drivers/usb/core/message.c:2268)
> [  400.891647][    C0]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
> [  400.891651][    C0]  usb_probe_device (drivers/usb/core/driver.c:291)
> [  400.891653][    C0]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:706)
> [  400.891656][    C0]  __driver_probe_device (drivers/base/dd.c:868)
> [  400.891663][    C0]  driver_probe_device (drivers/base/dd.c:898)
> [  400.891665][    C0]  __device_attach_driver (drivers/base/dd.c:1026)
> [  400.891671][    C0]  bus_for_each_drv (drivers/base/bus.c:500)
> [  400.891685][    C0]  __device_attach (drivers/base/dd.c:1098)
> [  400.891704][    C0]  device_initial_probe (drivers/base/dd.c:1153)
> [  400.891707][    C0]  bus_probe_device (drivers/base/bus.c:620)
> [  400.891710][    C0]  device_add (drivers/base/core.c:3772)
> [  400.891714][    C0]  usb_new_device (drivers/usb/core/hub.c:2695)
> [  400.891726][    C0]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
> [  400.891743][    C0]  process_scheduled_works (kernel/workqueue.c:3322 kernel/workqueue.c:3405)
> [  400.891748][    C0]  worker_thread (kernel/workqueue.c:3486)
> [  400.891756][    C0]  kthread (kernel/kthread.c:436)
> [  400.891764][    C0]  ret_from_fork (arch/x86/kernel/process.c:158)
> [  400.891790][    C0]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> [  400.891795][    C0]  </TASK>
> [  400.891797][    C0] Freed by task 773 on cpu 0 at 400.890164s:
> [  400.891805][    C0]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
> [  400.891813][    C0]  kasan_save_free_info (mm/kasan/generic.c:584)
> [  400.891821][    C0]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
> [  400.891824][    C0]  kfree (./include/linux/kasan.h:235 mm/slub.c:2705 mm/slub.c:6405 mm/slub.c:6720)
> [  400.891827][    C0]  usb6fire_comm_destroy (sound/usb/6fire/comm.c:197)
> [  400.891830][    C0]  usb6fire_card_free (sound/usb/6fire/chip.c:65)
> [  400.891832][    C0]  release_card_device (sound/core/init.c:594 sound/core/init.c:153)
> [  400.891852][    C0]  kobject_put (lib/kobject.c:689 lib/kobject.c:720 ./include/linux/kref.h:65 lib/kobject.c:737)
> [  400.891855][    C0]  snd_card_free (sound/core/init.c:626 sound/core/init.c:658)
> [  400.891858][    C0]  usb6fire_chip_probe (sound/usb/6fire/chip.c:153)
> [  400.891860][    C0]  usb_probe_interface (drivers/usb/core/driver.c:396)

Through a quick glance, this looks like a stale URB firing after the
release.  Does the patch below work?


thanks,

Takashi

-- 8< --
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -150,6 +150,10 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	return 0;
 
 destroy_chip:
+	chip->shutdown = true;
+	if (card)
+		snd_card_disconnect(card);
+	usb6fire_chip_abort(chip);
 	snd_card_free(card);
 	return ret;
 }
