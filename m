Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75F3B9928;
	Fri, 19 Jun 2026 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884326; cv=none; b=VjbcPhKu4W2yRVTon4WeGs0joZYDIeqwKHDJcLCjSplRMnoMKugarelTEZba3oLTtOxuTmLBLf+GiBPK3vHjre1JVMD1tipSqZsBzfW/b9CMf6/oFXfNRffC9tH0imgfhEK1WUFruxjfEMVh3KoF0o4KUF3jx0ZLhK10FHsWoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884326; c=relaxed/simple;
	bh=7HX3UQHS9Diqf7C9vVvPRnTZhnraTE9BET2NGWoOVh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ch6v5XRpspVDiYOom9e6cTwggj/F7I7kANiyoSE5XGF/wmtaf7vxhnWZGVo+YPv3X1TnbOzJFofC4Wghx+i8NOrqc1IcxfZ0DKjiMYF4g1xN48KbrcGXcjWpKj1R2S7N0w7u/jzRns9ChE19VGOedkZPUnXmN1I2s/BsTZFyvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmgOqigc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmgOqigc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4703B1F000E9;
	Fri, 19 Jun 2026 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884320;
	bh=7HX3UQHS9Diqf7C9vVvPRnTZhnraTE9BET2NGWoOVh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QmgOqigcW8OCktc69QDgRThLHgdheBjNj6QzjnHsopLKDk+9Y2EwtKl+MUqSkPgdT
	 0aDgCJZkW34F2rYr0TeOmTiLQBdSjkHtdIvoDH9uIWpfHQxeH1YMLRtgBexg0iUIJg
	 Q1KQmUEpDRl2KGlu7D4GMpP55dYNh9D6tLa1+F/k7pIgelOIDrPu2uGJAobu8hsaUp
	 6LNquNDoQAWGBwdo11lYile3IxevIOT63MPrBFoG/qs4DHyspyBjBoJjiWtnb7K/Sf
	 oIacZMxXTMG1YcPu69zl5HXjiZkeyeGOYL7mHfEJZvG9jzMaW5mB+94l9S2WjmQ19i
	 4J/UadIfcDHsQ==
Date: Fri, 19 Jun 2026 16:51:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <23198ec5-398f-48da-a079-47ce208e5c7f@sirena.org.uk>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
 <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
 <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
 <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
 <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
 <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ve2PpzO93LhgGYK5"
Content-Disposition: inline
In-Reply-To: <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
X-Cookie: Courage is your greatest present need.


--ve2PpzO93LhgGYK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2026 at 02:33:36PM +0100, Richard Fitzgerald wrote:

> It makes this whole device_link stuff less useful if you can't use it to
> reorder a parent-child suspend order for when the parent-child
> relationship isn't relevant to the order they should suspend.

> If we skip entries that we can't re-order, is that simply adding
> confusing complications and _mostly_ ASoC forces the correct order, but
> in some cases it cannot and then it is up to those affected drivers to
> figure it out themselves? Can we always guarantee that those drivers
> will know which they are, or can it all break subtly because a driver
> doesn't know that in some systems it becomes related to some other
> driver?

> Mark - should we revert this because of too many corner cases in the
> device_link code and go back to every codec driver with a system_suspend
> installing its own device_link to ensure correct suspend order compared
> to the machine driver?

I think so.

--ve2PpzO93LhgGYK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo1ZZoACgkQJNaLcl1U
h9CtNQf/RSLxlepPaYtescR67cKMHiyVgPeYmKsbro123k0EtkoG1L3jPCbs1QzX
tQZfCdH2b2XoGpePqMbTUY/D9kF5Qjfqj1bancJ07b8R9dcr1gPjq8g/SqI3kL2C
dSEhdYaAeVT9/0WAJ9pXQ6uINUe8E9V6jynVzRAdH4UeJ7K3Ov+Bbe9CMAUkVqMl
J3VNH2LKLs3nWErKsKPyc7WFIia9EN3h2lOsF5tgWStVqZ4gEO4zBuwoZhyD8PXm
LRDdm9xYX4AjIM8giKWyNmoCJNEo/ScHeONLhVdRuctV1l43BkQ2vhS2LdC8W9tp
/0zeDZhMBwhMv+1P8ckQerz1Y+3P/g==
=RhDy
-----END PGP SIGNATURE-----

--ve2PpzO93LhgGYK5--
