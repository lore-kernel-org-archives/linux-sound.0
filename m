Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B6470EAD;
	Thu, 23 Jul 2026 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803603; cv=none; b=YHMqpcVkF1Mz0Cztot1ooWosYF0+pzGOy2j+yfb+PwHLHV5E+ndfPgRge9aeQzW4+baXpokIRuSXI6RwrW24tzl/vNOap1RrQDwdO524Wuo0HtXFhj3avhvzopVgZfurW8E4xXn0v1HJf4/kp4zSxqmS8edp5ARrw+oaGtwDC7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803603; c=relaxed/simple;
	bh=MemXIWXqKpq7EuZDuUTzqU1nPbcw4c2dV9qt4FWWFn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFjtN7KH1DAIZxdDH1XfO5xumXRP4cL775/lfLG4YLi0ykGSflJnzkAkZpdL444OBclNv61NBDLF7OotMaRaDECXxr9ootVaSbw8kvgxmwXWUlNeY7loxT3Ewer5dm3EjaTgrtGIjLinhEYEO0IUmqvNnWF/RZUED2bznP48HDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCAMqp3I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCAMqp3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4D01F000E9;
	Thu, 23 Jul 2026 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784803602;
	bh=LMATYmt4YR+CzzlSlSZabwHEq4jQdYtLz872HlFl00M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCAMqp3Icihvo4o3vi4QtPukT0LBRE0ve0MhR4Q0ZWZFXAyIQZZ6PWhwwHQWKUbm0
	 vCAQt35uXA0E0MHC50a/yaoz8K6C7JOMFRJD+89/3c61LKiQ1CqF9nI3I+Wy52hcuf
	 CxCkOZEzqECEvumcG7w91lY9YcSifcs0ZILTImttnP1Q8jz6WdS2GD6mfCs4RD1BLR
	 vnhKGFmb1UrjNc+bP6RlAYgzHpZXqK60xBm+0vb3nlc2aTB2tZXQGi6fxUXl/adYLq
	 6/YQP7tHrpbR6PX3xdcuxdvEUfWNhRsE7ErWIeeqkFKABvb0SgoVY9+Pnedf/xidnT
	 nQjyY3skUuNbA==
Date: Thu, 23 Jul 2026 11:46:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
Message-ID: <8a7bca4d-80da-44cd-b0f7-6dcd9609a779@sirena.org.uk>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
 <20260723045327.28260-19-phucduc.bui@gmail.com>
 <c3f876ad-e222-4cd4-ac29-e55040ccc863@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPSowDBKMhYQhe8P"
Content-Disposition: inline
In-Reply-To: <c3f876ad-e222-4cd4-ac29-e55040ccc863@opensource.cirrus.com>
X-Cookie: (null cookie


--aPSowDBKMhYQhe8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 10:51:52AM +0100, Richard Fitzgerald wrote:
> On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >=20
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--aPSowDBKMhYQhe8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmph8QgACgkQJNaLcl1U
h9Bf4wf7Bm+zdQojTrRb2CrEQzw770XgqbN8TnSB+p6n3niHfa90H/DO14t0S3h+
PtWC51dsQegER/FRKxkvEpgtJgDAmOmIiTHK8BQbtXed5VFGwwzHajyIp2nfskUt
ZLkjYvvEtlRAQZrxPY76+iHsrlqWyHU1O14fNJJscvdn+9d109ztMMbNBcvvT1l6
PwJ+6quO8D1tXENKgGnbCbZwKpdWDP52uYQzkNVZRLPd6+kn3wkBJD6O/bv5XVRq
u1z/aeQ6pUjRgsbAgLd6u3y/8pf1liLb/rSK+cPjpOT6yteuStVcshOcSE09EApV
XuFte6c8frdyLtpOtJ3EoaEY85Uqow==
=w97y
-----END PGP SIGNATURE-----

--aPSowDBKMhYQhe8P--
