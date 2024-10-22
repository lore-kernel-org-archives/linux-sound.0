Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4719F424
	for <linux-sound@vger.kernel.org>; Tue, 22 Oct 2024 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606671; cv=none; b=AK5zy3gDtPxmS8NMIC+Ml7BbRIJgYTtzPdbtUwRRCwIbgLnNeOffYK4jIKz2K6KMLCL90RjZAMJz3jMgfb1zeT6KOgxbX0cSU/D3mgdJ80vNeh7fXvUG5acLRcQI1xfJZPeAkVvguv9/ZE3JaIJ3x30nKgOKl7oO6J9yv0onfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606671; c=relaxed/simple;
	bh=hW2k9Zeh/su+fjj9SqIn+0lEM2RZ2741y8pD7uXKluo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4q1VMzLM0lrOSvbVRG2UcDG/Sen0rrLEqf6r1FDXMRdkw91VIDMsGWbTQ/0xsNPkrx6GIH4GdQaHHq1/SfWWEMgG2PdXccNt6G+nRJ7but72cOpRYcZhOTGKq7HyoVwfAMaA0G11BQQNNvPm0WxerTwxY/Dp4nCbDy27Gk70vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjDZMWQK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjDZMWQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373BC4CEC3;
	Tue, 22 Oct 2024 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729606670;
	bh=hW2k9Zeh/su+fjj9SqIn+0lEM2RZ2741y8pD7uXKluo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjDZMWQK5Iuaq2G/DVS/KjMCLTHv7k4KMs9gNHleSaWng++h9kWm6v/86hJCBXaP+
	 5OOBeZZeB4r3ZEz7gxJdj5FJDi8LGS2G5xlUSfF3pklOPA8YnuqSVoff5B3kFmjMph
	 996GfW3CMez3ZX1gj84rKF7++MniHAhmoKyNo/cdDuzvha6ozS7PSDJHfLaMvdsdd/
	 TDuBI0Wn9HDky0ujr4j1Ad17P0MyaY2/h+QV80FrHhFKeT49+ErR4oMPHB3CXPM+07
	 YVu/eaGYXg+HdwrQchpWGQMZa+JhrgAkjBrpclwoGpPJYfTebhzHpOS11r0qmo1UHb
	 +bkLJ0rKiMjng==
Date: Tue, 22 Oct 2024 15:17:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Linux Sound ML <linux-sound@vger.kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
Message-ID: <9d2e6d81-7e13-4e88-b528-f2648a494377@sirena.org.uk>
References: <20241002093904.1809799-1-perex@perex.cz>
 <87seso2pgm.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WTdhzezix+KnyZDH"
Content-Disposition: inline
In-Reply-To: <87seso2pgm.wl-tiwai@suse.de>
X-Cookie: Surprise due today.  Also the rent.


--WTdhzezix+KnyZDH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2024 at 04:15:53PM +0200, Takashi Iwai wrote:

> Are there any objections to this extension?
> Otherwise I'd like to pick up for 6.13.

Looks good to me.

--WTdhzezix+KnyZDH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcXtAkACgkQJNaLcl1U
h9Bc3gf9GpC9S4z9nrehYnLodJb4pkEFqOh2zTlaWoN44Xa4kcmuPhGzEXnYHKa0
NWmkIb/KqxwC0kR7qxwtPegsPok5VBM10JHL3JAB1XydfiwfIVpzuJkZIKYGF7FE
HU2xJKi3mm5wjV7CQiSWhpcIu61pPJ/d4lWlWt/r4iH+rlQP8cAY6pWc1PxdQnSJ
HhPl228ByCETJ4+qCby/abysGPv8OqNE/PYJA7CT3P2yoRJ4amA9AhZ55xqtP2dE
FjesXb33PZovA8nCj4DeBaUF7d7A2eq2/a3XNMei7CRYuuXnZs6Fd41+q7dmatgV
dQtwt7oOskRQJZ0DymK+QhVDN7pyAg==
=jBy3
-----END PGP SIGNATURE-----

--WTdhzezix+KnyZDH--
