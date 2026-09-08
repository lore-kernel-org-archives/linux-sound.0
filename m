Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC6524B1B
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859664; cv=none; b=b1egWHrBrMdCtf4g9rSP5rNr/NERkx8geWXyh1BbSTmQuVCstlS1ah53rSXfIMq8qg+IojocPicgFy01wl6Z+9ORTAYZski658s1PdNOV1vooigge0QaxfoqGyGU7XUnqDjG5i8NTGtk3usQRsBrbzeBafT7Ty9kz2/Svl1PuvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859664; c=relaxed/simple;
	bh=nI2cHtRI7/aOj72QYq28mZAiQzw9zhfPoWeHcoKy/P0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=q/tagb2NW02uyYBXxO+v38fKf/kf7xqPYj4bkUSDzyLaraXI6vw25DzL7YrLLyllojTzgpRRQAxdGzkZ0KRQ/Lkokg5eVEFMmBVSh4m0rWwD8YwOIVAaj3e8Xc6BnzpunaFT3NlwBOxYzqLtcdQnFP85WnC+RzxKsblifzZe8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=m8I6ET0W; arc=none smtp.client-ip=95.215.58.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="m8I6ET0W"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nI2cHtRI7/aOj72QYq28mZAiQzw9zhfPoWeHcoKy/P0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788859659; v=1; x=1789464459;
 b=m8I6ET0WNN6ThsQoA+3VI7+neXkdKBhEJ00qgK9WABZuFa17E2rT21z5lapJUcb3g2qZAU8o
 ywV20zS4Ocm/Ml7BaoVHkBMYuUmddbw70KEPfsWFkZ27EBjruJQLavYKb4MVID0PKXb61Eade+s
 9LH3qC3Hk9oPytuIANB9qHG/p95zUKryLUxvmX2BzV3mv8E5+xEeCtniyMtfUPEhsD6/Sh/HZOb
 SnOhxU4zpAc7D3wynXonDHo/vLs7Xw9grapanQJUjmiq2adi6D/8kf1STkULh1zI4OI+02R4eZY
 SfeZ0DrOYAeN08eBVO79iyhjqfcrPDof1Y9E7BMEWAs9g==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b6bd7019bb7593c9;
	Tue, 08 Sep 2026 09:27:39 +0000
X-Mizu-Trace-ID: b6bd7019bb7593c9
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 11:27:36 +0200
Message-Id: <DL9TTP3MMMWH.129LZ6DVSWA42@cknow-tech.com>
To: <linux-sound@vger.kernel.org>
Subject: Re: BUG in es8389_set_bias_level?
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <DJIUWLPIHZ48.5H5T2EI2YI8D@cknow-tech.com>
In-Reply-To: <DJIUWLPIHZ48.5H5T2EI2YI8D@cknow-tech.com>

On Fri Jun 26, 2026 at 11:00 AM CEST, Diederik de Haas wrote:
> I'm working on adding support for the FriendlyElec NanoPC-T6 Plus [1] whi=
ch

FWIW, that has now been submitted:
https://lore.kernel.org/linux-rockchip/20260907122406.1862398-1-diederik@ck=
now-tech.com/

> uses the es8389 codec. And while analog audio does work, I always get the
> following stack trace in dmesg:
>
> [   10.072410] ------------[ cut here ]------------
> [   10.073686] i2s0_8ch_mclkout_to_io already disabled
> [   10.074943] WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x224/=
0x260, CPU#6: kworker/u32:0/12

That has now been fixed by this patch:
https://lore.kernel.org/all/20260904104141.3885-1-zhangyi@everest-semi.com/

Cheers,
  Diederik

> [   10.076547] Modules linked in: aes_ce_blk ghash_ce gf128mul rockchip_v=
dec joydev snd_soc_simple_card(+) snd_soc_es8389 snd_soc_rockchip_i2s_tdm s=
nd_soc_hdmi_codec(+) v4l2_vp9 snd_soc_simple_card_utils rockchip_iep2 rockc=
hip_rga synopsys_hdmirx pwm_fan leds_gpio rockchip_iep_common v4l2_h264 v4l=
2_dv_timings snd_soc_core v4l2_mem2mem videobuf2_dma_contig videobuf2_dma_s=
g gpio_ir_recv videobuf2_memops snd_compress videobuf2_v4l2 snd_pcm_dmaengi=
ne panthor ofpart snd_pcm videodev snd_timer spi_nor videobuf2_common drm_g=
puvm snd rockchip_rng mtd rockchip_thermal mc soundcore gpu_sched rk805_pwr=
key drm_exec drm_shmem_helper evdev cpufreq_dt pkcs8_key_parser nvme_fabric=
s efi_pstore configfs autofs4 ext4 hid_generic crc16 usbhid mbcache jbd2 hi=
d r8169 realtek onboard_usb_dev phy_package mdio_devres of_mdio fixed_phy f=
wnode_mdio libphy mdio_bus nvme xhci_plat_hcd xhci_hcd nvme_core rk808_regu=
lator nvme_keyring nvme_auth rockchipdrm dw_hdmi_qp dw_mipi_dsi fusb302 tcp=
m dw_hdmi rtc_hym8563 aux_hpd_bridge analogix_dp fan53555
> [   10.076648]  drm_dp_aux_bus drm_display_helper cec phy_rockchip_usbdp =
gpio_rockchip phy_rockchip_snps_pcie3 dw_mmc_rockchip phy_rockchip_naneng_c=
ombphy fixed sdhci_of_dwcmshc rockchip_saradc rc_core display_connector sdh=
ci_pltfm typec ohci_platform dw_mmc_pltfm industrialio_triggered_buffer dwc=
3 sdhci drm_client_lib ehci_platform kfifo_buf dw_mmc udc_core spi_rockchip=
 ehci_hcd ohci_hcd dw_wdt cqhci phy_rockchip_samsung_hdptx drm_dma_helper n=
vmem_rockchip_otp pl330 rockchip_dfi spi_rockchip_sfc drm_kms_helper usbcor=
e drm i2c_rk3x adc_keys pwm_rockchip phy_rockchip_inno_usb2 industrialio ul=
pi usb_common
> [   10.095597] CPU: 6 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted 7.1-=
rc7+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 7.1~rc7-2
> [   10.097473] Hardware name: FriendlyElec NanoPC-T6 Plus (DT)
> [   10.098826] Workqueue: async async_run_entry_fn
> [   10.100094] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   10.101564] pc : clk_core_disable+0x224/0x260
> [   10.102818] lr : clk_core_disable+0x224/0x260
> [   10.104059] sp : ffff80008021bc30
> [   10.105189] x29: ffff80008021bc30 x28: 0000000000000000 x27: 000000000=
0000000
> [   10.106663] x26: ffff000100040c28 x25: 00000000fffffef7 x24: ffff00010=
019be05
> [   10.108135] x23: ffff000107fa2028 x22: ffff000105217880 x21: 000000000=
0000001
> [   10.109596] x20: 0000000000000000 x19: ffff00010035a800 x18: 000000000=
000000a
> [   10.111056] x17: 0000000000000000 x16: ffffb1911af0cef0 x15: 000000000=
0000000
> [   10.112497] x14: ffffffffffffffff x13: ffff000109d7c480 x12: 3ffffffff=
fffefff
> [   10.113922] x11: 0000000000017fe8 x10: ffffb1911d05c148 x9 : ffffb1911=
afa4a8c
> [   10.115333] x8 : ffffb1911d0e4310 x7 : ffffffffffffefff x6 : 000000000=
0000001
> [   10.116735] x5 : ffff0005fdf361c8 x4 : ffff4e74e0fec000 x3 : ffff00010=
092ca00
> [   10.118141] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010=
092ca00
> [   10.119550] Call trace:
> [   10.120539]  clk_core_disable+0x224/0x260 (P)
> [   10.121686]  clk_disable+0x40/0x70
> [   10.122743]  es8389_set_bias_level+0x17c/0x238 [snd_soc_es8389]
> [   10.124013]  snd_soc_component_set_bias_level+0x2c/0x70 [snd_soc_core]
> [   10.125329]  snd_soc_dapm_set_bias_level+0x60/0x2c0 [snd_soc_core]
> [   10.126604]  dapm_pre_sequence_async+0x5c/0x110 [snd_soc_core]
> [   10.127844]  async_run_entry_fn+0x40/0x1a0
> [   10.128915]  process_one_work+0x17c/0x510
> [   10.129964]  worker_thread+0x18c/0x310
> [   10.130994]  kthread+0x134/0x150
> [   10.131958]  ret_from_fork+0x10/0x20
> [   10.132950] ---[ end trace 0000000000000000 ]---
> [   10.134217] ------------[ cut here ]------------
> [   10.135476] i2s0_8ch_mclkout_to_io already unprepared
> [   10.136833] WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0x27=
4/0x2c0, CPU#6: kworker/u32:0/12
> [   10.138576] Modules linked in: aes_ce_blk ghash_ce gf128mul rockchip_v=
dec joydev snd_soc_simple_card(+) snd_soc_es8389 snd_soc_rockchip_i2s_tdm s=
nd_soc_hdmi_codec(+) v4l2_vp9 snd_soc_simple_card_utils rockchip_iep2 rockc=
hip_rga synopsys_hdmirx pwm_fan leds_gpio rockchip_iep_common v4l2_h264 v4l=
2_dv_timings snd_soc_core v4l2_mem2mem videobuf2_dma_contig videobuf2_dma_s=
g gpio_ir_recv videobuf2_memops snd_compress videobuf2_v4l2 snd_pcm_dmaengi=
ne panthor ofpart snd_pcm videodev snd_timer spi_nor videobuf2_common drm_g=
puvm snd rockchip_rng mtd rockchip_thermal mc soundcore gpu_sched rk805_pwr=
key drm_exec drm_shmem_helper evdev cpufreq_dt pkcs8_key_parser nvme_fabric=
s efi_pstore configfs autofs4 ext4 hid_generic crc16 usbhid mbcache jbd2 hi=
d r8169 realtek onboard_usb_dev phy_package mdio_devres of_mdio fixed_phy f=
wnode_mdio libphy mdio_bus nvme xhci_plat_hcd xhci_hcd nvme_core rk808_regu=
lator nvme_keyring nvme_auth rockchipdrm dw_hdmi_qp dw_mipi_dsi fusb302 tcp=
m dw_hdmi rtc_hym8563 aux_hpd_bridge analogix_dp fan53555
> [   10.138686]  drm_dp_aux_bus drm_display_helper cec phy_rockchip_usbdp =
gpio_rockchip phy_rockchip_snps_pcie3 dw_mmc_rockchip phy_rockchip_naneng_c=
ombphy fixed sdhci_of_dwcmshc rockchip_saradc rc_core display_connector sdh=
ci_pltfm typec ohci_platform dw_mmc_pltfm industrialio_triggered_buffer dwc=
3 sdhci drm_client_lib ehci_platform kfifo_buf dw_mmc udc_core spi_rockchip=
 ehci_hcd ohci_hcd dw_wdt cqhci phy_rockchip_samsung_hdptx drm_dma_helper n=
vmem_rockchip_otp pl330 rockchip_dfi spi_rockchip_sfc drm_kms_helper usbcor=
e drm i2c_rk3x adc_keys pwm_rockchip phy_rockchip_inno_usb2 industrialio ul=
pi usb_common
> [   10.158082] CPU: 6 UID: 0 PID: 12 Comm: kworker/u32:0 Tainted: G      =
  W           7.1-rc7+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 7.1~rc7=
-2
> [   10.160114] Tainted: [W]=3DWARN
> [   10.161231] Hardware name: FriendlyElec NanoPC-T6 Plus (DT)
> [   10.162575] Workqueue: async async_run_entry_fn
> [   10.163848] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   10.165316] pc : clk_core_unprepare+0x274/0x2c0
> [   10.166574] lr : clk_core_unprepare+0x274/0x2c0
> [   10.167831] sp : ffff80008021bc30
> [   10.168959] x29: ffff80008021bc30 x28: 0000000000000000 x27: 000000000=
0000000
> [   10.170417] x26: ffff000100040c28 x25: 00000000fffffef7 x24: ffff00010=
019be05
> [   10.171886] x23: ffff000107fa2028 x22: ffff000105217880 x21: 000000000=
0000001
> [   10.173342] x20: 0000000000000000 x19: ffff00010035a800 x18: ffff4e74e=
0fec000
> [   10.174809] x17: 0000000000000000 x16: ffffb1911beae608 x15: ffffb1911=
d0321c8
> [   10.176271] x14: ffffb1911cf4a100 x13: 00000000000000c0 x12: ffff0005f=
df36100
> [   10.177720] x11: 00000000000000c0 x10: 0000000000000db0 x9 : ffffb1911=
af2a084
> [   10.179177] x8 : ffff00010092d810 x7 : 0000000000000004 x6 : 000000000=
0000000
> [   10.180626] x5 : ffff4e74e0fec000 x4 : ffff00010092ca00 x3 : ffff00010=
0901280
> [   10.182061] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010=
092ca00
> [   10.183505] Call trace:
> [   10.184503]  clk_core_unprepare+0x274/0x2c0 (P)
> [   10.185676]  clk_unprepare+0x38/0x60
> [   10.186745]  es8389_set_bias_level+0x184/0x238 [snd_soc_es8389]
> [   10.187997]  snd_soc_component_set_bias_level+0x2c/0x70 [snd_soc_core]
> [   10.189264]  snd_soc_dapm_set_bias_level+0x60/0x2c0 [snd_soc_core]
> [   10.190520]  dapm_pre_sequence_async+0x5c/0x110 [snd_soc_core]
> [   10.191701]  async_run_entry_fn+0x40/0x1a0
> [   10.192683]  process_one_work+0x17c/0x510
> [   10.193623]  worker_thread+0x18c/0x310
> [   10.194540]  kthread+0x134/0x150
> [   10.195425]  ret_from_fork+0x10/0x20
> [   10.196326] ---[ end trace 0000000000000000 ]---
> [   29.109243] snd_parse_eld: 6 callbacks suppressed
>
> The NanoPC-T6 Plus is quite a lot like the T6 LTS ... apart from that the=
 LTS
> uses a Realtek ALC5616 codec and it does not have such a stack trace, hen=
ce my
> suspicion that the bug is in es8389.
>
> Or did I do anything wrong?
> Happy to provide additional info and/or run tests.
>
> Cheers,
>   Diederik
>
> [1] WIP branch: https://git.sr.ht/~diederik/linux-kernel/tree/rk3588-nano=
pc-t6-plus


