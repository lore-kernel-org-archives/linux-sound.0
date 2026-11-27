Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800613;
	b=PMTKWkiLaXk7PFCnimiq24H606TI7OqUrnY8jHrJlf/2tDgEpz5xlcy6viSoZNLZ5zKx
	 QA3CxiNA9sSMt0W7MDGuiHCVNX7MAIFSouvvwzpBGeBLpAFC6CrbX9akk3gFiaVGt9mLK
	 qfvCUumyfJy2Wg+4rINvAiWFo4YQDLhwFc+OZlpqmX/TVRKM1nxhpRnLdESgRi/qTI6x5
	 k8DumSO2Hv5DsyaSOTlKXak37BFz+59zpmKuYBfigFsv/9MafUueqPK2i+2S9feKAUse4
	 wh0kKdUodXNFus6UT55REGTIsXebHh3v1BzwyadIbHD8WeWdQOwToqajh+qFjSLALQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L/SbaRr1xq76xeToM9gAgZ5AHU9q6Uf+OoAWdSS5yJs=;
	b=x/WxKv+picJpQjWBEsY+nyGbM2GfUixd0n/DogtJnZWAwxiXggDjEsD+S0Pb8JK6hw3/
	 HRFyafIvZ0zkvQj4Mxgl026S8tlUOfLW43ER8LJA8VyYEKlD492eoslPHo//1dmfWEd+s
	 akPM6k2l3XBzJ3PQx3okVG/mJgzWq4RwXAQWJEa6Gi3Tx+aL3thx+71M8P/pgrY7d3ncy
	 C/UZOZhcmmT+9GH07sqAggi/YhnK8U591t+YKtIabpsFmP32Z9oLbfZ8rVgOjorru6NG+
	 nmqEeRz1tD+FHha45k6/FQaUHE6mlhoU28n5MwRWwrV/lBveHxNtfKEHJlwpVrvLQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6U5TZ4H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF3606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6U5TZ4H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8BF1F000C1;
	Fri, 27 Nov 2026 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795800613;
	bh=L/SbaRr1xq76xeToM9gAgZ5AHU9q6Uf+OoAWdSS5yJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S6U5TZ4H6w3Hl6B3JfQR9wGBwUGbgTPwcvNYxZefWyRiIAkXu302Nk7z6EAXQjpYz
	 4HvYwt1A9kvaXL4wML9+27Ygu7LcpY+X1yw0HNuaAsW9BsQD1xOGC+kqIb6kvsYDZi
	 cKZ8tJu24ZGXyz29+G3tIGZ6qRIYbE2BXaP+EdZNxQ/XwO2mw6NJ6hHaVWSFHl5Hxz
	 PN9sbmSIBlOxb0p/uCm+KiWulzrLncl0r7roQytMs4yKhY2EY5Iz8WMv3Oapu/5BkP
	 4Lp0jh8L4aCFIfexWk7dmYaQyzgkpA3tTc0Bb3vsJKy9AbZzpjTGmya1r8UkinGcw1
	 jFV1AzXXRa9xQ==
Message-ID: <sashiko-outbox-237992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: wm8962: fix interrupt mis-firing during
 runtime_resume()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127170039.663-4-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
 <20261127170039.663-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 17:30:12 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: wm8962: deadlock between wm8962_runtime_suspend() and
  wm8962_irq()
- [High] ASoC: wm8962: disabling IRQ in wm8962_runtime_suspend() breaks
  idle IRQs
- [Medium] ASoC: wm8962: irq_set_status_flags() called on IRQ 0 in
  wm8962_i2c_probe()
--

commit 917ccfcd5e1f9cc84d87be9fd3e359058c229f93
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

ASoC: wm8962: fix interrupt mis-firing during runtime_resume()

This commit requests wm8962->irq with IRQF_NO_AUTOEN and IRQ_DISABLE_UNLAZY,
and enables or disables the IRQ across runtime resume and runtime suspend to
avoid spurious interrupt assertions during power transitions.

> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 3bbaacb08aafa..8c9523d60219b 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -4021,7 +4021,7 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
> =20
>  		ret =3D devm_request_threaded_irq(&i2c->dev, wm8962->irq, NULL,
>  						wm8962_irq,
> -						trigger | IRQF_ONESHOT,
> +						trigger | IRQF_ONESHOT | IRQF_NO_AUTOEN,
>  						"wm8962", &i2c->dev);
>  		if (ret !=3D 0) {
>  			dev_err(&i2c->dev, "Failed to request IRQ %d: %d\n",
> @@ -4039,6 +4039,15 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
>  			/* enable GPIO IRQs if need be */
>  			wm8962_init_gpio_irq(wm8962);
>  		}
> +
> +		/*
> +		 * we are forced to keep interrupts disabled while doing runtime_resum=
e().
> +		 * Otherwise, we may end up with some unwanted transitions on the inte=
rrupt
> +		 * line. Some interrupt controllers may not implement the .irq_disable=
()
> +		 * callback. In such cases, the interrupts will only be masked if
> +		 * IRQ_DISABLE_UNLAZY is set.
> +		 */
> +		irq_set_status_flags(wm8962->irq, IRQ_DISABLE_UNLAZY);
>  	}

[Severity: Medium]
Should irq_set_status_flags() be inside the else branch above?  When
devm_request_threaded_irq() fails, the error path sets wm8962->irq =3D 0
and treats the failure as non-fatal, so execution falls through and
calls irq_set_status_flags(0, IRQ_DISABLE_UNLAZY) on IRQ 0.

> @@ -4131,6 +4140,10 @@ static int wm8962_runtime_resume(struct device *de=
v)
>  				   WM8962_MSTR, WM8962_MSTR);
>  	msleep(5);
> =20
> +	/* keep this last - keeps the interrupt line from mis-firing */
> +	if (wm8962->irq)
> +		enable_irq(wm8962->irq);
> +
>  	return 0;
> =20
>  cache_sync_err:
> @@ -4147,6 +4160,9 @@ static int wm8962_runtime_suspend(struct device *de=
v)
>  {
>  	struct wm8962_priv *wm8962 =3D dev_get_drvdata(dev);
> =20
> +	if (wm8962->irq)
> +		disable_irq(wm8962->irq);

[Severity: High]
Can disable_irq() in wm8962_runtime_suspend() deadlock with wm8962_irq()?

sound/soc/codecs/wm8962.c:wm8962_irq() {
	...
	ret =3D pm_runtime_resume_and_get(dev);
	if (ret < 0) {
	...
}

If an interrupt fires just before disable_irq() masks the line, the two
contexts wait on each other:

CPU0                              CPU1
rpm_suspend()
  runtime_status =3D RPM_SUSPENDING
  wm8962_runtime_suspend()
                                  wm8962_irq()
                                    pm_runtime_resume_and_get()
                                      rpm_resume()
                                        /* waits for RPM_SUSPENDING */
    disable_irq()
      synchronize_irq()
        /* waits for wm8962_irq() */

 *** DEADLOCK ***

[Severity: High]
Does keeping wm8962->irq disabled while runtime suspended prevent GPIO
interrupts from firing when the codec is idle?

soc_component_dev_wm8962 does not set idle_bias_on, and neither
wm8962_init_gpio() nor wm8962_irq_chip holds a runtime PM reference
while child GPIO IRQs are active.  Whenever no audio stream is active
(and after wm8962_gpio_get() drops its temporary runtime PM reference),
the codec stays in RPM_SUSPENDED with wm8962->irq masked at the parent
interrupt controller, so asynchronous GPIO5/GPIO6 events such as jack
detection cannot wake the device via wm8962_irq().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127170039.663-=
1-laurentiumihalcea111@gmail.com?part=3D3
