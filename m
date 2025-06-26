Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEBB3C2F
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939221; cv=none; b=PzQM2UbLcq2gvo4WllbzAwYtWcf54LMe2U0PGOAl5+7nosGhUyswQe7hIQixpGy981EwPjHfWTNjjI6l/IsddnoWkg7WwAxAcJTnKQ9XdPkkJrvfDQRAws7nGi4Bs6pmie16FsSaAYlHvVlUDsDi1RmUr052Z2GJ3H+5xlPf8Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939221; c=relaxed/simple;
	bh=6RgMx0qGtVWpc29CNd0FlMCHRdryzu+B2TS/wb1Cqos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgURBgB3bMHm57dLHUIifsUGhfmsugpEstBvb25mt0uWjyaNaxyEly/QzZBMkjTm2XcBRVDADvfCXIsB75mfFfLyyadKGNGwbV1XFwwdz+Kz4ewEsUo6zD6VLKEfh0lCaT32Ap65sJ8ogIowLTsGkYOK59vLQ7OSk/57JynVqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms2QZwQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ms2QZwQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8143DC4CEEB;
	Thu, 26 Jun 2025 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750939221;
	bh=6RgMx0qGtVWpc29CNd0FlMCHRdryzu+B2TS/wb1Cqos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ms2QZwQ/mFtDYgENHLRcE1jE/x0UmbDNucwAMYjHfv/JO6mqw1CNMr0swg8euCWSX
	 QVjunSXGMnyrHDxhxeOlM2lfmYiGDUf71u4AhY4g/RM7+0vsp5xosr2+mBhmTkk5pB
	 EXCcvSsGxAjSNaQBrQk3gFOnkJR4tZNM6xfL9EXS4yQKvuCDIQX+AFkmTfn+AU3IgW
	 TcFiKwT5Oih3Ou56/e4bWelXlSA9ZbAb3HN19Af5nqpYvUc68cwXw49YJLM3axkwOg
	 0dloTdxWhwpZ5ZJYgMX7K6k9FFQe1UYitH7+QMOTbz+8SmogqHuS2RSM2efVgy6zKG
	 HTHDFStG7Bz2A==
Date: Thu, 26 Jun 2025 13:00:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/11] ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() from
 unneeded function
Message-ID: <aF02URW2uIYiOMNU@finisterre.sirena.org.uk>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
 <87v7oj1caj.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hKXDN+Pifep/NFzj"
Content-Disposition: inline
In-Reply-To: <87v7oj1caj.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Do not cut switchbacks.


--hKXDN+Pifep/NFzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 02:12:20AM +0000, Kuninori Morimoto wrote:
> Below functions have EXPORT_SYMBOL_GPL(), but these are called from
> soc-dapm.c itself or soc-core.c / soc-topology.c. All these are compiled
> by snd-soc-core-y. So EXPORT_SYMBOL_GPL() is not needed. Remove it.
>=20
> 	snd_soc_dapm_new_control()
> 	snd_soc_dapm_free()

For _new_control() while we don't have any current users it's not
something that obviously shouldn't be called, people do regularly call
_new_controls() and that's really just a helper for cases where you're
adding more than one.  The export isn't really doing any harm.

--hKXDN+Pifep/NFzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhdNlAACgkQJNaLcl1U
h9AY1wf/aHUtQoZGQOSLPvRKZnk/g4amwpfvzaIMKDRxmTYUaVJRqQf2kH2n9cVk
NcxcVNdM7+9P7maKGkXU+I6BiBEowuTHv5DH9eLR4A0w095SPWkNcGJhTItfgdxZ
ZMeV5ZbDdFTzGui+quZysV1npb0HoR8tmWFC9Z75rnruinhWrUg5gE2N6eAX6mtc
Qy0IL9o5DhRu5P2SdVn/PYpuMzZJN4UWNN4EB15X6lcTNhbj/dI1/a8bQSQ59f3r
LXqT4EYV5ExAShgWP38ETNbHOTueInwk9M8meZ7ElfvuiAJCTo/GtZWUGHOG/RZf
qSL6d9hBJQWcz+6/xjg0LGbxUvhnPw==
=oLP9
-----END PGP SIGNATURE-----

--hKXDN+Pifep/NFzj--
