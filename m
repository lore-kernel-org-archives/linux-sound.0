Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659730F55F
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888746; cv=none; b=coPNHbH+0qFyfW4R1D/E+dQSfT/gEkeZO8JUPhaE7qlQfO/NSCzQEvuwKcbuDIuKc+UGh6NBMnFCEWcEueA/uTpRkDngTCTvtR/9nx7XHeYfNLiyGYSe6dTLAgMuYRyt3pvaP8wJBzqx9ra5OGQAs9v3o9fiD4k/56mG62RxOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888746; c=relaxed/simple;
	bh=XzqWOk/OFBPopPv1yhYB4sXN9IpCuZWoTEaXoKrNKb8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CpgggUWVwlvbg2FCCVz0+bODeizBvvnE4pNk3vPScB8NSjlqo1V/Ub/P1T/SynvOv9YLEPoAOJOuJd6k4mVqqTJWZ0GEabTJ91LyWi1uXGS8EukBjo8SSbB8hrSjtZ3r5K9CXnx6s+CKxcUCdfNDay9+7wpdYSMFaLaxmqlYdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-451fd211101so199634fac.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 17:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785888743; x=1786493543;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w46mYO0HcVVSNMwB1HrsYe2lUHozwahDjS6IIJPwDCA=;
        b=fT42ljHd9ie1YqpSp2eNmTQC7EfbSRbs3K92U5j2GifvPoUqvYkbqvOkg7VBowDk/T
         FH5ERpHkPW3iuFAMeNRt0M6x3ex6hwwU6+k5XDvtYZg8g4qhFm0GsRRrjmuTD63i+GeJ
         wQ5TpxNPCwuLl+53gaZqCwzrZ6Zu62LgH+R4mvpt9vNCHEwLedI5PdpXDJb1fsG5Pl3K
         6deHuVKPrG6h9hWt0biQSiAlps+49eQPnNfCN+llRrsGYALQlT71JPsn9liHYAk4ClXW
         CsnQIk5TCA1gLaVr9WsGbna16JNLVpIXCfwji4M2f/IW2DKTnuNusJ36IKdyANJDAK6S
         GPJA==
X-Forwarded-Encrypted: i=1; AHgh+RrB8VNdIeXSePND0AC2yD4JKoBHuOfhkOWxYzDXSnnKaS+kMpnJ2WImPiNmrs7SIObVo1+dr2DwQqgv+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQw+4cbubOPS8R6Awfte9rWoKLhpDlQp72lf/W3gkPmQg+cLtR
	CEXhqrFdH419BCBeWIpQ2Ee8OuSBUdz7UwgR1MBaOSMQN4aojgVng6ADvTIO25EkgqOES16mJzn
	b2+baRhyOyl+XQRKCXWnLwiXzXshxERxGm7XyQRIzAYs7BDcldSmsTpmks5M=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1896:b0:6a3:2368:4cc5 with SMTP id
 006d021491bc7-6ae970731bdmr1592602eaf.35.1785888743164; Tue, 04 Aug 2026
 17:12:23 -0700 (PDT)
Date: Tue, 04 Aug 2026 17:12:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a727fe7.13623e66.bdc14.003b.GAE@google.com>
Subject: [syzbot] [sound?] KASAN: slab-use-after-free Write in snd_usb_midi_v2_free
From: syzbot <syzbot+565b1138cfbe549d4422@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11cb4bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7079b368dcec295
dashboard link: https://syzkaller.appspot.com/bug?extid=565b1138cfbe549d4422
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/25bde0bfecb5/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8a5ebf809884/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1d1810845ac3/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+565b1138cfbe549d4422@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in free_all_midi2_umps sound/usb/midi2.c:689 [inline]
BUG: KASAN: slab-use-after-free in snd_usb_midi_v2_free+0x52d/0x670 sound/usb/midi2.c:941
Write of size 8 at addr ffff88807d228350 by task kworker/0:6/5781

CPU: 0 UID: 0 PID: 5781 Comm: kworker/0:6 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 free_all_midi2_umps sound/usb/midi2.c:689 [inline]
 snd_usb_midi_v2_free+0x52d/0x670 sound/usb/midi2.c:941
 snd_usb_midi_v2_free_all+0x85/0xe0 sound/usb/midi2.c:1240
 snd_usb_audio_free+0x4e/0x120 sound/usb/card.c:608
 snd_card_do_free sound/core/init.c:594 [inline]
 release_card_device+0xb2/0x1a0 sound/core/init.c:153
 device_release+0xd2/0x270 drivers/base/core.c:2636
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3880
 snd_card_free_when_closed sound/core/init.c:626 [inline]
 snd_card_free_when_closed+0x2b/0x40 sound/core/init.c:620
 usb_audio_disconnect+0x210/0x680 sound/usb/card.c:1159
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1c4f/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 10:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 snd_ump_endpoint_new+0x93/0x470 sound/core/ump.c:169
 create_midi2_ump+0x2dd/0x920 sound/usb/midi2.c:717
 find_matching_ep_partner sound/usb/midi2.c:781 [inline]
 parse_midi_2_0 sound/usb/midi2.c:973 [inline]
 snd_usb_midi_v2_create+0x11fa/0x4070 sound/usb/midi2.c:1129
 snd_usb_create_stream.isra.0+0x386/0x4d0 sound/usb/card.c:290
 snd_usb_create_streams sound/usb/card.c:392 [inline]
 usb_audio_probe+0xf05/0x3b10 sound/usb/card.c:1031
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5781:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 snd_rawmidi_free sound/core/rawmidi.c:1923 [inline]
 snd_rawmidi_dev_free+0x3e/0x60 sound/core/rawmidi.c:1945
 __snd_device_free+0x1a3/0x300 sound/core/device.c:76
 snd_device_free_all+0xf3/0x220 sound/core/device.c:233
 snd_card_do_free sound/core/init.c:592 [inline]
 release_card_device+0x77/0x1a0 sound/core/init.c:153
 device_release+0xd2/0x270 drivers/base/core.c:2636
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3880
 snd_card_free_when_closed sound/core/init.c:626 [inline]
 snd_card_free_when_closed+0x2b/0x40 sound/core/init.c:620
 usb_audio_disconnect+0x210/0x680 sound/usb/card.c:1159
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1c4f/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88807d228000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 848 bytes inside of
 freed 4096-byte region [ffff88807d228000, ffff88807d229000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7d228
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813fe22140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813fe22140 dead000000000100 dead000000000122
head: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5879, tgid 5878 (syz.5.9), ts 109579311101, free_ts 109572587082
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x640 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kvmalloc_node_noprof+0x793/0x970 mm/slub.c:6905
 snd_rawmidi_runtime_create sound/core/rawmidi.c:175 [inline]
 open_substream+0x311/0x970 sound/core/rawmidi.c:345
 rawmidi_open_priv+0x595/0x6f0 sound/core/rawmidi.c:397
 snd_rawmidi_open+0x4c9/0xba0 sound/core/rawmidi.c:485
 soundcore_open+0x2e3/0x5a0 sound/sound_core.c:594
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
page last free pid 5605 tgid 5605 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 __folio_put+0x3b4/0x5f0 mm/swap.c:112
 folio_put include/linux/mm.h:2124 [inline]
 put_page include/linux/mm.h:2193 [inline]
 put_netmem include/net/netmem.h:394 [inline]
 skb_page_unref include/linux/skbuff_ref.h:43 [inline]
 __skb_frag_unref include/linux/skbuff_ref.h:56 [inline]
 skb_release_data+0x649/0x8e0 net/core/skbuff.c:1116
 skb_release_all net/core/skbuff.c:1197 [inline]
 __kfree_skb+0x4f/0x70 net/core/skbuff.c:1211
 tcp_wmem_free_skb include/net/tcp.h:334 [inline]
 tcp_rtx_queue_unlink_and_free include/net/tcp.h:2321 [inline]
 tcp_clean_rtx_queue net/ipv4/tcp_input.c:3698 [inline]
 tcp_ack+0x2079/0x7650 net/ipv4/tcp_input.c:4400
 tcp_rcv_established+0x116d/0x3990 net/ipv4/tcp_input.c:6589
 tcp_v4_do_rcv+0xbb6/0x1260 net/ipv4/tcp_ipv4.c:1854
 tcp_v4_rcv+0x2ec1/0x4840 net/ipv4/tcp_ipv4.c:2248
 ip_protocol_deliver_rcu+0xba/0x4d0 net/ipv4/ip_input.c:207
 ip_local_deliver_finish+0x3f2/0x6e0 net/ipv4/ip_input.c:241
 NF_HOOK include/linux/netfilter.h:318 [inline]
 NF_HOOK include/linux/netfilter.h:312 [inline]
 ip_local_deliver+0x19a/0x1f0 net/ipv4/ip_input.c:262
 dst_input include/net/dst.h:480 [inline]
 ip_sublist_rcv_finish net/ipv4/ip_input.c:623 [inline]
 ip_list_rcv_finish+0xa14/0xce0 net/ipv4/ip_input.c:675
 ip_sublist_rcv net/ipv4/ip_input.c:683 [inline]
 ip_list_rcv+0x338/0x450 net/ipv4/ip_input.c:717
 __netif_receive_skb_list_ptype net/core/dev.c:6255 [inline]
 __netif_receive_skb_list_core+0x74c/0x940 net/core/dev.c:6302
 __netif_receive_skb_list net/core/dev.c:6354 [inline]
 netif_receive_skb_list_internal+0x722/0xd40 net/core/dev.c:6445
 gro_normal_list include/net/gro.h:523 [inline]
 gro_normal_list include/net/gro.h:519 [inline]
 gro_flush_normal include/net/gro.h:531 [inline]
 napi_complete_done+0x221/0x940 net/core/dev.c:6813

Memory state around the buggy address:
 ffff88807d228200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807d228280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807d228300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff88807d228380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807d228400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
