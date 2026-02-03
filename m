Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3C928750B
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142639; cv=none; b=RnVrh91N2JjLP8wXFe+Vd48cCDvRFwH9WEM2fOVMpupucr2PaiRcyZPGt4fyWFQo4R0leBRkaylu/TtyQPr93L6/+yhI9VFmYVUFSvEV1qaqGQtLnLOEH8GgId9o0kf7vO/biEQGoBul4YYrt2K9vwlVP7pzGQD1TSkQtulr3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142639; c=relaxed/simple;
	bh=KOBsupb8TZaZvL8mYCAyYRvXOhuyr3sf8owGLsfz5RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh9Pl6dXXAKuwnnV693aeoiA+2yIHEGFSklfGKIuaBkfClApVq0Sxhz79dV8OpAnIi7qD27hix3jqs07YXk8UeKqb/qB7y8u6sGaKFHIEi2WH/oju+dbwnbni2Ie+HOthABJxYbKPk/Qxosf29CEWRDjCrp/PvuBdtGB/2aD8W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jfewg6G7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jfewg6G7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D2BC116D0;
	Tue,  3 Feb 2026 18:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770142639;
	bh=KOBsupb8TZaZvL8mYCAyYRvXOhuyr3sf8owGLsfz5RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jfewg6G7yLWlb7HP8o/7OC9Nu+Oh8fDjvcbcOJAeZIwI9Cqx8Up5/aPawJdHopq67
	 iFww7K5CtevB2hIPjnQ1+54+U05cXb6woBFeawHKp+eaxxES/GxgD0WhLf3lfUpK+R
	 42t93jYF5XEx8hVkBNAMmdDZu9egDxnokNABT51fI80sd4SEnk2FItfuL74fHr65vt
	 0cXMA2MSE3KPvxGnZJ2MCKw7LkLuDPi2lZREL7np9f8z9mt/CYqqQn/olgN21+f3lu
	 gAnnNb0nmCX2CCetcGrZtl6cjR5Y7wzwq+zQ0P2U0vd3dSHihiFnf+BcP4+rQ6D7Dy
	 q6bZPu3owM7fQ==
Date: Tue, 3 Feb 2026 18:17:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
 <b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z2+g3Dl3VY1u9aoe"
Content-Disposition: inline
In-Reply-To: <b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
X-Cookie: Your supervisor is thinking about you.


--z2+g3Dl3VY1u9aoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 06:07:00PM +0000, Liam Girdwood wrote:
> On 2/3/26 06:27, Kuninori Morimoto wrote:

> > Whether having default volume or not should not mandatory, should be just
> > option. We want to have flexible framework, like some board want to use same
> > style as before (= setup full routing etc via amixer), and/or some board want
> > to have default routing/volumes, etc.

> I think hiding any kcontrols or hard coding kcontrols that change audio
> processing or routing will break all client use cases, yes this may be nice
> on IoT where there is no sound server or userspace audio infra and very
> simple audio is needed, but on client we need the soundserver e.g. Pipewire,
> CRAS or audio HAL to configure and control the use case/policy.

Yeah, we need anything in this area to be some combination of opt in and
focused more on trying to pick defaults so there's less need to write
and distribute UCM configurations for trivial cases.  The things we can
do safely for everyone are pretty limited, things like hiding controls
that we know through routing to disconnected pins can never possibly be
part of a valid path (I always wanted to do that...) for example.

--z2+g3Dl3VY1u9aoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCO6oACgkQJNaLcl1U
h9A7EQf/dMkZ0/UZZh6zaHPGhgoSfkrO7QtA3nDbn7JiNP+4x6a32QIwrVrHhopS
zjFgX1/b7/amgOf2YD7zQ5Ii8RxSVqZc0Zz140sGIP/wjIDuBz9TZ64nlP3AohRp
WeGpv1CbmYxCOKB2NSdAOGw0HD6qUHsvE5iUF8d1bn+9CHouR1L6u9Z9anKMvpbA
msomGnTOH3GgqZcKg7z7YPeZZJLY5fi+KiebXHFGU19hfOqJv3A9pNysXBoIrl7Y
l/DmhZO9ZT953f6iHKIGT3bkHp5u3PB8V91MDDRmhiRBqVoXaHPwpglYwitLlvPM
4uSc47MRbzj54jPi7t1Wk/FTcusaFw==
=vp7P
-----END PGP SIGNATURE-----

--z2+g3Dl3VY1u9aoe--
