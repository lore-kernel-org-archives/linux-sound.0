Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E36C49E12D;
	Thu, 10 Sep 2026 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081843; cv=none; b=RS/++9YBOX4qevq1ayaWWJeNbldbgDwoGNVV4dsx4Y9TqYxF4K4kVdP6tTYMT8HW7xNFDnlbAX5Saj1zdFXvAmAzcX+hISaLa8HWROm3QPoVhmeoO2AEx45P6e3iO2PdR9wE5Q9PHMqkptC0szRznPQEo4pv6i7PX7P3v4h3ZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081843; c=relaxed/simple;
	bh=Sz7IyMFAo8Hbn4tOcAk1S4f1pmpQTjj9Nzv/Xpy7wYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAJ1e6KPpFSqlBR+zAwPAN1Bwjl9XuB5yvYjn1TIy/ja85s6Kr3KERgmM+EcL5La+H9B2nrr2tAp2QyXYSL6zW4LonJS22swv8zkOO1Vs4/OpWcIqeuPIRhjrSOyEhRG1uGzUXOjyX8HtgIq0ywMNQrV5wYx+kBoe3D6G7Eg0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3rRRtaM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3rRRtaM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4545C1F000FF;
	Thu, 10 Sep 2026 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081841;
	bh=Sz7IyMFAo8Hbn4tOcAk1S4f1pmpQTjj9Nzv/Xpy7wYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I3rRRtaMlu2tVaLIrV2bTTp4UJ4XZwg4K2Y4yWl6AsjPDtcVGkcb9jEEwse7Mgf5v
	 KOFvQCt8pTt9K0h8Azw5+3asv0TYJ05OVZ6oD7zfMFNoAXi00okEGXIgxi1hfPvQxJ
	 SOhK3xIJr74b97kBvvT4dUEvfq9WmSSvQ+U/PmuJyJDL0Swc3LELg4y6vWg3WLJJuW
	 2D3o1/xEZh1dmKAqewPm4jAJZPbi2sRA4s3p8iaPkuQv2pzqQw525sz9NPPtYwWu1j
	 4S0JR0aAJjAPyWy5XjHFCNSG64ogdtzgCz3x1cCbUg0xwvXqvwsi0JVdwgQZzzgryq
	 nRWsfIyyZ7bGg==
Date: Fri, 11 Sep 2026 00:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 0/9] ASoC: ux500: Migrate HREF and Samsung audio to
 simple-card
Message-ID: <621688e1-0c18-460e-b48d-581fbd3ef5dd@sirena.org.uk>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q7EJpUPxP+3BQWtG"
Content-Disposition: inline
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
X-Cookie: Gravity brings me down.


--Q7EJpUPxP+3BQWtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 01:03:43AM +0200, Linus Walleij wrote:
> The Ux500 HREF500 and HREF520 audio support still relies on a
> MOP500-specific machine driver and ad-hoc text bindings.
>=20
> Convert the MSP binding to DT schema and make the MSP and AB8500 codec
> nodes proper sound DAI providers.
>=20
> Move the fixed DSP_A and TDM policy into those links.
>=20
> Add a common two-link simple audio card named Samsung in
> ste-ux500-samsung.dtsi and include it from the seven supported Samsung
> U8500 phones.

The modern thing is to use audio-graph-card2 (which scales down to the
use cases that simple- handles with a more flexible binding).

What's your thinking on merge strategy here?

--Q7EJpUPxP+3BQWtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqjOOsACgkQJNaLcl1U
h9BzGQf/cJIJEVEUtsh0YsmnwyajhbYO9nwcLPiNktb9BslTJFQupE7nt5ILuKRZ
tbN279rsZW032wiogM6AHAekercS2Vd/8hH+P4rdngK2ut7p1q7Q7pqDIZTbv9MC
sitUNcWbuZ/Tfal9VPZnM0+5L6h8zBWf3lE1aY4eBuLUrqBJzwRLF4I9Y5jdHuHr
QHiVRY5SUgrOE1bOcscbCfoTuVtXbdNRRaDXCKc3uAsxIG/t3fQUD8cINjPp5Nph
xIEUuA4G6D3Tpfbo+buzrCXYWqcAgR+zEgmbCrs8FyVJeBgagWvm5vloYbQ8MrKZ
bSvQHbMU4wt1kIfWlr5uGrZXA0ainA==
=tC9X
-----END PGP SIGNATURE-----

--Q7EJpUPxP+3BQWtG--
