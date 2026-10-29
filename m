Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272268;
	b=cZVliXiS4nO1gZJjYLvaE1HZ3RE73Pm1/YiZ+ThRIghsivwiG1+YPLbohBovA5qJSCXm
	 Eq0f5katDbB1NkuLTCFyLsPji1BWEpbFKZPfQf/GvS+3EdGZiWh7+5gmVxgrTbd4za6lU
	 YkHoD3yTucmnwXkSN8u7yHT2+3YJUaABYCicLYGCFqwC7VMFjSjYupciMszzWnJjis/Gj
	 zLfY/hOQh5YwjXCR2sRpFhsoSaIf6qnEWvDeX/68fY7k0H9gvObMclMli4RPJuqgym5eL
	 RjqtFwFUHqmCTVUAFL8SUX3JdLqyfYmkhui4uo0TQGKroDg3WijHD1CwrAkVXgveSmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272268;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q1fdrwFIVc61oRyClCR94LmMh5A1hmCwHzJpdx3pnH4=;
	b=haD/NLIKqluE3jtw1krjEH6BdbjN2BYWBOeaJTJmJurbS33s0HVAUGX4cTJJrwgUCO/f
	 a0QW0Zhukgq3tA4bPFUqutWT8Lc0yMBNjEGjPuC0v/JYuLSrEsmym4uyT9PdteeVJAbny
	 upI+GovK9VgGOZ1w088sPHaW51zn1Xt9CvEbVRAV/amFQWFU+pTUP+gRRs3Df5dJ5RHCt
	 nvUwY0hmpNr+V1BwXrI583Gjs+nEDGoyTY3BqanmSbCGw107Ses8iz0rpYBEse6q08RYM
	 +uQVpzR9Re+dTTRoZm7shixN0Z5nqjJCBksGZx2yVqxjSwOWbntb2CwVlQ30llYY+Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhEbcwXy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533E6606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhEbcwXy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43EF1F01825;
	Thu, 29 Oct 2026 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793272268;
	bh=q1fdrwFIVc61oRyClCR94LmMh5A1hmCwHzJpdx3pnH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OhEbcwXyi8rsf+X/4n3HPbyjB8MYw/3g1pNJ4IUJudipu2ZtT2R7ZkXWk2VWLAWo9
	 voQTeZDmQ6H5U4l8onBjAfbmKvnbiivGvrI5QnsfuuGen+++Oo6alG3lrQUouOlQVq
	 adgPPXnaR/QMG1qyx9dipP/NMpT8ZdqCh6YMI4BBBoxUpa+wVLgyTRiH9czzrZJ3L7
	 eb4i8BHMWmN1UGVLenSl9iU+M7xiw9OC1aD5tasi41+K+4UDV7JWDnkpkQJtLnVQgB
	 mfwutNdsRaxmsTnpYFaRgNzY/kEob4xkvafglCBqFeHfF1fhb3T0tBwC0h1t3rGuNx
	 4IFUOUVQ+qTAQ==
Message-ID: <sashiko-outbox-189168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10] ASoC: wm8994: drain delayed works on remove and
 probe error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029105749.3732334-1-tristmd@gmail.com>
References: <20261029105749.3732334-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 11:11:07 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: wm8994: mic_work can be re-queued by wm1811_jackdet_bootstra=
p()
--

commit 57d6ba6d8a26f549eace6106e2dcf810fa0f529b
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: wm8994: drain delayed works on remove and probe error

This commit cancels pending delayed works in wm8994_component_probe() error
handling and wm8994_component_remove() to prevent works from executing after
resources are freed.

> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index c65a7769a9d25..c95a7a4dffb19 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4574,6 +4574,11 @@ static int wm8994_component_probe(struct snd_soc_c=
omponent *component)
>  	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
>  	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
>  	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
> +	if (control->type =3D=3D WM8994 || control->type =3D=3D WM1811)
> +		cancel_delayed_work_sync(&wm8994->mic_work);
> +	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
> +	cancel_delayed_work_sync(&wm8994->mic_complete_work);
> +	cancel_delayed_work_sync(&wm8994->open_circuit_work);
> =20
>  	return ret;
>  }
> @@ -4615,6 +4620,11 @@ static void wm8994_component_remove(struct snd_soc=
_component *component)
>  			free_irq(wm8994->micdet_irq, wm8994);
>  		break;
>  	}
> +	if (control->type =3D=3D WM8994 || control->type =3D=3D WM1811)
> +		cancel_delayed_work_sync(&wm8994->mic_work);
> +	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
> +	cancel_delayed_work_sync(&wm8994->mic_complete_work);
> +	cancel_delayed_work_sync(&wm8994->open_circuit_work);

[Severity: High]
Can wm8994->mic_work be re-queued here if wm8994->jackdet_bootstrap runs
after cancel_delayed_work_sync(&wm8994->mic_work) completes?

In sound/soc/codecs/wm8994.c, wm1811_jackdet_bootstrap() calls
wm1811_jackdet_irq(), which queues wm8994->mic_work when a jack is present:

static void wm1811_jackdet_bootstrap(struct work_struct *work)
{
	struct wm8994_priv *wm8994 =3D container_of(work,
						struct wm8994_priv,
						jackdet_bootstrap.work);
	wm1811_jackdet_irq(0, wm8994);
}

and inside wm1811_jackdet_irq():

	if (present) {
		...
		delay =3D control->pdata.micdet_delay;
		queue_delayed_work(system_power_efficient_wq,
				   &wm8994->mic_work,
				   msecs_to_jiffies(delay));
	}

On WM1811 with jack detection enabled, powering up CLK_SYS triggers
clk_sys_event(), which schedules wm8994->jackdet_bootstrap.

Because wm1811_mic_work() can schedule wm8994->jackdet_bootstrap (via
snd_soc_dapm_force_enable_pin() -> clk_sys_event()) and
wm1811_jackdet_bootstrap() can in turn schedule wm8994->mic_work, the two
works have a cyclic dependency. If wm1811_jackdet_bootstrap() is already
executing or its timer fires between cancel_delayed_work_sync(&wm8994->mic_=
work)
and cancel_delayed_work_sync(&wm8994->jackdet_bootstrap), it will re-arm
wm8994->mic_work, leaving wm1811_mic_work() pending after
wm8994_component_remove() (or the wm8994_component_probe() error path) retu=
rns
and frees the component and wm8994_priv memory.

Would it make sense to use disable_delayed_work_sync() on these works during
teardown, or cancel wm8994->mic_work a second time after
cancel_delayed_work_sync(&wm8994->jackdet_bootstrap) finishes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029105749.3732=
334-1-tristmd@gmail.com?part=3D1
