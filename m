Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B240B6E1
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121194; cv=none; b=VqKaVCITwzgEKOrRve0QZ3eMsjFWK2vAHFGfHE8iefmFoBWr5McqTMHKUroD4aaISTP04WNy855ouZpcbPtwI1ZU/YTdXNemCRv08wFJa3XjbrzDacskXi9qDr1EDRsC3A3xqIgv0pjcQ5H+A5/buLoePtPATv3N/qykNzbOEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121194; c=relaxed/simple;
	bh=W/Z6S9NMRJErYxYk5RSgI0b7Vfihmc2CqaDgaH6woxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtChPt9sLHCXbHMIdpXixKsxREpPba+WAbHNy8H92ZTvXbBOqjs9vKgKAi8CayJGout1XR8yBz1C9VDy2ZXpcpcXhPvNQ6H3wIw/aeuP3r+hXwgH1JH23XfsKPNntMGpUnJMZDRA3YkW6Ew9lLUjFen3orBDkw2Jd9XWGkRzv8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLCjtvj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLCjtvj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35B2C116C6;
	Thu, 26 Feb 2026 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121193;
	bh=W/Z6S9NMRJErYxYk5RSgI0b7Vfihmc2CqaDgaH6woxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLCjtvj6NoOkMFHgbb1ZYngYmXkLOFZLDd9aZfgVVB6DSMaBuXlrMSntHdjMfFFzc
	 xvTIXB7fLKg8IrnnWq+W3f0OMhEC4344GI7JTXFVVaHyZcQFkVswomTpBfQHslbK++
	 59/FzUVgLdCOB9t3bsiXyVzelzS40UDgeyCg4xh1StPQYR0LHvY2y6G7WxcdUed+mh
	 dzl4ALjyQyu0M6NRDogaT3m/I5C7QIM0+rXVOOFIQaweEn7KNFox4TO1UKyFh0yPLH
	 0mNC2XxqJYfiI+dGkWVhSguaUyBh9y1m3FpOQPT+mM8tfNM9hv1EGvmSip97HezeQj
	 FfGZjMw1Kc78w==
Date: Thu, 26 Feb 2026 15:53:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: SDCA: Fix comments for sdca_irq_request()
Message-ID: <c41f115e-b8ba-417d-86b6-0548fd86caaf@sirena.org.uk>
References: <20260226154753.1083320-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CLZAxhRVAOv8eoyt"
Content-Disposition: inline
In-Reply-To: <20260226154753.1083320-1-tiwai@suse.de>
X-Cookie: Honk if you love peace and quiet.


--CLZAxhRVAOv8eoyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:47:52PM +0100, Takashi Iwai wrote:
> The kernel-doc comments for sdca_irq_request() contained some typos
> that lead to build warnings with W=3D1.  Let's correct them.
>=20
> Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")

Probably easiest if you apply this directly for sending a PR to Linus:

Acked-by: Mark Brown <broonie@kernel.org>

--CLZAxhRVAOv8eoyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgbGUACgkQJNaLcl1U
h9CEfAf6A8VBlXmOSnAGFc+RypxusSp+/nwRka5d2SmvyGXSfLcwBLYBOhHotWC6
FPVuzvOYaD81f34fIyjCUL0hGEcPQHirjWd/ijNFq5SHARnWkG4R5LXa8td2PNCU
mMJx9Z10aBAPxb+6yIAlAmNBqXQSB1kTE/pnKfUaiff4DQcyaz8AR8s6VH1Mnpkq
o0ddLCRnO8mNo8L8p08FMmZZsBvWNjrlBmgnzAK3cjomMM9j1hkM0EF0coG08eHY
KBFsUnud19h8NStGT9riHdwP7sWBbGPpYyGU47WW0YMwBnHRl9ACWnqVyLg7Z4j9
gOzDex/a/2tndZBuZRqKCSorIYL27A==
=t10z
-----END PGP SIGNATURE-----

--CLZAxhRVAOv8eoyt--
