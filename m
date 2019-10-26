From: Christoph Anton Mitterer <calestyo@scientia.net>
Date: Sat, 26 Oct 2019 19:07:13 +0000
Subject: upgrading from 5.2.17 -> 5.3.7 breaks sound completely
Message-Id: <651a309f57221a1d7fbd50d48d90da03800b7ee5.camel@scientia.net>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi.

From https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=943422:

When I upgrade the kernel from 5.2.17 to 5.3.7, sound is completely
broken.

Logging in to the desktop environment is already considerably hanging,
and the following is seen in the kernel log:
Oct 24 18:33:10 heisenberg kernel: snd_hda_intel 0000:00:1f.3: azx_get_resp=
onse timeout, switching to polling mode: last cmd=3D0x20270503
Oct 24 18:33:11 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, disabling MSI: last cmd=3D0x20270503
Oct 24 18:33:12 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:13 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:14 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:16 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:17 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:18 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:20 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:21 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:22 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:24 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:25 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:26 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:28 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:29 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:30 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:32 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:33 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:34 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:36 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:37 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:38 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:40 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:41 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:42 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:44 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:45 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:46 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:48 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270503
Oct 24 18:33:49 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370503
Oct 24 18:33:50 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:51 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:33:52 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:33:53 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:33:54 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:55 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:33:56 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:33:57 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:33:58 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:33:59 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:00 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:01 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:02 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:03 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:04 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:05 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:06 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:07 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:08 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:09 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:10 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:11 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:12 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:13 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:14 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:15 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:16 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:17 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:18 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:19 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:20 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:21 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:22 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:24 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:25 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:26 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:27 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:28 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20170500
Oct 24 18:34:29 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270500
Oct 24 18:34:30 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370500
Oct 24 18:34:31 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x201f0500
Oct 24 18:34:32 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370740
Oct 24 18:34:33 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20370740
Oct 24 18:34:34 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270d01
Oct 24 18:34:34 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2: Unabl=
e to sync register 0x2f0d00. -11
Oct 24 18:34:35 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270d01
Oct 24 18:34:35 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2: Unabl=
e to sync register 0x2f0d00. -11
Oct 24 18:34:36 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x203f0900
Oct 24 18:34:37 heisenberg kernel: snd_hda_intel 0000:00:1f.3: No response =
from codec, resetting bus: last cmd=3D0x20270d81
Oct 24 18:34:38 heisenberg kernel: ------------[ cut here ]------------
Oct 24 18:34:38 heisenberg kernel: snd_hda_intel 0000:00:1f.3: azx_get_resp=
onse timeout, switching to single_cmd mode: last cmd=3D0x20270d81
Oct 24 18:34:38 heisenberg kernel: WARNING: CPU: 0 PID: 2740 at sound/pci/h=
da/hda_controller.c:878 azx_rirb_get_response+0x1d0/0x240 [snd_hda_codec]
Oct 24 18:34:38 heisenberg kernel: Modules linked in: ctr ccm fuse elan_i2c=
 cpufreq_userspace cpufreq_powersave snd_soc_skl intel_rapl_msr snd_soc_hda=
c_hda intel_rapl_common snd_hda_ext_core cpufreq_conservative snd_soc_skl_i=
pc x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_ipc btusb snd_hda_code=
c_realtek coretemp snd_soc_sst_dsp kvm_intel snd_hda_codec_generic btrtl le=
dtrig_audio snd_soc_acpi_intel_match btbcm iwlmvm snd_soc_acpi btintel kvm =
snd_soc_core snd_compress irqbypass bluetooth snd_hda_intel snd_hda_codec c=
rct10dif_pclmul snd_hda_core mac80211 snd_hwdep i915 libarc4 xt_tcpudp uvcv=
ideo crc32_pclmul snd_pcm iTCO_wdt mei_wdt iwlwifi i2c_designware_platform =
drbg iTCO_vendor_support drm_kms_helper snd_timer videobuf2_vmalloc i2c_des=
ignware_core intel_wmi_thunderbolt sdhci_pci ip6t_REJECT cdc_mbim nf_reject=
_ipv6 cqhci videobuf2_memops ghash_clmulni_intel watchdog snd sdhci videobu=
f2_v4l2 intel_cstate cdc_wdm cfg80211 ansi_cprng idma64 intel_uncore videob=
uf2_common cdc_ncm drm usbnet ecdh_generic videodev
Oct 24 18:34:38 heisenberg kernel:  intel_rapl_perf sg mii nft_counter joyd=
ev soundcore intel_lpss_pci pcspkr ecc mei_me mmc_core i2c_i801 mc intel_lp=
ss mei rfkill crc16 mfd_core battery i2c_algo_bit button wmi tpm_crb tpm_ti=
s tpm_tis_core xt_comment fujitsu_laptop ipt_REJECT tpm nf_reject_ipv4 spar=
se_keymap ac acpi_pad video rng_core xt_multiport xt_policy xt_state xt_con=
ntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nf_tables nfne=
tlink binfmt_misc loop parport_pc ppdev lp sunrpc parport ip_tables x_table=
s autofs4 dm_crypt dm_mod raid10 raid456 async_raid6_recov async_memcpy asy=
nc_pq async_xor async_tx raid1 raid0 multipath linear md_mod btrfs libcrc32=
c crc32c_generic xor zstd_decompress zstd_compress raid6_pq uhci_hcd ehci_p=
ci ehci_hcd usb_storage sd_mod crc32c_intel xhci_pci xhci_hcd aesni_intel a=
hci libahci libata e1000e usbcore scsi_mod aes_x86_64 glue_helper crypto_si=
md ptp pps_core cryptd psmouse evdev serio_raw usb_common
Oct 24 18:34:38 heisenberg kernel: CPU: 0 PID: 2740 Comm: pulseaudio Not ta=
inted 5.3.0-1-amd64 #1 Debian 5.3.7-1
Oct 24 18:34:38 heisenberg kernel: Hardware name: FUJITSU LIFEBOOK U757/FJN=
B2A5, BIOS Version 1.21 03/19/2018
Oct 24 18:34:38 heisenberg kernel: RIP: 0010:azx_rirb_get_response+0x1d0/0x=
240 [snd_hda_codec]
Oct 24 18:34:38 heisenberg kernel: Code: 45 8b b6 e0 03 00 00 4c 8b 6f 50 4=
d 85 ed 74 41 e8 65 ff b9 f9 44 89 f1 4c 89 ea 48 c7 c7 88 0d 3c c1 48 89 c=
6 e8 be 79 6c f9 <0f> 0b 41 80 8c 24 04 06 00 00 04 4c 89 e7 41 80 a4 24 50=
 05 00 00
Oct 24 18:34:38 heisenberg kernel: RSP: 0018:ffffa18e806afbb0 EFLAGS: 00010=
282
Oct 24 18:34:38 heisenberg kernel: RAX: 0000000000000000 RBX: 0000000000000=
c09 RCX: 0000000000000006
Oct 24 18:34:38 heisenberg kernel: RDX: 0000000000000007 RSI: 0000000000000=
096 RDI: ffff928c3da17680
Oct 24 18:34:38 heisenberg kernel: RBP: ffff928c342c947c R08: 0000000000000=
3c5 R09: 0000000000000076
Oct 24 18:34:38 heisenberg kernel: R10: ffffa18e806afa58 R11: 0000000000000=
000 R12: ffff928c342c9000
Oct 24 18:34:38 heisenberg kernel: R13: ffff928c39aa9640 R14: 0000000020270=
d81 R15: 0000000000000000
Oct 24 18:34:38 heisenberg kernel: FS:  00007f97e60c5c80(0000) GS:ffff928c3=
da00000(0000) knlGS:0000000000000000
Oct 24 18:34:38 heisenberg kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
Oct 24 18:34:38 heisenberg kernel: CR2: 000056421e7371d4 CR3: 000000080b2c4=
004 CR4: 00000000003606f0
Oct 24 18:34:38 heisenberg kernel: DR0: 0000000000000000 DR1: 0000000000000=
000 DR2: 0000000000000000
Oct 24 18:34:38 heisenberg kernel: DR3: 0000000000000000 DR6: 00000000fffe0=
ff0 DR7: 0000000000000400
Oct 24 18:34:38 heisenberg kernel: Call Trace:
Oct 24 18:34:38 heisenberg kernel:  snd_hdac_bus_exec_verb_unlocked+0x9c/0x=
180 [snd_hda_core]
Oct 24 18:34:38 heisenberg kernel:  codec_exec_verb+0x72/0x110 [snd_hda_cod=
ec]
Oct 24 18:34:38 heisenberg kernel:  hda_reg_write+0xf3/0x300 [snd_hda_core]
Oct 24 18:34:38 heisenberg kernel:  regmap_write+0x38/0x60
Oct 24 18:34:38 heisenberg kernel:  snd_hdac_regmap_write_raw+0x84/0xa0 [sn=
d_hda_core]
Oct 24 18:34:38 heisenberg kernel:  snd_hdac_regmap_update_raw+0x56/0x80 [s=
nd_hda_core]
Oct 24 18:34:38 heisenberg kernel:  set_dig_out+0x21/0x60 [snd_hda_codec]
Oct 24 18:34:38 heisenberg kernel:  snd_hda_spdif_default_put+0xc8/0x100 [s=
nd_hda_codec]
Oct 24 18:34:38 heisenberg kernel:  snd_ctl_elem_write+0xe2/0x190 [snd]
Oct 24 18:34:38 heisenberg kernel:  ? __kmalloc_track_caller+0x16e/0x260
Oct 24 18:34:38 heisenberg kernel:  ? snd_ctl_ioctl+0x100/0x740 [snd]
Oct 24 18:34:38 heisenberg kernel:  ? __check_object_size+0x136/0x147
Oct 24 18:34:38 heisenberg kernel:  ? _copy_from_user+0x37/0x60
Oct 24 18:34:38 heisenberg kernel:  snd_ctl_ioctl+0x142/0x740 [snd]
Oct 24 18:34:38 heisenberg kernel:  do_vfs_ioctl+0x40e/0x670
Oct 24 18:34:38 heisenberg kernel:  ? set_close_on_exec+0x2f/0x70
Oct 24 18:34:38 heisenberg kernel:  ksys_ioctl+0x5e/0x90
Oct 24 18:34:38 heisenberg kernel:  __x64_sys_ioctl+0x16/0x20
Oct 24 18:34:38 heisenberg kernel:  do_syscall_64+0x53/0x140
Oct 24 18:34:38 heisenberg kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Oct 24 18:34:38 heisenberg kernel: RIP: 0033:0x7f97e6e185d7
Oct 24 18:34:38 heisenberg kernel: Code: 00 00 90 48 8b 05 b9 78 0c 00 64 c=
7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 1=
0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 89 78 0c 00 f7 d8 64=
 89 01 48
Oct 24 18:34:38 heisenberg kernel: RSP: 002b:00007ffe752db098 EFLAGS: 00000=
246 ORIG_RAX: 0000000000000010
Oct 24 18:34:38 heisenberg kernel: RAX: ffffffffffffffda RBX: 000055923ed3d=
b70 RCX: 00007f97e6e185d7
Oct 24 18:34:38 heisenberg kernel: RDX: 000055923ed3dd00 RSI: 00000000c4c85=
513 RDI: 0000000000000017
Oct 24 18:34:38 heisenberg kernel: RBP: 0000000000000000 R08: 000055923ed3d=
610 R09: 0000000000000000
Oct 24 18:34:38 heisenberg kernel: R10: 0000000000000004 R11: 0000000000000=
246 R12: 00000000000000b0
Oct 24 18:34:38 heisenberg kernel: R13: 000055923ed3be50 R14: 00007f97e0d9f=
940 R15: 00000000000000b0
Oct 24 18:34:38 heisenberg kernel: ---[ end trace 37f881cde4f6a974 ]---
Oct 24 18:34:38 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0: Unabl=
e to sync register 0x1f0e00. -5
Oct 24 18:34:38 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0: Unabl=
e to sync register 0x1f0e00. -5



This happens a bit earlier:
Oct 24 18:33:05 heisenberg kernel: snd_hda_intel 0000:00:1f.3: bound 0000:0=
0:02.0 (ops i915_audio_component_bind_ops [i915])
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0: autoc=
onfig for ALC255: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0:    sp=
eaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0:    hp=
_outs=3D1 (0x21/0x0/0x0/0x0/0x0)
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0:    mo=
no: mono_out=3D0x0
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0:    in=
puts:
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0:      =
Mic=3D0x19
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_realtek hdaudioC0D0:      =
Internal Mic=3D0x12
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2: autoc=
onfig for Generic: line_outs=3D0 (0x0/0x0/0x0/0x0/0x0) type:line
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2:    sp=
eaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2:    hp=
_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2:    mo=
no: mono_out=3D0x0
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2:    di=
g-out=3D0x3/0x0
Oct 24 18:33:05 heisenberg kernel: snd_hda_codec_generic hdaudioC0D2:    in=
puts:


Downgrading fixes the issue.


Any ideas?


Thanks,
Chris.
