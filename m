Received: from www36.your-server.de (www36.your-server.de [213.133.104.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAB33344A;
	Sat, 21 Mar 2026 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774122996; cv=none; b=T4nuFgg/yjQtd/7Rns2eLrGoNQQnwwxdRCCo44SIV3AC8P3vKVG6HKxhUQ/s0ExKR5jsuFN9fiSR1EaO7uqybGZhqGyiBXk32NpHL8JWqsUAP6HCD0CohgCd+4G5uv6wm6HUEnC53j++yNUQ1Zz8K/kEPJZSef+LfdVtmb5eids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774122996; c=relaxed/simple;
	bh=pNY/UkZSQhwfQiCGHJLvcyY5xgWAF6f0px0TZv+/OqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CskbhdBOdG2TATCJBDGsNDNE+2yrVGcCv1d93zedsHF10utsFrWTkBjiflG3FUx3+Sh1YTIlmNoRi47/E5n6voUwGy6YIm97TODrsxXXI5OVlgL1GyJHd78m//MpX2fkS/JQ612gzPjJkt4b5s4C8y1femLTHCYWOh6LJrjhgzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de; spf=pass smtp.mailfrom=hohmatik.de; dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b=RSORRt43; arc=none smtp.client-ip=213.133.104.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hohmatik.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hohmatik.de header.i=@hohmatik.de header.b="RSORRt43"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hohmatik.de
	; s=default2501; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kysJpMCuTW4EjnapMQ2B7twisyIQeMMqYZp1udBy5qM=; b=RSORRt431iy6ATTOq1R/5MDoiW
	SuZXdTZmn91+AqgjZkNtnK5YclsJ+HEoKE0mEqR7/AO5cVPOuyeCoknj/fmY6XT2mNHev6HpOfHWe
	VfT5DS0kVgUp8gawqLgCBagrxH8InlVb/u4EhTDu2m6gyXrgEtgbHzj3mvsnWVTYDGKvS+JLYrFmC
	XJm7EnFkTh4T+4vNAAtOWmRk45JdlkyM/0Hkb7GmWttbPlvPxgoFsa3YkP0P36uMF2spFigg07mWO
	FbEQGpBTL3vm1YOUk3EPwjH8v92BinmhMXg67rMYX/iaNYW73YReZeOGeAgscxoSajADEA1bhuAiu
	Jx58TYFA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www36.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <linux@hohmatik.de>)
	id 1w42Qp-000344-0A;
	Sat, 21 Mar 2026 20:56:23 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@hohmatik.de>)
	id 1w42Qo-000EtS-1K;
	Sat, 21 Mar 2026 20:56:22 +0100
From: Karsten Hohmeier <linux@hohmatik.de>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux@hohmatik.de
Subject: Re: UBSAN: shift-out-of-bounds in sound/pci/ctxfi/cthw20k2.c:956:31
Date: Sat, 21 Mar 2026 20:56:21 +0100
Message-ID: <20260321195621.16139-1-linux@hohmatik.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87cy149n6k.wl-tiwai@suse.de>
References: <87cy149n6k.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27947/Sat Mar 21 07:24:23 2026)

Hello Takashi,

I applied your patch and uncommented the stack dumps.
Here is what I get.

Mar 21 20:41:34 dtest kernel: XXX invalid type 9 for hw20k2
Mar 21 20:41:34 dtest kernel: CPU: 8 UID: 0 PID: 535 Comm: (udev-worker) Tainted: G           OE       6.19.8 #2 PREEMPT(lazy) 
Mar 21 20:41:34 dtest kernel: Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
Mar 21 20:41:34 dtest kernel: Hardware name: To Be Filled By O.E.M. A320M-DVS R4.0/A320M-DVS R4.0, BIOS P10.44 02/23/2026
Mar 21 20:41:34 dtest kernel: Call Trace:
Mar 21 20:41:34 dtest kernel:  <TASK>
Mar 21 20:41:34 dtest kernel:  dump_stack_lvl+0x5d/0x80
Mar 21 20:41:34 dtest kernel:  daio_device_index.isra.0.cold+0x13/0x45 [snd_ctxfi]
Mar 21 20:41:34 dtest kernel:  get_daio_rsc+0x1d1/0x2c0 [snd_ctxfi]
Mar 21 20:41:34 dtest kernel:  atc_get_resources+0x161/0x380 [snd_ctxfi]
Mar 21 20:41:34 dtest kernel:  ct_atc_create+0x3ec/0x540 [snd_ctxfi]
Mar 21 20:41:34 dtest kernel:  ct_card_probe+0x104/0x2c0 [snd_ctxfi]
Mar 21 20:41:34 dtest kernel:  local_pci_probe+0x42/0x90
Mar 21 20:41:34 dtest kernel:  pci_device_probe+0xda/0x2b0
Mar 21 20:41:34 dtest kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
Mar 21 20:41:34 dtest kernel:  really_probe+0xde/0x380
Mar 21 20:41:34 dtest kernel:  __driver_probe_device+0x78/0x150
Mar 21 20:41:34 dtest kernel:  driver_probe_device+0x1f/0xa0
Mar 21 20:41:34 dtest kernel:  ? __pfx___driver_attach+0x10/0x10
Mar 21 20:41:34 dtest kernel:  __driver_attach+0xcb/0x200
Mar 21 20:41:34 dtest kernel:  bus_for_each_dev+0x85/0xd0
Mar 21 20:41:34 dtest kernel:  bus_add_driver+0x118/0x200
Mar 21 20:41:34 dtest kernel:  ? __pfx_ct_driver_init+0x10/0x10 [snd_ctxfi]
Mar 21 20:41:34 dtest kernel:  driver_register+0x75/0xe0
Mar 21 20:41:34 dtest kernel:  do_one_initcall+0x5b/0x300
Mar 21 20:41:34 dtest kernel:  do_init_module+0x62/0x250
Mar 21 20:41:34 dtest kernel:  init_module_from_file+0xd8/0x140
Mar 21 20:41:34 dtest kernel:  idempotent_init_module+0x114/0x310
Mar 21 20:41:34 dtest kernel:  __x64_sys_finit_module+0x71/0xe0
Mar 21 20:41:34 dtest kernel:  ? syscall_trace_enter+0x8d/0x1d0
Mar 21 20:41:34 dtest kernel:  do_syscall_64+0x81/0x600
Mar 21 20:41:34 dtest kernel:  ? vfs_read+0x165/0x390
Mar 21 20:41:34 dtest kernel:  ? vfs_read+0x165/0x390
Mar 21 20:41:34 dtest kernel:  ? restore_fpregs_from_fpstate+0x46/0xa0
Mar 21 20:41:34 dtest kernel:  ? switch_fpu_return+0x5b/0xe0
Mar 21 20:41:34 dtest kernel:  ? do_syscall_64+0x245/0x600
Mar 21 20:41:34 dtest kernel:  ? exc_page_fault+0x7e/0x1a0
Mar 21 20:41:34 dtest kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Mar 21 20:41:34 dtest kernel: RIP: 0033:0x7ff26a11bc29
Mar 21 20:41:34 dtest kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 51 0d 0>
Mar 21 20:41:34 dtest kernel: RSP: 002b:00007ffcf4bdf7c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
Mar 21 20:41:34 dtest kernel: RAX: ffffffffffffffda RBX: 000055a12d9ec2b0 RCX: 00007ff26a11bc29
Mar 21 20:41:34 dtest kernel: RDX: 0000000000000004 RSI: 00007ff2696e844d RDI: 000000000000004d
Mar 21 20:41:34 dtest kernel: RBP: 0000000000000004 R08: 0000000000000000 R09: 000055a12d5e1670
Mar 21 20:41:34 dtest kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000020000
Mar 21 20:41:34 dtest kernel: R13: 00007ff2696e844d R14: 000055a12d9e7720 R15: 0000000000000000
Mar 21 20:41:34 dtest kernel:  </TASK>
Mar 21 20:41:34 dtest kernel: snd_ctxfi 0000:05:00.0: Failed to get DAIO resource 9!!!
Mar 21 20:41:34 dtest kernel: snd_ctxfi 0000:05:00.0: Something wrong!!!
Mar 21 20:41:34 dtest kernel: snd_ctxfi 0000:05:00.0: probe with driver snd_ctxfi failed with error -22

Sorry, that it takes a while for me to test, but I only have access to this machine on weekends.

Regards

Karsten
