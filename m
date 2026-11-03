Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715201;
	b=AOMVKI/Av95UF2rxDJGlZaEbdF7uZcvcLMiWomGdWLiYlTpDktxz17HM+qQbjF3JjW1z
	 ++Q7fWLE8Li+buP5eT2o0VDFC76T5WBnVvr0QrZ6BzqVP+NNEtPjZpc8bRUuoVgoadhTl
	 OPWUfZSjg8F2LAfRMJp3+MbZ8so0iPQaN5W79hxzxK9xB3+RZH1Z/TE7L/dQJQzT33ppT
	 y7QYGLqlZ1g6KNq1hrNQFxXJ4aJ6MuobdpLr8TZzLqGN8qp5kRJ1f5nQQk7MQbA3zs0oZ
	 qdQVUSfJbBzJKgEYkR0J2iZawS9XLyl8dCHB+jDxycwMzCeNen7o92h61VI3+Zly8sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MNtA8FIQTPRkT1vS0onamH09FDjgFqeul5kiajnNDm8=;
	b=yZe1L44bEpjs9UHlcRdrrI89iP7K4vTcs6JzgKwfhQ90E81JHz0ISEvQqBmDz2lD0wFq
	 UvYBmv5DdxOwc3FFF2dLGMSB4565xJiASQ7MgCEY08xC6IXXgYVwrdCmUX2FA9kYpdqKY
	 uGBcx36f0s06D7aQswyQruZCvSucPnQQSW8KU+oZwcoQhP9GyMqYJD9ly3n4LFfG/dyBq
	 LaC5PtpSogF3l37xYOJ8db0ULEKayH8pf1I1D5sE1fVwCUa7pGXF9niyTReshSjV8lnC0
	 935BovA6Q9w01/8jZ2Riyzdm7+8xpT/G7S9jWhy8UE+k2o+15FXg3mK4aS4tFEtImew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nhjb6qgA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA867606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nhjb6qgA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AC91F000C1;
	Tue,  3 Nov 2026 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793715200;
	bh=MNtA8FIQTPRkT1vS0onamH09FDjgFqeul5kiajnNDm8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Nhjb6qgA5vQzZLWIAy63y9bwkAvfvHFYs/GSlGX6rbXBqWNkUx1z7+So/luiduHYS
	 xPV42hg4P8keC9LACyq2+dDPzCMFrf4JqAuBsMVZ1is0B/6dmpl8fJ0YxgaTrESZu8
	 9xl3FlFcYAwegBhMkFyZhHApu5yqrVuC70k0elxMz/eGt7/T/hE4AnY55BbIuPGals
	 8eeTESW62W/nydt3zAII+HeALU3j/ju8JvOsNxO3CaPyLcBGnqbupAj5u+8KWr4eDZ
	 /HwEbasd3NslCBsDWXLruT940DH4rBNdsIqykctHUcJNuU3Xi2X3LCTrPwrTz73txx
	 S6vpudTCCPHnw==
Message-ID: <sashiko-outbox-195427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] ASoC: Intel: avs: SoundWire support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261103134958.2089136-6-cezary.rojewski@intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <20261103134958.2089136-6-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:13:19 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: Intel: avs: premature sdw clear, IRQ race, and unmasked IRQ =
in teardown
- [Medium] ASoC: Intel: avs: 32-bit unaligned read and missing all-ones che=
ck on WAKESTS
--

commit 8ccf2c90780786f5e6483aeba7422e7c31a54429
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: SoundWire support

This commit adds SoundWire support to the Intel AVS driver by utilizing
the existing SoundWire library to probe, start up, tear down, and handle
interrupts for the SoundWire component.

> diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
> index 31fd9f251d6c9..7090b91572d88 100644
> --- a/sound/soc/intel/avs/cnl.c
> +++ b/sound/soc/intel/avs/cnl.c
[ ... ]
> @@ -61,16 +66,30 @@ static void avs_cnl_ipc_interrupt(struct avs_dev *ade=
v)
>  irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev, int irq)
>  {
>  	u32 adspis =3D snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
> +	u32 adspis2 =3D snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS2);
>  	irqreturn_t ret =3D IRQ_NONE;
> =20
> -	if (adspis =3D=3D UINT_MAX)
> +	if (adspis =3D=3D UINT_MAX && adspis2 =3D=3D UINT_MAX)
>  		return ret;
> =20
> -	if (adspis !=3D UINT_MAX && (adspis & AVS_ADSP_ADSPIS_IPC)) {
> +	if (adspis !=3D UINT_MAX && (adspis & AVS_ADSP_ADSPIS_IPC)) {
>  		avs_cnl_ipc_interrupt(adev);
>  		ret =3D IRQ_HANDLED;
>  	}
> =20
> +	if (adev->sdw) {
> +		u32 wakests;
> +
> +		if (adspis2 !=3D UINT_MAX && (adspis2 & AVS_ADSP_ADSPIS2_SNDW))
> +			ret =3D avs_sdw_thread(irq, adev);
> +
> +		wakests =3D snd_hdac_adsp_readl(adev, adev->sdw->shim_base + SDW_SHIM_=
WAKESTS);
> +		if (wakests) {
> +			avs_sdw_process_wakeen_event(adev);
> +			ret =3D IRQ_HANDLED;
> +		}
> +	}

[Severity: Medium]
In avs_cnl_dsp_interrupt() in sound/soc/intel/avs/cnl.c, should
SDW_SHIM_WAKESTS be read with the 16-bit helper snd_hdac_adsp_readw() and
checked against U16_MAX?

In include/linux/soundwire/sdw_intel.h, SDW_SHIM_WAKESTS is defined at
2-byte-aligned offset 0x192 immediately after SDW_SHIM_WAKEEN at 0x190,
and drivers/soundwire/intel.c accesses it as a 16-bit register via
intel_readw() in intel_shim_check_wake(). Using snd_hdac_adsp_readl()
performs an unaligned 32-bit MMIO read across offsets 0x192..0x195.

Additionally, in avs_hda_probe_work() in sound/soc/intel/avs/core.c,
avs_sdw_probe() populates adev->sdw before avs_dsp_first_boot_firmware()
and avs_sdw_startup() run. When an IPC interrupt fires while the SoundWire
SHIM power domain is still unpowered (or powered down at runtime), the
MMIO read can return all-ones. Without filtering out U16_MAX (like the
UINT_MAX checks on adspis and adspis2 above), could wakests evaluate to
non-zero and spuriously trigger avs_sdw_process_wakeen_event()?

> diff --git a/sound/soc/intel/avs/soundwire.c b/sound/soc/intel/avs/soundw=
ire.c
> new file mode 100644
> index 0000000000000..284a00ea794e7
> --- /dev/null
> +++ b/sound/soc/intel/avs/soundwire.c
[ ... ]
> +void avs_sdw_exit(struct avs_dev *adev)
> +{
> +	struct sdw_intel_ctx *ctx =3D adev->sdw;
> +
> +	if (ctx) {
> +		adev->sdw =3D NULL;
> +		sdw_intel_exit(ctx);
> +	}
> +}

[Severity: High]
As reported by Sashiko on v1 [1], in avs_sdw_exit() in
sound/soc/intel/avs/soundwire.c (called from avs_pci_remove() in
sound/soc/intel/avs/core.c), does setting adev->sdw to NULL before calling
sdw_intel_exit(ctx) while interrupts are still active cause several issues
during driver removal?

1. Inside sdw_intel_exit() in drivers/soundwire/intel_init.c, each link
synchronously runtime-resumes its child peripheral devices:

drivers/soundwire/intel_init.c:sdw_intel_exit() {
	list_for_each_entry(link, &ctx->link_list, list) {
		struct sdw_bus *bus =3D &link->cdns->bus;
		int ret;

		ret =3D device_for_each_child(bus->dev, NULL, intel_resume_child_device);
		...
	}
}

Because avs_sdw_probe() sets SDW_INTEL_CLK_STOP_BUS_RESET, resuming a
suspended link powers it up, enables Cadence MCP interrupts, restarts the
SoundWire bus, and performs register transfers waiting on completion.
However, since adev->sdw was already cleared to NULL,
avs_cnl_dsp_interrupt() skips avs_sdw_thread(), so SoundWire interrupts
are never serviced during sdw_intel_exit(), causing child device resume
and bus transfers to time out while the unacknowledged level-triggered
interrupt remains asserted.

2. Neither avs_pci_remove() nor avs_sdw_exit() calls
avs_sdw_enable_irq(adev, false) to clear AVS_ADSP_ADSPIC2_SNDW in
AVS_ADSP_REG_ADSPIC2.

3. In avs_pci_remove(), avs_sdw_exit() runs before pci_free_irq() without
synchronization against the IRQ thread. In avs_cnl_dsp_interrupt(),
adev->sdw is checked at the start of the block and then dereferenced again
for adev->sdw->shim_base:

sound/soc/intel/avs/cnl.c:avs_cnl_dsp_interrupt() {
	if (adev->sdw) {
		u32 wakests;

		if (adspis2 !=3D UINT_MAX && (adspis2 & AVS_ADSP_ADSPIS2_SNDW))
			ret =3D avs_sdw_thread(irq, adev);

		wakests =3D snd_hdac_adsp_readl(adev, adev->sdw->shim_base + SDW_SHIM_WAK=
ESTS);
		...
	}
}

If avs_sdw_exit() clears adev->sdw and calls sdw_intel_exit(ctx)
concurrently, can avs_cnl_dsp_interrupt() hit a NULL pointer dereference
on adev->sdw->shim_base or a use-after-free on ctx in sdw_intel_thread()
and sdw_intel_process_wakeen_event()?

[1] https://lore.kernel.org/r/20261102181042.1922005-6-cezary.rojewski@inte=
l.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103134958.2089=
136-1-cezary.rojewski@intel.com?part=3D5
