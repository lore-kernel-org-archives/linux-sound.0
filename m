Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF24C81;
	Wed, 29 Apr 2026 00:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777423635; cv=none; b=ilNa72XH+dcURTYdV8n4qekfEfLM7xc18uldO9V3ONO0Azzq9eOJ4AYJFOFZmn8RAFJLjTwIGuWKwlLpWiQAnIC/T3wE60jbjoFwMyJTQAbAQaXa8NgKR1IF9mg2VeoSNbsym7FP3szwhJfxDWIcfwyR3C84Gj6JLG49XbLd8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777423635; c=relaxed/simple;
	bh=VMuBCuS4p0B115YZUasD5NwCPincwq3apw84KU7CAoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXdi19hg+iU6cY6JZtMIR3AWyxn4s8gpba9JlJsvF8HWSeJet26dfpo8zf+u0qLglRylKoW2+QUUNv65uk7INuwOMnw6uJk6qGoY3ntGBFgsZpUmpAmUKlrg2kVgnF1BCVpNFV6AUEUlV81B/TZARvtD7/6czT7NGEMbnrt4HiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlADn9T2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlADn9T2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA93C2BCAF;
	Wed, 29 Apr 2026 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777423634;
	bh=VMuBCuS4p0B115YZUasD5NwCPincwq3apw84KU7CAoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OlADn9T2n5tI8FoA41BMKOCzf2AKODgtSDq6TMaADznwHQ9+7boBqk4+JHjVq8n+J
	 +5s/JpQIdJPDZD5KLc/KlL8NGTUuPXvljHCAChGD7LMDoY6OgLs3W0UK3tWOm4LxlB
	 45dHUMCUHukdWAR4gpGFm7zgD+NnPmnLCCC3nfZKGORDRzmz4bTPslwW3xK9MwXQa6
	 riCx3atTe+OxDkB53qnSukl2m9EUhkrG72JbA+l1duNTDHUD11BWygSCU67MZnQ95E
	 3xbmVJTchbOnXcTpb8rEtqDUV0g+sjKv+t77N2WmJmrh2lb2pc9BqFc7Gi7++dLEBz
	 mOkkOE3whDBwQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D48F01AC584A; Wed, 29 Apr 2026 01:47:12 +0100 (BST)
Date: Wed, 29 Apr 2026 09:47:12 +0900
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: ab8500: Fix casting of private data
Message-ID: <afFVEDMR4boctboX@sirena.co.uk>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wge2dlNNSVMqQ6QN"
Content-Disposition: inline
In-Reply-To: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
X-Cookie: 667:


--wge2dlNNSVMqQ6QN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 09:22:49PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:

> note this is untested on actual hardware and was found by Christian using
> clang-tidy and code inspection. I'm a bit irritated how/if that driver wa=
s used
> since it was introduced into v3.6-rc1 in 2012. Maybe this is a hint that =
the
> driver is unused?

A filter control is relatively obscure, it sseens entirely likely that
people just never used this feature of the driver.  IIRC it was on some
relatively widely available reference board.

--wge2dlNNSVMqQ6QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxVRAACgkQJNaLcl1U
h9A71Af/Zg8Nm4EaBpCmpkL0cZFZWGi7R5H4q3x1k9IjJoR1gkPmGseVtxlysMSN
2nyc/x125/FvV2XIS8YOEAoLOix59Ud2nZuo7VkUBk9LA1k3TFpjahgIxLfUIzzr
Mt3O6KR3IxfQeE3CWW2VhPoWJUILiK9XDe2qQsjCXTHGdB/zQ3Ze+2YXtiGa7Rw5
BzFWSh2x2wdFk9wCX1wTpLhAevpsoBA0bZc1f87jAMklOMa97mGjrIOFZRraGikj
ZD7pMTtKZNkRIV4ixUZCZbsqtWLYhlGpc+iLEQTLjbyG5xckZcLYorEUo2GdViQB
NHKM1Mm4rOsxikEDAvVaMIVV4viqxQ==
=UMs6
-----END PGP SIGNATURE-----

--wge2dlNNSVMqQ6QN--
