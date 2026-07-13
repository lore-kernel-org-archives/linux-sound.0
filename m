Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848404343ED
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950666; cv=none; b=oqy2DvrmyyDAG3lCblIhpNI1u5zOHOk/J0+6HFRTh0dh1HGmgHT9qE62M8zhViRUGM78XkqK+/NcJyNQzvccfx4KISnHrSNmMExQ02vtoZDoBnmP+9ZWvghsUdoDuDdLbysjmqX4USmSRGEniVwJ7HvBK6dIFf4qB68jtvfhMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950666; c=relaxed/simple;
	bh=6K6ze1cvTIFFFsKQME/WKFPdTDukatfY7cQDHSKf7GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zb9GvXvadQ/uYkWHjQZo557CbwsfNoRQUVtYp51iWYmM6KW87qNEsAOjEcVWovabYy6po93gqcha34ZGDRvZhLDiget9Z7t/ry4J/Z9fBM2E0shIWw+HALnOvf7a+8Z3n6C/Xf0S0choqRWw+ZHvPLOhQzPfH4epAQQ8xKn/gl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ap3ASVZS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ap3ASVZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64F11F000E9;
	Mon, 13 Jul 2026 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783950665;
	bh=E180+7xz0uX/VgPdyhzsxLMpxjuCh/zGSsgHT35lLUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ap3ASVZS65HEUfknhlZ6tUWQv5vAADm852HHfmklQF/stPDpqozQLmfGlQkAGWBPd
	 cLfkCrBtR7K6zy5sEusHRrpmeoxMKPPXyB/K7dCNi/EwHvlHam5ilBlGKaLHp9a/jd
	 aI4m5cG/RF/Dq/Gk5jd0/MOCrpsCqopAkIzRPVGughqicebi1hTr5f+Li0yZ31LfZv
	 f7d8aolAnwr7J1QIYrVIjHQ1jpjlBNHtCSV2hUHigDMYbaxzNBogRcnasjKlZM87wf
	 LY9/xhcJXKQG6CB1bjuKoCV07OYEeXODz7Ok1dAtMhmeg/qgcq49LPxBNdiyNTnthK
	 enL9v4REvB7EA==
Date: Mon, 13 Jul 2026 14:51:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/12] ASoC: cleanup simple-card/audio-graph-card1/2
Message-ID: <bf432c6a-ca57-41c6-8aa3-1031a7ca0daf@sirena.org.uk>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EhKFxpdijV9YZm6a"
Content-Disposition: inline
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Now I am depressed ...


--EhKFxpdijV9YZm6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 01:44:18AM +0000, Kuninori Morimoto wrote:

> Simple Card has removed platform data support.
> We can cleanup and more sync Simple-Card/Audio-Graph-Card/Audio-Graph-Card2.

This is breaking a -Werror build with clang:

/tmp/next/build/sound/soc/generic/simple-card.c:676:3: error: cannot jump from this goto statement to its label
  676 |                 goto end;
      |                 ^
/tmp/next/build/sound/soc/generic/simple-card.c:679:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
  679 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
      |                           ^


--EhKFxpdijV9YZm6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU7UUACgkQJNaLcl1U
h9Do7wf+KB05SLDYOGkSWwYPI7xvQkAXk73OAr6sUBUhDDKtgByE++iy10s79Naj
oNw7FhskVJJBGtYsyzK+2uMLPwxAkIRPL7yPXPPlDr2pjBr+5uGzaAOjrTKsOGsk
FKDhS4xGgyXRhrzgxYDSyGVx0D+rSz163ViXxufIybQI4ecC/GH6EdJTRDw8Q72Z
T9vEo+tc3Z+sgNCHd1py8btR6BhENoTGh9oTBG93k0N7qbAvtO+ByKD78Kq3bHB8
tGP2N+NNnGESMurYKWoCxZY3qU9qDjw1mHK5Fz3Q1HNj3zH4Sn7amkKwXAvEp0+c
RUJMQHiY4BjuyESsrrF8zcEIy6DJtA==
=hRMj
-----END PGP SIGNATURE-----

--EhKFxpdijV9YZm6a--
