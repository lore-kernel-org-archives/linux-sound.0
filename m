Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3261FBEBC
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801012; cv=none; b=O8Qegz/X2O0SACqPZ2WT32SyBaxVVTZPMRvL7LO8g2vw2vAdnELkUOvV2G89PKiAGVHo6GFu6Wg6NbfEgpT7Rgk6E4Le1hGZncRjYFr2dnHzzvsFD/Mh8oSjSMNQMwhMjGXYRP0/Gl8ae+8xqsYWIj5HdIQlMiNxN15jo7d3yMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801012; c=relaxed/simple;
	bh=jUatT9v4w7olRWsNPaL6Ydq9t2x3xZyLOCqssI66jOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0DLzJnlWSr+3oTwQXjNyyQ/Qzca5liR1ptNdpBjbG6YyZkFYRbolm61T4cMU/wH68pO+QK+biLhICT6+/0lqSCAocxuFn9BifKpcAd2hQNAzJdtu+/fjpWI+V0wUP8oULbvDqUd+OdImR7ZXch0LsJqW2x6x1bWygKwUzdu8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsEeyrHq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsEeyrHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD412C2BCB0;
	Tue, 21 Apr 2026 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776801011;
	bh=jUatT9v4w7olRWsNPaL6Ydq9t2x3xZyLOCqssI66jOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsEeyrHqJhFNP0aRSmgql6ghCcNqcTNpPK4tTV8XKNRs8geDHkLsuWMZv7gYeipTL
	 OOJof7n58Fy7BHKf1i93vlRPIISn/+Xb21zIpaDfj4iNZa37oMMBr9v17uB0d9JNlT
	 Pv7dJmX7oa/sGCesa07SvlhKRUm8c4PlnStNf/oo+3l+TcLuiiTGmvhQMEOGDNAtxm
	 gyWEqTjZlaZS4rcfqoAkrrOdW19RpNR7aNsKyXcoubstlaMoSlQwSHj+wCT5VEAScW
	 kBhPP694csHzOaIWhnSS41arrmlfU7YCahMB8x5LkoCcNKmsidfLmh9DWMnxqDQx5C
	 FzXvpMguWiWwQ==
Date: Tue, 21 Apr 2026 20:50:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Gabriel Jacob Perin <gabrieljp@usp.br>
Cc: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	carlos.albmr@usp.br, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Change manual bitfield manipulation to use FIELD_PREP()
Message-ID: <16ac8986-3d21-4f6e-886c-afdc0709ea8f@sirena.org.uk>
References: <20260421193113.1060213-1-gabrieljp@usp.br>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcD3P89RG+pOrddx"
Content-Disposition: inline
In-Reply-To: <20260421193113.1060213-1-gabrieljp@usp.br>
X-Cookie: Jenkinson's Law:


--kcD3P89RG+pOrddx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 04:31:13PM -0300, Gabriel Jacob Perin wrote:
> Co-developed-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
> Signed-off-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
> Signed-off-by: Gabriel Jacob Perin <gabrieljp@usp.br>
> ---
>  sound/soc/atmel/atmel-classd.c | 41 ++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 19 deletions(-)

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--kcD3P89RG+pOrddx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn1O4ACgkQJNaLcl1U
h9BcTwf/Sb4g2CeFJw62AfZzA/9lXogBhXoHMW8RCQp8zr6Ja7pW/Gdj3uJ9KFPl
UsHhV+r7+Cn4BswcMtOeKaeUGTCD+FW/ZhYRct8+ck0Sn+o/BMvSaP4WrzwzCJ2K
TxjQU5bc2+UWePHd3Em5GLc6Tgc8PDYucMitsrjV/g8LKYNTbld8kNuKOr3REZgE
EM2HCfsDCiamuBUrHrTiEv/yuhC18jMZJBvi6yPRu+Hu/gDFSsH1+2/k8ZmLvzUj
nKRhI630Nvp/D3OR0ap41h7eaxIAxlLFrRG5HK26yi+NNkqAZAb8+DE9rLY1Ikwy
o74da2cqRoSKtN7V+exICt8pjn/Uvg==
=PUmu
-----END PGP SIGNATURE-----

--kcD3P89RG+pOrddx--
