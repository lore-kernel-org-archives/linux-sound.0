Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885A346E56;
	Thu, 11 Jun 2026 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181395; cv=none; b=hbwU28aVyL6A3T9ovz/Gcn8gS3jm4pvva05LxoNseJaKJlHkoDDUKkDMR23x3ZhupXnGT9PUhVcusJm3W02quNd7DhG5IQ6f5UpVb2zARgNkpocobeI60fjwJBYFk3WDjpuubjjqFihOCDBPeKg0qlu4o443m/i8gTLmvqkNVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181395; c=relaxed/simple;
	bh=oOxxIYmFTUetGlSGsDpk8mOO9zoGylxLDZ7zaJRNiJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfP6GfRKjYXZetX6xORp6xct4oznoSy5IzHc7mVHYcJZ9ZhLRWMoycGO2Q/cE/QMroKl1+jV1VOWRLL6UrvxjzSZdFgdtVZnXA1fEYjl6wqa/DQFwDtPH5D9hmdlLEcN9KzWDa+VPRr8X1W48yge3o3iZzXSAD0D2JqvOE498ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juXP/ER4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juXP/ER4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30F91F00893;
	Thu, 11 Jun 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181393;
	bh=oOxxIYmFTUetGlSGsDpk8mOO9zoGylxLDZ7zaJRNiJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=juXP/ER43vPKW0KeDLwfEpsoCmknEnw8MW6MsLjaWA7UOIXAEGSMpWYiRlKu/0CEh
	 oCZ4Ycz1N31n1rnszicOEXuXm8BeyfXvABxnGv+ZOb9go5u226D7fb8yChqx8GipHy
	 3uJgGwCTAXncJSExpubhp17H4jtnxtQ25duncAzDkbs9zGHJa6I8QucY+VOzW+uSQj
	 XxdTq5IcoC0OMeiBkhKPhzFnLuyTJVIrpYNtVZfRje8TRayz3KfjuuRIawfU2ZAXRR
	 wezZmOJLzumK3lvolhC3EIoqZehmVwqaWFkrzzy+iaEW9Qj8r4fw0TPAxU1RoI57C0
	 nKugE74mRPdCQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5E03B1AC56C6; Thu, 11 Jun 2026 13:36:30 +0100 (BST)
Date: Thu, 11 Jun 2026 13:36:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Axelsson <andreas.axelsson@androscientia.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2781: Do not report cross-instance writes as
 errors on SPI
Message-ID: <aiqrzlIGi0ClnygD@sirena.co.uk>
References: <f39f2aa8-33f3-4cb6-b2ed-56254ad63f3c@androscientia.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SAS12zwCj0KJS19R"
Content-Disposition: inline
In-Reply-To: <f39f2aa8-33f3-4cb6-b2ed-56254ad63f3c@androscientia.com>
X-Cookie: Leave no stone unturned.


--SAS12zwCj0KJS19R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 10:20:18AM +0200, Andreas Axelsson wrote:
> On SPI-based TAS2781 HDA systems (e.g. HP laptops with two amplifiers
> on separate SPI chip selects), each tasdevice_priv instance services a
> single device. The SPI bus glue intentionally returns -EXDEV for
> register access addressed to a channel the instance does not own, and
> logs it at debug level as "Not error" (see
> tasdevice_spi_change_chn_book()).

This doesn't apply against current code, please check and resend.

--SAS12zwCj0KJS19R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqq80ACgkQJNaLcl1U
h9Da6Qf/b/6W/ms5qmN1aIgoM4qfDUHZWu+1UYJ3wLVNDv0H4o2tLYe3uyTm7hAa
LdbXl6wvr2C7/KamI+jd+Z8BMCYISw8XDdsQlrRAZVjwL9a+Q8KuIWxAWxWWvP0q
2CqyPRs6DRoISSL5j2Ds7DPvFlkC1474J9AP1HYelucPSx5h8LqO8ri23WFt2T4i
Jqe6BTDZKFBlhIInzve7igJTHygGrZwinhTQhbRkeS6tvmlvC7ZTj10qYhQSRYGE
jz5MVMOQ00AM1vl4/4W/1O23d2MMwg9aIZ6J1DYoDuaw4R5nlWbZ9HeoKVpPcXnI
5LMMirKhVq1Vi/q7s2i7Hf4kw2dnlQ==
=uIDl
-----END PGP SIGNATURE-----

--SAS12zwCj0KJS19R--
