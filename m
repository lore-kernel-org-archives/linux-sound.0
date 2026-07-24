Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68B62C11E4
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904587; cv=none; b=uh+H3IX+fhN3NaLG9jEjON2vGoszD+0qmMUsF5s9NJrfcorZNicqvQICPyZQJmrYIjvZLNcLFHjzsqrhg4MaobjoTpejTmo/uICtJ4JW78PJNlZe8dkJePWQk40zPfeePlBDQPfH0eo9Po1eqN1/ehV8s8+EHZqd1YfVxOSNJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904587; c=relaxed/simple;
	bh=ss+/0Ka2DRhjm8SwZDijccLEeOMg1c+7NqpfwG+fir0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gFGi+7LC06n9ypzLXUtzR/Oy0ipDhNrJrtiiX2DB543WTkGH7beZ1vj7E9qZds8MaOSo5A7OO9MeJwfWb1SN0byDjn6V2OlqAz+wA/pFjhDwkL8lf2/MB6+yHgghGvxI6DvMuvuVa0/6UNM5ExnOdY2T6IJbHdbtoI421jpbj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdHPkYAF; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdHPkYAF"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so4082806d6.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784904583; x=1785509383; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G+s9umKDu2/9GPjalFDGSIKQwAsFHkk2sbU/X/m12nc=;
        b=kdHPkYAFJL3sSYl19LxmBpzInvY3WTFrnfKE2z4Z7nfdPjKxyh96fltvWCW5VDcV75
         qzDU0Zhc0HIUpW24yq7hpDYaKgTYhUjcSlImmqt6zq9/C0h5sXDxeNqWvuQPWAUFUvOM
         pDeytRTlQlbDVU4LgjzYtybr1AgJFHHhYWli/NLyhOmWdqUAowcUA+k8re64v9D7NCy0
         UZvVgRSlCoqjncYoxwYNA1KVlTPp6KSjN93hKPX7mC1TLN9vmk3P81Z6OuohEMAEgs2T
         0C1wymgyaH3hA9OCNbwnwFeE7adXJ+BaisCXGMcMrw+nYMAoLSBORSOt55zni6srV8mm
         ToeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784904583; x=1785509383;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+s9umKDu2/9GPjalFDGSIKQwAsFHkk2sbU/X/m12nc=;
        b=U3l9RkK/1uOE21Bq78Q90rc/P7ZzbXNJJ3NcaMMvLd98CJMtbwpqkbW28P8HbI/2/N
         ecqW5whPGQXeqWVLq+hGVU+0x+8vUnXech+1B6NGVXEPgMV92OMH3L4FNcHHc/7716Ot
         79Ot6uQ0TG5ZnV61Pl2kvkuYBTZOTgU1uqQ/sCTmYeOhGHDg77DPJiP68Cmzce7g8CYU
         ZKpg2C0+D86FcHBDnvtrBvnma8MLRzYVrCzJUY8afQ73rf6l63MjUCVa0p9gQjwF7xaL
         QP5g6FpxP29pvBI6xxil23AbvFAZ4jrVnBXHEB/ePLyPAiI/Ra58N28uAS7wvwsYRJkc
         ZHxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpti1hB765bBGFFJEw67htS3j8ootymSntKc33XHwHIXNLkyQ+Fh1W+4aSnR7mltA1n05gB3357R9DJQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypslhG/f7KBY9RqQqjY/ocoid24PnqhltXWxnkJM4hBhWZE18k
	OKqvOYceD1N7nB/0eBvFiRJpms+4R2b7H6XtuxXyI89MqDlfAkjiJ/QC
X-Gm-Gg: AR+sD105J1wXjBDAPo+Yq3uTrD9NPXY0f2dKqKueVdyaHD7Zu4lR45boqCh0H9e2sgA
	TNDemx0QI+am8dZOwVMBcIUydjbvygOSnCyK8NfQAv8bis+ejC0Okvq15X/ZWinY7fiH04jJDqE
	dDrbXDG5Y+INEMsyDRq1X/TbdboK4KDZxMLqm8F26MmLLcuMfdQKLJQYBedCGqkK4T7qkDRg7iH
	pEj0dp/6H8ZEi2+V8zpZ3hjVUaoxidXHN7aGCj6kbzhvNBL+B2NtP1m1qy9vAfK9oQ2f06kC/AP
	BotexpXN70Fu46R+eVew6NMyTHWfwEu+uC4caxQhgiNz8FLoCQaXPLQWD6kUvXGEt+jbcvD3TnP
	6moSUiH/w6NhYtDOtIWDqeQ4WYwvfF6cCRlcolPYOUP//dhk7JUtuHzVPoDlWi8x36VaOq4Dktb
	/RW9PBYmRD7WAl+6pckeIBgs7gTQ0XNTBMgiXJPVg=
X-Received: by 2002:a05:6214:3b87:b0:907:bf2a:481f with SMTP id 6a1803df08f44-907ca362848mr83243026d6.1.1784904583132;
        Fri, 24 Jul 2026 07:49:43 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:54:d8f8:463:bede])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b8798sm70608326d6.10.2026.07.24.07.49.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2026 07:49:42 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] ALSA: usb: 6fire: KASAN slab-use-after-free in dummy_timer
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <87bjbwesqq.wl-tiwai@suse.de>
Date: Fri, 24 Jul 2026 10:49:27 -0400
Cc: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C142CFA2-EBF7-41D9-B03B-E2D1CA853112@gmail.com>
References: <20260724030900.1984491-1-shuangpeng.kernel@gmail.com>
 <87bjbwesqq.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Jul 24, 2026, at 03:45, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Fri, 24 Jul 2026 05:07:50 +0200,
> Shuangpeng Bai wrote:
>>=20
>> Hi Kernel Maintainers,
>>=20
>> I hit the following report while testing current upstream kernel:
>>=20
>> KASAN: slab-use-after-free in dummy_timer
>>=20
>> on commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a (2026-07-16)
>>=20
>> The reproducer and .config files are here.
>> =
https://gist.github.com/shuangpengbai/a410bc05b4f22d1ba4ce7ef059043fea
>>=20
>> I'm happy to test debug patches or provide additional information.
>>=20
>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>>=20
>> [  400.891255][    C0] BUG: KASAN: slab-use-after-free in dummy_timer =
(drivers/usb/common/usb-otg-fsm.c:393)
>> [  400.891273][    C0] Read of size 4 at addr ffff8881789bc20c by =
task kworker/0:2/773
>> [  400.891276][    C0]
>> [  400.891291][    C0] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX =
+ PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>> [  400.891294][    C0] Workqueue: usb_hub_wq hub_event
>> [  400.891299][    C0] Call Trace:
>> [  400.891301][    C0]  <IRQ>
>> [  400.891302][    C0]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
>> [  400.891306][    C0]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
>> [  400.891322][    C0]  kasan_report (mm/kasan/report.c:595)
>> [  400.891330][    C0]  dummy_timer =
(drivers/usb/common/usb-otg-fsm.c:393)
>> [  400.891397][    C0]  __hrtimer_run_queues =
(kernel/time/hrtimer.c:2032 kernel/time/hrtimer.c:2096)
>> [  400.891403][    C0]  hrtimer_run_softirq =
(kernel/time/hrtimer.c:2113)
>> [  400.891414][    C0]  handle_softirqs (kernel/softirq.c:622)
>> [  400.891420][    C0]  __irq_exit_rcu (kernel/softirq.c:656 =
kernel/softirq.c:496 kernel/softirq.c:735)
>> [  400.891423][    C0]  sysvec_apic_timer_interrupt =
(arch/x86/kernel/apic/apic.c:1062 arch/x86/kernel/apic/apic.c:1062)
>> [  400.891427][    C0]  </IRQ>
>> [  400.891428][    C0]  <TASK>
>> [  400.891579][    C0]  really_probe (drivers/base/dd.c:644 =
drivers/base/dd.c:706)
>> [  400.891582][    C0]  __driver_probe_device (drivers/base/dd.c:868)
>> [  400.891585][    C0]  driver_probe_device (drivers/base/dd.c:898)
>> [  400.891588][    C0]  __device_attach_driver =
(drivers/base/dd.c:1026)
>> [  400.891593][    C0]  bus_for_each_drv (drivers/base/bus.c:500)
>> [  400.891615][    C0]  __device_attach (drivers/base/dd.c:1098)
>> [  400.891631][    C0]  device_initial_probe (drivers/base/dd.c:1153)
>> [  400.891634][    C0]  bus_probe_device (drivers/base/bus.c:620)
>> [  400.891637][    C0]  device_add (drivers/base/core.c:3772)
>> [  400.891641][    C0]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
>> [  400.891647][    C0]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
>> [  400.891651][    C0]  usb_probe_device =
(drivers/usb/core/driver.c:291)
>> [  400.891653][    C0]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:706)
>> [  400.891656][    C0]  __driver_probe_device (drivers/base/dd.c:868)
>> [  400.891663][    C0]  driver_probe_device (drivers/base/dd.c:898)
>> [  400.891665][    C0]  __device_attach_driver =
(drivers/base/dd.c:1026)
>> [  400.891671][    C0]  bus_for_each_drv (drivers/base/bus.c:500)
>> [  400.891685][    C0]  __device_attach (drivers/base/dd.c:1098)
>> [  400.891704][    C0]  device_initial_probe (drivers/base/dd.c:1153)
>> [  400.891707][    C0]  bus_probe_device (drivers/base/bus.c:620)
>> [  400.891710][    C0]  device_add (drivers/base/core.c:3772)
>> [  400.891714][    C0]  usb_new_device (drivers/usb/core/hub.c:2695)
>> [  400.891726][    C0]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
>> [  400.891743][    C0]  process_scheduled_works =
(kernel/workqueue.c:3322 kernel/workqueue.c:3405)
>> [  400.891748][    C0]  worker_thread (kernel/workqueue.c:3486)
>> [  400.891756][    C0]  kthread (kernel/kthread.c:436)
>> [  400.891764][    C0]  ret_from_fork (arch/x86/kernel/process.c:158)
>> [  400.891790][    C0]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
>> [  400.891795][    C0]  </TASK>
>> [  400.891797][    C0] Freed by task 773 on cpu 0 at 400.890164s:
>> [  400.891805][    C0]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
>> [  400.891813][    C0]  kasan_save_free_info (mm/kasan/generic.c:584)
>> [  400.891821][    C0]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
>> [  400.891824][    C0]  kfree (./include/linux/kasan.h:235 =
mm/slub.c:2705 mm/slub.c:6405 mm/slub.c:6720)
>> [  400.891827][    C0]  usb6fire_comm_destroy =
(sound/usb/6fire/comm.c:197)
>> [  400.891830][    C0]  usb6fire_card_free =
(sound/usb/6fire/chip.c:65)
>> [  400.891832][    C0]  release_card_device (sound/core/init.c:594 =
sound/core/init.c:153)
>> [  400.891852][    C0]  kobject_put (lib/kobject.c:689 =
lib/kobject.c:720 ./include/linux/kref.h:65 lib/kobject.c:737)
>> [  400.891855][    C0]  snd_card_free (sound/core/init.c:626 =
sound/core/init.c:658)
>> [  400.891858][    C0]  usb6fire_chip_probe =
(sound/usb/6fire/chip.c:153)
>> [  400.891860][    C0]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
>=20
> Through a quick glance, this looks like a stale URB firing after the
> release.  Does the patch below work?
>=20

I tested the patch. The reproducer does not trigger the bug on my side.
Thanks for your patch.


> thanks,
>=20
> Takashi
>=20
> -- 8< --
> --- a/sound/usb/6fire/chip.c
> +++ b/sound/usb/6fire/chip.c
> @@ -150,6 +150,10 @@ static int usb6fire_chip_probe(struct =
usb_interface *intf,
> return 0;
>=20
> destroy_chip:
> + chip->shutdown =3D true;
> + if (card)
> + snd_card_disconnect(card);
> + usb6fire_chip_abort(chip);
> snd_card_free(card);
> return ret;
> }

