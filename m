Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C03DD50F
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878164; cv=none; b=Z1WebIMUTXxN0xlJdiXK/OrrTcF1xSZhr2G5oZsGLYj4uPdp1ZTNP6YHIANUa4zCCYI/OlIUXaudu9GByG5rQHuui+4P1v/mLMwASNqfRByzuPVen428AfOqWLlvS9Oxu/gbSLYSSl650JZigfj5Iv/8eM9oNDjovP4O0UXSbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878164; c=relaxed/simple;
	bh=OYesrFs1uyQvjvTRDjn2rLP3jjkgShlkHp0qRzMp3/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvSI+wOv7fHu1F3Rnudg45W/vrzYRV4riNsMZFNfSMsyedxk7IPsR+PYuH0C0+jHWgJ01drcpFWgGVMF6CYZOeJieDT2lejlUN8UOfr4jGc6S5a1zfnjyDUKqV2+mH8A+hJx0dbZaaTfwi0YNQAOJp5f/brj1ETbt+3qh7XFaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjFFKpvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjFFKpvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39741F000E9;
	Wed, 27 May 2026 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779878163;
	bh=OYesrFs1uyQvjvTRDjn2rLP3jjkgShlkHp0qRzMp3/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VjFFKpvIl3DXlHuCx/9DcKG48ETp4o/8R4v6X1jrkxYmTm1mDh17RQz14C1thsNr5
	 lNfD9s70OqgETakCuMEb0FthTAdGA8Oo+xLk76n/gmZsdOoBTGUbWW8+sTJ7g+gftZ
	 da9k1gjyvOO3tH9nW6UgU9ffshhjaDM7O+SjfEX4P8Q/jPK6IdrfNVwB8xGb5gjAAi
	 ZR8ueNpeH3TaegYpoXQS1NueG4jE17vPVJX72g1KVtfn4kpOxahlZiyoP+KsxIYONO
	 qqn6/x5HVS1umVehNGlPQX+8a0WqEWqeGrFNXUmMQaxX5m/7cJSEk39G40nTwTPVmZ
	 oo0PY4fLKlbYg==
Date: Wed, 27 May 2026 11:35:58 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
	"Vehmanen, Kai" <kai.vehmanen@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Message-ID: <e844a40a-59a8-404f-ad16-07088070f063@sirena.org.uk>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
 <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
 <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
 <2497f30d-a14b-47d1-9b87-c892d21afdf3@sirena.org.uk>
 <582f02ae-2171-4f21-b637-5fd8eeae4279@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1DhfSnZrLE8NuZUC"
Content-Disposition: inline
In-Reply-To: <582f02ae-2171-4f21-b637-5fd8eeae4279@linux.intel.com>
X-Cookie: You are fairminded, just and loving.


--1DhfSnZrLE8NuZUC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 08:22:23AM +0300, P=E9ter Ujfalusi wrote:

> If you and Cezary are OK with the linked patch for now and the proposed
> .prepare_bind callback to cards, then I think we can keep this patch
> without fear of regressing users.

That looks plausible to me at first look, if you'd rather send that than
a revert that's also good.

--1DhfSnZrLE8NuZUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoWyQ0ACgkQJNaLcl1U
h9D5mwf+LZKCflIagGkeK2mVq3CGCehaCcIuAwV4SMsTY6QGzm8GahydQ3FooIdX
OfHv9s0uv7hBlqsMOKEUQJSk/K/XPL0GR/cg8RNzG7gCJ/lSM7MkJPJrvXjMao/2
i0oAWbzhRVlENXd0//QaxzzEDS3P7H5Oe9sX2Wbu/QyAKBhac286NAcsdDf7bacg
QOCI5lnhicbwna+fs7XW7GAeVzJ9SYIiAxog97sp1nkqEjhaevvrKZOFwcJqpASP
uyFL6fzu5vNYw1+S9kesf1ed74qOV5ZAwNgTpHnTx6j6IGktrk7Q921QsrZJqaCZ
7/tm4RGeWoCwkHv6LcQi6/0Nnwm4Rw==
=3xU8
-----END PGP SIGNATURE-----

--1DhfSnZrLE8NuZUC--
