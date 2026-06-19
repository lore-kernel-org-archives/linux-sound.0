Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E626B2AD;
	Fri, 19 Jun 2026 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781889557; cv=none; b=MlYN6CAVGFhzkwIpujxIGbzSSZRjxIcEvhOLiehJSq0xzEyRjhWJs742RogOGTBfr8NqVXw7/2O3TwYIyRJ/7mi6ZdBohpJN/BdfjvZo0GojHuMmjDkE+Gl8o6GBMtaTXKUDpP8BVrbzbRER8cYrdqCedIorDWDdorp0Bfm8rwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781889557; c=relaxed/simple;
	bh=SFkFybyFwMUZ22sJEeSIMsP6aF+OcudVxkVqICF94bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNgKyG9fDIoKoEeK9UfypSQPaId7vofq2fbBffiflINZ16XgCEefprDm7jwNrKwPxKgYNcH2DgWCSOV5t63tQad00J42h+o9TlP9zQPrPUiWehTSxCLa4wiOLZBitcAi3bZa/+OJTieofImINp6qcIy9EL5XhdhByfW6HT/Leyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGWtVs0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGWtVs0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181181F00A3A;
	Fri, 19 Jun 2026 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781889556;
	bh=kZhHwMfoB2KOJeS0xz4Yn5SMG+QgX9HTr9lQ1PjxAFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fGWtVs0VOzyjFooMZBwPpmpDt3DRhael0f6y1umlhVXNsCHuXaaSOj7hx0vP0hl+c
	 HSdRG9PHwjvEgTsLtZI52o7mBIMhmbW0Id15teL4gSjBHYNjCIp+RGVULZdtLqnNtB
	 zltuznXntXZrdnPSTkZHX1h7ceULB6DomDEM0/Z9ax0nT6ITpZmsLqaWKyxGrw5EM4
	 sP43sAIMiLoQSiU2fCNkFICwfD0eKYxcJ6uPrScs8N5klcqdoi+t18W58zWuV0xiud
	 d8bLUNBQGXdyYtDiM6HdaVDDULpSC+E9OtS88IBKtU2U4252McwgSVEJZECepUE0uR
	 I8MIu/O+NjeZQ==
Date: Fri, 19 Jun 2026 18:19:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <8f09b42d-b091-4c25-96a0-d477084d1a60@sirena.org.uk>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
 <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
 <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
 <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
 <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
 <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
 <ajVmJ2N/sDKxVZx+@opensource.cirrus.com>
 <91aede2a-d0b9-43ee-84db-ebc16881425f@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1TnwAW+Jts0277Wy"
Content-Disposition: inline
In-Reply-To: <91aede2a-d0b9-43ee-84db-ebc16881425f@opensource.cirrus.com>
X-Cookie: Courage is your greatest present need.


--1TnwAW+Jts0277Wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2026 at 05:04:51PM +0100, Richard Fitzgerald wrote:
> On 19/6/26 16:54, Charles Keepax wrote:
> > On Fri, Jun 19, 2026 at 02:33:36PM +0100, Richard Fitzgerald wrote:

> > > Mark - should we revert this because of too many corner cases in the
> > > device_link code and go back to every codec driver with a system_suspend
> > > installing its own device_link to ensure correct suspend order compared
> > > to the machine driver?

> > If you go back to this you still have a situation where ASoC
> > mostly does the right order it just took you more code to get
> > there. Also I think you would need to install the link from the
> > machine driver, since the codec driver could be used in
> > situations where it is or isn't a child of the machine driver, as
> > you noted earlier.

> > Personally I would vote for just skipping the case where the
> > machine driver is a parent of the card.

> We're still in the merge window, so it's not something anyone should be
> using on critical hardware or daily driver PCs. We can think about it
> for a few days.

> We could also deal with the case that card->dev ==
> component->dev->parent, then give some time for more people to test and
> see if anything else breaks.

Another option is to delay for a further cycle (which was where I was
coming from with the revert comment), though I'm now wondering if we're
more likely to shake stuff out with things sitting in Linus' tree than
we are in -next.  It did go into -next fairly late in the cycle, but I
expect more people to test mainline than -next.

I was kind of wondering if it might be more robust to ignore errors from
failing to link thing but since we need to manually remove the links
that's a lot of effort for something ultimately hacky.  It would be
nicer to just fix up a few specific cases.

--1TnwAW+Jts0277Wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo1eg4ACgkQJNaLcl1U
h9BDqgf+IEglO+VLmmnZtvQzHkCMlAQO8gdTJTaOo+9FHBWowxIE9hT44ZpZk77B
OWFhBE8Gxm0cr1us97PHm/iw9r4NAs9xPTBajZhGLSXuTWQWY8sIMoG/1Cj5Ch0q
GaAt10/6pTigAS2G1fRCdvctiEQovn+vc+0d9hNCSvJzPPiYQO6B/NDAnKssAvgI
rRaheb+2wON4Iv9cfMCXpAzzU+rTOvkseZP3UI2AopeOmxvlJBkwpgk8oYN1LxEu
cldtoHu1/UEKA49WqF7VP92iL4B3j4o2AVKUyUd+VG4jISABeL6BfM2okRUr8WoG
M/9b/geJAmCSuQjzlcGIEttC13r1jQ==
=EONG
-----END PGP SIGNATURE-----

--1TnwAW+Jts0277Wy--
