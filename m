Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D9372055;
	Wed, 13 May 2026 01:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636195; cv=none; b=iXkgUUeo8uaQcva+VirM/sImrZ8HIhSkkvA3RcTySjmnG+RUIz8alNH5gM+xCUEF5Kb+UGGp2cSfGZPLrp4yjYTVd/MUTQTrAlhAjiHkUegY+IXMRl3S9XieuwTJSwwDjkZv6zRTL2CWS2iyi5Rc7bG7hiksV2C6xNq3E2YKUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636195; c=relaxed/simple;
	bh=4uCeL6H0rFPDcVDf8mjPhTeq4haSO/VvVZzr7fFyZuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZNWsMhQi74WpfFptOqNnGANZhnyz7/ano+PXVlE9ZHEDqQp/zKjDnlGww/fTPmubtmdAGhLxggqz2YKVW1RRVoFCmUy58Ov2Tp12+l3LasuKhqUWdbDzWBImkbZTvsWiRfwXA7fVH9Dq1u80aT/9WOdbCtbsFu7uYH3doK6Cm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJTQafVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJTQafVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC272C2BCB0;
	Wed, 13 May 2026 01:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636195;
	bh=4uCeL6H0rFPDcVDf8mjPhTeq4haSO/VvVZzr7fFyZuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJTQafViJnSaQwts+rBo/W2ctHQXQF5qjJnKnxhijb8WJyx4obY7SkneaPy+x7wtG
	 1/dESeGjEwsTAflSQB992E/QiSHJbOwzSOo2ee0HMXUvSGu2fR5Tu/UlQoJUToxj2L
	 2EDvpqVMBpchQBndF7zwfaAMlEx6QzAfcje3bLG3spqZUur2LNU+tvApq7XmKlGrFK
	 lkNQ5sYIehCTpiwu6guhMxpqc9sMO1XZ08yIlzJns8mHAzG0Zy93a/JsJ2gOhy8TeQ
	 RMY4Z+GI51j+H4F00fBJRTDrPzlFcI6LgQkzPWd/bvaLiqsSj7OzQbsRo3+fF4vFEq
	 uupPJNzSpeoMQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A960E1AC58CB; Wed, 13 May 2026 02:36:32 +0100 (BST)
Date: Wed, 13 May 2026 10:36:32 +0900
From: Mark Brown <broonie@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: fs210x: fix possible buffer overflow
Message-ID: <agPVoN1zSjzYPqpt@sirena.co.uk>
References: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
 <agMeMXwKVrjJZ8Tw@sirena.co.uk>
 <40e04485-3d2f-4359-9d7b-5b530d0e01da@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LpbDNKu+Z5tc5dqR"
Content-Disposition: inline
In-Reply-To: <40e04485-3d2f-4359-9d7b-5b530d0e01da@al2klimov.de>
X-Cookie: Truckers welcome.


--LpbDNKu+Z5tc5dqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 09:07:15PM +0200, Alexander A. Klimov wrote:
> In fs210x_effect_scene_info(), a string was copied like this:
>=20
>     strscpy(DST, SRC, strlen(SRC) + 1);

This doesn't apply against current code, please check and resend.

--LpbDNKu+Z5tc5dqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoD1Z8ACgkQJNaLcl1U
h9BxbAf+LMgldkJm9oUQEilrC5rs6gZ2hgU+TyBOxf2e6WoYddw2+5UmCE9wK+pc
Gw+JJgFaXLLhMhTyi/X1XADOpQFnpOEAXnp+8faSeb5G/R9CSnP/aEKe7zbc1NAE
8kGepROqBSTlEigs2i8cQ6MCJk+XLFjaP0DC1M8A14Ttlccf8R/hwrYoxN/zC8Yl
YsuUsVx80gOTzFoKqb8cyei+JyXUNI2ed6LMisllkBWq1awdJIa13tT9NNRE69JD
hMjvL3NN+VANTbswzopyzR3pKWLExcKGETIzZqF3diPqu18O1ZUSUlbMmsOVqS4S
wiutoP05C+57dw5mCQ6zmEKL+R/6kw==
=cY81
-----END PGP SIGNATURE-----

--LpbDNKu+Z5tc5dqR--
