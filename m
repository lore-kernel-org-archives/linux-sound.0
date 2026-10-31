Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432552;
	b=JxyhBztILmaMfGL1D3/9b5OFFQqvlJj1riKF8xkXc1ePrkX3nmRtxDq70MHlPvbPFnmz
	 X8JcdTe71Cja5v8hiaoRxQqwxhrR7GvtM75A+O6OK4/yyeGRyfjGv6stu3hFgJuXFlUR4
	 8INeAji5u47DlerT1/+v78sQT2YCUAeC8/2xg+rQ7/GKFhvzc6ol9j4Ef39HNGSvQRnpL
	 LztDqOfOjDvRzvjCgjRaX+xKItG5tiYB9n8eJCnQZ2E7iSg+sfejUEkHl3c99h7a15Er6
	 FVWfw/IWG1WnrkysneHPdz99W3ScyRAs/46yhh0TrdPfUHEOpdPYMVoI/v8TjeTTl7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hn/nwXJhFBhst3ZnpwR5kBtDLZZ4lESs6r1iztxyv7g=;
	b=WHS427TCHBlpVhsC2Az3rWtrCIHNM67O+bpWV9iYGPU7I+apXJho9yvEqNWIqJQTVzN6
	 dCTj7m0r2Mbny2nEtwoc46OtCLEm2hMkrZknMWZhD/IV1s4tiZfHE6isDWSWgwVpQCX0A
	 KQ3GgngV7l8Nc8AzqrwBOYz9vAuIrgVu/dkxWKrdQQ1xOGrtRxiRO0TaEDAnHvP6z1VdV
	 SecK75LLEZDy8Jjq9j768TH6AEyca4CCj/eTL2oZ3ABrac21G7F06VU+jk09Z4ui7KgkH
	 5fRSwxCSRZh0sXJcH9uzKt99EfPbO4F+7wvv8l3n/uGRfJmZ7AN4TzQeDQChGkMwejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SvI/gskR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D9606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvI/gskR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B6C1F000C1;
	Sat, 31 Oct 2026 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793432551;
	bh=hn/nwXJhFBhst3ZnpwR5kBtDLZZ4lESs6r1iztxyv7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvI/gskRYoSFieGwng9lzv5xV7KLAMQs/BhMobDXQQk5nwmbfsrGIiFXdqS19k1Io
	 WbnjYwf5ekGooT6Rek4NAueqmyujVE6y9Gf/w0asVLeW+kv9j3EiKLVtzBesTAUeAv
	 JdXhosMjW8q/+ZzhWKQ2dA4tSbjRYCVAq6Kj0QsCeCA0z+mj78NyAWIfwv43GJ9+Hi
	 2VR7FPRx4sO64YFq3hsqGolDssTLY48MR9Cq9OY19j9tGUuBHlaHr6idr30EPsu4ts
	 wbobD/q1KcwySfoVBOiuB+3rxOnsyrFTay9jf4pgEyzzsAlefWM5ZdeJSm2dA/q+21
	 NMKcPXUf/dYrg==
Message-ID: <sashiko-outbox-191806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: es8328: reset the codec at probe time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031-es8328-vol-init-v2-1-d15b04c22f4f@163.com>
References: <20261031-es8328-vol-init-v2-0-d15b04c22f4f@163.com>
 <20261031-es8328-vol-init-v2-1-d15b04c22f4f@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 07:42:30 +0000
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
- [High] ASoC: es8328: NULL pointer dereference in es8328_spi_probe() match=
 lookup
- [Medium] ASoC: es8328: missing regcache reinit on reset in es8328_compone=
nt_probe()
- [Medium] ASoC: es8328: missing everest,es8388 match entry in es8328_spi_p=
robe()
--

commit 011e1ea21d759f33d35a0271cc926730dcdcfe1b
Author: Bob Hui <bg9oxa@163.com>

ASoC: es8328: reset the codec at probe time

This commit issues a control port reset in es8328_component_probe() so the
codec starts from its hardware defaults even after a warm reboot or driver
rebind. It also adds per-variant reg_default tables for ES8328 and ES8388 a=
nd
selects the regmap configuration using I2C and SPI match data.

> diff --git a/sound/soc/codecs/es8328-spi.c b/sound/soc/codecs/es8328-spi.c
> index 88e353ae52a10..606de21e98e1e 100644
> --- a/sound/soc/codecs/es8328-spi.c
> +++ b/sound/soc/codecs/es8328-spi.c
> @@ -14,15 +14,20 @@
>  #include "es8328.h"
> =20
>  static const struct of_device_id es8328_of_match[] =3D {
> -	{ .compatible =3D "everest,es8328", },
> +	{ .compatible =3D "everest,es8328", .data =3D (void *)ES8328_TYPE_ES832=
8 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, es8328_of_match);
> =20
>  static int es8328_spi_probe(struct spi_device *spi)
>  {
> -	return es8328_probe(&spi->dev,
> -			devm_regmap_init_spi(spi, &es8328_regmap_config));
> +	enum es8328_type type =3D (unsigned long)spi_get_device_match_data(spi);

[Severity: High]
Does calling spi_get_device_match_data(spi) here cause a NULL pointer
dereference when probing an SPI-connected ES8328?

In sound/soc/codecs/es8328.h, ES8328_TYPE_ES8328 is the first enumerator in
enum es8328_type and evaluates to 0, so es8328_of_match in
sound/soc/codecs/es8328-spi.c stores NULL in .data.

When es8328_spi_probe() calls spi_get_device_match_data(spi),
device_get_match_data(&sdev->dev) returns NULL and spi_get_device_match_dat=
a()
falls back to spi_get_device_id(sdev):

drivers/spi/spi.c:spi_get_device_match_data() {
	match =3D device_get_match_data(&sdev->dev);
	if (match)
		return match;

	id =3D spi_get_device_id(sdev);
}

Because es8328_spi_driver does not define an .id_table, spi_get_device_id()
passes sdrv->id_table (NULL) to spi_match_id(), which immediately dereferen=
ces
id->name[0].

> +	const struct regmap_config *config;
> +
> +	config =3D type =3D=3D ES8328_TYPE_ES8388 ? &es8388_regmap_config
> +					    : &es8328_regmap_config;

[Severity: Medium]
Can type ever equal ES8328_TYPE_ES8388 in es8328_spi_probe()?

In sound/soc/codecs/es8328-spi.c, es8328_of_match only lists the
everest,es8328 entry with ES8328_TYPE_ES8328 and omits everest,es8388, while
es8328_spi_driver defines no spi_device_id table.

Because Documentation/devicetree/bindings/sound/everest,es8328.yaml specifi=
es
the ES8388 compatible list as everest,es8388 followed by everest,es8328, an
SPI-connected ES8388 will match the everest,es8328 fallback entry and use
es8328_regmap_config instead of es8388_regmap_config (and also skip the
ES8388-specific ES8328_DACCONTROL21_SLRCK setup added in follow-up commit
db663b096dbe9f68fbdc51ad2211743c7793550e).

Should es8328_of_match (and an spi_device_id table) in
sound/soc/codecs/es8328-spi.c include the es8388 entry as well?

[ ... ]

> diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
> index aaa6646ad4c5e..f04e310262e79 100644
> --- a/sound/soc/codecs/es8328.c
> +++ b/sound/soc/codecs/es8328.c

[ ... ]

> @@ -836,6 +837,30 @@ static int es8328_component_probe(struct snd_soc_com=
ponent *component)
>  		goto clk_fail;
>  	}
> =20
> +	/*
> +	 * Put the codec into a known state: the supplies may already be on,
> +	 * a warm reboot or a kexec keeps the registers alive, and a driver
> +	 * rebind leaves whatever the previous instance programmed.  Without
> +	 * this every read-modify-write in the driver works from a value the
> +	 * hardware never had.  SCP_RESET is not self-clearing.
> +	 */
> +	ret =3D snd_soc_component_write(component, ES8328_CONTROL1,
> +				      ES8328_CONTROL1_SCP_RESET);
> +	if (ret) {
> +		dev_err(component->dev, "unable to reset the codec\n");
> +		clk_disable_unprepare(es8328->clk);
> +		goto clk_fail;
> +	}
> +	usleep_range(1000, 5000);
> +	ret =3D snd_soc_component_write(component, ES8328_CONTROL1,
> +				      ES8328_CONTROL1_ENREF |
> +				      ES8328_CONTROL1_VMIDSEL_500k);

[Severity: Medium]
Does resetting the hardware in es8328_component_probe() leave the regmap ca=
che
out of sync if the ASoC component is rebound?

es8328->regmap and its REGCACHE_MAPLE cache are initialized once during I2C=
 or
SPI bus probe in es8328_i2c_probe() and es8328_spi_probe(), whereas the
control port reset is performed in es8328_component_probe() when the ASoC c=
ard
binds the component.

While the card is active, registers such as ES8328_MASTERMODE (in
es8328_set_dai_fmt()), ES8328_CONTROL2, ES8328_CHIPPOWER, and mixer controls
are updated in both hardware and es8328->regmap. If the machine driver or
sound card is unbound and rebound while the I2C/SPI codec device remains
bound, or if snd_soc_bind_card() fails or defers after soc_init_pcm_runtime=
()
and retries later, es8328_component_probe() runs again and resets all hardw=
are
registers to their power-on defaults without reinitializing the regmap cach=
e.

Subsequent snd_soc_component_update_bits() calls then compare against the
stale cached values from the previous bind and skip hardware writes when the
new value matches the stale cache (for example leaving ES8328_MASTERMODE at=
 its
0x80 master-mode reset default when consumer mode 0x00 is requested). Note
that while the unused es8328->type field added in this patch is wired up in
follow-up commit db663b096dbe9f68fbdc51ad2211743c7793550e, the regcache is
still not reinitialized after ES8328_CONTROL1_SCP_RESET.

Should es8328_component_probe() reinitialize the regmap cache (or bypass ca=
che
for the reset sequence and call regcache_mark_dirty() / reinit) when resett=
ing
the codec?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-es8328-vol=
-init-v2-0-d15b04c22f4f@163.com?part=3D1
