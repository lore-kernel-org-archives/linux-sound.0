Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5C31AAA8
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096329; cv=none; b=X2c/zfE4BX1829HVD7yVhouS+sfMJ434EgXx2YhjqFvwE0us8xeJILfvcd5o4+3FlIMZxQwYuLVgR60QmOOrjin27+cJF71XVCk4q5X/2wc8WS2eYyM5EcSnqHYX6PInmX4jr5COGU2bK/Sh0M9zLvuni+v35tOS29018sy7DBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096329; c=relaxed/simple;
	bh=aqH3bT0cURuk7Fo5hkmbm/HFigf+muDHdkmFLZ4WZuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vrc05uZHzP20xOimKNQhpUiz/ksOPZdkJQ+iVB8IkhKw//bl58n8bn0aLrdhpXx3tmPSJ4VC/2ohbGtu4d96D0QuwaojMv8nxAQ3XRO5wnn22YGjB5Wdk5hnsSZZvm5uBUZ5JIwXd9DccYKOI2K5zXTsEd3AeBhnXeNlJMT6Pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OUvPZROq; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OUvPZROq"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g9lzq65BMz9tcW;
	Wed,  6 May 2026 21:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778096311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1nZ+cnAuoIpK4/AnwQF1E+FPt+KiVBN/5XntzBLezZ4=;
	b=OUvPZROqqsdh2niyAgV/1Tq+oIQAvmPRT+WVlFI362+L7PJ8AtGEhr14OezN52SCwumeRA
	DlvXM4Kc7A57CVcriNiGCb6L/JWZ0AQpQfxRVVn60x9/bv8mpD65jlftsmkHSIlM6jySGi
	wMq2hFwYUIPyhbpt6fF7T+D+yQLkY6c/l/ZKgAXvA833clKUrXV5KTN4gomekBLfgLfaIL
	U7J9775hRKErVYnDEveeGnUIohnKn2HWPGDt9vnhXk0dZlcI54oGFh/mheoX2zG9IVXVDr
	Pn12i7xeIwDCP1O4Api2ciSB1SP6tXdKx8Klhpi5KjCv9bZBQLMDAMnVRwCOcg==
From: Tobias Bachmann <tobac@mailbox.org>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>
Subject: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther Lake;
 chip stuck across distros and kernels; worked initially;
 still working at hardware level
Date: Wed, 06 May 2026 21:38:27 +0200
Message-ID: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPartiF6niM64RlG-SNYbphzYTA"
Content-Transfer-Encoding: 7Bit
X-MBO-RS-META: c1r6hu4p3hg9fbr46tonjy6eiyxez1k5
X-MBO-RS-ID: 6ce1dafa679a9f634ed

This is a multi-part message in MIME format.

--nextPartiF6niM64RlG-SNYbphzYTA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi all,

I'm hitting a persistent CS42L43 SDCA reattach timeout on a Dell XPS 14
(Panther Lake) that I haven't been able to clear via any software means. Au=
dio=20
worked correctly for several days after Arch Linux (with CachyOS kernel)=20
install, then stopped without any change in hardware, kernel version or aud=
io-
related software stack and has not recovered since across multiple kernels =
and=20
distributions.

Hardware:
=2D Dell XPS 14 (DA14260) with Intel Panther Lake
=2D Audio: CS42L43 (link 0) + CS35L57 (links 2, 3)
=2D PCI audio: Intel 8086:e428, Dell SSID 1028:0db9
=2D BIOS: 1.3.1 dated 2026-02-12

Reproduced on:
=2D linux-cachyos 7.0.1 and 7.0.3
=2D Fedora Rawhide (current daily, kernel 7.1-rc1)

Symptom:=20
=2D dmesg at boot: sdca_class sdw:0:0:01fa:4245:01: timed out waiting for d=
evice=20
re-attach
=2D no ALSA card is created. SOF probe ultimately fails. CS35L57 amps on
links 2 and 3 seem to enumerate cleanly; only the CS42L43 on link 0 seems t=
o=20
fail to complete the reattach handshake.

What does NOT recover the chip:
=2D Reboot (warm or cold)
=2D Kernel downgrade to the initial 7.0.1
=2D Cold power cycle (>60s power button hold, >5min off-state, no AC)
=2D BIOS (or, rather, UEFI) settings reset to factory defaults
=2D Boot Windows 11 (with Cirrus driver loaded, audio fully working
  in Windows), clean shutdown, then boot Linux

What confirms hardware is functional:
=2D Dell SupportAssist firmware-level audio diagnostic plays clear tones
  on all speakers
=2D Windows 11 with Cirrus driver yields a fully functional soundcard

Debug log attached: dmesg with snd_soc_sdca.dyndbg=3D+p
soundwire_bus.dyndbg=3D+p soundwire_intel.dyndbg=3D+p

Notable observations from the debug log:
=2D CS42L43 enumerates and "probe complete" succeeds
=2D soundwire_intel.link.0 reports "first link up, programming SYNCPRD"
=2D After that, no further activity on link 0 =E2=80=94 no "Slave attached,
  programming device number" event
=2D 5s later, the SDCA reattach times out
=2D CS35L57 amps on links 2/3 complete the full enumeration sequence

Possibly relevant (secondary) bug:
A kernel oops is reproducible on demand by running
"modprobe -r snd_sof_pci_intel_ptl". Stack trace shows NULL deref in
sdca_dev_unregister_functions during cleanup of an incompletely-probed
device. Oops log attached separately. Whether this is related to
the persistent reattach failure or a separate issue, I'm not sure.

Attached:=20
1. dmesg with snd_soc_sdca.dyndbg=3D+p soundwire_bus.dyndbg=3D+p
soundwire_intel.dyndbg=3D+p showing CS42L43 enumeration completing but reat=
tach
timing out
2. Earlier kernel oops after "modprobe -r snd_sof_pci_intel_ptl" for=20
additional context (may be relevant to a secondary bug in=20
snd_soc_sdca cleanup, but is not the primary issue here as the audio failur=
e=20
occurred independently of the oops in subsequent boots).
3. Output from alsa-info.sh
4. lspci -nnvv output

I'm happy to test patches, capture additional logs, or run any debug
builds. Hardware is reproducibly stuck so any patch can be verified
quickly.

Thanks,
Tobias
--nextPartiF6niM64RlG-SNYbphzYTA
Content-Disposition: attachment; filename="kernel_oops.txt"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="kernel_oops.txt"

[  516.813945] BUG: kernel NULL pointer dereference, address: 0000000000000=
040
[  516.813958] #PF: supervisor read access in kernel mode
[  516.813963] #PF: error_code(0x0000) - not-present page
[  516.813966] PGD 0 P4D 0=20
[  516.813972] Oops: Oops: 0000 [#1] SMP NOPTI
[  516.813980] CPU: 8 UID: 0 PID: 6711 Comm: modprobe Tainted: G     U   C =
         7.0.3-1-cachyos #1 PREEMPT  ca65a572a601df66b8f4abb33552edd84ad0d9=
0c
[  516.813990] Tainted: [U]=3DUSER, [C]=3DCRAP
[  516.813992] Hardware name: Dell Inc. XPS 14 DA14260/0VRKYR, BIOS 1.3.1 0=
2/12/2026
[  516.813996] RIP: 0010:device_del+0x27/0x3c0
[  516.814007] Code: 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 41 57 41 56 41 =
55 41 54 53 48 83 ec 20 49 89 fe 65 48 8b 05 66 9c 34 02 48 89 44 24 18 <4c=
> 8b 6f 40 4c 8d bf 90 00 00 00 4c 89 ff e8 d6 24 58 00 49 8b 46
[  516.814011] RSP: 0018:ffffce9a290476f8 EFLAGS: 00010282
[  516.814016] RAX: 2f1da11d95413b00 RBX: ffff8be3ce5c1000 RCX: 2f1da11d954=
13b00
[  516.814019] RDX: 000fffffffe00010 RSI: 0000000000000000 RDI: 00000000000=
00000
[  516.814022] RBP: 000000000000007a R08: 000000000000002e R09: 00000000000=
00010
[  516.814025] R10: 0000000000000008 R11: ffffffffc1cfd310 R12: 00000000000=
00000
[  516.814027] R13: ffffffff83b5c52f R14: 0000000000000000 R15: ffff8be3ce5=
c1638
[  516.814030] FS:  00007f8ba2e4d780(0000) GS:ffff8beb5b09e000(0000) knlGS:=
0000000000000000
[  516.814033] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  516.814036] CR2: 0000000000000040 CR3: 00000002f2c31006 CR4: 0000000100f=
72ef0
[  516.814039] PKRU: 55555554
[  516.814041] Call Trace:
[  516.814045]  <TASK>
[  516.814058]  sdca_dev_unregister_functions+0x3b/0x70 [snd_soc_sdca e7d89=
98f086fc5ac9c1a2505e90b7eba082a442c]
[  516.814082]  devres_release_all+0xc3/0x160
[  516.814095]  device_release_driver_internal+0x212/0x320
[  516.814101]  bus_remove_device+0x10c/0x190
[  516.814109]  ? device_remove_attrs+0xbe/0x100
[  516.814114]  device_del+0x262/0x3c0
[  516.814118]  ? mntput_no_expire_slowpath+0x75/0x220
[  516.814126]  device_unregister+0x17/0x70
[  516.814132]  sdw_delete_slave+0xb2/0xd0 [soundwire_bus f73050d05d3ab43e8=
2f751baf1e0eec95915ba1b]
[  516.814158]  ? __pfx_sdw_delete_slave+0x10/0x10 [soundwire_bus f73050d05=
d3ab43e82f751baf1e0eec95915ba1b]
[  516.814178]  device_for_each_child+0x7a/0xb0
[  516.814183]  sdw_bus_master_delete+0x1e/0x60 [soundwire_bus f73050d05d3a=
b43e82f751baf1e0eec95915ba1b]
[  516.814203]  device_release_driver_internal+0x1c2/0x320
[  516.814208]  bus_remove_device+0x10c/0x190
[  516.814211]  ? device_remove_attrs+0xad/0x100
[  516.814215]  device_del+0x262/0x3c0
[  516.814221]  sdw_intel_exit+0x88/0x110 [soundwire_intel 4f39aaa92dde1d7d=
35dfb4ae34c8e7d56301918a]
[  516.814239]  hda_dsp_remove+0x7e/0x1b0 [snd_sof_intel_hda_generic ab5943=
5e52355bbec50366ba2ee60048450b7222]
[  516.814249]  snd_sof_device_remove+0xe5/0x170 [snd_sof 56f27a00347eb0dfa=
fd21ad4f98555c0e06974df]
[  516.814315]  sof_pci_remove+0x1e/0x50 [snd_sof_pci c1df61a71db4eb00085a4=
5b43f0796075af0c12f]
[  516.814320]  pci_device_remove.llvm.14558790169041358247+0x45/0xc0
[  516.814328]  device_release_driver_internal+0x1c2/0x320
[  516.814333]  driver_detach+0x8f/0xd0
[  516.814337]  bus_remove_driver+0x8c/0x100
[  516.814341]  pci_unregister_driver+0x1e/0xa0
[  516.814346]  __se_sys_delete_module+0x2c2/0x480
[  516.814352]  ? kernfs_fop_open.llvm.7913487363939085125+0x12c/0x360
[  516.814360]  do_syscall_64+0x6d/0xa90
[  516.814366]  ? __x64_sys_read+0x246/0x3e0
[  516.814375]  ? do_pte_missing+0x57a/0xe90
[  516.814380]  ? handle_mm_fault+0x2e7/0x700
[  516.814386]  ? do_user_addr_fault+0x26c/0x450
[  516.814391]  ? irqentry_exit+0x58/0x740
[  516.814395]  asm_fred_entrypoint_user+0x41/0x41
[  516.814402] RIP: 0033:0x7f8ba254b15b
[  516.814505] Code: 73 01 c3 48 8b 0d cd db 0f 00 f7 d8 64 89 01 48 83 c8 =
ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 9d db 0f 00 f7 d8 64 89 01 48
[  516.814509] RSP: 002b:00007fffab0fb268 EFLAGS: 00000206 ORIG_RAX: 000000=
00000000b0
[  516.814514] RAX: ffffffffffffffda RBX: 00005647ffb64d80 RCX: 00000000000=
00000
[  516.814516] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 00005647ffb=
64de0
[  516.814519] RBP: 00007fffab0fb290 R08: 0000000000000000 R09: 00000000000=
00000
[  516.814521] R10: 0000000000000000 R11: 00007f8ba2e4d780 R12: 00000000000=
00000
[  516.814523] R13: 00007fffab0fb2c0 R14: 0000000000000000 R15: 00000000000=
00000
[  516.814526]  </TASK>
[  516.814528] Modules linked in: snd_seq_dummy rfcomm snd_hrtimer snd_seq =
snd_seq_device wireguard libcurve25519 ip6_udp_tunnel udp_tunnel hid_sensor=
_custom_intel_hinge hid_sensor_als hid_sensor_prox hid_sensor_trigger kfifo=
_buf hid_sensor_iio_common industrialio hid_sensor_custom hid_sensor_hub in=
tel_ishtp_hid ccm algif_aead des3_ede_x86_64 des_generic libdes md4 cmac al=
gif_hash algif_skcipher af_alg snd_soc_sof_sdw snd_soc_intel_hda_dsp_common=
 snd_sof_probes snd_soc_cs35l56_sdw snd_soc_cs35l56 snd_soc_cs35l56_shared =
bnep snd_soc_cs_amp_lib snd_soc_wm_adsp snd_hda_codec_intelhdmi snd_soc_sdc=
a_class snd_hda_codec_hdmi cs_dsp regmap_sdw snd_soc_dmic snd_hda_intel snd=
_sof_pci_intel_ptl(-) snd_sof_pci_intel_lnl snd_sof_pci_intel_mtl snd_sof_i=
ntel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hd=
a_common snd_soc_hdac_hda snd_sof_intel_hda snd_sof_intel_hda_mlink soundwi=
re_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_hda_ext=
_core snd_hda_codec snd_hda_core snd_soc_acpi_intel_match
[  516.814584]  intel_uncore_frequency snd_soc_acpi_intel_sdca_quirks intel=
_uncore_frequency_common snd_intel_dspcfg snd_intel_sdw_acpi soundwire_gene=
ric_allocation snd_soc_sdw_utils snd_soc_acpi snd_hwdep x86_pkg_temp_therma=
l intel_powerclamp iwlmld soundwire_bus coretemp snd_soc_sdca mac80211 snd_=
soc_core kvm_intel ptp pps_core ac97_bus cdc_mbim snd_pcm_dmaengine libarc4=
 cdc_wdm snd_compress cdc_ncm kvm cdc_ether intel_ipu7_isys(C) processor_th=
ermal_device_pci snd_pcm usbnet snd_ctl_led processor_thermal_device dell_p=
c videobuf2_dma_sg processor_thermal_power_floor snd_timer r8152 irqbypass =
iTCO_wdt ucsi_acpi videobuf2_memops processor_thermal_wt_hint mei_gsc_proxy=
 btintel_pcie iwlwifi snd intel_pmc_bxt typec_ucsi btintel intel_cstate vfa=
t processor_thermal_wt_req mii videobuf2_v4l2 dell_laptop fat gpio_usbio i2=
c_usbio videobuf2_common intel_rapl_msr dell_wmi intel_uncore cfg80211 i2c_=
i801 dell_smbios roles bluetooth soundcore psmouse dell_wmi_ddv processor_t=
hermal_rfim intel_ish_ipc pcspkr i2c_smbus mei_me libphy
[  516.814653]  ov08x40 typec spi_nor dcdbas dell_smm_hwmon dell_wmi_sysman=
 firmware_attributes_class mdio_bus dell_wmi_descriptor wmi_bmof intel_skl_=
int3472_tps68470 cdc_acm mtd crc8 usbio i2c_mux mei rfkill intel_ishtp thun=
derbolt v4l2_fwnode processor_thermal_mbox i2c_hid_acpi intel_pmc_core tps6=
8470_regulator clk_tps68470 v4l2_async i2c_hid platform_temperature_control=
 joydev mousedev intel_pmc_ssram_telemetry int3403_thermal processor_therma=
l_rapl videodev pmt_telemetry intel_rapl_common processor_thermal_soc_slide=
r pmt_discovery intel_hid int3400_thermal intel_skl_int3472_discrete acpi_t=
ad mc acpi_thermal_rel platform_profile sparse_keymap pmt_class intel_ipu7(=
C) acpi_pad intel_skl_int3472_common pinctrl_intel_platform intel_vpu int34=
0x_thermal_zone ipu_bridge igen6_edac mac_hid i2c_dev crypto_user pkcs8_key=
_parser nfnetlink dm_crypt encrypted_keys trusted tee asn1_encoder hid_mult=
itouch dm_mod xe drm_buddy drm_suballoc_helper gpu_sched nvme drm_ttm_helpe=
r ttm nvme_core drm_gpuvm drm_exec drm_gpusvm_helper
[  516.814723]  nvme_keyring ghash_clmulni_intel i2c_algo_bit aesni_intel v=
ideo nvme_auth spi_intel_pci hkdf intel_lpss_pci spi_intel intel_lpss drm_d=
isplay_helper wmi idma64 intel_vsec serio_raw cec
[  516.814744] CR2: 0000000000000040
[  516.814747] ---[ end trace 0000000000000000 ]---
[  516.814752] RIP: 0010:device_del+0x27/0x3c0
[  516.814757] Code: 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 41 57 41 56 41 =
55 41 54 53 48 83 ec 20 49 89 fe 65 48 8b 05 66 9c 34 02 48 89 44 24 18 <4c=
> 8b 6f 40 4c 8d bf 90 00 00 00 4c 89 ff e8 d6 24 58 00 49 8b 46
[  516.814760] RSP: 0018:ffffce9a290476f8 EFLAGS: 00010282
[  516.814763] RAX: 2f1da11d95413b00 RBX: ffff8be3ce5c1000 RCX: 2f1da11d954=
13b00
[  516.814765] RDX: 000fffffffe00010 RSI: 0000000000000000 RDI: 00000000000=
00000
[  516.814767] RBP: 000000000000007a R08: 000000000000002e R09: 00000000000=
00010
[  516.814769] R10: 0000000000000008 R11: ffffffffc1cfd310 R12: 00000000000=
00000
[  516.814771] R13: ffffffff83b5c52f R14: 0000000000000000 R15: ffff8be3ce5=
c1638
[  516.814773] FS:  00007f8ba2e4d780(0000) GS:ffff8beb5b09e000(0000) knlGS:=
0000000000000000
[  516.814775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  516.814777] CR2: 0000000000000040 CR3: 00000002f2c31006 CR4: 0000000100f=
72ef0
[  516.814780] PKRU: 55555554
[  516.814782] note: modprobe[6711] exited with irqs disabled

--nextPartiF6niM64RlG-SNYbphzYTA
Content-Disposition: attachment; filename="dmesg-broken_reattach.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="dmesg-broken_reattach.txt"

[    0.000000] Linux version 7.0.3-1-cachyos (linux-cachyos@cachyos) (clang version 22.1.3, LLD 22.1.3) #1 SMP PREEMPT Fri, 01 May 2026 19:46:26 +0000
[    0.000000] Command line: initrd=\initramfs-linux-cachyos.img root=/dev/mapper/root rw net.ifnames=0 xe.enable_panel_replay=0 snd_soc_sdca.dyndbg=+p soundwire_bus.dyndbg=+p soundwire_intel.dyndbg=+p drm.debug=0
[    0.000000] x86/CPU: Model not found in latest microcode list
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kernel split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff]  System RAM
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff]  device reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000066718fff]  System RAM
[    0.000000] BIOS-e820: [mem 0x0000000066719000-0x0000000066719fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x000000006671a000-0x00000000667cefff]  System RAM
[    0.000000] BIOS-e820: [mem 0x00000000667cf000-0x00000000667d2fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x00000000667d3000-0x00000000667d4fff]  ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000667d5000-0x0000000067cc9fff]  System RAM
[    0.000000] BIOS-e820: [mem 0x0000000067cca000-0x0000000067ccafff]  ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000067ccb000-0x0000000067d49fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x0000000067d4a000-0x0000000069514fff]  System RAM
[    0.000000] BIOS-e820: [mem 0x0000000069515000-0x000000006d510fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x000000006d511000-0x000000006dd71fff]  ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000006dd72000-0x000000006dffefff]  ACPI data
[    0.000000] BIOS-e820: [mem 0x000000006dfff000-0x000000006dffffff]  System RAM
[    0.000000] BIOS-e820: [mem 0x000000006e000000-0x00000000807fffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x0000000080800000-0x00000000dfffffff]
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x00000000f0000000-0x00000000f7ffffff]
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000f9ffffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fa000000-0x00000000fed1ffff]
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed8ffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fed90000-0x00000000feffffff]
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000001043fffff]  device reserved
[    0.000000] BIOS-e820: [mem 0x0000000104400000-0x000000087f7fffff]  System RAM
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.7 by Dell
[    0.000000] efi: ACPI=0x6dffe000 ACPI 2.0=0x6dffe014 SMBIOS=0x69e06000 TPMFinalLog=0x6dca5000 ESRT=0x69db6518 MEMATTR=0x61275018 RNG=0x6df10f18 INITRD=0x611d8c98 TPMEventLog=0x6df04018 
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem107: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
[    0.000000] e820: remove [mem 0xe0000000-0xefffffff] device reserved
[    0.000000] efi: Remove mem108: MMIO range=[0xf8000000-0xf9ffffff] (32MB) from e820 map
[    0.000000] e820: remove [mem 0xf8000000-0xf9ffffff] device reserved
[    0.000000] efi: Remove mem110: MMIO range=[0xff000000-0xffffffff] (16MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] device reserved
[    0.000000] SMBIOS 3.9 present.
[    0.000000] DMI: Dell Inc. XPS 14 DA14260/0VRKYR, BIOS 1.5.1 04/01/2026
[    0.000000] DMI: Memory slots populated: 8/8
[    0.000000] tsc: Detected 3700.000 MHz processor
[    0.000000] tsc: Detected 3686.400 MHz TSC
[    0.000004] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
[    0.000006] e820: remove [mem 0x000a0000-0x000fffff] System RAM
[    0.000010] last_pfn = 0x87f800 max_arch_pfn = 0x400000000
[    0.000013] MTRR map: 9 entries (3 fixed + 6 variable; max 23), built from 10 variable MTRRs
[    0.000014] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000235] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000236] last_pfn = 0x6e000 max_arch_pfn = 0x400000000
[    0.004195] esrt: Reserving ESRT space from 0x0000000069db6518 to 0x0000000069db6578.
[    0.004202] Using GB pages for direct mapping
[    0.004432] Initialize FRED on CPU0
[    0.004434] Secure boot disabled
[    0.004435] RAMDISK: [mem 0x599d9000-0x5b409fff]
[    0.004457] ACPI: Early table checksum verification disabled
[    0.004459] ACPI: RSDP 0x000000006DFFE014 000024 (v02 DELL  )
[    0.004461] ACPI: XSDT 0x000000006DF31228 0001B4 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004465] ACPI: FACP 0x000000006DF6D000 000114 (v06 DELL   INTEL ID 00000002      01000013)
[    0.004467] ACPI: DSDT 0x000000006DF6F000 07D46B (v02 DELL   INTEL ID 00000002      01000013)
[    0.004469] ACPI: FACS 0x000000006DCD5000 000040
[    0.004470] ACPI: SSDT 0x000000006DFFC000 000388 (v02 PmaxDv Pmax_Dev 00000001 INTL 20210930)
[    0.004471] ACPI: HEST 0x000000006DFFB000 000054 (v02 DELL   INTEL ID 00000002      01000013)
[    0.004472] ACPI: DTPR 0x000000006DFFA000 000090 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004472] ACPI: SSDT 0x000000006DFF9000 000024 (v02 INTEL  TxtSsdt  00001000 INTL 20210930)
[    0.004473] ACPI: SSDT 0x000000006DFF8000 00087C (v02 INTEL  IgfxSsdt 00003000 INTL 20210930)
[    0.004474] ACPI: SSDT 0x000000006DFF7000 0000AD (v02 INTEL  TseSsdt  00001000 INTL 20210930)
[    0.004475] ACPI: SSDT 0x000000006DFEE000 008859 (v02 INTEL  TcssSsdt 00001000 INTL 20210930)
[    0.004476] ACPI: SSDT 0x000000006DFED000 0000E0 (v02 INTEL  IpuSsdt  00001000 INTL 20210930)
[    0.004477] ACPI: SSDT 0x000000006DF6E000 000D12 (v02 DELL   DellRtd3 00001000 INTL 20210930)
[    0.004478] ACPI: HPET 0x000000006DF6C000 000038 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004479] ACPI: WSMT 0x000000006DF6B000 000028 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004479] ACPI: APIC 0x000000006DF6A000 000158 (v06 DELL   INTEL ID 00000000      01000013)
[    0.004480] ACPI: SSDT 0x000000006DF61000 0076C8 (v02 INTEL  PepoSsdt 00001000 INTL 20210930)
[    0.004481] ACPI: SSDT 0x000000006DF56000 00A993 (v02 MiCaTb MiCaTabl 00001000 INTL 20210930)
[    0.004482] ACPI: SSDT 0x000000006DF53000 00227E (v02 INTEL  PDatTabl 00001000 INTL 20210930)
[    0.004483] ACPI: SSDT 0x000000006DF50000 002D55 (v02 DptfTb DptfTabl 00001000 INTL 20210930)
[    0.004484] ACPI: SSDT 0x000000006DF4F000 000770 (v02 PmRef  Cpu0Ist  00003000 INTL 20210930)
[    0.004484] ACPI: SSDT 0x000000006DF4E000 0005F5 (v02 PmRef  Cpu0Hwp  00003000 INTL 20210930)
[    0.004485] ACPI: SSDT 0x000000006DF4D000 000196 (v02 PmRef  Cpu0Psd  00003000 INTL 20210930)
[    0.004486] ACPI: SSDT 0x000000006DFFD000 00030E (v02 PmRef  Cpu0Cst  00003001 INTL 20210930)
[    0.004487] ACPI: SSDT 0x000000006DF4A000 001BAF (v02 PmRef  ApIst    00003000 INTL 20210930)
[    0.004488] ACPI: SSDT 0x000000006DF48000 001620 (v02 PmRef  ApHwp    00003000 INTL 20210930)
[    0.004489] ACPI: SSDT 0x000000006DF46000 00163D (v02 PmRef  ApPsd    00003000 INTL 20210930)
[    0.004489] ACPI: SSDT 0x000000006DF45000 000FBB (v02 PmRef  ApCst    00003000 INTL 20210930)
[    0.004490] ACPI: SSDT 0x000000006DF41000 003CC4 (v02 CpuRef CpuSsdt  00003000 INTL 20210930)
[    0.004491] ACPI: BERT 0x000000006DF40000 000030 (v01 INTEL  EDK2     00000001 INTL 00000001)
[    0.004492] ACPI: SSDT 0x000000006DF3E000 001052 (v02 Intel_ UcsiTabl 00001000 INTL 20210930)
[    0.004493] ACPI: SSDT 0x000000006DF3D000 000BA1 (v02 INTEL  UpmpSsdt 00000000 INTL 20210930)
[    0.004494] ACPI: NHLT 0x000000006DF3B000 00053B (v00 DELL   INTEL ID 00000002      01000013)
[    0.004495] ACPI: LPIT 0x000000006DF3A000 0000CC (v01 DELL   INTEL ID 00000002      01000013)
[    0.004496] ACPI: SSDT 0x000000006DF39000 000D5C (v02 DELL   PtidDevc 00001000 INTL 20210930)
[    0.004496] ACPI: DBGP 0x000000006DF38000 000034 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004497] ACPI: DBG2 0x000000006DF37000 000054 (v00 DELL   INTEL ID 00000002      01000013)
[    0.004498] ACPI: MSDM 0x000000006DF36000 000055 (v03 DELL   CBX3     06222004 AMI  00010013)
[    0.004499] ACPI: BOOT 0x000000006DF35000 000028 (v01 DELL   CBX3     00000002      01000013)
[    0.004500] ACPI: SSDT 0x000000006DF34000 000574 (v02 DELL   Tpm2Tabl 00001000 INTL 20210930)
[    0.004501] ACPI: TPM2 0x000000006DF33000 00004C (v04 DELL   INTEL ID 00000002      01000013)
[    0.004501] ACPI: DMAR 0x000000006DF32000 0000D8 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004502] ACPI: SSDT 0x000000006DF1E000 0120A1 (v02 INTEL  Cnv_Ssdt 00001000 INTL 20210930)
[    0.004503] ACPI: FPDT 0x000000006DF4C000 000034 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004504] ACPI: SSDT 0x000000006DF1D000 000024 (v02 INTEL  TxtSsdt  00001000 INTL 20210930)
[    0.004505] ACPI: SSDT 0x000000006DF1B000 001EC7 (v02 SocGpe SocGpe   00003000 INTL 20210930)
[    0.004506] ACPI: SSDT 0x000000006DF19000 001DA3 (v02 SocCmn SocCmn   00003000 INTL 20210930)
[    0.004507] ACPI: MCFG 0x000000006DF69000 00003C (v01 DELL   INTEL ID 00000002      01000013)
[    0.004507] ACPI: SSDT 0x000000006DF14000 004D07 (v02 Rtd3   I2C_DEVT 00001000 INTL 20210930)
[    0.004508] ACPI: SDEV 0x000000006DF13000 000046 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004509] ACPI: PHAT 0x000000006DF3C000 000A48 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004510] ACPI: OEMD 0x000000006DF12000 000160 (v01 DELL   Dell Inc 00000000 DELL 00000000)
[    0.004511] ACPI: BGRT 0x000000006DF11000 000038 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004511] ACPI: Reserving FACP table memory at [mem 0x6df6d000-0x6df6d113]
[    0.004512] ACPI: Reserving DSDT table memory at [mem 0x6df6f000-0x6dfec46a]
[    0.004512] ACPI: Reserving FACS table memory at [mem 0x6dcd5000-0x6dcd503f]
[    0.004513] ACPI: Reserving SSDT table memory at [mem 0x6dffc000-0x6dffc387]
[    0.004513] ACPI: Reserving HEST table memory at [mem 0x6dffb000-0x6dffb053]
[    0.004513] ACPI: Reserving DTPR table memory at [mem 0x6dffa000-0x6dffa08f]
[    0.004513] ACPI: Reserving SSDT table memory at [mem 0x6dff9000-0x6dff9023]
[    0.004513] ACPI: Reserving SSDT table memory at [mem 0x6dff8000-0x6dff887b]
[    0.004514] ACPI: Reserving SSDT table memory at [mem 0x6dff7000-0x6dff70ac]
[    0.004514] ACPI: Reserving SSDT table memory at [mem 0x6dfee000-0x6dff6858]
[    0.004514] ACPI: Reserving SSDT table memory at [mem 0x6dfed000-0x6dfed0df]
[    0.004514] ACPI: Reserving SSDT table memory at [mem 0x6df6e000-0x6df6ed11]
[    0.004514] ACPI: Reserving HPET table memory at [mem 0x6df6c000-0x6df6c037]
[    0.004515] ACPI: Reserving WSMT table memory at [mem 0x6df6b000-0x6df6b027]
[    0.004515] ACPI: Reserving APIC table memory at [mem 0x6df6a000-0x6df6a157]
[    0.004515] ACPI: Reserving SSDT table memory at [mem 0x6df61000-0x6df686c7]
[    0.004515] ACPI: Reserving SSDT table memory at [mem 0x6df56000-0x6df60992]
[    0.004516] ACPI: Reserving SSDT table memory at [mem 0x6df53000-0x6df5527d]
[    0.004516] ACPI: Reserving SSDT table memory at [mem 0x6df50000-0x6df52d54]
[    0.004516] ACPI: Reserving SSDT table memory at [mem 0x6df4f000-0x6df4f76f]
[    0.004516] ACPI: Reserving SSDT table memory at [mem 0x6df4e000-0x6df4e5f4]
[    0.004516] ACPI: Reserving SSDT table memory at [mem 0x6df4d000-0x6df4d195]
[    0.004517] ACPI: Reserving SSDT table memory at [mem 0x6dffd000-0x6dffd30d]
[    0.004517] ACPI: Reserving SSDT table memory at [mem 0x6df4a000-0x6df4bbae]
[    0.004517] ACPI: Reserving SSDT table memory at [mem 0x6df48000-0x6df4961f]
[    0.004517] ACPI: Reserving SSDT table memory at [mem 0x6df46000-0x6df4763c]
[    0.004517] ACPI: Reserving SSDT table memory at [mem 0x6df45000-0x6df45fba]
[    0.004518] ACPI: Reserving SSDT table memory at [mem 0x6df41000-0x6df44cc3]
[    0.004518] ACPI: Reserving BERT table memory at [mem 0x6df40000-0x6df4002f]
[    0.004518] ACPI: Reserving SSDT table memory at [mem 0x6df3e000-0x6df3f051]
[    0.004518] ACPI: Reserving SSDT table memory at [mem 0x6df3d000-0x6df3dba0]
[    0.004518] ACPI: Reserving NHLT table memory at [mem 0x6df3b000-0x6df3b53a]
[    0.004519] ACPI: Reserving LPIT table memory at [mem 0x6df3a000-0x6df3a0cb]
[    0.004519] ACPI: Reserving SSDT table memory at [mem 0x6df39000-0x6df39d5b]
[    0.004519] ACPI: Reserving DBGP table memory at [mem 0x6df38000-0x6df38033]
[    0.004519] ACPI: Reserving DBG2 table memory at [mem 0x6df37000-0x6df37053]
[    0.004520] ACPI: Reserving MSDM table memory at [mem 0x6df36000-0x6df36054]
[    0.004520] ACPI: Reserving BOOT table memory at [mem 0x6df35000-0x6df35027]
[    0.004520] ACPI: Reserving SSDT table memory at [mem 0x6df34000-0x6df34573]
[    0.004520] ACPI: Reserving TPM2 table memory at [mem 0x6df33000-0x6df3304b]
[    0.004520] ACPI: Reserving DMAR table memory at [mem 0x6df32000-0x6df320d7]
[    0.004521] ACPI: Reserving SSDT table memory at [mem 0x6df1e000-0x6df300a0]
[    0.004521] ACPI: Reserving FPDT table memory at [mem 0x6df4c000-0x6df4c033]
[    0.004521] ACPI: Reserving SSDT table memory at [mem 0x6df1d000-0x6df1d023]
[    0.004521] ACPI: Reserving SSDT table memory at [mem 0x6df1b000-0x6df1cec6]
[    0.004522] ACPI: Reserving SSDT table memory at [mem 0x6df19000-0x6df1ada2]
[    0.004522] ACPI: Reserving MCFG table memory at [mem 0x6df69000-0x6df6903b]
[    0.004522] ACPI: Reserving SSDT table memory at [mem 0x6df14000-0x6df18d06]
[    0.004522] ACPI: Reserving SDEV table memory at [mem 0x6df13000-0x6df13045]
[    0.004523] ACPI: Reserving PHAT table memory at [mem 0x6df3c000-0x6df3ca47]
[    0.004523] ACPI: Reserving OEMD table memory at [mem 0x6df12000-0x6df1215f]
[    0.004523] ACPI: Reserving BGRT table memory at [mem 0x6df11000-0x6df11037]
[    0.004587] APIC: Switched APIC routing to: cluster x2apic
[    0.004857] No NUMA configuration found
[    0.004857] Faking a node at [mem 0x0000000000000000-0x000000087f7fffff]
[    0.004861] NODE_DATA(0) allocated [mem 0x87f7d4280-0x87f7fefff]
[    0.005746] ACPI: PM-Timer IO Port: 0x1808
[    0.005750] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.005784] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.005785] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.005786] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.005788] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.005788] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.005793] e820: update [mem 0x611e3000-0x61273fff] System RAM ==> device reserved
[    0.005798] TSC deadline timer available
[    0.005799] CPU topo: Max. logical packages:   1
[    0.005800] CPU topo: Max. logical nodes:      1
[    0.005800] CPU topo: Num. nodes per package:  1
[    0.005801] CPU topo: Max. logical dies:       1
[    0.005801] CPU topo: Max. dies per package:   1
[    0.005802] CPU topo: Max. threads per core:   1
[    0.005802] CPU topo: Num. cores per package:    16
[    0.005803] CPU topo: Num. threads per package:  16
[    0.005803] CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.005811] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.005812] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.005812] PM: hibernation: Registered nosave memory: [mem 0x611e3000-0x61273fff]
[    0.005813] PM: hibernation: Registered nosave memory: [mem 0x66719000-0x66719fff]
[    0.005814] PM: hibernation: Registered nosave memory: [mem 0x667cf000-0x667d4fff]
[    0.005814] PM: hibernation: Registered nosave memory: [mem 0x67cca000-0x67d49fff]
[    0.005814] PM: hibernation: Registered nosave memory: [mem 0x69515000-0x6dffefff]
[    0.005815] PM: hibernation: Registered nosave memory: [mem 0x6e000000-0x1043fffff]
[    0.005816] [gap 0x80800000-0xfed1ffff] available for PCI devices
[    0.005816] Booting paravirtualized kernel on bare hardware
[    0.005818] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.010022] Zone ranges:
[    0.010022]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.010024]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.010024]   Normal   [mem 0x0000000100000000-0x000000087f7fffff]
[    0.010025]   Device   empty
[    0.010025] Movable zone start for each node
[    0.010026] Early memory node ranges
[    0.010026]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.010027]   node   0: [mem 0x0000000000100000-0x0000000066718fff]
[    0.010027]   node   0: [mem 0x000000006671a000-0x00000000667cefff]
[    0.010027]   node   0: [mem 0x00000000667d5000-0x0000000067cc9fff]
[    0.010028]   node   0: [mem 0x0000000067d4a000-0x0000000069514fff]
[    0.010028]   node   0: [mem 0x000000006dfff000-0x000000006dffffff]
[    0.010028]   node   0: [mem 0x0000000104400000-0x000000087f7fffff]
[    0.010029] Initmem setup node 0 [mem 0x0000000000001000-0x000000087f7fffff]
[    0.010032] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.010045] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.011443] On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.011462] On node 0, zone DMA32: 6 pages in unavailable ranges
[    0.011484] On node 0, zone DMA32: 128 pages in unavailable ranges
[    0.011536] On node 0, zone DMA32: 19178 pages in unavailable ranges
[    0.038646] On node 0, zone Normal: 25600 pages in unavailable ranges
[    0.038654] On node 0, zone Normal: 2048 pages in unavailable ranges
[    0.038659] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
[    0.039024] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u262144
[    0.039027] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
[    0.039028] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.039037] Kernel command line: initrd=\initramfs-linux-cachyos.img root=/dev/mapper/root rw net.ifnames=0 xe.enable_panel_replay=0 snd_soc_sdca.dyndbg=+p soundwire_bus.dyndbg=+p soundwire_intel.dyndbg=+p drm.debug=0
[    0.039085] printk: log buffer data + meta data: 131072 + 557056 = 688128 bytes
[    0.040819] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.041696] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.041837] software IO TLB: area num 16.
[    0.048815] Fallback order for Node 0: 0 
[    0.048817] Built 1 zonelists, mobility grouping on.  Total pages: 8276013
[    0.048817] Policy zone: Normal
[    0.048955] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.081065] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
[    0.081213] ftrace: allocating 56563 entries in 221 pages
[    0.081214] ftrace: allocated 221 pages with 6 groups
[    0.081303] rcu: Preemptible hierarchical RCU implementation.
[    0.081304] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=16.
[    0.081304] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.081305] 	Trampoline variant of Tasks RCU enabled.
[    0.081305] 	Rude variant of Tasks RCU enabled.
[    0.081305] 	Tracing variant of Tasks RCU enabled.
[    0.081306] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.081306] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
[    0.081312] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.081313] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.083061] NR_IRQS: 524544, nr_irqs: 2184, preallocated irqs: 16
[    0.083394] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.083610] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.083636] Console: colour dummy device 80x25
[    0.083638] printk: legacy console [tty0] enabled
[    0.083666] ACPI: Core revision 20251212
[    0.083938] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.084067] APIC: Switch to symmetric I/O mode setup
[    0.084068] DMAR: Host address width 42
[    0.084069] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.084072] DMAR: dmar0: reg_base_addr fc800000 ver 7:1 cap e9de008cee690402 ecap 1aca9a00f0ef5e
[    0.084076] DMAR: DRHD base: 0x000000fc810000 flags: 0x0
[    0.084077] DMAR: dmar1: reg_base_addr fc810000 ver 7:1 cap e9de008cee690402 ecap 1aca9a00f0ef5e
[    0.084080] DMAR: DRHD base: 0x000000fc820000 flags: 0x1
[    0.084130] DMAR: dmar2: reg_base_addr fc820000 ver 7:1 cap e9de008cee690402 ecap 12c89804f0efda
[    0.084142] DMAR: SATC flags: 0x1
[    0.084143] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc820000 IOMMU 2
[    0.084144] DMAR-IR: HPET id 0 under DRHD base 0xfc820000
[    0.084144] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.085855] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.089771] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6a464ae9873, max_idle_ns: 881590529744 ns
[    0.089776] Calibrating delay loop (skipped), value calculated using timer frequency.. 7372.80 BogoMIPS (lpj=3686400)
[    0.089858] CPU0: Thermal monitoring enabled (TM1)
[    0.089860] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.090019] CET detected: Indirect Branch Tracking enabled
[    0.090019] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.090020] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.090024] process: using mwait in idle threads
[    0.090026] mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.090028] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.090029] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.090029] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.090030] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.090037] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.090038] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.090039] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.090039] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.090039] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.090040] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kernel registers (KVM only)'
[    0.090040] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.090041] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.090041] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.090042] x86/fpu: xstate_offset[12]:  856, xstate_sizes[12]:   24
[    0.090042] x86/fpu: Enabled xstate features 0x1a07, context size is 880 bytes, using 'compacted' format.
[    0.090774] Freeing SMP alternatives memory: 64K
[    0.090774] pid_max: default: 32768 minimum: 301
[    0.090774] landlock: Up and running.
[    0.090774] Yama: becoming mindful.
[    0.090774] LSM support for eBPF active
[    0.090774] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.090774] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.090774] VFS: Finished mounting rootfs on nullfs
[    0.090774] smpboot: CPU0: Intel(R) Core(TM) Ultra X7 358H (family: 0x6, model: 0xcc, stepping: 0x2)
[    0.090774] Performance Events: XSAVE Architectural LBR,  AnyThread deprecated, Pantherlake Hybrid events, Architectural PEBS, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.090774] core: The two events 0xc0 and 0x3c may not be fully scheduled under some circumstances as a PEBS event.
[    0.090774] core: The two events 0xc0 and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.090774] core: The two events 0x3c and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.090774] core: The event 0x148 is not supported as a PEBS PDIST event.
[    0.090774] core: The event 0x175 is not supported as a PEBS PDIST event.
[    0.090774] core: The event 0x8a3 is not supported as a PEBS PDIST event.
[    0.090774] core: The event 0xca3 is not supported as a PEBS PDIST event.
[    0.090774] core: The event 0x1b1 is not supported as a PEBS PDIST event.
[    0.090774] core: The event 0x1cd is not supported as a PEBS PDIST event.
[    0.090774] core: The event 0x1cd is not supported as a PEBS PDIST event.
[    0.090774] core: cpu_core PMU driver: 
[    0.090774] ... version:                   6
[    0.090774] ... bit width:                 48
[    0.090774] ... generic counters:          10
[    0.090774] ... generic bitmap:            00000000000003ff
[    0.090774] ... fixed-purpose counters:    4
[    0.090774] ... fixed-purpose bitmap:      000000000000000f
[    0.090774] ... value mask:                0000ffffffffffff
[    0.090774] ... max period:                00007fffffffffff
[    0.090774] ... global_ctrl mask:          0001000f000003ff
[    0.090774] signal: max sigframe size: 3632
[    0.090774] Estimated ratio of average max frequency by base frequency (times 1024): 1245
[    0.090774] rcu: Hierarchical SRCU implementation.
[    0.090774] rcu: 	Max phase no-delay instances is 400.
[    0.090774] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.090774] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.090774] smp: Bringing up secondary CPUs ...
[    0.090774] smpboot: x86: Booting SMP configuration:
[    0.090774] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
[    0.007243] Initialize FRED on CPU12
[    0.007243] Initialize FRED on CPU13
[    0.007243] Initialize FRED on CPU14
[    0.007243] Initialize FRED on CPU15
[    0.007243] Initialize FRED on CPU4
[    0.007243] Initialize FRED on CPU2
[    0.007243] Initialize FRED on CPU3
[    0.007243] Initialize FRED on CPU9
[    0.007243] Initialize FRED on CPU7
[    0.007243] Initialize FRED on CPU1
[    0.007243] Initialize FRED on CPU5
[    0.007243] Initialize FRED on CPU11
[    0.007243] Initialize FRED on CPU6
[    0.007243] Initialize FRED on CPU8
[    0.007243] Initialize FRED on CPU10
[    0.007243] core: The two events 0xc0 and 0x3c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0xc0 and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0xc0 and 0x73 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0xc0 and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0xc0 and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x3c and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x3c and 0x73 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x3c and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x3c and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x13c and 0x73 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x13c and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x13c and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x73 and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x73 and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The two events 0x19c and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007243] core: The event 0x5d0 is not supported as an auto-counter reload event.
[    0.007243] core: cpu_atom PMU driver: 
[    0.007243] ... version:                   6
[    0.007243] ... bit width:                 48
[    0.007243] ... generic counters:          8
[    0.007243] ... generic bitmap:            00000000000000ff
[    0.007243] ... fixed-purpose counters:    6
[    0.007243] ... fixed-purpose bitmap:      0000000000000077
[    0.007243] ... value mask:                0000ffffffffffff
[    0.007243] ... max period:                00007fffffffffff
[    0.007243] ... global_ctrl mask:          00000077000000ff
[    0.100853] smp: Brought up 1 node, 16 CPUs
[    0.100881] smpboot: Total of 16 processors activated (117964.80 BogoMIPS)
[    0.102924] Memory: 32244120K/33104052K available (22289K kernel code, 2963K rwdata, 16376K rodata, 4720K init, 4440K bss, 830100K reserved, 0K cma-reserved)
[    0.102924] devtmpfs: initialized
[    0.102924] x86/mm: Memory block size: 128MB
[    0.104343] ACPI: PM: Registering ACPI NVS region [mem 0x667d3000-0x667d4fff] (8192 bytes)
[    0.104343] ACPI: PM: Registering ACPI NVS region [mem 0x67cca000-0x67ccafff] (4096 bytes)
[    0.104343] ACPI: PM: Registering ACPI NVS region [mem 0x6d511000-0x6dd71fff] (8785920 bytes)
[    0.104343] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.104343] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.104343] futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
[    0.104775] PM: RTC time: 13:26:11, date: 2026-05-06
[    0.105037] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.105332] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.105572] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.105822] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.105825] audit: initializing netlink subsys (disabled)
[    0.105828] audit: type=2000 audit(1778073971.016:1): state=initialized audit_enabled=0 res=1
[    0.105828] thermal_sys: Registered thermal governor 'fair_share'
[    0.105828] thermal_sys: Registered thermal governor 'bang_bang'
[    0.105828] thermal_sys: Registered thermal governor 'step_wise'
[    0.105828] thermal_sys: Registered thermal governor 'user_space'
[    0.105828] thermal_sys: Registered thermal governor 'power_allocator'
[    0.105829] cpuidle: using governor ladder
[    0.105829] cpuidle: using governor menu
[    0.105834] Simple Boot Flag at 0x47 set to 0x80
[    0.107718] efi: Freeing EFI boot services memory: 102300K
[    0.107720] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.107797] PCI: ECAM [mem 0xe0000000-0xea9fffff] (base 0xe0000000) for domain 0000 [bus 00-a9]
[    0.107807] PCI: Using configuration type 1 for base access
[    0.107834] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.107984] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.107984] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.107984] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.107984] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.109329] raid6: skipped pq benchmark and selected avx2x4
[    0.109329] raid6: using avx2x2 recovery algorithm
[    0.109400] ACPI: Added _OSI(Module Device)
[    0.109402] ACPI: Added _OSI(Processor Device)
[    0.109403] ACPI: Added _OSI(Processor Aggregator Device)
[    0.202987] ACPI BIOS Error (bug): Failure creating named object [\TDPH], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.202998] fbcon: Taking over console
[    0.203006] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203035] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.HIDG], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203042] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203047] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.TP7G], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203051] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203058] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.TP7D], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203062] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203065] ACPI: Skipping parse of AML opcode: Method (0x0014)
[    0.203068] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2CM], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203072] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203075] ACPI: Skipping parse of AML opcode: Method (0x0014)
[    0.211162] ACPI: 29 ACPI AML tables successfully acquired and loaded
[    0.237800] ACPI: \_SB_: platform _OSC: OS support mask [006e7eff]
[    0.239242] ACPI: \_SB_: platform _OSC: OS control mask [006e7eff]
[    0.239690] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.239692] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.245638] ACPI: EC: EC started
[    0.245639] ACPI: EC: interrupt blocked
[    0.254774] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.254774] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC used to handle transactions
[    0.254774] ACPI: Interpreter enabled
[    0.254774] ACPI: PM: (supports S0 S4 S5)
[    0.254774] ACPI: Using IOAPIC for interrupt routing
[    0.257378] HEST: Table parsing has been initialized.
[    0.257418] GHES: APEI firmware first mode is enabled by APEI bit.
[    0.257422] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.257423] PCI: Ignoring E820 reservations for host bridge windows
[    0.260356] ACPI: Enabled 9 GPEs in block 00 to 7F
[    0.260404] ACPI: Enabled 15 GPEs in block 80 to DF
[    0.291557] ACPI: \_SB_.PC00.I2C4.PXTC: New power resource
[    0.293131] ACPI: \_SB_.PC00.I2C5.PTPL: New power resource
[    0.294264] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.294464] ACPI: \_SB_.PC00.BTPC.WRST: New power resource
[    0.299021] ACPI: \_SB_.PC00.RP04.PXSX.WRST: New power resource
[    0.306003] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.306028] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.306051] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.335167] ACPI: \PIN_: New power resource
[    0.336602] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-a9])
[    0.336609] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.339413] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
[    0.344019] PCI host bridge to bus 0000:00
[    0.344023] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.344026] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.344028] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.344029] pci_bus 0000:00: root bus resource [mem 0x80800000-0xdfffffff window]
[    0.344031] pci_bus 0000:00: root bus resource [mem 0x8000000000-0x3ffffffffff window]
[    0.344033] pci_bus 0000:00: root bus resource [bus 00-a9]
[    0.344064] pci 0000:00:00.0: [8086:b001] type 00 class 0x060000 conventional PCI endpoint
[    0.344613] pci 0000:00:02.0: [8086:b080] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.344946] pci 0000:00:02.0: BAR 0 [mem 0xc814000000-0xc814ffffff 64bit pref]
[    0.344953] pci 0000:00:02.0: BAR 2 [mem 0x8000000000-0x800fffffff 64bit pref]
[    0.344960] pci 0000:00:02.0: ROM [mem 0xffe00000-0xffffffff pref]
[    0.345027] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.345274] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    0.345276] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit pref]: contains BAR 0 for 7 VFs
[    0.345787] pci 0000:00:04.0: [8086:b01d] type 00 class 0x118000 conventional PCI endpoint
[    0.345832] pci 0000:00:04.0: BAR 0 [mem 0xc815300000-0xc81531ffff 64bit]
[    0.346200] pci 0000:00:05.0: [8086:b05d] type 00 class 0x048000 PCIe Root Complex Integrated Endpoint
[    0.346244] pci 0000:00:05.0: BAR 0 [mem 0xc812000000-0xc813ffffff 64bit]
[    0.346250] pci 0000:00:05.0: BAR 4 [mem 0xc81537a000-0xc81537afff 64bit]
[    0.346661] pci 0000:00:06.0: [8086:e461] type 01 class 0x060400 PCIe Root Port
[    0.346750] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.346770] pci 0000:00:06.0:   bridge window [mem 0x9c200000-0x9c2fffff]
[    0.347075] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.347229] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.348699] pci 0000:00:07.0: [8086:e44e] type 01 class 0x060400 PCIe Root Port
[    0.348752] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.348764] pci 0000:00:07.0:   bridge window [mem 0x94000000-0x9bffffff]
[    0.348784] pci 0000:00:07.0:   bridge window [mem 0x8010000000-0x980fffffff 64bit pref]
[    0.348983] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.349042] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.350317] pci 0000:00:07.1: [8086:e44f] type 01 class 0x060400 PCIe Root Port
[    0.350369] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.350381] pci 0000:00:07.1:   bridge window [mem 0x8c000000-0x93ffffff]
[    0.350400] pci 0000:00:07.1:   bridge window [mem 0x9810000000-0xb00fffffff 64bit pref]
[    0.350590] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.350647] pci 0000:00:07.1: PTM enabled (root), 4ns granularity
[    0.352836] pci 0000:00:07.2: [8086:e460] type 01 class 0x060400 PCIe Root Port
[    0.352888] pci 0000:00:07.2: PCI bridge to [bus 72-a9]
[    0.352900] pci 0000:00:07.2:   bridge window [mem 0x84000000-0x8bffffff]
[    0.352919] pci 0000:00:07.2:   bridge window [mem 0xb010000000-0xc80fffffff 64bit pref]
[    0.353107] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.353164] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.354405] pci 0000:00:0a.0: [8086:b07d] type 00 class 0x118000 PCIe Root Complex Integrated Endpoint
[    0.354460] pci 0000:00:0a.0: BAR 0 [mem 0xc815350000-0xc81535ffff 64bit]
[    0.354477] pci 0000:00:0a.0: enabling Extended Tags
[    0.354653] pci 0000:00:0b.0: [8086:b03e] type 00 class 0x120000 PCIe Root Complex Integrated Endpoint
[    0.354701] pci 0000:00:0b.0: BAR 0 [mem 0xc810000000-0xc811ffffff 64bit]
[    0.354707] pci 0000:00:0b.0: BAR 4 [mem 0xc815379000-0xc815379fff 64bit]
[    0.354774] pci 0000:00:0d.0: [8086:e431] type 00 class 0x0c0330 conventional PCI endpoint
[    0.354774] pci 0000:00:0d.0: BAR 0 [mem 0xc815340000-0xc81534ffff 64bit]
[    0.354774] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.354774] pci 0000:00:0d.2: [8086:e433] type 00 class 0x0c0340 conventional PCI endpoint
[    0.354799] pci 0000:00:0d.2: BAR 0 [mem 0xc8152c0000-0xc8152fffff 64bit]
[    0.354804] pci 0000:00:0d.2: BAR 2 [mem 0xc815378000-0xc815378fff 64bit]
[    0.354879] pci 0000:00:0d.2: supports D1 D2
[    0.354880] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.355079] pci 0000:00:0d.3: [8086:e434] type 00 class 0x0c0340 conventional PCI endpoint
[    0.355156] pci 0000:00:0d.3: BAR 0 [mem 0xc815280000-0xc8152bffff 64bit]
[    0.355162] pci 0000:00:0d.3: BAR 2 [mem 0xc815377000-0xc815377fff 64bit]
[    0.355236] pci 0000:00:0d.3: supports D1 D2
[    0.355237] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.355494] pci 0000:00:12.0: [8086:e445] type 00 class 0x070000 conventional PCI endpoint
[    0.355562] pci 0000:00:12.0: BAR 0 [mem 0xc815330000-0xc81533ffff 64bit]
[    0.355634] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.355774] pci 0000:00:13.0: [8086:e462] type 00 class 0x078000 conventional PCI endpoint
[    0.355774] pci 0000:00:13.0: BAR 0 [mem 0xc815376000-0xc815376fff 64bit]
[    0.355774] pci 0000:00:13.0: PME# supported from D3hot
[    0.355774] pci 0000:00:14.0: [8086:e47d] type 00 class 0x0c0330 conventional PCI endpoint
[    0.355774] pci 0000:00:14.0: BAR 0 [mem 0xc815320000-0xc81532ffff 64bit]
[    0.356845] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.357476] pci 0000:00:14.2: [8086:e47f] type 00 class 0x050000 conventional PCI endpoint
[    0.357555] pci 0000:00:14.2: BAR 0 [mem 0xc815360000-0xc815367fff 64bit]
[    0.357561] pci 0000:00:14.2: BAR 2 [mem 0xc815375000-0xc815375fff 64bit]
[    0.357869] pci 0000:00:14.3: [8086:e440] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
[    0.357937] pci 0000:00:14.3: BAR 0 [mem 0xc81536c000-0xc81536ffff 64bit]
[    0.357959] pci 0000:00:14.3: enabling Extended Tags
[    0.358043] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.358648] pci 0000:00:14.7: [8086:e476] type 00 class 0x0d1100 PCIe Root Complex Integrated Endpoint
[    0.358718] pci 0000:00:14.7: BAR 0 [mem 0xc815368000-0xc81536bfff 64bit]
[    0.358740] pci 0000:00:14.7: enabling Extended Tags
[    0.358823] pci 0000:00:14.7: PME# supported from D0 D3hot D3cold
[    0.359255] pci 0000:00:16.0: [8086:e470] type 00 class 0x078000 conventional PCI endpoint
[    0.359340] pci 0000:00:16.0: BAR 0 [mem 0xc815374000-0xc815374fff 64bit]
[    0.359427] pci 0000:00:16.0: PME# supported from D3hot
[    0.360161] pci 0000:00:18.0: [8086:e45d] type 00 class 0x078000 conventional PCI endpoint
[    0.360249] pci 0000:00:18.0: BAR 0 [mem 0xc815373000-0xc815373fff 64bit]
[    0.360339] pci 0000:00:18.0: PME# supported from D3hot
[    0.360647] pci 0000:00:19.0: [8086:e450] type 00 class 0x0c8000 conventional PCI endpoint
[    0.360935] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.373092] pci 0000:00:19.1: [8086:e451] type 00 class 0x0c8000 conventional PCI endpoint
[    0.373310] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.385006] pci 0000:00:1f.0: [8086:e402] type 00 class 0x060100 conventional PCI endpoint
[    0.385780] pci 0000:00:1f.3: [8086:e428] type 00 class 0x040380 conventional PCI endpoint
[    0.385997] pci 0000:00:1f.3: BAR 0 [mem 0xc815200000-0xc81527ffff 64bit]
[    0.386020] pci 0000:00:1f.3: BAR 4 [mem 0xc815000000-0xc8151fffff 64bit]
[    0.386221] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.386756] pci 0000:00:1f.4: [8086:e422] type 00 class 0x0c0500 conventional PCI endpoint
[    0.386926] pci 0000:00:1f.4: BAR 0 [mem 0xc815370000-0xc8153700ff 64bit]
[    0.386942] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.387430] pci 0000:00:1f.5: [8086:e423] type 00 class 0x0c8000 conventional PCI endpoint
[    0.387610] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.388352] pci 0000:01:00.0: [1e0f:002f] type 00 class 0x010802 PCIe Endpoint
[    0.388447] pci 0000:01:00.0: BAR 0 [mem 0x9c200000-0x9c203fff 64bit]
[    0.388933] pci 0000:00:06.0: ASPM: current common clock configuration is inconsistent, reconfiguring
[    0.389016] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.389129] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.389233] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.389332] pci 0000:00:07.2: PCI bridge to [bus 72-a9]
[    0.398453] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.398456] Low-power S0 idle used by default for system suspend
[    0.411365] ACPI: EC: interrupt unblocked
[    0.411366] ACPI: EC: event unblocked
[    0.411378] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.411380] ACPI: EC: GPE=0x6e
[    0.411381] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC initialization complete
[    0.411384] ACPI: \_SB_.PC00.LPCB.ECDV: EC: Used to handle transactions and events
[    0.411826] iommu: Default domain type: Translated
[    0.411826] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.413954] SCSI subsystem initialized
[    0.413981] libata version 3.00 loaded.
[    0.413981] ACPI: bus type USB registered
[    0.413981] usbcore: registered new interface driver usbfs
[    0.413981] usbcore: registered new interface driver hub
[    0.413981] usbcore: registered new device driver usb
[    0.414135] EDAC MC: Ver: 3.0.0
[    0.415411] efivars: Registered efivars operations
[    0.416662] NetLabel: Initializing
[    0.416665] NetLabel:  domain hash size = 128
[    0.416669] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.416727] NetLabel:  unlabeled traffic allowed by default
[    0.416742] mctp: management component transport protocol core
[    0.416746] NET: Registered PF_MCTP protocol family
[    0.416786] PCI: Using ACPI for IRQ routing
[    0.424253] PCI: pci_cache_line_size set to 64 bytes
[    0.424722] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't claim; no compatible bridge window
[    0.425171] e820: register RAM buffer resource [mem 0x0009f000-0x0009ffff]
[    0.425172] e820: register RAM buffer resource [mem 0x611e3000-0x63ffffff]
[    0.425172] e820: register RAM buffer resource [mem 0x66719000-0x67ffffff]
[    0.425173] e820: register RAM buffer resource [mem 0x667cf000-0x67ffffff]
[    0.425173] e820: register RAM buffer resource [mem 0x67cca000-0x67ffffff]
[    0.425174] e820: register RAM buffer resource [mem 0x69515000-0x6bffffff]
[    0.425174] e820: register RAM buffer resource [mem 0x6e000000-0x6fffffff]
[    0.425174] e820: register RAM buffer resource [mem 0x87f800000-0x87fffffff]
[    0.425192] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.425192] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.425192] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.425192] vgaarb: loaded
[    0.428137] clocksource: Switched to clocksource tsc-early
[    0.428627] VFS: Disk quotas dquot_6.6.0
[    0.428627] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.428861] acpi PNP0C02:00: Skipped [io  0x0061]
[    0.428874] acpi PNP0C02:00: Skipped [io  0x0063]
[    0.428880] acpi PNP0C02:00: Skipped [io  0x0065]
[    0.428885] acpi PNP0C02:00: Skipped [io  0x0067]
[    0.428889] acpi PNP0C02:00: Skipped [io  0x0070]
[    0.428892] acpi PNP0C02:00: Skipped [io  0x0080]
[    0.428896] acpi PNP0C02:00: Skipped [io  0x0092]
[    0.428899] acpi PNP0C02:00: Skipped [io  0x00b2-0x00b3]
[    0.428906] acpi PNP0C02:00: Reserved [io  0x0680-0x069f]
[    0.428912] acpi PNP0C02:00: Reserved [io  0x164e-0x164f]
[    0.429815] acpi PNP0C02:03: Reserved [mem 0xfedc0000-0xfedc7fff]
[    0.429824] acpi PNP0C02:03: Reserved [mem 0xfa000000-0xfa000fff]
[    0.429829] acpi PNP0C02:03: Could not reserve [mem 0x00000000-0x00000fff]
[    0.429838] acpi PNP0C02:03: Reserved [mem 0xe0000000-0xefffffff]
[    0.429844] acpi PNP0C02:03: Could not reserve [mem 0xfed20000-0xfed7ffff]
[    0.429849] acpi PNP0C02:03: Could not reserve [mem 0xfc800000-0xfc81ffff]
[    0.429856] acpi PNP0C02:03: Reserved [mem 0xfed45000-0xfed8ffff]
[    0.429863] acpi PNP0C02:03: Reserved [mem 0xfee00000-0xfeefffff]
[    0.430844] acpi PNP0C02:04: Reserved [mem 0xfe000000-0xfe01ffff]
[    0.430851] acpi PNP0C02:04: Reserved [mem 0xfe04c000-0xfe04ffff]
[    0.430857] acpi PNP0C02:04: Reserved [mem 0xfe050000-0xfe0affff]
[    0.430863] acpi PNP0C02:04: Reserved [mem 0xfe0d0000-0xfe0fffff]
[    0.430868] acpi PNP0C02:04: Reserved [mem 0xfe200000-0xfe7fffff]
[    0.430875] acpi PNP0C02:04: Reserved [mem 0xff000000-0xffffffff]
[    0.430881] acpi PNP0C02:04: Could not reserve [io  0x1800-0x18fe]
[    0.430888] acpi PNP0C02:04: Reserved [mem 0x4000000000-0x400058ffff]
[    0.431689] acpi PNP0C02:05: Reserved [io  0x2000-0x20fe]
[    0.433549] pnp: PnP ACPI init
[    0.443618] pnp: PnP ACPI: found 3 devices
[    0.450218] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.450326] NET: Registered PF_INET protocol family
[    0.450551] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.474288] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.474335] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.474531] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.474907] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.475074] TCP: Hash tables configured (established 262144 bind 65536)
[    0.475224] MPTCP token hash table entries: 32768 (order: 8, 786432 bytes, linear)
[    0.475377] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.475565] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.475704] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.475713] NET: Registered PF_XDP protocol family
[    0.475721] pci 0000:00:07.0: bridge window [io  0x1000-0x0fff] to [bus 02-39] add_size 1000
[    0.475726] pci 0000:00:07.1: bridge window [io  0x1000-0x0fff] to [bus 3a-71] add_size 1000
[    0.475728] pci 0000:00:07.2: bridge window [io  0x1000-0x0fff] to [bus 72-a9] add_size 1000
[    0.475742] pci 0000:00:02.0: VF BAR 0 [mem 0xc816000000-0xc81cffffff 64bit pref]: assigned
[    0.475790] pci 0000:00:07.0: bridge window [io  0x3000-0x3fff]: assigned
[    0.475793] pci 0000:00:07.1: bridge window [io  0x4000-0x4fff]: assigned
[    0.475794] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigned
[    0.475797] pci 0000:00:19.0: BAR 0 [mem 0xc815371000-0xc815371fff 64bit]: assigned
[    0.475863] pci 0000:00:19.1: BAR 0 [mem 0xc815372000-0xc815372fff 64bit]: assigned
[    0.475901] pci 0000:00:1f.5: BAR 0 [mem 0x80800000-0x80800fff]: assigned
[    0.475918] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.475992] pci 0000:00:06.0:   bridge window [mem 0x9c200000-0x9c2fffff]
[    0.476015] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.476021] pci 0000:00:07.0:   bridge window [io  0x3000-0x3fff]
[    0.476029] pci 0000:00:07.0:   bridge window [mem 0x94000000-0x9bffffff]
[    0.476034] pci 0000:00:07.0:   bridge window [mem 0x8010000000-0x980fffffff 64bit pref]
[    0.476044] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.476047] pci 0000:00:07.1:   bridge window [io  0x4000-0x4fff]
[    0.476054] pci 0000:00:07.1:   bridge window [mem 0x8c000000-0x93ffffff]
[    0.476059] pci 0000:00:07.1:   bridge window [mem 0x9810000000-0xb00fffffff 64bit pref]
[    0.476075] pci 0000:00:07.2: PCI bridge to [bus 72-a9]
[    0.476078] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.476085] pci 0000:00:07.2:   bridge window [mem 0x84000000-0x8bffffff]
[    0.476090] pci 0000:00:07.2:   bridge window [mem 0xb010000000-0xc80fffffff 64bit pref]
[    0.476101] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.476103] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.476104] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.476106] pci_bus 0000:00: resource 7 [mem 0x80800000-0xdfffffff window]
[    0.476107] pci_bus 0000:00: resource 8 [mem 0x8000000000-0x3ffffffffff window]
[    0.476109] pci_bus 0000:01: resource 1 [mem 0x9c200000-0x9c2fffff]
[    0.476110] pci_bus 0000:02: resource 0 [io  0x3000-0x3fff]
[    0.476111] pci_bus 0000:02: resource 1 [mem 0x94000000-0x9bffffff]
[    0.476113] pci_bus 0000:02: resource 2 [mem 0x8010000000-0x980fffffff 64bit pref]
[    0.476114] pci_bus 0000:3a: resource 0 [io  0x4000-0x4fff]
[    0.476115] pci_bus 0000:3a: resource 1 [mem 0x8c000000-0x93ffffff]
[    0.476116] pci_bus 0000:3a: resource 2 [mem 0x9810000000-0xb00fffffff 64bit pref]
[    0.476118] pci_bus 0000:72: resource 0 [io  0x5000-0x5fff]
[    0.476119] pci_bus 0000:72: resource 1 [mem 0x84000000-0x8bffffff]
[    0.476120] pci_bus 0000:72: resource 2 [mem 0xb010000000-0xc80fffffff 64bit pref]
[    0.477262] PCI: CLS 0 bytes, default 64
[    0.477316] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.477329] DMAR: No RMRR found
[    0.477330] DMAR: No ATSR found
[    0.477332] DMAR: dmar1: Using Queued invalidation
[    0.477335] DMAR: dmar0: Using Queued invalidation
[    0.477337] DMAR: dmar2: Using Queued invalidation
[    0.477485] pci 0000:00:04.0: Adding to iommu group 0
[    0.477503] pci 0000:00:05.0: Adding to iommu group 1
[    0.477547] Trying to unpack rootfs image as initramfs...
[    0.477626] pci 0000:00:0a.0: Adding to iommu group 2
[    0.477641] pci 0000:00:0b.0: Adding to iommu group 3
[    0.477904] pci 0000:00:02.0: Adding to iommu group 4
[    0.478465] pci 0000:00:00.0: Adding to iommu group 5
[    0.478636] pci 0000:00:06.0: Adding to iommu group 6
[    0.478659] pci 0000:00:07.0: Adding to iommu group 7
[    0.478679] pci 0000:00:07.1: Adding to iommu group 8
[    0.478705] pci 0000:00:07.2: Adding to iommu group 9
[    0.478738] pci 0000:00:0d.0: Adding to iommu group 10
[    0.478753] pci 0000:00:0d.2: Adding to iommu group 10
[    0.478767] pci 0000:00:0d.3: Adding to iommu group 10
[    0.478788] pci 0000:00:12.0: Adding to iommu group 11
[    0.478807] pci 0000:00:13.0: Adding to iommu group 12
[    0.478832] pci 0000:00:14.0: Adding to iommu group 13
[    0.478847] pci 0000:00:14.2: Adding to iommu group 13
[    0.478865] pci 0000:00:14.3: Adding to iommu group 14
[    0.478879] pci 0000:00:14.7: Adding to iommu group 15
[    0.478898] pci 0000:00:16.0: Adding to iommu group 16
[    0.478918] pci 0000:00:18.0: Adding to iommu group 17
[    0.478942] pci 0000:00:19.0: Adding to iommu group 18
[    0.478958] pci 0000:00:19.1: Adding to iommu group 18
[    0.478994] pci 0000:00:1f.0: Adding to iommu group 19
[    0.479010] pci 0000:00:1f.3: Adding to iommu group 19
[    0.479029] pci 0000:00:1f.4: Adding to iommu group 19
[    0.479045] pci 0000:00:1f.5: Adding to iommu group 19
[    0.479132] pci 0000:01:00.0: Adding to iommu group 20
[    0.479231] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.479232] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.479233] software IO TLB: mapped [mem 0x000000005d1b0000-0x00000000611b0000] (64MB)
[    0.479264] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6a464ae9873, max_idle_ns: 881590529744 ns
[    0.479455] clocksource: Switched to clocksource tsc
[    0.487296] Initialise system trusted keyrings
[    0.487303] Key type blacklist registered
[    0.487413] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.487573] fuse: init (API version 7.45)
[    0.487627] integrity: Platform Keyring initialized
[    0.487628] integrity: Machine keyring initialized
[    0.491305] xor: automatically using best checksumming function   avx       
[    0.491305] Key type asymmetric registered
[    0.491306] Asymmetric key parser 'x509' registered
[    0.491313] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.491396] io scheduler mq-deadline registered
[    0.491397] io scheduler kyber registered
[    0.491397] Adaptive Deadline I/O Scheduler 3.2.0 by Masahito Suzuki
[    0.491398] io scheduler adios registered
[    0.491403] io scheduler bfq registered
[    0.492377] ledtrig-cpu: registered to indicate activity on CPUs
[    0.492851] pcieport 0000:00:06.0: PME: Signaling with IRQ 125
[    0.493124] pcieport 0000:00:06.0: AER: enabled with IRQ 125
[    0.493406] pcieport 0000:00:07.0: PME: Signaling with IRQ 126
[    0.493497] pcieport 0000:00:07.0: AER: enabled with IRQ 126
[    0.493508] pcieport 0000:00:07.0: pciehp: Slot #10 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.493771] pcieport 0000:00:07.1: PME: Signaling with IRQ 127
[    0.493858] pcieport 0000:00:07.1: AER: enabled with IRQ 127
[    0.493867] pcieport 0000:00:07.1: pciehp: Slot #10 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.494128] pcieport 0000:00:07.2: PME: Signaling with IRQ 128
[    0.494214] pcieport 0000:00:07.2: AER: enabled with IRQ 128
[    0.494226] pcieport 0000:00:07.2: pciehp: Slot #10 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.496209] ACPI: AC: AC Adapter [AC] (off-line)
[    0.496502] input: Lid Switch as /devices/platform/PNP0C0D:00/input/input0
[    0.496548] ACPI: button: Lid Switch [LID0]
[    0.496700] input: Power Button as /devices/platform/PNP0C0C:00/input/input1
[    0.496743] ACPI: button: Power Button [PBTN]
[    0.496879] input: Sleep Button as /devices/platform/PNP0C0E:00/input/input2
[    0.496939] ACPI: button: Sleep Button [SBTN]
[    0.498290] Monitor-Mwait will be used to enter C-1 state
[    0.498310] Monitor-Mwait will be used to enter C-2 state
[    0.498327] Monitor-Mwait will be used to enter C-3 state
[    0.527327] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.530345] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.533217] hpet_acpi_add: no address or irqs in _CRS
[    0.533278] Non-volatile memory driver v1.3
[    0.533279] Linux agpgart interface v0.103
[    0.540454] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, rev-id 1)
[    0.542328] Freeing initrd memory: 26820K
[    0.572419] ACPI: battery: Slot [BAT0] (battery present)
[    0.642436] ACPI: bus type drm_connector registered
[    0.643196] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.643218] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    0.644426] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.644927] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.644930] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    0.644932] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.644973] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.00
[    0.644976] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.644977] usb usb1: Product: xHCI Host Controller
[    0.644979] usb usb1: Manufacturer: Linux 7.0.3-1-cachyos xhci-hcd
[    0.644980] usb usb1: SerialNumber: 0000:00:0d.0
[    0.645109] hub 1-0:1.0: USB hub found
[    0.645147] hub 1-0:1.0: 1 port detected
[    0.645357] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.00
[    0.645359] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.645360] usb usb2: Product: xHCI Host Controller
[    0.645362] usb usb2: Manufacturer: Linux 7.0.3-1-cachyos xhci-hcd
[    0.645363] usb usb2: SerialNumber: 0000:00:0d.0
[    0.645471] hub 2-0:1.0: USB hub found
[    0.645481] hub 2-0:1.0: 3 ports detected
[    0.647326] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.647330] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    0.648494] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.649021] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.649023] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    0.649025] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.649058] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.00
[    0.649060] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.649061] usb usb3: Product: xHCI Host Controller
[    0.649063] usb usb3: Manufacturer: Linux 7.0.3-1-cachyos xhci-hcd
[    0.649064] usb usb3: SerialNumber: 0000:00:14.0
[    0.649181] hub 3-0:1.0: USB hub found
[    0.649228] hub 3-0:1.0: 10 ports detected
[    0.653654] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.00
[    0.653656] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.653657] usb usb4: Product: xHCI Host Controller
[    0.653659] usb usb4: Manufacturer: Linux 7.0.3-1-cachyos xhci-hcd
[    0.653660] usb usb4: SerialNumber: 0000:00:14.0
[    0.653758] hub 4-0:1.0: USB hub found
[    0.653799] hub 4-0:1.0: 2 ports detected
[    0.654752] usbcore: registered new interface driver usbserial_generic
[    0.654757] usbserial: USB Serial support registered for generic
[    0.654788] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.655416] i8042: Warning: Keylock active
[    0.658556] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.658601] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.658830] rtc_cmos 00:00: RTC can wake from S4
[    0.660175] rtc_cmos 00:00: registered as rtc0
[    0.660401] rtc_cmos 00:00: setting system clock to 2026-05-06T13:26:12 UTC (1778073972)
[    0.660482] rtc_cmos 00:00: alarms up to one month, y3k, 242 bytes nvram
[    0.660908] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    0.662088] intel_pstate: Intel P-state driver initializing
[    0.664554] Hybrid CPU capacity scaling enabled
[    0.664568] processor cpu0: EM: created perf domain
[    0.664580] processor cpu1: EM: created perf domain
[    0.664587] processor cpu2: EM: created perf domain
[    0.664595] processor cpu3: EM: created perf domain
[    0.664603] processor cpu4: EM: created perf domain
[    0.664614] processor cpu5: EM: created perf domain
[    0.664621] processor cpu6: EM: created perf domain
[    0.664631] processor cpu7: EM: created perf domain
[    0.664640] processor cpu8: EM: created perf domain
[    0.664649] processor cpu9: EM: created perf domain
[    0.664657] processor cpu10: EM: created perf domain
[    0.664665] processor cpu11: EM: created perf domain
[    0.664674] processor cpu12: EM: created perf domain
[    0.664682] processor cpu13: EM: created perf domain
[    0.664691] processor cpu14: EM: created perf domain
[    0.664699] processor cpu15: EM: created perf domain
[    0.664827] intel_pstate: HWP enabled
[    0.664937] Relocating firmware framebuffer to offset 0x0000000000800000[d] within [mem 0x8000000000-0x800fffffff flags 0x14220c]
[    0.665008] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 planes with drm panic
[    0.665012] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 on minor 0
[    0.670612] Console: switching to colour frame buffer device 180x56
[    0.677131] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
[    0.677171] hid: raw HID events driver (C) Jiri Kosina
[    0.677192] usbcore: registered new interface driver usbhid
[    0.677193] usbhid: USB HID core driver
[    0.677267] drop_monitor: Initializing network drop monitor service
[    0.677334] NET: Registered PF_INET6 protocol family
[    0.678018] Segment Routing with IPv6
[    0.678019] RPL Segment Routing with IPv6
[    0.678026] In-situ OAM (IOAM) with IPv6
[    0.678050] NET: Registered PF_PACKET protocol family
[    0.681764] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.682150] microcode: Current revision: 0x00000119
[    0.682825] IPI shorthand broadcast: enabled
[    0.684010] Piece-Of-Cake (POC) CPU Selector 2.6.1 by Masahito Suzuki [CTZ: HW (TZCNT), PTSelect: HW (PDEP)]
[    0.684020] sched_clock: Marking stable (677000622, 6243731)->(705999848, -22755495)
[    0.684256] registered taskstats version 1
[    0.684605] Loading compiled-in X.509 certificates
[    0.688033] Loaded X.509 cert 'Build time autogenerated kernel key: d8d43658bcf20c5966a6aeab653a6abf0c53b4eb'
[    0.689331] zswap: loaded using pool zstd
[    0.689361] Demotion targets for Node 0: null
[    0.689488] Key type .fscrypt registered
[    0.689488] Key type fscrypt-provisioning registered
[    0.689630] Btrfs loaded, zoned=yes, fsverity=yes
[    0.689646] Key type big_key registered
[    0.689717] integrity: Loading X.509 certificate: UEFI:db
[    0.689725] integrity: Loaded X.509 cert 'Dell Inc.: Dell Bios DB Key: 637fa7a9f74471b406de0511557071fd41dd5487'
[    0.689726] integrity: Loading X.509 certificate: UEFI:db
[    0.689731] integrity: Loaded X.509 cert 'Dell Inc.: Dell Bios FW Aux Authority 2018: dd4df7c3f5ce7e5a77847915abc37b031f6b10bd'
[    0.689732] integrity: Loading X.509 certificate: UEFI:db
[    0.689737] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.689738] integrity: Loading X.509 certificate: UEFI:db
[    0.689743] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.689743] integrity: Loading X.509 certificate: UEFI:db
[    0.689747] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    0.689747] integrity: Loading X.509 certificate: UEFI:db
[    0.689752] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    0.689752] integrity: Loading X.509 certificate: UEFI:db
[    0.689755] integrity: Loaded X.509 cert 'Microsoft Option ROM UEFI CA 2023: 514fbf937fa46fb57bf07af8bed84b3b864b1711'
[    0.690428] BERT: [Hardware Error]: Skipped 1 error records
[    0.690429] BERT: Total records found: 1
[    0.690443] PM:   Magic number: 10:197:432
[    0.690567] RAS: Correctable Errors collector initialized.
[    0.690666] clk: Disabling unused clocks
[    0.690666] PM: genpd: Disabling unused power domains
[    0.696783] Freeing unused decrypted memory: 2028K
[    0.697442] Freeing unused kernel image (initmem) memory: 4720K
[    0.697465] Write protecting the kernel read-only data: 38912k
[    0.697785] Freeing unused kernel image (text/rodata gap) memory: 236K
[    0.697808] Freeing unused kernel image (rodata/data gap) memory: 8K
[    0.698102] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.698104] rodata_test: all tests were successful
[    0.698107] Run /init as init process
[    0.698108]   with arguments:
[    0.698109]     /init
[    0.698109]   with environment:
[    0.698110]     HOME=/
[    0.698110]     TERM=linux
[    0.726605] systemd[1]: Successfully made /usr/ read-only.
[    0.889404] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    1.013832] usb 3-3: New USB device found, idVendor=06cb, idProduct=0701, bcdDevice= 1.14
[    1.013840] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.013842] usb 3-3: Product: SVP7500
[    1.013844] usb 3-3: Manufacturer: Synaptics , Inc
[    1.013846] usb 3-3: SerialNumber: 01.00.00.00
[    1.063219] systemd[1]: systemd 260.1-2-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
[    1.063235] systemd[1]: Detected architecture x86-64.
[    1.063239] systemd[1]: Running in initrd.
[    1.065756] systemd[1]: Initializing machine ID from random generator.
[    1.105801] systemd[1]: Queued start job for default target Initrd Default Target.
[    1.171822] systemd[1]: Created slice Slice /system/systemd-cryptsetup.
[    1.172186] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    1.172263] systemd[1]: Expecting device /dev/disk/by-uuid/a20bebe1-33d2-4745-af1e-53b896713292...
[    1.172315] systemd[1]: Expecting device /dev/mapper/root...
[    1.172362] systemd[1]: Reached target Path Units.
[    1.172405] systemd[1]: Reached target Slice Units.
[    1.172446] systemd[1]: Reached target Swaps.
[    1.172488] systemd[1]: Reached target Timer Units.
[    1.172606] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.172699] systemd[1]: Listening on Journal Sockets.
[    1.172783] systemd[1]: Listening on udev Control Socket.
[    1.172853] systemd[1]: Listening on udev Kernel Socket.
[    1.172894] systemd[1]: Reached target Socket Units.
[    1.175609] systemd[1]: Starting Create List of Static Device Nodes...
[    1.178388] systemd[1]: Starting Early Battery Level Check...
[    1.182688] systemd[1]: Starting Journal Service...
[    1.185623] systemd[1]: Starting Load Kernel Modules...
[    1.185985] systemd[1]: TPM PCR Barrier (initrd) skipped, unmet condition check ConditionSecurity=measured-uki
[    1.188791] systemd[1]: Starting Create Static Device Nodes in /dev...
[    1.191793] systemd[1]: Starting Coldplug All udev Devices...
[    1.199152] systemd[1]: Finished Create List of Static Device Nodes.
[    1.201954] systemd[1]: Finished Early Battery Level Check.
[    1.204150] systemd[1]: Finished Load Kernel Modules.
[    1.205493] systemd-journald[223]: Collecting audit messages is disabled.
[    1.206406] systemd[1]: Finished Create Static Device Nodes in /dev.
[    1.206693] systemd[1]: Reached target Preparation for Local File Systems.
[    1.206747] systemd[1]: Reached target Local File Systems.
[    1.209629] systemd[1]: Started Display Boot-Time Emergency Messages In Full Screen.
[    1.212554] systemd[1]: Starting Rule-based Manager for Device Events and Files...
[    1.234535] systemd[1]: Started Rule-based Manager for Device Events and Files.
[    1.243396] systemd[1]: Started Journal Service.
[    1.353549] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    1.359947] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug]: WQBC data block query control method not found
[    1.363616] Key type psk registered
[    1.364486] intel-lpss 0000:00:19.0: enabling device (0000 -> 0002)
[    1.378531] intel-lpss 0000:00:19.1: enabling device (0000 -> 0002)
[    1.379100] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.379154] nvme nvme0: pci function 0000:01:00.0
[    1.399891] nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
[    1.418968] nvme nvme0: 16/0/0 default/read/poll queues
[    1.443830]  nvme0n1: p1 p2
[    1.501447] device-mapper: uevent: version 1.0.3
[    1.501520] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
[    1.669011] Setting dangerous option enable_panel_replay - tainting kernel
[    1.686493] Console: switching to colour dummy device 80x25
[    1.686744] xe 0000:00:02.0: vgaarb: deactivate vga console
[    1.686966] xe 0000:00:02.0: [drm] Running in SR-IOV PF mode
[    1.687147] xe 0000:00:02.0: [drm] Found pantherlake (device ID b080) integrated display version 30.00 stepping B0
[    1.688772] xe 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.697869] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/xe3lpd_dmc.bin (v2.33)
[    2.423265] xe 0000:00:02.0: [drm] [CONNECTOR:511:eDP-1] Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=3.
[    2.452506] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.58.0
[    2.653915] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
[    2.653917] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
[    2.653918] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
[    2.674953] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware from xe/ptl_guc_70.bin version 70.58.0
[    2.678105] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware from xe/ptl_huc.bin version 10.3.3
[    2.679187] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/ptl_gsc_1.bin version 105.0.2.1301
[    2.700556] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
[    2.700559] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
[    2.700560] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
[    2.700561] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
[    2.700562] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
[    2.700563] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
[    2.700564] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
[    2.700565] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
[    2.700567] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
[    2.700568] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
[    2.754113] xe 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
[    2.871064] xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv105.1.0
[    3.933858] xe 0000:00:02.0: [drm] PXP requires PTL GSC build 1396 or newer
[    3.936614] xe 0000:00:02.0: [drm] Registered 4 planes with drm panic
[    3.942502] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
[    3.945672] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    3.947051] input: Video Bus as /devices/pci0000:00/acpi.video_bus.0/input/input5
[    3.950131] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
[    3.952939] fbcon: xedrmfb (fb0) is primary device
[    3.959394] Console: switching to colour frame buffer device 180x56
[    3.978592] xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device
[   11.110052] Key type trusted registered
[   11.113131] Key type encrypted registered
[   11.201261] BTRFS: device label btrroot devid 1 transid 11365 /dev/mapper/root (253:0) scanned by mount (560)
[   11.201737] BTRFS info (device dm-0): first mount of filesystem 3efe9699-fe1a-4b66-96f5-6d9cb1f68308
[   11.201746] BTRFS info (device dm-0): using crc32c checksum algorithm
[   11.205913] BTRFS info (device dm-0): enabling ssd optimizations
[   11.205922] BTRFS info (device dm-0): turning on async discard
[   11.205925] BTRFS info (device dm-0): enabling free space tree
[   11.591112] systemd-journald[223]: Received SIGTERM from PID 1 (systemd).
[   11.969140] systemd[1]: systemd 260.1-2-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
[   11.969173] systemd[1]: Detected architecture x86-64.
[   11.989585] systemd[1]: Hostname set to <t14>.
[   12.070056] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[   12.266346] systemd[1]: initrd-switch-root.service: Deactivated successfully.
[   12.266428] systemd[1]: Stopped Switch Root.
[   12.267316] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[   12.267510] systemd[1]: Created slice Virtual Machine and Container Slice.
[   12.268119] systemd[1]: Created slice Slice /system/dirmngr.
[   12.268688] systemd[1]: Created slice Slice /system/getty.
[   12.269226] systemd[1]: Created slice Slice /system/gpg-agent.
[   12.269756] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[   12.270278] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[   12.270800] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[   12.271344] systemd[1]: Created slice Slice /system/keyboxd.
[   12.271865] systemd[1]: Created slice Slice /system/modprobe.
[   12.272376] systemd[1]: Created slice Slice /system/systemd-fsck.
[   12.272870] systemd[1]: Created slice Slice /system/wg-quick.
[   12.273297] systemd[1]: Created slice User and Session Slice.
[   12.273642] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   12.273990] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   12.274411] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[   12.274752] systemd[1]: Expecting device /dev/disk/by-uuid/C603-8929...
[   12.275098] systemd[1]: Reached target Image Downloads.
[   12.275442] systemd[1]: Stopped target Switch Root.
[   12.275783] systemd[1]: Stopped target Initrd File Systems.
[   12.276117] systemd[1]: Stopped target Initrd Root File System.
[   12.276448] systemd[1]: Reached target Local Integrity Protected Volumes.
[   12.276789] systemd[1]: Reached target Host and Network Name Lookups.
[   12.277128] systemd[1]: Reached target Path Units.
[   12.277487] systemd[1]: Reached target Remote File Systems.
[   12.277846] systemd[1]: Reached target Slice Units.
[   12.278217] systemd[1]: Reached target Local Verity Protected Volumes.
[   12.279498] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   12.280442] systemd[1]: Listening on Query the User Interactively for a Password.
[   12.282618] systemd[1]: Listening on Process Core Dump Socket.
[   12.283479] systemd[1]: Listening on Credential Encryption/Decryption.
[   12.284486] systemd[1]: Listening on Factory Reset Management.
[   12.285452] systemd[1]: Listening on Console Output Muting Service Socket.
[   12.285921] systemd[1]: TPM PCR Measurements skipped, unmet condition check ConditionSecurity=measured-uki
[   12.285934] systemd[1]: Make TPM PCR Policy skipped, unmet condition check ConditionSecurity=measured-uki
[   12.286316] systemd[1]: Listening on Disk Repartitioning Service Socket.
[   12.286711] systemd[1]: Listening on udev Control Socket.
[   12.287087] systemd[1]: Listening on udev Varlink Socket.
[   12.287456] systemd[1]: Listening on User Database Manager Socket.
[   12.289133] systemd[1]: Mounting Huge Pages File System...
[   12.289830] systemd[1]: Mounting POSIX Message Queue File System...
[   12.290527] systemd[1]: Mounting Kernel Debug File System...
[   12.291193] systemd[1]: Mounting Kernel Trace File System...
[   12.297652] systemd[1]: Starting Create List of Static Device Nodes...
[   12.298077] systemd[1]: Load Kernel Module configfs skipped, unmet condition check ConditionKernelModuleLoaded=!configfs
[   12.298495] systemd[1]: Mounting Kernel Configuration File System...
[   12.298895] systemd[1]: Load Kernel Module drm skipped, unmet condition check ConditionKernelModuleLoaded=!drm
[   12.298916] systemd[1]: Load Kernel Module fuse skipped, unmet condition check ConditionKernelModuleLoaded=!fuse
[   12.299314] systemd[1]: Mounting FUSE Control File System...
[   12.299729] systemd[1]: systemd-cryptsetup@root.service: Deactivated successfully.
[   12.299744] systemd[1]: Stopped systemd-cryptsetup@root.service.
[   12.300143] systemd[1]: systemd-cryptsetup@root.service: Consumed 6.976s CPU time over 10.819s wall clock time, 1G memory peak.
[   12.300266] systemd[1]: systemd-fsck-root.service: Deactivated successfully.
[   12.300287] systemd[1]: Stopped File System Check on Root Device.
[   12.300662] systemd[1]: Clear Stale Hibernate Storage Info skipped, unmet condition check ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67
[   12.301776] systemd[1]: Starting Journal Service...
[   12.302800] systemd[1]: Starting Load Kernel Modules...
[   12.303128] systemd[1]: TPM PCR Machine ID Measurement skipped, unmet condition check ConditionSecurity=measured-uki
[   12.303785] systemd[1]: Starting Remount Root and Kernel File Systems...
[   12.304224] systemd[1]: Early TPM SRK Setup skipped, unmet condition check ConditionSecurity=measured-uki
[   12.304652] systemd[1]: Starting Load udev Rules from Credentials...
[   12.305344] systemd[1]: Starting Coldplug All udev Devices...
[   12.307205] systemd[1]: Mounted Huge Pages File System.
[   12.307588] systemd[1]: Mounted POSIX Message Queue File System.
[   12.307961] systemd[1]: Mounted Kernel Debug File System.
[   12.308360] systemd[1]: Mounted Kernel Trace File System.
[   12.308796] systemd[1]: Finished Create List of Static Device Nodes.
[   12.309174] systemd[1]: Mounted Kernel Configuration File System.
[   12.309554] systemd[1]: Mounted FUSE Control File System.
[   12.310325] systemd[1]: Starting Create Static Device Nodes in /dev gracefully...
[   12.310818] systemd[1]: Finished Load udev Rules from Credentials.
[   12.311593] systemd[1]: Finished Remount Root and Kernel File Systems.
[   12.312175] systemd[1]: Rebuild Hardware Database skipped, unmet condition check ConditionNeedsUpdate=/etc
[   12.312689] systemd[1]: Starting Load/Save OS Random Seed...
[   12.313054] systemd[1]: TPM SRK Setup skipped, unmet condition check ConditionSecurity=measured-uki
[   12.313068] systemd[1]: TPM PCR NvPCR Initialization Separator skipped, unmet condition check ConditionSecurity=measured-uki
[   12.313078] systemd[1]: Reached target Local Encrypted Volumes.
[   12.313334] Asymmetric key parser 'pkcs8' registered
[   12.313441] systemd[1]: TPM NvPCR Product ID Measurement skipped, unmet condition check ConditionSecurity=measured-uki
[   12.313644] i2c_dev: i2c /dev entries driver
[   12.314292] systemd[1]: Finished Load Kernel Modules.
[   12.315158] systemd[1]: Starting Apply Kernel Variables...
[   12.315224] systemd-journald[771]: Collecting audit messages is disabled.
[   12.317861] systemd[1]: Started Journal Service.
[   12.334107] systemd-journald[771]: Received client request to flush runtime journal.
[   13.455528] Adding 16777212k swap on /swap/swapfile.  Priority:-1 extents:1 across:16777212k SS
[   13.591521] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than PNP0C02:03 [mem 0xfedc0000-0xfedc7fff]
[   13.591525] caller igen6_probe+0x1cb/0xe20 [igen6_edac] mapping multiple BARs
[   13.591550] EDAC MC0: Giving out device to module igen6_edac controller Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[   13.591600] EDAC MC1: Giving out device to module igen6_edac controller Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[   13.591630] EDAC igen6: v2.5.1
[   13.595521] intel_ipu7: module is from the staging directory, the quality is unknown, you have been warned.
[   13.598654] intel_pmc_ssram_telemetry 0000:00:14.2: enabling device (0000 -> 0002)
[   13.602259] intel-ipu7 0000:00:05.0: enabling device (0000 -> 0002)
[   13.602264] intel-ipu7 0000:00:05.0: Device 0xb05d (rev: 0x4)
[   13.602266] intel-ipu7 0000:00:05.0: IPU7 PCI BAR0 base 0x000000c812000000 BAR2 base 0x000000c81537a000
[   13.602285] intel-ipu7 0000:00:05.0: IPU7 PCI BAR0 mapped at 00000000c84c5fca
                BAR2 mapped at 00000000ea879ac9
[   13.602488] intel-ipu7 0000:00:05.0: IPU7 SKU 1 in secure mode mask 0x0
[   13.604937] intel_vpu 0000:00:0b.0: enabling device (0000 -> 0002)
[   13.608349] intel_vpu 0000:00:0b.0: [drm] Firmware: intel/vpu/vpu_50xx_v1.bin, version: Nov 13 2025*NPU50xx*ci_tag_ud202548_vpu_rc_20251112_1901-1-g72f907ffc78*72f907ffc780df5579a2fed65afc4944da8b0e44
[   13.608352] intel_vpu 0000:00:0b.0: [drm] Scheduler mode: HW
[   13.615629] mc: Linux media interface: v0.10
[   13.615686] ACPI: bus type thunderbolt registered
[   13.616525] intel-ipu7 0000:00:05.0: firmware cpd file: intel/ipu/ipu7ptl_fw.bin
[   13.617605] intel-ipu7 0000:00:05.0: FW binary0 info:
[   13.617607] intel-ipu7 0000:00:05.0: Name:  psys
[   13.617608] intel-ipu7 0000:00:05.0: Version:  1.2.1.251215214352
[   13.617608] intel-ipu7 0000:00:05.0: Timestamp:  build_id:2923306609
[   13.617609] intel-ipu7 0000:00:05.0: Commit:  commit_id:ee59e1e0
[   13.617610] intel-ipu7 0000:00:05.0: FW binary1 info:
[   13.617611] intel-ipu7 0000:00:05.0: Name:  isys
[   13.617611] intel-ipu7 0000:00:05.0: Version:  1.2.1.251215214331
[   13.617612] intel-ipu7 0000:00:05.0: Timestamp:  build_id:2439351977
[   13.617612] intel-ipu7 0000:00:05.0: Commit:  commit_id:ee59e1e0
[   13.618650] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.619235] intel-ipu7 0000:00:05.0: Found supported sensor OVTI08F4:00
[   13.619287] intel-ipu7 0000:00:05.0: Connected 1 cameras
[   13.623420] intel-ipu7 0000:00:05.0: Sending BOOT_LOAD to CSE
[   13.624301] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.624908] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.633079] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.634905] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.635873] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.641577] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   13.641610] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   13.642821] Bluetooth: Core ver 2.22
[   13.642838] NET: Registered PF_BLUETOOTH protocol family
[   13.642839] Bluetooth: HCI device and connection manager initialized
[   13.642843] Bluetooth: HCI socket layer initialized
[   13.642845] Bluetooth: L2CAP socket layer initialized
[   13.642847] Bluetooth: SCO socket layer initialized
[   13.644364] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   13.644603] videodev: Linux video capture interface: v2.00
[   13.645913] input: Intel HID events as /devices/platform/INTC10CC:00/input/input7
[   13.646093] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.646094] intel-hid INTC10CC:00: platform supports 5 button array
[   13.646124] input: Intel HID 5 button array as /devices/platform/INTC10CC:00/input/input8
[   13.647231] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   13.647361] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   13.647506] faux_driver regulatory: Direct firmware load for regulatory.db failed with error -2
[   13.647509] cfg80211: failed to load regulatory.db
[   13.650100] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.650499] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.658886] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.660069] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.660302] usbcore: registered new interface driver usbio-bridge
[   13.662271] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.663496] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.663522] input: PC Speaker as /devices/platform/pcspkr/input/input9
[   13.664656] ACPI: battery: new hook: Dell DDV Battery Extension
[   13.667539] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.668873] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.672571] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.674042] [drm] Initialized intel_vpu 1.0.0 for 0000:00:0b.0 on minor 0
[   13.682818] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.688054] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.696757] intel-ipu7 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[   13.726760] intel-ipu7 0000:00:05.0: CSE authenticate_run done
[   13.730378] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.739059] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.749214] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.816974] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.819891] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.918451] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.920379] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.026583] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.028027] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.030822] intel_ish_ipc 0000:00:12.0: ISH loader: load firmware: intel/ish/ish_ptl_39ceeaf8.bin
[   14.048327] intel_ish_ipc 0000:00:12.0: ISH loader: firmware loaded. size:768512
[   14.048329] intel_ish_ipc 0000:00:12.0: ISH loader: FW base version: 5.8.1.7779
[   14.048330] intel_ish_ipc 0000:00:12.0: ISH loader: FW project version: 581.7779.0.13177
[   14.058502] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.059000] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.059486] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.060266] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.060727] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.064696] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.065153] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.068919] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.069818] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.074052] intel_pmc_core INT33A1:00:  initialized
[   14.074891] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   14.076369] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.077523] Creating 1 MTD partitions on "0000:00:1f.5":
[   14.077526] 0x000000000000-0x000004000000 : "BIOS"
[   14.078915] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.083799] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.088748] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[   14.089373] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.097576] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.099676] iwlwifi 0000:00:14.3: Detected crf-id 0x1002a10, cnv-id 0x80a00 wfpm id 0x80005b20
[   14.099685] iwlwifi 0000:00:14.3: PCI dev e440/4110, rev=0x480, rfid=0x20113100
[   14.099687] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 7 BE211 320MHz
[   14.101014] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.102309] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.104100] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.104438] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.104790] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.106607] iwlwifi 0000:00:14.3: loaded firmware version 101.6e695a70.0 sc-a0-wh-b0-c101.ucode op_mode iwlmld
[   14.213920] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input10
[   14.215181] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.216462] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.239146] input: VEN_06CB:00 06CB:D01D Mouse as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input11
[   14.239205] input: VEN_06CB:00 06CB:D01D Touchpad as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input12
[   14.239248] input: VEN_06CB:00 06CB:D01D as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input14
[   14.239323] hid-generic 0018:06CB:D01D.0001: input,hidraw0: I2C HID v1.00 Mouse [VEN_06CB:00 06CB:D01D] on i2c-VEN_06CB:00
[   14.240467] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.241187] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.325186] input: CUST0000:00 3558:2002 Touchscreen as /devices/pci0000:00/0000:00:19.1/i2c_designware.1/i2c-1/i2c-CUST0000:00/0018:3558:2002.0002/input/input15
[   14.325266] hid-generic 0018:3558:2002.0002: input,hidraw1: I2C HID v1.00 Device [CUST0000:00 3558:2002] on i2c-CUST0000:00
[   14.329197] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.332834] btintel_pcie 0000:00:14.7: enabling device (0000 -> 0002)
[   14.334456] pps_core: LinuxPPS API ver. 1 registered
[   14.334458] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   14.334682] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.337534] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.343260] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.347339] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.350782] PTP clock support registered
[   14.354347] input: Dell Privacy Driver as /devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/6932965F-1671-4CEB-B988-D3AB0A901919-1/input/input17
[   14.359024] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.360460] input: Dell WMI hotkeys as /devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/9DBB5994-A997-11DA-B012-B622A1EF5492-3/input/input18
[   14.362705] Bluetooth: hci0: Device revision is 0
[   14.362709] Bluetooth: hci0: Secure boot is enabled
[   14.362711] Bluetooth: hci0: OTP lock is disabled
[   14.362711] Bluetooth: hci0: API lock is enabled
[   14.362712] Bluetooth: hci0: Debug lock is disabled
[   14.362712] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[   14.362713] Bluetooth: hci0: Bootloader timestamp 2023.43 buildtype 1 build 11631
[   14.364873] Bluetooth: hci0: Found device firmware: intel/ibt-00a0-01a1-iml.sfi
[   14.364878] Bluetooth: hci0: Boot Address: 0xb02ff000
[   14.364879] Bluetooth: hci0: Firmware Version: 248-3.26
[   14.365580] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.374443] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   14.376579] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   14.394039] intel_rapl_msr: PL4 support detected.
[   14.394042] intel_rapl_msr: MSR-based RAPL PMU support enabled
[   14.394277] intel_rapl_common: Found RAPL domain package
[   14.394279] intel_rapl_common: Found RAPL domain core
[   14.394281] intel_rapl_common: Found RAPL domain uncore
[   14.394282] intel_rapl_common: Found RAPL domain dram
[   14.394283] intel_rapl_common: Found RAPL domain psys
[   14.395115] gpio_usbio.usbio-gpio usbio.usbio-gpio.0: [Firmware Bug]: GPIO 11 is not in FW pins bitmap
[   14.395848] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[   14.399223] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[   14.403552] int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor may not work
[   14.404079] proc_thermal_pci 0000:00:04.0: enabling device (0400 -> 0402)
[   14.404588] intel_rapl_common: Found RAPL domain package
[   14.404592] intel_rapl_common: Found RAPL domain dram
[   14.408519] intel_tcc_cooling: TCC Offset locked
[   14.410497] mousedev: PS/2 mouse device common for all mice
[   14.411575] proc_thermal_pci 0000:00:04.0: msi enabled:1 msix enabled:0
[   14.412428] intel_ipu7_isys: module is from the staging directory, the quality is unknown, you have been warned.
[   14.412830] mei_gsc_proxy 0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5464: bound 0000:00:02.0 (ops xe_gsc_proxy_component_ops [xe])
[   14.414147] Bluetooth: hci0: Waiting for firmware download to complete
[   14.414150] Bluetooth: hci0: Firmware loaded in 48118 usecs
[   14.415615] Bluetooth: hci0: Waiting for device to boot
[   14.415618] Bluetooth: hci0: Device booted in 1430 usecs
[   14.415619] Bluetooth: hci0: Waiting for device transition to d0
[   14.415620] Bluetooth: hci0: Device moved to D0 in 0 usecs
[   14.415730] Bluetooth: hci0: dsbr: enable: 0x01 value: 0x0f
[   14.418834] Bluetooth: hci0: Found device firmware: intel/ibt-00a0-01a1-pci.sfi
[   14.418846] Bluetooth: hci0: Boot Address: 0x10000800
[   14.418848] Bluetooth: hci0: Firmware Version: 248-3.26
[   14.451728] input: VEN_06CB:00 06CB:D01D Mouse as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input19
[   14.451780] input: VEN_06CB:00 06CB:D01D Touchpad as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input20
[   14.451832] input: VEN_06CB:00 06CB:D01D UNKNOWN as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input22
[   14.451869] hid-multitouch 0018:06CB:D01D.0001: input,hidraw0: I2C HID v1.00 Mouse [VEN_06CB:00 06CB:D01D] on i2c-VEN_06CB:00
[   14.474099] input: CUST0000:00 3558:2002 as /devices/pci0000:00/0000:00:19.1/i2c_designware.1/i2c-1/i2c-CUST0000:00/0018:3558:2002.0002/input/input23
[   14.474159] hid-multitouch 0018:3558:2002.0002: input,hidraw1: I2C HID v1.00 Device [CUST0000:00 3558:2002] on i2c-CUST0000:00
[   14.491121] ACPI: battery: new hook: Dell Primary Battery Extension
[   14.532823] sof-audio-pci-intel-ptl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
[   14.532840] sof-audio-pci-intel-ptl 0000:00:1f.3: enabling device (0000 -> 0002)
[   14.533647] sof-audio-pci-intel-ptl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
[   14.533718] sof-audio-pci-intel-ptl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [xe])
[   14.540382] sof-audio-pci-intel-ptl 0000:00:1f.3: use msi interrupt mode
[   14.550445] acpi PRP00001:00: Creating 5 SDW Link devices
[   14.550509] soundwire sdw-master-0-0: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.550526] soundwire sdw-master-0-0: SDW Slave Addr: 3001fa424501
[   14.550527] soundwire sdw-master-0-0: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x4245, unique_id 0x0, version 0x3
[   14.550536] acpi device:29: SDCA function SmartMic (type 3) at 0x2
[   14.550540] acpi device:2a: SDCA function UAJ (type 6) at 0x3
[   14.550542] acpi device:2b: SDCA function HID (type 10) at 0x4
[   14.550645] soundwire sdw-master-0-2: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.550648] soundwire sdw-master-0-2: SDW Slave Addr: 23201fa355701
[   14.550649] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.550652] soundwire sdw-master-0-2: SDW Slave Addr: 23301fa355701
[   14.550652] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.550653] soundwire sdw-master-0-2: Valid unique IDs 0x2 0x3 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550659] acpi device:25: SDCA function SmartAmp (type 1) at 0x1
[   14.550693] soundwire sdw-master-0-2: SDW Slave Addr: 23301fa355701
[   14.550694] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.550696] soundwire sdw-master-0-2: SDW Slave Addr: 23201fa355701
[   14.550697] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.550697] soundwire sdw-master-0-2: Valid unique IDs 0x3 0x2 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550701] acpi device:27: SDCA function SmartAmp (type 1) at 0x1
[   14.550752] soundwire sdw-master-0-3: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.550755] soundwire sdw-master-0-3: SDW Slave Addr: 33001fa355701
[   14.550755] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.550756] soundwire sdw-master-0-3: SDW Slave Addr: 33101fa355701
[   14.550757] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.550757] soundwire sdw-master-0-3: Valid unique IDs 0x0 0x1 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550762] acpi device:21: SDCA function SmartAmp (type 1) at 0x1
[   14.550794] soundwire sdw-master-0-3: SDW Slave Addr: 33101fa355701
[   14.550795] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.550796] soundwire sdw-master-0-3: SDW Slave Addr: 33001fa355701
[   14.550796] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.550797] soundwire sdw-master-0-3: Valid unique IDs 0x1 0x0 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550801] acpi device:23: SDCA function SmartAmp (type 1) at 0x1
[   14.552699] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   14.552701] Bluetooth: BNEP filters: protocol multicast
[   14.552707] Bluetooth: BNEP socket layer initialized
[   14.561686] soundwire_intel soundwire_intel.link.0: clock source 0 LVSCTL 0x0
[   14.561689] soundwire_intel soundwire_intel.link.0: first link up, programming SYNCPRD
[   14.561731] soundwire_intel soundwire_intel.link.0: PCM cap bd:15 in:0 out:0
[   14.563340] soundwire_intel soundwire_intel.link.2: clock source 0 LVSCTL 0x0
[   14.563395] soundwire_intel soundwire_intel.link.2: PCM cap bd:15 in:0 out:0
[   14.564732] sdca_class sdw:0:0:01fa:4245:01: SWFT not available
[   14.564832] sdca_class sdw:0:0:01fa:4245:01: probe complete
[   14.565285] soundwire_intel soundwire_intel.link.3: clock source 0 LVSCTL 0x0
[   14.565311] soundwire_intel soundwire_intel.link.3: PCM cap bd:15 in:0 out:0
[   14.566102] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.566293] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[   14.566294] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.566587] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[   14.566588] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.566875] soundwire sdw-master-0-2: No more devices to enumerate
[   14.566929] soundwire sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 1
[   14.566930] soundwire sdw:0:2:01fa:3557:01:3: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.567375] sof-audio-pci-intel-ptl 0000:00:1f.3: No SoundWire machine driver found for the ACPI-reported configuration:
[   14.567376] sof-audio-pci-intel-ptl 0000:00:1f.3: link 0 mfg_id 0x01fa part_id 0x4245 version 0x3
[   14.567377] sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567378] sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567378] sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567379] sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567385] sof-audio-pci-intel-ptl 0000:00:1f.3: Use SoundWire default machine driver with function topologies
[   14.567385] sof-audio-pci-intel-ptl 0000:00:1f.3: hda codecs found, mask 4
[   14.567386] sof-audio-pci-intel-ptl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[   14.567387] sof-audio-pci-intel-ptl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[   14.567388] sof-audio-pci-intel-ptl 0000:00:1f.3: DMICs detected in NHLT tables: 0
[   14.567536] soundwire sdw:0:2:01fa:3557:01:3: signaling initialization completion for Slave 1
[   14.567537] soundwire sdw:0:2:01fa:3557:01:2: signaling enumeration completion for Slave 2
[   14.567537] soundwire sdw:0:2:01fa:3557:01:2: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.568119] soundwire sdw:0:2:01fa:3557:01:2: signaling initialization completion for Slave 2
[   14.568438] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.568625] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[   14.568625] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.568629] sof-audio-pci-intel-ptl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[   14.568630] sof-audio-pci-intel-ptl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/ptl/sof-ptl.ri
[   14.568631] sof-audio-pci-intel-ptl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/ptl
[   14.568631] sof-audio-pci-intel-ptl 0000:00:1f.3:  Topology file:     function topologies
[   14.568816] sof-audio-pci-intel-ptl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   14.568866] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[   14.568867] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.569146] soundwire sdw-master-0-3: No more devices to enumerate
[   14.569211] soundwire sdw:0:3:01fa:3557:01:1: signaling enumeration completion for Slave 1
[   14.569211] soundwire sdw:0:3:01fa:3557:01:1: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.577135] soundwire sdw:0:3:01fa:3557:01:1: signaling initialization completion for Slave 1
[   14.577135] soundwire sdw:0:3:01fa:3557:01:0: signaling enumeration completion for Slave 2
[   14.577136] soundwire sdw:0:3:01fa:3557:01:0: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.577891] soundwire sdw:0:3:01fa:3557:01:0: signaling initialization completion for Slave 2
[   14.595685] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_P not found, using dummy regulator
[   14.595718] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_IO not found, using dummy regulator
[   14.595735] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_A not found, using dummy regulator
[   14.603448] cs35l56 sdw:0:2:01fa:3557:01:2: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.606657] cs35l56 sdw:0:2:01fa:3557:01:2: probe complete
[   14.606743] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_P not found, using dummy regulator
[   14.607108] cs35l56 sdw:0:2:01fa:3557:01:2: Slave 2 state check1: UNATTACHED, status was 1
[   14.607110] cs35l56 sdw:0:2:01fa:3557:01:2: initializing enumeration and init completion for Slave 2
[   14.607125] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_IO not found, using dummy regulator
[   14.607132] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_A not found, using dummy regulator
[   14.609232] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.609393] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[   14.609394] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.609808] soundwire sdw-master-0-2: No more devices to enumerate
[   14.614510] cs35l56 sdw:0:2:01fa:3557:01:3: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.617805] cs35l56 sdw:0:2:01fa:3557:01:3: probe complete
[   14.617807] cs35l56 sdw:0:2:01fa:3557:01:2: signaling enumeration completion for Slave 2
[   14.617808] cs35l56 sdw:0:2:01fa:3557:01:2: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.617917] cs35l56 sdw:0:3:01fa:3557:01:0: supply VDD_P not found, using dummy regulator
[   14.617937] cs35l56 sdw:0:3:01fa:3557:01:0: supply VDD_IO not found, using dummy regulator
[   14.617942] cs35l56 sdw:0:3:01fa:3557:01:0: supply VDD_A not found, using dummy regulator
[   14.625116] cs35l56 sdw:0:2:01fa:3557:01:2: signaling initialization completion for Slave 2
[   14.625127] cs35l56 sdw:0:2:01fa:3557:01:3: Slave 1 state check1: UNATTACHED, status was 1
[   14.625128] cs35l56 sdw:0:2:01fa:3557:01:3: initializing enumeration and init completion for Slave 1
[   14.625129] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.625286] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[   14.625287] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.625495] soundwire sdw-master-0-2: No more devices to enumerate
[   14.625530] cs35l56 sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 1
[   14.625531] cs35l56 sdw:0:2:01fa:3557:01:3: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.628553] cs35l56 sdw:0:3:01fa:3557:01:0: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.629407] cs35l56 sdw:0:2:01fa:3557:01:3: signaling initialization completion for Slave 1
[   14.632263] cs35l56 sdw:0:3:01fa:3557:01:0: probe complete
[   14.632358] cs35l56 sdw:0:3:01fa:3557:01:0: Slave 2 state check1: UNATTACHED, status was 1
[   14.632358] cs35l56 sdw:0:3:01fa:3557:01:0: initializing enumeration and init completion for Slave 2
[   14.632419] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_P not found, using dummy regulator
[   14.632444] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_IO not found, using dummy regulator
[   14.632450] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_A not found, using dummy regulator
[   14.634815] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.634974] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[   14.634975] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.635203] soundwire sdw-master-0-3: No more devices to enumerate
[   14.639535] cs35l56 sdw:0:3:01fa:3557:01:1: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.642973] cs35l56 sdw:0:3:01fa:3557:01:1: probe complete
[   14.642975] cs35l56 sdw:0:3:01fa:3557:01:0: signaling enumeration completion for Slave 2
[   14.642976] cs35l56 sdw:0:3:01fa:3557:01:0: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.647034] cs35l56 sdw:0:3:01fa:3557:01:0: signaling initialization completion for Slave 2
[   14.647046] cs35l56 sdw:0:3:01fa:3557:01:1: Slave 1 state check1: UNATTACHED, status was 1
[   14.647046] cs35l56 sdw:0:3:01fa:3557:01:1: initializing enumeration and init completion for Slave 1
[   14.647047] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.647202] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[   14.647203] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.647431] soundwire sdw-master-0-3: No more devices to enumerate
[   14.647462] cs35l56 sdw:0:3:01fa:3557:01:1: signaling enumeration completion for Slave 1
[   14.647462] cs35l56 sdw:0:3:01fa:3557:01:1: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.653050] cs35l56 sdw:0:3:01fa:3557:01:1: signaling initialization completion for Slave 1
[   14.742798] sof-audio-pci-intel-ptl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   14.781393] i2c_usbio.usbio-i2c usbio.usbio-i2c.1: Invalid speed 400000 adjusting to bus max 100000
[   14.783787] iwlwifi 0000:00:14.3: Detected RF WH, rfid=0x20113100
[   14.826464] typec port0: bound usb3-port2 (ops connector_ops)
[   14.826471] typec port0: bound usb2-port1 (ops connector_ops)
[   14.826474] typec port0: bound usb4_port1 (ops connector_ops.llvm.2836177131766431881 [thunderbolt])
[   14.828526] sof-audio-pci-intel-ptl 0000:00:1f.3: Booted firmware version: 2.14.1.1
[   14.874108] Bluetooth: hci0: Waiting for firmware download to complete
[   14.874121] Bluetooth: hci0: Firmware loaded in 444613 usecs
[   14.888559] iwlwifi 0000:00:14.3: base HW address: 84:d1:c1:79:ea:2d
[   14.920158] Bluetooth: hci0: Received gp1 mailbox interrupt
[   14.920875] Bluetooth: hci0: Waiting for device to boot
[   14.920878] Bluetooth: hci0: Device booted in 45556 usecs
[   14.920879] Bluetooth: hci0: Waiting for device transition to d0
[   14.920879] Bluetooth: hci0: Device moved to D0 in 0 usecs
[   14.921668] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-00a0-01a1-pci.ddc
[   14.921875] Bluetooth: hci0: Applying Intel DDC parameters completed
[   14.922099] Bluetooth: hci0: Firmware timestamp 2026.3 buildtype 1 build 75512
[   14.922100] Bluetooth: hci0: Firmware SHA1: 0xd68504ef
[   14.922311] Bluetooth: hci0: Fseq status: Success (0x00)
[   14.922313] Bluetooth: hci0: Fseq executed: 00.101.00.03
[   14.922314] Bluetooth: hci0: Fseq BT Top: 00.102.00.01
[   14.960426] Bluetooth: MGMT ver 1.23
[   14.966047] NET: Registered PF_ALG protocol family
[   15.251700] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=3
[   15.258586] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.265191] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.270603] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.277128] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.278216] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.279019] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.469006] typec port1: bound usb3-port1 (ops connector_ops)
[   15.469013] typec port1: bound usb2-port2 (ops connector_ops)
[   15.469018] typec port1: bound usb4_port3 (ops connector_ops.llvm.2836177131766431881 [thunderbolt])
[   17.570440] soundwire sdw-master-0-2: clock stop prepare done slave:15
[   17.570472] soundwire sdw-master-0-3: clock stop prepare done slave:15
[   20.025434] sdca_class sdw:0:0:01fa:4245:01: timed out waiting for device re-attach
[   25.599076] Bluetooth: RFCOMM TTY layer initialized
[   25.599084] Bluetooth: RFCOMM socket layer initialized
[   25.599086] Bluetooth: RFCOMM ver 1.11
[   25.657577] platform sof_sdw: deferred probe pending: sof_sdw: snd_soc_register_card failed -517
[   30.915683] nvme nvme0: using unchecked data buffer
[   30.924649] block nvme0n1: No UUID available providing old NGUID

--nextPartiF6niM64RlG-SNYbphzYTA
Content-Disposition: attachment; filename="alsa-info.txt.siBvzXztre"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="alsa-info.txt.siBvzXztre"

upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.5.3
!!################################

!!Script ran on: Wed May  6 19:16:57 UTC 2026


!!Linux Distribution
!!------------------

NAME="Arch Linux" PRETTY_NAME="Arch Linux" ID=arch HOME_URL="https://archlinux.org/" DOCUMENTATION_URL="https://wiki.archlinux.org/" SUPPORT_URL="https://bbs.archlinux.org/" BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues" PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/" LOGO=archlinux-logo


!!DMI Information
!!---------------

Manufacturer:      Dell Inc.
Product Name:      XPS 14 DA14260
Product Version:   
Firmware Version:  1.5.1
System SKU:        0DB9
Board Vendor:      Dell Inc.
Board Name:        0VRKYR


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/ACPI000C:00/status 	 15
/sys/bus/acpi/devices/ACPI000E:00/status 	 15
/sys/bus/acpi/devices/CUST0000:00/status 	 15
/sys/bus/acpi/devices/DLLK0DB9:00/status 	 15
/sys/bus/acpi/devices/HIMX1092:00/status 	 15
/sys/bus/acpi/devices/INT33A1:00/status 	 15
/sys/bus/acpi/devices/INT340E:00/status 	 15
/sys/bus/acpi/devices/INT3472:00/status 	 15
/sys/bus/acpi/devices/INT3472:01/status 	 15
/sys/bus/acpi/devices/INTC1062:00/status 	 15
/sys/bus/acpi/devices/INTC1062:01/status 	 15
/sys/bus/acpi/devices/INTC1062:02/status 	 15
/sys/bus/acpi/devices/INTC1062:03/status 	 15
/sys/bus/acpi/devices/INTC1062:04/status 	 15
/sys/bus/acpi/devices/INTC1062:05/status 	 15
/sys/bus/acpi/devices/INTC1062:06/status 	 15
/sys/bus/acpi/devices/INTC109D:00/status 	 15
/sys/bus/acpi/devices/INTC10BC:00/status 	 15
/sys/bus/acpi/devices/INTC10BC:01/status 	 15
/sys/bus/acpi/devices/INTC10BC:02/status 	 15
/sys/bus/acpi/devices/INTC10BC:03/status 	 15
/sys/bus/acpi/devices/INTC10BC:04/status 	 15
/sys/bus/acpi/devices/INTC10CC:00/status 	 15
/sys/bus/acpi/devices/INTC10D4:00/status 	 15
/sys/bus/acpi/devices/LNXPOWER:00/status 	 1
/sys/bus/acpi/devices/LNXPOWER:02/status 	 1
/sys/bus/acpi/devices/LNXPOWER:03/status 	 1
/sys/bus/acpi/devices/LNXPOWER:04/status 	 1
/sys/bus/acpi/devices/OVTI08F4:00/status 	 15
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0A05:00/status 	 15
/sys/bus/acpi/devices/PNP0C02:01/status 	 8
/sys/bus/acpi/devices/PNP0C02:02/status 	 8
/sys/bus/acpi/devices/PNP0C02:04/status 	 8
/sys/bus/acpi/devices/PNP0C02:06/status 	 3
/sys/bus/acpi/devices/PNP0C02:07/status 	 3
/sys/bus/acpi/devices/PNP0C09:00/status 	 15
/sys/bus/acpi/devices/PNP0C0A:00/status 	 31
/sys/bus/acpi/devices/PRP00001:00/status 	 15
/sys/bus/acpi/devices/PRP00001:01/status 	 11
/sys/bus/acpi/devices/PRP00001:02/status 	 15
/sys/bus/acpi/devices/PRP00001:03/status 	 15
/sys/bus/acpi/devices/STM0925:00/status 	 15
/sys/bus/acpi/devices/USBC000:00/status 	 15
/sys/bus/acpi/devices/VEN_06CB:00/status 	 15
/sys/bus/acpi/devices/device:09/status 	 15
/sys/bus/acpi/devices/device:0a/status 	 15
/sys/bus/acpi/devices/device:20/status 	 15
/sys/bus/acpi/devices/device:22/status 	 15
/sys/bus/acpi/devices/device:24/status 	 15
/sys/bus/acpi/devices/device:26/status 	 15
/sys/bus/acpi/devices/device:2c/status 	 15
/sys/bus/acpi/devices/device:3e/status 	 15
/sys/bus/acpi/devices/device:3f/status 	 15
/sys/bus/acpi/devices/device:40/status 	 15
/sys/bus/acpi/devices/device:42/status 	 15
/sys/bus/acpi/devices/device:43/status 	 15
/sys/bus/acpi/devices/device:44/status 	 15
/sys/bus/acpi/devices/device:5f/status 	 15
/sys/bus/acpi/devices/device:66/status 	 15
/sys/bus/acpi/devices/device:67/status 	 15
/sys/bus/acpi/devices/device:68/status 	 15
/sys/bus/acpi/devices/device:6a/status 	 15
/sys/bus/acpi/devices/device:6c/status 	 15


!!ACPI SoundWire Device Status Information
!!---------------

Cirrus Logic 0x00033001fa355701
Cirrus Logic 0x00033101fa355701
Cirrus Logic 0x00023201fa355701
Cirrus Logic 0x00023301fa355701
Cirrus Logic 0x00003001fa424501


!!Kernel Information
!!------------------

Kernel release:    #1 SMP PREEMPT Fri, 01 May 2026 19:46:26 +0000
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k7.0.3-1-cachyos
Library version:    1.2.15.3
Utilities version:  1.2.15.2


!!Loaded ALSA modules
!!-------------------



!!Sound Servers on this system
!!----------------------------

PipeWire:
      Installed - Yes (/usr/bin/pipewire)
      Running - Yes

Jack:
      Installed - Yes (/usr/bin/jackd)
      Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

--- no soundcards ---


!!PCI Soundcards installed in the system
!!--------------------------------------

00:1f.3 Audio device [0403]: Intel Corporation Device [8086:e428] (rev 01) (prog-if 80 [HDA compatible with vendor specific extensions])
	Subsystem: Dell Device [1028:0db9]


!!Modprobe options (Sound related)
!!--------------------------------

snd_soc_sdca: dyndbg=+p


!!Loaded sound module options
!!---------------------------


!!Sysfs card info
!!---------------

!!Card: /sys/class/sound/card*
Driver: 
Tree:
	/sys/class/sound/card*  [error opening dir]


!!Sysfs ctl-led info
!!---------------

!!CTL-LED: /sys/class/sound/ctl-led/[ms][ip]*/card*

!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116,  1 May  6 15:26 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 May  6 15:26 /dev/snd/timer


!!Aplay/Arecord output
!!--------------------

APLAY

aplay: device_list:279: no soundcards found...

ARECORD

arecord: device_list:279: no soundcards found...

!!Amixer output
!!-------------


!!Alsactl output
!!--------------

--startcollapse--
--endcollapse--


!!All Loaded Modules
!!------------------

ac97_bus
acpi_pad
acpi_tad
acpi_thermal_rel
aesni_intel
af_alg
algif_aead
algif_hash
algif_skcipher
asn1_encoder
bluetooth
bnep
btintel
btintel_pcie
ccm
cec
cfg80211
clk_tps68470
cmac
coretemp
crc8
crypto_user
cs_dsp
dcdbas
dell_laptop
dell_pc
dell_smbios
dell_smm_hwmon
dell_wmi
dell_wmi_ddv
dell_wmi_descriptor
dell_wmi_sysman
des3_ede_x86_64
des_generic
dm_crypt
dm_mod
drm_buddy
drm_display_helper
drm_exec
drm_gpusvm_helper
drm_gpuvm
drm_suballoc_helper
drm_ttm_helper
encrypted_keys
fat
firmware_attributes_class
ghash_clmulni_intel
gpio_usbio
gpu_sched
hid_multitouch
hid_sensor_als
hid_sensor_custom
hid_sensor_custom_intel_hinge
hid_sensor_hub
hid_sensor_iio_common
hid_sensor_prox
hid_sensor_trigger
hkdf
i2c_algo_bit
i2c_dev
i2c_hid
i2c_hid_acpi
i2c_i801
i2c_mux
i2c_smbus
i2c_usbio
iTCO_wdt
idma64
igen6_edac
industrialio
int3400_thermal
int3403_thermal
int340x_thermal_zone
intel_cstate
intel_hid
intel_ipu7
intel_ipu7_isys
intel_ish_ipc
intel_ishtp
intel_ishtp_hid
intel_lpss
intel_lpss_pci
intel_pmc_bxt
intel_pmc_core
intel_pmc_ssram_telemetry
intel_powerclamp
intel_rapl_common
intel_rapl_msr
intel_skl_int3472_common
intel_skl_int3472_discrete
intel_skl_int3472_tps68470
intel_uncore
intel_uncore_frequency
intel_uncore_frequency_common
intel_vpu
intel_vsec
ip6_udp_tunnel
ipu_bridge
irqbypass
iwlmld
iwlwifi
joydev
kfifo_buf
kvm
kvm_intel
libarc4
libcurve25519
libdes
mac80211
mac_hid
mc
md4
mei
mei_gsc_proxy
mei_me
mousedev
mtd
nfnetlink
nvme
nvme_auth
nvme_core
nvme_keyring
ov08x40
pcspkr
pinctrl_intel_platform
pkcs8_key_parser
platform_profile
platform_temperature_control
pmt_class
pmt_discovery
pmt_telemetry
pps_core
processor_thermal_device
processor_thermal_device_pci
processor_thermal_mbox
processor_thermal_power_floor
processor_thermal_rapl
processor_thermal_rfim
processor_thermal_soc_slider
processor_thermal_wt_hint
processor_thermal_wt_req
psmouse
ptp
regmap_sdw
rfcomm
rfkill
roles
serio_raw
snd
snd_compress
snd_ctl_led
snd_hda_codec
snd_hda_codec_hdmi
snd_hda_codec_intelhdmi
snd_hda_core
snd_hda_ext_core
snd_hda_intel
snd_hrtimer
snd_hwdep
snd_intel_dspcfg
snd_intel_sdw_acpi
snd_pcm
snd_pcm_dmaengine
snd_seq
snd_seq_device
snd_seq_dummy
snd_soc_acpi
snd_soc_acpi_intel_match
snd_soc_acpi_intel_sdca_quirks
snd_soc_core
snd_soc_cs35l56
snd_soc_cs35l56_sdw
snd_soc_cs35l56_shared
snd_soc_cs_amp_lib
snd_soc_dmic
snd_soc_hdac_hda
snd_soc_intel_hda_dsp_common
snd_soc_sdca
snd_soc_sdca_class
snd_soc_sdw_utils
snd_soc_sof_sdw
snd_soc_wm_adsp
snd_sof
snd_sof_intel_hda
snd_sof_intel_hda_common
snd_sof_intel_hda_generic
snd_sof_intel_hda_mlink
snd_sof_intel_hda_sdw_bpt
snd_sof_pci
snd_sof_pci_intel_lnl
snd_sof_pci_intel_mtl
snd_sof_pci_intel_ptl
snd_sof_probes
snd_sof_utils
snd_sof_xtensa_dsp
snd_timer
soundcore
soundwire_bus
soundwire_cadence
soundwire_generic_allocation
soundwire_intel
sparse_keymap
spi_intel
spi_intel_pci
spi_nor
tee
thunderbolt
tps68470_regulator
trusted
ttm
typec
typec_ucsi
ucsi_acpi
udp_tunnel
usbio
v4l2_async
v4l2_fwnode
vfat
video
videobuf2_common
videobuf2_dma_sg
videobuf2_memops
videobuf2_v4l2
videodev
wireguard
wmi
wmi_bmof
x86_pkg_temp_thermal
xe


!!ALSA/HDA dmesg
!!--------------

[    0.000000] Linux version 7.0.3-1-cachyos (linux-cachyos@cachyos) (clang version 22.1.3, LLD 22.1.3) #1 SMP PREEMPT Fri, 01 May 2026 19:46:26 +0000
[    0.000000] Command line: initrd=\initramfs-linux-cachyos.img root=/dev/mapper/root rw net.ifnames=0 xe.enable_panel_replay=0 snd_soc_sdca.dyndbg=+p soundwire_bus.dyndbg=+p soundwire_intel.dyndbg=+p drm.debug=0
[    0.000000] x86/CPU: Model not found in latest microcode list
--
[    0.039028] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.039037] Kernel command line: initrd=\initramfs-linux-cachyos.img root=/dev/mapper/root rw net.ifnames=0 xe.enable_panel_replay=0 snd_soc_sdca.dyndbg=+p soundwire_bus.dyndbg=+p soundwire_intel.dyndbg=+p drm.debug=0
[    0.039085] printk: log buffer data + meta data: 131072 + 557056 = 688128 bytes
--
[   14.491121] ACPI: battery: new hook: Dell Primary Battery Extension
[   14.532823] sof-audio-pci-intel-ptl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
[   14.532840] sof-audio-pci-intel-ptl 0000:00:1f.3: enabling device (0000 -> 0002)
[   14.533647] sof-audio-pci-intel-ptl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
[   14.533718] sof-audio-pci-intel-ptl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [xe])
[   14.540382] sof-audio-pci-intel-ptl 0000:00:1f.3: use msi interrupt mode
[   14.550445] acpi PRP00001:00: Creating 5 SDW Link devices
[   14.550509] soundwire sdw-master-0-0: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.550526] soundwire sdw-master-0-0: SDW Slave Addr: 3001fa424501
[   14.550527] soundwire sdw-master-0-0: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x4245, unique_id 0x0, version 0x3
[   14.550536] acpi device:29: SDCA function SmartMic (type 3) at 0x2
--
[   14.550542] acpi device:2b: SDCA function HID (type 10) at 0x4
[   14.550645] soundwire sdw-master-0-2: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.550648] soundwire sdw-master-0-2: SDW Slave Addr: 23201fa355701
[   14.550649] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.550652] soundwire sdw-master-0-2: SDW Slave Addr: 23301fa355701
[   14.550652] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.550653] soundwire sdw-master-0-2: Valid unique IDs 0x2 0x3 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550659] acpi device:25: SDCA function SmartAmp (type 1) at 0x1
[   14.550693] soundwire sdw-master-0-2: SDW Slave Addr: 23301fa355701
[   14.550694] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.550696] soundwire sdw-master-0-2: SDW Slave Addr: 23201fa355701
[   14.550697] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.550697] soundwire sdw-master-0-2: Valid unique IDs 0x3 0x2 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550701] acpi device:27: SDCA function SmartAmp (type 1) at 0x1
[   14.550752] soundwire sdw-master-0-3: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.550755] soundwire sdw-master-0-3: SDW Slave Addr: 33001fa355701
[   14.550755] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.550756] soundwire sdw-master-0-3: SDW Slave Addr: 33101fa355701
[   14.550757] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.550757] soundwire sdw-master-0-3: Valid unique IDs 0x0 0x1 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550762] acpi device:21: SDCA function SmartAmp (type 1) at 0x1
[   14.550794] soundwire sdw-master-0-3: SDW Slave Addr: 33101fa355701
[   14.550795] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.550796] soundwire sdw-master-0-3: SDW Slave Addr: 33001fa355701
[   14.550796] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.550797] soundwire sdw-master-0-3: Valid unique IDs 0x1 0x0 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.550801] acpi device:23: SDCA function SmartAmp (type 1) at 0x1
--
[   14.552707] Bluetooth: BNEP socket layer initialized
[   14.561686] soundwire_intel soundwire_intel.link.0: clock source 0 LVSCTL 0x0
[   14.561689] soundwire_intel soundwire_intel.link.0: first link up, programming SYNCPRD
[   14.561731] soundwire_intel soundwire_intel.link.0: PCM cap bd:15 in:0 out:0
[   14.563340] soundwire_intel soundwire_intel.link.2: clock source 0 LVSCTL 0x0
[   14.563395] soundwire_intel soundwire_intel.link.2: PCM cap bd:15 in:0 out:0
[   14.564732] sdca_class sdw:0:0:01fa:4245:01: SWFT not available
[   14.564832] sdca_class sdw:0:0:01fa:4245:01: probe complete
[   14.565285] soundwire_intel soundwire_intel.link.3: clock source 0 LVSCTL 0x0
[   14.565311] soundwire_intel soundwire_intel.link.3: PCM cap bd:15 in:0 out:0
[   14.566102] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.566293] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[   14.566294] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.566587] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[   14.566588] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.566875] soundwire sdw-master-0-2: No more devices to enumerate
[   14.566929] soundwire sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 1
[   14.566930] soundwire sdw:0:2:01fa:3557:01:3: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.567375] sof-audio-pci-intel-ptl 0000:00:1f.3: No SoundWire machine driver found for the ACPI-reported configuration:
[   14.567376] sof-audio-pci-intel-ptl 0000:00:1f.3: link 0 mfg_id 0x01fa part_id 0x4245 version 0x3
[   14.567377] sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567378] sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567378] sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567379] sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.567385] sof-audio-pci-intel-ptl 0000:00:1f.3: Use SoundWire default machine driver with function topologies
[   14.567385] sof-audio-pci-intel-ptl 0000:00:1f.3: hda codecs found, mask 4
[   14.567386] sof-audio-pci-intel-ptl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[   14.567387] sof-audio-pci-intel-ptl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[   14.567388] sof-audio-pci-intel-ptl 0000:00:1f.3: DMICs detected in NHLT tables: 0
[   14.567536] soundwire sdw:0:2:01fa:3557:01:3: signaling initialization completion for Slave 1
[   14.567537] soundwire sdw:0:2:01fa:3557:01:2: signaling enumeration completion for Slave 2
[   14.567537] soundwire sdw:0:2:01fa:3557:01:2: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.568119] soundwire sdw:0:2:01fa:3557:01:2: signaling initialization completion for Slave 2
[   14.568438] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.568625] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[   14.568625] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.568629] sof-audio-pci-intel-ptl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[   14.568630] sof-audio-pci-intel-ptl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/ptl/sof-ptl.ri
[   14.568631] sof-audio-pci-intel-ptl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/ptl
[   14.568631] sof-audio-pci-intel-ptl 0000:00:1f.3:  Topology file:     function topologies
[   14.568816] sof-audio-pci-intel-ptl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   14.568866] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[   14.568867] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.569146] soundwire sdw-master-0-3: No more devices to enumerate
[   14.569211] soundwire sdw:0:3:01fa:3557:01:1: signaling enumeration completion for Slave 1
[   14.569211] soundwire sdw:0:3:01fa:3557:01:1: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.577135] soundwire sdw:0:3:01fa:3557:01:1: signaling initialization completion for Slave 1
[   14.577135] soundwire sdw:0:3:01fa:3557:01:0: signaling enumeration completion for Slave 2
[   14.577136] soundwire sdw:0:3:01fa:3557:01:0: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.577891] soundwire sdw:0:3:01fa:3557:01:0: signaling initialization completion for Slave 2
[   14.595685] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_P not found, using dummy regulator
--
[   14.607132] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_A not found, using dummy regulator
[   14.609232] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.609393] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[   14.609394] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.609808] soundwire sdw-master-0-2: No more devices to enumerate
[   14.614510] cs35l56 sdw:0:2:01fa:3557:01:3: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
--
[   14.625128] cs35l56 sdw:0:2:01fa:3557:01:3: initializing enumeration and init completion for Slave 1
[   14.625129] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.625286] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[   14.625287] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.625495] soundwire sdw-master-0-2: No more devices to enumerate
[   14.625530] cs35l56 sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 1
--
[   14.632450] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_A not found, using dummy regulator
[   14.634815] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.634974] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[   14.634975] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.635203] soundwire sdw-master-0-3: No more devices to enumerate
[   14.639535] cs35l56 sdw:0:3:01fa:3557:01:1: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
--
[   14.647046] cs35l56 sdw:0:3:01fa:3557:01:1: initializing enumeration and init completion for Slave 1
[   14.647047] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.647202] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[   14.647203] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.647431] soundwire sdw-master-0-3: No more devices to enumerate
[   14.647462] cs35l56 sdw:0:3:01fa:3557:01:1: signaling enumeration completion for Slave 1
--
[   14.653050] cs35l56 sdw:0:3:01fa:3557:01:1: signaling initialization completion for Slave 1
[   14.742798] sof-audio-pci-intel-ptl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   14.781393] i2c_usbio.usbio-i2c usbio.usbio-i2c.1: Invalid speed 400000 adjusting to bus max 100000
--
[   14.826474] typec port0: bound usb4_port1 (ops connector_ops.llvm.2836177131766431881 [thunderbolt])
[   14.828526] sof-audio-pci-intel-ptl 0000:00:1f.3: Booted firmware version: 2.14.1.1
[   14.874108] Bluetooth: hci0: Waiting for firmware download to complete
--
[   16.869430] wlan0: Limiting TX power to 23 (26 - 3) dBm as advertised by dc:39:6f:04:76:f1
[   17.570440] soundwire sdw-master-0-2: clock stop prepare done slave:15
[   17.570472] soundwire sdw-master-0-3: clock stop prepare done slave:15
[   20.025434] sdca_class sdw:0:0:01fa:4245:01: timed out waiting for device re-attach
--
[   25.599086] Bluetooth: RFCOMM ver 1.11
[   25.657577] platform sof_sdw: deferred probe pending: sof_sdw: snd_soc_register_card failed -517
[   30.915683] nvme nvme0: using unchecked data buffer
--
[  230.332012] printk: Suspending console(s) (use no_console_suspend to debug)
[  230.380081] soundwire_intel soundwire_intel.link.3: pm_runtime status: suspended
[  230.380104] soundwire_intel soundwire_intel.link.2: pm_runtime status: suspended
[  230.380116] soundwire_intel soundwire_intel.link.0: pm_runtime status: suspended
[  230.469569] ACPI: EC: interrupt blocked
--
[20064.775020] nvme nvme0: 16/0/0 default/read/poll queues
[20064.851139] soundwire_intel soundwire_intel.link.0: clock source 0 LVSCTL 0x0
[20064.851145] soundwire_intel soundwire_intel.link.0: first link up, programming SYNCPRD
[20064.853231] soundwire_intel soundwire_intel.link.2: clock source 0 LVSCTL 0x0
[20064.853258] cs35l56 sdw:0:2:01fa:3557:01:3: initializing enumeration and init completion for Slave 1
[20064.853263] cs35l56 sdw:0:2:01fa:3557:01:2: initializing enumeration and init completion for Slave 2
[20064.855506] soundwire_intel soundwire_intel.link.3: clock source 0 LVSCTL 0x0
[20064.855533] cs35l56 sdw:0:3:01fa:3557:01:1: initializing enumeration and init completion for Slave 1
[20064.855536] cs35l56 sdw:0:3:01fa:3557:01:0: initializing enumeration and init completion for Slave 2
[20064.856600] soundwire sdw-master-0-2: Slave attached, programming device number
[20064.857125] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[20064.857130] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[20064.857894] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[20064.857913] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[20064.858748] soundwire sdw-master-0-2: No more devices to enumerate
[20064.858777] soundwire sdw-master-0-3: Slave attached, programming device number
[20064.859041] cs35l56 sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 1
[20064.859048] cs35l56 sdw:0:2:01fa:3557:01:3: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[20064.859069] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[20064.859071] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[20064.859525] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[20064.859531] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[20064.860052] soundwire sdw-master-0-3: No more devices to enumerate
[20064.860098] cs35l56 sdw:0:2:01fa:3557:01:3: signaling initialization completion for Slave 1
--
[20066.220721] wlan0: Limiting TX power to 23 (26 - 3) dBm as advertised by dc:39:6f:04:76:f1
[20068.526623] soundwire sdw-master-0-2: clock stop prepare done slave:15
[20068.526634] soundwire sdw-master-0-3: clock stop prepare done slave:15



--nextPartiF6niM64RlG-SNYbphzYTA
Content-Disposition: attachment; filename="lspci_nnvv.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="lspci_nnvv.txt"

00:00.0 Host bridge [0600]: Intel Corporation Device [8086:b001] (rev 04)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 5
	Capabilities: <access denied>
	Kernel driver in use: igen6_edac
	Kernel modules: igen6_edac

00:02.0 VGA compatible controller [0300]: Intel Corporation Panther Lake [Arc B390] [8086:b080] (rev 04) (prog-if 00 [VGA controller])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: unknown pin routed to IRQ 162, MSI(X) routed to IRQ 162
	IOMMU group: 4
	Region 0: Memory at c814000000 (64-bit, prefetchable) [size=16M]
	Region 2: Memory at 8000000000 (64-bit, prefetchable) [size=256M]
	Expansion ROM at 000c0000 [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: xe
	Kernel modules: xe

00:04.0 Signal processing controller [1180]: Intel Corporation Panther Lake Innovation Platform Framework Processor Participant [8086:b01d] (rev 04)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: MSI(X) routed to IRQ 216-219
	IOMMU group: 0
	Region 0: Memory at c815300000 (64-bit, non-prefetchable) [size=128K]
	Capabilities: <access denied>
	Kernel driver in use: proc_thermal_pci
	Kernel modules: processor_thermal_device_pci

00:05.0 Multimedia controller [0480]: Intel Corporation Panther Lake IPU [8086:b05d] (rev 04)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: MSI(X) routed to IRQ 163
	IOMMU group: 1
	Region 0: Memory at c812000000 (64-bit, non-prefetchable) [size=32M]
	Region 4: Memory at c81537a000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-ipu7
	Kernel modules: intel_ipu7

00:06.0 PCI bridge [0604]: Intel Corporation Device [8086:e461] (rev 01) (prog-if 00 [Normal decode])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 125
	IOMMU group: 6
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: 9c200000-9c2fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport
	Kernel modules: shpchp

00:07.0 PCI bridge [0604]: Intel Corporation Device [8086:e44e] (rev 01) (prog-if 00 [Normal decode])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 126
	IOMMU group: 7
	Bus: primary=00, secondary=02, subordinate=39, sec-latency=0
	I/O behind bridge: 3000-3fff [size=4K] [16-bit]
	Memory behind bridge: 94000000-9bffffff [size=128M] [32-bit]
	Prefetchable memory behind bridge: 8010000000-980fffffff [size=96G] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport
	Kernel modules: shpchp

00:07.1 PCI bridge [0604]: Intel Corporation Device [8086:e44f] (rev 01) (prog-if 00 [Normal decode])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin C disabled, MSI(X) routed to IRQ 127
	IOMMU group: 8
	Bus: primary=00, secondary=3a, subordinate=71, sec-latency=0
	I/O behind bridge: 4000-4fff [size=4K] [16-bit]
	Memory behind bridge: 8c000000-93ffffff [size=128M] [32-bit]
	Prefetchable memory behind bridge: 9810000000-b00fffffff [size=96G] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport
	Kernel modules: shpchp

00:07.2 PCI bridge [0604]: Intel Corporation Device [8086:e460] (rev 01) (prog-if 00 [Normal decode])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin D disabled, MSI(X) routed to IRQ 128
	IOMMU group: 9
	Bus: primary=00, secondary=72, subordinate=a9, sec-latency=0
	I/O behind bridge: 5000-5fff [size=4K] [16-bit]
	Memory behind bridge: 84000000-8bffffff [size=128M] [32-bit]
	Prefetchable memory behind bridge: b010000000-c80fffffff [size=96G] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: <access denied>
	Kernel driver in use: pcieport
	Kernel modules: shpchp

00:0a.0 Signal processing controller [1180]: Intel Corporation Panther Lake Platform Monitoring Technology (PMT) [8086:b07d] (rev 04)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 2
	Region 0: Memory at c815350000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: intel_vsec
	Kernel modules: intel_vsec

00:0b.0 Processing accelerators [1200]: Intel Corporation Panther Lake NPU [8086:b03e] (rev 04)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: MSI(X) routed to IRQ 164
	IOMMU group: 3
	Region 0: Memory at c810000000 (64-bit, non-prefetchable) [size=32M]
	Region 4: Memory at c815379000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel_vpu
	Kernel modules: intel_vpu

00:0d.0 USB controller [0c03]: Intel Corporation Panther Lake USB 3.2 xHCI Controller [8086:e431] (rev 01) (prog-if 30 [XHCI])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupts: MSI(X) routed to IRQ 129-136
	IOMMU group: 10
	Region 0: Memory at c815340000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:0d.2 USB controller [0c03]: Intel Corporation Device [8086:e433] (rev 01) (prog-if 40 [USB4 Host Interface])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 165-166, 169-182
	IOMMU group: 10
	Region 0: Memory at c8152c0000 (64-bit, non-prefetchable) [size=256K]
	Region 2: Memory at c815378000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt

00:0d.3 USB controller [0c03]: Intel Corporation Panther Lake Thunderbolt 4 NHI #2 [8086:e434] (rev 01) (prog-if 40 [USB4 Host Interface])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 183-198
	IOMMU group: 10
	Region 0: Memory at c815280000 (64-bit, non-prefetchable) [size=256K]
	Region 2: Memory at c815377000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt

00:12.0 Serial controller [0700]: Intel Corporation Device [8086:e445] (rev 01) (prog-if 00 [8250])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 168
	IOMMU group: 11
	Region 0: Memory at c815330000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: intel_ish_ipc
	Kernel modules: intel_ish_ipc

00:13.0 Communication controller [0780]: Intel Corporation Device [8086:e462] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B routed to IRQ 255
	IOMMU group: 12
	Region 0: Memory at c815376000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>

00:14.0 USB controller [0c03]: Intel Corporation Panther Lake USB 3.2 xHCI Controller [8086:e47d] (rev 01) (prog-if 30 [XHCI])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupts: pin B disabled, MSI(X) routed to IRQ 137-144
	IOMMU group: 13
	Region 0: Memory at c815320000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:14.2 RAM memory [0500]: Intel Corporation Device [8086:e47f] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 13
	Region 0: Memory at c815360000 (64-bit, non-prefetchable) [size=32K]
	Region 2: Memory at c815375000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel_pmc_ssram_telemetry
	Kernel modules: intel_pmc_ssram_telemetry

00:14.3 Network controller [0280]: Intel Corporation Panther Lake PCH CNVi WiFi [8086:e440] (rev 01)
	Subsystem: Intel Corporation Device [8086:4110]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin D disabled, MSI(X) routed to IRQ 199-214
	IOMMU group: 14
	Region 0: Memory at c81536c000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: iwlwifi
	Kernel modules: iwlwifi

00:14.7 Bluetooth [0d11]: Intel Corporation Panther Lake Bluetooth PCI Enumerator [8086:e476] (rev 01)
	Subsystem: Intel Corporation Device [8086:0011]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 215
	IOMMU group: 15
	Region 0: Memory at c815368000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: btintel_pcie
	Kernel modules: btintel_pcie

00:16.0 Communication controller [0780]: Intel Corporation Device [8086:e470] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 145
	IOMMU group: 16
	Region 0: Memory at c815374000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:18.0 Communication controller [0780]: Intel Corporation Device [8086:e45d] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupts: pin B routed to IRQ 255
	IOMMU group: 17
	Region 0: Memory at c815373000 (64-bit, non-prefetchable) [disabled] [size=4K]
	Capabilities: <access denied>

00:19.0 Serial bus controller [0c80]: Intel Corporation Device [8086:e450] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupts: pin B routed to IRQ 20
	IOMMU group: 18
	Region 0: Memory at c815371000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:19.1 Serial bus controller [0c80]: Intel Corporation Device [8086:e451] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupts: pin C routed to IRQ 21
	IOMMU group: 18
	Region 0: Memory at c815372000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: <access denied>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:1f.0 ISA bridge [0601]: Intel Corporation Device [8086:e402] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 19

00:1f.3 Audio device [0403]: Intel Corporation Device [8086:e428] (rev 01) (prog-if 80 [HDA compatible with vendor specific extensions])
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Interrupts: pin B disabled, MSI(X) routed to IRQ 220
	IOMMU group: 19
	Region 0: Memory at c815200000 (64-bit, non-prefetchable) [size=512K]
	Region 4: Memory at c815000000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: <access denied>
	Kernel driver in use: sof-audio-pci-intel-ptl
	Kernel modules: snd_sof_pci_intel_ptl, snd_hda_intel

00:1f.4 SMBus [0c05]: Intel Corporation Device [8086:e422] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupts: pin D routed to IRQ 18
	IOMMU group: 19
	Region 0: Memory at c815370000 (64-bit, non-prefetchable) [size=256]
	Region 4: I/O ports at efa0 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

00:1f.5 Serial bus controller [0c80]: Intel Corporation Device [8086:e423] (rev 01)
	Subsystem: Dell Device [1028:0db9]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 19
	Region 0: Memory at 80800000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: intel-spi
	Kernel modules: spi_intel_pci

01:00.0 Non-Volatile memory controller [0108]: KIOXIA Corporation NVMe SSD Controller BG7 (DRAM-less) [1e0f:002f] (rev 01) (prog-if 02 [NVM Express])
	Subsystem: KIOXIA Corporation Device [1e0f:017d]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupts: pin B disabled, MSI(X) routed to IRQ 146-161, 167
	IOMMU group: 20
	Region 0: Memory at 9c200000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: <access denied>
	Kernel driver in use: nvme
	Kernel modules: nvme


--nextPartiF6niM64RlG-SNYbphzYTA--



