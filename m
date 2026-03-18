Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81583A7F74;
	Wed, 18 Mar 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832513; cv=none; b=k3RVCUQ7YNfW6ez5O4ElfzDjfezpwy8dObEofMnuL/H24WuXxiX8b5xL2ZiCRyUPauKcTc0g/HY8voQElHSLnMWkx02AsyRfaBN+s244X8NlmPgpLQI2vLCa0aTddM+nwI4AN8N3tBo8QlEm7wX3BUtSE+J67WyIxWg7NLN0W0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832513; c=relaxed/simple;
	bh=8MzFfdFt3gazrcv3zOVP0LpxfuoONuLBZta5tbzPIfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tm2nErfJKS8RS9ckKPy5fOaTUJjELI4ep+RiygEiOj0gPD82SUqQ/Uj4n9dqXssdbcB9RMqmZNf+GYl7MUFq7P1OoEyD50a27Op68SjCJ7cp/xQpVVFIU1WcO7UkGcMbNMp2giiuf8X+bSTXRLOr7PnIc/VyJ47hDYqappvfpbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BntR3h/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BntR3h/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39950C2BC87;
	Wed, 18 Mar 2026 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773832513;
	bh=8MzFfdFt3gazrcv3zOVP0LpxfuoONuLBZta5tbzPIfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BntR3h/0dHq94tGCGwlPKIdu3k1vWHylCsYcGeSQ+FreSyhvzxP1bDZqSNjiChcSM
	 Cd00O1WMIzQUg1WBBZnMxLW3yl4BFfIe2A0PAUdo3phjglNUOiipWVshuOypptvAYC
	 tZnYrQz/ivREOUrs/wtdw9hgjHcRExRUFEjz8p4JS69ay+fhv4rpNJtCz7jBkXsIV4
	 isAoxmyF9TLHlmEM2UV+m+7FGCx7j0EV0/0mQu6tNbMms8LZSVtcexiiD/3FtGddTc
	 59tzYRVvRNtlzzVk7lzCVOAuXNgs1pvbm7e7Vq0MuFWInzValKTzs0hCZa3Pewu4tH
	 hc13A+5UrgEww==
Date: Wed, 18 Mar 2026 11:15:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <afc08c6e-8852-45a5-a078-a28265a1ebf5@sirena.org.uk>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
 <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
 <abl4wZyYTJf1C4ml@opensource.cirrus.com>
 <abmTp0NcfyCjfdpv@opensource.cirrus.com>
 <b6c7d439-7c46-4c99-9213-30369f1dd443@sirena.org.uk>
 <abpw/f/3OPnjFW36@opensource.cirrus.com>
 <abp+A18W3n720HQy@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eSD2fd+7sR8A/47b"
Content-Disposition: inline
In-Reply-To: <abp+A18W3n720HQy@opensource.cirrus.com>
X-Cookie: All celebrity voices impersonated.


--eSD2fd+7sR8A/47b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 10:27:15AM +0000, Charles Keepax wrote:
> On Wed, Mar 18, 2026 at 09:31:41AM +0000, Charles Keepax wrote:

> > Ok I will have a bit more of a gander today and chat to the boss
> > here, but I suspect you are right we may have to revert the
> > change. I will report back by end of today if not sooner.

> Ok looking again with fresh eyes I think I have it. Turns out
> most of my problems yesterday were just finding the right
> incantations to get kunit to show me all the debug.

> Patch incoming shortly.

Awesome, thanks so much!

--eSD2fd+7sR8A/47b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6iTwACgkQJNaLcl1U
h9Dc/Qf+Ou86mIFHuMwfzOfrKeyIOT3yAIRHR7mty11PqJShZHneYJBZVvya3GY/
op99mMs7GcTHcIIRp6NtTXxqqmOB/Szp5hQo+THYZRig+5yf+C2q3XdJ6QMmTYCm
m+ng9oSF8NfWoMDgJ/sEHj9QaEHAWk0FqKAWsEC7IgsCNKI0egwyhoWCjgajFRZa
jJmh1U5umu6L+iV4VzovfMyZZ4YO1o/8xDRZEUj9Reys0LffinRxpXpl8DcK3ktj
KTjOAOcsPsOxnDmyNUvRmcomK+fnM733rgXzY082ZXt1cL7037ogHgVaT8AfK6Lv
eFNkZnkY3gIWGx/nvWdhvzDOm+PY9w==
=YF3K
-----END PGP SIGNATURE-----

--eSD2fd+7sR8A/47b--
