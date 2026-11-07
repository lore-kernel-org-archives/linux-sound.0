Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058094;
	b=aLO/9jnQts1nTKrQi0TnCIWZYVabYRCHEpowQXuZU0RPTYfJthlTh52Yh4u2dRAhfnPx
	 kAlN1BuKX7Yzr9kvlIosKRZFoAaUHU6A4PmtdcXRCfgTM+VC06se3q71/BfE0eEXDTq5W
	 4nrKZLhbhzCJMkBF1pQ4rwoB3DdI+3w5vtcZ3cMWCtwuEq+zxUMmcXp7MdaydH0vNgTwl
	 hClgDlJR2QlXyGnHB7xqtrz/jRS9d84vUMg0BMbX3uVr47NyLfEoIch3onEGhrmIxxYEx
	 cTD+aE8AZCtI+queK0YfCNDOZuVxXOjO7/euneBIluayxlxZa6iTXzxuEAcEVkJkENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058094;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EgMWNMKBuaxny6x39G1S+lyio28gZ/HFBZe6ugExIgs=;
	b=2K+H6aArrHmAit8aAOqoJ5l5fY6IfD7JsVsAFrwo0/ocOk94bqxuIhH8+imyUf22Sn+r
	 Mu2pd0ne3pdwxT8Hr6J59RWvFZk3Wpptthbu0G0YZMzMJYTsk9yuOwYKZQP1QjNApJC/K
	 mZ4osMQvqBofEI9tzJHnYC3P3iONMYRxNPHiv69UnpLrXBQpI97XUCeZE215YC58p7wPt
	 Nq0R4eAGutrMyqyJ7YG9bRQo3Yu42KYHBNytwgxXg+f9J/32XdTZZlOD0tG5CuldznpyU
	 iBzDlegVCawwGaz2OT3yuZJ69FL1OZo5gM0m9nZipAH/vIU9aAeMoNBDz5znPgM7I0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DBug0vG/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67008606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBug0vG/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014F41F0089F;
	Sat,  7 Nov 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794058094;
	bh=EgMWNMKBuaxny6x39G1S+lyio28gZ/HFBZe6ugExIgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DBug0vG/4/+/BZiYhoYY3g91FJR13zn+K4eHBL9kq59jwfA7LPhqSqEj+nmvfuT4a
	 banUUmeJm8N3Ga466J55N5iqVDtOhwJYCCQiFVt37g8ejrHMghzSHyE3NI0fTtNVYN
	 8d79Gb3+zDJOQda1w05xHB+mt+nXTba6M44Atcl2QDojTEYYyrnWxR8FQY6YzMPEI1
	 id9DBsyoY0U4LRUUqM/9arNGgIQyaVn1/GmH+YtUREkxpC2u8cJnq7IedjutmMtyiS
	 42F3F/wXtA7gHmutT+I3/1wQHfPRJK8qewG4AJIoFVy36FaC8a1/kjCqL7TRk7Snsx
	 C2Ph4ZcSrt4gw==
Message-ID: <sashiko-outbox-202925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: rt5668: fix teardown order and stale state across
 card rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107130651.2059891-1-tristan@talencesecurity.com>
References: <20261107130651.2059891-1-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 13:28:13 +0000
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
- [Medium] ASoC: rt5668: stale jack and button state synced on rebind in
  rt5668_probe()
- [Low] ASoC: rt5668: duplicate disable_irq() in rt5668_i2c_shutdown()
  when unbound
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [High] ASoC: rt5668: delayed work re-armed when hs_jack is NULL in
  rt5668_set_jack_detect() [1]
- [High] ASoC: rt5668: uninitialized mutex locked in rt5668_calibrate()
  [2]
--

commit 2fe6914e5e4d8652613425665978e8bb3cf7bc53
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5668: fix teardown order and stale state across card rebind

This commit clears jack state and marks the regmap cache dirty in
rt5668_remove(), syncs the cache in rt5668_probe(), and registers a devm
action and shutdown handler to disable the IRQ and cancel delayed works.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index 29d70802a046a..2ceae9d9f40f6 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
[ ... ]
> @@ -2213,14 +2214,26 @@ static int rt5668_set_bias_level(struct snd_soc_c=
omponent *component,
>  	return 0;
>  }
> =20
> +static void rt5668_i2c_disable_irq_and_cancel_work(void *data)
> +{
> +	struct rt5668_priv *rt5668 =3D data;
> +
> +	if (rt5668->irq_acquired && !rt5668->irq_disabled)
> +		disable_irq(rt5668->i2c->irq);
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
> +}
> +
>  static int rt5668_probe(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> =20
>  	rt5668->component =3D component;
> =20
> +	regcache_sync(rt5668->regmap);
> +
>  	if (rt5668->irq_disabled) {
> -		enable_irq(to_i2c_client(component->dev)->irq);
> +		enable_irq(rt5668->i2c->irq);
>  		rt5668->irq_disabled =3D false;
>  	}
> =20
> @@ -2230,17 +2243,21 @@ static int rt5668_probe(struct snd_soc_component =
*component)
>  static void rt5668_remove(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> -	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> =20
>  	if (rt5668->irq_acquired) {
> -		disable_irq(i2c->irq);
> +		disable_irq(rt5668->i2c->irq);
>  		rt5668->irq_disabled =3D true;
>  	}
> =20
>  	cancel_delayed_work_sync(&rt5668->jack_detect_work);
>  	cancel_delayed_work_sync(&rt5668->jd_check_work);
> =20
> +	rt5668->hs_jack =3D NULL;
> +	rt5668->jack_type =3D 0;
> +	rt5668->component =3D NULL;

[Severity: High]
This problem wasn't introduced by this patch, but can
rt5668_set_jack_detect() re-arm rt5668->jack_detect_work after
rt5668_remove() has cancelled it [1]?

During card teardown, soc_cleanup_card_resources() runs
snd_soc_component_remove() (invoking rt5668_remove()) before
snd_card_free() -> snd_jack_dev_free(), where jack->private_free() calls
snd_soc_component_set_jack(component, NULL, NULL).  When pdata.jd_src is
RT5668_JD1, rt5668_set_jack_detect() does not check whether hs_jack is
NULL before enabling RT5668_JD1_EN and queuing rt5668->jack_detect_work:

sound/soc/codecs/rt5668.c:rt5668_set_jack_detect() {
	switch (rt5668->pdata.jd_src) {
	case RT5668_JD1:
		...
		regmap_update_bits(rt5668->regmap, RT5668_IRQ_CTRL_2,
			RT5668_JD1_EN_MASK | RT5668_JD1_POL_MASK,
			RT5668_JD1_EN | RT5668_JD1_POL_NOR);
		mod_delayed_work(system_power_efficient_wq,
			   &rt5668->jack_detect_work, msecs_to_jiffies(250));
		break;
}

When rt5668_jack_detect_handler() runs 250 ms later, rt5668->component is
NULL, so the handler reschedules itself every 15 ms until the I2C device
is unbound.

> +
>  	rt5668_reset(rt5668->regmap);
> +	regcache_mark_dirty(rt5668->regmap);
>  }

[Severity: Medium]
Does regcache_sync() in rt5668_probe() restore stale headset and
button-detection register state when rebinding after a 4-pole headset was
plugged in?

When a 4-pole headset is detected, rt5668_headset_detect(component, 1) and
rt5668_enable_push_button_irq(component, true) update non-volatile cached
registers: RT5668_CBJ_CTRL_1 (RT5668_TRIG_JD_HIGH), RT5668_SAR_IL_CMD_1
(RT5668_SAR_BUTT_DET_EN), RT5668_SAR_IL_CMD_13 (switching the SAR source
from RT5668_SAR_SOUR_TYPE to RT5668_SAR_SOUR_BTN), RT5668_4BTN_IL_CMD_2,
and RT5668_IRQ_CTRL_3 (RT5668_IL_IRQ_EN).

In rt5668_remove(), rt5668->jack_type is cleared to 0 and the hardware is
reset, but regcache_mark_dirty() preserves those non-default values in the
cache.  On card rebind, regcache_sync() writes them back to the codec
while rt5668->jack_type is 0.  Because neither rt5668_set_jack_detect()
nor the jack_insert branch of rt5668_headset_detect() switches
RT5668_SAR_IL_CMD_13 back to RT5668_SAR_SOUR_TYPE or disables push-button
IRQ, combo-jack type detection runs with the SAR source stuck on button
mode and leaves RT5668_IL_IRQ_EN enabled even if a 3-pole headphone is
connected.

Calling rt5668_headset_detect(component, 0) in rt5668_remove() before
rt5668_reset() (or reinitializing the cache to defaults) would clear the
cached headset and button state.

[ ... ]
> @@ -2576,6 +2593,13 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
>  			rt5668->irq_acquired =3D true;
>  	}
> =20
> +	rt5668->i2c =3D i2c;
> +	ret =3D devm_add_action_or_reset(&i2c->dev,
> +				      rt5668_i2c_disable_irq_and_cancel_work,
> +				      rt5668);
> +	if (ret)
> +		return ret;
> +
>  	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_rt=
5668,
>  			rt5668_dai, ARRAY_SIZE(rt5668_dai));
>  }

[Severity: High]
This problem wasn't introduced by this patch, but earlier in
rt5668_i2c_probe(), rt5668_calibrate() is called before
mutex_init(&rt5668->calibrate_mutex) [2]:

sound/soc/codecs/rt5668.c:rt5668_calibrate() {
	int value, count;

	guard(mutex)(&rt5668->calibrate_mutex);
	...
}

sound/soc/codecs/rt5668.c:rt5668_i2c_probe() {
	...
	rt5668_calibrate(rt5668);
	...
	mutex_init(&rt5668->calibrate_mutex);
}

guard(mutex) locks and unlocks a zero-initialized mutex during probe,
triggering CONFIG_DEBUG_MUTEXES / lockdep warnings and operating on an
uninitialized wait_list.

> @@ -2584,6 +2608,11 @@ static void rt5668_i2c_shutdown(struct i2c_client =
*client)
>  {
>  	struct rt5668_priv *rt5668 =3D i2c_get_clientdata(client);
> =20
> +	if (rt5668->irq_acquired)
> +		disable_irq(client->irq);
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
> +
>  	rt5668_reset(rt5668->regmap);
>  }

[Severity: Low]
If the sound card was unbound via rt5668_remove() before system shutdown,
rt5668->irq_disabled is already true; doesn't rt5668_i2c_shutdown() then
call disable_irq() a second time on the already-disabled IRQ?

Setting rt5668->irq_disabled =3D true in
rt5668_i2c_disable_irq_and_cancel_work() and calling that helper here
(and in rt5668_remove()) would avoid the unbalanced disable_irq() and the
duplicated teardown sequence.

[1] https://sashiko.dev/#/bug/linux-ba1194b0-1aa7-482d-b655-2fd164cde5ff
[2] https://sashiko.dev/#/bug/linux-52105661-89bd-4327-8228-f16b8d913d85

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107130651.2059=
891-1-tristan@talencesecurity.com?part=3D1
