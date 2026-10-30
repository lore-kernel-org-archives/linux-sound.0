Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375776;
	b=QNj2dcBkqfKXenYoiRwG52+fHxXhsl7zdJ00QniuL2my14aG+qiYOE2VPZ61JxI/GGNb
	 lmNdh7U6IpCYTKmR87/JLzQ5jCdql8o4U/OzIDqRJAbrHRn+xo6xJRVOCkdIqV9uo/j1u
	 doUzAus2+CgS537EsedzzysQ3DBmj8+j1Ty1JZMySkIhq7acOs5s5Q/L2V1jwQlvi1xbJ
	 8o3elWybr05zp4pQ0dJ591qibiG1v69OIgfgcbu13qTXVzfiv8Xd/V7pOoITexzsW5IvM
	 Mlf9T/nz0ovKm22uTB6P88n0LFxPQyJ1IKMm329rUhLFoPZDEl1+7xfQ4VWJleQgl0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375776;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hj3n3JV0jV8WYQXjQMNP+1C/jSLUfZL9PLCwf8Cxj0g=;
	b=brGBcZRp04emnbGaCr/53l2KfTFM+xwKVJl+3k+UVf3GrB6IIV3fsrEjCRgF6arNrGqg
	 UrZ8xgjfhq956j3heJ5O+oHxz8aVStlV1K04lPTIure7xD1jctudhR+Tb9SDquaBU4u7X
	 a7DQYTVbdUUwzkrXtjk/8eBPXOxfkDjeRqg6xiE6nsFaFD/SFKfjKHtsaTesqCf3B77ku
	 +TICDGdp3uOJzu/E9RNzrZPIKwKi2JaywP+9998rNT/YDIf40OGQ+vFxyAQsT5Xo3MRoM
	 Bl57rMs7qztqsZGfuhUnJAcqkGmMDH/tq9Q8+84nW+GGVXrOlTky/ioBqYaBjaskv5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxCxlSK+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E17606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxCxlSK+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D0E1F0093A;
	Fri, 30 Oct 2026 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793375776;
	bh=Hj3n3JV0jV8WYQXjQMNP+1C/jSLUfZL9PLCwf8Cxj0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxCxlSK+IWRCMRtSqnGgZ36bo6UV+fvjOzwwlkCRW5bIQMAMajbg1jisfCfMWnXlS
	 YmcpCatGudcdZrceUnK5Icz+GfDJQEdSni1QS/wQ1Po0wuadUHFhUgOyVOtIs+KwfA
	 RYSFWo8sYkYQN+efVsuCtsIEEhJBTu4axWSkgDCyxzxhtZxeTatM0PbKpPBh1jHfrG
	 qSNHQ87CEqtdcUgT+56EgSrel+fev5qa6UxGv5YlF5KswYcYilKdLVFEtXVQYyyf5I
	 2I9DJX2ELI+2OCwI2iEPQjzL/Thj+rk9aeqjHeyy1dzLYIUcfRpbgmNORY25Qfp1YF
	 taSlYVOd3kmZA==
Message-ID: <sashiko-outbox-191197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: rt5668: cancel delayed works on component
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030154202.2989936-2-tristan@talencesecurity.com>
References: <20261030154202.2989936-1-tristan@talencesecurity.com>
 <20261030154202.2989936-2-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 15:56:15 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: rt5668: jack_detect_work UAF on I2C unbind in rt5668_remove()
- [High] ASoC: rt5668: unbalanced disable_irq() in rt5668_remove() on card =
rebind
- [Medium] ASoC: rt5668: disable_irq() in rt5668_remove() when IRQ request =
failed
--

commit d5c07e49b35a8b8aca80e062381c33477ad1f222
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5668: cancel delayed works on component removal

This commit disables the codec IRQ and cancels jack_detect_work and
jd_check_work in rt5668_remove() to prevent work handlers from running
after removal.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index cd6245d6b91af..7501c6c6ee128 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
> @@ -2222,6 +2222,13 @@ static int rt5668_probe(struct snd_soc_component *=
component)
>  static void rt5668_remove(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> +
> +	if (i2c->irq)
> +		disable_irq(i2c->irq);

[Severity: High]
Does calling disable_irq(i2c->irq) in the ASoC component remove callback
rt5668_remove() leave the IRQ permanently disabled across sound card
unbind/rebind cycles or deferred probe rollbacks?

In rt5668_i2c_probe(), i2c->irq is requested once at I2C device probe time
via devm_request_threaded_irq(), whereas rt5668_probe() and rt5668_remove()
are snd_soc_component_driver callbacks invoked when an ASoC card binds or
unbinds the component:

sound/soc/codecs/rt5668.c:rt5668_probe() {
	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);

	rt5668->component =3D component;

	return 0;
}

If the sound card is unbound and later rebound while the I2C device stays
bound, or if snd_soc_bind_card() fails or defers on a later component after
rt5668_probe() succeeds (causing soc_cleanup_card_resources() ->
soc_remove_link_components() -> snd_soc_component_remove() to run),
rt5668_remove() calls disable_irq(i2c->irq). Because neither rt5668_probe()
nor rt5668_set_jack_detect() calls enable_irq(i2c->irq), the IRQ disable
depth remains incremented on subsequent card binds.

[Severity: Medium]
Also, what happens here if devm_request_threaded_irq() failed during
rt5668_i2c_probe()?

In rt5668_i2c_probe(), a failure to request the IRQ is logged as non-fatal
while i2c->irq remains non-zero:

	if (i2c->irq) {
		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
			| IRQF_ONESHOT, "rt5668", rt5668);
		if (ret)
			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);

	}

When rt5668_remove() later checks only if (i2c->irq), won't it call
disable_irq(i2c->irq) on an IRQ line that rt5668 never successfully
claimed, causing an unbalanced IRQ disable?

> +
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);

[Severity: High]
As reported by Sashiko on v2 [1], can rt5668->jack_detect_work still cause
a use-after-free when the I2C device is unbound while no sound card is
bound?

In rt5668_i2c_probe(), rt5668->jack_detect_work and rt5668->jd_check_work
are initialized and rt5668_irq() is registered via
devm_request_threaded_irq() before devm_snd_soc_register_component(). If an
interrupt fires before a sound card is bound or instantiated, rt5668_irq()
queues rt5668->jack_detect_work, and rt5668_jack_detect_handler() re-arms
itself every 15 ms:

	if (!rt5668->component ||
	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
		/* card not yet ready, try later */
		mod_delayed_work(system_power_efficient_wq,
				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
		return;
	}

When the I2C device is unbound while component->card is NULL,
devm_component_release() -> snd_soc_unregister_component_by_driver() ->
snd_soc_del_component_unlocked() skips snd_soc_unbind_card() because card is
NULL, so snd_soc_component_remove() and rt5668_remove() are never called.
Because rt5668_i2c_driver has no i2c_driver.remove callback (or devm action)
to disable the IRQ and cancel the delayed works on I2C unbind, devres frees
rt5668 while rt5668->jack_detect_work remains pending. Should the IRQ
disable and work cancellation be handled at the I2C device lifecycle level
(similar to rt5682-i2c.c and rt5682s.c) rather than only in rt5668_remove()?

[1] https://lore.kernel.org/r/sashiko-outbox-190014@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030154202.2989=
936-1-tristan@talencesecurity.com?part=3D1
