Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073493;
	b=hyOgTP6rHrkmHRMpcT+Tyj4n6rlycpXbyWdL84NE/Iy65GwVvKjhs+gsY7v1oRt0s1Cf
	 GC/M3k+t6ATcWXWKoEgtETYnaqD5IburXf7dFnn0ek8dToQQoLJJ3Eye0Ltl2Ij6iUJCh
	 /mkHIgqPEupnfouMoZ3Z4T1YInFfbfzq9l7epFaflJhtAckI0G4MOIomMLucXWrtG8tBQ
	 BI0148KmgXc9FGiErmUpL/yrME9SgZUP3Tf0nkKTwzHMR1AMwrxtMQpLVHkRDOih+txWT
	 BfarVRUuPbdQ1uO/x5aDvSXeZRDtxqtaTgtufyAjVk1AmgxVD0IdMXwa5+GfFw9NH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073493;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3ARCDQbMLFKwgR8chE3SvNExHjxGeN4fB9kDgInzSpA=;
	b=ZjOlbTh205muQMcJ36LQxvVXqsa+/bgo6V6xwjdgOLEX6qhZpdSbzIvwz4gcwC/hc29W
	 fsoyYNaDYJqjvdPYhqtRjsOn6xWmTLO6g5xSHmvYGEuWdEbTjCJg38F5lZ9ubXZ5Lyn9A
	 lRb/SdNCqtvZV2rfSeBRztbLvL3pLlSymwaljV6fuXyY1kJHe8UjAwvFPxs2JZ2dQ0XnE
	 j3Mq2iL4/UP91fCs8XOJmfy3lmpqvq03EV8nazimKWKkBEszxfTtZhu7qkrxXHPNEWBeU
	 jqvGV8xy27bnQaWNoQfsBU+20asZJNfDukoY8RBSXtzOBJgtcjhkqC9eb2TQS3NsiWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bJp/bkVr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869D606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJp/bkVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D221F0089F;
	Sat,  7 Nov 2026 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794073493;
	bh=3ARCDQbMLFKwgR8chE3SvNExHjxGeN4fB9kDgInzSpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bJp/bkVr1yDNPJQ8u65ED/9G/7oGwGrp7qhPjyEAmBa+ZN0tzIg1XtqnCssf+AUry
	 ulHaBnV80xruJIIrQKmpgIdYZcMYJBkH92ixfhggMLLGpu4WcffFJ1Srfe4jZcFxDV
	 Sd2zLv239IIJttu7+AN2CkLTnDnJhUT0RL0f6wunL2hhPci2b+a1NzVqoorG7FUhmt
	 l67w7sQ6NRdShLReYHtl9IRONKNiHwk0yIC64fkqatXM3xnUz+2tjX2u0lk15vuguu
	 tIPuugmYA63f8YSz3gZ0n3kF5u6CJYuIisuNXJNTmO7GJUSPrIcuoPIUPipMb9xKFF
	 YCOMcFasnKErQ==
Message-ID: <sashiko-outbox-203127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: rt5659: fix teardown order and stale state
 across card rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107171813.2561973-1-tristmd@gmail.com>
References: <20261107171813.2561973-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 17:44:52 +0000
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
- [Low] ASoC: rt5659: missing irq_disabled update and duplicated
  teardown logic
--

commit e0eba74c9cc9267e2d36067980ce5b886fe432a3
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5659: fix teardown order and stale state across card rebind

This commit resets jack detection state, HDA IRQ polarity bits, and the
regmap cache in rt5659_remove(), and registers a devm action to disable the
IRQ and cancel jack_detect_work during I2C teardown.

> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index 68f7d5673e190..b28804fa15806 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c
> @@ -3660,6 +3660,16 @@ static int rt5659_set_bias_level(struct snd_soc_co=
mponent *component,
>  	return 0;
>  }
> =20
> +static void rt5659_i2c_disable_irq_and_cancel_work(void *data)
> +{
> +	struct rt5659_priv *rt5659 =3D data;
> +
> +	if (rt5659->irq_acquired && !rt5659->irq_disabled)
> +		disable_irq(rt5659->i2c->irq);
> +	if (rt5659->jack_detect_work_inited)
> +		cancel_delayed_work_sync(&rt5659->jack_detect_work);
> +}

[ ... ]

> @@ -3689,17 +3701,34 @@ static int rt5659_probe(struct snd_soc_component =
*component)
>  static void rt5659_remove(struct snd_soc_component *component)
>  {
>  	struct rt5659_priv *rt5659 =3D snd_soc_component_get_drvdata(component);
> -	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> =20
>  	if (rt5659->irq_acquired) {
> -		disable_irq(i2c->irq);
> +		disable_irq(rt5659->i2c->irq);
>  		rt5659->irq_disabled =3D true;
>  	}
> =20
>  	if (rt5659->jack_detect_work_inited)
>  		cancel_delayed_work_sync(&rt5659->jack_detect_work);

[ ... ]

> @@ -4337,6 +4373,11 @@ static void rt5659_i2c_shutdown(struct i2c_client =
*client)
>  {
>  	struct rt5659_priv *rt5659 =3D i2c_get_clientdata(client);
> =20
> +	if (rt5659->irq_acquired && !rt5659->irq_disabled)
> +		disable_irq(client->irq);
> +	if (rt5659->jack_detect_work_inited)
> +		cancel_delayed_work_sync(&rt5659->jack_detect_work);
> +
>  	regmap_write(rt5659->regmap, RT5659_RESET, 0);
>  }

[Severity: Low]
Should rt5659_i2c_disable_irq_and_cancel_work() set
rt5659->irq_disabled =3D true and be called from both rt5659_remove() and
rt5659_i2c_shutdown()?

Currently neither rt5659_i2c_disable_irq_and_cancel_work() nor
rt5659_i2c_shutdown() sets rt5659->irq_disabled =3D true, and rt5659_remove=
()
does not check !rt5659->irq_disabled.  If rt5659_i2c_shutdown() runs before
an unbind or device removal, rt5659_remove() or the devm action will call
disable_irq() a second time on the already-disabled IRQ, and the teardown
sequence is duplicated in all three places.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107171813.2561=
973-1-tristmd@gmail.com?part=3D1
