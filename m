Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED905D91E
	for <linux-sound@vger.kernel.org>; Thu, 14 Dec 2023 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUlL/8ZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0A9C433C9;
	Thu, 14 Dec 2023 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702569417;
	bh=Irc7j9mhIhkTjruf9MUgxUtXcKks1NoDo+o05Js0JRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUlL/8ZQUpL92Yu4EDmQpLzUoufYW86sQ3eOU73LLU8e28ku06Q4eF+k9hlUGo/KI
	 GqrdLjWcVF10n3U1YeYk5OWaGYhLZbmu7dyjYcVByBqqORc1mGbqDwcUI4jFNQ/aCC
	 /+gcVYj9QYgUtUlXwcw2UoGsZ/EYNnHjHMJ/JB+ULpbO+C+leNpMRupyotFSP/RtnG
	 Ie3PP2656wTWQ8QMdd67GW0Hsr/o1tuMLIyFeeRQ+fN0sTBVOH0FDFwKd0URD/orrX
	 upTcn8XOKpxSU52fqQvJeUEJvWVt/r7ONfRf/hKfUDVew4KZj+7EBIxTbFUtUDTF8n
	 ayblJLEV8ja9g==
Date: Thu, 14 Dec 2023 15:56:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: Add qcom_snd_tdm_hw_params
 function
Message-ID: <bee0ab28-6bd3-4904-8afc-44fe7ddacb79@sirena.org.uk>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
 <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
 <ZXsklsO7nOqBFgzt@Gentoo>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3QwHa6JjLmRb9NBb"
Content-Disposition: inline
In-Reply-To: <ZXsklsO7nOqBFgzt@Gentoo>
X-Cookie: Preserve the old, but know the new.


--3QwHa6JjLmRb9NBb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 14, 2023 at 11:51:50PM +0800, Jianhua Lu wrote:
> On Thu, Dec 14, 2023 at 11:11:06AM +0000, Mark Brown wrote:

> > The expectation is that TDM is set up by the machine driver, not from
> > hw_params - if the TDM setup can be changed from within hw_params then
> > it's hard to see how it's going to interact well with other TDM users on
> > the bus.  More usually hw_params() would be influenced by the setup done
> > in set_tdm_slot().

> Currently, qcom TDM setup need to read hw_params, if we want to move it
> to machine driver, we must hardcode some params, but it will reduce reduce
> readability.

What makes you say that TDM setup needs to read hw_params?

--3QwHa6JjLmRb9NBb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV7JcMACgkQJNaLcl1U
h9CY+gf3YsZTfcu/vz6WuiAEAFNcmWZVpApi5hN7KrHcB7qQWGfbWcivQWhFfiFc
2HsD9BS9nkFG8HWmHz2DKgZltPNOIIVLnaHLBS6IaFqXCqDkWdDDpVmYTBCcIsSV
Ls8IlGaVn9ddGf//+9sCcG1yIVnEj2NXqCHSM6EcDwNRy+kvGz9UG8pKYd2clgMv
eVraA+qIr2R0jePWFgGuYGwrmy2O6/u0LHkjCnbUABHA2g8hGRvbv/Rv6IW1zKbb
D013IGVbR1TkUWGlVU5b6AOS6DLlHMwIYwqaa5Gw1EQ/Q0S2J5N5105UGICxqVBA
p1yWhSlzFo3Tjs7PQxsTZV3DHmFx
=WcEt
-----END PGP SIGNATURE-----

--3QwHa6JjLmRb9NBb--
