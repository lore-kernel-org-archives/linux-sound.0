Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9733344A;
	Mon, 30 Mar 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883333; cv=none; b=rlADhHlR51LZuInmjdY7hSc3K5H8d9TmwHzYuWfOSWRseta2DBHvQ0qO9zVpIT21Hm38gVsta+AagkNTIumaicvodLxMoyFbqT5ciUMBhL/eFxfuLRSlQ8l1d+RzSYM+pZpDxgcWCRNylkUd3VD6067G7OrOQut4gPteHJ26ups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883333; c=relaxed/simple;
	bh=bNIY/KxBqgshoOeIzFQ43US3IKEEmyG46QSMOR89rn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MidywEbJFMcpxml/stM9s0f8OSI2tQtHoZVjy2owLHHm6t2fEAo2ri13JppjkUiTHCmahU+WD2ns0syuDXDq7+l1t+m8aQRvrll2JKy9UlUd+/fA+TMwufMr5URg02iPiNlfY0SkMBnS+pECaqMVJBDctdjafBPjPyoP+Yui+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVIKelLB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVIKelLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE3BC4CEF7;
	Mon, 30 Mar 2026 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774883332;
	bh=bNIY/KxBqgshoOeIzFQ43US3IKEEmyG46QSMOR89rn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVIKelLBNH2G4RIIHZWvCh5a1AFLVJpT12KHMsl6oas/uJ76CGydUk4NVg1He1A1F
	 GpmaATTVk1+0KrYnhwR6Xe3WPA49KY2Ft7gO+15o8l/m5OjlLvmsT7m/GbiQMxq38t
	 /qPeM4CYJeokRMbbWOBQtLrLZaiOfo3AvHZG58aXSxqQ76gkp+faUXUfFp2+3nwSRT
	 DTQZ2woU0/gqih08j0aVAgo0dRXgZ8wz1BQJWDco6Gg0//pWj1SLFOMQjjAQKVpxl3
	 YJkXv3VSHAiQg4/P/hKcn/UMrDemX/8DSR2Y7CY/L1DG3zrWW1TbcQhttqNvydU3hm
	 D3rjdDjnQ/DSw==
Date: Mon, 30 Mar 2026 16:08:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/4] ASoC: Add support for GPIOs driven amplifiers
Message-ID: <4daaa17d-5673-4efa-92ce-4f2ce87eb812@sirena.org.uk>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EOR3bLyGDtOCyecf"
Content-Disposition: inline
In-Reply-To: <20260330101610.57942-1-herve.codina@bootlin.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--EOR3bLyGDtOCyecf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:16:04PM +0200, Herve Codina wrote:
> On some embedded system boards, audio amplifiers are designed using
> discrete components such as op-amp, several resistors and switches to
> either adjust the gain (switching resistors) or fully switch the
> audio signal path (mute and/or bypass features).
>=20
> Those switches are usually driven by simple GPIOs.

This sounds a lot like simple-amplifier.c?

--EOR3bLyGDtOCyecf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKkf4ACgkQJNaLcl1U
h9BJVwf8DGBA6i4iG/IhtLwjyzLc9YE7p6HxA8tfOMCr9TZYHlAiGkd/XgxwTtHy
/DmslYhIG/p3MDrD9lgH0kR4X9ulb1r5DhdqdjDyY83sglDCm6m98qIxKoi+gYZ7
4eG8D33RSqT75yK3qnvSCAuQT01LLzm/TEtrO9pE/8MsC3QfmsBDdBmIV2seUiH3
uD9iIHzv3v2cOnByw94PT2gjQNI4KjM1IqkvLeuHTqsn6zW6kZGZzKngMySls5e/
A9NT6iJCDAZnly25MQGgdAyalv0XI/rWEggVNSNtGuOCkYRChqxHoMVH8wbtfreY
EL+P0F5VAN4UoCRYXLXlftT9X+TT7Q==
=DYV/
-----END PGP SIGNATURE-----

--EOR3bLyGDtOCyecf--
