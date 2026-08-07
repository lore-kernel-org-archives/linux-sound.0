Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD03D9DDF;
	Fri,  7 Aug 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143188; cv=none; b=Cz6EnI9BPEgNMl8ik6g8qwK7iB+UrISYrGBq0KHGPlsS/QzFPQUMa0tazqjkMSyD6fKOYbZrkjFK9j8kkNrYQp4lZ6eb+PLBgYc9Eq3cAHg0cm4LA8loOL8qwPZeofy4yZLG3D6sYT4t8UY8MJWZ3PQqFfjz+f0SOz4E3Oj8r7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143188; c=relaxed/simple;
	bh=4lNSm7HPsEj/fL0NUxM+0e1jgDk+Dlr1KvfqOH1neq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC+7kPFSWdfJYGqzEU1mkDwKcFojaqA3N0FJgvWNuy4l3LBnjMgyH9UlwZxnRQgixZar7gAf7yswNEDNUZPRnDq8Cf/7CWFc55TK6SBkam0nDnMQpuer5AvV8Pvoc2z9ze6v+oX67mb+rOs7U7c67uydgMTcrEcCeAo5nzmw2m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEjeYbm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEjeYbm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061471F000E9;
	Fri,  7 Aug 2026 22:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143186;
	bh=a08ege2A6PubBI8+f0PrNyavH3OH8v6KWoV1np/vCzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEjeYbm0F0jk6hgaUvD7udZN9KLlRTlcmx6WiHpm78T8ZNvzuDgjhP1HjvQw2pyGf
	 PbSJ24h9+tiX8tXdbaGCj5Jhw41++NsRISoVaEmhvd6b1GaqfiuP1Nu3o1tHuy//qj
	 hiJrSNL/Jyc82J76wQCQBESN0X26C0RNcycsUeRbRyyEKWqWHXuNi4sYVEU+aQyx6I
	 LZqeAGLuSw4mdbB0Ioa+26PULe/cZvpd7puAWSKXph5Ar2ZmZRxgJfk2cNXwisqhQx
	 Z3U3Fuz/avDeDQnKJt4GxvwqkIBiob59bGfAhndOg9LkkaP6Jasb4iiHQajvbce9ES
	 iquwEFePYuFJg==
Date: Fri, 7 Aug 2026 23:52:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Message-ID: <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L/1rhFeghNUEqwsR"
Content-Disposition: inline
In-Reply-To: <20260807200936.201827-5-ansuelsmth@gmail.com>
X-Cookie: 1 + 1 = 3, for large values of 1.


--L/1rhFeghNUEqwsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2026 at 10:09:34PM +0200, Christian Marangi wrote:
> Add support for the Sound system present on Airoha AN7581 SoC. This is
> based on the mediatek AFE drivers.

> Also add the machine driver to create an actual sound card for the AFE.

This should be more patches, the machine driver should be a separate
patch at a minimum.  Possibly PCM and ETDM drivers too.

> +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct an7581_afe_private *afe_priv;
> +	struct reset_control *reset;
> +	struct mtk_base_afe *afe;
> +	struct device *dev;
> +	int i, irq_id, ret;
> +	void *base;
> +
> +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;

We allocate afe here with devm_kzalloc() so everything is zero...

> +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> +				 GFP_KERNEL);
> +	if (!afe->irqs)
> +		return -ENOMEM;

...then we allocate an array using a size read from the struct which must
therefore have zero elements.  We also didn't assign dev, either we
should assign it and use it consistently or we should drop it and use
&pdev->dev like the first allocation.

> +	/* register component */
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mtk_afe_pcm_platform,
> +					      NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
> +
> +	ret = devm_snd_soc_register_component(afe->dev,
> +					      &an7581_afe_pcm_dai_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> +
> +	platform_set_drvdata(pdev, afe);

The component registration might result in a card being instantiated so
we need the driver data initialized before we try to register.

--L/1rhFeghNUEqwsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2YcoACgkQJNaLcl1U
h9ARiwf+LpDqvrfwUmAxX0QX50R8ii4KPIXyv5I0qvKJZcQ4j3ofe+outq7w/7zh
nJsC2gzVvtmzP7LOx3TdiR4pj1w2uRSI9ymg2rKoU05VzD3CEIjNtm/YIqPbd8cR
T4WQlImD5NQ9K7U0NgP1N+y7uX8r0QMikrRUMiw6k/D8CzaSsmZ6fCL8RQq0ge6O
oUJqMGcsdRn5x4ppuwy4y8FIn/Z73xEoAHWTQrf6jtLPBM8f++3t66ULaDKhwf+L
+uflmWRcVPBtXHGwQaqYImTilXTk6wYVmMqj7OBEuLnKiHyYN5bA4Lm53gbqUBE4
9Utlm+txNJsPR3uhLbGfxdFrZ3+lQw==
=/wv4
-----END PGP SIGNATURE-----

--L/1rhFeghNUEqwsR--
