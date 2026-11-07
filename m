Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069568;
	b=hogJtX7pFIx4TTOwz8T7EvfF6lSMNkSD4h8OZKtEvxlIBZMzINPeJQh+UjKB2UWuRwHK
	 6cSq7RlZjYIeJM0Nfjk6ZCRjfvcSQI8yyzABGCnM0pErh/c3V37BXszu6aK3qP9E2LYXX
	 zTOeOXxa0L6yJ7/2ncXOd4BTYIDx0fGQ/rJrmYLRuuDwUKXiZmULe2V9w5FpgSov7bv+j
	 ZEupFz/dUngsLmx7u2i0OqGu47uRHPTdYCI1ZBOBrYNxY8NPU6U+4zx+hFsFXDKb5l6P/
	 Sm+JLjA5oQ7jn75mWhdSWMPWyQxeNh1R/LW+RHpGTLlCfNcCNdqWWBuJ8RB2sJezY6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069568;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EACnyDpcC2Ya2eT9bmi+9MftTVRyfSvaDOKOmOLo7D4=;
	b=mRIFqw2vrNw/BURYie89zOfokfFbQLwYUOEHaEY7cL00QWNjA9tH5vyC9pC+rZQ2MLX2
	 asbyl7XHcMspuMXKK+kAQWeAXLiO0+BzS4IEvz90Bv9iab0xOQmCY3iHygQUiKc23nTl5
	 haCt6NiM0zvs3wrAFKLHR/bXeERFtSfiegG7ivC2Vr8yOiY5lKZaBwW4yALff39sIZ0Q5
	 7Of2AQPIMHAjtGsK0foFucY8h31iNgvQK9Ll2+NhpJIvFVSxkD+wjCekgEnVZy9NT++8T
	 MRS3BCetQhAgiAyM2BdcEj8TXYE/XMVbujBJPaDt2lke46sjJUMeXgCSM9Q5xIessYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5Ba3LuA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADF606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5Ba3LuA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7B01F0089F;
	Sat,  7 Nov 2026 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794069568;
	bh=EACnyDpcC2Ya2eT9bmi+9MftTVRyfSvaDOKOmOLo7D4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B5Ba3LuAKtl+EzQU/zmnUo0iTlswurWv7ca2ruC8Xr1PreWcaB97f+SV1Ly2A3frM
	 LaF0iIV2qHkKM/bC1juqdX4soG1SrAn9QyVZqH3Lu4LyuH7kWw43g+u6YFBEC9phTS
	 RzZp8YnUKfCzer8kd1agdKsgv4XViZ7s55Cd01uYkiQL/ACIZ1/P9f4YKFB06SqHiM
	 TSgoI+g7y90ySZ2pq3KNaRExQZzIvcbugCwCAjZRdJU0cmU8S+n8R4MJGp2vUeIDDb
	 L8nOWSonuYLW938v529jRvJQm4KUII8VOcxbV2NkP+qY+G5qsFZnGS66XcJYIdf1xT
	 8wLalUfWYDv4g==
Message-ID: <sashiko-outbox-203062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: rt5668: fix teardown order and stale state
 across card rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107161024.1233587-1-tristmd@gmail.com>
References: <20261107161024.1233587-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:39:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: rt5668: duplicate IRQ teardown and missing irq_disabled
  updates
--

commit db40c33702a3afc67ec1edbbd986308c05f58e4d
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5668: fix teardown order and stale state across card rebind

This commit clears headset state and marks the regmap cache dirty on
component removal, and adds a devres action and shutdown check to disable
the IRQ and cancel delayed works across teardown paths.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index 29d70802a046a..c8aeaf25a7fd8 100644
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
[ ... ]
> @@ -2230,17 +2243,24 @@ static int rt5668_probe(struct snd_soc_component =
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
[ ... ]
> @@ -2584,6 +2611,11 @@ static void rt5668_i2c_shutdown(struct i2c_client =
*client)
>  {
>  	struct rt5668_priv *rt5668 =3D i2c_get_clientdata(client);
> =20
> +	if (rt5668->irq_acquired && !rt5668->irq_disabled)
> +		disable_irq(client->irq);
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
> +
>  	rt5668_reset(rt5668->regmap);
>  }

[Severity: Low]
Can this call disable_irq() twice if the device or card is unbound after
rt5668_i2c_shutdown() runs?

rt5668_i2c_shutdown() and rt5668_i2c_disable_irq_and_cancel_work() do not
set rt5668->irq_disabled =3D true after disabling the IRQ, and
rt5668_remove() does not check !rt5668->irq_disabled.  Setting
rt5668->irq_disabled =3D true inside
rt5668_i2c_disable_irq_and_cancel_work() and calling that helper from
both rt5668_remove() and rt5668_i2c_shutdown() would avoid duplicating
this teardown sequence and keep irq_disabled consistent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107161024.1233=
587-1-tristmd@gmail.com?part=3D1
