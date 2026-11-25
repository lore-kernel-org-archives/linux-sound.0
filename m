Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610385;
	b=M22SFw8dbyTSn3hUT3Q72YwbB7REUWLKeLw4/9OwSaTOgDZGIgFOdanaqF3oTlPEttCy
	 6si17BMSMXcCejKEWmvpGTg+F86ISRb0933hFqk1gQ4PTwnCUBLmFyIoz0go5LKZ40yKb
	 +6AwLAbFNaHGUTMB6+DgR2BkcpLhGAP/w/dFmLK8i71/QyvNBVUM81T/RMgfHfCyqzPnc
	 1btTaxOKAGhY7CpX6Lg7/8qAHqkWsKoXuOZktvINpvKhoBIGjGHjoCG7iDTbPJG9e/aVU
	 v583krlrfjuWDDOLX2yp1CaOvEeLgNSGdDSXt2ncni2fgJiMb5WIo0QhpiDdSCAWlpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=0uBCz942D50W317R0G5WoH8qz9QYEdnv/+lcu/YDx08=;
	b=zgz190rK3+HPW5EFALPRucysM5Y+yoKCicH7bOpnCxXKUM59Tl3gl81FRWF/poKdADwV
	 /4okLeCOV26t9P6RgpmmgpowahkOPIgOlZKk+7U7EPG2oOjcTr1PGVqVRUyZ0ihQdUztv
	 DK3KhQFKU+sUjnJaDDFnJPFL6V66xTGrap7aBsnJLcLv6btSJESCS5NICHdCpte/zSA0m
	 RRLVwqM5fLg0xeQavgtIZeL5ezsbjbVtkTqTxtzIzEb344/gbU54yCubV3FXmmfb9S8VF
	 FO0RdZB74Y/VVZA5O2GBN4wemNyrffZssE7YiNf2qFq0IaGvfWXelfrebPEApeu5tBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azlCHFIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB37606A31E;
	Wed, 25 Nov 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=azlCHFIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACD91F000D4;
	Wed, 25 Nov 2026 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610384;
	bh=0uBCz942D50W317R0G5WoH8qz9QYEdnv/+lcu/YDx08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=azlCHFIgVapBlZRyD+i429yEY1SPU6BbYs6qP6SvIxcHVtsyKMnRV761ks8vaBwxz
	 ep8KHmjyAvHGCtSsgcUnTPDy87nYUR0dGsklWrsfUSp6udBKJ/RwgdOrryWLe7SYE6
	 35N7CuFE+u+b/k6EvVyEaSFI+e8qt78zKKDWTW6eP8t0ItODr8t5wXvYO9nv4yPlVn
	 Eu8vnL3iyRwJZgMCQmIVJ3+5/bKB7cX1htUG2We5WEarVNvAO5rPubuBWC4Rrf/AQ8
	 fCTAXunchQpzhMFZs0b3HUoebLmerPtqPvZ95XGCJqqm3hdss1kPZBdytW68LIHjiI
	 HgL/Vg2AjHMUQ==
Date: Wed, 25 Nov 2026 12:39:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH RESEND 4/4] ASoC: cs35l56: Add test that probe() doesn't
 write SDW mux registers
Message-ID: <44ae0233-b475-42f0-a1e8-2c3299a4df50@sirena.org.uk>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
 <20261125110853.741337-5-rf@opensource.cirrus.com>
 <61660f09-9402-479e-92fe-6b1b2bc48158@opensource.cirrus.com>
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
	protocol="application/pgp-signature"; boundary="HwjQJAqEZmsHx7Z1"
Content-Disposition: inline
In-Reply-To: <61660f09-9402-479e-92fe-6b1b2bc48158@opensource.cirrus.com>
X-Cookie: -- Owen Meredith


--HwjQJAqEZmsHx7Z1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 25, 2026 at 11:24:53AM +0000, Richard Fitzgerald wrote:
> On 25/11/2026 11:08 am, Richard Fitzgerald wrote:
> > The driver cannot assume that it owns control of the
> > CS35L56_SWIRE_DP3_CH?_INPUT registers so it must not do anything
> > during probe() or component_probe() that could result in a write
> > to these registers. Add a test case for this.

> Sashiko found a bug in this test. Will send a V2 series.

Send something incremental, this was already applied even before your
resend.

--HwjQJAqEZmsHx7Z1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG1wwACgkQJNaLcl1U
h9CP0wf/Y6JW5bdzAlyxdy+QCmo6UnC0yxDV46QH6fwYojQyj8uG2+0cdoRz2Ngm
H6e7ZP4UXy37n2KgkYPOkQP7VJf9/AwnQ4r3Kq+P5Xrd99TeQD6NHDPUeyVek6Wh
A/AagpDQnTydw9ujfCFkzFPoCwCyS5ZHPot1a7+d7WsDG1XLXqIUpDA/0LmKH4V3
VCJEUTVvjoXvtl8lAZwngIwcs+QNOYfFkU88TycrmkzMS9Z8ox2y2E+T6KaUlUJo
JeT3Kj/8PNILe0nLtT7fmyusrFsoP/X06IUsX2xyCmgQFKwN3mEFfzZloW41g3yx
EVoxrlT9dBYW0XdUObxVSW2oob4Q6w==
=2xif
-----END PGP SIGNATURE-----

--HwjQJAqEZmsHx7Z1--
