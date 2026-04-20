Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5C1799F
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697892; cv=none; b=q0VshNCAv6W4yvyEF4kxGwwQgv5JzEM29Y4X67R++S25AlgY01WJTdz9YrBzjHwIpEcSBO0tIIn1xf0DmzRY5l0Vo69FjX9xwbvUdG2rtBUfRXFb8HzVU7GyzNOUchuyX0YAUYzMo//e86jidsLEWzZcN32bWp3C1cyo0COAIe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697892; c=relaxed/simple;
	bh=Z/7Hx+dN1MoUe3LQFn2dyBIsf3H2Z4eDRjlyFlWxs6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9Rj7RruIGrtb+F4fEqbCQ61DeHLpLQkQSdphZG2ijSJjW9bpccl5UH2mr9L+n7edI6rH6+/uluYoRwPhWSOW2Cs59SpbpHlAPOozw/LUkrXjYcyhiNMfx1Ex5g5noEiKEq0I/mAh7mXkAx8BERad04w12WmSdif0y0VykDzKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OedJxvA+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OedJxvA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E44C19425;
	Mon, 20 Apr 2026 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776697892;
	bh=Z/7Hx+dN1MoUe3LQFn2dyBIsf3H2Z4eDRjlyFlWxs6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OedJxvA+sldnUSIj5/gFmoZhSSInfDK7XVz/YDns7YpbYYsy6jaFNJ5+R8nAtBplx
	 rir6Nf6jIvPf0NE+oGELunxTwmf0BZc/pCyEDtsWAHBtiHnxZAJpJFUuHnScbNNUTc
	 1DJUXiMR8tNq168om6zJh1fvw4DD6kcgQ0txh9zPPM/gFJcom8C2GkLqZqPXFbMWoG
	 b66Xaq+nlmY7GXgO/+b6DZ1sAMeKulOhv09hSy9P6g/nG0lPYoCaRE4jg4QoYjRvu5
	 tX8uOUI4r1ZuD9Z/ot2VZwqgJgD6uiFW2cETN3sn1R0WCdqiym4TE7UU6yLmnoyfb/
	 rEk/DsKNHFokA==
Date: Mon, 20 Apr 2026 16:11:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Pablo Gutierrez <pgutalb@gmail.com>
Cc: linux-sound@vger.kernel.org, Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Subject: Re: [PATCH] ASoC: amd: yc: acp6x-mach: add DMI quirk for HP Victus
 16-e1xxx internal mic
Message-ID: <549342b7-d116-41c8-b1d2-b40e17b02b09@sirena.org.uk>
References: <CAEmuyr-kchxn5jWy1PxgZ1+72jNCqRdX0dAs5dJCSQOdhyHWQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uYmfRKx8NJw6pFNp"
Content-Disposition: inline
In-Reply-To: <CAEmuyr-kchxn5jWy1PxgZ1+72jNCqRdX0dAs5dJCSQOdhyHWQg@mail.gmail.com>
X-Cookie: Sales tax applies.


--uYmfRKx8NJw6pFNp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 10:59:27PM +0200, Pablo Gutierrez wrote:
> Hi,
>=20
> This is a follow-up to bugzilla #218926[](
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218926).
>=20
> The internal microphone does not work on HP Victus by HP Laptop 16-e1xxx
> (and some 15-fb2xxx variants) because the ACP6x machine driver never
> selects the correct card for the DMIC.

Please submit patches in the form covered in submitting-patches.rst.
You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--uYmfRKx8NJw6pFNp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmQh8ACgkQJNaLcl1U
h9D75gf/U9R+aZX8q4JggDFWw5IkAIxZ824hF3ebkbhTLCunXJxPkT1nvV4eP+AF
p3t8vhTqn73rnDHtPm0gTeiR30NgOc2uIafZWa7DNgxXCp39nNoPDy8XRN/cfXSJ
gfqdPmj/e6duDnHo5usPCz3t6dUD+cPsZy2K/jeZbBbrtZ67x6TuMYTSdE5Jxyk1
n8/W6mkO0u1H+mj8Y24cZbKbK55bunS/h9BTBNEfaiG2wRaFJI6nmRE9R4OI7zUq
NpF8QK0zdaieyRGu0z1HpHLG6nkac1gBpj3bpwmSGFGTtk3kKNqlbkDr3F9/ZsbK
gRqeHeCPFHjCiViOz10cNqlT5jbZaA==
=vPCG
-----END PGP SIGNATURE-----

--uYmfRKx8NJw6pFNp--
