Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B3F34EEF3
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 02:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116078; cv=none; b=k+zioqre6BatkXxef8yyR2GwiP1JLYcYB8w0aozUfed4Q71iZz599kCJtrDh3fWsYrPwd6JTfqkJwFQ76qy4SZjCIjXe32d3Pe+s5jjpAw+TRvh2UBR59yuDKVxDfZM9KUBHNVe5e8OdDGG8rx4q7a+UUUkIr5Ery7m5kEVwEQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116078; c=relaxed/simple;
	bh=65AqGjxhOZx9FQ0DKwobjHhSE3SEKFrJbHCP5nWSyjI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qMsxV0QGLvRgdQ8sSoHxVvuzc7LnTGgb7euJ0uv49v29+a7vfuxkdnELPv8ZeU5rlcSQ9DVN48cc2XcxfO6G82AyMmEIYeknUBIqs6MxmHpcrCQTJXt9Wpjj/uaCQT20TSjClrrQQovyD3/fH7ikzsndNJcuDx0Tv2z0haNZ+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMWrTdSK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMWrTdSK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso4713504a91.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 19:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792116076; x=1792720876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqDgs1zPGZOZDJLG/L08pzRlikclUGO5IX6M7MyI22g=;
        b=DMWrTdSKK3xWtPVDeBKedgBosxfeNZPvflbG7uTFyMTxaSjbscekk5hpZouwlsM69U
         hUQiCqwaUykk9DVw8scc4LF1QlzOQwR+DKYpj23hfqEKbrEesmFyvbiuUTOZ7eHp6f/d
         RlpO8emu2Zt2uLebSSytk+trsCmw01UKLLjwjGRvOkKKumqKlgmTAWG+MeWJJNiwXLlq
         1AK59K0BcOZw1ZDtHwEifCyahpo29ea7hyVxybz9rPoMmQ/7crm1VuwSSiq5cpvxC/AT
         o821PNL/rc0TpeC6J1sWSFUd1dAFiSkkSYARGsFoz/CYbL24fj2cCpIPtutat6ttCTdc
         ukJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116076; x=1792720876;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqDgs1zPGZOZDJLG/L08pzRlikclUGO5IX6M7MyI22g=;
        b=yNkHemQ3nm5L4PHRNvE0x4fCSOvIPEX3IY6kqwO6TVMWGMRnQq/2e7CFw1hxYR+cOk
         uhT3fEn3x4XKTHt2zSAldeDc1edlxIYvI3pZExLqvzx/lfuujQhw2ZqTx/xWt6SXEooO
         UYwK4cldXZLfZUQz4nrJzIhxGDOyXnV5Suqmy9SLQbUIdZWhKtQgi5TKppmcz+Rjeqs2
         LvlOd+9l5fprsYqIW5eCfUAvjCDCg9GoTDpU/4+NN8Ow/vVC7TrKXajtRvWSZDfYbQA9
         ZxUFiXFDbnTvBs8d5i84nkGmvwrnG9vgFRdpLs9A3gz5n1++MpZLUtDhErI5hO5nmrOa
         hUjQ==
X-Gm-Message-State: AFq9FYL2sBNOpsq4BSGiXUDtX3PUtxo6su8ne8fDonYf8OiQNa2oy/Mq
	cCQoJI+Z3ZTcCaZ1RIRcC6lhJmge8h6HCFU57XhuylFGpk02EK0Lzd8y
X-Gm-Gg: AYBFou1dxVEipdQyHOEFZr+FOaX0Btoz9zHfLsXs5xtd3hb32P7WH0oYMg3yWLtCj8m
	NcLZ1jSOTqaKcwBr8+km+i9gDhcmnzHoVeMtzqOf0nyrCZFBC1MljHloqLONnvrETL7KAeB+563
	P1wGBgaLlu/athPT4NtLsRvdRp+mEF3knaIbUBv+ayAmcnDDs7eo9OAahXGKtWs4WMIRf+BSjJl
	YWrsNpI1ZwWueLLIIkzGt4secRXcplHjNw4m39CTzSHy65Lb5t2qwcB4pUJpRWQFU3x3rU5yTPS
	qOLqLF7GrUGu0B32KIBCu72mAAAncus+7hV6113cg3+wCxAEUCPAJeaDCvZYz3GV3XzA2fW9dbK
	zqVWIhr/dj/qQB1zjaD/GsGPgxTlPRimLFoiu6bX1k81r78NNQ5bQRyW1G8jSaxSlgATTZ7aKE8
	nXIQW8UZffkrRJBvfJ2e3X5DaeiENWRCuT4uf6BV1lenhh2e3mTeidn2knm0HHZyl25A==
X-Received: by 2002:a17:90b:2d86:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ab3a33d959mr18996802a91.4.1792116075921;
        Thu, 15 Oct 2026 19:01:15 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f19d9sm1695362a91.11.2026.10.15.19.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:01:15 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	thomas.weissschuh@linutronix.de,
	kees@kernel.org,
	phucduc.bui@gmail.com,
	sammiee5311@gmail.com,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: dummy: Refresh the CD capture switch before use
Date: Fri, 16 Oct 2026 10:01:10 +0800
Message-Id: <pm-pmb-7364ede2179b8830f660-v2-ca37049bc2e3679bb65f@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CD Capture Switch control must remain live while
snd_dummy_iobox_put() updates its access flags and uses its ID for
notification. snd_card_dummy_new_mixer() caches the control pointer, but
snd_ctl_remove_id() can unlink and free it without updating that cache.

This requires a kernel caller to remove the switch while the dummy card
stays connected and External I/O Box remains writable. Userspace
ELEM_REMOVE rejects this driver control because it lacks
SNDRV_CTL_ELEM_ACCESS_USER. With I/O Box initially 1 and CD Volume still
present, the following ordered sequence is possible:

  1. snd_ctl_remove_id() takes controls_rwsem for write, finds and
     unlinks CD Capture Switch, sends removal notifications and calls
     snd_ctl_free_one(), then drops the semaphore and returns.
  2. After removal returns, snd_ctl_elem_write() takes the same
     semaphore for a write changing External I/O Box from 1 to 0 and
     invokes snd_dummy_iobox_put().
  3. The callback reads and writes cd_switch_ctl->vd[0].access and
     notifies with cd_switch_ctl->id through the stale pointer.

The semaphore excludes overlapping removal and callbacks, but it does
not keep a control freed by an earlier call alive. The access update
therefore reads and writes freed memory, and notification can read the
freed control's ID.

Refresh the CD Capture Switch pointer with snd_ctl_find_id_mixer()
inside the callback's existing write-locked interval. Return -ENOENT
before changing I/O Box state if the control is missing. If found,
controls_rwsem keeps it live through the access updates and
notifications.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in snd_dummy_iobox_put+0x506/0x530 [snd_dummy]
    Read of size 4 at addr ffff88810d481e98 by task amixer/424

    CPU: 3 UID: 0 PID: 424 Comm: amixer Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_dummy_iobox_put+0x506/0x530 [snd_dummy]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_dummy_iobox_put+0x506/0x530 [snd_dummy]
     kasan_report+0xe0/0x110
     ? snd_dummy_iobox_put+0x506/0x530 [snd_dummy]
     snd_dummy_iobox_put+0x506/0x530 [snd_dummy]
     snd_ctl_elem_write+0x385/0x600
     snd_ctl_ioctl+0x997/0xdd0
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     ? __pfx_do_sys_openat2+0x10/0x10
     ? __fput+0x5ba/0xa60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f42617ce91b
    Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
    RSP: 002b:00007fff3cb99b60 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f42617ce91b
    RDX: 00007fff3cb99bd0 RSI: 00000000c4c85513 RDI: 0000000000000003
    RBP: 00007fff3cb9a270 R08: 1fffffffffffffff R09: 0000000000000000
    R10: 00007f426184efe0 R11: 0000000000000246 R12: 0000000000000000
    R13: 00007fff3cb9a0f0 R14: 0000000000000000 R15: 00007fff3cb9a0a0
     </TASK>

    Allocated by task 415:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_noprof+0x2d7/0x770
     snd_ctl_new+0x51/0x190
     snd_ctl_new1+0x13c/0x650
     snd_dummy_probe+0xba0/0x1250 [snd_dummy]
     platform_probe+0xbe/0x1d0
     really_probe+0x21f/0xa90
     __driver_probe_device+0x1ec/0x490
     driver_probe_device+0x4f/0x130
     __device_attach_driver+0x1d2/0x2e0
     bus_for_each_drv+0x155/0x1d0
     __device_attach+0x1c3/0x490
     device_initial_probe+0x96/0xb0
     bus_probe_device+0x69/0x160
     device_add+0xfff/0x1700
     platform_device_add+0x318/0x7b0
     platform_device_register_full+0x596/0x7b0
     remove_cd_control_exit+0x12a/0xf90 [remove_cd_control]
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 423:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     __snd_ctl_remove+0x2ac/0x400
     snd_ctl_remove_id+0x60/0x120
     0xffffffffc04060ef
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff88810d481e00
     which belongs to the cache kmalloc-192 of size 192
    The buggy address is located 152 bytes inside of
     freed 192-byte region [ffff88810d481e00, ffff88810d481ec0)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10d481
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff8881000423c0 dead000000000100 dead000000000122
    raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff88810d481d80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
     ffff88810d481e00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    >ffff88810d481e80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                ^
     ffff88810d481f00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff88810d481f80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
    ==================================================================

Fixes: 16e434670e95 ("ALSA: dummy: allow disabling mixer controls")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 6b0a06e5c87638264e5d22deda1fe4bc028febe7..743e7bf28502d026840e8fcc4cac7187f4fade98 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -843,6 +843,12 @@ static int snd_dummy_iobox_put(struct snd_kcontrol *kcontrol,
 
 	changed = value->value.enumerated.item[0] != dummy->iobox;
 	if (changed) {
+		dummy->cd_switch_ctl =
+			snd_ctl_find_id_mixer(dummy->card,
+					      "CD Capture Switch");
+		if (!dummy->cd_switch_ctl)
+			return -ENOENT;
+
 		dummy->iobox = value->value.enumerated.item[0];
 
 		if (dummy->iobox) {
