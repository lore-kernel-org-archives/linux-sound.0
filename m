Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538214;
	b=Vy2NbyGEMsiUa3y5TUDS5G523lDP9rFNfGY+8Gm8Q3kyQr1DJc8DpKiKC4w9jZyZ6DX4
	 fwTnogyIk2FJ9cvEs4Kgp0dLA+8kAtLVeOEmPmYLGihnvOBHhzSJLj1fdfNpVuxupTc33
	 aieEcfFPE/6oK9LYTAoanCopkGGcXzto+nainE52CoaLdURun+pCzUCsuGmxy1qNKq8KD
	 wWQVuQGSYkl3taDhf98UoY3t7LC3yPQRA2AYci/k3LxFdu6nfthikWm/PgSaiRrVVb3Ex
	 R9PBBDrJ2j6UZAaeWRFbZj5Grrix5GJLmXHjgjW0aooxIlqx1AC024V1tooOhUImK3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538214;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XKTELNe7ZRDunonvIXc9GJbP1mRlyDtWMRb02RlViEk=;
	b=KH+oTxxj6/aNYwj18hYtYd0dPJ3wTHFhst6oOJGXyEEk5sGFb2F+K3jMfLoI6/pp9Oga
	 hKpKPIEjbd/m9YyHRPM697GDftx8yH0s6KLvRS2PhiyDsV0CIT8tu/4iVVLp3Ty+roSZl
	 17j1wFmK/wKK8q8t6Kzjv01Jb8FXAO0k3ePMKxrHu32syaEvZ09icjXCI3OT1rdfclu/X
	 xEzZyvY3JmdbQmrQ7iksFLYD8QuuQshV5d2tjnSnAqivGPQKsdcx0e2tKaszRQvlkzCEG
	 VBm4/WDJ/YDF+fTN7AVX79F32WdI94GG2hjfyHB0/g9fon2T7rW9ZgvhfNhgRtr2Ujw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jidYOmvK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15047606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jidYOmvK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608191F000C6;
	Tue, 24 Nov 2026 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538213;
	bh=XKTELNe7ZRDunonvIXc9GJbP1mRlyDtWMRb02RlViEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jidYOmvKPd87n28e6xO4XlPBrmU3YtBnFiHf2DlfTFc3Y2FDnhSswEs5IDrgJpDSk
	 yZtcbgQWsgieKKjCkIlpzUJ2PLqmhc5Zon+z9sC/n+HWpkxIUpJvn313CmsbkDvxGi
	 PSe57KON53mG+X8bjYia+bXXFssEgUnKLmUf4ePl6swuYOvBkX134kGk2uYyhY8xwl
	 6s/5JWwx+pNezVb57r9k8pdj31luJkrj2b+gp1AfeNC+GSDRfWrpWNDemffOxpiGsk
	 MhlzbQHVGfNXS6eLx0Oei0gARmTcS70WJ4RAqZgLejfczE96wLctlGTkh09mLukmAF
	 jckAiBeiEx6UA==
Message-ID: <sashiko-outbox-231578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: SOF: Intel: Add IRQ chip to distribute the
 SoundWire IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:36:52 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] ASoC: SOF: Intel: swapped error labels and unset ret in
  hda_dsp_probe()
- [Medium] soundwire: intel_auxdevice: missing free_irq() in
  intel_link_probe()
- [Medium] ASoC: SOF: Intel: undisposed IRQ mapping on hda_sdw_probe()
  failure
- [Medium] soundwire: intel_auxdevice: free_irq() called before
  disabling link IRQs
- [Medium] ASoC: SOF: Intel: race between hda_sdw_exit() and
  hda_dsp_sdw_thread()
- [Low] ASoC: SOF: Intel: missing IRQ_DOMAIN select for
  SND_SOC_SOF_HDA_GENERIC
--

commit 5df72fed7029dd88ed89bc7f4dff6d1d49c10ae2
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: SOF: Intel: Add IRQ chip to distribute the SoundWire IRQ

This commit introduces an IRQ domain and chip in the Intel HDA SOF driver
to dispatch the SoundWire interrupt to per-link threaded IRQ handlers.

> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/inte=
l_auxdevice.c
> index 8bdb2bf1c6446..d84fbe716febc 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -366,6 +366,14 @@ static int intel_link_probe(struct auxiliary_device =
*auxdev,
>  	/* use generic bandwidth allocation algorithm */
>  	sdw->cdns.bus.compute_params =3D sdw_compute_params;
> =20
> +	ret =3D request_threaded_irq(sdw->link_res->irq, NULL, sdw_cdns_irq,
> +				   IRQF_SHARED | IRQF_ONESHOT, dev_name(dev),
> +				   cdns);
> +	if (ret) {
> +		dev_err(dev, "failed to request IRQ: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret =3D sdw_bus_master_add(bus, dev, dev->fwnode);
>  	if (ret) {
>  		dev_err(dev, "sdw_bus_master_add fail: %d\n", ret);

[Severity: Medium]
If sdw_bus_master_add() fails, does intel_link_probe() return without
calling free_irq(sdw->link_res->irq, cdns)?  Because sdw is allocated with
devm_kzalloc_obj(), probe failure frees cdns while leaving the irqaction
registered on the shared virtual IRQ, causing a use-after-free when the
IRQ fires or is inspected.

> @@ -503,6 +511,8 @@ static void intel_link_remove(struct auxiliary_device=
 *auxdev)
>  	struct sdw_intel *sdw =3D cdns_to_intel(cdns);
>  	struct sdw_bus *bus =3D &cdns->bus;
> =20
> +	free_irq(sdw->link_res->irq, cdns);
> +
>  	/*
>  	 * Since pm_runtime is already disabled, we don't decrease
>  	 * the refcount when the clock_stop_quirk is

[Severity: Medium]
Should sdw_cdns_enable_interrupt(cdns, false) run before free_irq() here?

sdw_intel_exit() resumes the link and re-enables Cadence interrupts before
removing the auxiliary device, and sdw_cdns_enable_interrupt(cdns, false)
flushes cdns->work before masking CDNS_MCP_INTMASK.  Freeing the IRQ
handler first means any SoundWire transfer in cdns->work (or attach_dwork
and slave teardown before commit "soundwire: intel_auxdevice: Don't
disable IRQs before removing children" later in the series) will never get
its CDNS_MCP_INT_RX_WL completion interrupt and will stall for
CDNS_TX_TIMEOUT, while hardware interrupts remain unmasked without a
handler.

> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 9fc95806697e1..06961e5e666ff 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -46,6 +46,22 @@
>  /* platform specific devices */
>  #include "shim.h"
> =20
> +static int hda_irq_map(struct irq_domain *h, unsigned int virq, irq_hw_n=
umber_t hw)
> +{
> +	struct sof_intel_hda_dev *hdev =3D h->host_data;
> +
> +	irq_set_chip_data(virq, hdev);
> +	irq_set_chip(virq, &hdev->irq_chip);
> +	irq_set_nested_thread(virq, 1);
> +	irq_set_noprobe(virq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops hda_domain_ops =3D {
> +	.map =3D hda_irq_map,
> +};

[Severity: Low]
Does SND_SOC_SOF_HDA_GENERIC in sound/soc/sof/intel/Kconfig need to select
IRQ_DOMAIN?  struct irq_domain_ops and irq_domain_create_linear() are only
declared when CONFIG_IRQ_DOMAIN is enabled, which breaks COMPILE_TEST
builds on architectures that do not unconditionally select IRQ_DOMAIN.

> @@ -198,7 +214,7 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
>  		if (chip->hw_ip_version >=3D SOF_INTEL_ACE_3_0)
>  			res.mic_privacy =3D true;
>  	}
> -	res.irq =3D sdev->ipc_irq;
> +	res.irq =3D irq_create_mapping(hdev->domain, HDA_IRQ_SDW);
>  	res.handle =3D hdev->info.handle;
>  	res.parent =3D sdev->dev;
> =20

[Severity: Medium]
Does this leak the HDA_IRQ_SDW mapping if sdw_intel_probe(&res) fails in
hda_sdw_probe(), or if hda_sdw_startup() later fails in hda_dsp_probe()?

In both cases hda_dsp_probe() unwinds to irq_domain_remove(hdev->domain)
without disposing of the mapping (or calling hda_sdw_exit() on
hda_sdw_startup() failure), triggering the WARN_ON() in
irq_domain_remove() and leaving the leaked irq_desc pointing to freed
hdev->domain and hdev->irq_chip.

> @@ -260,6 +276,8 @@ static int hda_sdw_exit(struct snd_sof_dev *sdev)
>  		sdw_intel_exit(hdev->sdw);
>  	hdev->sdw =3D NULL;
> =20
> +	irq_dispose_mapping(irq_find_mapping(hdev->domain, HDA_IRQ_SDW));
> +
>  	hda_sdw_int_enable(sdev, false);
> =20
>  	return 0;
> @@ -307,9 +325,9 @@ static bool hda_dsp_check_sdw_irq(struct snd_sof_dev =
*sdev)
>  	return false;
>  }
> =20
> -static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
> +static void hda_dsp_sdw_thread(struct sof_intel_hda_dev *hdev)
>  {
> -	return sdw_intel_thread(irq, context);
> +	handle_nested_irq(irq_find_mapping(hdev->domain, HDA_IRQ_SDW));
>  }

[Severity: Medium]
Can hda_sdw_exit() dispose of the HDA_IRQ_SDW mapping while
hda_dsp_interrupt_thread() is still running?

In hda_dsp_remove(), hda_sdw_exit() runs before SOF_HDA_INT_GLOBAL_EN is
cleared and before free_irq(sdev->ipc_irq, sdev) stops
hda_dsp_interrupt_thread():

CPU0                                CPU1
hda_dsp_remove()                    hda_dsp_interrupt_thread()
  hda_sdw_exit()                      if (hda_dsp_check_sdw_irq(sdev))
    sdw_intel_exit()
      ...
        free_irq(virq, cdns)
    irq_dispose_mapping(virq)
                                        hda_dsp_sdw_thread(hdev)
                                          virq =3D irq_find_mapping(...)
                                          handle_nested_irq(virq)
                                            <-- virq is 0 or freed desc

Once irq_dispose_mapping() unmaps HDA_IRQ_SDW and frees its irq_desc,
irq_find_mapping() returns 0 (which on x86 resolves to legacy timer IRQ 0
where action->thread_fn is NULL, causing a NULL pointer dereference in
handle_nested_irq()) or races with irq_free_desc().

[ ... ]

> @@ -883,6 +900,14 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  		sdev->ipc_irq =3D pci->irq;
>  	}
> =20
> +	hdev->irq_chip.name =3D dev_name(sdev->dev);
> +	hdev->domain =3D irq_domain_create_linear(NULL, HDA_IRQ_COUNT,
> +						&hda_domain_ops, hdev);
> +	if (!hdev->domain) {
> +		dev_err(sdev->dev, "failed to create IRQ domain\n");
> +		goto remove_irq_domain;
> +	}
> +
>  	dev_dbg(sdev->dev, "using IPC IRQ %d\n", sdev->ipc_irq);
>  	ret =3D request_threaded_irq(sdev->ipc_irq, hda_dsp_interrupt_handler,
>  				   hda_dsp_interrupt_thread,
> @@ -941,6 +966,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
>  free_ipc_irq:
>  	hda_dsp_ctrl_stop_chip(sdev);
>  	free_irq(sdev->ipc_irq, sdev);
> +remove_irq_domain:
> +	irq_domain_remove(hdev->domain);
>  free_irq_vector:
>  	if (sdev->msi_enabled)
>  		pci_free_irq_vectors(pci);

[Severity: Medium]
Are the error labels for irq_domain_create_linear() and
request_threaded_irq() swapped here?

When irq_domain_create_linear() returns NULL, ret is still 0 from
hda_dsp_stream_init(), and jumping to remove_irq_domain passes NULL to
irq_domain_remove(), which immediately dereferences domain->exit.
Conversely, if request_threaded_irq() fails, it jumps to free_irq_vector
and skips remove_irq_domain, leaking hdev->domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124161001.7028=
82-1-ckeepax@opensource.cirrus.com?part=3D1
