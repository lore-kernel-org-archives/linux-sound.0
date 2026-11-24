Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497438;
	b=PCIMLWcIMOYkAD4eQGN25A5NkVmMMMPRLPxIMLRjhCK0bIGgz3DabD/6k3Nbgt5/J4a0
	 FJZzzuX3I9NgaAIr2dx60maHY7LEXovCHchd447pbMe92g+ygLlBoSMlFKl98Y8l+68oo
	 Fc9wNln+QRvPs02NixTVbMWySuABtVbFzTdP0i8/YCbkkVlaMTtTzsXlZ6sUrPooSy7Fz
	 mjV4KCk3Od2ijS4Ww3qpohihHOVCi26XCVNxF89B76BQXtj/ayRA9xGHmrwYYbesyqjnD
	 pRcd5+dGdIR6IX0Rk8z2ZXJod7sJ8CUQuNXnbHv0JfRRj/PuFCeT/Az3GJtjR3Ui4og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497438;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gyEioPP7a4AfHXqXmUodzX4Eo7jHpbr/S8hBnevh2XE=;
	b=I7+SSzBxPrF8Psu/0uO6FmTiT4pKU9d8O9jnRjvuoaXJrv/9sQ83j2UM/JLOYqR6Ohil
	 Oxw3kI+mkIfLTSkaKR7cnsGGmclSNZR1sz7J1YAtDAbX2t+OizneHnbrRBwJIvRxJC2Ps
	 msfKVWRY18IXTrsXOW3qyIKe40IH3B8IVQaawn72MfHhfx1BRHMjHHJGC7MzThzhz/8v7
	 6bl6Q5FCKwp5VLin8JWlOTQa10OOVnbuX5nG8LXxtXgk1K6P7gZdSgrw3oQ0QzvKnEjGt
	 46wvc92EMf51MJ4yYQggr6WUrRT+3fVzBflAUvEQyqvNpvYow7fFtIN1frS1RuJKPEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8UGD6ZA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9A606A32A
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8UGD6ZA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6996A1F000D1;
	Tue, 24 Nov 2026 05:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795497438;
	bh=gyEioPP7a4AfHXqXmUodzX4Eo7jHpbr/S8hBnevh2XE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8UGD6ZASwVBwkzjR+Xph0Bw1w4fclhSdGTXwup7ngGZr/4yL9/wlfgibxFxSNBFQ
	 AGb2Gv6aXHhFVb9AEZwmhso/ufzAS5N1T8S1WI4L+fEeoyf3+VqvLiCXB4KacP9NjY
	 JRqBTWGzvw19hx+JJpxqhR9MbWMn/Vb22LsYHyG9NYJae53oH61ZzjFjkjpSMfCM3J
	 A+74qgoQ0m6egOH64GuByhcoTZvwD0ag0KAglVcL1f4qQiFh+raqbbHrdx8h19Xmf7
	 EBZ0zWzWJrJeJCd2UpoT6YKdU9Y/7vln6AbVF9qS6/KyV1d/3LABvnBct9NnKrVmu7
	 Xrz3SyUnt9hVQ==
Message-ID: <sashiko-outbox-230548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: arizona: Disable jack detection when the
 component is removed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suyuan Wang" <shyckless@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261124-arizona-jack-remove-v1-1-11d8ec426a41@gmail.com>
References: <20261124-arizona-jack-remove-v1-1-11d8ec426a41@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 05:17:17 +0000
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
- [Medium] ASoC: arizona: GPIO UAF in arizona_jack_codec_dev_remove() on
  codec unbind
- [Medium] ASoC: arizona: stale jack and HPDET state in
  arizona_jack_disable_jack_detect()
--

commit 64c10974d73769b43875985100c8e416d589c894
Author: Suyuan Wang <stevewong@hust.edu.cn>

ASoC: arizona: Disable jack detection when the component is removed

This commit calls arizona_jack_set_jack(component, NULL, NULL) in the
component_remove callbacks of the wm5102, wm5110, wm8997, and wm8998
codec drivers to disable jack detection on teardown.

> diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
> index 762e81979cb8d..43df7cb46b599 100644
> --- a/sound/soc/codecs/wm5102.c
> +++ b/sound/soc/codecs/wm5102.c
> @@ -1982,6 +1982,8 @@ static void wm5102_component_remove(struct snd_soc_=
component *component)
>  {
>  	struct wm5102_priv *priv =3D snd_soc_component_get_drvdata(component);
> =20
> +	arizona_jack_set_jack(component, NULL, NULL);
> +
>  	wm_adsp2_component_remove(&priv->core.adsp[0], component);
> =20
>  	priv->core.arizona->dapm =3D NULL;
> diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
> index faa85d88a489b..c772f4380ae7d 100644
> --- a/sound/soc/codecs/wm5110.c
> +++ b/sound/soc/codecs/wm5110.c
> @@ -2340,6 +2340,8 @@ static void wm5110_component_remove(struct snd_soc_=
component *component)
>  	struct wm5110_priv *priv =3D snd_soc_component_get_drvdata(component);
>  	int i;
> =20
> +	arizona_jack_set_jack(component, NULL, NULL);
> +
>  	for (i =3D 0; i < WM5110_NUM_ADSP; ++i)
>  		wm_adsp2_component_remove(&priv->core.adsp[i], component);
> =20
> diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
> index f041dfc905a42..aa9f23ddd9975 100644
> --- a/sound/soc/codecs/wm8997.c
> +++ b/sound/soc/codecs/wm8997.c
> @@ -1077,6 +1077,8 @@ static void wm8997_component_remove(struct snd_soc_=
component *component)
>  {
>  	struct wm8997_priv *priv =3D snd_soc_component_get_drvdata(component);
> =20
> +	arizona_jack_set_jack(component, NULL, NULL);
> +
>  	priv->core.arizona->dapm =3D NULL;
>  }
> =20
> diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
> index 1158e9ca40a13..47adbcd80e077 100644
> --- a/sound/soc/codecs/wm8998.c
> +++ b/sound/soc/codecs/wm8998.c
> @@ -1301,6 +1301,8 @@ static void wm8998_component_remove(struct snd_soc_=
component *component)
>  {
>  	struct wm8998_priv *priv =3D snd_soc_component_get_drvdata(component);
> =20
> +	arizona_jack_set_jack(component, NULL, NULL);
> +
>  	priv->core.arizona->dapm =3D NULL;
>  }

[Severity: Medium]
When a codec platform device is unbound while a card is bound, can a jack
IRQ or delayed work use info->micd_pol_gpio or info->hpdet_id_gpio after
they have been freed?

The codec drivers register their ASoC components with
devm_snd_soc_register_component(), whereas their platform_driver.remove
callbacks call arizona_jack_codec_dev_remove() directly.  Because
snd_soc_card_bind() creates a stateless device link, unbinding the codec
runs platform_driver.remove before devres_release_all() unregisters the
component and invokes component_remove:

CPU0                              CPU1
wm5102_remove()
  arizona_jack_codec_dev_remove()
    gpiod_put(info->micd_pol_gpio)
    gpiod_put(info->hpdet_id_gpio)
                                  arizona_hpdet_irq()
                                    gpiod_set_value_cansleep(
                                      info->hpdet_id_gpio, 0)
                                      <-- use-after-free
devres_release_all()
  ...
    wm5102_component_remove()
      arizona_jack_set_jack(..., NULL, NULL)

Calling arizona_jack_disable_jack_detect() inside
arizona_jack_codec_dev_remove() before dropping the GPIO descriptors
(while keeping the call in component_remove for card unbind) would close
this window.

[Severity: Medium]
If the card is unbound and bound again while a jack is plugged in, does
stale state in struct arizona_priv prevent the newly bound card from
detecting the jack?

info->last_jackdet is only initialized in arizona_jack_codec_dev_probe(),
and neither arizona_jack_disable_jack_detect() nor
arizona_jack_enable_jack_detect() resets info->last_jackdet or
info->hpdet_done.  When the card is rebound and sets a new snd_soc_jack,
arizona_jackdet() sees val =3D=3D info->last_jackdet and suppresses the eve=
nt
instead of reporting the inserted jack, and stale info->hpdet_done causes
arizona_identify_headphone() to skip headphone detection.

In addition, if arizona_jack_disable_jack_detect() runs while an HPDET
measurement is in flight (info->hpdet_active is true), freeing
ARIZONA_IRQ_HPDET prevents arizona_hpdet_irq() from clearing
arizona->hpdet_clamp and dropping the pm_runtime_get_sync() reference
taken when starting HPDET.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-arizona-ja=
ck-remove-v1-1-11d8ec426a41@gmail.com?part=3D1
