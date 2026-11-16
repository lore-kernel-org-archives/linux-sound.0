Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831848;
	b=CrYA45JOBGFpKRvW4y9Al5diNYKU4A18MZoJ4ZTiQqq0cJsegLqrSxaSRYY+whgDcV+Q
	 sbJ1jwz/nqqa/QTvPdm9LC3rB626BiPzZAyxaMGYWHkiYMrA0m+75JQOcfPBK3E2DXBu3
	 MJAx6/su+xoNzLSEed+Wmt8Wz7BPr0yMYcg4YaBp46TvDfOGdrsKQWb61QBS7UySaiEGY
	 m4V2B5or8yQLJHPeHq5WdpuT8ucPnGnplhgcXLFnrqp00G9eD/h4+wYO55wLQHpLf/qj6
	 8gm9rnI90gxaM1FnaGBqLXWbsMmEsbJ5/thdctm5+kKYraPpiBx6KRW/9skp6s0aUug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831848;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=TH4G+Yovt0M+3fEerE0vA1mqSAaWKiFWA5FkYgRbrck=;
	b=kOPMSkJXKQcf9bAGiCsP724o4by4qEfMvM1chhXNh/FRoofgT6H1cocHPNa9IuXbIHOa
	 8A0TzoqQpsd1XskGEQX8RnmhkaIEPxdtCmTyNK6+g8zUpm2/xK6soOSusuUR8Er2HKbJA
	 Hodz/m+nlyakZnDL+F2Qj0oEHLYKsxRLbau1KhlC68JqymijUVApasAfgMmBcmN5pvrnD
	 dtF1tJPmzFxqdadqL843leAdTcW3GCZfP3PrACgSqS+EpXAWyY+FXA/2guX3Tj3VQBLaG
	 dMXuSH+w+fdXdxMkwpFVTyj0LNlB0pBTIob3rkLzrQ37KQEnA9QKWN4wYERF51YRrcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6cfB8M2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51581606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6cfB8M2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FB11F000C4;
	Mon, 16 Nov 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831848;
	bh=TH4G+Yovt0M+3fEerE0vA1mqSAaWKiFWA5FkYgRbrck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6cfB8M2HDKjJixhZXQr7zIuTffhW4rFuS9rDfKGemzM1AboJTVfdTeeMJepvrBtU
	 coi/+w2swS7r1yebDaI6PGxwp3500G304z5Qx5OMc+Z2r/pIf9LOY+tON2gMSnOBhu
	 ZHsgVN3dgsCWJYbLqcw7HG5ZDRENBl3X6HSXBlG+iSiXvYuwqyuit31aNt6+YeU7+l
	 LgL88zqUVqMxAYlJgKTCF90hXUnQJbGM0v1ZYFExzj1C0KBjOCGjLB8okUzr8GesAz
	 RK5fxd0Au8CkBtYdtxep3cW2I6TuFzmiwhIH2r+CyBoTDPfhxVGNOTrqK9SWtY/g9b
	 xP8dht18NKt7w==
Date: Mon, 16 Nov 2026 12:24:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v2 0/1] ASoC: sn624x: add support for the SN6245 part ID
Message-ID: <496432f3-1897-4eb1-a5e8-9d4bb467ca63@sirena.org.uk>
References: <20261116075101.862234-1-qianghua.wang@senarytech.com>
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
	protocol="application/pgp-signature"; boundary="Eq/eKyCGpeWl+pcp"
Content-Disposition: inline
In-Reply-To: <20261116075101.862234-1-qianghua.wang@senarytech.com>
X-Cookie: Madness takes its toll.


--Eq/eKyCGpeWl+pcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 03:51:00PM +0800, Qianghua Wang wrote:
> Hi,
>=20
> This series adds SoundWire / ACPI support for the Senary SN6245 part ID
> (0x0496 / 0x6245), which is register-compatible with SN6244 for jack,
> amp and DMIC. Without it, SOF reports "part id 0x6245 is not supported"
> and Panther Lake machines such as the MECHREVO YAOSHI fall back to the
> HDMI-only HDA machine driver.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--Eq/eKyCGpeWl+pcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr69eMACgkQJNaLcl1U
h9BJqQf9FkwgYCtPb1InVKXRGzyGpOfnUmBIQotOwnISsdQ2mu/7cBuW/DofLjw0
odQokwVOrDBWamgJsRppi1aXKDMjaABtCEXRep4Tm5469J+5Yf/HTMSZPla0I6Fh
EaQG1Qa527aaEAEKB0aJWBJ84bc3AV7jpFB5i6tvLfNnyoWorGZCJHXXtAqlOtH9
TtAeHj6kPaUz6jj2Gh+f5BpxDav35wl2P/K1N+3jEyF2ejjPXTai0lCxby8v/ODk
M+BV6Ag5oxrU2HOtV+cE8sYHedLVQA9iYEPB0tKvYGfOXEO3Eehhag7RdiLWA6ti
qKolZbs7R6a8Pk60qVgpdHGzS9KX9A==
=e8BS
-----END PGP SIGNATURE-----

--Eq/eKyCGpeWl+pcp--
