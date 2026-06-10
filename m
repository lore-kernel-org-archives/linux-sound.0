Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25D83F6C32;
	Wed, 10 Jun 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087384; cv=none; b=irn+h283GlWkVXaHLKbbWab6aGq7GLPD0s3LhnHSCnhv5BXMxMy4zqGItcH+DLbLWUgTgGbkqM7VSiZD1/HYkSvfGMqXV03AsyOgNv+3NGCdCOO/RMQ3mo8ARhKAmy/gQjnX36UpO2XIklPWHKC+/hwqSO6RlcFDSPATpSjKdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087384; c=relaxed/simple;
	bh=pSaIkthxiREAEzuyiSPyD2tUBD2wVNHDA3XpJGoljcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLzT5Uc5IDAWo80RsaxoGM6Mq5u5fub73ZSqNdSKKaXZmR55F47Asq7JpgQG634fM7ukmGKEEAoAzmG1GBpj8S1tmS91sgNd/ebWJs7vKMR7gNQV/4ZPVDPt3V6CivEaKSbmxESLQMSRn3FaTrwbqFmHTdrQlLn4jjGK0guMuIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzadCfIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzadCfIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C4B1F0089B;
	Wed, 10 Jun 2026 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781087383;
	bh=3X2plN2uK6wl3ayGLbeGJfQZllWRoVQBImsYWPTIovQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QzadCfILefKwzyv63SiFT9g1+P1J1igQ6UNVjJ/gbbeSZK0ITcXw/v0Q7SvVjbiQC
	 jQzMG+fR8E8m9yO7eQaW/BWsnFBmHN1lrh58qnWTcOsrUM0OQzq0S3r+LcYYSSY09O
	 8zD5rCvejUs3P63T06ar2dOjZrwaaWeJeOMyzVe8VHYAz3KRiMuyVbZTM3qlB8BoTr
	 hZuLF27uMUoD5cvr2n6DYI2YGRdXMjbReMUgraLSHqMLJjqutoZlC3Av2c5jH+gFXZ
	 qX2k7dSop7xFYdsCOKcUbMbvj36+Lcjz/x3Gxpa/QGxycOQs0vIJ3crS+VeZUVxGqz
	 kV6mEdZeEt+xQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 97E431AC56C4; Wed, 10 Jun 2026 11:29:40 +0100 (BST)
Date: Wed, 10 Jun 2026 11:29:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: fsl: remove Efika audio fabric driver
Message-ID: <aik8lG7M70gTEeUg@sirena.co.uk>
References: <20260609215212.28713-1-rosenp@gmail.com>
 <aiihFWIOxS9XjZyK@sirena.co.uk>
 <CAKxU2N-Y8kd_2iaVcuR5ypXsu4su7gOqK8zuChEp4DZ8Tj+pjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A6F3TUiWbZksfkc2"
Content-Disposition: inline
In-Reply-To: <CAKxU2N-Y8kd_2iaVcuR5ypXsu4su7gOqK8zuChEp4DZ8Tj+pjw@mail.gmail.com>
X-Cookie: Leave no stone unturned.


--A6F3TUiWbZksfkc2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 05:29:10PM -0700, Rosen Penev wrote:
> On Tue, Jun 9, 2026 at 4:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > On Tue, Jun 09, 2026 at 02:52:12PM -0700, Rosen Penev wrote:
> > > The Efika 5K2 is an OpenFirmware-based PowerPC board from ~2006.
> > > The platform code (PPC_EFIKA) and its sound driver have no in-tree
> > > DTB references and the hardware is long obsolete. Remove the driver.

> > Is this solving an actual problem, and was the DT ever distributed with
> > the kernel?

> No and I don't think so.

> The only reason for the removal is that everything else old seems to
> be getting removed.

OK, in that case I'd rather keep it unless it's causing trouble or
obviously can't be used (eg, due to dependencies being removed).  It's
hard to tell what some out of tree users are using, and some things have
a very long lifetime since they fit a good niche - it's only quite
recently that wm8731 went out of production for example.

--A6F3TUiWbZksfkc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopPJMACgkQJNaLcl1U
h9D8Uwf9E88NYy85ao4yuSm5mAS5M4TWqASrw3hfAL+kN16P+FaXUXyGFdhoVadv
T45Yc28lhPr/IP/yHD3wq+iii4W/4Ud6Iklc1b7elec6X7v/zbZh5sb4yF8ztoqo
CGG1TcA3sjp3CNIk1eZ+M3iefnAA9HBzM/N2Q3HNjy2I1oOX3e0tF4TnCmWyjeuc
gyaO5yNJ0ywXpxTL8c+EIU0GzolSGEvqKulBsBchxIMeYM6uBcDOodqmKKiJyzgz
KwDtYtnYJLQhODtxYzk430WOYGBVahwn+5bf3wguDsGHNk9GisXMDZHrBQ6vzF4L
zhhKrwxS5aJpK57ZGDpt0SMECvOifQ==
=qkn4
-----END PGP SIGNATURE-----

--A6F3TUiWbZksfkc2--
