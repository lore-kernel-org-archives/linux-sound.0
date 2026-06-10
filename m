Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992C4D2ED5;
	Wed, 10 Jun 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106402; cv=none; b=ZM4XSdezjsChQsdf9QotjjxrarqhjTAkZ6yCXmPRqF5I1kejk+qDgEm2aC1cb5VQINrPUX+y9CtYA1bNCLY9+i22OJoV3h19jc0AQ4vz1nyWCq3WKrK5qF31tNsTJf0imj+R/n3TRUXw8dEyIWIOXXXImKB0+QVkCmxBJ63KrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106402; c=relaxed/simple;
	bh=KfdWJVUy1kU0Nhcuk2I/MmIfNfdAKh+0EByci0W5Szg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaVTQrMcqM+lpSZxxeToFNNkJqGXm2yIBpQGGpCFfLo1da2Pk3F2oLg02lajJEwS44ti6+gAa4Se4jUrmFXs1+KXkHmlLqhz1qOOMhlKi8w+SHZhf8OrG31p4KjgLoIF0zewEtUor0C+d3Fde9MVwBVDXOh5PEsRrubEFZ4DktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flSmuyQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flSmuyQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2411F00893;
	Wed, 10 Jun 2026 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106400;
	bh=KfdWJVUy1kU0Nhcuk2I/MmIfNfdAKh+0EByci0W5Szg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flSmuyQVfR6Qzzj4264uL/3WKO4fpcjjZ4Jpe9LCYf8w3yyzBkv8J82QVqjrkmzVT
	 f3l9nEUh+vtSycuEhKgKkyJbWjprL/xSDxyAFXi6dOjZfQ0rcmCcqRFBm2BgjCSU21
	 txjRwsPP3m5KjRCREpBfcg+aHnfP7JKdtnE3YdXLBfg1oC117BM6h+1l4eBsdCO2RV
	 JLA/NvN/HDKG9Kq6SdG9LDOVGP3RRZ4W7tN2KyW6lAf4sQWIIzKpXPsQywVQjX/X7V
	 9ie4s2b02YYvDDh0WtIhos8Dror3uQHv1HNL0PZ2xdXYrduO2nJ4MSmPBzBybB56Ec
	 DmWapuh2XIRzA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5CE5E1AC56C5; Wed, 10 Jun 2026 16:46:38 +0100 (BST)
Date: Wed, 10 Jun 2026 16:46:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
Message-ID: <aimG3hIK6HUWyc2Q@sirena.co.uk>
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
 <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PxyZ8U/rEKlTlGqo"
Content-Disposition: inline
In-Reply-To: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Leave no stone unturned.


--PxyZ8U/rEKlTlGqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 02:54:08PM +0200, Jerome Brunet wrote:
> On mer. 10 juin 2026 at 17:21, phucduc.bui@gmail.com wrote:

> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.

> I suppose it is OK but it does not seem to really clean anything and
> make the code easier to follow in that instance, from my perspective at
> least.

> If there is policy to systematically use guard() whenever
> possible then OK, otherwise it seems unnecessary.

I don't know about policy but there's definitely people who are keen on
converting things to this pattern.

--PxyZ8U/rEKlTlGqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopht0ACgkQJNaLcl1U
h9CzRwgAgDswQDXFyzP5z4rETNyEf3MQAZYJYQ3LTNsRsjBW0i3YBsbEwiJoeDF5
jfTgd6UguAKKbHKzgkWe6qbYY2bUjMVI3xANcR4Uyd6SbyS92RpWyDH729+mDbLK
bP3l4yAWtiGfSsDqDASxflSVpkWJmSFcImDX9QxoEc8L94Xynh4V6Ju3g4U5mo1t
Z1sZmpt5uktyvYaTqt8KISlILUGBNzd3XGsmCZYLD+BhPprmyuPKpvDLPho+zXkP
+Uop8nWZpZGNNo2iJN5szX8ZEO3XVKsaXLcsbc4PeKNhqf02cu2S5aZm1N9az+Rq
1L7IGgsO7TnmOy1C6O6pK/6Hd9d31Q==
=eN3r
-----END PGP SIGNATURE-----

--PxyZ8U/rEKlTlGqo--
