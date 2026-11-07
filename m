Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053411;
	b=lUl7G/kpgjUj1KG7bmHstHRmzCMQD9sQvPg/mHuH3s1zN87gBQpS64T+xbJ9tmwxZyC4
	 s3YYdDJGw5S81os3CbOmz8pWjRwCI5SUkz/VK+bKk8B/NMT35iFNvV3k/avK+QALT6/Fz
	 ynCB6N5JNh1wzMwZ4UXABN5FoEhcso5NKG2TjtOoj0pGBHG2clSUd34UqiQOX2L1q4BFG
	 caJidhwtGndMBikm7x1lVfAjE2d6cFVx6x2gwkBRaDM+Rkeha5IkftJnLHGAnEcGbg6XQ
	 pij0jAa4AL80C0Utm9XirMszLSrT703jA3dypMeWfOHe+bWapxe5Z1wxAerTn732Zrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053411;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=JPvnS4HnNvFpCdB+fLWvtdZpUVQP5c/sCfJFgiF3AnA=;
	b=HuMQpkJ2czD1iyylvqRhigj2cuuUDvmk0hxE7fcGVIgt8UjaryTd/7lxUYSbpY/FpDpo
	 W3Gt9XB0/8ADtoKHZ7t5lwZFvd2pAQ4CFaZ1KaqaCYJDp9aHw8071lUcyIZgYOCxEon/w
	 IN56FOQsJk8JoBX6dNNp29zDtEAUq6IWckXJJw6diNVAU0lVSLsrffp6vaiXd4XkasdWI
	 TPT4Co2XuIZ8LSqSjrz+CtErGB1VvGpoW+6PpEsO1bPJoKibCzxg8ZiyfWhYRU/CvM5t7
	 w+5yIbLnIl5mdVNfFFflLEz6Da1HtLBoS1kVVrSacQjD0/bmajcXQkg75owMZxBQCvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iefJ9knp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B7606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iefJ9knp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157D91F0089F;
	Sat,  7 Nov 2026 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794053411;
	bh=JPvnS4HnNvFpCdB+fLWvtdZpUVQP5c/sCfJFgiF3AnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iefJ9knp+iuKbO2lI82nX8yML6cOIyFEWoubEVzDdOi/WRBK8/oWQ0vWV5uaaEpIz
	 d7C3OQ7X1vvlnfrzZMCTKcXxyE12u4wNzro9kbFFS4lUZsS0pg7EWd3EqXtXcsQa3M
	 oU/4mEskx+BewbrtNN3Ugr+B38ybM9QbHjOHDpf8HuGQUWNIGTs5w2eqaXd4+ob35z
	 dvK8hWKUC5iWnmgKCOVfvdyS5+IHLFUanNJBKUpTHwziaQJbSycOlwf3Z3fhGrOTZZ
	 uarsXAV21eotxOURKdkT1RVaQhcYi6y4jMvqR+tq7XyvHV8KENj401GCGdwPKDxpvv
	 32PuizIjn6G+w==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 488B228F6C44; Sat, 07 Nov 2026 12:10:08 +0000 (GMT)
Date: Sat, 7 Nov 2026 12:10:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.4-rc1
Message-ID: <c40c4999-8eb1-4175-a2ec-d82afdf456f9@sirena.org.uk>
References: <20261107113234.7C6DB28F32EB@traversing.sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="LhsjUHfp/Oga+bJA"
Content-Disposition: inline
In-Reply-To: <20261107113234.7C6DB28F32EB@traversing.sirena.org.uk>
X-Cookie: Whoever dies with the most toys wins.


--LhsjUHfp/Oga+bJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 07, 2026 at 11:32:34AM +0000, Mark Brown wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7=
e4:
>=20
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-fix-v7.4-rc1

Sorry, my scripts got confused - this is duplicated.

--LhsjUHfp/Oga+bJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau8VIAAKCRAv73Ows9A4
iSreAP0Tm44/1x5KzwiVsJUSyDT4IYYZHC9REQc9AZUVjCMIvAEAp4w8ec/Hwt5z
CpABLrIXlVAqp775rZ6dpmo0NBVlIQw=
=hAYN
-----END PGP SIGNATURE-----

--LhsjUHfp/Oga+bJA--
