Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C7286415
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464446; cv=none; b=EU73CHrc2meLoVZdTmovBbYQsapPasrMVDkWk3TsrFUQEciwpmFxPH6EsGMbIb33oya089XBJoVEg4qo23O/7JKREpR9Vh1dVewIaxdV9vconRmlBoklsvQCjJUxmfUAEzlE5+ckqa0ZhsmHOV4ar88VCZo+Y1gKdWuy52VCkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464446; c=relaxed/simple;
	bh=JMMtPICAgyfWaaJ5+c0rBFVkWzNEOFLQpQ3FXtOEqn0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To; b=qvl2MvZGD9mjPi/oW/1IebcEGs3dIvOFRjYPUoif3LxBJb+7HIGr6zdGcAnyYrlt/Q0TZJMs0TRdrAmDXlglH+ZEuRRq5T79AA11MHUqbHnNFzYVa69mvjstjz8C+YTKW5tcVs89FhwqhuKVytl93UkL4yac89F8m47WviG/420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=PqqRLeY4; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="PqqRLeY4"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782464437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4Cce86tKE0+UdE8KSgNVtbD02Bo09VNCIPBUKHGYHd0=;
	b=PqqRLeY4G0QgfWHUv1ujyDOtlEjJyebxS1HjL8r5gi3PhbAVYrvD3kiJ1Fnfz1xWiI4uGL
	0bjpz33vMwwSqZCDHck84U5Grc1NKvGYdRhHa/GOiFx/2m2ujpjew0nRf2UiHiJmLO2H6j
	idzLhOnSdzcClJNAY8nSuXXqZl+0yY8xSwOLFVC8v2vR+PZF5nUoEo3vfcthbHTEMETLti
	EmIrXVBTIcZwWQ8mAXsE3nHJIOPs5i1jlmjJ6I5yEWqRGbmjZK+3X58cLgHm03ilnV5Im3
	W2t7BE9mnCQkcZQqCPa128F8hsCej+ugGzp+lGDGI74jgem3BJxoxsirdDBuAQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 11:00:27 +0200
Message-Id: <DJIUWLPIHZ48.5H5T2EI2YI8D@cknow-tech.com>
Subject: BUG in es8389_set_bias_level?
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Diederik de Haas" <diederik@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <linux-sound@vger.kernel.org>, "Zhang Yi" <zhangyi@everest-semi.com>
X-Migadu-Flow: FLOW_OUT

I'm working on adding support for the FriendlyElec NanoPC-T6 Plus [1] which
uses the es8389 codec. And while analog audio does work, I always get the
following stack trace in dmesg:

[   10.072410] ------------[ cut here ]------------
[   10.073686] i2s0_8ch_mclkout_to_io already disabled
[   10.074943] WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x224/0x=
260, CPU#6: kworker/u32:0/12
[   10.076547] Modules linked in: aes_ce_blk ghash_ce gf128mul rockchip_vde=
c joydev snd_soc_simple_card(+) snd_soc_es8389 snd_soc_rockchip_i2s_tdm snd=
_soc_hdmi_codec(+) v4l2_vp9 snd_soc_simple_card_utils rockchip_iep2 rockchi=
p_rga synopsys_hdmirx pwm_fan leds_gpio rockchip_iep_common v4l2_h264 v4l2_=
dv_timings snd_soc_core v4l2_mem2mem videobuf2_dma_contig videobuf2_dma_sg =
gpio_ir_recv videobuf2_memops snd_compress videobuf2_v4l2 snd_pcm_dmaengine=
 panthor ofpart snd_pcm videodev snd_timer spi_nor videobuf2_common drm_gpu=
vm snd rockchip_rng mtd rockchip_thermal mc soundcore gpu_sched rk805_pwrke=
y drm_exec drm_shmem_helper evdev cpufreq_dt pkcs8_key_parser nvme_fabrics =
efi_pstore configfs autofs4 ext4 hid_generic crc16 usbhid mbcache jbd2 hid =
r8169 realtek onboard_usb_dev phy_package mdio_devres of_mdio fixed_phy fwn=
ode_mdio libphy mdio_bus nvme xhci_plat_hcd xhci_hcd nvme_core rk808_regula=
tor nvme_keyring nvme_auth rockchipdrm dw_hdmi_qp dw_mipi_dsi fusb302 tcpm =
dw_hdmi rtc_hym8563 aux_hpd_bridge analogix_dp fan53555
[   10.076648]  drm_dp_aux_bus drm_display_helper cec phy_rockchip_usbdp gp=
io_rockchip phy_rockchip_snps_pcie3 dw_mmc_rockchip phy_rockchip_naneng_com=
bphy fixed sdhci_of_dwcmshc rockchip_saradc rc_core display_connector sdhci=
_pltfm typec ohci_platform dw_mmc_pltfm industrialio_triggered_buffer dwc3 =
sdhci drm_client_lib ehci_platform kfifo_buf dw_mmc udc_core spi_rockchip e=
hci_hcd ohci_hcd dw_wdt cqhci phy_rockchip_samsung_hdptx drm_dma_helper nvm=
em_rockchip_otp pl330 rockchip_dfi spi_rockchip_sfc drm_kms_helper usbcore =
drm i2c_rk3x adc_keys pwm_rockchip phy_rockchip_inno_usb2 industrialio ulpi=
 usb_common
[   10.095597] CPU: 6 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted 7.1-rc=
7+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 7.1~rc7-2
[   10.097473] Hardware name: FriendlyElec NanoPC-T6 Plus (DT)
[   10.098826] Workqueue: async async_run_entry_fn
[   10.100094] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   10.101564] pc : clk_core_disable+0x224/0x260
[   10.102818] lr : clk_core_disable+0x224/0x260
[   10.104059] sp : ffff80008021bc30
[   10.105189] x29: ffff80008021bc30 x28: 0000000000000000 x27: 00000000000=
00000
[   10.106663] x26: ffff000100040c28 x25: 00000000fffffef7 x24: ffff0001001=
9be05
[   10.108135] x23: ffff000107fa2028 x22: ffff000105217880 x21: 00000000000=
00001
[   10.109596] x20: 0000000000000000 x19: ffff00010035a800 x18: 00000000000=
0000a
[   10.111056] x17: 0000000000000000 x16: ffffb1911af0cef0 x15: 00000000000=
00000
[   10.112497] x14: ffffffffffffffff x13: ffff000109d7c480 x12: 3ffffffffff=
fefff
[   10.113922] x11: 0000000000017fe8 x10: ffffb1911d05c148 x9 : ffffb1911af=
a4a8c
[   10.115333] x8 : ffffb1911d0e4310 x7 : ffffffffffffefff x6 : 00000000000=
00001
[   10.116735] x5 : ffff0005fdf361c8 x4 : ffff4e74e0fec000 x3 : ffff0001009=
2ca00
[   10.118141] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0001009=
2ca00
[   10.119550] Call trace:
[   10.120539]  clk_core_disable+0x224/0x260 (P)
[   10.121686]  clk_disable+0x40/0x70
[   10.122743]  es8389_set_bias_level+0x17c/0x238 [snd_soc_es8389]
[   10.124013]  snd_soc_component_set_bias_level+0x2c/0x70 [snd_soc_core]
[   10.125329]  snd_soc_dapm_set_bias_level+0x60/0x2c0 [snd_soc_core]
[   10.126604]  dapm_pre_sequence_async+0x5c/0x110 [snd_soc_core]
[   10.127844]  async_run_entry_fn+0x40/0x1a0
[   10.128915]  process_one_work+0x17c/0x510
[   10.129964]  worker_thread+0x18c/0x310
[   10.130994]  kthread+0x134/0x150
[   10.131958]  ret_from_fork+0x10/0x20
[   10.132950] ---[ end trace 0000000000000000 ]---
[   10.134217] ------------[ cut here ]------------
[   10.135476] i2s0_8ch_mclkout_to_io already unprepared
[   10.136833] WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0x274/=
0x2c0, CPU#6: kworker/u32:0/12
[   10.138576] Modules linked in: aes_ce_blk ghash_ce gf128mul rockchip_vde=
c joydev snd_soc_simple_card(+) snd_soc_es8389 snd_soc_rockchip_i2s_tdm snd=
_soc_hdmi_codec(+) v4l2_vp9 snd_soc_simple_card_utils rockchip_iep2 rockchi=
p_rga synopsys_hdmirx pwm_fan leds_gpio rockchip_iep_common v4l2_h264 v4l2_=
dv_timings snd_soc_core v4l2_mem2mem videobuf2_dma_contig videobuf2_dma_sg =
gpio_ir_recv videobuf2_memops snd_compress videobuf2_v4l2 snd_pcm_dmaengine=
 panthor ofpart snd_pcm videodev snd_timer spi_nor videobuf2_common drm_gpu=
vm snd rockchip_rng mtd rockchip_thermal mc soundcore gpu_sched rk805_pwrke=
y drm_exec drm_shmem_helper evdev cpufreq_dt pkcs8_key_parser nvme_fabrics =
efi_pstore configfs autofs4 ext4 hid_generic crc16 usbhid mbcache jbd2 hid =
r8169 realtek onboard_usb_dev phy_package mdio_devres of_mdio fixed_phy fwn=
ode_mdio libphy mdio_bus nvme xhci_plat_hcd xhci_hcd nvme_core rk808_regula=
tor nvme_keyring nvme_auth rockchipdrm dw_hdmi_qp dw_mipi_dsi fusb302 tcpm =
dw_hdmi rtc_hym8563 aux_hpd_bridge analogix_dp fan53555
[   10.138686]  drm_dp_aux_bus drm_display_helper cec phy_rockchip_usbdp gp=
io_rockchip phy_rockchip_snps_pcie3 dw_mmc_rockchip phy_rockchip_naneng_com=
bphy fixed sdhci_of_dwcmshc rockchip_saradc rc_core display_connector sdhci=
_pltfm typec ohci_platform dw_mmc_pltfm industrialio_triggered_buffer dwc3 =
sdhci drm_client_lib ehci_platform kfifo_buf dw_mmc udc_core spi_rockchip e=
hci_hcd ohci_hcd dw_wdt cqhci phy_rockchip_samsung_hdptx drm_dma_helper nvm=
em_rockchip_otp pl330 rockchip_dfi spi_rockchip_sfc drm_kms_helper usbcore =
drm i2c_rk3x adc_keys pwm_rockchip phy_rockchip_inno_usb2 industrialio ulpi=
 usb_common
[   10.158082] CPU: 6 UID: 0 PID: 12 Comm: kworker/u32:0 Tainted: G        =
W           7.1-rc7+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 7.1~rc7-2
[   10.160114] Tainted: [W]=3DWARN
[   10.161231] Hardware name: FriendlyElec NanoPC-T6 Plus (DT)
[   10.162575] Workqueue: async async_run_entry_fn
[   10.163848] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   10.165316] pc : clk_core_unprepare+0x274/0x2c0
[   10.166574] lr : clk_core_unprepare+0x274/0x2c0
[   10.167831] sp : ffff80008021bc30
[   10.168959] x29: ffff80008021bc30 x28: 0000000000000000 x27: 00000000000=
00000
[   10.170417] x26: ffff000100040c28 x25: 00000000fffffef7 x24: ffff0001001=
9be05
[   10.171886] x23: ffff000107fa2028 x22: ffff000105217880 x21: 00000000000=
00001
[   10.173342] x20: 0000000000000000 x19: ffff00010035a800 x18: ffff4e74e0f=
ec000
[   10.174809] x17: 0000000000000000 x16: ffffb1911beae608 x15: ffffb1911d0=
321c8
[   10.176271] x14: ffffb1911cf4a100 x13: 00000000000000c0 x12: ffff0005fdf=
36100
[   10.177720] x11: 00000000000000c0 x10: 0000000000000db0 x9 : ffffb1911af=
2a084
[   10.179177] x8 : ffff00010092d810 x7 : 0000000000000004 x6 : 00000000000=
00000
[   10.180626] x5 : ffff4e74e0fec000 x4 : ffff00010092ca00 x3 : ffff0001009=
01280
[   10.182061] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0001009=
2ca00
[   10.183505] Call trace:
[   10.184503]  clk_core_unprepare+0x274/0x2c0 (P)
[   10.185676]  clk_unprepare+0x38/0x60
[   10.186745]  es8389_set_bias_level+0x184/0x238 [snd_soc_es8389]
[   10.187997]  snd_soc_component_set_bias_level+0x2c/0x70 [snd_soc_core]
[   10.189264]  snd_soc_dapm_set_bias_level+0x60/0x2c0 [snd_soc_core]
[   10.190520]  dapm_pre_sequence_async+0x5c/0x110 [snd_soc_core]
[   10.191701]  async_run_entry_fn+0x40/0x1a0
[   10.192683]  process_one_work+0x17c/0x510
[   10.193623]  worker_thread+0x18c/0x310
[   10.194540]  kthread+0x134/0x150
[   10.195425]  ret_from_fork+0x10/0x20
[   10.196326] ---[ end trace 0000000000000000 ]---
[   29.109243] snd_parse_eld: 6 callbacks suppressed

The NanoPC-T6 Plus is quite a lot like the T6 LTS ... apart from that the L=
TS
uses a Realtek ALC5616 codec and it does not have such a stack trace, hence=
 my
suspicion that the bug is in es8389.

Or did I do anything wrong?
Happy to provide additional info and/or run tests.

Cheers,
  Diederik

[1] WIP branch: https://git.sr.ht/~diederik/linux-kernel/tree/rk3588-nanopc=
-t6-plus
