Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.187.100.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313862;
	b=wz6A0lOlccmrvdwyA6D0F+xGSZYnIH9TqzSZcpP3X2Fl8EiypatdcSRm2CiH7jhGnwzl
	 gP4PV7u4YhXM8yHAS2crDrgjy55ozzvKZvKK/x1/kgSBktv4s40xGAL0fyltHtPnBrkBp
	 jjPMdRfgx+CeFE6p8AKaq4m3Or9bueOM2YL6eXfnrNZy5W6cc7qd9buQvUgRmltxTIiET
	 xRbQuljFIaH1XSqPMPO2rGiRvY3mPhAtoNAxF0ZsC9usrHfGC8dsCyUXO/eAXFoe5efpZ
	 Dzn9SVRne5BOQxwmxTxFI/iUf7wKfNHFFml1yaxOvloIT3IImN/dVPZmDlxedPj3YOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313862;
	h=DMARC-Filter:Received:DKIM-Filter:From:To:Subject:Sender:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hVTHCAXZEhlBz4doll70w9VgPOYhui1d2VyNdPNmhMU=;
	b=LQLTbN8aiDiuLxQYbLvPfnyfkcS9GkThaTGwZ/7HLlERkKTAS6gv+Vv4Pq6oAszJv8qo
	 Qc1RGUt2PeMEXJtlYy9eEdmqbKHwwdoMHjy7t4V/5ptdUBgDyymzA9RMwiTt3aNsQD3aZ
	 lxXRiyw5OJnqH5vm6jLOLFmwdbrgr+6Gi9EtttrAgkilJTPX6uY5TG8KHLeKP324OnRhf
	 feS9Woync/eLE3H1Ub7xHAP6HDcdigmuVSN/w79yn13ZWLgV9zw5Yeg5daJcUhzHu5Vb4
	 GCVYN42K9op5kAISdEQPIXUZqyq3i/FGQwv5zjJALj+c0De+lm4TH35XsKecSY2hTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=piap.pl;
	spf=pass smtp.mailfrom=piap.pl;
	arc=none smtp.remote-ip=195.187.100.5
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A49606A321
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 12:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A49606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 4B910C3F2A4F
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 13:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 4B910C3F2A4F
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: linux-sound@vger.kernel.org
Subject: NULL ptr dereference in cs42l43/cs35l56 on Lenovo Yoga 7 Slim laptop
Sender: khalasa@piap.pl
Date: Tue, 10 Nov 2026 13:30:52 +0100
Message-ID: <m31p8sx403.fsf@t19.piap.pl>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to use some audio on a certain new laptop:
DMI: LENOVO 83R0/LNVNB161216, BIOS UCCN16WW 08/07/2026. Aka Yoga 7 Slim
14ILL11 or something like that. Also LENOVO_MT_83R0_BU_idea_FM_Yoga
Slim 7 14ILL11.
Linux version 7.4.0-rc2+
Ubuntu 26.04.01 LTS.
Kernel config is copied from Ubuntu 26.04.01 LTS test kernel.
Lots of ACPI errors in dmesg.

Oops: general protection fault, kernel NULL pointer dereference 0x38: 0000 =
[#1] SMP NOPTI
CPU: 5 UID: 0 PID: 797 Comm: (udev-worker) Tainted: G E 7.4.0-rc2+ #1 PREEM=
PT(lazy)
Tainted: [E]=3DUNSIGNED_MODULE
Hardware name: LENOVO 83R0/LNVNB161216, BIOS UCCN16WW 08/07/2026
RIP: 0010:snd_soc_card_get_kcontrol.cold+0x73/0xe3 [snd_soc_core]
Code: d2 6b 39 c1 e8 1d 03 96 fa 4c 8b 45 a0 4c 8b 4d a8 31 c0 b9 10 00 00 =
00 48 8d 7d b0 be 2c 00 00 00 f3 ab 4c 89 c7 4c 89 45 a8 <49> 8b 59 38 c7 4=
5 b4 02 00 00 00 e8 bc 68 fa fb 4c 8b 45 a8 48 83
RSP: 0018:ffffd4bec5aef418 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8df1c6668e38 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 000000000000002c RDI: ffffd4bec5aef48c
RBP: ffffd4bec5aef478 R08: ffffd4bec5aef48c R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc284a835
R13: 0000000000000005 R14: ffff8df1c6668e38 R15: 0000000000000000
FS:  000074609ecccc80(0000) GS:ffff8df57084b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000073f68f08e250 CR3: 00000001a07ff003 CR4: 0000000008f72ef0
PKRU: 55555554
Call Trace:
 <TASK>
 snd_soc_component_get_kcontrol+0x88/0xd0 [snd_soc_core]
 cs42l43_dai_probe+0xb3/0x150 [snd_soc_cs42l43]
 snd_soc_pcm_dai_probe+0x5a/0xe0 [snd_soc_core]
 snd_soc_bind_card+0x6f5/0xda0 [snd_soc_core]
 call_soc_bind_card+0x69/0xf0 [snd_soc_core]
 snd_soc_component_register+0x19b/0x2f0 [snd_soc_core]
 ? snd_soc_component_new+0xc1/0x110 [snd_soc_core]
 snd_soc_register_component+0x32/0x50 [snd_soc_core]
 cs35l56_component_register+0x42/0x7e [snd_soc_cs35l56]
 cs35l56_common_probe+0x7ba/0x88a [snd_soc_cs35l56]
 cs35l56_spi_probe+0xc3/0xe0 [snd_soc_cs35l56_spi]
 spi_probe+0x62/0xe0
 really_probe+0xff/0x3c0
 __driver_probe_device+0xad/0x1e0
 ? spi_match_device+0xe6/0x110
 driver_probe_device+0x24/0xb0
 ? __pfx___driver_attach+0x10/0x10
 __driver_attach+0xf8/0x260
 ? __pfx___driver_attach+0x10/0x10
 bus_for_each_dev+0x93/0x100
 driver_attach+0x1e/0x30
 bus_add_driver+0x1fd/0x2a0
 driver_register+0x75/0xf0
 __spi_register_driver+0xaf/0x100
 ? __pfx_init_module+0x10/0x10 [snd_soc_cs35l56_spi]
 cs35l56_spi_driver_init+0x1c/0xff0 [snd_soc_cs35l56_spi]
 do_one_initcall+0x81/0x3f0
 do_init_module+0x93/0x2c0
 load_module+0x2239/0x2660
 ? ima_post_read_file+0x11a/0x1a0
 ? security_kernel_post_read_file+0x70/0x1e0
 init_module_from_file+0xf0/0x1d0
 idempotent_init_module+0x218/0x340
 __x64_sys_finit_module+0x7c/0x110
 x64_sys_call+0xfbc/0x23d0
 do_syscall_64+0xbd/0x570
 ? vfs_read+0x1b2/0x460
 ? vfs_read+0x1b2/0x460
 ? ksys_pread64+0x5c/0xd0
 ? do_syscall_64+0x293/0x570
 ? __x64_sys_newfstatat+0x1c/0x30
 ? x64_sys_call+0x2074/0x23d0
 ? do_syscall_64+0xfa/0x570
 ? __x64_sys_finit_module+0x7c/0x110
 ? do_syscall_64+0x293/0x570
 ? putname+0x41/0x90
 ? do_sys_openat2+0x75/0xf0
 ? __x64_sys_openat+0x5f/0xa0
 ? x64_sys_call+0x1a20/0x23d0
 ? do_syscall_64+0xfa/0x570
 ? exc_page_fault+0x9d/0x1d0
 ? do_syscall_64+0x33/0x570
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x74609e534acd
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 0b d3 0d 00 f7 d8 64 89 01 48
RSP: 002b:00007ffd1c5fa158 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000062a3e7400e50 RCX: 000074609e534acd
RDX: 0000000000000000 RSI: 000074609e63d317 RDI: 000000000000002c
RBP: 00007ffd1c5fa1f0 R08: 0000000000000000 R09: 000062a3e7529fb0
R10: 0000000000000000 R11: 0000000000000246 R12: 000074609e63d317
R13: 000062a3e7378770 R14: 0000000000020000 R15: 0000000000000000
 </TASK>
Modules linked in: many
---[ end trace 0000000000000000 ]---
RIP: 0010:snd_soc_card_get_kcontrol.cold+0x73/0xe3 [snd_soc_core]
Code: d2 6b 39 c1 e8 1d 03 96 fa 4c 8b 45 a0 4c 8b 4d a8 31 c0 b9 10 00 00 =
00 48 8d 7d b0 be 2c 00 00 00 f3 ab 4c 89 c7 4c 89 45 a8 <49> 8b 59 38 c7 4=
5 b4 02 00 00 00 e8 bc 68 fa fb 4c 8b 45 a8 48 83
RSP: 0018:ffffd4bec5aef418 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8df1c6668e38 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 000000000000002c RDI: ffffd4bec5aef48c
RBP: ffffd4bec5aef478 R08: ffffd4bec5aef48c R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc284a835
R13: 0000000000000005 R14: ffff8df1c6668e38 R15: 0000000000000000
FS:  000074609ecccc80(0000) GS:ffff8df5706cb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000062a3e720ea78 CR3: 00000001a07ff006 CR4: 0000000008f72ef0


Tried 7.3.something first, no NULL ptr dereferences, but it tried to
talk with some ghost rt711-sdca chip, and the sound didn't work either.
7.2.x, there were some topology problems or something, apparently that
was fixed in the tree.

Added some pr_crit()s:

sof-audio-pci-intel-lnl 0000:00:1f.3: enabling device (0000 -> 0002)
sof-audio-pci-intel-lnl 0000:00:1f.3: DSP detected with PCI class/subclass/=
prog-if 0x040100
sof-audio-pci-intel-lnl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_c=
omponent_bind_ops [xe])
sof-audio-pci-intel-lnl 0000:00:1f.3: use msi interrupt mode
cs42l43 sdw:0:0:01fa:4243:01: supply vdd-p not found, using dummy regulator
cs42l43 sdw:0:0:01fa:4243:01: supply vdd-d not found, using dummy regulator
cs42l43 sdw:0:0:01fa:4243:01: supply vdd-a not found, using dummy regulator
cs42l43 sdw:0:0:01fa:4243:01: supply vdd-io not found, using dummy regulator
cs42l43 sdw:0:0:01fa:4243:01: supply vdd-cp not found, using dummy regulator
sof-audio-pci-intel-lnl 0000:00:1f.3: No SoundWire machine driver found for=
 the ACPI-reported configuration:
sof-audio-pci-intel-lnl 0000:00:1f.3: link 0 mfg_id 0x01fa part_id 0x4243 v=
ersion 0x3
sof-audio-pci-intel-lnl 0000:00:1f.3: Use SoundWire default machine driver =
with function topologies
sof-audio-pci-intel-lnl 0000:00:1f.3: hda codecs found, mask 4
sof-audio-pci-intel-lnl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask =
0x4
sof-audio-pci-intel-lnl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
sof-audio-pci-intel-lnl 0000:00:1f.3: DMICs detected in NHLT tables: 4
cs42l43 sdw:0:0:01fa:4243:01: devid: 0x042a43, rev: 0xa1, otp: 0x03
sof-audio-pci-intel-lnl 0000:00:1f.3: Firmware paths/files for ipc type 1:
sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/ln=
l/sof-lnl.ri
sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-li=
b/lnl
sof-audio-pci-intel-lnl 0000:00:1f.3:  Topology file:     function topologi=
es
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded firmware library: ADSPFW, vers=
ion: 2.14.1.1
Adding alias for supply vdd-amp,(null) -> vdd-amp,sdw:0:0:01fa:4243:01
cs35l56_spi_probe
cs35l56_common_probe
cs35l56 spi-cs35l56-left: supply VDD_P not found, using dummy regulator
cs35l56 spi-cs35l56-left: supply VDD_IO not found, using dummy regulator
cs35l56 spi-cs35l56-left: supply VDD_A not found, using dummy regulator
cs35l56_common_probe: about to call cs35l56_init()
cs35l56 spi-cs35l56-left: Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patche=
d=3D0)
sof-audio-pci-intel-lnl 0000:00:1f.3: Booted firmware version: 2.14.1.1
cs35l56_common_probe: about to call cs35l56_component_register()
cs35l56_component_register
cs35l56_spi_probe
cs35l56_common_probe
cs35l56 spi-cs35l56-right: supply VDD_P not found, using dummy regulator
cs35l56 spi-cs35l56-right: supply VDD_IO not found, using dummy regulator
cs35l56 spi-cs35l56-right: supply VDD_A not found, using dummy regulator
cs35l56_common_probe: about to call cs35l56_init()
cs35l56 spi-cs35l56-right: Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patch=
ed=3D0)
cs35l56_common_probe: about to call cs35l56_component_register()
cs35l56_component_register
snd_soc_component_get_kcontrol(Speaker Digital Switch, name =3D Speaker Dig=
ital Switch): component->card is NULL, expect problems
snd_soc_card_get_kcontrol(): name: "Speaker Digital Switch"
soc_card: NULL
Oops: general protection fault, kernel NULL pointer dereference follows.

What are my options?

Additional info available on request. This is not my laptop, though.
--=20
Krzysztof "Chris" Ha=C5=82asa

=C5=81ukasiewicz Research Network
Industrial Research Institute for Automation and Measurements PIAP

Al. Jerozolimskie 202, 02-486 Warsaw, Poland
