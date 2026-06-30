Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCDB427A06
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829930; cv=none; b=Lb0G3Fcoq3OGspuD7qPOWojY/NmFi6nhJxvLuFXSgK32SDkFuBbu3S0JqIkYAjgKRDR8UyPWpQ0pyeGCxO20yGcbWLqJBV7z9bOaf4cI2024G6WRbaiB1RS7B+4Kya1oPFDFOxUw+lUvi5qjmg1jIYzgi7rJBrBm+02YBL9DxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829930; c=relaxed/simple;
	bh=TiFAxsP3w/oGmtaBuyfb9KUxmCKiPn0XLQl7xLqstSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFaO9q+lKi9Qes/cI3TcfSAsmMJ+ZNgA67UuNGCJE79U6ZWj0Fv1B+tOXWCgEydQUL28JSZ+AJI2Wt4VGeB00twl5TUVr1xhLanWKHBJJknItmWEu7K+1m0vb8HA8KT6U91faIhuRgJ9rm2CfkXFZNR8Es1vziLdNXL8jGu28gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be/4E6Iv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be/4E6Iv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5F41F000E9;
	Tue, 30 Jun 2026 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829929;
	bh=qt7Ujv7MAdGM7YEqvBuj+I7xbhjsshDgmQOcv1WtWyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Be/4E6Iv2rfmp9ooITU70QTL5YuJw8rlNgPQnHuM9VdsFncj7Q2yK3fbdfM7mWa3E
	 4PY0Q6nRqmdpn2kQt5LHNUBx6IBWl3JnXkrHTh6v+ovYD/4ZX2HNUwQXxkULX8fn7U
	 /SiJtv4P49EnUyZuuvV1Yvv+8zYQECAwXC9w7UpX9Oe+lOz8EkdfAgif1Z0fKfFKTb
	 XPN365uRtdZDOcGSZFhUgL/cLpZqR+ZnJZK5z8BpgSnshlGj6NeY7ookg3t01jg7WX
	 aBcSpGOlGPWMri9+CIURgLBXvskeA7lEMu1vGJwjUfEnRrSh1c5oM5uGh1kCY1CL3/
	 +f6hZgvPMvBog==
Date: Tue, 30 Jun 2026 15:32:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/12] ASoC: simple-card: tidyup simple_util_parse_xxx()
 in simple_parse_of()
Message-ID: <b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
 <87v7b5dddd.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="feabMpLp1+i+Bu3P"
Content-Disposition: inline
In-Reply-To: <87v7b5dddd.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Air is water with holes in it.


--feabMpLp1+i+Bu3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2026 at 06:28:30AM +0000, Kuninori Morimoto wrote:

> -	/* Single/Muti DAI link(s) & New style of DT node */
> -	memset(li, 0, sizeof(*li));
> -	ret = simple_for_each_link(priv, li,
> -				   simple_dai_link_of,
> -				   simple_dai_link_of_dpcm);
> +	ret = simple_util_parse_card_name(priv, PREFIX);

There's a fallback for using the name of the first DAI as the card name
in simple_util_parse_card_name() so we need to parse the DAIs first.

--feabMpLp1+i+Bu3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpD02UACgkQJNaLcl1U
h9BJYgf/WG48zZ6c7c0Orb2ngeemMG2I/Dloagtg434Y4qqx9tVJe19uJUpGY2sn
u+mXHc3BsZKbBcu+uTYLvClg28jEQXoB4rFgAwkMXIyEqEpDgv1p2WpKd+zfQtQB
95mhfRO9wx10BXQtVD2l7n0UxWFYRW8wZ4V2Ed8t+NT7UwZ4e1UmM3CGwFNoIo2g
EnaerRZ6Vkeanx7/jUW+H4+aQpSxNZQ8g6AUpzBLhgPil1/D9EcyEmlsCcPBNA9M
ojNioXc9dfd+4QsC4XDR+gvKqiicHXYe3B7nLvdNGB9JTvOXvMBvlREt+g3G7fsb
lSZYafo0U0Mbn4bEvew1/dTqJ6Za9g==
=Z881
-----END PGP SIGNATURE-----

--feabMpLp1+i+Bu3P--
