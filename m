Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C019CD1D;
	Tue,  2 Jun 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407984; cv=none; b=Uq3YzQLRAiX8y7iezlOKNfmNp15fNJ6DtD+xPFcCv058y5e1tAGNx1xRUxCsGvdjr0M49IK+Z6PE6CKk1bC0kIUPwZcu4czN3BKVg/DhBPHhALeiCZMIaxZl+dVYWT+J6fEX90BFg2rWFW+Pzhco5OpuGz/lAWRT0kirz/rLh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407984; c=relaxed/simple;
	bh=TOVG6AcsP5GnbFJ+5Ykl6NoimXddCcYDHSUdHnNXurI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCxkmfrq42bLSLR1hcU9uVtiWnQMCirmJHaI64wc4sAefrWSl3E/9BDpkiBNY1wnLFAa7/iBp5I9Dzj8TRbGTcIndz6uhseSvkCpMMGpKAZKkxMNc/QPHUWTAimkaFFuETpTrkGJxsnGDEUR1cD2fLgTyApcDoUax12MAkqAo6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRr8dPqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRr8dPqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B27C1F00893;
	Tue,  2 Jun 2026 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407983;
	bh=oYycjFfrcBKI3mJxHUF0WfK+/Nvthxu273p1cpvTj5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRr8dPqEN7syCylh8H7ngNC4ygnkz0iTQhEZxQQ5FYaJga+tqUu6qDOzKXVOXlolx
	 Q0XQ/X9pfd4Sh7qC8pLd/CKxlb7WlteXl9lEPzFxzYTX+GjvHKxkBSBsz9anhjchAI
	 L2bnYxy8w5ZkHdkWF/KR3AQR8UM+Elc7UOyOpNURdxbmdpMHoQSC7MGI795DlaC43W
	 oRB/8vZTJnvzi9z7LY7H/hoDDFKIaG4t6a47c/GZ6769WF65eYaokhqR97zCDm2NUt
	 WqzjTXqWCcHgNGzwgSFsbgy9Kzj1oxBRUCM79l/XC0BylmI76Z3WkHRluX0A9bB//A
	 2hsvD+w+j55RA==
Date: Tue, 2 Jun 2026 14:46:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <b9c0e5b3-13fa-4139-815f-5652ff494031@sirena.org.uk>
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
 <0aef9b01-65fa-473e-b999-0c5b285009c5@sirena.org.uk>
 <f47bf7df-f1fc-4d77-9293-938e20600826@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ExHYFhnd+wU22PJI"
Content-Disposition: inline
In-Reply-To: <f47bf7df-f1fc-4d77-9293-938e20600826@opensource.cirrus.com>
X-Cookie: The wages of sin are unreported.


--ExHYFhnd+wU22PJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 02:34:53PM +0100, Richard Fitzgerald wrote:
> On 02/06/2026 2:31 pm, Mark Brown wrote:

> > Do we still have devices registering separate components with the same
> > device for DMA and DAI operations?  They'd end up duplicating the links
> > here.

> Ok, weird, but I agree it's possible for one driver to register multiple
> components. I'll make a V2 that skips the device link if the component
> dev is the same as the card dev.

That wouldn't avoid the issue I think?  The card is a separate device,
but the DMA and DAI are two devices registered separately.  This used to
be because we had completely separate driver types for DMA and DAI,
prior to the component refactoring.  A simple move to component would
keep two separate components, this could be refactored into a single
component but that'd need to actually happen and I'm not sure we did
that for everything.  I was wondering if you'd checked already, sounds
like no?

--ExHYFhnd+wU22PJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe3qsACgkQJNaLcl1U
h9BxRQf/diyzW4SF64FN6XO3wCq0KDznttPATU/y8w99yDFhd/qusTV6RkvBkUIf
Z01xiO73z6JOIR4yf75xIidp2W31we4bQOLu+IhfsvKtTU1KeSQjFQd7pN3Pgz90
m8qKD6/VuOHOIfoGygCiW5QhSUOVf3qCi6C8oF4t60ZG3Rdtn0RTv23/zCOtlE5W
uyeqDk3TeuHHlVHyek8fm/If29opTuCo/3//5PIrIBtA4qANVogpX3jUDbaP4Kg5
sx6ewTr3kQ+fLcB8pSN+MdiSh//5lCr9oOhKulBu9k6c1ZSH94QgXNoc8D1S9jod
OfPYAhGDmqVWMtQgph+pi3f9h50NDw==
=/jpH
-----END PGP SIGNATURE-----

--ExHYFhnd+wU22PJI--
