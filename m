Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725C4CB57
	for <linux-sound@vger.kernel.org>; Mon,  1 Apr 2024 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711990283; cv=none; b=bocoJTzsKPDURLGEdorhhtdlLO+JqhBI6SDziej7d4d2ajpA0RoglXC9jwPwzg/P0yJ3zTvH2mFp8XEFFvjc1X7YYLQm3rA9LLK/byxEmJ+s6KrTL9yzYVjqv25RhhPqo0sz6VYfpprYYSr7Wz29fjLFlqXSTdU2Z1zTaqYr9YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711990283; c=relaxed/simple;
	bh=b134JAC77FMnO5VxlSudPyxdcglNfx4NfOslCHwS9aI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=W+A490VyfO1GFrTOYsjb6pmE6y+GwpjJG6LWcFMaAgVLc9mqR00aFjzuXqSSQfzB3P1+sbFpKf67UO+t3SmBfH0k2efi0BrNmdpQhdfGPUVog00P2SK0qWOmlHBdDCx+caRzV8eBiYBc88Hx4S5jxJofk5nnr/MDIPXdyoqk/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7cc7a6a043bso533860639f.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Apr 2024 09:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711990280; x=1712595080;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkvjymxxg5wlu7KGiYlh9jDRJahjKEj0y/WHqrnneu0=;
        b=N1UAU4c70L7tU1s6mZgl2FpH6SFnhghZfijan+wb2UyLjeLHO7CsP4Fc2C/QmHIQwf
         FN7WS64zbKENGbMDEhl/otkwe6xM4XQV7g4oEd6DUkHB6U08FwEraz/DwFNfLnQcOuzc
         bi3CoTZmIIU7/iHqzq7N84CuwbmqiXoxf1ipExGjPYj1AKdiTx7nmyAuHxOOENjVUgus
         G0KZON/FMpGE6wibdC/zdcnxLUxlzGy4TlJiAbrLWjm5PyiwG/iVjf/FR37ZS9xeU6Sv
         r8Sc+Uyss3jHUSx6guB7Ext8KWTMIF6XP7B61MlkL5T5SaNYhr6C2ezKOEphHzk+vViH
         c++w==
X-Forwarded-Encrypted: i=1; AJvYcCWHDCTE3pj2HSKK0NRGi0auCQx3KHXXyVR9fmPkEd0eRSzs1K0haX0rVwo/T6uiwUcRh8w1s8ckU/C6TAdy2o3j0umLlvkX+VXi3hU=
X-Gm-Message-State: AOJu0Yw0ZEByXwBtyJLTHWl8iUSIR9k2pNnjfsNaASBqPyLSsIT/730I
	p/ofaCFW4iwRFr6GnDByFTy5RIq82zLKxXgvkNZfXyuTVQz/s3P0kS1pFS3B4b5AKRu3LK5Yx0X
	GQ8sOWca+kMF38MFO/QERJ1D45Ar1U9TwZ798onG7PbfWnnitJw0PY1c=
X-Google-Smtp-Source: AGHT+IHuZEWF0jczVQEcF2HgEW+9ZuUksHzQYEfFom9Q8LAyfWKK2icbujwxHY3HN0STsFrW/OMRYE0qXziSWD3zwHJdN1v4R5Yj
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c90:b0:7cc:8980:5ae4 with SMTP id
 i16-20020a0566022c9000b007cc89805ae4mr551496iow.2.1711990280332; Mon, 01 Apr
 2024 09:51:20 -0700 (PDT)
Date: Mon, 01 Apr 2024 09:51:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000084b18706150bcca5@google.com>
Subject: [syzbot] [usb?] [sound?] KMSAN: uninit-value in line6_pod_process_message
From: syzbot <syzbot+7fb05ccf7b3d2f9617b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    486291a0e624 Merge tag 'drm-fixes-2024-03-30' of https://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13ab1129180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2599baf258ef795
dashboard link: https://syzkaller.appspot.com/bug?extid=7fb05ccf7b3d2f9617b3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1299932d180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1101e52d180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ea2c2e416c4f/disk-486291a0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/83fdaf5e5783/vmlinux-486291a0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f674430b191/bzImage-486291a0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7fb05ccf7b3d2f9617b3@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in line6_pod_process_message+0x72f/0x7b0 sound/usb/line6/pod.c:201
 line6_pod_process_message+0x72f/0x7b0 sound/usb/line6/pod.c:201
 line6_data_received+0x5db/0x7e0 sound/usb/line6/driver.c:317
 __usb_hcd_giveback_urb+0x508/0x770 drivers/usb/core/hcd.c:1648
 usb_hcd_giveback_urb+0x157/0x720 drivers/usb/core/hcd.c:1732
 dummy_timer+0xd93/0x6b10 drivers/usb/gadget/udc/dummy_hcd.c:1987
 call_timer_fn+0x49/0x580 kernel/time/timer.c:1793
 expire_timers kernel/time/timer.c:1844 [inline]
 __run_timers kernel/time/timer.c:2418 [inline]
 __run_timer_base+0x84e/0xe90 kernel/time/timer.c:2429
 run_timer_base kernel/time/timer.c:2438 [inline]
 run_timer_softirq+0x3a/0x70 kernel/time/timer.c:2448
 __do_softirq+0x1c0/0x7d7 kernel/softirq.c:554
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:633 [inline]
 irq_exit_rcu+0x6a/0x130 kernel/softirq.c:645
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0x83/0x90 arch/x86/kernel/apic/apic.c:1043
 asm_sysvec_apic_timer_interrupt+0x1f/0x30 arch/x86/include/asm/idtentry.h:702
 native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
 arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
 acpi_safe_halt+0x25/0x30 drivers/acpi/processor_idle.c:112
 acpi_idle_do_entry+0x22/0x40 drivers/acpi/processor_idle.c:573
 acpi_idle_enter+0xa1/0xc0 drivers/acpi/processor_idle.c:707
 cpuidle_enter_state+0xcb/0x250 drivers/cpuidle/cpuidle.c:267
 cpuidle_enter+0x7f/0xf0 drivers/cpuidle/cpuidle.c:388
 call_cpuidle kernel/sched/idle.c:155 [inline]
 cpuidle_idle_call kernel/sched/idle.c:236 [inline]
 do_idle+0x551/0x750 kernel/sched/idle.c:332
 cpu_startup_entry+0x65/0x80 kernel/sched/idle.c:430
 rest_init+0x1e8/0x260 init/main.c:732
 start_kernel+0x927/0xa70 init/main.c:1074
 x86_64_start_reservations+0x2e/0x30 arch/x86/kernel/head64.c:507
 x86_64_start_kernel+0x98/0xa0 arch/x86/kernel/head64.c:488
 common_startup_64+0x12c/0x137

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:3804 [inline]
 slab_alloc_node mm/slub.c:3845 [inline]
 kmalloc_trace+0x578/0xba0 mm/slub.c:3992
 kmalloc include/linux/slab.h:628 [inline]
 line6_init_cap_control+0x4f1/0x770 sound/usb/line6/driver.c:700
 line6_probe+0xeae/0x1120 sound/usb/line6/driver.c:797
 pod_probe+0x79/0x90 sound/usb/line6/pod.c:522
 usb_probe_interface+0xd6f/0x1350 drivers/usb/core/driver.c:399
 really_probe+0x4db/0xd90 drivers/base/dd.c:656
 __driver_probe_device+0x2ab/0x5d0 drivers/base/dd.c:798
 driver_probe_device+0x72/0x890 drivers/base/dd.c:828
 __device_attach_driver+0x568/0x9e0 drivers/base/dd.c:956
 bus_for_each_drv+0x403/0x620 drivers/base/bus.c:457
 __device_attach+0x3c1/0x650 drivers/base/dd.c:1028
 device_initial_probe+0x32/0x40 drivers/base/dd.c:1077
 bus_probe_device+0x3dc/0x5c0 drivers/base/bus.c:532
 device_add+0x1475/0x1c90 drivers/base/core.c:3705
 usb_set_configuration+0x31c9/0x38d0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x109/0x2a0 drivers/usb/core/generic.c:254
 usb_probe_device+0x3a7/0x690 drivers/usb/core/driver.c:294
 really_probe+0x4db/0xd90 drivers/base/dd.c:656
 __driver_probe_device+0x2ab/0x5d0 drivers/base/dd.c:798
 driver_probe_device+0x72/0x890 drivers/base/dd.c:828
 __device_attach_driver+0x568/0x9e0 drivers/base/dd.c:956
 bus_for_each_drv+0x403/0x620 drivers/base/bus.c:457
 __device_attach+0x3c1/0x650 drivers/base/dd.c:1028
 device_initial_probe+0x32/0x40 drivers/base/dd.c:1077
 bus_probe_device+0x3dc/0x5c0 drivers/base/bus.c:532
 device_add+0x1475/0x1c90 drivers/base/core.c:3705
 usb_new_device+0x15ff/0x2470 drivers/usb/core/hub.c:2643
 hub_port_connect drivers/usb/core/hub.c:5512 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5652 [inline]
 port_event drivers/usb/core/hub.c:5812 [inline]
 hub_event+0x4ff8/0x72d0 drivers/usb/core/hub.c:5894
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa81/0x1bd0 kernel/workqueue.c:3335
 worker_thread+0xea5/0x1560 kernel/workqueue.c:3416
 kthread+0x3e2/0x540 kernel/kthread.c:388
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243

CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller-00274-g486291a0e624 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
=====================================================


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
