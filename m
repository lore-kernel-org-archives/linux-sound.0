Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EAA33ADA0
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932965; cv=none; b=gFJejnVsL38W6UNnU86mlEkuhDgAWgn8lmfnzVNLN1OfX6tQ2Wxb91P51dRc27N2g4khXr+6NSTlnRPoCRsgin2Xkc1hlems9p02jIzcawvZYeIWRHF26n5snwKViC456VDuhvAEexk3JNLjnd1ndb7U23g7lfhikydOdPrYXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932965; c=relaxed/simple;
	bh=BUIw7OPXWB/UWJa4kBNNolZawNI5+gMEOkHFGcj9MWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7EOSetyE3/VF9k/j64E+F/boolQsmyjhu3zJSms+fgtd/zLN0JTHBJMTU9l2OFE1+MkIcBTfaUIBDmFrRaxQ8hH/nKuJTQvlvCgRDVK0zQfFVx7FdlbQ2U713R0SIEk63O7mpDGWBIb8GHLRXYMu36mdS8OaW2aNK7CA1I1RoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mf8qNjv/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mf8qNjv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD482C16AAE;
	Tue, 20 Jan 2026 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932964;
	bh=BUIw7OPXWB/UWJa4kBNNolZawNI5+gMEOkHFGcj9MWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mf8qNjv/j8U/CPvtEqXOxhhoOb1vcdXaDOcNqOW4VUtiUbFCAtixqFncfnGtlKirD
	 pW57v5yM1wl+KPwwuJQPRKW526Ovytnp1bDxDdchf3LHLyDE8AyY2WDFSxjgNAa8pK
	 VhldpdrZJCJV4Ij42uEP/oO0DWI6kggrUk+c+y+kHWWqpfeOLfciMxxRL6Fg1Plc/v
	 grmlkv/F94r3x2CAbBUR93B5IBDN324SQV6lxGIJbCu0GhBNiT4f0zYyHfRjbWl6Jj
	 TFJhajBV2ktmd5b+JU92y6qzAX8goIdr1Y9fiuYq3n2bYh4qvetsXIOt4THy+lUeLH
	 lUsMe1zYzXL7g==
Date: Tue, 20 Jan 2026 18:16:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Sven Rettig <retto@gmx.net>
Cc: linux-sound@vger.kernel.org
Subject: Re: PATCH: ASoC: amd: yc: Fix microphone on ASUS PM1503CDA
Message-ID: <dc7a9173-d250-4da9-b8f1-95115bd49100@sirena.org.uk>
References: <4506ea87-d4c2-4db9-80f8-267a7a015cf2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="el1zsK5a1JelfA0R"
Content-Disposition: inline
In-Reply-To: <4506ea87-d4c2-4db9-80f8-267a7a015cf2@gmx.net>
X-Cookie: I'm ANN LANDERS!!  I can SHOPLIFT!!


--el1zsK5a1JelfA0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 02:32:42PM +0100, Sven Rettig wrote:
> Add DMI match for ASUSTeK COMPUTER INC. PM1503CDA to enable the internal
> microphone.
>=20
> Signed-off-by: Sven Rettig <retto@gmx.net>

> --- sound/soc/amd/yc/acp6x-mach.c.orig	2026-01-18 14:09:58.370727062 +0100
> +++ sound/soc/amd/yc/acp6x-mach.c	2026-01-18 14:10:54.532336621 +0100
> @@ -461,6 +461,13 @@ static const struct dmi_system_id yc_acp

As also covered in submitting-patches.rst patches should be sent inline
as part of the message body rather than as attachments.

--el1zsK5a1JelfA0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvxmAACgkQJNaLcl1U
h9DMrQf+LjhCmWIhJY2h+0tYxTAPGBVYoGoRbfkwJBJFiM6vMDUXXCMohqu8OhCB
dsLAx1X4RE0nPtMDQrZbVRRdV5pNK+eysEEYrzQXAyL75mjg6ZZ0fzhbcQBrFErH
cBl1AK1XbiRkqQGBwTto7eQDo0LCGBuqd9G3t4WKRniRjvboYKVyY2y9avzw1Gsv
L58/Bd7HcVECbn5Wj8akhvp25P2NLWsz3InqWLx6ScdMZneqgk5jLGnWY0YZBSBN
QsP/m2+X/tfuJxQZMf0yow5O85RgxdKL9nJuBZZyt21UmztrHFp+eRTkeuZ9Pesw
lIM0bEcx204xXwp5Qn8/wIE+wwH7oA==
=Q9pl
-----END PGP SIGNATURE-----

--el1zsK5a1JelfA0R--
