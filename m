Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F351407CD0
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394144; cv=none; b=HVPpQ8Iv2H2/ZrUwxOtYdPOH4aUQRGFeZHW2Dkpx25HMCw6d+LVzZYILBdpdxjGdcYQkxH0Qi0xvYZT0UxCOpSUnS0P59JplZRMu79xfLgZwrmPZDDNjW5BFjd7iFJv8Z/m3N6fIL1B3OZyjxKBI6sE489bnLxOscRzsXFqkk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394144; c=relaxed/simple;
	bh=vZb35lDE/ivGGx2QvEEVYb9F7lzSB7bWQR2qdMvuXh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7krv24Fmchhs29SWgQAlN22nD8IZ6kw0VtyZhKuZeoP7QlAv5ZipjU2g27ZJZWz+CzP0vgGSo9BnYIYHwZRRWeW5vF1879w3gNEGGN1pHsYSEOxts6S/VMM9t5BDk1okSE6TLLaUCYFtKv9xQFyYYg+4wyD+/d5XGu389ptX4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLX4UHVh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLX4UHVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5449F1F000FF;
	Mon, 14 Sep 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394142;
	bh=vZb35lDE/ivGGx2QvEEVYb9F7lzSB7bWQR2qdMvuXh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLX4UHVhpTr7c/EjErxi/Rcdk6BbdOIAjwpSEnDlbp7RONuLN6WBL/UHeohEE3rVT
	 Y+T7Z5JxwnAbhDMlFlZQeRDsNybC4lTWl93avfbp8KmzxhtWFKnu2sHy6hNCz2kpvN
	 4Lb2cdtsjs5/volSYxM3GzUWMJJOuwMcOSRvJNB026rEy1WyIx3eGDttbYMLt6HOZF
	 afY295HDTzGVVWfv043mn/bcaEiUOYKq7ykdeQff3bhQy5Mb6PDJZBynJKOjFuFD9n
	 fUdL6xYKl1Gb7poSWvx+P8hUnBRpxneJCinb4iPo3+Q4R1NRPveNupE7XycAE8aZ6X
	 4wWRfe+QrM1CA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F3E551AC52F1; Mon, 14 Sep 2026 14:55:39 +0100 (BST)
Date: Mon, 14 Sep 2026 14:55:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/10] ASoC: soc-dai: add snd_soc_dai_get_bclk()
Message-ID: <aqf821dqgbOzUP4L@sirena.co.uk>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V/RyRrTnO6rx633K"
Content-Disposition: inline
In-Reply-To: <87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: My vaseline is RUNNING...


--V/RyRrTnO6rx633K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 01:47:55AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. DAI priv has been mainly referred from SoundWire driver.
> Let's add snd_soc_dai_get_bclk() for internal use.

Weren't we trying to move more to snd_soc_dai_bclk_get()?

--V/RyRrTnO6rx633K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn/NsACgkQJNaLcl1U
h9A0kwf/QslVU9RnEnDis9CLqECGGcMvGOW3R2G4ak+Gv4fqO6hrPoV9XYyIRPd/
vl2nClzLdcj1fAoHHWIePHgWHZ2urFdkn3N0eoazKwsd8rt7yJjaasfreje2gELC
+Y46jxzWO5Bd+IoDp8QwwFVhZWsptsAAZlTkaI7f+9yLGR/7ELp+NmQLW4RqHeU1
u7cr1o73nRB5zhpp2xHnDdn6AIxZc4V894NzmeeU4TxqPRtctTJcgm3yOF6Gy42R
DEHmOGY7xmZaHM0xCrHzXFf3J6mQNxUy54gdjpWcjoHmBSc3PaLTsKweGNA8PqXp
giMEyYNUVSfeOydYaajcymEMomPWJg==
=+N9I
-----END PGP SIGNATURE-----

--V/RyRrTnO6rx633K--
