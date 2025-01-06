Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7EA3595D;
	Mon,  6 Jan 2025 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166845; cv=none; b=l/V/r4hSbBrwhovx+FCR3ApLVlOiyIveK9qRoCj14TSR+LVxKOhGH9xhnEN1cgusxz+OJUmRnkZ1BvYhguafrIW3F/VemSxt93SikOJtEOtKn33V83N3LN47wKwDadSzsZ2UULakQjpnCaLoQv5jO/WFM8NZ+X7W/szO1AZ3jJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166845; c=relaxed/simple;
	bh=i7w731IFCzIky1RLfI7EHWgITq0kG54tDQYukdiLhdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia2t44BJQ5YeLIjDeYPps0hgCRQ8WNN9crIAxODlko8VGf/NaBDakqEnw7tj3BsfPMHXiDe55XeMB6dEIl2O1s8h1eHeXhDmAmjk/ambcc374cgDzgnRBjnkNJNNioYYrUkvl0RTNhlv+PpdC94ci1rc+u6iRbzKGjw2WWF0zoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WG+IbgBE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WG+IbgBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3AAC4CED2;
	Mon,  6 Jan 2025 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736166844;
	bh=i7w731IFCzIky1RLfI7EHWgITq0kG54tDQYukdiLhdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WG+IbgBEhm8B6t0B/kCYVStlNmbfqrX8I4P9gy1DpdeXzwIAE3zIQKmAG5xdG/47P
	 TlEtQ4uX+FRL8zMQRjgQTFwCgDB119ZTFT15mbTVTqf9jSutytgish6YgEEzLf1E3d
	 mtB26ruUwezy950Ij7pAtlBWByMX5XeD7u6RzJc5P07/iuhYIGhHA98KlKPQByi5Jo
	 hDCdsSTjn5VYMcf/xVLS7YnqBE0PzjhsMBw2dhr4OSmGzh1snltB04WQ0bIFl70C95
	 eSIpnFE7FEe71OACCmoAeK8QWdJgqxZzcUczIj4XUJJb0SMV294D9PZVrLWFAwpqCy
	 1bLS9TBOsrFAA==
Date: Mon, 6 Jan 2025 12:34:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add missing maintainers for Sound drivers
Message-ID: <2505bc4e-2968-414e-a7e0-4c0ac0862c55@sirena.org.uk>
References: <87msg4o4zu.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qW2R2BNLbzKwLlNE"
Content-Disposition: inline
In-Reply-To: <87msg4o4zu.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Do not pick the flowers.


--qW2R2BNLbzKwLlNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2025 at 06:01:25AM +0000, Kuninori Morimoto wrote:
> Mark Brown will take the patch. Add his name.

>  RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
> +M:	Mark Brown <broonie@kernel.org>
>  M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

It's fine not to list me for individual drivers, things like
get_maintainers will wrap in all the upper level maintainers
automatically and I don't actually know anything about R-Car hardware.

--qW2R2BNLbzKwLlNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd7zbgACgkQJNaLcl1U
h9DjUwf/dnE6gtTnhXkMHu9hn3Tp9qyjUewUqNNYslPfqZhyH6rZx0JYzhH5QTV4
K8wjZPeRRFyySvHuJWkhWooymclm9AzOkORlB8kKhFK+xg3k8XV92rgd9qNu4gw/
baXMYyYRKslE6c0/FeRyPJxUBmarrDisC+Fy2RaO/Aoknox+rvUhIrfNobhJjmIp
9Hdn8YM4KMvmQpsIFQZO6o3rm4VytctkWcw9HBXQpMuYsIPZhXDzAy2XNInHLy+b
E0ninFF9SErvMZlpVcEjK6inp2+ygwiORKwr0/8OtgowZRBOrOzeTu7+OEMd/qal
cQgPLHuN9++Zu/ydE3m6uia0QqSwqw==
=VVDT
-----END PGP SIGNATURE-----

--qW2R2BNLbzKwLlNE--
