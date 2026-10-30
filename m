Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348998;
	b=l/ULlvSue1b8V9GOWBbUbDUAKQcnagad4nKc2kzK0uLdxdvdgoBOcwgSJv/P4zUR8kOw
	 QN1GJLY9UHI60ijSPzjzsOj9kFG968OnSIu/0fILstrEASKboxVdFGRGAuEK7UrSd+Bz7
	 XcnBmQguCRpNaCbexrcBUpBjs4ndEM+04rLpJQOSV2v1ZmDYC48EPLA5C40mxgQ0eykNE
	 MmOAx2+XUlOWOg5NrMaihG4T1bt2jnLxZzgBzFkPXpQZ8MfN8RcpbIXa9OmiIaxRaHkgD
	 Uiv5cPkHoyuDXHUNe8OMKdLe6Ny+9bprkQYA9emyaD10EqtaZAuwZzWC93oSwIvccew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348998;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sLD9/V0cRyQS4pU+jjbQ3v+RcAH5eUGkPrBdc7l8QMk=;
	b=U6nFcLh6FBiZhifXb67vcrq7ywedAD0os4US4qARnkrBRH5Dlf3s9dV19h7M2KZZYjB1
	 //lqDGrch75zWk0JDr1L4g6IB967dzQY0vEii+w9+wzKSPay6dWqvO14U1DCVay8VY8Rr
	 WC1yAkLDmzb8dzsdyUUkvbifSvVMJFJwGtIkywid4SxYMK4TGfCEkg2gcy89TQX0hSJJc
	 yW3JeAo1r2nLrtZRsTMzVacDzUl/JrDkBrlvCWmrMGnqLsg1C+BsXsjH+11dKCRO4zP98
	 ASfHQ4VTZObStIQHWvp9JP/T/CoZQDU8ivHiCFJxgVv+mPby/MEfL2sPSrVEMmtg3lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mx9lnXOR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83F606A320
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mx9lnXOR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A63A1F0093A;
	Fri, 30 Oct 2026 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793348998;
	bh=sLD9/V0cRyQS4pU+jjbQ3v+RcAH5eUGkPrBdc7l8QMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mx9lnXORF+YnyT8n93JpgCv9xYkWIvna2dqOZH9YL88DhNXJQqr57i1KQC0Qb8lBG
	 mfCzXc9gjlqrswZ41lXfGK7V7GOa/aOxzlaw6vJUrbmpreY3FVBcwo4aJ0S/LAD69i
	 wGUhB4gv4s82knY2wo+gbTS9ut/+ZHrLDYpUm3tVznB925T9RYsJMiRzGYYRbrarGg
	 JCjLFRm3d1oN5bEG7KtpsIyYr9M8qktZ+TF47vD8Y6Ic4c5Zrr5HhOUH2rp+7uv6ik
	 iymEyySPsm4ci37XAi+1AJLYsgTIC3OMSXRleBC8Bm0EALm+LbQqsYB6Sm2WLUiTuo
	 /p42RF1rDUiDQ==
Message-ID: <sashiko-outbox-190692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] ALSA: hda: Serialize codec probe and remove on
 the same bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cen Zhang" <zzzccc427@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-1@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-0@gmail.com>
 <pm-pmb-a4703edca61d34aa679b-v11-d9186d19e8afb48972af-1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:29:57 +0000
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
- [High] ALSA: hda: unlocked snd_card_register() races with codec bind and =
unbind
- [Low] ALSA: hda: guard(mutex) mixed with goto cleanup in hda_codec_driver=
_probe()
--

commit 98315c01897e919f38855a83f81646c5e30c2565
Author: Cen Zhang <zzzccc427@gmail.com>

ALSA: hda: Serialize codec probe and remove on the same bus

This commit adds codec_bind_lock to struct hdac_bus and acquires it in
hda_codec_driver_probe() and hda_codec_driver_remove() to serialize
snd_card_register() against concurrent codec removal modifying card->devices
on the same HD-audio bus.

> diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
> index 957feace0f58e..abbb3b64ec090 100644
> --- a/sound/hda/common/bind.c
> +++ b/sound/hda/common/bind.c
> @@ -104,6 +104,12 @@ static int hda_codec_driver_probe(struct device *dev)
>  	if (WARN_ON(!codec->preset))
>  		return -EINVAL;
> =20
> +	/*
> +	 * snd_card_register() below walks the device list of the card, which
> +	 * the removal of another codec changes when it frees its PCMs.
> +	 */
> +	guard(mutex)(&codec->bus->core.codec_bind_lock);

[Severity: High]
Can card->devices still be corrupted when snd_card_register() is called
outside hda_codec_driver_probe() while another codec on the same bus is
concurrently bound or unbound through sysfs?

In sound/hda/common/sysfs.c, reconfig_codec() calls device_reprobe(), which
acquires and releases codec_bind_lock inside hda_codec_driver_probe(), and
then calls snd_card_register() without holding codec_bind_lock:

sound/hda/common/sysfs.c:reconfig_codec() {
	...
	err =3D device_reprobe(hda_codec_dev(codec));
	if (err < 0)
		return err;
	return snd_card_register(codec->card);
}

Similarly, the controller probe paths in sound/hda/controllers/intel.c
(azx_probe_continue()), sound/hda/controllers/cix-ipbloq.c
(cix_ipbloq_hda_probe_codec()), sound/hda/controllers/tegra.c
(hda_tegra_probe_work()), and sound/hda/controllers/acpi.c
(hda_acpi_probe_work()) register codec devices via azx_codec_configure()
and then call snd_card_register(chip->card) without holding codec_bind_lock
(and in tegra.c and acpi.c without setting bus_probing).

If another codec on the same bus is unbound or bound via sysfs at the same
time, hda_codec_driver_remove() -> snd_hda_codec_cleanup_for_unbind() ->
codec_release_pcms() -> snd_device_free() or hda_codec_driver_probe() ->
snd_hda_codec_build_pcms() -> snd_pcm_new() -> snd_device_new() will mutate
card->devices and free struct snd_device entries while the unlocked
snd_card_register() -> snd_device_register_all() walks card->devices.

> +
>  	err =3D snd_hda_codec_set_name(codec, codec->preset->name);
>  	if (err < 0)
>  		goto error;

[Severity: Low]
This isn't a bug since guard(mutex) is declared before any jump, but
hda_codec_driver_probe() in sound/hda/common/bind.c still uses goto error,
goto error_module_put, and goto error_module for cleanup:

sound/hda/common/bind.c:hda_codec_driver_probe() {
	...
 error_module:
	snd_hdac_device_disable_unsol(&codec->core);
	cancel_delayed_work_sync(&codec->jackpoll_work);
	if (probed && driver->ops->remove)
		driver->ops->remove(codec);
 error_module_put:
	module_put(owner);

 error:
	snd_hda_codec_cleanup_for_unbind(codec);
	codec->preset =3D NULL;
	return err;
}

Per the cleanup.h guidelines on not mixing guard() with goto error handling
in the same function, could the probe body be factored into a helper called
under guard(mutex), or use explicit mutex_lock() and mutex_unlock() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/pm-pmb-a4703edca61d=
34aa679b-v11-d9186d19e8afb48972af-0@gmail.com?part=3D1
