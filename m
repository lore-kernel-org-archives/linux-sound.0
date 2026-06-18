Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26547349B15;
	Thu, 18 Jun 2026 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781805811; cv=none; b=uZqdBJ0LWYOOMCbQNGXbofMZHB6SAglh/Wt4+6W9rQg30YACzH9Zr4/PBaKDReK2ICQmNhHw4xNJpH897jHLa+Px5lS56vIH3xZnWNIrO5KvFT2cCJQrX8w2ItpTotF6suCkgP92gKEZu3WSngDpy1ecqDLPSvvxQzzgoUF/+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781805811; c=relaxed/simple;
	bh=rnQhIhLjUekbeVUcLzE815RUSFmKG8GOjaKoqLSuKas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rk6ARIcSnFvkZ8llVupsmqdIrZvuPUeEvBh9YIxyIciSLxQAptJeNzq81cs2BZbLtqGyCnXxWrURTaBG23zMjBRuMSuuhEB4/Rzvyd19VTKr9McRg/kd5o7D8/qy75xjljt1OgblB099zX3SURjzKnU8zEo6ZlwUn4jvdKUz4Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=my1lzVyo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="my1lzVyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3521F000E9;
	Thu, 18 Jun 2026 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781805809;
	bh=TCJanu+C9yPkkIfmCLTiAWEVlukd5W0JlnBZQ6W4Ac4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=my1lzVyobBe+gSUFhL1P9rcxzv1JB6h6dyWJeYYxulFur4V/4gHj4l4cgFaRwsvYe
	 dxw8H9s+G8kuBQd89PW0NGTXEuQwbuN9hV+1wzBzFlcPHAFlkRAQiXNglVZ4MYaA28
	 jWmBdhnYI/jZsv0BwNYPdU60bT0SbxHbKBU1mDP9M10lpfIHeQjPLZ9FkdS7PnriR9
	 lbTSuYUET0mS1GOz2H5hjY+SWUz/ouGuQ822r6YkYFnqdPHKQdDl8xe7kHy+/70ee+
	 GVvppDVLTKA3LZPq9ABjPwoDBxhhndtojXL6bTAsEjBxsDr+e8XUMWJHitK+E1+XCa
	 Bt03uOptsBCxA==
Date: Thu, 18 Jun 2026 19:03:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, tiwai@suse.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: ES8389: Add members about HPF
 and clock
Message-ID: <a619312f-55b8-41f4-b288-d7c343f5f9e9@sirena.org.uk>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-2-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PkrJ+7oR19bN3hkf"
Content-Disposition: inline
In-Reply-To: <20260618082842.2778-2-zhangyi@everest-semi.com>
X-Cookie: This unit... must... survive.


--PkrJ+7oR19bN3hkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 04:28:36PM +0800, Zhang Yi wrote:

> +  everest,mclk-src:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      Indicates that SCLK is used as the internal clock.
> +    minimum: 0
> +    maximum: 0x01
> +    default: 0x00

Could this be done by having a clock API property for the MCLK source
and then falling back to using SCLK if that's absent?  That would feel
more natural for DT, and you'll probably want the MCLK property at some
point.  It's also a bit more of a neutral description of the hardware,
future versions might switch dynamically between MCLK or SCLK based on
some criteria or something.

> +  everest,hpf-frq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The frequency of HPF in Hz.
> +    maximum: 1020
> +    default: 16

Why configure this with a fixed value in the DT - it's the sort of thing
I'd expect to turn up as an ALSA control so the user can vary it at
runtime if they want to?

--PkrJ+7oR19bN3hkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0MuwACgkQJNaLcl1U
h9Am1gf4xrk9QyoPVPDOh51h23jRQ6hFgvyAiZJxWWyiWDZ/EA9bbztkgNKIQ4Pd
EAcLHYnMMzd/mt/NjUGjddGJPiPliC1X8AxPkdJ5gTycsq3bGYQWf0ojyrA/h5OE
O4nd0XMvzv/wo8oSamcmXrAQ+bdjuTBLWedBazcOhelqC9TMkyKTMTIiVjHSTX2j
6S9pT/gX0LgXAGwxzEqcNOZdCJJH19KpBMJps8bpJhWOVcYzMPCEZLBFu3FL88cq
vj/JGvNKMlJWgoR6IYu1TSpPGAL9uBqXcYfIkU4NSF25tcGD54tB2hUw/viJQhMm
/lEt+nCil0ghd4XggqMgQhrnRLfM
=bKBO
-----END PGP SIGNATURE-----

--PkrJ+7oR19bN3hkf--
