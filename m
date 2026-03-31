Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7493E6DE7;
	Tue, 31 Mar 2026 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963189; cv=none; b=aSXXJwYBOmfzxY1EigyUR8y6pPHp1+UDdsKzItJBpfNKJp0KeB4ZRolnVR0BdfjdW+NG37npBYSqFlO2ZC13Q/2JIZ3i4RUxwr5wtaAP1u/tFkg8U9Gp9iuKEvmRCiRmIVzwpbouiA8Gm7ZKjxHZqquaw65gOBMUgPel7NKAoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963189; c=relaxed/simple;
	bh=sIID+jaUsIfUWRX3hs9dHmev488+DUCMHepk6xUBk0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB8FnNPAkAJ7Cp7bgctbtukOF70zIZN9iCQy6HFHwqaq/cQxiJROTS9p/wTAYTcf7FrUQQE/auS9eyREArlbSiKkWgX4WS/1970xPU7LEut9ZcyW570611AXm1+fdEyk5PdsjNxUbMw0a6ismJA2tnFsEZYqQ1+F8ZKT26TR8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8tQsHyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8tQsHyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D837C2BC9E;
	Tue, 31 Mar 2026 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774963189;
	bh=sIID+jaUsIfUWRX3hs9dHmev488+DUCMHepk6xUBk0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8tQsHyNHdb54EayU3ym9ZU6cHAdWi8ww+6PDsPhmdjvLcyxT6nu0+lKWb22lZ7oz
	 Y0I1FKng5Yd4AhxJwAGykuCjzoiWAH7c3MLsgoOKBh8sE4ax5Gt4UyfgizDASHCaeC
	 IUk0Wrb3h1eprQnLfuiYtyVCEadCrcpJKqXQYyOP1rDTjnXiFnbGb9fIdwwhc1uu7c
	 khsgz3lAV51BRU0mxdvC8V8qNI2pk6r8JLZeExTekL1FvgwGQmB9q1tWso0woqp12B
	 YwawlgVJG/s1ImnMZ8Z6SgAZUMwc+BXLOp5HWYvPZrt4EfNiV/OjBn8BEltgZipOH9
	 qr2OhaAphVayg==
Date: Tue, 31 Mar 2026 14:19:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] ASoC: fsl_easrc: Change the type for iec958
 channel status controls
Message-ID: <317fc80e-ec80-477d-80f6-53c395de4b4a@sirena.org.uk>
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
 <20260330112555.3637002-12-shengjiu.wang@nxp.com>
 <be591d2b-9429-43de-8d5b-357a503607d0@sirena.org.uk>
 <CAA+D8AOsCg9ZO0f974Ds3Vev8uSVj52mano=vG+Rvrw7dJ8faQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LOpMmFd7XkDIqfWp"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOsCg9ZO0f974Ds3Vev8uSVj52mano=vG+Rvrw7dJ8faQ@mail.gmail.com>
X-Cookie: I just had a NOSE JOB!!


--LOpMmFd7XkDIqfWp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 09:58:22AM +0800, Shengjiu Wang wrote:
> On Mon, Mar 30, 2026 at 9:23=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > This drops all the checking for changed values that we used to do so we
> > won't generate notifications to userspace.

> Yes,  as the type is changed to IEC958, the notification is not
> acquired by the mixer-test.

> Do we still need to add the notification?

Yes, it should be there for all controls - it's just that mixer-test
doesn't have support for the IEC958 controls wired up so it's mostly
skipping them.  Someone should add that!  :P

--LOpMmFd7XkDIqfWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnLye8ACgkQJNaLcl1U
h9CLHgf9H6BCGswe9bKAG8Mglax5K/kwoFNSVlPMHoaxjD2XXCtXRT4vuCmA1HlT
4F0m+YN8T3TcYmmjhr9IUL9+zS0UZi6XHfMmz1gQdoGHX+FCc3F684SGCGsf+LkZ
ikgldtta++E4DZHoekd0bSx9tQzr77V6lIZqQHEg6+/aDYdUeco0dHfVFh5OAbHz
pZm1Lh//0A8LHz6oJYAyOh5lSZn6zT1DvT0gpcyriRCk6y2Y0m4F7Testz1qanxN
QUrzr7Y0XZPXMs62UqI5MbNEcG+cCPlfGwL4hdqM0bNh71lsTc8d1ujbp3eHYp3Z
MKDGPTbKoZfbfuFY9u5djB8OvjYBug==
=cskb
-----END PGP SIGNATURE-----

--LOpMmFd7XkDIqfWp--
