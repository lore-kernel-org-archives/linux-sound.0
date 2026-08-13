Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A2B40626C
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638501; cv=none; b=dcPAP41HPqVhppqjHN7jAUrWw6mqEwqpqvxMJ63NhLq6wERbkTFwSx3WaGfGwCIk925/s7aSE351D8ltnG4SNpJGGPoxr25EmGnR8zrem99bgT/FDAFSqPyVPF6yV2zNFkak3hap6m7D0bMfe8APG5AOiz43qOmMW+oydevGW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638501; c=relaxed/simple;
	bh=UsMJ3yY+QPgM99pLz3TPTSsu5+PMdtgKPgm75C9BmVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdNWfHetyGcpkZHlU2O6Z5I+FeO+aKIyfyhqmNf/XwELpLd01cGn8F7tF47GUFN13Xx7YqyGtmf5BlGIJrUWuXB27ol2wWhQK8BI9xMZUVlcr/5aEAv+E0oP7pYp05e7e7wcV9MgptlkwOTVr9m3SySKDmsjabYe6slLA+lub6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJxejWaI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJxejWaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7191F00A3D;
	Thu, 13 Aug 2026 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786638500;
	bh=umxgShHsVwQIhIWNmBuBmf4BTCa624i2jO91NDXXGso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dJxejWaICUkMHlnm6xvf6Hynqj5irdgzSqf0/YH7SYzK96JOBGuRLDm1tgK0iOjG4
	 M0KAEQU9OncNL9KEg3PiniI1M5xdNkuUU/rmxlqQ6iVb1dC9f+CgQQL4QTUY/sIOJu
	 jKHjR4bBmGttys6oFBRwNF/qfVyaRkqbFeFv/Pq40jjvLcEf4xgUJb5Rcb+WgpjNVs
	 6lvXq4wqMW1MssvQL+DTKz9u4hH2LYa+nZw6l2bUk85wYS1buwMV8iFfYPIS3y2bEd
	 WpZ4qJeKwab/FOlwud6KmAzsVaDBvQeEy/cQXGVJDfmSr1OnhPBwlxU86ExVCzHmov
	 pV27oiUGU5LjA==
Date: Thu, 13 Aug 2026 17:28:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc7
Message-ID: <8b0c9a2a-26f1-4b88-a280-2575c21540cd@sirena.org.uk>
References: <317e8543ff401f09ccc2e93c8cd70e71@kernel.org>
 <87cxvmxf4p.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BceiNQbBszafb4b4"
Content-Disposition: inline
In-Reply-To: <87cxvmxf4p.wl-tiwai@suse.de>
X-Cookie: Trouble always comes at the wrong time.


--BceiNQbBszafb4b4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 04:35:18PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > This set of fixes is bulked out quite a bit by the inclusion of a lot of
> > quirks for various x86 platforms, though there are a few driver specific
> > fixes in here too.  Nothing here is terribly critical, we should be fine
> > waiting for the merge window if it's too much.

> Pulled now.  Thanks.

I'll have one more fix from Richard hopefully later today:

   https://lore.kernel.org/r/4bb97547-4145-4afa-8014-71faa594bd36@opensource.cirrus.com

which looks like it'd be good to get in, especially with v7.2 looking
like a LTS.

--BceiNQbBszafb4b4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp98KAACgkQJNaLcl1U
h9BsGAf+ORNIrytaeFH1E2xTa/Gzgbym0S51UukQJD/xPQ3cF6OMRZzo+2Vblf0G
K2FOe+uQ/PHZh+jA/6XvP2dJY5eiSoGfl3pZcYp3+HvOgMtyahlLds84qEhGHP2z
MydcLHYRT93YR0kYRA6QUITGaOA785S1Tv3Kh63/p3tJ5OKNCPAsdiLQ3WdorPfk
Wv4T+IA2AlIZlVRQb5JhHdA9/CaG97BvHaT10xArRibmS+9L+D5DBGMCT67yVxd/
w85gPJ3Mh0rMAB75LxH29re52iFTfTUJ6g83e7OAmyJrK6TlnebJ/vhH0sEmqWyW
HBrwqpkyLaRLdFoo51e5m2sbl7QTuA==
=jb9m
-----END PGP SIGNATURE-----

--BceiNQbBszafb4b4--
