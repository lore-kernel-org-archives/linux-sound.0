Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B7322A21
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330450; cv=none; b=BkNB3JJDZgYXml5H4osRDDSxWZJWokgCHsZuc31ccm0hXhEYCXv/Ed2kHciZ882zbIyw66rg80U8dEyoXiQuURNSEsc13+oB6U+OwFYMZdS/LD8eEWnfSwsJIKvPCoMxBQI+yX/OEgtwhgvC3sDFvsMg70Bo9R4hvWX6c7+hRWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330450; c=relaxed/simple;
	bh=rRHl78jtUtUJmfDnOSvdD4VJZUvXSwlQAGFfzdcQJJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alwKl7vHeqtH8pgzpzSQj/E+cDHOOZ3o/1x5+4V31Sle2F0D5T3RGb5XTVddXntm66on118kOuxbWYpneUJG8r8NW2T+4yjylBqbOaEfKka/rJFtCdIaZmaaL4KP1cd7NAizfu+ISi4OJR9njPudeY1B43BhpS+mDBQJCZdaLP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPQFMwjT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPQFMwjT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4560C4CEF1;
	Fri, 28 Nov 2025 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764330450;
	bh=rRHl78jtUtUJmfDnOSvdD4VJZUvXSwlQAGFfzdcQJJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPQFMwjTlqDvd6M5fElHc2FsIpwhhsMlKC2b60wr0rcFY3fAJBv6Gw78Phz7dVzFo
	 NOdi6/nGDjnsttM2PBmXdg0m4fP78zIiVFQ3SJv3H+Mu0M2MR4ZBAV01ZL9N56+4oW
	 KxUE9clgoDrocgieilgmenoywrFLLvCrfvkCJDZJqz0qgWIHwrF3G4zaMWloWUA8Uz
	 teEampg+wOwTCct8lwCC8cLCRSqOc8jK7F1hwodP58VFBO4Pc/L17zThMywpoyU67B
	 7fv89o8U75WStuBILGe7Wd9SDP70hRInUX5Vj4DVU2D1M8KIN8EokWggzY6NQvlIAD
	 e6198aUz5a5bw==
Date: Fri, 28 Nov 2025 11:47:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: Intel: catpt: Round of fixes and PM changes
Message-ID: <879cbe3d-d93b-435a-a99c-5de54c053836@sirena.org.uk>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
 <aSl9NZ7YUao1NGNQ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AeQXckQYyVuqHPiD"
Content-Disposition: inline
In-Reply-To: <aSl9NZ7YUao1NGNQ@smile.fi.intel.com>
X-Cookie: From concentrate.


--AeQXckQYyVuqHPiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 28, 2025 at 12:45:09PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 28, 2025 at 10:34:06AM +0100, Cezary Rojewski wrote:

> > The standing out PM change is removal of the catpt-driver as a
> > system-suspend (S3) blocker. This is a suggestion from Andy as indeed,
> > audio is not a critical component that should prevent the system from
> > going into S3. Whatever happens, the driver can recover on a follow up
> > resume (S3 -> S0).

> v2 had been applied AFAICS.

Yes, it was.

--AeQXckQYyVuqHPiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkpi80ACgkQJNaLcl1U
h9Dungf7By9KrbOtHx1gt2cnyy6ovHNCNivdbCnECyxikt4IVwnDCDwrtE2/tD5S
dJdPwHt/hs8+P+3paIquS0w8pRVYhJ4hDKrYZLugKJv6UMRAHs/zKrFPb+aXxjiE
741YlulONA6tAz4MwCh65P5qnMGhDOFKy/QKiZdujCOpKL58imJLqmLRtdmNGPGo
8WmynN7hWwXq/gipD+eD0tC1aZw7pV3px+VbOBKMMCMTbJ+49W2jE5LuJdv6o9LD
VrGQ0OJVxITUCt4vHCt4/h84TOZLS7DxeEmZWDkBfTFPpbzeeYgmLhf+1z/GgBiz
y796guaFsgPky8TlK9zI6T1JA6oZIg==
=ED4+
-----END PGP SIGNATURE-----

--AeQXckQYyVuqHPiD--
