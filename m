Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E52874FB;
	Tue, 19 May 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185602; cv=none; b=StLNn+DJRXmvAFSf3u/FiY4KWPRzJDaFB3VgRQltuhI/PU7oN254/WAoLhJum4/aCrnc9bVgW4nC9CKouMarFdMbHy9vGJb9xkARBZ36TdHT6jBIhlHaYjpIuzNWENCULduWnSb0FyspdR0nWr9bqS3pZbOxOFhPYQkyjQcZRVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185602; c=relaxed/simple;
	bh=541iEausToftLAh4jReY68+FF5Llndrw8sqtcO0F9b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuvHuA/xakwII4xRGtyl6pm22bznIuqCF4Q03EqusnrYYTXW/BNcvzvZselAE6F02rh9aIS64Z/nku9AIwB/b/2mILe1S9Y3rO6LN0tOjo+iYeFdyw7oiqZQc1T7BPWUHMHbMV6tbG77JCLeKcIsV4wjFz06gY9NBSnsVk/WDoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dczqc1jH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dczqc1jH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AD7C2BCB3;
	Tue, 19 May 2026 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779185601;
	bh=541iEausToftLAh4jReY68+FF5Llndrw8sqtcO0F9b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dczqc1jHwRjkNxz+I4pVqQLPHG68QLHRKeDXWK8pLkvJf7MI+MDtxaa/y6bqbusgA
	 TyLzByw18cS1z4JZPbJkpNjAZK7GbTjGjNmkTNvNtPbGlSVp/izZcpWd3uoC+FL3rW
	 AnRXV1bhgO+t+04GY0VSu0KXQiKSt7zuIksuAxk+Cg7edkdZPzx+pOGQRn2tOlIfko
	 O8KOFT3RiF2d8oyTb0hu5ymMhQDMisNqkNyN7IgplnDZKMvGyKXmke3zjn7guMEs1H
	 vjxa+wct1aYy7lVKxqq2+XpCsSOgngG/elYqALEu3WRPLecp10XE85H0G2Nu9BN5/x
	 GYDwjpctsIchw==
Date: Tue, 19 May 2026 11:13:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] ASoC: cs35l56: Use standard SoundWire regmap
 implementation
Message-ID: <9adb60fd-9158-494b-ac41-3b2c2ac5e029@sirena.org.uk>
References: <20260518130943.82485-1-rf@opensource.cirrus.com>
 <20260518130943.82485-3-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Reh8qbkJ31h4IJ/m"
Content-Disposition: inline
In-Reply-To: <20260518130943.82485-3-rf@opensource.cirrus.com>
X-Cookie: Huh?


--Reh8qbkJ31h4IJ/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 02:09:43PM +0100, Richard Fitzgerald wrote:
> Use the regmap_sdw implementation for SoundWire instead of
> re-implementing the low-level bus transactions in cs35l56-sdw.c

> -	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_bus_sdw,
> -					   peripheral, regmap_config);
> +	/* Low-level regmap to transfer read/writes over SoundWire bus */
> +	cs35l56->sdw_bus_regmap = devm_regmap_init_sdw(peripheral, &cs35l56_sdw_bus_regmap);
> +	if (IS_ERR(cs35l56->sdw_bus_regmap)) {
> +		ret = PTR_ERR(cs35l56->sdw_bus_regmap);
> +		return dev_err_probe(dev, ret, "Failed to allocate bus register map\n");
> +	}

This means an update is needed to select REGMAP_SOUNDWIRE instead of
REGMAP.

--Reh8qbkJ31h4IJ/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMN70ACgkQJNaLcl1U
h9AEYQf+PIFvUML/J7Mtnmy2EcShDxUMrd3aLs0AQYxXMDbAhglP2YzviZcAaW86
pUa5kuzIK3sPHqKZGhcZK9faeIXUcSK9rTZ5D52Ku1O53zLrUhTHPYIN8Rx/peG3
DSTpEgC4o8p73LX38aMlWDDyHtV9L1y7XksXThw+WtSBYqWy1O2EApD5FCJZPptW
73iOAhaMhft53RXkreD5g/kNzR3WJtsjjOrs0qo/J8gTdmc5UM8uxmaciKfLGY40
z2ESjYIBHFDGxCVPz/g8ddoWl8oVQ8QXX9TWVE2YGBCBOeVMqp0tsTfLKPcTz/Vn
R98EYLLxhRbltqq8ovDOqtUSjia27A==
=q8r+
-----END PGP SIGNATURE-----

--Reh8qbkJ31h4IJ/m--
