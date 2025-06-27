Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524BF29B205;
	Fri, 27 Jun 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022257; cv=none; b=NWXmemmr8dsDvDGWJQnLhbmvr6U5cY+Mqt+yZWTGkY+1MtuIH42OwNfQ/oKecRRPIrA4g3zb7+b7PNj+0jIMik0wrXM53wam3f6DWsNqEZuJEEhJeNVHDPQv6G8b8uGlqZ6A7Mb/WcFywHbpmimNimhxI1RVYy529FtFOfhyqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022257; c=relaxed/simple;
	bh=ILopEhlpi3Ezeg8jJ09kRy0qj4a+MztRff2cwbyCFPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzHZc9yC094UJ3EGSoBP7bANxeJkKPdAZvcqvG51hLlr+EkRW8NbotfiCHXhaDnjja6I5hsEikQfe3GIrWdLpJpvy1+FctoWWeU+djuhMFL2fgGVHZM/loYPEff5m+skx3DXYZnBj59R6RieKrAXP6HynM/u3SzpPDGuwCltOY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vy9i0A8c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vy9i0A8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D469BC4CEE3;
	Fri, 27 Jun 2025 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751022256;
	bh=ILopEhlpi3Ezeg8jJ09kRy0qj4a+MztRff2cwbyCFPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vy9i0A8cL2ZjxXzbz19E5J+jC1wg0IdB+sMIxrILXvSbcN/mpOqZbHGCMOwQElk4b
	 V4KsRKKvZNtFTNkEMtyv/z8uJ3h4EngYfas/CncPPRw7Oj93m9ZJb1CgSIbUAb3bMs
	 b8C214qGctg9UiZzJkKHnD0Ltwz0w5VYR4VFGMpUFyRX+B6bxM/0bsJbGXBm4KGuAG
	 /h6Tqs6Vnxps8wNQGrlNpARvOAH9/OKg73LXn+TYp83XeMIO5GUb7yg4/6A+tVn6Ag
	 9QHYPsB3oI6hYsFJRC0Ph2eFZqOn4s8o+wAIu21lMW0mOxRPTH4SSFX35KdxUQCpg8
	 3CGqRLgQLK4Dw==
Date: Fri, 27 Jun 2025 12:04:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
	alsa-devel@alsa-project.org, baojun.xu@ti.com, shenghao-ding@ti.com,
	liam.r.girdwood@intel.com, lgirdwood@gmail.com, robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <aF56q4eOqFdy7rsr@finisterre.sirena.org.uk>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="90qajOVw17IHWpFd"
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-2-niranjan.hy@ti.com>
X-Cookie: Do not cut switchbacks.


--90qajOVw17IHWpFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2025 at 11:43:30PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The patch adds supports for Codecs(DAC & ADC), ADC only and
> DAC only configurations available in the tac5x1x family.

This looks basically good from a driver point of view, but I see there
will be some more changes needed due to the DT bindings review.

--90qajOVw17IHWpFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheepUACgkQJNaLcl1U
h9Ciiwf+PegXUaWt830Lu6e+CvncsslfB6PB+MiJe2C+Yki1zkMxYh/7bwkRjti9
dUal9lk+Iiazjv8BzYWmtKRytZFgKZFOabl0gNWiq+nKn8nOXzvPkSkmFtDNYJqC
5BerNIJrxomntBEimgLHB44Q4IlYC207EeaBHPcdQRWEFw3KSQ/MVbnGf6hupE19
7KOMvPjM2yxSDHe8qhZT2qasE3Mz4S/NpYCknvb8sccDVpqMmOKvm1aWxz39w6Ev
fmzMuxvwn6mahln7YTiOHcLDk4hz3FOtzorNJpPtK0dg5Q6BF0tqvGP7rtiGX47D
DVOOWMdOxAxmxofskITqSLL9efGsVA==
=B1lY
-----END PGP SIGNATURE-----

--90qajOVw17IHWpFd--
