Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A6303C9C
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618037; cv=none; b=thJn5BQsAviQHs17oSAqeC9wRW71KrjeY34Tm56BamfTINaFgXxPy3JubEAeji7YmkAhozmmtPktLkMFWl2fEkXLx4KyN1XBrwErTa25mpdvkO6JLFOS6R39r4N+0fW4cOYdhiZoHjvJxOH0G7yrbAUg9TFjwD5ScyJDvg95DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618037; c=relaxed/simple;
	bh=XhrFX8X25J2Zq2+q8Vol8emdn6IjZ2kV6Gyx+x5Ll0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gN56CwUiwBddsl7tXm8MxpZsO1JfcRYM5iS5M2SzfaVnZ/S0vAKEN9UY8HTIoEg8uK+qO2C0ElB1vko2tkPFNQUS9vlP6K5FRGnlYcxMbjU5cHhy8FxPYyHbYDKj2OMXUpIKuCDu55bNagQs5nXpiNwXUXnLEKQIHXLMYo8lWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwwE9kI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwwE9kI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9C91F000E9;
	Tue, 16 Jun 2026 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781618035;
	bh=MzIOvSodUHrE34MWxZQ3K3Zv28e6BcgKWTJlgWpF2Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QwwE9kI0Lr4t8mbbxgKjxoXNm+dAC8i7EkU/Q9xYByHPYlneFInKHageqAv4C33YS
	 +pwDMYTt8G5Txeutd9rSZhNdiJ7x3Y2TfSsUo9m1AklsFkv9emeKoFJtSEGgDdMeVd
	 lg0jB56v//t1zoM6nC70k8AdleoIJellxfKolnTTqTa4x9NcfVOFKfLpsPiqhvaXXc
	 MPkB+2BFxZody6ClpFxohzy/H1Ry7NYjzPpLWgJYP2A9idXjd8EB6Yslo77UqO+JLE
	 Ptj4xpqkwDPB7cO9P8++5GtGjxrZqHP7uuw0T4aGgbJFjL61PRid2fGRUys1DBKu2m
	 LW0KByujLbcNg==
Date: Tue, 16 Jun 2026 14:53:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH] ASoC: soc-ops-test: remove component from
 soc_ops_test_priv
Message-ID: <239457eb-e19e-42c7-9ce8-8e427cfb4f43@sirena.org.uk>
References: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
 <ailKjsngVh4q91C0@sirena.co.uk>
 <87wlw5mufz.wl-kuninori.morimoto.gx@renesas.com>
 <aisSJw1RJTXmC3jl@sirena.co.uk>
 <87pl1syas2.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6v/ZYNlZGxU0wLSs"
Content-Disposition: inline
In-Reply-To: <87pl1syas2.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Password:


--6v/ZYNlZGxU0wLSs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 11:14:53PM +0000, Kuninori Morimoto wrote:

> > This is (or should be) a common problem, I'm fairly sure there's some
> > stuff in KUnit to help with creating mock devices for it - I see there's
> > include/kunit/device.h which looks like what I was thinking off?

> If my understanding was correct, this header helps to create mock device
> and/or device_driver. But the problem in ASoC xxx-test is they want to
> directly access to the member, like this

> 	card->xxx =3D xxx;
> 	component->xxx =3D xxx;

> But, there is no such direct settings functions in normal way, because it
> will be set by using some method when it was registered by checking
> other settings, etc.

Right, we'd need to wrap the KUnit level helpers and set up the devices
to be usable.

> xxx-test are one of the quick-hacks. So, maybe we need to allow this kind
> of workaround?
>=20
> ----- soc-card.h ----
> #ifdef SND_SOC_TEST_HACK /* naming is dummy */
> void snd_soc_test_hack_set_param_directly(card, xxx, yyy, zzz)
> {
> 	/* these should be set via official method */
> 	card->xxx =3D xxx;
> 	card->yyy =3D yyy;
> 	card->zzz =3D zzz;
> }
> #endif

Yes, something like that.  You can set a device up during suite_init()
and reuse it for a bunch of tests.

--6v/ZYNlZGxU0wLSs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxVW8ACgkQJNaLcl1U
h9BLegf9GyhPfyk6WOLAV2kPIU5NT5YGtwqw3oAWdTBI7Bsv4OkGSImkEYSiL7Ry
r2EHvs6d0jMiAjLfm8J7a65gzam9ghS89L4pOnS26Jgnv6MAIywLmpbAkUD5+vFm
XIpZKvBjXT2xeTHJS6ro/ntso0d0bffH7QE5S7+oZwlneZzGtdrcbzGPzd2B/Bvu
5gjYDHVLaqVklPdS/auoW7GvRq+fsdSN+/1iyCpbUCJJd6kKhas0ChYB7HM+Sz0y
Xhvi5ejRVVpvu13poPw62eevrUxJ7pRO3XsWRKGYXa08BnXOWClaaPzJ3rjYBFnB
sH7RYAlRoEWHDvaKa9FB+Yh8rSx9EQ==
=MZB/
-----END PGP SIGNATURE-----

--6v/ZYNlZGxU0wLSs--
