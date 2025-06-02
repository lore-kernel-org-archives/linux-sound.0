Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD79224240
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881283; cv=none; b=bxPQWd129A3SJLyfEMorMXxV8oJMVlbYcKQXVUjWc49xLXhwy6yU2N1VERfIm3SjO3DMSdIc+hH0x6y+fvk5rx8nShuIp5HV8sWi6ujRT09jMKiiCfnwEo2pWiwyUCKfhD52PLNFHYGYtaJ9sS++Z4fgsyJtAmdGXJ2dV1QuMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881283; c=relaxed/simple;
	bh=0jM9VYOVoV0Blb9ecWoqiJM7GA3GMOmBiNKIC9v+iK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fV0ra12prJL67KXUtYzd55gRi3q6Z2YuzjD3IZKd2Qi6+vRifL/XOkmJ/VRqn0vxDvE8Jn2lYt2/B+n3TKoMlwd2IX7FVdyIcYxccjH8v6H7uZuBBOD4a4Dwe8d+uhGW2oieId4nQMmX2z3//fTmFn1k7HbOlFFqI8ORjrTauEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRE2B2Mz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRE2B2Mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE0DC4CEEB;
	Mon,  2 Jun 2025 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748881282;
	bh=0jM9VYOVoV0Blb9ecWoqiJM7GA3GMOmBiNKIC9v+iK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRE2B2MzqmQKJtRfQPiSAZZA2/0quauf15zmbeGqbb2JGAsuL6R3nQdQUI07UuiNa
	 zK2Mc2/oRh0uc1v8kQRMsi+//qbJTkrulS4+qTeMN8bjBtChg4PljmQo9lThZT/OMj
	 ZjXJZNadAICn7CGklKT3+qUmVKYaGC6VBA7/zA/NfIBMccholDF14L4rHh+LUmQBid
	 d4KghuYFgaibo7HAgBekGG/yYsz6tr9QKI5yMGClj8lc4Q4TqAOKyIQA5eNldi56bV
	 SJW9Ml/W64ZUoEozIYDqOfAE6RjCpenGPdUzHKKhjuMsI4y5Yo2aw/1upfzxJiQh1c
	 YFYirHz0nj4wQ==
Date: Mon, 2 Jun 2025 17:21:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Louison Fourmoy <louison.fourmoy@orange.fr>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] sound: soc: amd: yc: Add Ideapad Slim 5 Gen 10 to
 Yellowcarp acp quirk table
Message-ID: <65b36d21-648f-4501-9979-321ad3591bd4@sirena.org.uk>
References: <6249498e-7986-4083-8909-2a50ba1161a6@orange.fr>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xvx9eizb8Cww30L3"
Content-Disposition: inline
In-Reply-To: <6249498e-7986-4083-8909-2a50ba1161a6@orange.fr>
X-Cookie: Yow!  We're going to a new disco!


--Xvx9eizb8Cww30L3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 06:55:07PM +0200, Louison Fourmoy wrote:
> Adds the Lenovo "83J3" dmi code to the YC quirk table to make microphone =
work
>=20
> Signed-off-by: louisonfourmoy <louison.fourmoy@orange.fr>
>=20
> --- linux/sound/soc/amd/yc/acp6x-mach.c
> +++ linux/sound/soc/amd/yc/acp6x-mach.c
> @@ -353,6 +353,13 @@ static const struct dmi_system_id yc_acp_quirk_table=
[] =3D {

This doesn't apply against current code (my for-6.16 branch):

  Applying: ASoC: amd: yc: Add Ideapad Slim 5 Gen 10 to Yellowcarp acp quir=
k table
  error: sha1 information is lacking or useless (sound/soc/amd/yc/acp6x-mac=
h.c).
  error: could not build fake ancestor
  Patch failed at 0001 ASoC: amd: yc: Add Ideapad Slim 5 Gen 10 to Yellowca=
rp acp quirk table

and regular patch also fails:

  patching file sound/soc/amd/yc/acp6x-mach.c
  Hunk #1 FAILED at 353.
  1 out of 1 hunk FAILED -- saving rejects to file sound/soc/amd/yc/acp6x-m=
ach.c.rej

Please check and resend.

Also:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Xvx9eizb8Cww30L3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg9z30ACgkQJNaLcl1U
h9AdMAf/RvBrm+vG2eg8rdr4v4NK8WCxy6ARhGWGlNzzZ84qV1LvYJO5i+39DdA1
w0YgFUUkX6MrAaJSgL50gCMa6RQwXPTwinnTDkkSl/k1U+zCGX4Qjszn41Zo1ccs
+RlAcoY3/uhNe6MOY6qFOlMJjxljuzGGASYqb33jPA23f2qYAvksS6tmpR00DnEE
7SeyLJI4dYGdRCu3LpArczocRMljBBlR5h6TpkGTWJvsUSpDERoG6PYzOoLYxpfc
SxnIoXH8trh04/Y53Eh+7B7ZdJN+bqcFqlDCBe5ayEDrSQqd8+5s77+wd1/+0Tqk
2aXOA7Hd7DzIZHrFuT0OPUtQFpZ88A==
=yq+X
-----END PGP SIGNATURE-----

--Xvx9eizb8Cww30L3--
