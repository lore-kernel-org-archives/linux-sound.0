Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B75364927
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026542; cv=none; b=Rum/thZzoU24eF1MGCtq/NkQrI/3gVyGARn/HWVW9MGqEldi3t8hQwUmzl3VkXTyxccgN07gorMF8P8Lxere8fw0c93He6MlH3e4j3icSSKZvNOjB5dqjwdHdSRs4wnWOUYoQ6Y+2pKqkIANc9jN5nQxiwteSJcG0I7jNWxB6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026542; c=relaxed/simple;
	bh=Cbh8luPri5/nKVsVvvZlI52puqqPpBOUr/Xx3uUCqD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jS4b+QXhi1kEgdK0bOf0CAZ6JyR6R0k0MFDOVyIWho2MNBPn1Ss9ezAHkFZKqrUvRqH/0jWnR2zZlVIjHNHU/uLR+v+3+pNA5a0LfeYicJsABkcZY4MPKPMa9L0RH39OP4mAmogEg2tnDJRh9lkHaYqwjV9rqPg6XSOUVYZONk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlaNz5sl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlaNz5sl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5869D1F000E9;
	Tue, 14 Jul 2026 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026540;
	bh=y3If49hgfwcDwvLtqUvDsiFBmt4OqiS45edtjI9Ede8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HlaNz5sl8KtFa/Lz8ApfjQvEUmUXyDf31XjcokcynZU2S3iyx4JomojQn/rFh5ZQ7
	 /hyjqyGSITxeoFc3bKn6hyUSY1z8XtTP4w85Q5FYPYEo1GmJpPKrIfpHqZTmAxkIMA
	 T2jZdhGQjThU6h5x7MfLCFtmyXOqBD0qAVIxNes3zmkrnMvOQZ3mqa0U4KScgPSzBg
	 tIm+JIYnW7gM6FEylDt1VL41pTLm4iRqcMEHw0RXNOgjEOJnt0hAc0H4YqFr7Z6mW2
	 OZuekD0BkZ4D437iT3N2J1NGzrgAshXpbFdXh96EL7Qw+/LwEkcZCrpoQQ66GIkzdd
	 g5HfJdFaaihKw==
Date: Tue, 14 Jul 2026 11:55:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	=?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
Message-ID: <19ef5d68-f3b4-4cf2-85e9-cd433739c71e@sirena.org.uk>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
 <87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
 <9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>
 <871pd6pia1.wl-kuninori.morimoto.gx@renesas.com>
 <e9263d74-5e2d-449f-9e37-9122bc924d60@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/j04ESZMV//rP38L"
Content-Disposition: inline
In-Reply-To: <e9263d74-5e2d-449f-9e37-9122bc924d60@sirena.org.uk>
X-Cookie: Neutrinos have bad breadth.


--/j04ESZMV//rP38L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 11:47:32AM +0100, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 11:43:50PM +0000, Kuninori Morimoto wrote:

> > > Not all combinations are valid here, should we have separate formats for
> > > _I2S and _LEFT_J cases with the appropriate clock polarity settings so
> > > we don't autoselect something that doesn't work?

> > Do you mean some kind of limitation exist on this driver ?
> > I couldn't find it.

> Sorry, I misread the checks at the start of _set_fmt() - it's fine.

Ah, no I didn't - the check is at the bottom.  If you look at the end of
the function only formats that end up setting fpol_inv are valid, so I2S
needs inverted fame clocks while left justified is invalid if the frame
clock is inverted.  It's not the most obviously written.

--/j04ESZMV//rP38L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWFagACgkQJNaLcl1U
h9DHtwf8D/A0SIgkJVi9qRRQonYxBC9lSpsm/VD54UG07btbbD8lZqGkqXzGFXnD
PvZyz1cro1P3l+ZcOovmGtNJ/xFu8bj+RYHSSUaroGkIUenNcuKSSIEm6NhrB1lt
nF5KQL+x6/Npvkmw2iSLpsl2nHWX9LN/69vfOqcIzeOJMGuq9AxCy7nnDZTvrZoC
5QWyYbE+VPC5+nfn6/5WJtugzM93Gnn5hHyZOTh169GEfVWE/bW2I3zEPo+BELE3
Kyy0kZQN4YMF4WNMCexwh/sd9KGLP0ruQ0cwfAd2XjE0dA4glx40P1saYlR0lqXy
4T1Z9dbWDzKZkaKSf/O+ZEpZIzoqSQ==
=QLEO
-----END PGP SIGNATURE-----

--/j04ESZMV//rP38L--
