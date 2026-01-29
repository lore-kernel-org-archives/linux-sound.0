Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BF26E6F9;
	Thu, 29 Jan 2026 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769712388; cv=none; b=uvT6+TXMarM7VXjcwE9QRsfS63dPxjaiiAYAsI0JKCOZmfcxGtYdxUwMN8aHweAposkXF51gyn89cUSWTzgbYulT1d4VVMydB5+lgF6G52kI6HRVJQCh4YODI3QlSgK0lrqGNj044+8TegaB1YYVKfIWNVynXLD2NWHpkGbsR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769712388; c=relaxed/simple;
	bh=/XmRd677K7t4nA7lfrF7vsZ6+myUyYCrAjhaJX3oWyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzE9Vd76Y9QGZKAdC99RcV6STD69/XZ+1GWYPMbxkuRKVcr6X++h7ZZCJdGxvTQeJ8unFg0yRFpZI3YgSecyC/1JPRnapxiiiQ0UkBZossF0UAGCdzprZmA2+nvljL3NVA6ugwt1Bk6N6zeSbgtWKvGCPRojMiaxh2Wufwabn/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRB+hfcz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRB+hfcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52281C4CEF7;
	Thu, 29 Jan 2026 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769712388;
	bh=/XmRd677K7t4nA7lfrF7vsZ6+myUyYCrAjhaJX3oWyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRB+hfczSZAnFS0bS27/N5bOqxNsJ50x9GCCuznWE/6tU06LEeBRX+qiMeCdfu0/A
	 1ew0Igg3KxiBoHN54GuF3J+ZVys7Myrb6bob/C20vsRzHS+WF+u2+6HsTMoXMgnwSU
	 Q+2QkgW76b7Bv3ywFleWWnkXIxISpcwCgKAEE8JWY3b/6KNy4HmPPoNlqWOgSAi1xQ
	 EP24wGoUW10v3N82bKQ8Zj45pcgrWT4h8GHeSFf7Mt7lYE51aX2UgBurjv2qCBWTeo
	 yVJSd2JcDVc36tvXANcw8R6TxoTTIxrm8LcwnJhB/D0rS7FuMJEr8rn2RXe05x5f38
	 n53L1W6ZCoJ4Q==
Date: Thu, 29 Jan 2026 18:46:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
 <a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
 <21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WDImneD7x8BAel2Y"
Content-Disposition: inline
In-Reply-To: <21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
X-Cookie: You have taken yourself too seriously.


--WDImneD7x8BAel2Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 01:17:45PM -0500, Sean Anderson wrote:
> On 1/29/26 13:09, Mark Brown wrote:

> >> - Driver authors tend to use them even when there are hardware registe=
rs
> >>   available with the same information, as Xilinx has not always been
> >>   consistent in adding such registers.

> > I'm not sure I follow your second point - driver authors tend to use
> > what? =20

> Authors look at the devicetree node and see something like=20

> and go "Ah, there are the properties I need." On some Xilinx cores this
> is the only way to discover certain properties, so people have gotten into
> the habit of using them even when these properties can be read from the
> device itself.

Oh.  If the properties are there it's reasonable and sensible to use
them, them being redundant is a concern when specifying the binding but
once things are there any discrepency should usually be resolved in
favour of the binding.

> >> I am not aware of any errata regarding incorrect generation of
> >> properties for this device or cases where the number of channels or bit
> >> depth was incorrect.

> > I'd still rather see the properties get used if present, worst case
> > they're redundant best case we avoid regressing a currently working
> > system.  The code is already there, it just needs tweaking to make parse
> > failures non-fatal.

> I would rather remove it for the code size reduction and simplication.

We're talking a couple of function calls with no error handling here,
I'm not sure anyone concerned about that kind of impact is running
Linux.

--WDImneD7x8BAel2Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7qv4ACgkQJNaLcl1U
h9Azhgf6A4lkfV/w0cwxwJ8Tc2SF7oD3nQbUq5FokALWMy6Lb7rfb+mrG+AaDude
NSQoQZx9MiQNLpSLIhOuENxQq4kDwkC1iiqZ4cr4D0Z3Boo6TnqPewzvRMzXvY3D
qUhkTEcIazjnWrl3pQqzHzP2hXBOLCRqfwkSqSvsR6Dx21wj9MecbcQvvuQnz9+b
ch+mxvLDXvMuyT7oDBG7hY1xhotLrqV5YrHmFYt74XBN9d5K3X/nxFjbP9/xYKKZ
KjMgSDGfOzYkTPV5ffJazJMIXRneUpYSIEDJRferfRuTOnMnOfnHLIRod9q8i5+W
88SY2gx4BRO2+4nKz4+MRxOy3JgHKA==
=RKex
-----END PGP SIGNATURE-----

--WDImneD7x8BAel2Y--
