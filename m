Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375604;
	b=mm4PzV5mOq7e6MsiNV5ACEayDR+jptOIZYAcOy1+vS47u7FM2tVf+FXXGI6EHzHxOc9E
	 wZcQQIgRizkTv22IN/p4P/D/+ExXA4DiNt1u1NCG5ppsg5Yrz2EwBYr8sxEbVmU3PvQL2
	 MJv+UHOYdg1ZDEoVdQo7jdh3Oew2MAtf+tAf8aoPym+YX8GUsZg42yopFyywb3Jt4vIRW
	 p3Fx+3lUnHWt/Lr5lrfYpxoD42DD3o4YheLOITMMANG8sm543FHKSigvo/sxpbB1clRDk
	 bjV4cybpa8rvb3t64FLyW2Wj8mTg0FHJqyzvRJk0XgsAXuzywgmaIhrQTvSWQUzRsKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375604;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4AP7emP+SAvkD+Lv7OHDR/ZktcZ7vA/k/MqGFEMk1TU=;
	b=AMw7YzrXtKuTZBpHVCcSoAKshcj25/ARn3ZJujKoBMsJH90uLFv9YFZV5IzlBvTzb5hx
	 ExI6d/bWVfEZW3uzzyv61x9DyOL5WSZDcuAx5uCR89Ab2gVzey7MXtgrjYvvuzMQ9OUhJ
	 A1a2OeUCxZ04rQ9oVND+uxFmoAyJTh4BETkpXBaQjEYJu9TU0H7/JKSPnniSRIdn6Bfsm
	 3OR9iaq9iceNrHn9LQZDgDiR8pVIziJJXPZXDcAIdHiaUBY+d5dXFZ+f5Nnl0jyta7jZa
	 E+WczUNyhoOBQ++BOkBVz9QXK9E22gyqpO3OAB1hJpHloaY3/dFbKFkTpokNoNJgodg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nHjksHo8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CD606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nHjksHo8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BE81F000C1;
	Fri, 30 Oct 2026 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793375604;
	bh=4AP7emP+SAvkD+Lv7OHDR/ZktcZ7vA/k/MqGFEMk1TU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHjksHo84/7MPfPHZCksHZKfYXtyK4j6vbSXhpGdK5wDQKstQai5+ijhVVCRT1Yqu
	 +Ox9h1sNY+MqAVwflXFVqZcg1kCODUD82TavGFuM0Jo0SDK1FUybz/7nIqSLGVA+hC
	 U1BSy25EcCHLD2p7U0YOa33TTn7ZGHIhcTGKsdY7afddXJCARHeVhKZE6fEyaiRFer
	 ims1q2aes5Gwq5hM/T9MmEJahUCKKD/OV873jNwpDEKTJcGdjR5ZR51QruUHMrFJpW
	 sR9iv51YJnyHLOeTf8pHykClAFMD+bVbtAZ2lkp/xrmd1V/RGHdBfouqmK9SO2nJz1
	 uKg+R5vpUfCCw==
Message-ID: <sashiko-outbox-191194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] ASoC: rt5659: cancel jack_detect_work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030154202.2989936-3-tristan@talencesecurity.com>
References: <20261030154202.2989936-1-tristan@talencesecurity.com>
 <20261030154202.2989936-3-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 15:53:23 +0000
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
- [High] ASoC: rt5659: uncancelled jack_detect_work on I2C teardown without=
 card
- [High] ASoC: rt5659: broken jack detect and dangling hs_jack in rt5659_pr=
obe()
--

commit 2bb6cdac1d7b83279322bc0304f15b740f1928f7
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5659: cancel jack_detect_work on component removal

This commit disables the codec IRQ and cancels pending jack_detect_work in
rt5659_remove() before resetting the codec, and re-enables the IRQ in
rt5659_probe() when a component is rebound.

> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index af8051fa69f89..68f7d5673e190 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c
> @@ -3667,6 +3667,11 @@ static int rt5659_probe(struct snd_soc_component *=
component)
> =20
>  	rt5659->component =3D component;
> =20
> +	if (rt5659->irq_disabled) {
> +		enable_irq(to_i2c_client(component->dev)->irq);
> +		rt5659->irq_disabled =3D false;
> +	}

[Severity: High]
As reported by Sashiko on v2 [1], does re-enabling the IRQ in rt5659_probe()
restore jack detection or leave a dangling rt5659->hs_jack pointer on card
rebind?

At the end of rt5659_remove(), writing RT5659_RESET resets all codec hardwa=
re
registers to defaults, wiping out the GPIO1 IRQ pin mux (RT5659_GP1_PIN_IRQ=
 in
RT5659_GPIO_CTRL_1) and the jack-detect and IRQ registers (RT5659_EJD_CTRL_=
1,
RT5659_RC_CLK_CTRL, RT5659_JD_CTRL_1, RT5659_IRQ_CTRL_1, RT5659_IRQ_CTRL_2,
RT5659_PWR_ANLG_1, and RT5659_PWR_ANLG_2) that were only configured in
rt5659_i2c_probe(). Because RT5659_RESET is volatile in
rt5659_volatile_register(), the REGCACHE_RBTREE regmap cache is also not
marked dirty or resynced on re-probe, so the codec cannot generate jack
detection interrupts after rebind.

In addition, rt5659_remove() does not clear rt5659->hs_jack or
rt5659->component. When a sound card unbinds and its card-owned struct
snd_soc_jack is freed, a subsequent card bind invokes
snd_soc_component_probe() -> rt5659_probe() before the machine driver's init
callback registers a new jack. Calling enable_irq() here while rt5659->hs_j=
ack
still points to the freed jack from the previous card allows any interrupt =
to
schedule jack_detect_work, which passes the dangling rt5659->hs_jack pointer
to snd_soc_jack_report():

sound/soc/codecs/rt5659.c:rt5659_jack_detect_intel_hd_header() {
	...
	if (!rt5659->hs_jack)
		return;
	...
	snd_soc_jack_report(rt5659->hs_jack, rt5659->jack_type,
		SND_JACK_HEADSET);
}

> =20
>  	switch (rt5659->pdata.jd_src) {
>  	case RT5659_JD_HDA_HEADER:
>  		break;
> @@ -3684,6 +3689,15 @@ static int rt5659_probe(struct snd_soc_component *=
component)
>  static void rt5659_remove(struct snd_soc_component *component)
>  {
>  	struct rt5659_priv *rt5659 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> +
> +	if (rt5659->irq_acquired) {
> +		disable_irq(i2c->irq);
> +		rt5659->irq_disabled =3D true;
> +	}
> +
> +	if (rt5659->jack_detect_work_inited)
> +		cancel_delayed_work_sync(&rt5659->jack_detect_work);
> =20
>  	regmap_write(rt5659->regmap, RT5659_RESET, 0);
>  }

[Severity: High]
As reported by Sashiko on v2 [2], can rt5659->jack_detect_work still remain
queued and cause a use-after-free of struct rt5659_priv and rt5659->regmap
when the I2C device is unbound without a bound sound card?

In rt5659_i2c_probe(), when rt5659->pdata.jd_src is RT5659_JD3 or
RT5659_JD_HDA_HEADER, the driver initializes rt5659->jack_detect_work,
configures the jack-detection interrupt registers, registers rt5659_irq() v=
ia
devm_request_threaded_irq(), and enables RT5659_GP1_PIN_IRQ before calling
devm_snd_soc_register_component(). Once the IRQ is registered, an interrupt=
 on
i2c->irq runs rt5659_irq() and queues rt5659->jack_detect_work on
system_power_efficient_wq with a 250 ms delay.

However, disable_irq() and cancel_delayed_work_sync() are only placed in
rt5659_remove(), which is the snd_soc_component_driver remove callback. In =
the
ASoC core, component removal skips the driver remove callback whenever no c=
ard
is bound to the component:

sound/soc/soc-core.c:snd_soc_del_component_unlocked() {
	...
	if (card) {
		instantiated =3D card->instantiated;
		snd_soc_unbind_card(card);
		if (instantiated)
			list_add(&card->list, &unbind_card_list);
	}
}

sound/soc/soc-component.c:snd_soc_component_remove() {
	if (!component->card)
		return;

	if (probed && component->driver->remove)
		component->driver->remove(component);
	...
}

If devm_snd_soc_register_component() fails in rt5659_i2c_probe(), or if the
I2C device is unbound while component->card is NULL, rt5659_remove() is nev=
er
called and devres frees the IRQ, regmap, and struct rt5659_priv while
rt5659->jack_detect_work is still pending or running. Similarly,
rt5659_i2c_shutdown() resets the codec via RT5659_RESET without disabling t=
he
IRQ or cancelling rt5659->jack_detect_work.

Would registering the delayed work with devm_delayed_work_autocancel() (or
handling teardown at the I2C driver level) ensure the work is always cancel=
led
after the IRQ is freed on all unbind paths?

[1] https://lore.kernel.org/r/20261029212504.2997364-3-tristmd@gmail.com
[2] https://lore.kernel.org/r/20261029212504.2997364-3-tristmd@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030154202.2989=
936-1-tristan@talencesecurity.com?part=3D2
