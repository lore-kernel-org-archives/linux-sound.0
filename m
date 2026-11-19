Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106752;
	b=xMMXeFtCAi8cMUGtI3zDfh/lU1Vnf0spOa0MqcVkH2LU2f8MFYs2ACrcW80q0g5K2x/J
	 LTucTZeAm0+UBa2Rug6ora8maBT+Q/U4EmUNz/zko9VW/pZTx9GC3pVK0K53sTbinReSu
	 0zvKoAf+uNmHAZpkmRWPy4Fpg4hq8F+KtdCQRxn+GPsqqMO19LQ3Ijkakbw3/GsezpKrE
	 vOS86q/UP73bkh0os15t1Ua8RiGGtOv50vLPKzj3Xt+7mD6cGTiVBqjCPMhnsYVgwo2er
	 JJlw9Pi1EitUJ/YU+LR3c7NUEQxINDHt61l8t6xfdcmYg8v93GRX27glVBI5pmuVsGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fpMkQmMfepnIy494Db9AptzrlhmU/tvCJCPNqBtnwIA=;
	b=J3rCgXi0q7gC/TcAm1oVUD0TBouaYZl74bp7bFf9ZJM+bq8IP3ddyI7Mdx1y+dxMkU7u
	 kbExJqH9Si7cnuRU2Sl/H4LqkTkK5kdtRFs2zZOvvzV0brEF7X9Gp0jUxGLEceZ5k0Htr
	 9pjG81BUAL98Io98LucDlPFiUqHAShJ4rfltCNBmuCYWORO0dLcbn2Io1m+Wadu6J2EZw
	 ZhrzUORU6qEL1OGrnDIhLS3kcJT2b7VBk8cUKqTeVgSrjnkQ5KwlhBax5wCgtyuYjSVdk
	 HxqjOxnJ5tkjhZ47wdCHwDdmTNlvcFtEU6ZKR1eMqHptbdJOOsxA2QeUdakYfNXmr5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IU67W0t4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CC5606A326
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IU67W0t4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5791F000C7;
	Thu, 19 Nov 2026 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106752;
	bh=fpMkQmMfepnIy494Db9AptzrlhmU/tvCJCPNqBtnwIA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IU67W0t4T78BkNSL9Ftx5SYafOPtQLOCt85zsfDlWLnfF92TKpvmi+TWrHQ96iHIT
	 w+vRRDfPSqdQWBp8NDe4IXDa5K6JLoTpFFUfIhRiPLEQOwTBppYzNPseew4ihIe1x1
	 3mI6k5DUg16yPR03sTPGvUXK0B37M0qoDIACo7s9soW8QkMcjR73njdvDZf7oybleZ
	 pqqGyrp+K/xAzqP9OeFKiaZ8GoebtR+KUQ+shUfWvOB4zqfrsI0OBouEpAHJmIs5DY
	 51uVs6YE6d08hoj3/iuWf3jM6/pp431fTfDVNG3Db+QZUKB377ivz6hGDyRW4wH+2L
	 MNJD2y+xVKXnA==
Message-ID: <sashiko-outbox-223560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: Release i915 component when delayed
 probe fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kai Vehmanen" <kai.vehmanen@linux.intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261119162253.1779252-1-kai.vehmanen@linux.intel.com>
References: <20261119162253.1779252-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:45:51 +0000
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
- [Medium] ALSA: hda: intel: azx_probe_work() drops display power before
  stopping chip
- [Medium] ALSA: hda: intel: azx_probe_work() exits i915 while codecs
  remain registered
--

commit 8668fbf5bb132662ae06081f1c3f17768cfd79c9
Author: Kai Vehmanen <kai.vehmanen@linux.intel.com>

ALSA: hda: intel: Release i915 component when delayed probe fails

This commit releases display power and exits the i915 audio component in
azx_probe_work() when azx_probe_continue() fails, so the graphics driver
is not kept bound until azx_remove() frees the card.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17751

> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 0a62723b34549..73ff42faccb77 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -1740,9 +1740,21 @@ static void azx_probe_work(struct work_struct *wor=
k)
>  	struct hda_intel *hda =3D container_of(work, struct hda_intel, probe_wo=
rk.work);
> =20
>  	if (azx_probe_continue(&hda->chip, false) < 0) {
> +		struct azx *chip =3D &hda->chip;
> +
>  		hda->init_failed =3D 1;
>  		complete_all(&hda->probe_wait);
> -		snd_card_disconnect(hda->chip.card);
> +		snd_card_disconnect(chip->card);
> +
> +		/*
> +		 * The card itself is left to azx_remove() to free, but the
> +		 * graphics driver must not be kept bound to a controller that
> +		 * will never become operational; this would e.g. block
> +		 * unloading i915. Both calls are safe to repeat from azx_free().
> +		 */
> +		display_power(chip, false);
> +		if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT)
> +			snd_hdac_i915_exit(azx_bus(chip));

[Severity: Medium]
Should the controller be stopped before dropping display power and exiting
the i915 component?

When azx_probe_continue() fails after azx_first_init() (for example in
azx_probe_codecs() or azx_codec_configure()), hda_intel_init_chip() has
already started CORB/RIRB DMA, enabled controller interrupts, and set
bus->chip_init =3D true.  Unlike __azx_shutdown_chip() and azx_free(), this
path releases display power while the controller is still running.

On platforms where the HDA controller sits in the GPU display power domain
(hda->need_i915_power), powering down the domain with DMA active leaves
bus->chip_init set, so when azx_remove() later runs azx_free(), it accesses
and polls controller MMIO registers after display power and the i915
component have already been released:

sound/hda/controllers/intel.c:azx_free() {
	...
	if (bus->chip_init) {
		azx_clear_irq_pending(chip);
		azx_stop_all_streams(chip);
		azx_stop_chip(chip);
	}
	...
}

[Severity: Medium]
Can exiting the i915 component here trigger WARN_ON(bus->display_power_acti=
ve)
or leave codec devices registered on the bus without an audio component?

snd_card_disconnect() does not unregister or free SNDRV_DEV_CODEC devices.
If azx_probe_continue() fails in snd_hda_card_register() after
snd_hda_codec_register() has enabled per-codec display power via
snd_hda_codec_display_power(codec, true), display_power(chip, false) only
clears HDA_CODEC_IDX_CONTROLLER in bus->display_power_status.  The codec's
bit remains set until snd_card_free() runs in azx_remove(), so
snd_hdac_i915_exit() -> snd_hdac_acomp_exit() hits
WARN_ON(bus->display_power_active).

In addition, when azx_codec_configure() fails for all codecs (success =3D=
=3D 0),
codec->core.dev stays registered on snd_hda_bus_type and in sysfs after
bus->audio_component is torn down, allowing late codec driver binding or
sysfs reconfig_codec() to run against a controller with no display power or
audio component.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119162253.1779=
252-1-kai.vehmanen@linux.intel.com?part=3D1
