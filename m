Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A82E859
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733494399; cv=none; b=HKLqy08g0A5yFTO2Dr6vUVYxzGjTd4vlC3Yd/ALaXG0cLFiJrzdXb948xgTHvVDoT4y3++8Ea9OC64c20EHU9Vguat2uzBel/5haCGlNmYDXct2V4xUr2Tq3v9+73XWp4/e5btA2+CyWW2MTXBLEoSzaiqykDOaaivsrmLAFoGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733494399; c=relaxed/simple;
	bh=iLtbTEArh62AVLcDCdzUM9bXmFj845Gn7ULYk3Ffrmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LslHjAFg8VM9vGZGhqdzCg0MWxsvsHBaN90ZCR+107KluJb7MOssfZXOcocsF+f0NRY8MZMAwHPThH/I6nNlcBtNrVrFTe6GI1xzY1JyOJ756Z1YSsBQSkRgYcgM+BrFSo4mWe0bBkOMQxh3ctTSULVrfikQrFcp4rboMc58UUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYn8kcX9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYn8kcX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D03C4CEDF;
	Fri,  6 Dec 2024 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733494398;
	bh=iLtbTEArh62AVLcDCdzUM9bXmFj845Gn7ULYk3Ffrmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYn8kcX9j2R491/btcAmXAD9tEtf7ka7QAJ3EbqlLN3q4u/Q5lJV3qvR2hrqhT6Cm
	 Qmz/TF3fOXSRlVlEOyZvsXN6ZwLA7bpybDE2LGaYU1GKkf4nm5mKywxEJQcTiFrW/1
	 S8xS/T1XHK4kYHdYdHycWtbU9raTpkZTwASESlbXWaqZC1Ii6S3EAWLJHEwx0yfcIM
	 Yf4pxto+zOat/p73EgqhgBmjITZ85fDeqsfTVKYSMJ+eu3oaFve0gAuM+ErkHoxOPg
	 5gMbEW4FdnEGmIIqlHhI7lgkTzNjGqYIzZLtvUo/MscFhdYa5uTesTUo53bSxjF2+R
	 kVKEQ9VOzxTRQ==
Date: Fri, 6 Dec 2024 14:13:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
Message-ID: <3c39e10d-0d39-4343-bdec-fe3041361cc8@sirena.org.uk>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
 <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
 <cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
 <c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5F4Z6AZswWPORe/R"
Content-Disposition: inline
In-Reply-To: <c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
X-Cookie: Sales tax applies.


--5F4Z6AZswWPORe/R
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 07, 2024 at 12:16:28AM +1100, Stephen Gordon wrote:
> On 6/12/2024 11:22 pm, Mark Brown wrote:
> > On Fri, Dec 06, 2024 at 10:54:43PM +1100, Stephen Gordon wrote:

> > > +=A0=A0=A0=A0=A0=A0 // Force clock consumer mode if needed
> > > +=A0=A0=A0=A0=A0=A0 if (pcm3168a->adc_fc && dai->id =3D=3D PCM3168A_D=
AI_ADC)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ms =3D 0;
> > > +=A0=A0=A0=A0=A0=A0 if (pcm3168a->dac_fc && dai->id =3D=3D PCM3168A_D=
AI_DAC)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ms =3D 0;
> > The clock consumer mode should just be configured via the standard
> > set_dai_fmt() operation.

> I did try to do this using simple_card and I documented my attempt and why
> it seems to
>=20
> fail in this message:

You should use one of the audio-graph-card bindings for anything new.

You probably want to fix the formatting in your mail client, it's
doing somet very weird line wrapping and inserting spurious blank lines.

> https://lore.kernel.org/linux-sound/b64a630f-d71f-49ee-a5e7-ea1e3a7f8de5@=
iinet.net.au/

> Basically, simple_card appears to set the CPU as producer if you don't
> specify a

> producer. I am not sure whether this is a bug.

Well, if nothing is configured it's got to pick a default?

> Also, there aren't any examples I could find in the documentation of DAI
> links with
>=20
> clock consumer on both ends, so I was wondering if it is even valid.

No, that's not valid.  The CODEC is the clock provider here and should
understand that.  I *think* the audio graph cards can handle this case
by having both CODEC DAIs on a single PCM but I could be misremembering
and it may only be the DPCM cases.

--5F4Z6AZswWPORe/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTBnoACgkQJNaLcl1U
h9BkqQf6A4qgOBfYGYvud4hFz0GkeBgREui+EcabuS14mV0aEU7vyfs1xs4i/rEz
fFx6UsHNJ3+4EUgYjWaToGzakYTxOVVE5gUn66chyHbgctot6UrCpyRr5U0RUqPF
LxtCdYZXc4SNgBOEqEsDIKaBu4A1DxLvgsqYtP0EfqcylGbjYlBZWYaXESLA9VQp
23dWL0ReFYgg5UEAvbpy6W8kLBxHFUgGJvq3lqMjTmJclqeqBj0bhHuGir9k7cdd
6HZWGjsmaN2GvXK+kwAaHwsXkaldeTvixzixVua8IgV9lYZZTexCRhi7kC1bG7cg
NklcfyyA56ViBOrKcFBQuWU6F+/uEQ==
=GoY8
-----END PGP SIGNATURE-----

--5F4Z6AZswWPORe/R--
