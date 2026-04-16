Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356753C0625;
	Thu, 16 Apr 2026 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349400; cv=none; b=j4/W9pPOQ+wWyl0q5z3pvca3LFVKgwCHXp+8WBJ8+0244vwHoFbmQyte4p3VNFnie3ZFySI/Bnq4uDUad8hzDoUogD4MKA6v4d6gDy08DC0baPAFq947fVAfORms4IX6Xcxm6ive8/6TwJ/cbT9ax1XAvg0iPIok6xVgcpPAx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349400; c=relaxed/simple;
	bh=opPcvVlYuRkjUIo32RRgDtwtOOlKtMIz0mFBSIY2WOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNEFh3FC+ziMK3hehk8WnRJWEHKUZzrgk5awtWe3ztrur6C8LLQQ/po247V9quOJQ42mIeQckkWFb2sWSxeZOWo9f8GjWog7GhfFVV8uKCVt1H3cOlQCMfOxJX9wc5MQgzioDQLNGmq1xHkU1DMMGqIFcOx64aZBKfF99tPVZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVrlTw+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVrlTw+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B6C2BCAF;
	Thu, 16 Apr 2026 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776349399;
	bh=opPcvVlYuRkjUIo32RRgDtwtOOlKtMIz0mFBSIY2WOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVrlTw+ieUMT7xieZztjtWdV9B4SLOVadxtgetiQvQ10dPMK3yLwWgFj/ErgtsypQ
	 7K6oCS1unszJLViIhMWpRKmXQYvBNHQB+83K+8jiMmibL/Tbf8Zuc5OpN7Q6YBeEvP
	 CM0r12aTEh4AHtIaRKhKAUsOV+NkWA3uozMpCQcGw7E5wrsZzgE8ajythEAEyzyet3
	 wV125yHnUauN3vOpKQGpiIlfIqy7ggqjLtuvB8QtFPG+GPMmrC0ORLPaG6xYAUvruB
	 zir98diHX3X34+aUz3CNNDJK2RteQHg68tYu7ll/ULdr9O+6R7fOkgOHEUJKlFKveD
	 3t27gyXEZoPXg==
Date: Thu, 16 Apr 2026 15:23:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE and
 BE DAIs
Message-ID: <4601e621-69f3-44f2-8a77-37d53b5daca5@sirena.org.uk>
References: <cover.1776265610.git.daniel@makrotopia.org>
 <975f39291cffc5d3f201d2ec7fdc2cfdd1fed6aa.1776265610.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxRr5EZNrsglGDN6"
Content-Disposition: inline
In-Reply-To: <975f39291cffc5d3f201d2ec7fdc2cfdd1fed6aa.1776265610.git.daniel@makrotopia.org>
X-Cookie: Process promptly.


--jxRr5EZNrsglGDN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2026 at 04:23:59PM +0100, Daniel Golle wrote:
> Extend the MT2701/MT7623N AFE driver with the HDMI playback path:

> +static int mt2701_afe_hdmi_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{

> +	/* Channel count into the HDMI output memif (bits [7:4]). */
> +	regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
> +			   0x000000f0, channels << 4);

Are the other fields guaranteed to be already set up properly?

> +	/*
> +	 * 8-channel I2S framing: standard I2S, 32-bit slots,
> +	 * LRCK/BCK inverted. The wire protocol is fixed.
> +	 */
> +	regmap_update_bits(afe->regmap, AFE_8CH_I2S_OUT_CON,
> +			   AFE_8CH_I2S_OUT_CON_WLEN_MASK |
> +			   AFE_8CH_I2S_OUT_CON_I2S_DELAY |
> +			   AFE_8CH_I2S_OUT_CON_LRCK_INV |
> +			   AFE_8CH_I2S_OUT_CON_BCK_INV,
> +			   AFE_8CH_I2S_OUT_CON_WLEN_32BIT |
> +			   AFE_8CH_I2S_OUT_CON_I2S_DELAY |
> +			   AFE_8CH_I2S_OUT_CON_LRCK_INV |
> +			   AFE_8CH_I2S_OUT_CON_BCK_INV);

Does this need suspend/resume handling?

--jxRr5EZNrsglGDN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmng8NAACgkQJNaLcl1U
h9Dn3wf+Mnx8MVoz/CoB0OxIak3Sw/h8KczHapNPRJnhvDiRg4IpMHe539ZCHTwX
6fAQBc1V8g1+G/Up6I639OfuGz026oE9/V93dWIKJRYE8NhPi3cUXi3/GjXAXn/H
LgTZa7BudOMrHznrHlottyg4Y97CDNJXegfoD+lh3D6zoPoMdjjnFgHTmZ1lYeMW
Mg31QIIls9Optj4OAYqHuju/70vVXGAyH9tvijMo/WFsxt8rzjRgvLQGrA/ZiRAl
XGRUq5w/a0eB3i6OcUkeo8OiGssjUVRcQMdzqPBox0HyQNKVcIWgY8O4pP7bJGpU
rfvO0oI2IN/iTzTORd+PAeO9QPQtaQ==
=WwxQ
-----END PGP SIGNATURE-----

--jxRr5EZNrsglGDN6--
