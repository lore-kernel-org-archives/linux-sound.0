Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310387;
	b=AMN5XvZt4xxN8ke1VElBY5DMdxZTKhXJ7lX8NTxncOmoyCAzTUqHOegxZDelGJRLLLT6
	 LwEPn22npY8Fi4ZmZF5bmuulel13mr30hmDmAKuXUYCmZav2ZTwmiWNUcJ8wZC3qZN/Z/
	 dE+hxfwYWEtFiBlD9rHOjWRAZDRiS74aWRXbOeHF/7z1kKEOrVYfuBQjexIWeRKyTC5ZW
	 0jUExV7qwtF/aibgOMgf5XArDJgFXy12Fwea9WB0FfVutFunj5QONzho5qpKpxvnsO7ic
	 milkaD9s042oupINI8iPm8c/pEDBbNBu22Tgn8Qqatft5IDOt/QIDhBeBTU/8Ojy1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310387;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lENeSIL+DxGiTbY8SbcxPXXm7DGgDytAfO/0suXI3Q8=;
	b=my9cZwkzvCydo55nCC8ohJ1CvUPJCbwbye0qu1YWQFrDkP85R2AjhIhf+SwsDKPOXaHG
	 CgORGH9dinR8ZSP0SQpbaIqRXEWOR8bYlvVtqgiWFLZ2uJH34icb13empQF3lEFjm1U9Z
	 98y/jgGLStH+KPpMhexII1f7HH3M7Z9LnbiEJ9Roe3nmSLbuF8JnPcokLp6LVtuWGWApa
	 WW/MPROiqXIGw0aEurd+UHXBFR+X5t2D0iGdGLRg2KhAANQmjXrE3pbVkP0TVPB58PfjV
	 Z36DlKsnerQ7hxNNHIm+4idKHZ2RaMebD1JRjM5WEuHtugsmwRAK7/yAC7wGZpC5Gnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6nl9DPA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36532606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g6nl9DPA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D651F01816;
	Thu, 29 Oct 2026 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793310387;
	bh=lENeSIL+DxGiTbY8SbcxPXXm7DGgDytAfO/0suXI3Q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6nl9DPAH37z1bXIi6aVMmWBmcgAVbO0yXQHZJDDp9tMNBkCpG0WoMFQojmPYPisu
	 OPJ7PeEqsXNZN1kP/nu5r8LFbgSF+Zm2IZyJp3EuJMNpjbz7/KVz9id4+PGIkMZqxM
	 s7OrZK6XSl7wyB7vVpmtbQ4Li4qMepyVltRAWBqN4MrsTpdgwv8FNHbIv+EXjMg0mr
	 rWIOtTo0O2vhs8VKypwt1OYiuSxFMzCY38ExrDtl/0RBI55uZl+SJWqtwFL5d7MFL/
	 ZuLoxX+vfvuF6Zl9IlTgLm1AX5UfeIWHNBaULcpLxx0Z9JxY6pT/2oL+oSTreKVg5P
	 2ck6WhPfoMCZw==
Message-ID: <sashiko-outbox-190014@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] ASoC: rt5668: cancel jack_detect_work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029212504.2997364-2-tristmd@gmail.com>
References: <20261029212504.2997364-1-tristmd@gmail.com>
 <20261029212504.2997364-2-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 21:46:26 +0000
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
- [High] ASoC: rt5668: jd_check_work is not cancelled in rt5668_remove()
- [High] ASoC: rt5668: jack_detect_work can remain active or re-arm on I2C =
unbind
--

commit aa3b3b8978b5829c3441db1dd94723b81c7cb27d
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5668: cancel jack_detect_work on component removal

This commit cancels jack_detect_work in rt5668_remove() to prevent the
delayed work handler from accessing freed memory if the device is unbound
while work is pending.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index cd6245d6b91af..b1c65924d9959 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
> @@ -2223,6 +2223,8 @@ static void rt5668_remove(struct snd_soc_component =
*component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> =20
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);

[Severity: High]
The commit message states that "only jd_check_work is cancelled during
removal", but is rt5668->jd_check_work actually cancelled on removal?

Looking at sound/soc/codecs/rt5668.c, the only call to
cancel_delayed_work_sync(&rt5668->jd_check_work) is in
rt5668_jack_detect_handler() when no button press is detected:

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	...
	if (rt5668->jack_type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
		SND_JACK_BTN_2 | SND_JACK_BTN_3))
		schedule_delayed_work(&rt5668->jd_check_work, 0);
	else
		cancel_delayed_work_sync(&rt5668->jd_check_work);
	...
}

Once scheduled, rt5668_jd_check_handler() re-schedules itself every 500
jiffies for as long as the jack remains inserted, accessing
rt5668->component and rt5668->hs_jack:

sound/soc/codecs/rt5668.c:rt5668_jd_check_handler() {
	...
	if (!(snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
		& RT5668_JDH_RS_MASK)) {
		...
	} else {
		schedule_delayed_work(&rt5668->jd_check_work, 500);
	}
}

In addition, if rt5668_jack_detect_handler() is already running when
cancel_delayed_work_sync(&rt5668->jack_detect_work) is called, it can
schedule rt5668->jd_check_work right before finishing. Shouldn't
rt5668->jd_check_work also be cancelled after jack_detect_work so it cannot
access freed rt5668_priv memory after unbind?

[Severity: High]
Can rt5668->jack_detect_work still remain active or be re-queued when the
I2C device is unbound?

There appear to be two paths in sound/soc/codecs/rt5668.c where cancelling
the work only in the ASoC component remove callback rt5668_remove() leaves
rt5668->jack_detect_work running after rt5668 is freed:

1. In rt5668_i2c_probe(), devm_request_threaded_irq() is registered before
devm_snd_soc_register_component(), and rt5668_i2c_driver does not define an
I2C .remove callback:

sound/soc/codecs/rt5668.c:rt5668_i2c_probe() {
	...
	if (i2c->irq) {
		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
			| IRQF_ONESHOT, "rt5668", rt5668);
		if (ret)
			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);

	}

	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_rt566=
8,
			rt5668_dai, ARRAY_SIZE(rt5668_dai));
}

On I2C device unbind, devres unregisters the ASoC component (invoking
rt5668_remove()) before devm_irq_release() frees i2c->irq. Because the IRQ
remains enabled during and after rt5668_remove(), rt5668_irq() can fire
before devm_irq_release() and re-queue rt5668->jack_detect_work via
mod_delayed_work().

2. rt5668_remove() is only invoked by snd_soc_component_remove() when the
component is bound to an instantiated sound card (component->card !=3D NULL=
).
If rt5668_irq() fires when no sound card is instantiated,
rt5668_jack_detect_handler() re-arms rt5668->jack_detect_work every 15 ms:

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

If the I2C device is unbound while no sound card is bound, rt5668_remove()
is never called and the 15 ms retry loop continues running after devres
frees rt5668.

Should the driver disable the IRQ and cancel both delayed works in an I2C
driver .remove callback (or via a devm action registered after
devm_request_threaded_irq())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029212504.2997=
364-1-tristmd@gmail.com?part=3D1
