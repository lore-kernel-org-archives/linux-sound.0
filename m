Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4479F299A82;
	Mon, 13 Jul 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970552; cv=none; b=pP/klD2ib5VwBfCN57+DnZLASXVzgNlHDlVzuDJaSVO4WHt+sOwn9IiTmDYyanKIlAXFPgfqbAJ/BeH01P+yNPvNvkJ3CZMHNA6e655C0AwQmHItCZ2hQ1UXeYo+kxEAZUsmmmI4MPYITUmkFaPs7mmBvh6XVf41E6hlPP9+YVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970552; c=relaxed/simple;
	bh=bXvmOut/ctOyR959ryDP5h2xIp017nMV1fl/jdEcENM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OANP4cgEcwf6qQBl6HaHZBDgAiITkjImxCgXk25MPwKEcAwdlCDzH3oMLqtd2LkyclgORkiCZz9PxG+BBFfxpvChL3ENMORG1to7fRl766G9GG4R5vhgbiUlVaLegqOnBVn/1QZEsugyWzfEr0P24sSWIlXTdXqdFOi0RVkHn+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qp7zwLje; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qp7zwLje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651721F000E9;
	Mon, 13 Jul 2026 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783970550;
	bh=DdYDy61PUBDg/LvoP88MA6bl3H3oRni09BbhpewRm5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qp7zwLjeMktYaYfpjbkRC1hur9h27LDqPV3skU4E/Qa4HnLDTdahoo83zsM2+9IHA
	 +gYfpue6BsGguPa1Mhl8dZgnd3ghxvglvZf2New2+oFFXZgkMg+z4Ng5L0VWcspHID
	 rm24zR3Otnu7SvH2NCbhrDib5x6i1wSIulGEeXOo/1dk0LCD9VsQbQ4HfqPX8sLGFc
	 BbrCUOsHZhMT9l/DkRYoeVUSwI0En54HfCOS9iNklnmletAAh9/dg5wOGXtnO4rXPT
	 /QE0cKczvmIj58kPVuzF9RidvsrNf80Ek4kJyjKaH9koTopFKMtlaUJcUgnGzRqqLD
	 gnYbd0rPZIQaA==
Date: Mon, 13 Jul 2026 20:22:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound
 card
Message-ID: <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JPGbq8e6OWeXaboP"
Content-Disposition: inline
In-Reply-To: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: Courage is grace under pressure.


--JPGbq8e6OWeXaboP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 11:39:05PM +0530, Prasad Kumpatla wrote:
> This series add support for sound card on Qualcomm Hawi boards.
>=20
> This series depends on:
> 	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@o=
ss.qualcomm.com/

Which is a not directly legible link to "ASoC: qcom: add AudioReach TDM
backend support" which itself has a dependency on some further in flight
stuff also specified as a link to some random message ID with whatever
pile of problems that has.

This isn't directed at you specifically, this is a general problem which
seems to be getting worse and worse with the Qualcomm patches.  There's
multi-level stacks of dependencies, the dependencies are hard to follow
and nothing seems to be moving at any great pace so I'm ending up with
my review queue clogged with things which don't even apply due to the in
flight stuff and it's hard to figure out what's going on.  Can you all
please coordinate with each other and try to get whatever is at the
bottom of these stacks of dependencies in?  If you have to send changes
based on some in flight things specify those dependencies in so they're
readable from the email.  Right now it just seems like there's a
constant stream of stuff being thrown over the wall without any review
going on.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--JPGbq8e6OWeXaboP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVOvEACgkQJNaLcl1U
h9CZiQf7BfLAxdZHPaiwXuoNwmBy+sqGTW/KvMArSVThg2AoTNivLEpSdrO+Kr9F
EGcM4xVOnJT6MpHCxJZRGf1xstv9whka5VftgUy2UOww28GZ7Usvm8i9NvnuZ0yf
Krj3S0tjNZY9Q0tRmFsp3Z3ErazTW6FOf0RdqqjZTyte0jW+EItFW5nTC6GLfqC4
BncIq/5luBiy14JmMDL1QvmuDeancnXy518OvpzGpFTsOL42xTHnJMs88BfINp37
jP6WPqjzNBg1c6+C+DhSzxlPPjlboFtt0adA2ZpQfrHAKdF2sWueZN3phE1aH6SV
ZbSy3mUy2xbygJDzXPjFKSRNvzxYDA==
=lHC/
-----END PGP SIGNATURE-----

--JPGbq8e6OWeXaboP--
