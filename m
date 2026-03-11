Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717D3E1CFE;
	Wed, 11 Mar 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246806; cv=none; b=BZk0zNshZ50nEmxNUetuxdnawNah8PBBp98wrRDGN8HaIzVmzLuviGglbjGl2Uk8hXD+EjTSHNU0iN2crHxR5/wlRIZglACk0ngOx91XWbAHcNk2DfAocB71Kz0kLcuXgVeKIKpVPfh67HfslZ7ZtmoOpL/i+XKSduLJ0uufQxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246806; c=relaxed/simple;
	bh=fmoVpl/5oiQzyRzx/lNS8AD1yGt7UH7rWVKYXPBzyjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTtCEU7sgfJyQwfA2Rq+T/67fPzoPjBrY4HFGegQ/GxNtRQoYeLOVQzIZJHSn3gCUhS8xf0e5IdzR4enPJ6JhHKJjA+PNE34Iz3+s0juanwYS0emKKuC1fzEkH6kHuHmY5bwzaEArZeJYMqSyejxY3yfE9xuMLOD5rD9XfRAkKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWpqQwH+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWpqQwH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579B3C4CEF7;
	Wed, 11 Mar 2026 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773246806;
	bh=fmoVpl/5oiQzyRzx/lNS8AD1yGt7UH7rWVKYXPBzyjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWpqQwH+9oDRbloNWGXIjb1J3UIbwthxO4xnVJJWzVSeeQXQ3VgPyrmjs2QjQD/rh
	 qqXM2BFI6TktU2U3/T8mnh8eNl6+ZQ7p6LBR/xYR3I9lHHJg8AzQUsXaWw86A/NITB
	 JYxCu46ckAS60rgNueNS+Om6mszbAxYBlR80VPxIwjYPskFpeUC3WpbtE3mUr9Nijd
	 m7EuKb9z6M6gNB9aEmInt+zEGNQeP68/jWE2RhKP76a/X0VIRpFLknyJWIVfyqRnrh
	 qwJo552pLUqpO5IUCVeZLnjn1CjXbeGXea5G5IKm8vd1sgZ9v/B9VZBGVVu3kambgU
	 fjcKMyXH5vdfQ==
Date: Wed, 11 Mar 2026 16:33:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH 2/2] ASoC: codecs: aw88166: Support device specific
 firmware
Message-ID: <1c068ae5-66aa-4892-879b-875c9209dee9@sirena.org.uk>
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
 <20260310-aw88166-fw-v1-2-2777563bb673@gmail.com>
 <20260311-glittering-elastic-deer-a2fa58@quoll>
 <CALHNRZ-KxT0B1zpPD1N7ba6185cqh6q-z-WMxbpU68FRuGJXEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b17h1DY4OzEsDU2o"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-KxT0B1zpPD1N7ba6185cqh6q-z-WMxbpU68FRuGJXEA@mail.gmail.com>
X-Cookie: When all else fails, EAT!!!


--b17h1DY4OzEsDU2o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:30:34AM -0500, Aaron Kling wrote:
> On Wed, Mar 11, 2026 at 8:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:

> > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > Co-authored-by: Aaron Kling <webgeek1234@gmail.com>

> > There is no such tag.

> What do you mean? This tag is used all [0] over [1] the kernel [2].
> How else is one supposed to indicate that that notable changes have
> been made since the original author touched it?

Co-developed-by is more standard and is what's in submitting-patches.rst.

--b17h1DY4OzEsDU2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxmU8ACgkQJNaLcl1U
h9DjnQf+IDc6MK7e9uZjgaMsAW31PEBB5QeBf6c0iwqSu0c3Z/BHWFyo9ZeA05Fg
Tw4s3jsAmjftjJLjPFa30To/ZKwhONWLrq2aDM2E4gGarWOsvxq7oEoc8AOiesEc
aD124UINhFGPGaotPbNMA7h1TiaeEOsgC+lTrI6bV/aQttBrvtcIWWszyISIYhAq
nxaWmD7F6AZkinVDs+JI5HrXgWOvOAQM5rLjJUkPAND4vmPOePeu9xLXNFp6RAGG
Roym+x8W3ESqMX1/8UzqToEbPfNUN0gaq3ataV+kT5HPaVN4caReJXxlzNizJyT/
u8E473+Yfdys421VAGvScO6NvxIXvA==
=MKZ/
-----END PGP SIGNATURE-----

--b17h1DY4OzEsDU2o--
