Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894141;
	b=E8EZS9P9WKDwxE7bzkFRaVvuXipQgaLMWJ9HE19h+CpObsvacyMyB2+dSbMKxNLWuUZU
	 dpiGTr3i3lxAcdOK6UpFAXU+b05ApDhRusDpfnVslobeHhK2z5IbffV8NoiXG2MmfRKPT
	 8jLvZSq9WEwHwwNF+xAluJJ2FD8Xwo0e7hxI7FAqu/8FpipKlTXWT+g/enAARbET2ZQ92
	 327Hh/ZkBkwmSh9xjsqaEt3T+LGOXph26wgLIS6Emrtnzm5iY9ljYdTFsALeneaSTR3YL
	 LQbuq2QpYq+24EWmwYvW1osp0FK6HGIiJ9c/j57qw3IEfES5K2HfLFFu2Kp+JmaA9RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=94wVoJ9KCC8Guus9UCfUns/GfWIkY+4eO2IUb3fSnN4=;
	b=er+luXcFVrBjwu4YsHdhmF+cEAevGFnkqT5p7Rn+WPbTV8NPGc8moAvDXU3nN+WNJMte
	 ALfuOC+SoPmiTdB7ev+ufUOVXPrqS6FiB2Z5fPqEhhLD1yKxcCyifx2vNXjeSQjE8xq/G
	 8PBx0+i+J4xSPkZb9EAaleIr9RTSVUyWAn1FBByOZhYmfu+TBHhc/dXiZp4Mg/HiGv6HY
	 8WcPMS5uBXqvelG25lqajisnCGj1qG8jc5rPkRtcKBw6dQCH8lgLpmE7FwudmybwBkoNz
	 vngw2X0Jg/9qNhCtIco/8oAcby6uurxmmSsrQlhefNCmRwovb57OOYWCJ+2OoqOmcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IhSC7KcW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB86082BCA
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IhSC7KcW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F1E1F000C1;
	Thu,  5 Nov 2026 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894140;
	bh=94wVoJ9KCC8Guus9UCfUns/GfWIkY+4eO2IUb3fSnN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IhSC7KcWetrZ29cg4AfXvtcsr+Q0AtfkvmAl8zH8eDYB7NYcn50OEcUXGzj9lAMC6
	 KQ4NGJWHGPc0yQ5sRZdtST6CZ6ENnZRw2uQhJ5WuGAUlMYIF1InifkzUxWeQhDCXdh
	 jraJxDA1+D/M+L8NKZCPWOA/OBvgF6mIR0GInx+JBzMCHMoKNA5lPJ7S378tBDUOIP
	 yOp5YZmyRnJOPxB8UP+ZR53QOB/HDbcdlrBQaLkOgEgnerC5uraEB9zYDFOQvHwhLZ
	 pLV3TKITGb48KcVgRhGMy/NTq5Qdn67icrA2c9ndeVDTM4PhOxL/1KpCQZyA1ijVKv
	 EJDtK3TW45Lmw==
Message-ID: <sashiko-outbox-199373@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] ASoC: rt5668: cancel delayed works on component
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261102165340.1558853-2-tristmd@gmail.com>
References: <20261102165340.1558853-1-tristmd@gmail.com>
 <20261102165340.1558853-2-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:55:40 +0000
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
- [High] ASoC: rt5668: uncancelled delayed work on I2C unbind in rt5668_rem=
ove()
- [High] ASoC: rt5668: stale jack and regcache state across rebind in rt566=
8_remove()
--

commit 9f28175a1bd0b2b45e9d47c7fba83c88de116699
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5668: cancel delayed works on component removal

This patch tracks IRQ acquisition in rt5668_i2c_probe(), disables the IRQ
and cancels the pending jack_detect_work and jd_check_work delayed works in
rt5668_remove(), and re-enables the IRQ in rt5668_probe() on sound card
rebind.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index cd6245d6b91af..29d70802a046a 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
[ ... ]
> @@ -2216,12 +2219,26 @@ static int rt5668_probe(struct snd_soc_component =
*component)
> =20
>  	rt5668->component =3D component;
> =20
> +	if (rt5668->irq_disabled) {
> +		enable_irq(to_i2c_client(component->dev)->irq);
> +		rt5668->irq_disabled =3D false;
> +	}
> +
>  	return 0;
>  }

[Severity: High]
As reported by Sashiko on v5 [1], when a sound card unbinds, rt5668_remove()
calls rt5668_reset(rt5668->regmap), which writes 0 to RT5668_RESET and
resets all codec hardware registers to power-on defaults, without resetting
or dirtying the REGCACHE_MAPLE regmap cache and without clearing
rt5668->hs_jack, rt5668->jack_type, or rt5668->component.

When a sound card subsequently binds and rt5668_probe() re-enables the IRQ,
can this leave the driver and hardware out of sync in three ways?

1. If the previous sound card unbound and freed its snd_soc_jack without
calling snd_soc_component_set_jack(component, NULL, NULL), rt5668->hs_jack
remains a dangling pointer. Even if set_jack was called with NULL,
rt5668_set_jack_detect() does not check for !hs_jack before enabling JD1 and
queueing jack_detect_work. When rt5668_probe() calls enable_irq() on rebind,
if the new card does not call set_jack or if an interrupt queues
jack_detect_work before set_jack updates hs_jack, could
rt5668_jack_detect_handler() pass the dangling rt5668->hs_jack pointer to
snd_soc_jack_report()?

2. When the rebound card calls rt5668_set_jack_detect(),
snd_soc_component_update_bits() and regmap_update_bits() on the non-volatile
cached registers RT5668_CBJ_CTRL_3, RT5668_SAR_IL_CMD_1, RT5668_GPIO_CTRL_1
(RT5668_GP1_PIN_IRQ), RT5668_RC_CLK_CTRL, RT5668_PWR_ANLG_2, and
RT5668_IRQ_CTRL_2 (RT5668_JD1_EN) will see those bits already set in the
stale regmap cache from the first bind and skip writing them to the reset
hardware, leaving the physical IRQ pin and jack detection disabled.

3. If a headset was plugged in when the card unbound (rt5668->jack_type !=
=3D 0),
rt5668_jack_detect_handler() after rebind will see rt5668->jack_type !=3D 0=
 and
skip the initial rt5668_headset_detect(rt5668->component, 1) configuration =
on
the reset hardware:

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	...
		if (rt5668->jack_type =3D=3D 0) {
			/* jack was out, report jack type */
			rt5668->jack_type =3D
				rt5668_headset_detect(rt5668->component, 1);
		} else {
			/* jack is already in, report button event */
			rt5668->jack_type =3D SND_JACK_HEADSET;
			btn_type =3D rt5668_button_detect(rt5668->component);
	...
}

Should rt5668_remove() also clear rt5668->hs_jack, rt5668->jack_type, and
rt5668->component, and reinitialize or mark the regmap cache dirty after
rt5668_reset()?

>  static void rt5668_remove(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> +
> +	if (rt5668->irq_acquired) {
> +		disable_irq(i2c->irq);
> +		rt5668->irq_disabled =3D true;
> +	}
> +
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
> =20
>  	rt5668_reset(rt5668->regmap);
>  }

[Severity: High]
As reported by Sashiko on v2 [2], in rt5668_i2c_probe(), the driver
initializes rt5668->jack_detect_work and rt5668->jd_check_work and requests
i2c->irq via devm_request_threaded_irq() before calling
devm_snd_soc_register_component() and before any sound card binds.

If i2c->irq fires while no sound card is bound or instantiated (or if
devm_snd_soc_register_component() fails), rt5668_irq() queues
rt5668->jack_detect_work, which then re-arms itself every 15 ms in
rt5668_jack_detect_handler():

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	...
	if (!rt5668->component ||
	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
		/* card not yet ready, try later */
		mod_delayed_work(system_power_efficient_wq,
				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
		return;
	}
	...
}

Because rt5668_remove() is the snd_soc_component_driver.remove callback, the
ASoC core only invokes it when a sound card was bound to the component
(snd_soc_del_component_unlocked() skips snd_soc_unbind_card() when card is
NULL, and snd_soc_component_remove() returns early when !component->card).
Meanwhile, rt5668_i2c_driver has no .remove callback and registers no devm
action to disable the IRQ or cancel the delayed works.

If the I2C device is unbound while no sound card is bound (or if
devm_snd_soc_register_component() fails after an IRQ fires), won't
rt5668_remove() be skipped, allowing devres to free struct rt5668_priv while
rt5668->jack_detect_work remains pending and self-rearming?

[1] https://lore.kernel.org/r/20261030174837.1839402-2-tristan@talencesecur=
ity.com
[2] https://lore.kernel.org/r/sashiko-outbox-190014@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165340.1558=
853-1-tristmd@gmail.com?part=3D1
