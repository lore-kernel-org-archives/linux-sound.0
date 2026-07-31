Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767323C503
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 00:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456954; cv=none; b=Y6QjlyWIc0a1X4FHtur7VhGrkCh9Nd5uXoKCtNaCQn2x2+/tWGz0rmlnj8rr/MZKdw7TR53fHauXt05sf9bde0wF/2fccbaJTmogFa+gua5oaG8nKbenwE2Rib5wbOj3Qa1XBY8Giua6rBIV3Gj+u5P+ekmA2HY0m5z+fPVCXV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456954; c=relaxed/simple;
	bh=nkU2uu1kQOf+mx3mck+sQpYvqcCXHzoUzoYw2qd5PZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjZWmBxobim1E016w23WdZHyAHP7VeMufU2XdeTuCaJuaCd6pTwMUJTsE8C/m6tdGOZ000biyb5YmsFWzHBYoOHTlz+TH0kLDrPICU60uoEHPwcGfOFAxSxbs1SJvfx0edy5VxPGfUVcvhy/NtRE0BGodrPpYgKlz7/z0CewnT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7zweHnq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7zweHnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6559E1F000E9;
	Fri, 31 Jul 2026 00:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785456952;
	bh=nkU2uu1kQOf+mx3mck+sQpYvqcCXHzoUzoYw2qd5PZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g7zweHnqmIkzoXXpvp8AGH2qHSZLUbdPqtGhZO8PyucljgwweN5wFwMJ3rmohYu6b
	 5n1L/DYPNFzJFugRxjZ8NOZOTA+E6Nya4GGNZb+DvgVPNiwr0YVYrbjxN7cUnLMjdR
	 fLIl43ZyNISbJcbNfVrDHSVoNgt/TZS2WkWBTxH2NGYevnXAAQ0067BtXBwAQIwv62
	 yGglkxftvGsYh4w+PaUM8qHLKkg8trZ4ffm2W7apDo8ToX61F3aVfwNZWTQ1dZAaB2
	 osTTxcty+UuIoFybqBClNjh0gi2aPhZv2lDpPzRHXQvnVgaRsbLm00y5ZgjK8VE8+p
	 YoZihJWtjp6Ig==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A85751AC5AC8; Fri, 31 Jul 2026 01:15:49 +0100 (BST)
Date: Fri, 31 Jul 2026 01:15:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: ux500: preparation for Card capsuling
Message-ID: <amvpNdeKFOKHJr01@sirena.co.uk>
References: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
 <178536744793.512962.1637654903512081263.b4-ty@b4>
 <87mrv8rq4p.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yPorg2yWaRYIQ2WD"
Content-Disposition: inline
In-Reply-To: <87mrv8rq4p.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Swap read error.  You lose your mind.


--yPorg2yWaRYIQ2WD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 11:53:27PM +0000, Kuninori Morimoto wrote:

> > Applied to
> (snip)
> > [1/2] ASoC: ux500: mop500: tidyup mop500_of_probe() parameter
> > [2/2] ASoC: ux500: mop500_ab8500: tidyup mop500_ab8500_remove()

> Hmm... I can't find them on asoc/for-7.3

There was a (now fixed) bug in b4 which caused it to send thanks mails
before things were fully published, it should be pushed out tomorrow
when it's through CI.

--yPorg2yWaRYIQ2WD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpr6TIACgkQJNaLcl1U
h9B3Cgf7Bc2D1IRU3jhTxkudClQejFFC30vflnbjXH3wtgDsuHrzCZBUHU3qATU8
IZevOf08GoVOneC/vzizMppI3ww4TSUgFGdz23YaESEc85C1D6dBUQyhZNfxPcCx
plP72mCbOIzSXo5hyvYQuw15kyVOZII7zHhfD5fw5ptHUEAVG/Tv3V1fdHgdKp36
tFZ3KY505xYTe5iv1PqHrrWrjY0MOspsyfWivNc6xZcoKWK6fe9EWFpfTiRe/wdJ
W+vSOOi/5y5Iaa5O1HqHNfmANjBgsW2q6mcakVn5Dt5Y6cRffm2wkbKi2R4j7Sk8
8UFAAJi8u2GYEBW2FxdFxuAxdKBMzw==
=i5IX
-----END PGP SIGNATURE-----

--yPorg2yWaRYIQ2WD--
