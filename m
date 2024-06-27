Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197B14B083;
	Thu, 27 Jun 2024 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719488714; cv=none; b=g488MjOOw6Deh7ySrhdDLeIfMn+J3g5aISBRhlCGAlE5n6GDzLVJCvX2d1AEMre76KosidG4V9snlcKnR4i3kvegt8i7zkkSfSb/eYh7O3kf6YTmfGdOdYO7nV7heH3A8qPKnS6JEBdqKsuKiJcDZJAJQN/vkiKplZUh9fF6NNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719488714; c=relaxed/simple;
	bh=VDvyQJrFafoefCcI3xmMSH7VK3qS/ShkSjr5pCXHH7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obT56lmuJu9wkNeDuRAswKtzKHdogOWPhFBDpQ5Yyv50gE4jFccVXNNJhEILPYaSgKALlOTipDFPVSHf3c0cxMbZFAo6zxChF7rcY6AmbGe0rnPZxmTK49v38ikbga9uYreDM8TuCEFVNWtPsYZwWyY7gbjSKTrQLeBdoDkR0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfI2lMAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfI2lMAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BE8C2BBFC;
	Thu, 27 Jun 2024 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719488714;
	bh=VDvyQJrFafoefCcI3xmMSH7VK3qS/ShkSjr5pCXHH7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfI2lMArkfOQ6Z23sscO8OW/zBTyyqKadyRFkq7enmcEbCVY/gMxhrC/9xJleVcOj
	 GJJoLFRHLFNdrR9pesx6gIW20MBElULs2/G/MZhQ86HFUFP55CMqgPMKetOjfUmds6
	 c4usiJpaB38058hyg1F5YKmguFpJtTcWxnM6eOsRQ5lYIFwqEGeFmc1uhMg2L5r2ii
	 ma3iszQO3AHtP3jBxcysiwKhtFwbW5rfSBXQ05y6vGwFLam2WMKwvW3hrRO2t2yJNx
	 YwyaCz9bF9+waQxHc1wxn5Ivp3GYKMijwNVcYsmtDRixqxWACmmHrbhUQDf5LDIsVH
	 BEI3hu7ELfYDw==
Date: Thu, 27 Jun 2024 12:45:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names
 property
Message-ID: <169aa3ed-8427-4832-b5e8-302a1ce0558e@sirena.org.uk>
References: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
 <878qyrqbyt.wl-kuninori.morimoto.gx@renesas.com>
 <c7bad597-84cc-445f-8446-398cb5e5005e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t8YVTPMu+WTibRgQ"
Content-Disposition: inline
In-Reply-To: <c7bad597-84cc-445f-8446-398cb5e5005e@kernel.org>
X-Cookie: I just had a NOSE JOB!!


--t8YVTPMu+WTibRgQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 09:46:29AM +0200, Krzysztof Kozlowski wrote:
> On 27/06/2024 05:52, Kuninori Morimoto wrote:

> > Current simple-audio-mux selects MUX by "Input 1" or "Input 2",
> > it is not user friendly. Adds new "mux-names" property and enable to
> > select MUX by own names.

> > +  mux-names:
> > +    description: |
> > +      Name of multiplexers. default is "Input 1", "Input 2"

> I have troubles with this binding... It seems driver expects only one
> GPIO, but the binding allows any number. Similarly mux-names...

> Anyway, this does not look like hardware description but rather
> configuration of driver. What's wrong with input 1 or mux 1 or whatever
> is there for default?

I would expect that when this driver is deployed it would mainly be for
selecting between things like microphone inputs that are defined and
labelled as part of the system hardware design.  Using numbered inputs
would *work* but it's not great for usability so I do see a use case for
labels.  Possibly we could figure something out by walking the graph but
that seems quite hard, possibly unreasonably so.

--t8YVTPMu+WTibRgQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9UMIACgkQJNaLcl1U
h9C9ewf/SmgphPxh0Y9/eKw8s/0PtjG3yAAo1GcLrKXP9DDLLZsyuT9nJJ7H7zPk
ajOLB0JHKMVuE6J3Sr0lF08RBmgotNIE4mJbmLDAtn3/QraFJJgrMrivhBwY1LdG
Qdw1wWUWIu4VofsYhexo/7YqvTCVcNll7uTGYLxdyICUdF9KN8tUxLCOapB8FC2R
hBBQcTNaHIIrj6rSpIDRx4e3gXRHixIqsjlXwcZ6QLasfesozaetTN6L+4arUPj/
mtepJZQsXz6yej+PEUtWKE9e3OVEK1AV7TlSP2U318tkMEwOhJ3gG37++wKs/eyp
JudB6Y8LS158+jlJi0+/K4Vvr3euaQ==
=dRQc
-----END PGP SIGNATURE-----

--t8YVTPMu+WTibRgQ--
