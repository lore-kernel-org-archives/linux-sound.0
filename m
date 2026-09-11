Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3D47D951
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132000; cv=none; b=SoHwN3GOZCoJcqamTML9D3RXua3eGNMgRzc9ea+Q7w9/z3SBilaCi3PkjM21NWsl2iut/m5kx7nPwMw+5OlkY4G1xew7ZbViM59Lx98ufQQFHxpSBOVF8/ApywC9tcLA8rBd900MsSEJ84tOSGw/fc6m/QVcYml9ZWVhjhS4tRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132000; c=relaxed/simple;
	bh=3/itur7j1mWFFs2PNVvvImf5EVdJRR9/8CJvl5Ol6X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc6it7Bhnd+s33zSY8BWQq6WCJkmbh9YzjygeDCw28NeDSAE3mZhR/0s1+FYYOH5n7RFSWVQt1N28HI163L2t/u/f0lN8eqq6nhPwTfyv537Z8+zaUs7vCFfnjvpPUfGpsyV9Bx0ZNN275YqNiojgapNjubUYiLx0mJ9VzObmuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk7b5Uki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk7b5Uki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2631F000FF;
	Fri, 11 Sep 2026 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131999;
	bh=vTONHa7G827KP2BuaodIchfbxoIhk5cnFl0hK5LPTa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sk7b5UkiQYs1r1gm5wY5nwhS68C2k+/1OnnsMsJ3b2K9JkYKwc8ZXAY+MMVCBgrNJ
	 rQwXSsHX+MmP2Jf0dpdAkzewkXHEu97wnAlwKRKUovjTVg8lfBcxb5Wz04J/x1286+
	 8iR2RDyoUgM5zX57Q259hzGBFWrQqdr7BthXMkWyorGqnXO12+2tG6rYPeBYvaNb+M
	 uMdeYnQd7KSICpYh37d2tLx0TMPqd4dNGdCn9gPQguYj4IF1QpNrUibRcaKtlFE0Jz
	 hjUtvv1ccKOY/u2MSpXv+iVj/amnHPjdsFxk+svG3rlkT3tzHkWt0yLlwoJfAL2NWj
	 wgHL2RjLNoCnQ==
Date: Fri, 11 Sep 2026 14:06:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v1 0/2] ASoC: codecs: ES8326: Modify the configuration
 and add kcontrol
Message-ID: <2b3120aa-faff-4dea-965f-d00e84aa2607@sirena.org.uk>
References: <20260911130337.4058-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pXcGW2FxUdm4A3j/"
Content-Disposition: inline
In-Reply-To: <20260911130337.4058-1-zhangyi@everest-semi.com>
X-Cookie: Piece of cake!


--pXcGW2FxUdm4A3j/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 09:03:35PM +0800, Zhang Yi wrote:
> Modify the standby configuration and add the kcontrol related to HPF
>=20
> v1 -> v0:
> 	- Modify the parameters of 'find_best_hpf_freq'
> 	- Modify debug information in kcontrol
> 	- Fix the issue with the incorrect removal of the jack report

The versioning is confused here and will mess up tooling - your subject
says this is v1 when it's at least v2, and the changelog says you're
moving from v1 to v0 which is a step back.

--pXcGW2FxUdm4A3j/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqj/NoACgkQJNaLcl1U
h9Bklwf+Kk8ERepbudBOD7Kwejc1TY7JsOphUzH5kFfxW4csLBDrk3LFF8Q/wmfm
azLJN9wF3Zw24+axC8ZIWXMt1BjjfKMNR/qbeFSHPIE4TBpf1fr0OdTBu79FuMRF
rWWLIIiXivRGP1yP08mu4DrOK9ZDNeDKdrbDIsx39JDZaBicULZJ21I3qkipUeGS
8Xgysbkt5PG8oDC6qHnbE5PgF5vvd/hCu419Y9NK0jpvQQxXZfm9RaznlQe8yVGz
ETTQwM0CLbzwI7G++kYArP2116Xyeb+r34Wk8V3zJ31EcQKpRmToEe2zdP9ZChcj
3I6hK3YqzvApo+8EQPJuJgYW07m+Zg==
=/xxF
-----END PGP SIGNATURE-----

--pXcGW2FxUdm4A3j/--
