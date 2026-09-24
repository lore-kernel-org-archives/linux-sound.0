Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73FF433051
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270031; cv=none; b=OAb4Wtdz66oFK9d29DDUAQL7iTHUzMXtRiRj3l+ccUFBMLc+S884Pw3vgTFCGhp0KvGmtTS5wA7ojaceYyI4KqPMdTjEUKEfHv5dVFItbjijPJKExq60w/H5uu9uvEnhp9Jk8dbrciXUrgqK5VKyrL/stEynZORQft1xtI0r+B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270031; c=relaxed/simple;
	bh=3zNdKu1F5jC3EVYArzCB3EV2mDQRN4SYAemgk1KxbzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCXmVAcf8yySSsyMhlH1ftdi5hxFNSUO1/WQRpXC+4Qxxa+Q5OjIlm4cBlYTUBWd4eamHhw201GYjXCaBryvnF+luXmO7AQFc5YA/xev6rJsmzwNfBvMQAcjDgQE7capuEPr0js7w1m9WYYaPGv61P2JZ8fGBooGiHIqp2Qz4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCcRwuqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCcRwuqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7C61F000FF;
	Thu, 24 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270030;
	bh=URGTVMXZ1bjnc34/MBKBVKLOD8SGULhxGST6Og/r34A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kCcRwuqNGuKlOEqIBsI36iwD0HSVSwVADVf9yy1LowGuIek0dwafrC5/8acgYKF0O
	 GHvFo4QOtF6NdbWK7apAP/ropbupCEKlnSu/1zQ3+kkEignNE3901oxx/e/LdTZmwb
	 jXocwJsnqaShvya0gdN54UFHOCNhYb06Af8uuJLzHmjxslFFyzFc2zGGNjODWpGhSq
	 WPbYfC2XQ+cKepUi06PB/yP0u/mO/LzbW1VuXNC8gSnip4jeP8exyTiOj1oK8yDgx6
	 nerRdx5YIgctxwaaRDOLNrI9WxdM7XngsySJ0sFPz5w6xTkkXzrNATZ4Ft9hSDpm+m
	 5FkvwqxzDtVFA==
Date: Thu, 24 Sep 2026 18:13:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH 1/3] soundwire: intel_auxdevice: add rt766/rt767 codec to
 wake_capable_list
Message-ID: <389be05c-bdfc-4881-a0bd-f1c05d89a95e@sirena.org.uk>
References: <20260923110127.3419683-1-shumingf@realtek.com>
 <arPHDk4C5U4xAonI@sirena.co.uk>
 <7a61abc07cd2469289d877b70723b973@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4teqZQc//wSBAAyy"
Content-Disposition: inline
In-Reply-To: <7a61abc07cd2469289d877b70723b973@realtek.com>
X-Cookie: Oh, so there you are!


--4teqZQc//wSBAAyy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 05:18:15AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > You might want to look at b4 to send the patches, especially it's web
> > submission endpoint which avoids having to configure mail:

> >    https://b4.docs.kernel.org/en/latest/contributor/overview.html

> Sorry, will use b4 tool to send v2 and supply a cover letter.

Thanks, that's really helpful - it makes things much easier on my end!

--4teqZQc//wSBAAyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1WkYACgkQJNaLcl1U
h9BHiwf/drD/J/4BZnltaDGGc0JkYMNp1fNCeMIVc97njVdyFgl176KUUibdJadX
LGG0WpLKEZO76sHAULYsCbOBKXrMeKuOWkGlZjR5eco/rs1lhIei2k8LVDdf0td4
lDdDUg1w3NIWOa1t19GuXEUj/WdzsNA5MZS9uYQe7iLGuFI7y3DjlWC4AHlDNwWK
rpaHw5h3GdkQvBkrAF+5cwkVVTt59OThXKa92JqGDTYkI1mWW2lTrZNG4IvNW07m
1Ymz1Uy2tYL9Jv31Z7M3UiSyTK6G3SMW1cdxpZOHVLLHIIJBJxLjpiaPS57uGH6V
KrZ27czgEgKf4Tw07Pe4+jNJ5PVucQ==
=ZXD6
-----END PGP SIGNATURE-----

--4teqZQc//wSBAAyy--
