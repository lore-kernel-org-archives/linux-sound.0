Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E648F858
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208749; cv=none; b=mlwhfmJqamak1DrwClNmG3TnpHdUNzKv+uRAEtRYnY/YmvnFFyOew+dFVx6gKefG5YawJcmWYWYHtYFxWvMh4mDoDJATwgOliJd9QFqIx7WtV3OqY6Mrbgb65hm5eeTVC3myqdwP7rNr1UN00kggnwOWhmP4Kny5wybiMnyyeEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208749; c=relaxed/simple;
	bh=niBjX0bWRzQKE+tS7HzAoYZL9cGfRQaSRvec334PG00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVdSlPFbORmM6w/ltFBf7gzoyb0FnkZYaBMfgpBxmomyhBLRErya0JzxJ0ef2BiHXa6eVTQdkmo4QrmjMMwL0H0cO+Lx3w9+Fkj3oLec8CS1kkZ98XpY/NG3CRfL4nFwtKrI8gqw5WZYMksUH/kHbgS4aVEqDO2nnp3XklVFTII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M77XpcmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M77XpcmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8E51F000FF;
	Mon,  5 Oct 2026 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791208748;
	bh=xpLnQaVHt7V64/KwClBQealEb05ypY5MKqharYbnIi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M77XpcmAIoH8ify5m0rPmol0xQt+NkBudDD94kFVl2qpi1sMEAXdeRUfVNoC4adNK
	 abcZg5DpRnghepS9oHuRs5qKSj8HrSqZDpWINt/aO89910VVLDr2FGJwvN4KnMaFcj
	 uy5DOUd0gAhyrcFoqpeihZ0LSuX8CWv5lqaVrW24wXusjpEPbTQRLGFpipV3UCUyZI
	 yQIxXHNtVbrgJgdgl28bkPCmBWV6Opdi09sUdbzUiwRHoT7r7R/4GMrd/C2/sOJsp3
	 0nyv/P2PeFLea1xG6E1vzRZO+OuetchFwUTxAYHVoUWwuWtLrKtTZOMt1E7RjKnNiX
	 v+DeFluU8ZJCA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 15D41164779F; Mon, 05 Oct 2026 14:59:04 +0100 (BST)
Date: Mon, 5 Oct 2026 15:59:03 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Arun Raghavan <arun@accosted.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
Message-ID: <asOtJzxO9bWQ1VaX@sirena.org.uk>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
 <87ik3gs37v.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="00vK4cNz/wshtch9"
Content-Disposition: inline
In-Reply-To: <87ik3gs37v.wl-tiwai@suse.de>
X-Cookie: Use the Force, Luke.


--00vK4cNz/wshtch9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 03:10:12PM +0200, Takashi Iwai wrote:
> Takashi Iwai wrote:

> > > > > a few people including Mark and me have talked about holding a small
> > > > > meeting for the Linux audio stuff (finally again!) during the next
> > > > > Linux Plumbers Conference (on Oct 5-7 at Prague).

> > > > > Has anyone already planned to attend there and is interested to join?
> > > > > If we have enough people, we can try an official BoF session.
> > > > > Otherwise, we can just have an unofficial session at lunch time or
> > > > > such, too.  Just let us know.

> It seems that a lunch meeting would be fitting at b.

> How about Wednesday's lunch?  Does anyone have a conflict?

Adding Mormimoto-san who's also here.

--00vK4cNz/wshtch9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrDrSMACgkQJNaLcl1U
h9AETQf/W4gvMvBRLp65z7cN7mcXt+SiNRnXR+3ZWdtKt9YR79cduXRXmi6tLcv5
YUcLbFiynhlPP0rzss1hmopw/zxUQCdlWZ7JHXwCzDjciT7ACJNUbe1f/yB72rwf
vZppU76cqwNskL4+r7Cf6Sb/3QUcrjbMdw5h9of9VlgVCWH5cIpNl58rpaTzakCN
gdrXItwe7vG/tqY7uoB9dXXohJiDqFt9qj67VUdgUGE7tEeLoO4YNIVkGHqGDvxT
z54qyHa5SlPb6w2/KAzhACqY850Y8s+fTRUCBaMusetzMVxm7Qg0xmaO0r+7qVxu
POFVoiQG1Sslgi35b8Tt4Vw0+jIt7Q==
=YhxY
-----END PGP SIGNATURE-----

--00vK4cNz/wshtch9--
