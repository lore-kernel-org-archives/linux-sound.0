Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D963FB7C7;
	Thu, 28 May 2026 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990970; cv=none; b=IxhIaMhbg8h3FNX0tsC28QwqKF3zzD+dnKGpd0JjSF1OaGUzOzaI6gMd/PneorKXqTSN9CB+l6PRHqiFg/iPu4SMdod+zKaWTEjevU5I97j6y0+x/SAimkLM5VtYs1t6T3bE/5FlwjNIuTGojqpR+OcxHJVZB3OVFia/uhdB114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990970; c=relaxed/simple;
	bh=hD4iiumxDI2yKnZRlUrSG2ILyqA3GwwX/9dF8JJTs3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQdltE01HGE95mMUv4L/4LdNuT98wPfKbjGUhaMjj0aUtpLO4DMDsGrYlqj3zb7RPOR7z8j2T7pEbyMExUdbQydbBZVmkRMP6rC4LLpvIJ2Y1b35dCki36dItmeNWCtDF6wfDYR41jJWygNHn/tK3B6yXosYlyyM3ZDD7+BXgi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nj2mXY55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nj2mXY55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61521F000E9;
	Thu, 28 May 2026 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779990968;
	bh=UDm1YYDKAAFy2F23yuW7iPPd9IWz3ZS2ow51IA2FAEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nj2mXY55k30XJjm4apnsNPU7rgVGbToW4qCQMAT9t8q9IRZPB0ZBaf/snwOjuP6og
	 fCx7uAMzPWwdvVtYe04j+9DRa4inzRVTjC6N2BJwLABJzLCuiSF3rfA7JqsFhQ9SXY
	 s56XIKI9lhkqcfPfk2+szvgS+9dFme89knWaeHI8npvP2rNj7VUkic6rc/Lf40yoQD
	 uR1i2pmYTn5lbDqwJfiF8v7+ENNs6lOOpl6TJB36HwtiU5yir0eXoHaah8BvTRwzbJ
	 uD0T614laPMjvZBh+uLdrqI6lltchWoX5O2FsEtZUkK8+NrWLgyxivJVbioU1417Ib
	 uRbJ6f79XD66w==
Date: Thu, 28 May 2026 18:56:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Share common SoundWire interrupt
 enable/disable code
Message-ID: <1496c182-576e-4ed7-b98b-390a6841c74b@sirena.org.uk>
References: <20260528145827.137898-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y5vU5qvblqPHCGP/"
Content-Disposition: inline
In-Reply-To: <20260528145827.137898-1-rf@opensource.cirrus.com>
X-Cookie: Someone is speaking well of you.


--Y5vU5qvblqPHCGP/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 03:58:27PM +0100, Richard Fitzgerald wrote:
> Move the duplicated SoundWire interrupt enable/disable code into shared
> functions. These functions must be in cs35l56-shared module to prevent
> circular dependency between cs35l56.c and cs35l56-sdw.c

>  #include "cs35l56.h"
> =20
> +void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral)
> +{
> +	 /*
> +	  * The read of GEN_INT_STAT_1 is required as per the SoundWire spec
> +	  * for interrupt status bits to clear.
> +	  * GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
> +	  */
> +	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
> +	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
> +	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
> +}
> +EXPORT_SYMBOL_NS_GPL(cs35l56_mask_soundwire_interrupts, "SND_SOC_CS35L56=
_SHARED");
> +

This adds SoundWire usage to cs35l56-shared.c - we either need ifdefs
for the !SOUNDWIRE case or more dependencies in Kconfig.  I guess the
former?

--Y5vU5qvblqPHCGP/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYgbMACgkQJNaLcl1U
h9CpzQf+KKzUxFx6yDnHQK5ZMkDRIB8fN4o5GUv3SWTg9WBuOhJr7jAFlog5L2rZ
5Fs9aunKHffKMVA+Qw8NohuO0UA7DK7HScPtPaQfrEPbwYyyKsMcn+lxKqnCwSU+
IIs3AFnxUC/K3qEjmbPiYlvIIAIyP4g9FrDSPfAV88nWNxJbeNFK5XWBqhvgWbnT
CsXFYj4WiMfjZzlw+yfTtPtjGM+SaU1d1Hxm2MDMkziEpiHjnmqXH2IsP3RqUHV1
tWzFDa0kX1MA369gERZ5VE5ErMMz31x1ZfSaX0WWimy8r6hLyrujL61LitX3vA1a
xTsSLtuo5E04noEM681CleiAokNLeQ==
=jykr
-----END PGP SIGNATURE-----

--Y5vU5qvblqPHCGP/--
