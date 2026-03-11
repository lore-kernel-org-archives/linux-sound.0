Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B23359A93;
	Wed, 11 Mar 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244215; cv=none; b=JY+/Qiqk0l5/7aFQsWAGoI6Fk5ILND6XFB1xCz5BkmQ1LGIB4WXtM2c4d6Fw7Zikcax4E2wzvvQZpss1VAq0wAvD7EKzVFsjtfCj1tomNyOGcVEn/RmO8IfNiUGfhnwg1jKHz4LyCx4tiFLCE9CxvB3qfseGWn4qOTRHrFzse9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244215; c=relaxed/simple;
	bh=612yYCEsPnhVVPz3xXzVA4Bt8EmYscwvrg7lEvseYa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6MSyV8yobdsuKolEZhgsFcdWUxEOU0ye6mUznraoYfLMQOU++5u8ohBAWcOc3poxP0REwDVIQNrNvfPFrRbvy2ghYlBcYTH0qDSFrID+DVuVBcW68jBAkIIFYFfXN35FDHoKiFnnNm1+RI5Uatw+9yNgw/z0HaKwwcDCVTmmXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lnl2p1/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lnl2p1/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C78DC19425;
	Wed, 11 Mar 2026 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773244214;
	bh=612yYCEsPnhVVPz3xXzVA4Bt8EmYscwvrg7lEvseYa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lnl2p1/hxZWMs1kmO477ED5yA1uVD0JbdXTiBfJMZlpzFMeRcZQrhkJWEN8MP9hMu
	 er9EZZZTGNRkmw5AarBYct2J+4lRiXul8MGWsnoKkPvo9k1dtNbhIb6bTtK1pUzTBi
	 mQU8zxSxgsXfKGqmGc+rR2PYk2hX2xlVFArO9+QnFxzpWSTUYF3sL/IQpR1ybsbOwR
	 kyR8QgA94ZfSjduGWqGViJ5yuzr3K9UKx/khvgjwz3/lG1PLA+8SLhdCYnjLeQ7CY2
	 ldF/YvjkucoX+sLkvY2bGM1ZnkS03dsVIgpncit2q5paDEhjYy8JmFNCwG68/rTItI
	 ojtb3HHsyQhyQ==
Date: Wed, 11 Mar 2026 15:50:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
Message-ID: <5e12ba28-de41-466c-ae58-aaa32c72955b@sirena.org.uk>
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
 <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
 <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
 <4976ec0c-f4d9-456e-81a9-55fcafa30b9d@sirena.org.uk>
 <7afba327-89b6-49c0-ba56-83da00e0d51e@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u0DVgAUvMVcBtlqZ"
Content-Disposition: inline
In-Reply-To: <7afba327-89b6-49c0-ba56-83da00e0d51e@opensource.cirrus.com>
X-Cookie: When all else fails, EAT!!!


--u0DVgAUvMVcBtlqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 03:34:54PM +0000, Richard Fitzgerald wrote:
> On 11/03/2026 3:30 pm, Mark Brown wrote:

> > Hrm, OK - the property seems to be confusingly named and defined :(  Can
> > it have any values other than 0 and 1?

> It's part of the SoundWire spec. We have to follow it.

> The current spec says:

> mipi-sdw-clock-stop-mode1-supported
> This optional Boolean Property shall indicate whether or not Clock-stop
> is supported on this Device.
> Integer (Boolean)
> Values:
> False (zero): Clock-stop mode1 is not supported on this Device.
> True (nonzero): Clock-stop mode1 is supported on this Device.

Oh dear, cute enterprise nonsense hacks :(

--u0DVgAUvMVcBtlqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxjzEACgkQJNaLcl1U
h9CCXgf/XRs5b3TCJ9JdaF+8vJ/jCvaoEqcZb3jCDFDWLopRbEjztjiYOP3KDd6X
j7nK4btmBpCzfuGUPtduJazA4qLte4akznabqOHDriqie+Sh2+MLlPBo+9yTu7+P
c+Rm3XfJBN5YE0f5oIAgLWaA+52I2+iPISmLAbwZ14+RiWW3HBso+B4p0AE8yxuL
go3MugB4S7hAQcNzWxeb7tnp5qpSbmNqmekPKVIap+wyefxLjIvgLPYaPIoh2zys
9ohulKQWScBDFe56qd3n4GSHIbUEgVV8IJXVEJwkLaieUVzhyQ+5KSohFxiuYjfu
hEbk7KSHYvyf0bZq5IhFhiPfDFgdTQ==
=ezjw
-----END PGP SIGNATURE-----

--u0DVgAUvMVcBtlqZ--
