Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1556389107
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393916; cv=none; b=dktNAezlayQAgY6wj9FfCmQgKk/ZSoyds4y+uCp6C91xzcmv/d8H7eHt6RVwFpFyDO1xfXoLWrBa1JUiEzKYzI8nWck3iG2Rye+2Whnzs7+rnMHT6koNh+8Om3U1T9RD4uT5gpXvT0C0z938wY8IUy/sscTUwvyW4SFs23AJT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393916; c=relaxed/simple;
	bh=t8WV10mf9RVtQSitT5daGR+A/mpyaNgWsUgbpmeJmNA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F0NFZc5l5NLKBNbbKGic9QmSjFFdiX1kxhSgnCNm8adKFExBbdOCmweTu2CikCuFMIPlP162b0YntaimYdh/qF6GWVE1PyMXwJl+cL/8Rmmv88YX54nDf2+KpPGRpdOPJUBNzPXzkoTsWS0IF0deuXudPAaWRq/ODwOj5eZ76cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=NwIchiCE; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="NwIchiCE"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6D77E240101
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 10:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773393904; bh=t8WV10mf9RVtQSitT5daGR+A/mpyaNgWsUgbpmeJmNA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=NwIchiCEpWGzRCnvfFsCp8Pi2pkeU+GrB6OgVu+9Acea0zIj1YvRopiqLzcd8Ba7W
	 vDwc21r17HzNNbqbvdeDuJFh3/+NXRehvW93RkuzpFs5p+HMSo1PK8wespxpQ3bH5y
	 B8GU/rD8ccVfjm81nQfv9Cr4eEYySpZUGxlcjgflJ2nzcrnptM8slL2WaOwdV8hLyC
	 /HuU872mHou540l0/vKFExH0Xxkt9p75IX45axgfHlqrURZQnYwyJJU1GjvN6Cd3Np
	 xrqvc8TF3iRWPNcuXsLhv2oikipnPfLSZxhvCC6ZZZlW8v/6fyRUCrPKT4npEHhU4l
	 dZzuShaUvEEYA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fXJwv60P3z6tvq;
	Fri, 13 Mar 2026 10:25:03 +0100 (CET)
Message-ID: <7ef3a54676b5ee11507c379885772f29e12f250c.camel@posteo.de>
Subject: Re: BUG: snd_ctxfi Oops in set_field() with Creative X-Fi Titanium
 (EMU20k2, 1102:000b) on Linux 6.19.x, regression from 6.18
From: mape6@posteo.de
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Date: Fri, 13 Mar 2026 09:25:04 +0000
In-Reply-To: <87qzpoaysq.wl-tiwai@suse.de>
References: <170a3c247d8b94a2e5714ca0641a91511c9808d3.camel@posteo.de>
		 <87qzpoaysq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

I'm using 6.18.16-1-lts currently. That kernel is working fine with the
mentioned driver that has issues with kernel 6.19.[56].

And I need some time to figure out how to do your "quick test".

Kind regards
Mape6

Am Freitag, dem 13.03.2026 um 10:01 +0100 schrieb Takashi Iwai:
> [ Let's move to linux-sound ML as it's the main ML for kernel issues
> ]
>=20
> On Fri, 13 Mar 2026 05:40:41 +0100,
> Martin Pechstein wrote:
> >=20
> > Hi,
> >=20
> > I am reporting a reproducible kernel Oops in the ALSA driver
> > snd_ctxfi
> > (sound/pci/ctxfi) with a Creative Sound Blaster X-Fi Titanium
> > (EMU20k2, PCI ID 1102:000b, subsystem 1102:0042).
> >=20
> > This appears to be a regression in Linux 6.19.x.
> >=20
> > Good:
> > - linux-lts 6.18.x: driver loads normally, no crash, card works
> >=20
> > Bad:
> > - linux 6.19.5.arch1-1
> > - linux 6.19.6.arch1-1
> > - linux-zen 6.19.5.zen1-1
> > - linux-zen 6.19.6.zen1-1
>=20
> To be exact: does 6.18.8 work for you?=C2=A0 This kernel contains my
> recent
> upstream fix 61006c540cbd ("ALSA: ctxfi: Fix potential OOB access in
> audio mixer handling"), and I'd like to know whether this one is the
> culprit or not.
>=20
> > The crash happens during early boot when udev loads snd_ctxfi.
> > The kernel hits:
> >=20
> > =C2=A0 BUG: unable to handle page fault
> > =C2=A0 RIP: set_field+0x30/... [snd_ctxfi]
> >=20
> > Call trace includes:
> >=20
> > =C2=A0 daio_mgr_enb_dai
> > =C2=A0 daio_mgr_enb_daio
> > =C2=A0 get_daio_rsc
> > =C2=A0 atc_get_resources
> > =C2=A0 ct_atc_create
> > =C2=A0 ct_card_probe
> >=20
> > Hardware:
> > 05:00.0 Audio device [0403]: Creative Labs EMU20k2
> > [Sound Blaster X-Fi Titanium Series] [1102:000b] (rev 04)
> > Subsystem: Creative Labs Device [1102:0042]
> > Kernel driver in use: snd_ctxfi
> >=20
> > System:
> > - Mainboard: ASRock B450 Pro4
> > - BIOS: P10.44 (2025-11-26)
> >=20
> > Kernel:
> > Linux PC 6.19.6-arch1-1 #1 SMP PREEMPT_DYNAMIC Wed, 04 Mar 2026
> > 18:25:08 +0000 x86_64 GNU/Linux
> >=20
> > Important note:
> > The attached trace was reproduced with no out-of-tree modules
> > loaded,
> > so the kernel is untainted for this report.
> >=20
> > Workarounds:
> > - blacklisting snd_ctxfi avoids the crash
> > - booting linux-lts 6.18.x works correctly
> >=20
> > I have attached:
> > - journal-from-oops.txt
> >=20
> > Please let me know if you want me to test additional kernels,
> > patches,
> > or provide more debug output.
>=20
> There have been not so many changes since 6.18, the major ones are
> about the support for Onkyo SE-300PCIE with cleanups.
>=20
> As a quick test, you can simply your working 6.18.x code from
> sound/pci/ctxfi/* into 6.19.x kernel, rebuild and check whether the
> issue persists or not.=C2=A0 If yes, something in a lower layer broke.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> >=20
> > Thanks.
> >=20
> > Kind regards
> > Mape6
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: BUG: unable to handle pag=
e
> > fault for address: ffff88cb88dc37b0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: #PF: supervisor read acce=
ss in
> > kernel mode
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: #PF: error_code(0x0000) -=
 not-
> > present page
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: PGD 283001067 P4D 2830010=
67 PUD
> > 0=20
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Oops: Oops: 0000 [#1] SMP=
 NOPTI
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: CPU: 1 UID: 0 PID: 707 Co=
mm:
> > (udev-worker) Not tainted 6.19.6-arch1-1 #1 PREEMPT(full)=C2=A0
> > a70f585a3574c37bff18875a6cf7bd8652b4cbca
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Hardware name: To Be Fill=
ed By
> > O.E.M. To Be Filled By O.E.M./B450 Pro4, BIOS P10.44 11/26/2025
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RIP: 0010:set_field+0x30/=
0x60
> > [snd_ctxfi]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Code: 44 00 00 49 89 f8 8=
5 f6
> > 74 31 31 c9 40 f6 c6 01 75 18 0f 1f 84 00 00 00 00 00 83 c1 01 b8
> > 01 00 00 00 d3 e0 85 f0 74 f2 d3 e2 <41> 8b 00 31 c2 21 f2 31 c2 41
> > 89 10 e9 5f 80 e7 e2 0f 0b e9 58 80
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RSP: 0018:ffffd07300f1f76=
8
> > EFLAGS: 00010202
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RAX: 00000000ffffffea RBX=
:
> > ffff88c788dc37e0 RCX: 0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RDX: 0000000000000001 RSI=
:
> > 0000000000000001 RDI: ffff88cb88dc37b0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RBP: 00000000ffffffea R08=
:
> > ffff88cb88dc37b0 R09: 0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: R10: ffffd07300f1f798 R11=
:
> > ffff88c780b27a20 R12: 0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: R13: ffffffffc0597390 R14=
:
> > ffff88c788dc3ca8 R15: ffff88c788dc3660
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: FS:=C2=A0 00007f5b6bfc084=
0(0000)
> > GS:ffff88cb09904000(0000) knlGS:0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: CS:=C2=A0 0010 DS: 0000 E=
S: 0000
> > CR0: 0000000080050033
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: CR2: ffff88cb88dc37b0 CR3=
:
> > 000000010fd04000 CR4: 0000000000350ef0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Call Trace:
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 <TASK>
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 daio_mgr_enb_dai+0x=
27/0x40
> > [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 daio_mgr_enb_daio+0=
x57/0x70
> > [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 get_daio_rsc+0xd5/0=
x2c0
> > [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 atc_get_resources+0=
x161/0x380
> > [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ct_atc_create.cold+=
0x19e/0x25d
> > [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ct_card_probe+0xd9/=
0x200
> > [snd_ctxfi 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 local_pci_probe+0x4=
2/0x90
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 pci_device_probe+0x=
da/0x280
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ?
> > sysfs_do_create_link_sd+0x6d/0xd0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 really_probe+0xde/0=
x380
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0
> > __driver_probe_device+0x78/0x150
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 driver_probe_device=
+0x1f/0xa0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ?
> > __pfx___driver_attach+0x10/0x10
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 __driver_attach+0xc=
b/0x200
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 bus_for_each_dev+0x=
85/0xd0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 bus_add_driver+0x11=
8/0x200
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ?
> > __pfx_ct_driver_init+0x10/0x10 [snd_ctxfi
> > 17c1f954ac8c8b68ce25c6238520b671f3075199]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 driver_register+0x7=
5/0xe0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 do_one_initcall+0x5=
b/0x300
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 do_init_module+0x62=
/0x250
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0
> > init_module_from_file+0xd8/0x140
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0
> > idempotent_init_module+0x114/0x310
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0
> > __x64_sys_finit_module+0x71/0xe0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ?
> > syscall_trace_enter+0x8d/0x1d0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 do_syscall_64+0x81/=
0x610
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? __x64_sys_pread64=
+0x9c/0xd0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? do_syscall_64+0x2=
3b/0x610
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? vfs_statx+0x7a/0x=
160
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? strncpy_from_user=
+0x30/0x110
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? vfs_fstatat+0x75/=
0xa0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ?
> > __do_sys_newfstatat+0x3b/0x80
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? do_syscall_64+0x8=
1/0x610
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? srso_return_thunk=
+0x5/0x5f
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 ? exc_page_fault+0x=
7e/0x1a0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0
> > entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RIP: 0033:0x7f5b6b92706d
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Code: ff c3 66 2e 0f 1f 8=
4 00
> > 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d
> > 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48
> > 8b 0d 73 ec 0c 00 f7 d8 64 89 01 48
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RSP: 002b:00007ffeb3ab14e=
8
> > EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RAX: ffffffffffffffda RBX=
:
> > 0000562f7269ae50 RCX: 00007f5b6b92706d
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RDX: 0000000000000004 RSI=
:
> > 00007f5b6bf772f2 RDI: 000000000000002b
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RBP: 00007ffeb3ab1580 R08=
:
> > 0000000000000000 R09: 0000562f728173f0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: R10: 0000000000000000 R11=
:
> > 0000000000000246 R12: 00007f5b6bf772f2
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: R13: 0000000000020000 R14=
:
> > 0000562f7280ffa0 R15: 0000562f7269ae50
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel:=C2=A0 </TASK>
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Modules linked in: amdgpu=
(+)
> > amd_atl intel_rapl_msr snd_hda_codec_atihdmi intel_rapl_common
> > snd_hda_codec_hdmi snd_hda_intel amdxcp drm_panel_backlight_quirks
> > snd_hda_codec gpu_sched drm_buddy snd_hda_core drm_exec kvm_amd
> > drm_suballoc_helper snd_intel_dspcfg drm_ttm_helper
> > snd_intel_sdw_acpi r8169 ee1004 snd_hwdep snd_ctxfi(+) ttm kvm
> > i2c_algo_bit realtek snd_pcm mdio_devres snd_timer irqbypass
> > drm_display_helper libphy snd cec i2c_piix4 rapl wmi_bmof pcspkr
> > video mdio_bus k10temp soundcore i2c_smbus joydev gpio_amdpt
> > mousedev gpio_generic mac_hid dm_mod nfnetlink nvme nvme_core
> > ghash_clmulni_intel nvme_keyring aesni_intel nvme_auth sp5100_tco
> > ccp hkdf wmi zram 842_decompress 842_compress lz4hc_compress
> > crypto_user pkcs8_key_parser ntsync lz4_compress i2c_dev
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: CR2: ffff88cb88dc37b0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: ---[ end trace 0000000000=
000000
> > ]---
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RIP: 0010:set_field+0x30/=
0x60
> > [snd_ctxfi]
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: Code: 44 00 00 49 89 f8 8=
5 f6
> > 74 31 31 c9 40 f6 c6 01 75 18 0f 1f 84 00 00 00 00 00 83 c1 01 b8
> > 01 00 00 00 d3 e0 85 f0 74 f2 d3 e2 <41> 8b 00 31 c2 21 f2 31 c2 41
> > 89 10 e9 5f 80 e7 e2 0f 0b e9 58 80
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RSP: 0018:ffffd07300f1f76=
8
> > EFLAGS: 00010202
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RAX: 00000000ffffffea RBX=
:
> > ffff88c788dc37e0 RCX: 0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RDX: 0000000000000001 RSI=
:
> > 0000000000000001 RDI: ffff88cb88dc37b0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: RBP: 00000000ffffffea R08=
:
> > ffff88cb88dc37b0 R09: 0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: R10: ffffd07300f1f798 R11=
:
> > ffff88c780b27a20 R12: 0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: R13: ffffffffc0597390 R14=
:
> > ffff88c788dc3ca8 R15: ffff88c788dc3660
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: FS:=C2=A0 00007f5b6bfc084=
0(0000)
> > GS:ffff88cb09904000(0000) knlGS:0000000000000000
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: CS:=C2=A0 0010 DS: 0000 E=
S: 0000
> > CR0: 0000000080050033
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: CR2: ffff88cb88dc37b0 CR3=
:
> > 000000010fd04000 CR4: 0000000000350ef0
> > M=C3=83=C2=A4r 11 05:00:57 Sancezz-PC kernel: note: (udev-worker)[707] =
exited
> > with irqs disabled
> > M=C3=83=C2=A4r 11 05:00:58 Sancezz-PC kernel: EXT4-fs (nvme0n1p3): moun=
ted
> > filesystem aca38ff5-c0d5-41f1-bc55-601b911d072a r/w with ordered
> > data mode. Quota mode: none.
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu: Virtual CRAT tabl=
e
> > created for CPU
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu: Topology: Add CPU=
 node
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: enab=
ling
> > device (0006 -> 0007)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > initializing kernel modesetting (NAVY_FLOUNDER 0x1002:0x73DF
> > 0x1458:0x2408 0xC0).
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > register mmio base: 0xFCA00000
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > register mmio size: 1048576
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 0 <common_v1_0_0> (nv_common)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 1 <gmc_v10_0_0> (gmc_v10_0)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 2 <ih_v5_0_0> (navi10_ih)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 3 <psp_v11_0_0> (psp)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 4 <smu_v11_0_0> (smu)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 5 <dce_v1_0_0> (dm)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 6 <gfx_v10_0_0> (gfx_v10_0)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 7 <sdma_v5_2_0> (sdma_v5_2)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 8 <vcn_v3_0_0> (vcn_v3_0)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > detected ip block number 9 <jpeg_v3_0_0> (jpeg_v3_0)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > Fetched VBIOS from VFCT
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu: ATOM BIOS: 113-
> > D5270300-KXT
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: Console: switching to col=
our
> > dummy device 80x25
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: vgaa=
rb:
> > deactivate vga console
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > Trusted Memory Zone (TMZ) feature disabled as experimental
> > (default)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu: vm
> > size is 262144 GB, 4 levels, block size is 9-bit, fragment size is
> > 9-bit
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > VRAM: 12272M 0x0000008000000000 - 0x00000082FEFFFFFF (12272M used)
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: [drm] Detected VRAM RAM=
=3D12272M,
> > BAR=3D16384M
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: [drm] RAM width 192bits G=
DDR6
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > amdgpu: 12272M of VRAM memory ready
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > amdgpu: 7957M of GTT memory ready.
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: [drm] GART: num cpu pages
> > 131072, num gpu pages 131072
> > M=C3=83=C2=A4r 11 05:01:00 Sancezz-PC kernel: [drm] PCIE GART of 512M e=
nabled
> > (table at 0x0000008000300000).
> > M=C3=83=C2=A4r 11 05:01:01 Sancezz-PC kernel: input: ckb1: CORSAIR STRA=
FE RGB
> > MK.2 Mechanical Gaming Keyboard vKB as
> > /devices/virtual/input/input17
> > M=C3=83=C2=A4r 11 05:01:01 Sancezz-PC kernel: input: ckb1: CORSAIR STRA=
FE RGB
> > MK.2 Mechanical Gaming Keyboard vM as
> > /devices/virtual/input/input18
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: Generic FE-GE Realtek PHY
> > r8169-0-800:00: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-
> > 800:00, irq=3DMAC)
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0=
: Link
> > is Down
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: bridge: filtering via
> > arp/ip/ip6tables is no longer available by default. Update your
> > scripts to load br_netfilter if you need this.
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: u32 classifier
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel:=C2=A0=C2=A0=C2=A0=C2=A0 P=
erformance counters on
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel:=C2=A0=C2=A0=C2=A0=C2=A0 i=
nput device check on
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel:=C2=A0=C2=A0=C2=A0=C2=A0 A=
ctions configured
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > STB initialized to 2048 entries
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > [drm] Loading DMUB firmware via PSP: version=3D0x02020021
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: [drm] use_doorbell being =
set
> > to: [true]
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: [drm] use_doorbell being =
set
> > to: [true]
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > [VCN instance 0] Found VCN firmware Version ENC: 1.33 DEC: 4 VEP: 0
> > Revision: 14
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > reserve 0xa00000 from 0x82fd000000 for PSP TMR
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > RAS: optional ras ta ucode is not available
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > SECUREDISPLAY: optional securedisplay ta ucode is not available
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > smu driver if version =3D 0x0000000e, smu fw if version =3D 0x00000012,
> > smu fw program =3D 0, version =3D 0x00413f00 (65.63.0)
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > SMU driver if version not matched
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > use vbios provided pptable
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > SMU is initialized successfully!
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > [drm] Display Core v3.2.359 initialized on DCN 3.0
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > [drm] DP-HDMI FRL PCON supported
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > [drm] DMUB hardware initialized: version=3D0x02020021
> > M=C3=83=C2=A4r 11 05:01:02 Sancezz-PC kernel: snd_hda_intel 0000:0b:00.=
1:
> > bound 0000:0b:00.0 (ops amdgpu_dm_audio_component_bind_ops
> > [amdgpu])
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > kiq ring mec 2 pipe 1 q 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu: HMM registered 12=
272MB
> > device memory
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: kfd kfd: amdgpu: Allocate=
d
> > 3969056 bytes on gart
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: kfd kfd: amdgpu: Total nu=
mber
> > of KFD nodes to be created: 1
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu: Virtual CRAT tabl=
e
> > created for GPU
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu: Topology: Add dGP=
U node
> > [0x73df:0x1002]
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: kfd kfd: amdgpu: added de=
vice
> > 1002:73df
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu: SE
> > 2, SH per SE 2, CU per SH 10, active_cu_number 40
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring gfx_0.1.0 uses VM inv eng 1 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.0.0 uses VM inv eng 4 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.1.0 uses VM inv eng 5 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.2.0 uses VM inv eng 6 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.3.0 uses VM inv eng 7 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.0.1 uses VM inv eng 8 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.1.1 uses VM inv eng 9 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.2.1 uses VM inv eng 10 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring comp_1.3.1 uses VM inv eng 11 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring kiq_0.2.1.0 uses VM inv eng 12 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring sdma0 uses VM inv eng 13 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring sdma1 uses VM inv eng 14 on hub 0
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring vcn_dec_0 uses VM inv eng 0 on hub 8
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring vcn_enc_0.0 uses VM inv eng 1 on hub 8
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring vcn_enc_0.1 uses VM inv eng 4 on hub 8
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > ring jpeg_dec uses VM inv eng 5 on hub 8
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: amdg=
pu:
> > Using BACO for runtime pm
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: [drm=
]
> > Registered 6 planes with drm panic
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: [drm] Initialized amdgpu =
3.64.0
> > for 0000:0b:00.0 on minor 1
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: fbcon: amdgpudrmfb (fb0) =
is
> > primary device
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: [drm] pre_validate_dsc:16=
67
> > MST_DSC dsc precompute is not needed
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: Console: switching to col=
our
> > frame buffer device 240x67
> > M=C3=83=C2=A4r 11 05:01:03 Sancezz-PC kernel: amdgpu 0000:0b:00.0: [drm=
] fb0:
> > amdgpudrmfb frame buffer device
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0=
: Link
> > is Up - 1Gbps/Full - flow control off
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0=
: Link
> > is Up - 1Gbps/Full - flow control off
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) enter=
ed
> > blocking state
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) enter=
ed
> > disabled state
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0=
:
> > entered allmulticast mode
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: r8169 0000:08:00.0 enp8s0=
:
> > entered promiscuous mode
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) enter=
ed
> > blocking state
> > M=C3=83=C2=A4r 11 05:01:05 Sancezz-PC kernel: br0: port 1(enp8s0) enter=
ed
> > forwarding state
> > M=C3=83=C2=A4r 11 05:01:06 Sancezz-PC kernel: nvme nvme0: using uncheck=
ed
> > data buffer
