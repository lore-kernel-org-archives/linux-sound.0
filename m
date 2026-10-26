Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018499;
	b=dLJ0XACScaRizXfZfI97UAGYEvJFAjN4sDNmJ1rEBjrwJmwOHrTVMSz6/CFu7PZbhCzf
	 InDUKByohxRoYnPQyIYUlFxkIZNjqJFkmdwPUCqVRuKwa6ZfIebMz4i//BXgj7LzdWyRT
	 K3p/pd1JMBmYzPLqmp6sChTqhMz/vVb6x+c/Xm3AQQf8suO2qUnxtnacV+AFMat0sG/El
	 AyUsJ8i7qhlgw58AWF67+rMd1p2BvHV0apeuz7X9W24dKRhk9q6ETsErOhZW1sxqmXjhG
	 1ZfaJ6fXWF+zKH4UoZ39wOXXB8kwrUNrwDpoaMGsccxwwUVqoSbVIXUHeJSiGmoxRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018499;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GndshxavDyR6g5d4ycL3YVfOSBvvDhFARszLssgwgg4=;
	b=hxp+2rnujrh19/GgIroqsYtKDVs9eB0kg0UHQdVwZc8EcwU8D0LLrwgaxfnJalF7zZ+S
	 1KawUpD2f4nLNB7443kfU/AeZ2s7RthjPLQSfb4c4YXX5bGQ2wmplZPSbtK2OBRSUguu4
	 H4Rzw6eJvLTzb/LSGmOClccwO8hEK9n35I/5q0BMmXNt+dMLMrTt1Jnzkh8kkxkmNo2iX
	 SSJ0JV8q2+P4XRAKCM3ggsZka56EYqWOazg9w65HBdfOfISyHoBJ7SHs6FTjJVIkcrRfm
	 Ck0cPHafQ3vk9g6sQhcCS9JFYYurPSKqgZXtcS8LeRFbRxV+fqLDootGXvicdla8zUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEGU5+Zz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9F7606A31B
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEGU5+Zz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8C21F01828;
	Mon, 26 Oct 2026 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793018498;
	bh=GndshxavDyR6g5d4ycL3YVfOSBvvDhFARszLssgwgg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OEGU5+Zz6zsAv+kDGVMDyPgQJ+gh4OrQF3YmSkebUKtQXZKmkhm60XD4Hh9xO2BS/
	 xgdDkfeiKMpSz6yN/2857iXl3NEZAd3kF52Ljs2+5wRrqRV5IUUVDsmGikMUHQSqVW
	 TybDmW6FkpsJcNDjTD8LUieq3yWjO133xAI2q/kD5u5Cg09qxL4LxXcB3s3KiMz9UP
	 qy5cEP3xHQAzujcOcztHLG4Xbgcy2QhRbYntrrD7jtj8DZDzA0Wmwdy6IHds5Euywa
	 Cx8jRxLIuZJl62rhwQL2c0ustSysCSMUGHlIezQqAlWVDqzhqNYFiAImdL4mTXFaQM
	 j8wioyOJf+GUw==
Message-ID: <sashiko-outbox-185227@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: rt5659: cancel jack_detect_work on component
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026112212.2519775-3-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
 <20261026112212.2519775-3-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:41:38 +0000
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
- [High] ASoC: rt5659: uninitialized delayed_work cancel in rt5659_remove()
- [High] ASoC: rt5659: uninitialized jack_detect_work used when jd_src is u=
nset
--

commit ca81fa64a51ff1ffcf9ce836fb012f5147653078
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5659: cancel jack_detect_work on component remove

This commit disables the codec IRQ and cancels jack_detect_work
synchronously in rt5659_remove() before resetting the codec, and
re-enables the IRQ in rt5659_probe() on component rebind.

> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index af8051fa69f89..d9daede7310ea 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c
[ ... ]
> @@ -3684,7 +3690,14 @@ static int rt5659_probe(struct snd_soc_component *=
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
> =20
> +	cancel_delayed_work_sync(&rt5659->jack_detect_work);

[Severity: High]
Is rt5659->jack_detect_work guaranteed to be initialized before
rt5659_remove() calls cancel_delayed_work_sync()?

In sound/soc/codecs/rt5659.c, rt5659_i2c_probe() allocates rt5659 with
devm_kzalloc() and only calls INIT_DELAYED_WORK() when
rt5659->pdata.jd_src is RT5659_JD3 or RT5659_JD_HDA_HEADER:

sound/soc/codecs/rt5659.c:rt5659_i2c_probe() {
	...
	switch (rt5659->pdata.jd_src) {
	case RT5659_JD3:
		...
		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
			rt5659_jack_detect_work);
		break;
	case RT5659_JD_HDA_HEADER:
		...
		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
			rt5659_jack_detect_intel_hd_header);
		rt5659_intel_hd_header_probe_setup(rt5659);
		break;
	default:
		break;
	}
	...
}

When the optional realtek,jd-src property is omitted or set to 0
(RT5659_JD_NULL), the default branch is taken and
rt5659->jack_detect_work remains zero-initialized with work.func =3D=3D NULL
and an uninitialized timer.

When snd_soc_component_remove() -> rt5659_remove() then runs on card
unbind or driver removal, cancel_delayed_work_sync() ->
__cancel_work_sync() calls timer_delete() on the uninitialized timer and
__flush_work() hits WARN_ON(!work->func).

Additionally, because rt5659_i2c_probe() still registers rt5659_irq when
i2c->irq is present and rt5659_set_jack_detect() invokes rt5659_irq(), an
interrupt or jack detection setup with pdata.jd_src =3D=3D RT5659_JD_NULL w=
ill
call queue_delayed_work() on the uninitialized rt5659->jack_detect_work.

Should cancel_delayed_work_sync() (as well as IRQ registration or
work queueing) be guarded by checking whether rt5659->pdata.jd_src
configured jack_detect_work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026112212.2519=
775-1-tristmd@gmail.com?part=3D2
