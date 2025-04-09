Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3A143C5D
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210923; cv=none; b=BrVAF+Eib5kYymC23iKLoZHYXorKqyL5V2Xzzm7MjVejF89Jxle/oFvefzEhOFJ8iG1dA+twn8IZUqu/RbPLJIeV72Se9KoEWNRUdLrdy07vou1CJVPDvMOzOra6pT+XnQkYJsWeyTEstBgCI1GQ+lLS9jAkPdqRTtoMcBEF8dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210923; c=relaxed/simple;
	bh=BEpQiC1wwRd8i3tTh8L5CtmwrE6fEs57JCbyTSMB5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBZ6QBXxw6JS8lzVU5c19vLM11NraBIajGVtpaf1DlO25vhb7fdjQQ/uZhn5YiOfxaTqbf8VOEKc+RWJbZPGnq40Pnfum6NiZUsj3jwblIpSoFzAd+ywe300MggcSkNFVWrXVOjKtuRYDcSGZPwLuV0apDGbxCbQxyvRmTSZdDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1RL2b1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1RL2b1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E3EC4CEE2;
	Wed,  9 Apr 2025 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744210922;
	bh=BEpQiC1wwRd8i3tTh8L5CtmwrE6fEs57JCbyTSMB5QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1RL2b1CnR8rkPvKDcE9UsTUxjes5MmkmfPPwYN8fpBmYKnl09ZQYxYO/xTSc7vuZ
	 fY2uMYSoBBp7Vj3uEYqA+4O8og2oX/dvhvLaMO5ntZE574TNnsiEAreHa9P8K7TvUN
	 5HyK08GheacdSTcCxHfMjN9FZ9SkorrGu4M1ZmkDK7lZLIPBrty/C6AeP9VJSd5piY
	 DgkCkT/gQQX2qQYcgar6ahcCkYUJMlNsEIU+1qkV8PhLh+AqbHWMEtdCRsWr+BHuoY
	 iQxbxJCTqZXxvyY4UvX7U55pUMbQ+VDBCZ8KgEAruZ72CGCI97ad1Co9E71UFP/Hwb
	 B/aL/zy1NNJ7A==
Date: Wed, 9 Apr 2025 16:01:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Debugging CPU-side DAI hardware with a dummy codec
Message-ID: <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
References: <4927043.LvFx2qVVIh@workhorse>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AAFB2p4gc6P7K3yd"
Content-Disposition: inline
In-Reply-To: <4927043.LvFx2qVVIh@workhorse>
X-Cookie: Words must be weighed, not counted.


--AAFB2p4gc6P7K3yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 09:58:07PM +0200, Nicolas Frattaroli wrote:

> So I set a driver override on my dummy-codec node:

>   # echo "snd-soc-dummy" > /sys/bus/platform/devices/dummy-codec/driver_o=
verride
>=20
> And hope to now be able to bind the snd-soc-dummy driver on the faux bus =
to it:

>   # echo "dummy-codec" > /sys/bus/faux/drivers/faux_driver/snd-soc-dummy/=
driver/bind
>   -bash: echo: write error: No such device

> Clearly, that doesn't work.

I don't know what specifically you've tripped up over there but there is
a little bit of special casing for the dummy CODEC since it's intended
to fill gaps with partially configured DPCM stream, not actually be
used.  If you just care about the signals then it would be easier to
pick some simple CODEC with no registers, as a bonus you won't have to
futz around at runtime overriding bindings.

> I hope someone can shed some light on this, as it seems like something au=
dio
> controller developers would be doing all the time.

I suspect most people test with an actual system.  A bunch of things get
easier if you can actually play and record sound.

--AAFB2p4gc6P7K3yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf2i+YACgkQJNaLcl1U
h9DHjgf9EVtZ2b3R0vfIKVmg2E55iRk6e8EGIQDMqUDgeIEESTaz3Y9nWz9QPVZi
M6NnoQ3Bu5PieUVqv+YOsZK0V6d5CWvmgiKZu1eMIbMPf/2t7YbPZMCCcbEV/5+W
YhT6H8eGgXVx1R2X9Jt6KSasB18ccoQ+gRCdCJgrLFW1pFVU3N649tpnLGsDelYX
TY+RMrypyFc3PVCMm12D2W74HDDFfeJg2dO2CnfX4KK4q6JiV/89wqIpCOcrutXa
cjsWn9arP/HwnOU4DTh3q4jv0fX+ReZgDjZwOsjqK2Eu5F+o/nUhfOzVGR1WVOj2
EieceSgsLuouuPlzn/eAw8A+UDjdlQ==
=JX3a
-----END PGP SIGNATURE-----

--AAFB2p4gc6P7K3yd--
