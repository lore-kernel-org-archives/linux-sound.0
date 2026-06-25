Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A93CFF4C
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383136; cv=pass; b=s7+oCMz+ArwQwSKt65jpTMBClnlukY5O5UnPqR7jjScxP2v0y1KS7qZYcRxQEuV8k7byJ/KAljZLPr0OyE1v0+Ihgt5qDTMx4ASNEJf8LmKvVOHwwbuAG0jQ/2wYo2Hfg/4lpRM5xbM2Q9Lhi8zva9oyhGTPo2Dj09CGWB3R4y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383136; c=relaxed/simple;
	bh=2qjuqct0DbZp+Jq8d4rWLH77OOBJpwRYNp0N7bh0N8o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nMCM+AsW/s/+oNJU1mf6zVrNL9vYCfBz7LwhdE5mFduNGDEBGSXpiaaRy5l/a4VCmdsV3jmh5Z68rzhS65j+ykmkmR/VW/ZRVlT4YahvY9gisMAdQUckx60TYpePao9EWLMCAuKirTfmhDxImuRlxP8GDexCoaFEpdbXuAXgtIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQOHLiy5; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQOHLiy5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bdb3fd39045so372942166b.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 03:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782383134; cv=none;
        d=google.com; s=arc-20260327;
        b=FQOoA5azUMzRLxDy4MSRJFRUnG1uvYVSA5XB3udjYRchVgSsq+fne8PIo0RGSIltla
         3+nCVWpjHvrgzgpoixrtY8cetHzGiAi+wvz6gVxyH9xWnampzgwUu54W8DMasX0Y0y7h
         zRT2CUUayky4p4O6AcIGoKw1F4QQmMUMCwbeHfgJvHRrQLEyX14xNJyy9doTNp3Lji7Y
         WJTTDCTl6HYwObCzb5aiiY9TzgZgWcJaXikIVu6RBciEEuWrLNQOTu3qW2mO2XqdAYlI
         3cfbrfb3ASMhHIgJZmaFfuGkyci3d783Vr6PXX80F2W4GOWCtO5DTGZ8HnF6MBOwXWAy
         Hbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lwaWQk7FKVt1HHjSohw0BKP4AUy2y+kC80aSgdgNl+U=;
        fh=N7k0fCN//9bBvRzXZ4sI2NVqAvAtkYLouIeMmX8v3Ik=;
        b=YIf8HSyK4DYcMBJQ412WcIcOs+AWqFxaFBgo/HN4gGsGHB+UJKPOqqMff/kU+T2Zkj
         YdiwY71AiILgoIYBSIEOaWuX1rpdelsn4LgMAaK8rHW3vPNaYc1kQRVgRsyZ7C4k1Nk1
         7jV6BhMJwo6hKn0itDAq/XdtY2kkI3L/8roe9zFE82o47DAxG60/D4jrMM9b1Fd3hMpj
         CPbQ1gkBgUgROnRjjdQh7vwO7efKaoMGLxMCtVnjZOZfCgFTUdSpfyzDEjA3+4Prx309
         tovrz3gDZLkZcQenM4907xcIUfG79z5NJcxVJH9OL03qtSN8Wz2uv4Q85lNclla4VWRZ
         5zYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383134; x=1782987934; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwaWQk7FKVt1HHjSohw0BKP4AUy2y+kC80aSgdgNl+U=;
        b=dQOHLiy5vjPKiC36osEKULW7D4Ou7j/+D9/Y3+Kra0Z0OnR8dsObo/l4xD27+ZyAU2
         95a1pXdJPcCewi2glGd2RjasSOgb6BV9lGq4O/o3vDOxOub0YS4wPHyDn+ECC1uPY/BV
         sq6F7abUa6F6SvLYRWVmU7HVIVdXv6+2RKDmTFYTdIQMohLlcx28jh0bXE/chy8JCPij
         /cQGRzTriONyoAzjnIK/YbSdttwubWB+mj41yayrLHSsUWR/WQ4hH50KDG34IccFXvzg
         QmqfaUVN4tY/SVCsY3eNBOsQTxHGCmUpSz0dwxj3qmtIk8leaFEpAb/P5UHmIDIc1XYy
         /0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383134; x=1782987934;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwaWQk7FKVt1HHjSohw0BKP4AUy2y+kC80aSgdgNl+U=;
        b=OeaQaej/H2G/AkKLH3A0N6DX4MW0oYCN/eMVu45JbAMDSXSHBqC9BNZlz9liXrcY4F
         yJk0Qan+MU26q9TWiI52l1zcHvWYtkgxZv4RGGgrjZ+0hOCO7/PB37pQrPTyGNfF+LUq
         JV2iN2ZhcdRUPmpIg/Ep8OckFqFH/zvmbiIHS4DocZWa0/5f6CiERgyRqVE2ErIaD/0S
         O6/zPjGOwqUbJpINJUZCx9gmNJGS0crhEvIO5GhdqGlHgL8rkHfQiexB3f/bCF1Vnh8+
         dEAvB2LLN6SJR9MNo9tNS/ji7ZyaToVHvOs+WS3JxwR0kxp5BaCiBJmQ6cu6AuXSYM4n
         FWgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZb0o/KvkkJGFK9s0Pwk1J95tz0dpaOkNKkhBuu6QKLpT1E9pl1zeubzbFD5N8gy9NCQx6uYec3l+nyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0GCb41KYVO8AYJ7oYez3RfEvaMXJntfh+Zo36uBdW3hTE78N
	Wo+CGnWJHqCbK/K/37d7+0a4jLT57xmpv3ykqVYymmgL55AbKai9sS8FSxOH2A8zXcQ5NP1e4Lu
	CfRDEw2Xcb6Ym5jOy1bC1WPYcFUb2JTI=
X-Gm-Gg: AfdE7cl2ETCORaZOld94eh84+OJV3Qi57cmrERu2GcijjYkbOM6kkgXkJyFVpMwTHlI
	B20bQAkKRKL5ZYKqRwZfUsu+Dbw72FprJg4974Mo18rh31BPPKAjWnfcN3yUTf5vrtb1cGFSWqc
	pgs0AqikM92peknuGef1RPCOIQ1JFH50zGOtNlAd8Q8wGz3YhZjZMc8sg6CEoKTxVeuCsILQCTE
	Sj1YIR+4ab40AkuYQ1IyYJDwiLUqIQ1l8ZBD5+B2uEztqIrgWGFAwnbnY0aVYjbuhT4X4DnXcMW
	Obg9QAg5
X-Received: by 2002:a17:907:e112:b0:c12:d67:c2f1 with SMTP id
 a640c23a62f3a-c120d67c6ffmr33102066b.53.1782383132861; Thu, 25 Jun 2026
 03:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Zhang <r772577952@gmail.com>
Date: Thu, 25 Jun 2026 18:24:49 +0800
X-Gm-Features: AVVi8CcEXpmLPE85ElHAUhKTzUB9v9uaknct1fJy9YQSz6i0uZbW0Evumsrx2CI
Message-ID: <CANypQFb1EHj0xX8bA1WxSOSK-5xca6ZNKzOQcp12=s=puY7VFw@mail.gmail.com>
Subject: [Linux Kernel Bug] general protection fault in snd_fcp_init
To: g@b4.vu, perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Cc: syzkaller@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux kernel developers and maintainers,

We are writing to report a general protection fault discovered in the
sound subsystem with our modified syzkaller. The issue is reproducible
on the latest version of linux (v7.1, commit
8cd9520d35a6c38db6567e97dd93b1f11f185dc6). Below is the KASAN report:

---
input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input1
input: ImExPS/2 Generic Explorer Mouse as
/devices/platform/i8042/serio1/input/input3
faux_driver regulatory: Direct firmware load for regulatory.db failed
with error -2
faux_driver regulatory: Falling back to sysfs fallback for: regulatory.db
cfg80211: failed to load regulatory.db
usb 1-1: Using ep0 maxpacket: 32
usb 1-1: unable to get BOS descriptor or descriptor too short
usb 1-1: config 1 has an invalid descriptor of length 0, skipping
remainder of the config
usb 1-1: config 1 has 2 interfaces, different from the descriptor's value: 3
usb 1-1: New USB device found, idVendor=1235, idProduct=821d, bcdDevice= 0.40
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 801 Comm: kworker/0:2 Not tainted 7.1.0 #14 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:483 [inline]
RIP: 0010:fcp_find_fc_interface sound/usb/fcp.c:1089 [inline]
RIP: 0010:snd_fcp_init+0x42a/0x920 sound/usb/fcp.c:1112
Code: 9a 88 01 00 00 48 89 d8 48 c1 e8 03 42 0f b6 04 38 84 c0 4d 89
fc 0f 85 bc 03 00 00 44 88 33 49 8d 5d 02 48 89 d8 48 c1 e8 03 <42> 0f
b6 04 20 84 c0 0f 85 c0 03 00 00 44 0f b6 33 41 80 e6 0f 48
RSP: 0018:ffffc9000441e760 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: ffff888026b71c00 RSI: 00000000000000ff RDI: ffff888041f68b20
RBP: ffffc9000441e850 R08: 0000000000000003 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed1004d6e38b R12: dffffc0000000000
R13: 0000000000000000 R14: 0000000000000001 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888098af7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055efe3be0ff0 CR3: 000000004b5a7000 CR4: 0000000000752ef0
PKRU: 55555554
Call Trace:
 <TASK>
 snd_usb_mixer_apply_create_quirk+0x1579/0x1a70 sound/usb/mixer_quirks.c:4454
 snd_usb_create_mixer+0x1ae6/0x27c0 sound/usb/mixer.c:3802
 usb_audio_probe+0x1892/0x2310 sound/usb/card.c:1035
 usb_probe_interface+0x659/0xc80 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xb10 drivers/base/dd.c:709
 __driver_probe_device+0x1f7/0x420 drivers/base/dd.c:871
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1029
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b7/0x430 drivers/base/dd.c:1101
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1156
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7e9/0xbb0 drivers/base/core.c:3706
 usb_set_configuration+0x1a5c/0x20f0 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3c0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xb10 drivers/base/dd.c:709
 __driver_probe_device+0x1f7/0x420 drivers/base/dd.c:871
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:901
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1029
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b7/0x430 drivers/base/dd.c:1101
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1156
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7e9/0xbb0 drivers/base/core.c:3706
 usb_new_device+0xb9d/0x1a30 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2885/0x4cf0 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb4b/0x1840 kernel/workqueue.c:3397
 worker_thread+0x8a3/0xda0 kernel/workqueue.c:3478
 kthread+0x38a/0x480 kernel/kthread.c:436
 ret_from_fork+0x509/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
Dumping ftrace buffer:
   (ftrace buffer empty)
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:483 [inline]
RIP: 0010:fcp_find_fc_interface sound/usb/fcp.c:1089 [inline]
RIP: 0010:snd_fcp_init+0x42a/0x920 sound/usb/fcp.c:1112
Code: 9a 88 01 00 00 48 89 d8 48 c1 e8 03 42 0f b6 04 38 84 c0 4d 89
fc 0f 85 bc 03 00 00 44 88 33 49 8d 5d 02 48 89 d8 48 c1 e8 03 <42> 0f
b6 04 20 84 c0 0f 85 c0 03 00 00 44 0f b6 33 41 80 e6 0f 48
RSP: 0018:ffffc9000441e760 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: ffff888026b71c00 RSI: 00000000000000ff RDI: ffff888041f68b20
RBP: ffffc9000441e850 R08: 0000000000000003 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed1004d6e38b R12: dffffc0000000000
R13: 0000000000000000 R14: 0000000000000001 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888098af7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005645e3e76808 CR3: 000000000e14a000 CR4: 0000000000752ef0
PKRU: 55555554
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:   88 01                   mov    %al,(%rcx)
   2:   00 00                   add    %al,(%rax)
   4:   48 89 d8                mov    %rbx,%rax
   7:   48 c1 e8 03             shr    $0x3,%rax
   b:   42 0f b6 04 38          movzbl (%rax,%r15,1),%eax
  10:   84 c0                   test   %al,%al
  12:   4d 89 fc                mov    %r15,%r12
  15:   0f 85 bc 03 00 00       jne    0x3d7
  1b:   44 88 33                mov    %r14b,(%rbx)
  1e:   49 8d 5d 02             lea    0x2(%r13),%rbx
  22:   48 89 d8                mov    %rbx,%rax
  25:   48 c1 e8 03             shr    $0x3,%rax
* 29:   42 0f b6 04 20          movzbl (%rax,%r12,1),%eax <-- trapping
instruction
  2e:   84 c0                   test   %al,%al
  30:   0f 85 c0 03 00 00       jne    0x3f6
  36:   44 0f b6 33             movzbl (%rbx),%r14d
  3a:   41 80 e6 0f             and    $0xf,%r14b
  3e:   48                      rex.W
---

The root cause is that the malicious USB device provides a
vendor-specific interface with no endpoint descriptors. During USB
descriptor parsing, no endpoint array is allocated for that alternate
setting, so altsetting->endpoint remains NULL. fcp_find_fc_interface()
does not check bNumEndpoints before calling get_endpoint(..., 0), and
the resulting endpoint descriptor pointer is later dereferenced by
usb_endpoint_num(), leading to null-ptr-deref.

A potential fix is as follows:

```
diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 0fc4d063c48a..c45dbe4d4532 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -1083,6 +1083,8 @@ static int fcp_find_fc_interface(struct
usb_mixer_interface *mixer)

        if (desc->bInterfaceClass != 255)
            continue;
+       if (desc->bNumEndpoints < 1)
+           continue;

        epd = get_endpoint(intf->altsetting, 0);
        private->bInterfaceNumber = desc->bInterfaceNumber;
```

On my machine, the reproducer no longer triggers the issue with the
above patch. If this solution is acceptable, we are happy to submit a
formal patch.

The kernel console output, kernel config, syzkaller reproducer, and C
reproducer are also available at google drive:
https://drive.google.com/drive/folders/1hE9rfMe-sNFwcrt_tPLiwzpYD1iJ7Hma?usp=sharing

Please let me know if any further information is required.

Best Regards,
Jiaming Zhang
