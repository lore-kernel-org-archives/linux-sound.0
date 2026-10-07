Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C540DB5B
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370103; cv=none; b=H5pDxYbgL1X1B6SZliGGWll2VdHlvS7Oa3TXltTuPfJq64Nug2lbZ7EWy0pEFm4oFuybxe58GeIeHoHTXVPNRcRac6U2mB8DCugWYe1w/Jv+nP9/O01L/5rY/TBTz+x0VPcEiaMT8SF3EJPrwaJ6fYcdF03r0/k11v5ulEP+HPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370103; c=relaxed/simple;
	bh=LytnywuOnhwqXBkXCG13rsu8R+spdqqmoED5wtsC90g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElCSMIXjnF5sZrP/3ogGAg3RXEgE1YkiV2byti6UciKhx26/NVpwwgJ9EpDBs9Kj3OFd1WJ9gIv7mGs0EXAf01HCaa9oF64MPJakr8nhhbsWOWEdTVDMbFKOfELS0xHx8Ubw5MoAN/XkvjesbMmoftWBBgkvSJbrR0/aYz5iw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxSeH9h5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxSeH9h5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F039A1F0089F;
	Wed,  7 Oct 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370046;
	bh=LytnywuOnhwqXBkXCG13rsu8R+spdqqmoED5wtsC90g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BxSeH9h5whGClfihg+ibdVOIMp+7VUmJKM65yBPhFOrTEuXuzAmw5oK/yxH2FO9br
	 h7V+OGFNjU9qQbd/AMWQV2IkJMlGvvfzr3noAPpIOtNGn7RJHoxtC9aGhK+nUBUhka
	 Zq2E+VWVxrIQOW04HpwSWjXTD2sLDx26XMpUqhhWp+sB3PpKHLyPbgwxZbhFLtcBgJ
	 sHXe3FXvfi68IOb4IZhdxy6e94hlLbuEulUbjcet4o6UyYvEEvA6T4XRxHkKFJTqrG
	 5HFg9FxJCAW1NLzisQtGHsvDqeajB3eVqQJFo6c7t+i5FmVXC61PFhZoXoxP/X9+eF
	 uEYZZFIbcfT4Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 84CE81AC57CE; Wed, 07 Oct 2026 11:47:23 +0100 (BST)
Date: Wed, 7 Oct 2026 12:47:23 +0200
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt766: trigger JD when system reboots
Message-ID: <asYjO4n9fy8qC3kc@sirena.co.uk>
References: <20261007092524.3711965-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzLnMHTf73wawTTE"
Content-Disposition: inline
In-Reply-To: <20261007092524.3711965-1-shumingf@realtek.com>
X-Cookie: You will forget that you ever knew me.


--mzLnMHTf73wawTTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 05:25:24PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> The initial jack detection at boot time may be missed after a warm reboot
> if the blind writes are not reloaded.

How does this happen - this feels like it's masking the failure to
resume properly after a warm reboot and there's more that needs to be
set up in that case?

--mzLnMHTf73wawTTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasYjOwAKCRAv73Ows9A4
iS+dAQDs2dndTTYSXIgYg784M6zvZ4jMMALMANmGMsoyfNZ0rgD9Gp4lwffteWp5
NCUeOExxGY0hr9ZmGP1XZRreXAgd5gI=
=W4iF
-----END PGP SIGNATURE-----

--mzLnMHTf73wawTTE--
