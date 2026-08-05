Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A7352FA5;
	Wed,  5 Aug 2026 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933219; cv=none; b=L37o+817WyJpYPHYFNZeUvG9HQorWGZFixLCDXReJ3BgIFOBuA48GqxLIfJY4W8JMUnUMaNHSwjuatjpe+4we4Zsn0FbxK6e2TFdXeteuYqtLoU2/l55ZgOQeb6ZJ+jAe6tzAhdScUB4jNZ7DcFdEE9fv8qgJ0HsC2/R3We0XhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933219; c=relaxed/simple;
	bh=IOXF4iwM91kjyEy6yz5RlBIB1d3t0dHZ88LOzXTrmi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDeVE+bp+PSAOkg4RyBvzXnA6bf5TXwZobhrHuYg+Kv1dc1zzDKHh4CvY6S7yQ/eDV1NBQjUHGfIrGOxqlwhVDkhg06EZvhwa1CgFcDylo4UeWHeObaKF6wb/+bN0rBiHjpj4n4h1Ce4l7sZuJEGw7Ko9oNqYNRAxguOuJUW9ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQ9lZ2mg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQ9lZ2mg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B611F000E9;
	Wed,  5 Aug 2026 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933217;
	bh=Qw41i8oMVAtT9zZZhqei2R3Y11YzA5K4okzr4XSsA0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQ9lZ2mg72obnYpA//eFBR7gYDrdbF5KJkuJ3g64sBnoldXxErvEZ4sUKkgVxGLZe
	 4YbhVfhN1x5S91q92JFbYdrMIwWptZV31nc/oNoLg1eGP8gA6d6qhXL+ZTbuXJUFYJ
	 kSPboQYZED+bcDea+uPD0tlviFwbcrGuUV/vIroX01HV/VF+p1BFcSWjQlEz0r8zs0
	 mTta2WU+d99cPITCYdCwSTwwl6KFMLfqwSCgTiyR2IAnyHkl1lAsVzoIogA4/jldtw
	 4guCT0EdcKZ2hT+NWcEMhlmI6laCYE5JLWg3rEJaysigUyH7npDCldylSlv8sV31R8
	 3Iyrc2TcsVLzw==
Date: Wed, 5 Aug 2026 13:33:32 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <b59b4f33-d939-47da-abbd-04950a9909f6@sirena.org.uk>
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
 <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
 <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
 <79bc356b-e727-7e40-9faa-e622c9a24ee9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="83eftdZLdGcHI6SR"
Content-Disposition: inline
In-Reply-To: <79bc356b-e727-7e40-9faa-e622c9a24ee9@gmail.com>
X-Cookie: Stop ahead.


--83eftdZLdGcHI6SR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 07:34:28PM +0800, YLCHANG2 wrote:
> On 8/5/26 18:30, Mark Brown wrote:
> > On Wed, Aug 05, 2026 at 05:03:01PM +0800, YLCHANG2 wrote:

> > > Does this mean we should avoid configuring them via the machine driver
> > > entirely? If so, what is the preferred way to handle clock fallback when
> > > playback stops or MCLK is absent
> > > (e.g., via PCM shutdown hooks or DAPM events)?

> > What do you mean by clock fallbacks here?  Presumably there's some clock
> > still running, if that's the only one running it's reasonable for the
> > device to switch over to it.

> By 'clock fallback', I mean switching the clock source back to the internal
> clock when the MCLK stops, in order to keep the DSP alive.

The driver should be able to just figure out to do that based on the
current input clocks it's got I'd have thought.

--83eftdZLdGcHI6SR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzLZwACgkQJNaLcl1U
h9A8TQf/ZxGJNDh8TMhO+OoEeP94hIURXmaTWJx3Fm3Ruxd43yvpp4234XhYjd4B
eiY8Nchl3+x8NhfmJvB5xAfjCUVimDmYMHeFqUhDygNTMe3S7WbAtZ3QNi1E7aUh
Dt8m5uaEEYZM0cJjWKpRJLfnRopLKfbTcjSR1KYvqRMlJOEeygCMvY9H2k5b0KoF
NSEFP7RCmPlvUB69FChVnv7B5YoaTmCJPcnEWdaGqwFKyav5jdb+J6i2+pfF0Nvj
k93JBgaX1qbDjOjXUsV9Gq25K0M2RxWCeAT/tYtnRF+NfzDH/pOg8KDRK2ka2a/O
11V9Hj10/lsdtxUlEKo3w3PPAXLCSQ==
=OiHI
-----END PGP SIGNATURE-----

--83eftdZLdGcHI6SR--
