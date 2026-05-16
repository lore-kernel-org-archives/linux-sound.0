Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2F405C41;
	Sat, 16 May 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900454; cv=none; b=BGgiWvGtSeL7EsZh25ECZD0Wqngg5p+LA3+nB8gw2b9RxTM6Y3U+pcPzl7aWoJJoOAPiP3zAUCWj+FgnSi01S6j+zIjXglPMGVbAxBEQLHkQHW/I8n/q+LhUg2d+UYA0qEyJ6Akvq1xkdr1gJdHM/VvdT+gguCvGe9HPHcaa7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900454; c=relaxed/simple;
	bh=HFLpP0j57Gst4fAbdNsreMBu/SwQoUZ1kgnq8j+IcOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He1N0XKfiu5iKxyh2912Y8APVru/T/bED05pJ/M3RmFWMXvmbL2d+aQy/vI4iPQ5PJ0p/kJRejvPTqE8awNbJACzEFBHulHMR0CCP8wwlmoHJJoJLB9wlng+vm293EmEghoN8aBOyIGodv33qhghYWHtaM6MB4Z1Hms/MJ6tS1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdDsscDN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdDsscDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A96C2BCB7;
	Sat, 16 May 2026 03:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778900454;
	bh=HFLpP0j57Gst4fAbdNsreMBu/SwQoUZ1kgnq8j+IcOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdDsscDNmeL62JgZyX0rtWcMD1xBb532z/HpVKZ3REYKXl0dI7OmYkmV+8w80da/L
	 nPxcPUHwo66Tz0PZA/aT+42eq+c9w4cWxf0QGrXWVIp2FEPEImCZzaZe9RPNaaCUUe
	 PUq2sE9bemEPg0sYSMexZ9LrSUgSWOqI9aeGvHy4xhedERQ9NGh8mEhoQPgIajVcGh
	 9doQzUTQmaV7EPD2+wksEaD8CGmBeJ/OIKLYG++RhjfryFDv2nhLdiFQwmqJmMlHu6
	 NxTAMq9e/sszeYTHyoQMucCOBu0qlAnf/lICxYtypNj8DaMg60dftIZ4buaYiI2wfJ
	 Ti8BBQNTYEW6g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B913E1AC5A48; Sat, 16 May 2026 04:00:50 +0100 (BST)
Date: Sat, 16 May 2026 12:00:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Message-ID: <agfd4gvQ_m3Zt8GP@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
 <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wb7h2GZXqtWpMj3T"
Content-Disposition: inline
In-Reply-To: <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
X-Cookie: Truckers welcome.


--Wb7h2GZXqtWpMj3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2026 at 11:48:55AM +0700, Bui Duc Phuc wrote:

> From a maintainer perspective, is there generally interest in gradually
> converging these drivers toward more modern/common PM patterns,
> or is preserving existing hardware-specific sequencing usually preferred
> unless there is a concrete issue to solve?

There are likely to be different considerations for different drivers,
on some systems the power savings from managing the clocks may not be
meaingful or we may need the clocks for register access.  In general
it's nicer to actively manage the clocks but it's not super urgent to do
so from a framework point of view, it's more a how much work the people
working on the individual drivers want to do and if there's a use case
for specific hardware.

--Wb7h2GZXqtWpMj3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoH3eEACgkQJNaLcl1U
h9CWHAf/dTTHqWbJspq/0Qx6ffNRKEylxcdLqo4FSGl/tNx3HRkaSdyCNp1MGOW/
JBoLRDGCg6Zzt9LCEnQVLDIui/dyYHlgeHyPUsRNMoW0CIGvkiv8LAYfBb3fqenB
wDzwLZIlYwjuO/GmD4upv0XA+rT/YdNHmL2ENMmKDD9e4k8aI4V6kOHhc2ZXpV3f
VomzNihV82+hNOs9885tQOnf3haJwwAPG9yuUqJA9M4a3jdm7WEk6tc8+N7rtltR
4Satj7kr/K6bUtWJDRZ+Z5Nbpr9meCN5PSD+qZt3hWhiVAaQK4w9hKKhS+1oxWAR
/c6vmVHrbIq7x8SebQcdDs/oHp4ijA==
=76w0
-----END PGP SIGNATURE-----

--Wb7h2GZXqtWpMj3T--
