Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941122;
	b=RhBxg1x31GRl8pMcc1yoliHrXJ24jpo39xGG8/OVnbXZEEsJ2IRSAgxZs8BWu9pzwapp
	 MMKrP2dedYwMFlnxi0g0XUU+F+I2ErF40Jvenz31JrzbG/+KWfFrZCfPiwQoF0SKoeZkE
	 /uuWwoMninHhm8HIKpBO6O0iEm40aZKX3LqOJrUkwZa9p/JFz6jRg3mrLd9rnAfxsGoEw
	 vfFQKjC5UB+5lnQAdYKJYa1EGzcQ6qWA7erWrBKP6UeVILuUKziXDxE41s5ImepB6oWYO
	 VaGw0GtWfwoh/UpZR6z7j4I3xWMKljGsLS2gHf1YJAPKBwn+BELdJSgazN53qXrIlSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RRl42yJYz6oEBYwqAyvzFsCtsjBnZUlgjJHjA4rJtNU=;
	b=4I9atDSZuAPKkpcFaxTs/xxYAf4jfuJzZ7Ykx4jclLAQ4WuX5BQJAwZXqPoNpN+E4h8V
	 FVpuFhllwoftir1Iu93duISZPLDXmM04WM8xODr4nDI/fwh6FFh7CMX1kPFBn4cYgP6vB
	 cXcy6TH5T7gyr/+XkuiP3n7+mrfTOwTxz2Ly6Enrf++nShC4BhB6Q+MJySKOO950tdepJ
	 Ct2Smdx5WqCmcQRYcRwxhserrOviwJ/mNHYsUxffShlv6or6hPFNoOutFeroXkw6Ubdf+
	 n/dj0xnl8BFA3IBfviJurWMNAqn7C8Eg5Hab5i0eoiRuPicAxCiaS6iKZvLqECDu9Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oK5zIUGg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F10606A31A;
	Sun, 25 Oct 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oK5zIUGg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E901B1F01825;
	Sun, 25 Oct 2026 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792941121;
	bh=RRl42yJYz6oEBYwqAyvzFsCtsjBnZUlgjJHjA4rJtNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oK5zIUGg8VR/mc6hPN70W7ndV0c7OeSooEd7SJb0lwdBBPjupIjyAVTRYsVMI8QTL
	 QbCSzXtKPqYTkL/d7KbVIZIB73S+5G06Nk0DHZlCtRl/GvRmKElJ051T04uffXvHxG
	 vJoLImPg9dbXlyneQVg4U6l3BPnIiTheOSTmMJhYTS/2tzX6LRHrlAxqzJIfuKDOD0
	 sJ0yz5glgBIv3MYjADWBc/hLXZCPzOxziyhoxaJXLKwqOeKHxsdRifrhjH5UoifoVZ
	 +iBKLKymB4J4Q+1XfoHhG8YNbaTgFTvyUQMx7k6RGBWqNRQt9UnU300PBqzoHUkIaw
	 6h5BfLqZWDgqg==
Message-ID: <sashiko-outbox-184258@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain TISSERAND" <romain.tisserand@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261025145354.3476371-3-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
 <20261025145354.3476371-3-romain.tisserand@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 15:12:00 +0000
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
- [High] ASoC: rt5631: broken probe deferral and devres leak in rt5631_prob=
e()
--

commit 007d8c8ed8d9eb5227bfb3317a7d30c761ada57b
Author: Romain TISSERAND <romain.tisserand@gmail.com>

ASoC: codecs: rt5631: Enable the optional MCLK

This commit acquires an optional "mclk" clock in the rt5631 codec driver
and enables or disables it during SND_SOC_BIAS_PREPARE transitions so
that the clock remains active while the codec is in use.

> diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
> index f97fd24e4229a..82d5e8b9c8891 100644
> --- a/sound/soc/codecs/rt5631.c
> +++ b/sound/soc/codecs/rt5631.c

[ ... ]

> @@ -1579,6 +1590,10 @@ static int rt5631_probe(struct snd_soc_component *=
component)
>  	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
>  	unsigned int val;
> =20
> +	rt5631->mclk =3D devm_clk_get_optional(component->dev, "mclk");
> +	if (IS_ERR(rt5631->mclk))
> +		return PTR_ERR(rt5631->mclk);

[Severity: High]
Should devm_clk_get_optional() be called in rt5631_i2c_probe() in
sound/soc/codecs/rt5631.c instead of the ASoC component probe callback
rt5631_probe() (similar to how rt5616_i2c_probe() in
sound/soc/codecs/rt5616.c acquires its mclk)?

During I2C bus probing, rt5631_i2c_probe() registers the component via
devm_snd_soc_register_component() and returns 0 to the driver core before
rt5631_probe() runs. When the sound card later binds via
snd_soc_bind_card() -> soc_probe_link_components() ->
snd_soc_component_probe() -> rt5631_probe(), if the "mclk" clock provider
has not probed yet, devm_clk_get_optional() returns ERR_PTR(-EPROBE_DEFER).

In sound/soc/soc-core.c, snd_soc_bind_card() catches -EPROBE_DEFER and
suppresses the error return to the caller:

sound/soc/soc-core.c:snd_soc_bind_card() {
    ...
probe_end:
	if (ret < 0) {
		snd_soc_remove_device_links(card);
		soc_cleanup_card_resources(card);
	}

	if (ret =3D=3D -EPROBE_DEFER) {
		list_add(&card->list, &unbind_card_list);
		ret =3D 0;
	}
    ...
}

Because both rt5631_i2c_probe() and the card driver probe return 0 to the
driver core, neither device is added to the driver core's deferred probe
pending list, and unbind_card_list is only retried when a new ASoC
component registers via snd_soc_add_component(), not when a clock provider
registers. If all ASoC components have already registered before the clock
provider finishes probing, can this leave the sound card permanently
unbound?

Additionally, component->dev is &i2c->dev, whose devres lifetime is tied
to the I2C driver rather than the ASoC card binding. If a later component
or DAI in snd_soc_bind_card() fails or defers after rt5631_probe()
succeeds, or if the sound card is unbound and rebound while the rt5631
I2C device stays bound, does calling devm_clk_get_optional() inside
rt5631_probe() leak a duplicate devres clk entry and clock reference on
&i2c->dev on each subsequent rt5631_probe() call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025145354.3476=
371-1-romain.tisserand@gmail.com?part=3D2
