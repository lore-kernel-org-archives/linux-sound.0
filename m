Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894894;
	b=Q3whNtq+uF9m9ZfBFtE72DONqzK+5Sm0ye7Xa7s0jkq0EXJbZ1ZS7OoJjxSw1M9tf76I
	 CZKaaqo3tcO1UOxazXtWSZikrojN+d0Nh3aaho/qZ7c2PtMxBNFF9FPOBgPYm/viYGjA3
	 qDKuJrg0GZ/evdaIylZyY5v2tre7JqjdhfQhp7sosaC8u0DzNxThI/4SPUPQTiO5TcLUx
	 LHixkcOO89ICA+rrrb10xWqjp/RF5tRawFqbg7zPcKBU4vzACxrtrLK3w5RTAhFVWiOJ3
	 dctzx39A2LcPs/Y7vLw6k++LzXgGW50BNKY6Q8u9jEUAME+P4ZrPUQkpHVBwPm6St8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d8jyruRuo7eHi73AhyqfuO5GxHLIMCGtwJ+HCetQt7Q=;
	b=OR5WLyHowH2YjAlmQkKnOCZgGMv7F4lH5xJwz7IP8Wclmb6behITkLbuZSnI2r94ysDA
	 BwC9TDXzu3mysgl9F5HFeIbTkqA+yyEhFdJfDVcwS5lgXDfwdkVJP6odvQCT5SWEnwBY5
	 6JqP9TYhvO1963vgan66SPgiU6rp6PAYxXjpNgJ5Ld0dbq9NKgyHNm51YXm4CDoQD/B8G
	 CsJroJQmi6bfpGdLBOZLNEFAbd7PwvBLVBYtuQYJDP9/vOVcfheO7Ye5KAzrGiUBk76R/
	 jtv+3sVBnUdnb2uyA4vefRnq90yIxUeGiiuMM/ZgwKrLgcmOk7L9EZJYCv3FrzOwkcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYC5ZYTI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C4606CFAD
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYC5ZYTI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8821F00A02;
	Thu,  5 Nov 2026 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894894;
	bh=d8jyruRuo7eHi73AhyqfuO5GxHLIMCGtwJ+HCetQt7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYC5ZYTIfi0I1O2S5n8px+344tWtOJMkAkRbHKIV/cGTVx63YFF7NV+7LxrLwSEM8
	 M2B1SA9ZB3TmSVpjqf5/eZIBo4IEXfGa3l0mzfh8KSpQqZjWclALvjXyWqWvnHPbPm
	 Bf83tfK5XybQEIzC9tKPXDsG6m1ULUmcYdfBvW2jGeLEGv5nnAQge0lfJ9AHRYsdE6
	 Wp1Q3Zp5Y0u1p439+PQhH4Uv8SQodR1Mk579L10p/7Gi28bNgGv5Ba0ViCxagxtPCK
	 tzNaEFNgm18QrvF5Y2WvCxH36D+MAl1hGlhPq1947vQXMRzuCtB8Hks4OMkjKwsYY7
	 2qzY5fRBte93g==
Message-ID: <sashiko-outbox-199419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] ASoC: rt5659: cancel jack_detect_work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261102165340.1558853-3-tristmd@gmail.com>
References: <20261102165340.1558853-1-tristmd@gmail.com>
 <20261102165340.1558853-3-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:08:13 +0000
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

commit 7e33f0dd93e7476a57b77262485f2364ebdfe711
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5659: cancel jack_detect_work on component removal

This commit disables the codec IRQ and cancels pending jack_detect_work
in rt5659_remove() before resetting the codec, and re-enables the IRQ
in rt5659_probe().

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
As reported by Sashiko on v5 [1], does re-enabling the IRQ here in
rt5659_probe() work as intended after rt5659_remove() has reset the
codec, and can it race with a dangling rt5659->hs_jack pointer?

At the end of rt5659_remove(), writing 0 to RT5659_RESET resets all
codec hardware registers to their power-on defaults, clearing the GPIO1
IRQ pin mux (RT5659_GP1_PIN_IRQ in RT5659_GPIO_CTRL_1) and the jack
detection and IRQ control registers (RT5659_EJD_CTRL_1,
RT5659_RC_CLK_CTRL, RT5659_GPIO_CTRL_3, RT5659_JD_CTRL_1,
RT5659_IRQ_CTRL_1, RT5659_IRQ_CTRL_2, RT5659_PWR_ANLG_1,
RT5659_PWR_ANLG_2) that were programmed only once in rt5659_i2c_probe().
Because RT5659_RESET is a volatile register in
rt5659_volatile_register(), the REGCACHE_RBTREE regmap cache is also not
marked dirty or resynced on re-probe, leaving the codec unable to
generate jack-detection interrupts after card rebind.

In addition, rt5659_remove() does not clear rt5659->hs_jack or
rt5659->component. When a sound card unbinds, its card-owned struct
snd_soc_jack is freed, leaving rt5659->hs_jack dangling. On card rebind:

snd_soc_component_probe()
  rt5659_probe()
    enable_irq()

runs before snd_soc_component_init() invokes the machine driver's init
callback to register a new snd_soc_jack via rt5659_set_jack_detect().
If an interrupt fires after enable_irq() unmasks the line before a new
jack is set (or if the rebound card does not call
rt5659_set_jack_detect() or fails later during bind), jack_detect_work
will pass the dangling rt5659->hs_jack pointer to
snd_soc_jack_report().

> +
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

[Severity: High]
As reported by Sashiko on v5 [1], can rt5659->jack_detect_work still be
left pending on I2C device teardown when no ASoC card is bound, or
during system shutdown?

In rt5659_i2c_probe(), when rt5659->pdata.jd_src is RT5659_JD3 or
RT5659_JD_HDA_HEADER, the driver initializes rt5659->jack_detect_work,
enables codec jack-detection interrupts, registers rt5659_irq() via
devm_request_threaded_irq(), and enables RT5659_GP1_PIN_IRQ in
RT5659_GPIO_CTRL_1 before calling devm_snd_soc_register_component().
Once devm_request_threaded_irq() succeeds, any interrupt on i2c->irq
invokes rt5659_irq() and queues rt5659->jack_detect_work onto
system_power_efficient_wq with a 250 ms delay.

However, disable_irq() and cancel_delayed_work_sync() are placed only in
rt5659_remove() (the snd_soc_component_driver remove callback), while
rt5659_i2c_driver defines no remove callback and registers no devm
work-cancellation action. In the ASoC core, snd_soc_component_remove()
only calls component->driver->remove() when component->card is non-NULL
and the component was probed.

If devm_snd_soc_register_component() fails in rt5659_i2c_probe(), or if
the I2C device is unbound while no sound card is bound to the component,
rt5659_remove() is skipped and devres frees the IRQ, regmap, and struct
rt5659_priv while rt5659->jack_detect_work remains queued, leading to a
use-after-free in rt5659_jack_detect_work() or
rt5659_jack_detect_intel_hd_header() when the timer expires. Similarly,
rt5659_i2c_shutdown() writes RT5659_RESET without disabling the IRQ or
cancelling jack_detect_work.

[1] https://lore.kernel.org/r/20261030174837.1839402-3-tristan@talencesecur=
ity.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165340.1558=
853-1-tristmd@gmail.com?part=3D2
