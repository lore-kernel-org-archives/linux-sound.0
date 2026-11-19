Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102477;
	b=UAIH/OqsZXMGx27gm6wDDRW6XrAP/+jV1ZwaIx0goUw8FY93gjbx5AjMReVL80Ono/Sz
	 jOsXr3t8c1npXGYY7Bkre3OB7C73h5F9wHaazwZqggJPRDb48BhX3F2mQWpHLNq/szZxB
	 o1tuEW2IHbCkJF0PH0f0a8z7DhNxjTWYyccRQY5FOJy8NLsJlTD0WdKADHjHgR0p8NZHs
	 Jbpeafmgkx1m4vkQsSqCPTrJobpnlyuqaeE+zCgWFdLdRNaXN7/LADIOTflHVg1I+Q6zd
	 upzJrkfYwBylzuNsFzoIs1VPW9yBPFwp2WvLN+WZ5p6wzSNUNvw8R8ciYWgKoM2TGHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102477;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=zUWKx5Yb7D3P1BEOd7tz67w6OHnpP3z+gZKnajmy0bU=;
	b=39NW8hD5zAFcb/zs5Ci0RozjSiZ6hZzmSR5cxgPA9B/LTp6EhH3S/beO+iJ8PITaU5FP
	 WDE6uyZCjxd6FoyMOJRCgtcC666dPfAmWl6Y8uviX8TOdWoMzYOoYIUpFgkbh9TldTuaa
	 8a8/kNxFIXj/str8Dg5Xzl1KHHpnp5IncC75BL2PNqUjKb1q/QVZnhIH1CIuQmS/hZBeD
	 Sgi/xilAKvu90nu5zC6ELBM8GLFXbH55oySXu6FJItWGrRt1mntuov8inMasMiyS2qDsB
	 Z6We+cxkkXkuSgIV7RFCy6BvQCOtvY3CqjebEwb3PyoDsLCKjcy6LIW/jbspiBu1/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Urpye30k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DB0606A332
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Urpye30k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799AB1F000C5;
	Thu, 19 Nov 2026 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102476;
	bh=zUWKx5Yb7D3P1BEOd7tz67w6OHnpP3z+gZKnajmy0bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Urpye30k6bH7qhHh3GMlxhiBouODJq9moObOMaHnCeaQbiIJMR8yag2+LdMj5FvPL
	 EW3epiazJ8slLgRJUBserecw9Ny5J5RrcocCJiD9/x7XQpTAFPkA0rKx1T67tmWjyB
	 LP4exQS54Q4irsX9qrG9a3y01g7YbHZic0rq8vljnX4K28jx56cwezDo147+FSVp88
	 u4Juvv5ZoHziQRDeejQZwC2X1IPdIwVTqd4U9EXZlVJa+BadLvH7RFWiEjeoN8hmJv
	 a4u0294EWFAEf6OcHDkwxARqoibbMWpHnv82CfgB4jgFCiMfdgGeXusQaTP0MbgQHh
	 9PF1n+MCKM4oA==
Date: Thu, 19 Nov 2026 15:34:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Rafael Diniz <rafael@riseup.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: wm8731: power the converters together, activate
 the interface last
Message-ID: <16044ae8-679a-4e4b-83e4-1e2bc2c0554b@sirena.org.uk>
References: <98d2b656-a944-47c6-af47-126b46c5a953@riseup.net>
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
	protocol="application/pgp-signature"; boundary="adelDT6O83/PHJ7h"
Content-Disposition: inline
In-Reply-To: <98d2b656-a944-47c6-af47-126b46c5a953@riseup.net>
X-Cookie: I'm into SOFTWARE!


--adelDT6O83/PHJ7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2026 at 03:05:18PM +0000, Rafael Diniz wrote:
> The datasheet's power-up sequence powers the converters, sets the other
> registers and activates the digital audio interface last.  The driver
> has ACTIVE as a supply widget, which DAPM powers ahead of the ADC, DAC
> and line input, and gives each converter a widget of its own, so a
> capture starting next to a running playback powers the ADC up under an
> active interface.

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

I think the patch is mangled as well.

--adelDT6O83/PHJ7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/FwgACgkQJNaLcl1U
h9D94Af8DmZNz4EC+U0Z8xZ9lmO/t0xAfHrFPsYfAXh+3lQuYUMas3TlNatc2aS3
Nb6Zv8LcXlSqmX7d4Mpfw6kzdwG6G9YpGy5tcRYds5iJLn7TUpgdO/anNTK1Kyhu
mHWMXms6kBKvhMu0X/d0lvyzTKZKzcUL41zAfFtTOPRqwfXJCKMWIQrTtlHrrFM6
FI3RYOykscwpaWCemqpCIoRe5/I3eLSDbYhdJB10xcb1wAeLUo1tL4/VVQjI6CY6
RdlNucIvNeud+oIBZPHeqoaDqcXpzySb9a0HL01uJknAtGbVmkpJX38Ot++SUzoK
PctMJ/RRo/Ac8dB+3u2EsJVMKnZtGg==
=2d2f
-----END PGP SIGNATURE-----

--adelDT6O83/PHJ7h--
