Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F842D8DB1
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013678; cv=pass; b=sRdrabvPNSZz/aga7kxpZBFobdoRv94MAetclRJffk2jbCl8+xJ2w43NbTYmZX6ivGSg7TFODElKGMMKfHm0c985nvPOLTR4bv3qZ6PP/Zzj/jfD/hTvhDm7kcvXAJB4LgDouQF9GttaZ6UprJeBxuQ95q/4+AOlk6Zcl+RaXlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013678; c=relaxed/simple;
	bh=eFc7+F26ZB7UX5OvlmYiDJ+p6szqG5f9fqunFVhyBKk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OIBb3c4LmMnMRc4qk89hjV517X/sgIZxvQlOUJL6Sef17DnLt5+O61yDCCCnZYvo3OZpRLHSE9kRm295kaDGsjS46Xf8lHEMRTj8woxY0nTjx0tXINp4MiYdwacqTZejhTv7rylQiRUdZ3mUaPqGbS6T8AXmgOHo9IE0osROw6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGYeztUm; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGYeztUm"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-894674a4c4aso75886876d6.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Feb 2026 22:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770013676; cv=none;
        d=google.com; s=arc-20240605;
        b=QlFLLK7F4NqmwjiJSn36YeulWXS1zPixPp/EdTsv4sekIMv2GTvQrHitvL5hlP4j41
         +VXT+mnkLLVG5RG1Edr7j05AYWiJBgnpd2EWai0e3DtzlLCTxDIelfGpHcHn89NLfEMI
         U9oag256b3FIi8RYun+EAiyjA/ekk3Uv46/QDXbtROvZtJwjFK8ccRVczbkLvUxSVJXb
         t9hVhD4NcI3m0exx7l4CV6fHtED00v1Q7+j4fdkhhLHUWhycRxw6QF2ooaZk6tcnbwAn
         jF4XI2RRHrdyZHteiuk/h496khuTbyrdtBCA8XfTahgIKaddQpT41SAxfBmIUuC1TaGW
         K40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iZnIp1lwHGUtXDV1MRZ1HULqBz4p5ioOR8qKhHkhHUo=;
        fh=Ur9WuU4bWaDaMPlMRZ2tOiZtyPV3E13IetzpXCIxwfY=;
        b=A5yhwfYSuIaZJJkqq6NYeSudqjQnT05xgUqKTP2AaPiJtzxbjveJxKz98BJXM91XFN
         ertblPUCCeLEa4oBMQe8HYjojbbcGPxur+uA/cvC3ySxboTf/MvwTzem+TlwxSg5lQpS
         mHC1y5oBIi8uPbU+jENcYukQupNhZVaRKqvywmGKCuPW4ijPdLnFpSulkWfnCN53M2FS
         P6sJoshtAISGWhVLhYnypqYNkATrrhbl4WROqQGzGCaEcOe2odq89eLnrwLafKGFBAI2
         qCsFoBBmut9pmeHhbN2YD1D2ZR9ZYnfjsWHPe4DmeX/KA5lNH5IhmVRVcHtszxUFYhIh
         fXgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770013676; x=1770618476; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZnIp1lwHGUtXDV1MRZ1HULqBz4p5ioOR8qKhHkhHUo=;
        b=XGYeztUmdIEfS8FuPdJ365PUFR4aKNJLNEPD7nZ/g4n/a07u+hOzzVOKVvofzFYRXP
         6eA2Yi1Z9Pavtl/+pn/POZVYYbx4N4S3pWMGEtUtTrpPrIOEwBzXwb/IOPeSMy6RHYJS
         djlqualJUdmhPGmliEdd3AXxScJ9tEDtXUQ1gizaOy06S7Ap6Pr1U2cARkY2ewkNIY4v
         tG+UwoUnnDAKF5f8eN55/8wwz52jonDEMsELJ1BJASO6gpBj0Dtnh+3LEMUxAMCYU0Bt
         rmqEpZQKFHWX/tW/vkIFAFyfKgnIj/Q4RmxoE/AEPHMyKdk6KLyChL9M+b3QUZGA9STa
         Wz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013676; x=1770618476;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZnIp1lwHGUtXDV1MRZ1HULqBz4p5ioOR8qKhHkhHUo=;
        b=v+n0mWsZkfQPhkj+QYtDPqZ7Jgv9UYG2KDNd4gttob8z/veCNFxxMzAyc+ElTd/mI8
         jSxolEUxoWJQgL38Bd+C1Udu4U6Xz5YX5ICBCss9mHD5KGiL3OyalVTfJWYCe1ndA7/p
         vMfhRb3Lj5wli5tE/o4+BeX4JlJIcvgSXAVroLNveAiFMt6Z1l51ffgdCX/5CbH9rw/f
         dEBz+pvIkXtyn9u0FLrSt513b/uRNseK792/DwbUNwYQpAXplwiqRjiXRCOg1hJx06pG
         Js65BFWcpFTs6OvWTwPMxoUVcCDODmj2PnVBtS3fERFkoSFBbXAOeB6L9UkKVu/7L73l
         Io/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7vx/x9JdmnuKINCwIKKkKSBOgaXvNvt5kggfUHZDg47jiVILsEHu1UomGHlh6i1Bxek9RxrXlrIEWTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7r8D+cTHIRTdQIvFANWZwlFujXts+h8y9ZId5JxmXxTnzq+Nq
	aYIBi7QyhB8gYG5ONGRDJFM+2OOPKAOjrUgEp1ZQz+mndgh2TuTlwf2Be9N1jgOPRHgVwtGiy8z
	iRGazFVjkhZjRiRsecYYE7m45SLeSMaw=
X-Gm-Gg: AZuq6aJKTNHgL/S94bzVFpzTueYfH01Flv3qLP7uq7fJuhrhQm0Ws6VUhtOj37hjBB6
	EQ/RP9XGu0W7bl+5vxHGCDSdRpBHzcXWixqOFVm1syctbpq7RflOLQoyYbyB1PLCRgjvnFOwQQ/
	rgfd5UkYz0qpjAU/4uuiBkQrwUX1ptIWHZjkelCHg5RgYLAp1Bc5m73Ke2mmAZSVe5WN/1/dd7i
	RRtTk5YtS4qUZDLsgcB5nCJ/kekrermxv0CBGBGbtaiATSKNFj1S/JduSc0tZSn6dczp2ZV5iBp
	4ITGvVxatxNCxqo2Df5r/0wt
X-Received: by 2002:a05:6214:519c:b0:81b:23d:55a8 with SMTP id
 6a1803df08f44-894ea0e5d80mr141263376d6.59.1770013675939; Sun, 01 Feb 2026
 22:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?5p2O6b6Z5YW0?= <coregee2000@gmail.com>
Date: Mon, 2 Feb 2026 14:27:45 +0800
X-Gm-Features: AZwV_Qg9Qt0Cxjc3JdliArSlZ8A0DwEk3cCWTsYJ2uoyORoesfbQ-IxIhDclxAU
Message-ID: <CAHPqNmzY=zVGq0r7g-ED0Rtmi-7udMW51AAb7rex5A0vcBJMjA@mail.gmail.com>
Subject: [Kernel Bug] KASAN: slab-use-after-free Read in loopback_trigger
To: syzkaller@googlegroups.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux kernel developers and maintainers,

We would like to report a new kernel bug found by our tool. KASAN:
slab-use-after-free Read in loopback_trigger. Details are as follows.

Kernel commit: v6.18.2
Kernel config: see attachment
report: see attachment

We are currently analyzing the root cause and  working on a
reproducible PoC. We will provide further updates in this thread as
soon as we have more information.

Best regards,
Longxing Li

==================================================================
BUG: KASAN: slab-use-after-free in loopback_check_format
sound/drivers/aloop.c:354 [inline]
BUG: KASAN: slab-use-after-free in loopback_trigger+0x1ef8/0x1f20
sound/drivers/aloop.c:411
Read of size 4 at addr ffff888124f6106c by task syz.1.614/21000

CPU: 0 UID: 0 PID: 21000 Comm: syz.1.614 Not tainted 6.18.2 #1 PREEMPT(full)
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 loopback_check_format sound/drivers/aloop.c:354 [inline]
 loopback_trigger+0x1ef8/0x1f20 sound/drivers/aloop.c:411
 snd_pcm_do_start sound/core/pcm_native.c:1454 [inline]
 snd_pcm_do_start+0xd4/0x1f0 sound/core/pcm_native.c:1447
 snd_pcm_action_single+0x80/0x150 sound/core/pcm_native.c:1310
 snd_pcm_action+0x70/0x90 sound/core/pcm_native.c:1393
 __snd_pcm_lib_xfer+0x1403/0x1ec0 sound/core/pcm_lib.c:2405
 snd_pcm_oss_write3+0xcf/0x1e0 sound/core/oss/pcm_oss.c:1241
 io_playback_transfer+0x26e/0x2f0 sound/core/oss/io.c:47
 snd_pcm_plug_write_transfer+0x2cf/0x400 sound/core/oss/pcm_plugin.c:630
 snd_pcm_oss_write2+0x24a/0x410 sound/core/oss/pcm_oss.c:1373
 snd_pcm_oss_sync1+0x1c3/0x560 sound/core/oss/pcm_oss.c:1615
 snd_pcm_oss_sync+0x5ef/0x840 sound/core/oss/pcm_oss.c:1691
 snd_pcm_oss_release+0x28b/0x310 sound/core/oss/pcm_oss.c:2573
 __fput+0x402/0xb70 fs/file_table.c:468
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x426/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x5656ed
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe65166ac8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000717a80 RCX: 00000000005656ed
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 0000000000717a80 R08: 0000000000000000 R09: 000000000000004b
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000350974
R13: 00000000003506e2 R14: 0000000000716130 R15: 000000000071613c
 </TASK>

Allocated by task 21001:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:417
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 snd_pcm_attach_substream+0x441/0xd60 sound/core/pcm.c:938
 snd_pcm_open_substream+0x8d/0x17f0 sound/core/pcm_native.c:2756
 snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2437 [inline]
 snd_pcm_oss_open+0x735/0x1400 sound/core/oss/pcm_oss.c:2518
 soundcore_open+0x40c/0x580 sound/sound_core.c:594
 chrdev_open+0x234/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x982/0x1530 fs/open.c:965
 vfs_open+0x82/0x3f0 fs/open.c:1097
 do_open fs/namei.c:3975 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4134
 do_filp_open+0x20b/0x470 fs/namei.c:4161
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 21001:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:56
 kasan_save_track+0x14/0x30 mm/kasan/common.c:77
 __kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2543 [inline]
 slab_free mm/slub.c:6642 [inline]
 kfree+0x2b8/0x6d0 mm/slub.c:6849
 snd_pcm_detach_substream+0x1d7/0x3a0 sound/core/pcm.c:1003
 snd_pcm_release_substream+0x5b/0x70 sound/core/pcm_native.c:2729
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2396 [inline]
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2388 [inline]
 snd_pcm_oss_release+0x16f/0x310 sound/core/oss/pcm_oss.c:2575
 __fput+0x402/0xb70 fs/file_table.c:468
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x426/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888124f61000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 108 bytes inside of
 freed 2048-byte region [ffff888124f61000, ffff888124f61800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x124f60
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 057ff00000000040 ffff88801b042000 0000000000000000 dead000000000001
raw: 0000000000000000 0000000080080008 00000000f5000000 0000000000000000
head: 057ff00000000040 ffff88801b042000 0000000000000000 dead000000000001
head: 0000000000000000 0000000080080008 00000000f5000000 0000000000000000
head: 057ff00000000003 ffffea000493d801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 13349, tgid 13349 (syz-executor), ts 354875380951, free_ts
354830302425
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1af/0x220 mm/page_alloc.c:1845
 prep_new_page mm/page_alloc.c:1853 [inline]
 get_page_from_freelist+0x10a3/0x3a30 mm/page_alloc.c:3879
 __alloc_frozen_pages_noprof+0x25f/0x2470 mm/page_alloc.c:5178
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3059 [inline]
 allocate_slab mm/slub.c:3232 [inline]
 new_slab+0x24a/0x360 mm/slub.c:3286
 ___slab_alloc+0xd79/0x1a50 mm/slub.c:4655
 __slab_alloc.constprop.0+0x63/0x110 mm/slub.c:4778
 __slab_alloc_node mm/slub.c:4854 [inline]
 slab_alloc_node mm/slub.c:5276 [inline]
 __do_kmalloc_node mm/slub.c:5649 [inline]
 __kmalloc_noprof+0x501/0x880 mm/slub.c:5662
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 rfkill_alloc+0xac/0x330 net/rfkill/core.c:1002
 wiphy_new_nm+0x136a/0x2190 net/wireless/core.c:560
 ieee80211_alloc_hw_nm+0x1bb5/0x22b0 net/mac80211/main.c:852
 mac80211_hwsim_new_radio+0x1d3/0x50b0
drivers/net/wireless/virtual/mac80211_hwsim.c:5408
 hwsim_new_radio_nl+0xba2/0x1330
drivers/net/wireless/virtual/mac80211_hwsim.c:6503
 genl_family_rcv_msg_doit+0x209/0x2f0 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x55c/0x800 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552
page last free pid 13349 tgid 13349 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0x7ce/0x1160 mm/page_alloc.c:2901
 discard_slab mm/slub.c:3330 [inline]
 __put_partials+0x130/0x170 mm/slub.c:3876
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4d/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:352
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4978 [inline]
 slab_alloc_node mm/slub.c:5288 [inline]
 __kmalloc_cache_noprof+0x274/0x780 mm/slub.c:5766
 kmalloc_noprof include/linux/slab.h:957 [inline]
 netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:664 [inline]
 netdevice_event+0x365/0x9d0 drivers/infiniband/core/roce_gid_mgmt.c:823
 notifier_call_chain+0xbc/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2229
 call_netdevice_notifiers_extack net/core/dev.c:2267 [inline]
 call_netdevice_notifiers net/core/dev.c:2281 [inline]
 __dev_notify_flags+0x12c/0x2e0 net/core/dev.c:9676
 netif_change_flags+0x108/0x160 net/core/dev.c:9705
 do_setlink.constprop.0+0xb53/0x4380 net/core/rtnetlink.c:3151
 rtnl_changelink net/core/rtnetlink.c:3769 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3928 [inline]
 rtnl_newlink+0x1446/0x2000 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:6951
 netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2552
 netlink_unicast_kernel net/netlink/af_netlink.c:1320 [inline]
 netlink_unicast+0x5aa/0x870 net/netlink/af_netlink.c:1346

Memory state around the buggy address:
 ffff888124f60f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888124f60f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888124f61000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff888124f61080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888124f61100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

https://drive.google.com/file/d/17HbDTI_iPjA72SkV5MnO-_w7IQZ9HIHW/view?usp=drive_link

https://drive.google.com/file/d/10l1_AeaUsp8QL-DunMu8rpZZB5Yw6Ert/view?usp=drive_link
