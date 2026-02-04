Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873451D90DD
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209735; cv=none; b=SzLmbLT2yUU79ES4WZqex0I9TkGjS8O6z46dl6ZG2AtF+usqg/NAA1VO7WDIXOVhrASLPcTr/xok6LuOIzkcO1gZ6Ofz1e/lZqiH+AKBQCr5YQewMK0vfMEhC1L0ee9UKU6IoHF7IzKhn3EamVi8wEjqocndvROkL9x8D3ZreZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209735; c=relaxed/simple;
	bh=6HnIkghxCAfiXhp1/e3ymp5ueIO8nC0tNnnhqo/BH44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7rbErXGpC3EGWzO6b/EIocGd6tPI3RDqV1uSL7KG+4klSIJch8+lst/AsemKgC2vc4seumkWO5pxZ/774rhZAMweNV76ZBjFs2v1CUgUVPGIMKIanjoq5JRdC1MxabCVFi3qfB9ZuYNKIruVy90vZEcipNwztDCX/Nbm9zAYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0HUA/TM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0HUA/TM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1989EC4CEF7;
	Wed,  4 Feb 2026 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770209735;
	bh=6HnIkghxCAfiXhp1/e3ymp5ueIO8nC0tNnnhqo/BH44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0HUA/TMmLZr+C4LnarNIYoR6oOsL3F3xQVIHYDhxHAzbnRhxBmjW5QqnJujY5F2f
	 3p3D44gH5E6coxI/oLWzqBmJxrWWo2dNhNBMhc9me0ZgCKcDDL5uHv4ASQCaUFaGjN
	 9OkkeX6aeKwQHnYUJe+YQH68dO7bIwI/9cdIjnPbLBWbm8GvbR6NNYq0XWfwHM+1i4
	 zGnoEfovk+V+4hCXf4BkL5ZG+u5IS9HfttnS+y7A592KA8a+wLKQMhWXxVFmGo3bHc
	 kz4LfzJnzX75XiZNAIKDH3JAVUk0t4nzl6hyqRCKXXHKwifCnzhBtyJgOSXIzlx0QQ
	 jUZi0yFeTXs8A==
Date: Wed, 4 Feb 2026 12:55:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <db496f04-3c75-49ed-ae8e-324edf4699e2@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
 <505b8820-9ced-4554-80f9-de0409859dde@linux.dev>
 <cbe68c20-1a06-472b-ad18-0dda301e42c9@sirena.org.uk>
 <87zf5pf2sx.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZVOGI2upqy+2v60m"
Content-Disposition: inline
In-Reply-To: <87zf5pf2sx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Are you having fun yet?


--ZVOGI2upqy+2v60m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 06:19:58AM +0000, Kuninori Morimoto wrote:
> Hi Mark, Pierre-Louis

> > Me too - I'd come up with something that was extremely similar at about
> > the same time, IIRC there were some small differences round the edges
> > but nothing major.

> I think I don't know about this.
> Could you please indicate me where I can know, or can you explain to me ?

I don't think there's anything easily referencable - once I saw Lars'
stuff I didn't feel any need to write it up properly or anything since
it was basically the same thing.

--ZVOGI2upqy+2v60m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDQcIACgkQJNaLcl1U
h9AzIwf+N8zLBSM5I5v5ozOhVXutgVdZCufIUD3jIDU+MFj+Q55RTV9cWqz0aXSv
U+ZZV2/DZx/bvgBXOf5OscVyJ4UzjEY+weZpDb0TDSF3eiKcObjlf+gTL9yevuup
rzSi95GNqtYj2UKfOXg9vO8+we26pGjP4v+3okofLRaDwHU6bepPLrEpsGdEXOCK
lnKXkioUl/ZRPumqbG2pOPb647MkZNJ/1r2fcLx+P9RHHAbLSpqT0w4aDp1wTgb1
dlB5oP2SPYHiFPFnB5TNhzFH4jfzpD2LiBuwTfFJob8F3v5Xw0IL/8RGwXJ9HMlf
wZw8GX88UlyATJSZNQQPdplMSUfYTw==
=Niwh
-----END PGP SIGNATURE-----

--ZVOGI2upqy+2v60m--
