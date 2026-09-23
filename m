Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F854D37B6
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166807; cv=none; b=ps2r8tLtfUHPgD0hbkQrlGkBCN9mSDJk67q5CnTEv4QvcDZO3jwQOaF5gE4RwNQUIlFI1ahmiMAgHNCXs2q0kbS4ou4QA46RP7vCl59oLgDL6X9JBJ4YB+Ue88nftsj9PauQrzDFDH85J4cWExf16AljJR5POGIQtQE7jU5vAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166807; c=relaxed/simple;
	bh=w1rQy1g6j10nH83SP6Muw/3VnzCHjWnz9dNnww7SlWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbEUOz/y694q+u/jl2I5/+AWlIvaCbK7mGCpJR7pkPOExVun5hWijgwAB5VCtBRaD2yfxwKbH2vt6KUTuJuw6EcaPJs7qdZbOdk+MPYjDBPjj4aSsgWHfbNqmNKUGrOtP93jztl/McWhIteGJOOCt8fWCG2ORdnL231MZknGD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khT2voD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khT2voD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24611F00893;
	Wed, 23 Sep 2026 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166803;
	bh=eskvzowqOUld37JtvvGU84KONMyrIHsBpXuk/j5kyW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=khT2voD5uARlTYCNIpmG6pmXZUDNzK4psP/9I5hqMBHmzw5U0K5ZpLMGV8h9JtpFa
	 doetNC6eNms1huK8O2jmzM8JmL2+n9527mTAxWcNSvMZQxtssL3TOBZXFp4Ilep4eL
	 9vghAwx+Z2EUdCvdJFSX3O7bl8SmxLzOgSRSowFxi1o1nTTO53/klmzZAJ9n9CBb9m
	 y7ezCH/tL6IRCU2TVzRM7fl8/aVLA4+6Fqzttgcmxa71ddGUub8B6z0pqbjdzUsl8E
	 HoGp5YAQ5f6jNg+eNNQl1Eki/Lv66YdRjxv2YTgxrn7ng96FwfeESfGrJhP983fG4Y
	 xTkKVarZIbs9g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1914B1AC5739; Wed, 23 Sep 2026 13:33:19 +0100 (BST)
Date: Wed, 23 Sep 2026 14:33:18 +0200
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH 1/3] soundwire: intel_auxdevice: add rt766/rt767 codec to
 wake_capable_list
Message-ID: <arPHDk4C5U4xAonI@sirena.co.uk>
References: <20260923110127.3419683-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vb0GQSsu/2uVchJY"
Content-Disposition: inline
In-Reply-To: <20260923110127.3419683-1-shumingf@realtek.com>
X-Cookie: Too clever is dumb.


--vb0GQSsu/2uVchJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 07:01:27PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> rt766/rt767 have wake capability. Add it to the wake_capable_list.

As I think I've mentioned before your patch serieses are always posted a
bit strangely, they're not threaded together and you never supply a
cover letter.  This makes it hard to work with them, tooling gets
confused by the non-standard presentation.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--vb0GQSsu/2uVchJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzxwUACgkQJNaLcl1U
h9B2NQf+NAd2/5GieAz7GliuAaKP1OjaINHGPIUpcbJ/HXQxtAPXr2uXi+nwcTme
ZgwtbmqxnOkUiFHIhx/QJFZ2iolx7eRP51jaof4ErCJCIGqIEbTic/+dYCQRYNrd
5m/HDO4X6BkAeaDDo7iATZkQRDrViy4wZcTHRN+t9FyrelvxV7sehWjv9PyxX+1S
+iXmScOwzTREOfi+3sHA0Bq3Wx6w14dVe/YPKs6TwkkApNAWErgdsPOGAUEO0mbP
H18iOX7euD1p56+sDenrR0B4yOGaguxWgWocwGrFn63QOIbia/JnVIil9yOG/LtD
gZRCRKblspQBtl2nkGIFvlwmiT26jQ==
=Yxoq
-----END PGP SIGNATURE-----

--vb0GQSsu/2uVchJY--
