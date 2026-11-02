Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644176;
	b=cUdjDrzkLiTe8mUEXM9DWpcjg7cWVJK81rOAPLxyJuSlUuE9WZuSWzmVuddecdxfOf1M
	 iFHyzNMMyXvpS7tuPxeVSfmoVECOlgkI/lyOBBOQ9yM0YoUoEXHXdKwH4PSRudezjuuNf
	 AoSFcILoSos/ubeZhsbfIH2RpdTB5cS4/wffUBrqJise3EAnnnGkN7fWpF9TudCr0h4Hz
	 XON3Z1581JcC12/H9Qswo35rLFbnOo9mmj6ia+DQuqbfJYWD/S89dTwx991GpNXeqoznZ
	 /tF3BfPr9fCoYcHzqtRtdG+END8AdhIq0uj7EMsLGVfAcQuHwe1AGYfP8LEMzGVK0Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/3wv3CGORxc/kKuIdFCk+2E6eRnEsUONlivoAMyJ5bc=;
	b=KQ/2Itzv2INSTqu4S9hkLsSxocAY/5pEOgM+4rdpSN300BkkiMeU+Od2a2kc4WzDOT96
	 W+X6ar0bEmduP0EUSJG3RWzhDyqlt5Wo8Up4t8ZX0wShZcAEy2gWrDhWWGHTm1AZel8fY
	 YYE38VUJzdUqeNLFfHg2hy2BpXzKdGaTaohpiKxjxSl2wq9bruGuI4fME/At0br4Cp4dp
	 55GC6fSCgZWxgVgdKI2v3CQQtgHSes7+tJGlQPxq9IrKwQwmnyFtF/3GodL5I8fB9B2gv
	 uaQmaQ2u+gp+7ok0+f+8BmPfFHkhyzIsyPjQ7JugA8yvoGPfBzmxUdj/5m5Jk8UaP+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z/hdRTYi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648AC606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z/hdRTYi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B031F00A16;
	Mon,  2 Nov 2026 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793644176;
	bh=/3wv3CGORxc/kKuIdFCk+2E6eRnEsUONlivoAMyJ5bc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Z/hdRTYi7/KX/eeM8EzWu0iHwYaJCJqnAeYd+dOL2HqOXTrLlffru9Nx+NdLum6lu
	 s/gsm5nZrSHjKiUeeEcH5eKmd7ctvddS591JWHeBxHOJfSZ4jirUiLsRINwU2xOQ46
	 hjO/DuLYTUWbnR36CfXd5AJFpOQ6LgXErVGB5fs+cOYboqMDOF0+ReUgrVfdwl+urG
	 W6N6AGClKeC/Rfb5WWJdAYHSsEOdVkne2AxEA7EpvRhVnn+1eNY0PiFa0D/GGlypVD
	 /1ojx8hSaUQ2/Ct2XlvBf0LRXAF4dYazzQHY/nbnzVqrJSrhuhOhrxINpXjZYiQBCm
	 yZfJwJgHHzE2Q==
Message-ID: <sashiko-outbox-193940@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] ASoC: Intel: avs: SoundWire support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102181042.1922005-6-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-6-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:29:35 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] ASoC: Intel: avs: premature IRQ disable and UAF in avs_sdw_exit()
- [Medium] ASoC: Intel: avs: disabling IRQs before avs_sdw_exit() in avs_pc=
i_remove() breaks child resume
- [Medium] ASoC: Intel: avs: missing link_mask check in avs_sdw_probe()
- [Medium] ASoC: Intel: avs: cAVS SoundWire MMIO offsets used on ACE platfo=
rms
- [Low] ASoC: Intel: avs: vmlinux link failure when SND_SOC_INTEL_AVS=3Dy a=
nd SOUNDWIRE_INTEL=3Dm
--

commit 99a0d9e68cf08e7f2ab6024f81ba2c7db0e51ac2
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: SoundWire support

This commit adds SoundWire enumeration, startup, interrupt handling, and
teardown support to the Intel AVS driver using the SoundWire Intel library.

> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index 63367364916ae..4e453b55fc043 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -106,6 +106,7 @@ config SND_SOC_INTEL_AVS
>  	select SND_HDA_EXT_CORE
>  	select SND_HDA_DSP_LOADER
>  	select SND_INTEL_DSP_CONFIG
> +	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL !=3D n
>  	select WANT_DEV_COREDUMP
>  	help
>  	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
> diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
> index 576dc0da381d8..1d48953c7a31c 100644
> --- a/sound/soc/intel/avs/Makefile
> +++ b/sound/soc/intel/avs/Makefile
> @@ -14,6 +14,10 @@ ifneq ($(CONFIG_DEBUG_FS),)
>  snd-soc-avs-y +=3D probes.o debugfs.o
>  endif
> =20
> +ifneq ($(CONFIG_SOUNDWIRE_INTEL),)
> +snd-soc-avs-y +=3D soundwire.o
> +endif

[Severity: Low]
Will vmlinux fail to link when CONFIG_SND_SOC_INTEL_AVS=3Dy and
CONFIG_SOUNDWIRE_INTEL=3Dm?

In that configuration, sound/soc/intel/avs/Makefile compiles soundwire.o in=
to
the built-in snd-soc-avs.o, and sound/soc/intel/avs/soundwire.h enables the
external declarations under IS_ENABLED(CONFIG_SOUNDWIRE_INTEL). However,
avs_sdw_probe(), avs_sdw_startup(), avs_sdw_exit(),
avs_sdw_process_wakeen_event(), and avs_sdw_thread() in
sound/soc/intel/avs/soundwire.c call sdw_intel_cnl_hw_ops, sdw_intel_probe(=
),
sdw_intel_startup(), sdw_intel_exit(), sdw_intel_process_wakeen_event(), and
sdw_intel_thread(), which live in the loadable soundwire-intel.ko module.

Should SND_SOC_INTEL_AVS depend on SOUNDWIRE_INTEL || !SOUNDWIRE_INTEL (or
use IS_REACHABLE), similar to how other ASoC drivers handle optional
tristate dependencies?

[ ... ]

> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 9413027e1e322..f9f25f651a9e2 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c

[ ... ]

> @@ -587,6 +603,9 @@ static void avs_pci_remove(struct pci_dev *pci)
>  	avs_dsp_op(adev, int_control, false);
>  	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
> =20
> +	avs_sdw_enable_irq(adev, false);
> +	avs_sdw_exit(adev);

[Severity: Medium]
In avs_pci_remove(), won't disabling interrupts before calling avs_sdw_exit=
()
cause SoundWire child device resume to time out during driver removal?

Before avs_sdw_exit(adev) is called, avs_pci_remove() runs:

    snd_hdac_stop_streams_and_chip(bus);
    avs_dsp_op(adev, int_control, false);
    snd_hdac_ext_bus_ppcap_int_enable(bus, false);

    avs_sdw_enable_irq(adev, false);
    avs_sdw_exit(adev);

Inside avs_sdw_exit() -> sdw_intel_exit(), the SoundWire teardown iterates
over ctx->link_list and synchronously runtime-resumes all child peripheral
devices and links via device_for_each_child(bus->dev, NULL,
intel_resume_child_device) before cleaning them up.

Because avs_sdw_probe() sets res.clock_stop_quirks =3D
SDW_INTEL_CLK_STOP_BUS_RESET, resuming a runtime-suspended link and its
peripherals restarts the bus via sdw_intel_start_bus_after_reset(), waits f=
or
peripheral attachment, and performs Cadence MCP register transfers in
cdns_xfer_msg() waiting on cdns->tx_complete. Those completions and status
updates depend on sdw_cdns_irq() running from avs_dsp_irq_thread() ->
avs_cnl_dsp_interrupt() -> avs_sdw_thread(), which cannot fire once HDA,
PPCTL, and AVS_ADSP_ADSPIC2_SNDW interrupts have been disabled.

[ ... ]

> diff --git a/sound/soc/intel/avs/soundwire.c b/sound/soc/intel/avs/soundw=
ire.c
> new file mode 100644
> index 0000000000000..c2a6db08a3afb
> --- /dev/null
> +++ b/sound/soc/intel/avs/soundwire.c
> @@ -0,0 +1,112 @@

[ ... ]

> +int avs_sdw_probe(struct avs_dev *adev)
> +{
> +	struct hdac_bus *hbus =3D &adev->base.core;
> +	struct sdw_intel_acpi_info info;
> +	struct sdw_intel_ctx *ctx;
> +	struct sdw_intel_res res;
> +	int ret;
> +
> +	ret =3D sdw_intel_acpi_scan(ACPI_HANDLE(adev->dev), &info);
> +	if (ret < 0)
> +		return -ENODEV;

[Severity: Medium]
Should avs_sdw_probe() also check if (!info.link_mask) before proceeding?

In sdw_intel_acpi_scan() -> sdw_intel_scan_controller(), when the ACPI
controller node is present with a valid master count but all links are
disabled in firmware or masked via sdw_link_mask, sdw_intel_acpi_scan()
returns 0 with info.link_mask =3D=3D 0.

Without checking !info.link_mask, avs_sdw_probe() passes res.count > 0 and
res.link_mask =3D=3D 0 to sdw_intel_probe(), which allocates and returns a
non-NULL struct sdw_intel_ctx with zero active links. That leaves adev->sdw
non-NULL with the SoundWire SHIM unpowered, causing avs_sdw_enable_irq() to
unmask AVS_ADSP_ADSPIC2_SNDW and avs_cnl_dsp_interrupt() to read
SDW_SHIM_WAKESTS (returning 0xffffffff when unpowered and falsely reporting
IRQ_HANDLED) on every DSP interrupt.

> +
> +	memset(&res, 0, sizeof(res));
> +	res.mmio_base =3D adev->dsp_ba;
> +	res.shim_base =3D SDW_SHIM_BASE;
> +	res.alh_base =3D SDW_ALH_BASE;
> +	res.ext =3D false;
> +	res.irq =3D adev->base.core.irq;
> +	res.handle =3D info.handle;
> +	res.parent =3D adev->dev;
> +	res.dev =3D adev->dev;
> +	res.clock_stop_quirks =3D SDW_INTEL_CLK_STOP_BUS_RESET;
> +	res.hbus =3D hbus;
> +
> +	memcpy(&avs_sdw_cnl_ops, &sdw_intel_cnl_hw_ops, sizeof(avs_sdw_cnl_ops)=
);
> +	avs_sdw_cnl_ops.register_dai =3D NULL;
> +	res.hw_ops =3D &avs_sdw_cnl_ops;

[Severity: Medium]
What happens when avs_hda_probe_work() calls avs_sdw_probe(),
avs_sdw_startup(), and avs_sdw_enable_irq() on ACE platforms such as
fcl_desc (which sets AVS_PLATATTR_ACE)?

Here avs_sdw_probe() unconditionally sets cAVS 1.8/2.5 BAR4 offsets
(res.mmio_base =3D adev->dsp_ba, res.shim_base =3D SDW_SHIM_BASE, res.alh_b=
ase =3D
SDW_ALH_BASE, res.ext =3D false) and sdw_intel_cnl_hw_ops, and
sdw_intel_enable_irq() unconditionally accesses AVS_ADSP_REG_ADSPIC2 at
dsp_ba + 0x10. Because sdw_intel_cnl_hw_ops.get_link_count is NULL,
sdw_intel_probe() succeeds without touching hardware if SoundWire is present
in ACPI, and subsequent calls to avs_sdw_startup() and avs_sdw_enable_irq()
will read and write cAVS BAR4 offsets (0x2c000, 0x30000, and 0x10) instead =
of
the ACE multi-link and MTL_DWICTL_BASE / MTL_HfINT_BASE registers.

Should avs_sdw_probe() guard against avs_platattr_test(adev, ACE) until ACE
SoundWire support is wired up?

[ ... ]

> +void avs_sdw_exit(struct avs_dev *adev)
> +{
> +	if (adev->sdw) {
> +		sdw_intel_exit(adev->sdw);
> +		adev->sdw =3D NULL;
> +	}
> +}

[Severity: High]
Can avs_cnl_dsp_interrupt() race with avs_sdw_exit() and dereference
adev->sdw after sdw_intel_exit() has freed it?

In avs_pci_remove(), pci_free_irq(pci, 0, adev) is called after
avs_sdw_exit(adev), and in avs_sdw_exit(), sdw_intel_exit(adev->sdw) frees
ctx->peripherals, ctx->ldev, and ctx before adev->sdw is cleared to NULL.
Meanwhile, avs_cnl_dsp_interrupt() checks if (adev->sdw) without
synchronization and accesses adev->sdw->shim_base, adev->sdw->link_list (via
avs_sdw_thread() -> sdw_intel_thread()), and adev->sdw->ldev (via
avs_sdw_process_wakeen_event() -> sdw_intel_process_wakeen_event()).

Even if MMIO interrupt bits are cleared beforehand, an already-running
avs_dsp_irq_thread() is not synchronized until pci_free_irq(), and if
interrupts remain enabled during sdw_intel_exit() so child devices can
runtime-resume, avs_cnl_dsp_interrupt() can run concurrently while
sdw_intel_exit() frees adev->sdw.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181042.1922=
005-1-cezary.rojewski@intel.com?part=3D5
