Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277115;
	b=iostZmnGu+E6bzSlZwKvXpLKdGq+3ar1lISrDTXCGXU//EfogsNBwdZNWw0OoFnars52
	 2MzpK61qs9z/juqSinFEFg93WgId0XJVupPY6GasqN2zQwLxOsQCQDeiNySPMIuc9C40U
	 Qs28YnQrGp5lkhBOx4/yJxstWM+Phv41KVRW8vNsTUGN82tddRvV7p86Eo6P1S2VhR2fW
	 OCesYUSki3EuZ2h7aFAhTXYyWhgavj3Z4+mbCqQH3Pf73w9oeKQbM4NUCP6/vPSuOdlRg
	 1X38JuvWa2O2aMqZ3jQQW0xfgpLcqjGITB2YxMaizqdNVs0ZDNFnt+YQEI7FYwFgi3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277115;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=xa5URGaN5W0pQyv70BuKHVgE4RyRaU8Hn6PDhKD2das=;
	b=AqoOmEggr0luae3p0twYVthXdPNSMwA5JX/GrueR3AgdXkCxiR9pnIYhNLZ3MVtf26B9
	 ZOuPN4GT1djvS1xnhGJ0NYXsRrW0vBlyXPA4TEWflh14UlpNlpRAJESTKpT2Vt+YugEpS
	 gHZEJ3AUZyuJETeojFRdBnrW2VZccnnOG/83ruiUOZ+pdAZShfC2fem/CcNsjZt0p870R
	 2GVG/WfKIqBbDOLji+wwpyw35RRDEiZM6zlYpAqKK7BlN1d4/hb6KkApIzM59tGXeriBz
	 FXDmxYFBvduH2N0XLVsfhl/DImzKM70oBEMsBoJtqBVHahuMLTRPXpV/+IfaDJD060Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQ7bnElp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003F606A31A;
	Thu, 29 Oct 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQ7bnElp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A3E1F01825;
	Thu, 29 Oct 2026 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793277115;
	bh=xa5URGaN5W0pQyv70BuKHVgE4RyRaU8Hn6PDhKD2das=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQ7bnElpShtQwBInMgoKdKuztfq3+C21P/n0KrnYxhA/r+UomozUVJxXysXXfV4LA
	 Up13LWwcQB9l3OINiwALxZ8/hIUXZPlOpUmvz9Ss7apvIdYxTNlHYHrDEgdqrNGHCI
	 MmMmzLRfII3O9+Mh+VdxdBeck9msLcrT/aofUt6rPBU4mar3vJhEYAocj4wo9BIFDK
	 9X8Kgwr7GPmA2U6tXsU9Y63FlUi69z+7FIPTpUZCLKMox+6WvS9NvuKst64G+ZBE0K
	 ii1gscobkrOumTFgq715EPUqdBkuTONlvHZCI+K/+WuNSe1kN6phUt5jbSxzTzD5jm
	 wYYnI3ieAmxpw==
Date: Thu, 29 Oct 2026 12:31:50 +0000
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v1 2/2] ASoC: codecs: nau8310: Add support for NAU83G10
 amplifier
Message-ID: <e9e87eba-d3cc-494c-bd63-9efc7aa5e059@sirena.org.uk>
References: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
 <20261022084037.259983-3-YLCHANG2@nuvoton.com>
 <179304693306.199157.5210648249546181520.b4-review@b4>
 <0752dec9-2de8-43fa-931b-27e1cae6e1df@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="33E0WjiqKniC6qf5"
Content-Disposition: inline
In-Reply-To: <0752dec9-2de8-43fa-931b-27e1cae6e1df@gmail.com>
X-Cookie: I have a TINY BOWL in my HEAD


--33E0WjiqKniC6qf5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:24:39AM +0800, YLCHANG2 wrote:
> On 10/27/26 04:35, Mark Brown wrote:

> > > +static int nau8310_switch_internal_osc(struct snd_soc_component *cp)
> > > +{
> > > +	struct nau8310 *nau8310 =3D snd_soc_component_get_drvdata(cp);
> > > +	int ret;
> > > +
> > > +	/* For internal Ring OSC, the default fs apply to 48kHz */
> > > +	nau8310->fs =3D NAU8310_DEFAULT_SAMPLE_RATE;

> > This will overwrite anything set_sysclk() set, since we call this from
> > _shutdown() and _resume() we're relying on the machine driver
> > reconfiguring the clocks when starting streams.

> Regarding `switch_internal_osc()` overwriting `set_sysclk()` states during
> suspend/resume, I'm considering two fixes:
>=20
> 1. Add NAU8310_CLK_INTERNAL to set_sysclk(): Standardizes and unifies clo=
ck
> setting through set_sysclk().
> It sets the 48kHz internal clock here, but would still temporarily overwr=
ite
> the nau8310->fs and mclk states during _shutdown() and _resume().
> 2. Pass arguments to clock_config(..., mclk, fs): Configures the 48kHz
> hardware directly via arguments, leaving the nau8310->fs and mclk states
> completely untouched.
> Which approach would be preferred for upstream?

The second option sounds like it might be a bit safer since it won't
disrupt other users, though it may also be useful to expose the internal
clock via set_sysclk() if it's useful for running audio.

--33E0WjiqKniC6qf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjPLUACgkQJNaLcl1U
h9AvHAf+KXI5E3bvHag9+mXdWiYHYhPnOjtylEUTawoCYOxJLYL7jEV1aBmcZxkR
IFBuP95gLG5TtwHmzdWc5LBNS66yLNbdGT795Z8i139PV4K6m3ssKg/daAKAGul2
atZvnGvz+AUFGF2Z2XWHhRSIIwWW6RyPPcpvA/h70KTJlGY0EOcII5l2j4jm0J1Q
rz2sHXl+7ePkReDF1rMUkAQPhdiNFSv1a6/lJe/HVoMhiiPSrA9r1jYVuBGJd5vW
W2eLQK+YXEBk/1vNRk253tbQyBPe6gXF0sODqi+FULjWsU2tFBaa7ECckvZ19FTZ
lknCgspqG6ZMxK8ZUCr7ekRxvYfy8g==
=h8z+
-----END PGP SIGNATURE-----

--33E0WjiqKniC6qf5--
