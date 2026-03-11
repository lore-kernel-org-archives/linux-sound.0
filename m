Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CD5304972;
	Wed, 11 Mar 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249724; cv=none; b=Npx6R74Kt0AlzaPfVCJ7ZC9OyNVMnycY1159kcgisgIfWPW3TTNoISB3oCjnj7KvlXALcRCBSX0wYkjd0YTfSc4eeSy5ylAP/rhBF2LzOUs/QZXuQfMhzx+j/fZyc4zrGAhYVQYsWtkXZfGA4ZVVC9d3phPgBgtgbF172VervHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249724; c=relaxed/simple;
	bh=JqReOx1SYkH/jwZzq3sXyac+u5e6oqPSw092vS2028Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nsbj/b26H3n7KDe+qsPgsF5ZCEUNA/znyDPAokgCX6IdMbLQ3w1CS6dQc8DaONctUZGqGrLyG5V+WqEDWIkPLJkFEfx7eFv4Zl2OT22FEvWx2t/ArZdl/Wsn2R9O4gfpsxc1hj1FdbsL90ln1jfig/YGQvahvDhmSfPnGH4D090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs4tKpbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs4tKpbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03081C4CEF7;
	Wed, 11 Mar 2026 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249724;
	bh=JqReOx1SYkH/jwZzq3sXyac+u5e6oqPSw092vS2028Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vs4tKpbMppSFq+gi758OO6Y6JijNu7pgrn9HaEPBL9lQ3OmDms8EnPZqNpcVNDfNQ
	 wf8lMVBr4/QO63uGI7mAwCbqobzSPE0/ZsMuDHeCYN7ngntgmZbsg4DpnPEBZyxmHf
	 WDnPj1IjtGslLKL5ScepJMjHrMZIIXp0zA578QDJBvygaVpjYegjgA0LIPvNZNFgGc
	 5H+OH2DoVVXwfTw8MjfEq42civonxARdd4AGEmnm7CXq6HFnYnxq1Wbs+BWMrmQBor
	 kzXnS3JHIPwCHhY1XzVmuUvSWgtFBRnAKhePb5ANSqJYhR/1fNl8zMIVv9GzaHlWOu
	 ESUklmG8D/V9g==
Date: Wed, 11 Mar 2026 17:21:59 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: hasunpark@gmail.com, linux-sound@vger.kernel.org,
	venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Message-ID: <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VqX37/58iwZlf/so"
Content-Disposition: inline
In-Reply-To: <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
X-Cookie: When all else fails, EAT!!!


--VqX37/58iwZlf/so
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 11:07:30AM +0530, Mukunda,Vijendar wrote:
> On 08/03/26 20:46, hasunpark@gmail.com wrote:
> > From: Hasun Park <hasunpark@gmail.com>

> > Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
> > machine driver.

> > Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
> > platform-specific jack/DMIC quirk path is selected.

> As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
> If you are using RT721 (UAJ + DMIC combination) below quirk is not required.

Presumably nothing stops the system integrator wiring a DMIC directly to
the SoC even if the CODEC can also use it?  It doesn't seem an obviously
silly configuration.

--VqX37/58iwZlf/so
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxpLYACgkQJNaLcl1U
h9Aerwf+OTro9htbnedwYyGIopl+vWDsdkPkZFnwS+K3ddKW66TTYJQYOD7+MDRw
yAD5MoRCm/Xt8O5rQHYuLu/o9M4ht/zHKORaH9GTlaTSnXC81LCNG0zjvuc4CnXU
lrnwBxisKaOCB3uBYVzGZ+n37F1W83bDPPQzc3JY/9Dsngu6mMrTMnwbZxX47kiI
WEc6aEkM+UGxRCTdUrpjW1mqhDeYQXO04fpl/yj7DkE4G8BEb1bsVPPkfzfdSvLJ
EUR0/95OVpSYfO72D/huNsC50xcUlaHw+oYBhd/957yLpjMiyo7zhppPh4g/fRRO
9TMIsFZu0AVsHfDTTfnA/4B2ONoSpA==
=IIMn
-----END PGP SIGNATURE-----

--VqX37/58iwZlf/so--
