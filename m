Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968387;
	b=lRZbybUQw1WG78jNB3FAZ6CuOPwrQ/m7f+L6aneJRdsrdoR6Xb+3D6wimirExGUB4jGy
	 opO1Ad78xhNBP4xMGg2nw1hTHMJSWoqCxravFbpRr+wSgo/Vhr8nS/SBuAZkk6zyYCrGQ
	 Va+aSxxQ945ybJt+dpj8Mdv60PcJ0+4RNhyL8+UjGcZJsGCbt6VGAXVco+Q80QZCmes9d
	 uYJsi/fOXIdoVmCTt7O73K4+EraH8NOzQAgvMDof0IuVeLPK5AQnmt38JaH0qqOABP6w9
	 aZWiQAm53vMpWie5UkqPqWRadLXXpCoLUlWkaCMX24DQekiFJniMjOVB45xtWPDmeNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968387;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P4eLX0lfLf3nUSknHmMNmLqItrnDHhDy/LeZ56zMmPw=;
	b=SKzwnmbwMztfBcBcdnEdJ6nPA6rWalpvnln4pRxUmJCNl7IzA0Cvbbacc578Fxcj98fs
	 f92iMA63uj85VBQKiBhQ/xvvXF9eIBFrvXNhDhP6jnfDMVcKQYq9UyBrfkWY/2zE4zdfW
	 Y8/Wd2IpwxmTtWnFEMLgLFM1pwxnn+XxlmKCEjMr/6d/vtGTIh6WnuBaVpYxjt3kH6YTV
	 RZ6u9t+HmqsZZRUskTnD62uCSwQbPDAlguGB/S95S+eS+dtOanoRlCW+xh32efpS2xzit
	 hOKYdXHPa23ycts65agtObA5TxuLSPB72kFK796OtS4Tc+IKrOhvR17MUndMKJBCVzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5iDhe8q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D46B606A32E
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5iDhe8q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEE51F008A1;
	Fri,  6 Nov 2026 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793968387;
	bh=P4eLX0lfLf3nUSknHmMNmLqItrnDHhDy/LeZ56zMmPw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=l5iDhe8q4oLE1b+olypusbafL2CGkF4KxMFTnbVicV1HnvoZ3vTgUj3uapwJw0Dce
	 kiV5poBOipUaTm2hoPb6In4rP2BnBpEk9b+SxrRmY35wtx7r6crCn0Uf//kqz8/00H
	 C3lLOsYybfn2CuKSwisunTmkZGqCw4Gq/1gwLasl5BpT1VAuFfX+VnjMQx1/Y8kthV
	 93ALizxuLBnCm7i0J//pqMNWvS5f7yqwpsm1Lv1XsDPrKmPeTzDim6YfxrjaTpm3LN
	 5W1YxGvTJEcqfjOruNqq6T3/lfPcCfHNXDD2prkS5ztikNk/tD5D6df/edSa6+snlz
	 6xnDtIBnQL1pA==
Message-ID: <sashiko-outbox-201400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] ASoC: Intel: avs: SoundWire support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261106121557.2338556-6-cezary.rojewski@intel.com>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-6-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:33:06 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: Intel: avs: use-after-free of adev->sdw in
  avs_pci_remove()
- [Medium] ASoC: Intel: avs: uncleaned SoundWire links on
  avs_hda_probe_work() failure
--

commit 838bee43a4741d68e2f300d57b530a29e67bb205
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: SoundWire support

This commit adds SoundWire component enumeration, startup, teardown, and
interrupt handling to the Intel AVS driver.

> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 9413027e1e322..83c19d3e91e65 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -230,6 +231,11 @@ static void avs_hda_probe_work(struct work_struct *w=
ork)
>  	list_for_each_entry(hlink, &bus->hlink_list, list)
>  		snd_hdac_ext_bus_link_put(bus, hlink);
> =20
> +	/* Soundwire component is optional */
> +	ret =3D avs_sdw_probe(adev);
> +	if (ret && ret !=3D -ENODEV)
> +		dev_err(adev->dev, "failed to probe sdw: %d\n", ret);
> +
>  	snd_hdac_ext_bus_ppcap_enable(bus, true);
>  	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
>  	avs_debugfs_init(adev);
> @@ -240,6 +246,14 @@ static void avs_hda_probe_work(struct work_struct *w=
ork)
> =20
>  	acpi_nhlt_get_gbl_table();
> =20
> +	ret =3D avs_sdw_startup(adev);
> +	if (ret) {
> +		dev_err(adev->dev, "failed to startup sdw: %d\n", ret);
> +		return;
> +	}

[Severity: Medium]
Does returning early when avs_dsp_first_boot_firmware() or
avs_sdw_startup() fails leave the SoundWire auxiliary link devices
registered while the DSP and links are powered down?

avs_sdw_probe() registers the soundwire_intel.link.* auxiliary devices and
sets adev->sdw before firmware boot.  If avs_dsp_first_boot_firmware() or
avs_sdw_startup() fails, the links are never powered up via
sdw_intel_startup() and runtime PM is not enabled.  A later
avs_pci_remove() then runs avs_sdw_exit() -> sdw_intel_exit() ->
intel_link_remove(), which calls sdw_cdns_enable_interrupt(cdns, false) and
writes to unpowered link MMIO registers.

[ ... ]

> @@ -579,11 +595,13 @@ static void avs_pci_remove(struct pci_dev *pci)
> =20
>  	acpi_nhlt_put_gbl_table();
>  	avs_debugfs_exit(adev);
> +	avs_sdw_exit(adev);
> =20
>  	if (avs_platattr_test(adev, CLDMA))
>  		hda_cldma_free(&code_loader);
> =20
>  	snd_hdac_stop_streams_and_chip(bus);
> +	avs_sdw_enable_irq(adev, false);
>  	avs_dsp_op(adev, int_control, false);
>  	snd_hdac_ext_bus_ppcap_int_enable(bus, false);

[Severity: High]
Can avs_cnl_dsp_interrupt() dereference adev->sdw after avs_sdw_exit()
frees it?

avs_sdw_exit() calls sdw_intel_exit(adev->sdw), which frees the
sdw_intel_ctx and its link structures, without clearing adev->sdw and
before SoundWire and DSP interrupts are disabled or freed via
pci_free_irq():

CPU0                              CPU1
avs_pci_remove()
  avs_sdw_exit(adev)
    sdw_intel_exit(adev->sdw)
      ...
      kfree(ctx)
                                  avs_dsp_irq_thread()
                                    avs_cnl_dsp_interrupt()
                                      if (adev->sdw)
                                        avs_sdw_thread(irq, adev)
                                          sdw_intel_thread(irq, adev->sdw)
                                            <-- use-after-free

Disabling SoundWire and DSP interrupts (and synchronizing the IRQ or moving
avs_sdw_exit() after pci_free_irq()) before tearing down adev->sdw, and
clearing adev->sdw in avs_sdw_exit(), would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106121557.2338=
556-1-cezary.rojewski@intel.com?part=3D5
