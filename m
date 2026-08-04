Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDBF470435;
	Tue,  4 Aug 2026 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859127; cv=none; b=U/JUIVf8PnRBIyMy6WbrxCoIwiA8Aq4ABsnKCpNQ0LSruzc82dnJZ6C9/NafEwCD7kjde6lYA6zDQ3CfDqPkYBGY9+H5OZQbqXm1sSTVFDGGygGce/bfVD8z3J5q8+/AXGHasN/8i73MJfZpk6VLBXtr84CI/vSystRoWxhU8cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859127; c=relaxed/simple;
	bh=Uj+hqmUGSDBh3V5sSr8hvpvP2lfDmrKY/nrjhfGjB5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLva5MZdJwlKvwvEe7oDYhY/6KumfhG4ZvD4jnTXWBX9gfb+lBeOF+ZpAUToL8Zk0yTRH+Egz3oHj4m8H+1kp4YsP6UYrzv0yUZfjkLaRtCET+KPUrzupKcc1bzBtVtVBzgmX3IEqbsrOjY5zLUlArzuMwwGYyvvbp6tDfjqmrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSk39xSB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSk39xSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F2E1F00A3A;
	Tue,  4 Aug 2026 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859123;
	bh=BPuTDH8BEneJyLhanFOACvP5cUhQGXzhtwpAlvQiPRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RSk39xSBIJnLq/lTw7yoicTJ2+iY2XJ1bhHUB3W1sUbJoqo4MBQ9DdmwyQRop2khs
	 zsHqz5Fy9UKGzIEBIilBXglOlsBC8F7b9E236shPE9OE3r12tlXlapDb57bGG246fp
	 axNj7ixqaOIJo3tL0fE98C320FM1scosF5T8/f0LrG7f3P+gyRLiJfv/WHhblnwcRo
	 wLzZlDvX0Uv5h4WcOfpmLwS49Hm3gYkRBFSyP2fTfL9YEubK0sRMl9ZnSnUVFfs7+6
	 R+qcbfMe95pNT/bjO+jUK1L7RPggOxeGLm7fg/Fny1uPyCVql4PQs1yvLtqXrb1g5z
	 WAlrDcFPQEjPA==
Date: Tue, 4 Aug 2026 16:58:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XTeMuZ7doSQ6INCv"
Content-Disposition: inline
In-Reply-To: <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
X-Cookie: Biz is better.


--XTeMuZ7doSQ6INCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 11:29:51AM +0800, Neo Chang wrote:
> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
> stereo 30W+30W smart amplifier with an integrated low-latency
> Advanced Audio DSP.

> +
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +
> +#include "nau8360-dsp.h"
> +#include "nau8360.h"

You use bitfield.h so a direct include would be safer.

> +static int nau8360_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{

> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		ctrl_val = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_LEFT;
> +		ctrl1_val = NAU8360_TX_OFFSET_LEFT;
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		ctrl_val = NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_RIGHT;
> +		ctrl1_val = NAU8360_TX_OFFSET_RIGHT;
> +		break;

NAU8360_RX_OFFSET_LEFT and NAU8360_RX_OFFSET_RIGHT are defined
identically, presumably at least one of them is wrong and certainly one
of the above cases is.

> +static int nau8360_set_sysclk(struct snd_soc_component *cp,
> +	int clk_id, int source, unsigned int freq, int dir)
> +{
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(cp);
> +	struct device *dev = nau8360->dev;
> +	static const char * const idtab[] = { "DIG", "ANA", "Internal" };
> +	static const char * const srctab[] = { "MCLK", "PLL", "HIRC48M", "BCLK" };
> +	int ret;
> +
> +	if (dir == SND_SOC_CLOCK_OUT) {
> +		dev_dbg(dev, "sysclk: freq %d (out)", freq);
> +		return nau8360_set_sysclk_output(nau8360, freq);
> +	}
> +
> +	switch (clk_id) {
> +	case NAU8360_CLK_ID_INT:

Usually we don't have a lot of fine grained control of the internal
clock dividers of the device, things are a lot easier when the device
just figures out what it needs based on it's input clocks.

> +static int __maybe_unused nau8360_resume(struct snd_soc_component *component)
> +{
> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap = nau8360->regmap;
> +	int ret;
> +
> +	/* disable Sense at standby */
> +	snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
> +	snd_soc_dapm_sync(nau8360->dapm);
> +
> +	ret = nau8360_dsp_setup(component);
> +
> +	regcache_cache_only(regmap, false);

We start the DSP with the device in cache only mode - that seems odd?

> +static struct snd_soc_dai_driver nau8360_dai = {
> +	.name = NAU8360_CODEC_DAI,
> +	.playback = {
> +		.stream_name = "Playback",
> +		.channels_min = 1,
> +		.channels_max = 4,
> +		.rates = NAU8360_RATES,
> +		.formats = NAU8360_FORMATS,
> +	},
> +	.capture = {
> +		.stream_name = "Capture",
> +		.channels_min = 1,
> +		.channels_max = 8,
> +		.rates = NAU8360_RATES,
> +		.formats = NAU8360_FORMATS,
> +	},
> +	.ops = &nau8360_dai_ops,
> +};

Do you need symmetric_rates, the hw_params looks to program the same
registers for both direction?

--XTeMuZ7doSQ6INCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyDC4ACgkQJNaLcl1U
h9AahQf9F5kK6n9yrZew7//ocl7ez/1yPjOehgMQ2zHFn1Bqjb3f7ACqmhu5fxXL
z1EtIsw8T6KHAsRgh0z3JWFPqqFsHyKE5ahsEaNH3l4rssxIblKASLjmLud5PC2R
6B95uhA5uZOO7tzwQ5uHynnte1R8i5YoeW8PXToTYcZSYkg09WTtGlCxWvUsoVMZ
gjEj1IjtbEDTg8iNa0npAf/lDMssfePe69UOpB1A3Ls63W1CIvf0F5On97tJGk95
v/QAOh3u9nM0FbQ2G7HfXnuKQWMNUL30g+1+hRix3HG1QnO+ICZd9uOzwmExvYF7
gzjoNvlZIe2get3PoOZGi93KrNQGEA==
=kmsg
-----END PGP SIGNATURE-----

--XTeMuZ7doSQ6INCv--
