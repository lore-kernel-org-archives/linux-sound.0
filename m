Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9B36F917
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026054; cv=none; b=bVqk7IluvwhB106kZrEe/qtksfqsI6AxNG35Ko1j2ig/rq84LbTlbova50r/6MPIf/BVIkM/OkXg6ko1sT33eX6bRwSbSqocUmsPeo5PIJE0I3xVph3cTBeUBAgbSB3HHS9tjUvizqAgixwb0ZtLHX+cbHGWgHjiirfgWxdbstA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026054; c=relaxed/simple;
	bh=NdJK6lU/WxJrj3+Bvaq+my1n3/N+X7rHkr6PzzAp97g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibZjitfEV2+1qlP4/MyCP4Bf4yTtimMlSSx7MNvc3wxEfYJ2VyVGuXdKQNP88IYHwNp40AI6YNqmEDVw34RE/8Vp7TSuCP8dOhi0nanQ2ISaRyiGSVssRgA/1rH7hQP3NfkyYHCvDYPPdA8CbMd4l0nrHG8L35u+4OULK7ZAHwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG65QSWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG65QSWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB0A1F00A3E;
	Tue, 14 Jul 2026 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026052;
	bh=NdJK6lU/WxJrj3+Bvaq+my1n3/N+X7rHkr6PzzAp97g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RG65QSWXvUKUiU5XRyyUIck4Hf9Cbxljj7zD+jBVH+fNldU9A9XOK28+nHf2hZzOY
	 f8xziTa+w/6FA8TtZ8ap5HD7yQT7V815E+7YHfkOyi/t0lLcEfKjourcbJVSIaZhOx
	 ilF2ynFuRz0NnRkeEuWZse3WJ2j5YUcF1/+P/ji4y59lrgPwUXE03rMJS7zoP/nDIq
	 ZqdyLEDm2CKtaKvxl9PF6Baeh/O+EvvHCYbuhNKwcY2dcbh8qzWBBNC98eCC50X24m
	 eB9Vj3IHVzcqAfa90JOhmnHvV1yAd4+ZEIzctsqxAJhe0RAEfKsLRQCLdLLtS6okUs
	 HQ56Bm5Js8JcQ==
Date: Tue, 14 Jul 2026 11:47:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	=?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
Message-ID: <e9263d74-5e2d-449f-9e37-9122bc924d60@sirena.org.uk>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
 <87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
 <9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>
 <871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8smbjAibs1gFN93g"
Content-Disposition: inline
In-Reply-To: <871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Neutrinos have bad breadth.


--8smbjAibs1gFN93g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2026 at 11:43:50PM +0000, Kuninori Morimoto wrote:

> > Not all combinations are valid here, should we have separate formats for
> > _I2S and _LEFT_J cases with the appropriate clock polarity settings so
> > we don't autoselect something that doesn't work?

> Do you mean some kind of limitation exist on this driver ?
> I couldn't find it.

Sorry, I misread the checks at the start of _set_fmt() - it's fine.

--8smbjAibs1gFN93g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWE78ACgkQJNaLcl1U
h9BjRgf/SqmoxEfcAF9Z9O7MTOrSo2h6bPGipaf8j3UpJ6sL6b6BKMk3gh9CP73t
gVQIO9qVEVOBFn7PUlkznlKpOnL+y3X/eJREH0YAmc82b4IXkwrDRM6buxsRfLlX
nLE+UzdesTSyaqUvCqHd0RG444a5+tTs+wEJR9ezOEVeM89MP00fTCn6+tO+rUxt
YiDLBNWp8pqqDp7qkAOoMNBdOnOOR3FBJsG8/IMuL+O7Xzu7jYM7Y6jElZkfrB1K
a6blEbSuFYcfLwxEIncKH7Cr9nP1/dGL9nB3yPR9HsJp3mZWwF4KlmkFGoyrpXJ/
4ouH4lxKBIGNLa5N58qXcE2RpQzKlg==
=CCE9
-----END PGP SIGNATURE-----

--8smbjAibs1gFN93g--
