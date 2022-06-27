From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 27 Jun 2022 15:12:37 +0000
Subject: Re: Sound not working after commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-Id: <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
In-Reply-To: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Natalsson <harmoniesworlds@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, ALSA Development Mailing List <alsa-devel@alsa-project.org>

[Adding alsa-devel]

On 6/26/22 04:29, Alex Natalsson wrote:
> Hello friends.
> I have Khadas VIM3 SBC with Amlogic A311D SOC device.
> After update kernel my media software (alsamixer, mplayer, ffplay and
> etc.) not responding after launch and not terminating throught kill
> -9.
> 
> The log after alsamixer launch:
> [  103.786358] Internal error: Oops: 96000004 [#1] SMP
> [  103.786509] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device bnep nls_utf8 mt7601u mac80211 hci_uart libarc4 joydev
> brcmfmac btbcm panfrost bluetooth meson_vdec(C) brcmutil gpu_sched
> cfg80211 dwmac_generic videobuf2_dma_contig v4l2_mem2mem
> videobuf2_memops videobuf2_v4l2 videobuf2_common drm_shmem_helper
> ecdh_generic dwmac_meson8b stmmac_platform dw_hdmi_i2s_audio stmmac
> ecc ir_nec_decoder videodev pcs_xpcs rc_khadas phylink ptp
> meson_saradc meson_ir rc_core snd_soc_meson_axg_frddr
> snd_soc_meson_axg_toddr snd_soc_meson_axg_sound_card
> snd_soc_meson_card_utils snd_soc_meson_axg_fifo ao_cec_g12a
> snd_soc_meson_axg_tdmin snd_soc_meson_axg_tdm_interface
> snd_soc_meson_axg_tdmout snd_soc_meson_axg_tdm_formatter rfkill
> meson_gxbb_wdt fuse crypto_user uas usb_storage adc_keys
> gpio_keys_polled industrialio
> [  103.857778] CPU: 3 PID: 530 Comm: pipewire-media- Tainted: G
>  C        5.16.0-ARCH+ #8

Any chance you could try with an updated kernel? It's not clear to me if
this is a real issue or just a warning that's been fixed since by commit.

bbf7d3b1c4f40 "ASoC: soc-pcm: Fix DPCM lockdep warning due to nested
stream locks"

You may also want to open a bugzilla issue to attach the full dmesg log
and your configuration reported by 'alsa-info'

> [  103.857791] Hardware name: Khadas VIM3 (DT)
> [  103.857795] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  103.857801] pc : dpcm_be_connect+0xd0/0x2d0
> [  103.881758] lr : dpcm_add_paths.isra.0+0xcc/0x1e0
> [  103.881763] sp : ffff800009f4b870
> [  103.881765] x29: ffff800009f4b870 x28: ffff000003b944c0 x27: 0000000000000001
> [  103.881772] x26: 0000000000000001 x25: 0000000000000340 x24: 00000000000002a0
> [  103.881777] x23: 0000000000000001 x22: 0000000000000000 x21: ffff000005b18080
> [  103.881782] x20: ffff000005b183c0 x19: ffff000005b1c080 x18: 0000000000000000
> [  103.881787] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  103.881792] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  103.881797] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [  103.881801] x8 : ffff000012020400 x7 : 0000000000000000 x6 : 000000000000003f
> [  103.881806] x5 : 0000000000000040 x4 : 0000000000000000 x3 : ffff000002822000
> [  103.881811] x2 : ffff000002861b50 x1 : ffff00000282f800 x0 : ffff000002861800
> [  103.881817] Call trace:
> [  103.881819]  dpcm_be_connect+0xd0/0x2d0
> [  103.881823]  dpcm_add_paths.isra.0+0xcc/0x1e0
> [  103.881826]  dpcm_fe_dai_open+0x80/0x194
> [  103.881831]  snd_pcm_open_substream+0xa4/0x174
> [  103.881838]  snd_pcm_open.part.0+0xd8/0x1dc
> [  103.881843]  snd_pcm_capture_open+0x64/0x94
> [  103.992730]  snd_open+0xac/0x1d0
> [  103.992739]  chrdev_open+0xe0/0x2d0
> [  103.999389]  do_dentry_open+0x12c/0x3a0
> [  103.999397]  vfs_open+0x30/0x3c
> [  103.999401]  do_open+0x204/0x414
> [  103.999405]  path_openat+0x10c/0x27c
> [  103.999408]  do_filp_open+0x80/0x130
> [  103.999412]  do_sys_openat2+0xb4/0x170
> [  103.999414]  __arm64_sys_openat+0x64/0xb0
> [  103.999416]  invoke_syscall+0x48/0x114
> [  103.999426]  el0_svc_common.constprop.0+0xd4/0xfc
> [  103.999429]  do_el0_svc+0x28/0x90
> [  103.999432]  el0_svc+0x28/0x80
> 
> After I removed pipewire software the error message was
> disappear. But the sound and media still doesn't working and alsamixer
> cannot change sound card to my usb audio device.
