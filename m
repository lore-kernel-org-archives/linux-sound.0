Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD023ED13E;
	Tue, 14 Apr 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183685; cv=none; b=Nv4xCKtqOHE32dNw8P8AojI1kEJzYcU8JTdcfqb629cU2MAQavn0cdgsaofRE8meRvMesh4WjFbj+EXsJJFaEsW4NREGECV925hIbwNxvQ6KVF81vNcBGuNUrdvkrIsmVz2AHVYyNHyH5P1fFRpYqRZuUxZKCfSg+qHUfzeBRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183685; c=relaxed/simple;
	bh=L+p7vVyi0ZuGNy1NR2PmnEYPIp03GJxMFlPl1DRyxPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkBZWmTMXCKTyWrEckyufXziFYxnYOc9km069NYHkReDAFARVxlSmPuGvE9mBCvSj1tGvh4ilWah+ap47gNho4yNJz9sI7ZWecmAWq8a+YmPMo2ggAUHzQ1D4QCKpds8HSZUMUu4uVMSEt70oGZr3jG3BnrpsinmXhTx3/aIpaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOIjKyZa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOIjKyZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E69C19425;
	Tue, 14 Apr 2026 16:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776183685;
	bh=L+p7vVyi0ZuGNy1NR2PmnEYPIp03GJxMFlPl1DRyxPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOIjKyZaZ/IfJvIgjdqfDbtHAYwbCjaflZ/Os1aiwlhfe89Ej4+7Tu6eWhM1wI43l
	 0TQ7OGUaCZr95ce5+6GTl81meF4dLxTNbtHq4YEhCBRkQERKmXPff3To2k+POh4ibH
	 FNdifqmgWlCzvvUn7ZOTS2bbkt1VBltVvyYj2PFuKFF68y3lNn6/4vNgdm/e+oN4NS
	 QYMakyesCHdx63hfc7VnzONb7hYGWr6QD3n61h+L/udWivNP7dUtCxxOVh5+Zqou3B
	 nWCp8AjTiAJbgcF2waATiJzrf9KIrR/3cAp+QsvRZ2+ApXgjTfY3PpISg5tvEH6zAG
	 oLJujwe8BX08g==
Date: Tue, 14 Apr 2026 17:21:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 01/11] ASoC: meson: gx: add gx-formatter and
 gx-interface
Message-ID: <34a800e1-2ea1-449b-913d-f14f994a46b8@sirena.org.uk>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-1-4c8a6ec5fcab@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ThtFczj72toqES9e"
Content-Disposition: inline
In-Reply-To: <20260411-audin-rfc-v2-1-4c8a6ec5fcab@baylibre.com>
X-Cookie: Academicians care, that's who.


--ThtFczj72toqES9e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 11, 2026 at 04:57:26PM +0200, Valerio Setti wrote:
> These files are the basic block which allow to shape I2S in GX devices
> the same as the AXG ones: the DAI backend only controls the interface
> (i.e. clocks and pins) whereas a formatter takes care of properly
> formatting the data.

> +int gx_formatter_probe(struct platform_device *pdev)
> +{
> +
> +	return snd_soc_register_component(dev, drv->component_drv, NULL, 0);
> +}
> +EXPORT_SYMBOL_GPL(gx_formatter_probe);

The other allocations in this are devm_ but the component is registered
without using devm.  Not using devm also means that all the users need
remove() functions to unregister the component, there isn't one for
AUDIN.

--ThtFczj72toqES9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneaX8ACgkQJNaLcl1U
h9B6uAf6A2m0yG3Y4j/XfhUBnzGIW4nBPB3PnZi5+Te4FO26/IniwmRzcM3z++SE
c323dI1EWkZFAa67hiWafnMH3mKcbDCQPqyWwmtif1y/FODAaeoYfZUiqZgkVkDR
v6oaX1uBg9ATaRQPQFPmJHL1fcQLtqbzWZg1kRpE5QXlboubISOT3IbByULGHFqZ
JVw5IZDGvrGCzKS039L9ozPMVFABUwYsqhX5DN7ElRBA8AX2gojlo9tuEf1vJGXZ
SThkCgS+i9NElRJq8M1bb0AXC5q7by6rdRDB1s8BQWkyp9DCZ5982teNFKt8PBd3
csX6oiRRn5VViHxk+hdzeXtTD8zTEg==
=ixQ9
-----END PGP SIGNATURE-----

--ThtFczj72toqES9e--
