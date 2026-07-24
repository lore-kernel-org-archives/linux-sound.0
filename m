Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57949373BF4
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784862576; cv=none; b=UAmkWAN6/LQ2A0vqYdTfcGScMCuHdsES66ewxgZxYUvPCbl6pOpjtTRY1dNhPh4tNjBj1BgqhyV7hxC1eHW4tqbK61JxgaAKqq7biIRYLaAhU4EtermfwB/g1O4CQ/k0F92vSoaGaU7sfZKIyIB66pqHH//ZRtsgEZ9UH+Q6gU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784862576; c=relaxed/simple;
	bh=e4E/1wsesUzDEcKweuN75x2BV7lbbYFWH1FkX6rBzh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNXWVtH8T7OSOrgq3l/HUaKSIaAEBXBTc9TP6TJhPwC3RttzQsYvz1SJnVp+8fH6XhyK4bHIv0km3hbpiQqq15MGuOdFEkncubA5KhhXeMnsUNtLQxjweVAUBHiqorj4A6Kana76ZQr23H/fJTIHOwWbx9RSKB1RwP6XV484t1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fP2x4Dr5; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fP2x4Dr5"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8f186025973so17505926d6.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 20:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784862574; x=1785467374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZKTCXF/tmm1k6Q5PQprjlt9Nwn+IGAV+hY+3OBnNwY=;
        b=fP2x4Dr5uK6cPZklrKhL3Xmb/it1oFGVGQ5awKBYptep2YhMWyoKZsiiaDkGCvGRCC
         i4nVa7pZSWdvMcb1NyjZgkt6v9G+K/O3nsF+SgctegB8yqAJQ9sA9VVeTAZ7VQqy532g
         Sdd8Lsr3U1ahACnHPMgBV1woTXaHHK0glltwb4j2SoBIeC83ksz7sK4Zy+xtWlHwRVgs
         ix8soyLVBNdY+9F1dAUv/iQR+qwc9nt1xcShqZ624lXDkOnCLdtSv5KyhRtH2J2HrAw3
         OzAPII/evjZsOezhpTXcd/g1icIHZwRC9tKzN39edoFRz2kBV4Y/+YYFLGdlWTf8TrXq
         XWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784862574; x=1785467374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZKTCXF/tmm1k6Q5PQprjlt9Nwn+IGAV+hY+3OBnNwY=;
        b=QCVFYp/gZmdFiHM2+rsjSQZGITqjg8Nn4Yyo2+NSH6FpizukgX6VvMgiXxToD3Skb1
         kR2EE8142oj+2fTcgA28MWwCj/VZ2znrSKryb/kPXb2qXnrRqoAXG41aqyT8ZWekj6CO
         E0CoRh6LcvG2SZJH/EQPzm/9gyi6J1o+ovoRg9iEJZZzc8YCRcidDTfw7uhTqUipPpNC
         6CERVm1WDXEWjY5dL27CQbZCWEfEv+QGuMkYJuZEL9mH7C3dh0epO+J8gWJWQIF8I+D9
         Rn/PTBNlR7OIrdUR4lQd7cU4Bu1hJODFsKARYl2YO9DHNTi8g4ZNLOYA7mJIvoQZ4E/s
         squg==
X-Forwarded-Encrypted: i=1; AHgh+RqVZIOIAwIwG6JuHLKl+YhkelSkLfVdDrV+iZkTREopyQrFrT2g9+1hO9FrFDvQWYvSppQsuaSF6rdCtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmXgI52ryCL8nhXj8z2sZxfMEONy7CzSfQW8yidIXFzGMfqdfl
	GdbnGl2Utj2rn6f8pY1mVEqoi6ra6wDfhHtDcC1hz3QNiNPh8d6oeWr+
X-Gm-Gg: AR+sD12v8nYxKT7iaH9nyUTidrAPhrnik0LZnj9FzBYzr1ojUJTirOZ7YriyNeHgCnC
	fYPn4Qo31CJ5kNGemxhwKyLtXK3zExRQO4qF1x37jcFXK74hTDrcF8o4UhHUFWvX0Tn47wK/eFx
	1Ea9vDCc7BejCFd4/PbAR4dBsE9w2LaULlpaG4f1eOiM9Gq4iBuFMlnAG/A84V89w8hn78BQVmN
	Nm22Z+QI/4bFPNfdUNgOfAcpDb2nRQtF/kkWooN3HRqpgzzc/iGLcDjKh46KVaCyQJc9YZo8L4O
	4+A68Gveyr0NVnGG7uj15ZNw0U9BJh/B6QJRJ+BA3/RyPLYsm0VRJG6h0ApAIVn25RXw5Vy2Sdk
	8cyKXmSbz4dF9TY1NIsUcQwWvNv1YQBAskudb4aFWR82OiUlguiFw1Txx++iAwtRjmSELMHiQEw
	gK8moXfHn6zfYR1kZLvZmZr3jNVdqCYoxFAtsYvXXKOQ==
X-Received: by 2002:a05:6214:40d:b0:8dd:3b9a:ddc2 with SMTP id 6a1803df08f44-907ca3562eamr66625436d6.41.1784862574157;
        Thu, 23 Jul 2026 20:09:34 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27361sm58833186d6.43.2026.07.23.20.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 20:09:33 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] ALSA: usb: 6fire: KASAN slab-use-after-free in dummy_timer
Date: Thu, 23 Jul 2026 23:07:50 -0400
Message-ID: <20260724030900.1984491-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in dummy_timer

on commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a (2026-07-16)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/a410bc05b4f22d1ba4ce7ef059043fea

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  400.891255][    C0] BUG: KASAN: slab-use-after-free in dummy_timer (drivers/usb/common/usb-otg-fsm.c:393)
[  400.891273][    C0] Read of size 4 at addr ffff8881789bc20c by task kworker/0:2/773
[  400.891276][    C0]
[  400.891291][    C0] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  400.891294][    C0] Workqueue: usb_hub_wq hub_event
[  400.891299][    C0] Call Trace:
[  400.891301][    C0]  <IRQ>
[  400.891302][    C0]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[  400.891306][    C0]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[  400.891322][    C0]  kasan_report (mm/kasan/report.c:595)
[  400.891330][    C0]  dummy_timer (drivers/usb/common/usb-otg-fsm.c:393)
[  400.891397][    C0]  __hrtimer_run_queues (kernel/time/hrtimer.c:2032 kernel/time/hrtimer.c:2096)
[  400.891403][    C0]  hrtimer_run_softirq (kernel/time/hrtimer.c:2113)
[  400.891414][    C0]  handle_softirqs (kernel/softirq.c:622)
[  400.891420][    C0]  __irq_exit_rcu (kernel/softirq.c:656 kernel/softirq.c:496 kernel/softirq.c:735)
[  400.891423][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 arch/x86/kernel/apic/apic.c:1062)
[  400.891427][    C0]  </IRQ>
[  400.891428][    C0]  <TASK>
[  400.891579][    C0]  really_probe (drivers/base/dd.c:644 drivers/base/dd.c:706)
[  400.891582][    C0]  __driver_probe_device (drivers/base/dd.c:868)
[  400.891585][    C0]  driver_probe_device (drivers/base/dd.c:898)
[  400.891588][    C0]  __device_attach_driver (drivers/base/dd.c:1026)
[  400.891593][    C0]  bus_for_each_drv (drivers/base/bus.c:500)
[  400.891615][    C0]  __device_attach (drivers/base/dd.c:1098)
[  400.891631][    C0]  device_initial_probe (drivers/base/dd.c:1153)
[  400.891634][    C0]  bus_probe_device (drivers/base/bus.c:620)
[  400.891637][    C0]  device_add (drivers/base/core.c:3772)
[  400.891641][    C0]  usb_set_configuration (drivers/usb/core/message.c:2268)
[  400.891647][    C0]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
[  400.891651][    C0]  usb_probe_device (drivers/usb/core/driver.c:291)
[  400.891653][    C0]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:706)
[  400.891656][    C0]  __driver_probe_device (drivers/base/dd.c:868)
[  400.891663][    C0]  driver_probe_device (drivers/base/dd.c:898)
[  400.891665][    C0]  __device_attach_driver (drivers/base/dd.c:1026)
[  400.891671][    C0]  bus_for_each_drv (drivers/base/bus.c:500)
[  400.891685][    C0]  __device_attach (drivers/base/dd.c:1098)
[  400.891704][    C0]  device_initial_probe (drivers/base/dd.c:1153)
[  400.891707][    C0]  bus_probe_device (drivers/base/bus.c:620)
[  400.891710][    C0]  device_add (drivers/base/core.c:3772)
[  400.891714][    C0]  usb_new_device (drivers/usb/core/hub.c:2695)
[  400.891726][    C0]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
[  400.891743][    C0]  process_scheduled_works (kernel/workqueue.c:3322 kernel/workqueue.c:3405)
[  400.891748][    C0]  worker_thread (kernel/workqueue.c:3486)
[  400.891756][    C0]  kthread (kernel/kthread.c:436)
[  400.891764][    C0]  ret_from_fork (arch/x86/kernel/process.c:158)
[  400.891790][    C0]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
[  400.891795][    C0]  </TASK>
[  400.891797][    C0] Freed by task 773 on cpu 0 at 400.890164s:
[  400.891805][    C0]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[  400.891813][    C0]  kasan_save_free_info (mm/kasan/generic.c:584)
[  400.891821][    C0]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[  400.891824][    C0]  kfree (./include/linux/kasan.h:235 mm/slub.c:2705 mm/slub.c:6405 mm/slub.c:6720)
[  400.891827][    C0]  usb6fire_comm_destroy (sound/usb/6fire/comm.c:197)
[  400.891830][    C0]  usb6fire_card_free (sound/usb/6fire/chip.c:65)
[  400.891832][    C0]  release_card_device (sound/core/init.c:594 sound/core/init.c:153)
[  400.891852][    C0]  kobject_put (lib/kobject.c:689 lib/kobject.c:720 ./include/linux/kref.h:65 lib/kobject.c:737)
[  400.891855][    C0]  snd_card_free (sound/core/init.c:626 sound/core/init.c:658)
[  400.891858][    C0]  usb6fire_chip_probe (sound/usb/6fire/chip.c:153)
[  400.891860][    C0]  usb_probe_interface (drivers/usb/core/driver.c:396)


Best,
Shuangpeng
