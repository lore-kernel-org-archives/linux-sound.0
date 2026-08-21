Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893DC4DA553;
	Fri, 21 Aug 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329421; cv=none; b=kSivQnhv+uXJNpV8Jb+dEdHMELNPhvzffX7pMeYAEvCotGDxntUHxIgNbbF22MAMZCmxu8bRoBrLymhvP3MZCz8m56wecLwsEeP/vCzAbjYpdt3a8jswUSYz3Sn23knlJI1irFyaKD0ZDIAQfcPXD1Ie5m+E2oMAor0q/zEY1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329421; c=relaxed/simple;
	bh=pKttHv5qXS3g1soGSGUAhd8JEDNR5EftkSVWW87TpSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gW5zC+z6UNfR+Gqq1sIMxDkABBUcHKzvUVQ3zX/uSDJicouBAZWpZKjUTkH8FM3457Kg+efMLjvNM78GfD74Io3SaxJ2EoRRZ++Ho9wZzztMLo2mcjA0rxLVwUQOJpHVoQSXTPOsa0qXnCew3i0JneSiStiAzThgXreeTm/zOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9H98PtV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9H98PtV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE19B1F00A3F;
	Fri, 21 Aug 2026 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329419;
	bh=x+zXsTkUJaSVnc/do6Za29J7RwMdQvobeas3qJyA3Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R9H98PtVQOtyMxHp7W8umn+jHUZozaAroTnQqUTDpsd0Ij6lNX4Khno0ArnCa5r1Z
	 kGseKJuqn3z6smb3gPJft2vKhMkv+OJuSNMla2q0kSlAZI5P01ktXR1xG6cqZRLd2j
	 ZdrY0axsRV3Ss9+l3n+pDRseVwIvrrWxh0eztbkG1rJHxJ7eR1fzQJEr3s6zUGdolI
	 qA5bwTuOoaXIeSUWyLKXw6mVQNuk64ySaMGYEIMOl8gmC4huqhVWJwVKd31kpSXX36
	 5CbQhvM+1atNVbp8TtbMyQsJmtGIS1DwgEf2hBbTIXPupC+6miT6YxreBawh1wnp3+
	 mDtDop2XCzXEw==
Date: Fri, 21 Aug 2026 17:23:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Introduces MDSYNC support for CS35L45
Message-ID: <536cf599-5c62-4248-8962-45ee4be48d80@sirena.org.uk>
References: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
 <20260821160946.95258-3-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RWnRWJjjd5MyAgPd"
Content-Disposition: inline
In-Reply-To: <20260821160946.95258-3-rriveram@opensource.cirrus.com>
X-Cookie: Package sold by weight, not volume.


--RWnRWJjjd5MyAgPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 04:09:44PM +0000, Ricardo Rivera-Matos wrote:
> The CS35L45 has SYNC pin that can be used as a multi
> device synchronization (MDSYNC) bus. This pin can send
> various message types between Cirrus devices.

Something is broken with how you're posting your patches which
consistently causes your cover letter to appear as the last message in
the series rather than the first.  Not sure what's up with that, haven't
seen other people with similar issues.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--RWnRWJjjd5MyAgPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIe4UACgkQJNaLcl1U
h9AlBQf/cO7vz1+T6A0h/eXui142gw5LFjkx1vIKxV5Hk3F0fjhcWmRvqIShEJb9
4K2vZd0Ri+/xSIskYrgK3b9YYoT7DM+GLDmhxTXuRMdiUFTN5Ja8T3tUnv+Ab7xo
znLKl8bDbtONiEaX7GjjODmGBS4aML+K2DsvO+W/z3MR0hNWd0tZyGUnsLFScaJm
2DJp4QdpjjLEzmVxMvloaEBWh5atCjX8Z/bIXaETmAaRgITHE9xuCeoKeRiL9wp8
u6ieS6ceZppc39deHd17TRvjPDlzZ+0YgXtqloUscK79Lc22MKES+brKiQjR4jcV
dHqL37ojJRQPAeXihgIDIjoQRIlqSw==
=k4Fi
-----END PGP SIGNATURE-----

--RWnRWJjjd5MyAgPd--
