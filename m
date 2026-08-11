Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14BE3876B5;
	Tue, 11 Aug 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461909; cv=none; b=QIF1/+7Fc8uyLRGAsUNmcDh/K0DAIPxWrkWzwv8ZlArEFAbRMLX7HaHAQYozuQlu0f0yJ1XZd3zS82fyYJcMH/7x7OLleDb+R7t8tdqEI9V8X40rIcMzV/KVFkMLwFqS29krybJUs3QN/06zA13bF+MMNfIfM6NNA7ed2i7fZbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461909; c=relaxed/simple;
	bh=DSSMWP5LMdBN8v35WYBEDO+wI0tq0yDWRdK1mcm+N0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jei01jwnKny0PQuAzdD3vlq666phCjpB9u99vjTONGP94IOlEFRNjkMfoFFjocZtLohmjEs3yEFQ6EzsMcQAZzsHTOu7mtB8DgOkpMXqqprHrbh0jLmZGrOKUAyvFk3uYTUBiX2EMust8bQUJvtrXcLHfTOzbEkl+NHN6GtBStg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ch/znuJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ch/znuJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0571F00A3A;
	Tue, 11 Aug 2026 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786461908;
	bh=DSSMWP5LMdBN8v35WYBEDO+wI0tq0yDWRdK1mcm+N0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ch/znuJIXTFeCDP9zuztAVBb0xLOYR004TRxzmTICXSf4si527C+DExK2J4w0d++Q
	 idQETGGd+6f3hK3AoS6ZDZRkvn2w83zCuUQuSxRWjvqchBleUUC0Pa+5ysCPtsICDT
	 6BnexqQszFkHFu9AFnh9q+zBhRdrs8fXqVKLa9dTjZAnBjQW3nc1ykmrJFH44p/B3Y
	 Hw0WQ/ivnVnKBi+GCvW8UDcVJrR0/aa5SWNzkB8rrMP2j2qBqgGNkjgeA9sgalfQDc
	 YFp2r+TYKt8yDCd5obRH+kwGMKAVovQHX6JhhnaNWhi9gO197DwN1fR8j4/Tmi7jta
	 1dzAKICbKmrOg==
Date: Tue, 11 Aug 2026 16:25:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Rob Herring <robh@kernel.org>,
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: sound: Convert TI DA830 EVM audio to DT
 schema
Message-ID: <ba532a3a-0ace-4d9d-970f-cb9d18664fac@sirena.org.uk>
References: <20260811091703.685487-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NnFWgC4X2qTRjjDL"
Content-Disposition: inline
In-Reply-To: <20260811091703.685487-1-egbostina@gmail.com>
X-Cookie: Take me drunk, I'm home again!


--NnFWgC4X2qTRjjDL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 09:17:03AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DA830 EVM audio complex bindings
> to DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--NnFWgC4X2qTRjjDL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7Ps4ACgkQJNaLcl1U
h9BJ2wfzBGJvu2UQCEgwoBqz6IiJVvdGHQEsJUml5CVG3Y53/Dusi4ysv0ULSx0O
d2JcNi27SC02h0N2Gll8+6Hesa1uVC4anmuGJIAjZ4aHy03Jnt73ymgL2lyIZGrh
U53jyhUWIlxOOFslpl+OvLMzpTylndw6wScLIJDeUoTh3o3YMyDm5PASubqLbQZ5
Ix5hzatzjoV5myQDzXneSafRGqQa+ao/TOLqUyooE4hO2gxQEjvl6nxBJ0mWyxTu
Dwpst2NHqIB3WtFNeDOoCyWqsZkp2bfroruK5nl9HR4IZSr6Z0o0qhkifHDsC/CH
SVVINLlQ3EsQYLIFLlMkATqKVnMK
=m8zI
-----END PGP SIGNATURE-----

--NnFWgC4X2qTRjjDL--
