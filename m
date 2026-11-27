Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798931;
	b=zkfNnHrld32XCfWl8C66uhYkyNeHckw+tn7CTf+O+9EZ6yEYwWHWtgwxfIFdM6BL3iBL
	 qCNzoa9dfVIaZxc1VqfyVPD/UuZNmGus/k9er70TyMnbHKCdoqOn3wEFNwQGxk1ShFz97
	 gUUeWGi5SkQiA62geOLoRXZsgUSFgsqItuqBuy69wWEO4FpwiriPKWCbn3sY7XWB7HBvC
	 J+ZUJdDRoZFkBU+dfhBQ5PiDlnt2yvVWYpXItQiGMQpj1sDHAH7CTjtDr3kiCU7UDmwdp
	 pv4WGuCRnLguAxVQCLmVzbQgCC+dRv8Vn+4hbeJ4rCKzxUOkB/c1V42BIc5hMoOozGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iOZymwTVufX2M7zrtnLfRMMoofZCFuwnFlZu34Cain0=;
	b=FhU7P2zCo5c94FOHwSaBhXcwrVpRUbRk7zwFSLqgnYjLZBpDKNPFquhrYWPnGa6cSGl0
	 yaIAp7PgSBdlAXSyHSfqHISZRkKvAuwg+y+ka4m2GIFvN/JZdO4lMJ5WSpIMdXKKHDlx8
	 dtIZ9OvQZM5eBywKFVs9P3yx3nj1DEvdDOZ4/kSRz7R69I2niF4X3JfPAEOV2q4OE/bhB
	 UrIBe+WfomjM6CyKd6FfgzMtbJ280gPBARniTxlLp5HhVKvuGNzbC+84cfYnEGPvt5pzb
	 MmJu/5QFfP2PEI54/ERfiAoHT1eMYjz/xHpbGgJKX+3hpM6IboOlnq5RgdPL44jh7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsvqYsx7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3535606A335
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XsvqYsx7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4554C1F00A1B;
	Fri, 27 Nov 2026 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798931;
	bh=iOZymwTVufX2M7zrtnLfRMMoofZCFuwnFlZu34Cain0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsvqYsx7Wp31xQoU0VCjiRSGNbR45sHP88afYPZND3JS6Vka2RUBLjBj/CAzOIQ/U
	 YTqzYmTkOg9lLB2sh0TOR+ZohZLSy/jraXJblOZO7JxWjShkh3UqM7dJ3iu9DwBuLp
	 UiB7Pc7Xxdaay5Z6vG1MvOOnmkvvST8tX6CirciQ5+kz9rNA9vfdgbuVH0Z27Nm9sr
	 O+lqYnOERwHZUGr+xxRSWL6HW74kMiofb3LjQmsfutjeR/ZfybB4dnReFV7MNdJ0Z4
	 yeDCYZgVBVZjajogeu54V0q2txZd/yRZ+gTHtdTpjZbXWTxC/25z2/K0dv3nQh2+Db
	 etm404MvuVf6Q==
Message-ID: <sashiko-outbox-237958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: tegra: Consolidate remaining separate
 codec machine drivers into tegra_asoc_machine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127164436.292585-2-clamor95@gmail.com>
References: <20261127164436.292585-1-clamor95@gmail.com>
 <20261127164436.292585-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 17:02:10 +0000
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
- [High] ASoC: tegra: unintended mic jack setup in
  tegra_asoc_machine_init()
- [High] ASoC: tegra: NULL pointer dereference in
  tegra_asoc_machine_remove()
--

commit c80741097ea3e7b489563814d70191ee1199c6c6
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: tegra: Consolidate remaining separate codec machine drivers into tegr=
a_asoc_machine

This commit merges the standalone WM8903, WM8962, and WM8994 machine
drivers into tegra_asoc_machine.c and removes their separate source files.

> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra=
_asoc_machine.c
> index c4e62e2b7fd07..0e0830d2733b9 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c

[ ... ]

> @@ -190,7 +218,7 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtim=
e *rtd)
>  			dev_err(rtd->dev, "Headset GPIOs not added: %d\n", err);
>  	}
> =20
> -	if (machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
> +	if (machine->asoc->add_mic_jack) {
>  		err =3D snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
>  						 SND_JACK_MICROPHONE,
>  						 &tegra_machine_mic_jack,
> @@ -201,24 +229,45 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runt=
ime *rtd)
>  			return err;
>  		}
> =20
> -		tegra_machine_mic_jack_gpio.data =3D machine;
> -		tegra_machine_mic_jack_gpio.desc =3D machine->gpiod_mic_det;
> -
> -		if (of_property_read_bool(card->dev->of_node,
> -					  "nvidia,coupled-mic-hp-det")) {
> -			tegra_machine_mic_jack_gpio.desc =3D machine->gpiod_hp_det;
> -			tegra_machine_mic_jack_gpio.jack_status_check =3D coupled_mic_hp_chec=
k;
> +		if (machine->gpiod_mic_det) {
> +			tegra_machine_mic_jack_gpio.data =3D machine;
> +			tegra_machine_mic_jack_gpio.desc =3D machine->gpiod_mic_det;
> +
> +			if (of_property_read_bool(card->dev->of_node,
> +						  "nvidia,coupled-mic-hp-det")) {
> +				tegra_machine_mic_jack_gpio.desc =3D machine->gpiod_hp_det;
> +				tegra_machine_mic_jack_gpio.jack_status_check =3D coupled_mic_hp_che=
ck;
> +			}
> +
> +			err =3D snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
> +						     &tegra_machine_mic_jack_gpio);
> +			if (err)
> +				dev_err(rtd->dev, "Mic GPIOs not added: %d\n", err);
> +		} else {
> +			if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
> +				shrt =3D SND_JACK_MICROPHONE;
> +
> +			snd_soc_component_set_jack(component, machine->mic_jack,
> +						   shrt ? &shrt : NULL);
>  		}
> -
> -		err =3D snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
> -					     &tegra_machine_mic_jack_gpio);
> -		if (err)
> -			dev_err(rtd->dev, "Mic GPIOs not added: %d\n", err);
>  	}

[Severity: High]
Does dropping the machine->gpiod_mic_det check here break mic routing and
jack teardown on non-Wolfson boards that set add_mic_jack =3D true without
an nvidia,mic-det-gpios property?

tegra_max98090_data, tegra_max98088_data, tegra_rt5677_data, and
tegra_rt5631_data all set add_mic_jack =3D true.  When gpiod_mic_det is NULL
(for example on arch/arm/boot/dts/nvidia/tegra124-venice2.dts),
snd_soc_card_jack_new_pins() now unconditionally creates
tegra_machine_mic_jack and disables the "Mic Jack" and "Headset Mic" DAPM
pins.

On MAX98088, RT5677, and RT5631, the codec does not implement set_jack, so
those DAPM pins stay permanently disabled.  On MAX98090,
max98090_set_jack() stores max98090->jack and enables jack detection work,
but snd_soc_tegra_max98090 has no teardown callback to clear it on card
removal, leaving a dangling pointer in max98090->jack.

Also, passing &shrt (with SND_JACK_MICROPHONE =3D=3D 2) as the data pointer=
 to
snd_soc_component_set_jack() is specific to WM8903: wm8994_set_jack()
interprets *(int *)data as the 1-based MICBIAS index rather than a jack
report mask.

> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(tegra_asoc_machine_init);
> +
> +static int tegra_asoc_machine_remove(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *link =3D &card->dai_link[0];
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_get_pcm_runtime(card, link);
> +	struct tegra_machine *machine =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component =3D codec_dai->component;
> +
> +	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack)
> +		snd_soc_component_set_jack(component, NULL, NULL);
> +
> +	return 0;
> +}

[Severity: High]
Will tegra_asoc_machine_remove() always hit a NULL pointer dereference on
rtd?

During card teardown, snd_soc_card_cleanup_resources() removes and frees
every PCM runtime from card->rtd_list before calling card->remove():

sound/soc/soc-card.c:snd_soc_card_cleanup_resources() {
    ...
	for_each_card_rtds_safe(card, rtd, n)
		snd_soc_remove_pcm_runtime(card, rtd);
    ...
	/* remove the card */
	snd_soc_card_remove(card);
}

By the time tegra_asoc_machine_remove() runs, snd_soc_get_pcm_runtime()
returns NULL, so rtd->card and snd_soc_rtd_to_codec(rtd, 0) crash
immediately and the codec jack is never cleared.  Detaching the jack in a
snd_soc_dai_link.exit callback would run while rtd and the codec component
are still active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127164436.2925=
85-1-clamor95@gmail.com?part=3D1
