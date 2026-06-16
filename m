Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66BC313272;
	Tue, 16 Jun 2026 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606916; cv=none; b=Ffm5vOGJxydAeIXrH7KZ21Tt7wKrQjTYSit1bEk8P0XdZKQF4dw38cqBNJfYQVS8f/RI+oq+bUG2aHYxuj1o38SQm1+8G6Y536GhgEl7anwOpCqPC3OkwnJs0iRio32d8SexNF3JxXQuj6LgKNdEJbp/oA1StmUcafPJdyOzFM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606916; c=relaxed/simple;
	bh=QqrCbBiAhi1PKEmfvDv6761Ic0WSeOU/NxuQpriL0nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6ls1HEvExlDYwe+pWAUl21qewFzG0MiaMoaCx9oeUasmN6OmKoGasU6h5VdZNp/Gq8Un8cyeBuWwjN+/aikIinml8tCStxgzWp8yzECnLtT0btfvf2h7gy4gKY9z5hTbWy0NZCS4dFwhbgAAysubyeapi2CN3whQxYUWpnX/Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XViuzm9W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XViuzm9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEF01F00A3A;
	Tue, 16 Jun 2026 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781606915;
	bh=lHAFcW0nG96oh4/5rGfxXXQpPFLmRkRujWnlOBdcS5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XViuzm9WsVpI0YtxUgSlGg544D0RfGK5rUhQFyvC1lbqfi6GlR0aR44R+y+/zS6zV
	 odUuEINSC55wyGU84DBa9UUb0VcMuDCKNAvZ4oKUpt81wD64chqA7tPgDm+N2pFEXP
	 ptlTF8Er7gxBp244++ukyTuc+4mEQn0R6PaWEcxVt2qGu9kUXkZ36o5Ns9NvO09Sf8
	 djOVXfbcrBYKkw03Gf1MfPxgFNajAnsZuH8hVpY8yqIdEgRYPW8qqgvaAcuu4zMrhW
	 dJ69LX3UDo6ijvzbIbhTh3BRxWifkPLhh7Xo+METipXWGsm8w0yLqS3dAYZezNTqyp
	 zN0nTr7mkhhxA==
Date: Tue, 16 Jun 2026 11:48:30 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_audmix: switch regmap to cache-only mode after
 probe
Message-ID: <a5a652cb-d6bb-45a2-a1f5-ca540b34c115@sirena.org.uk>
References: <20260616030038.4170204-1-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0QxAaZebDU/txdAX"
Content-Disposition: inline
In-Reply-To: <20260616030038.4170204-1-shengjiu.wang@oss.nxp.com>
X-Cookie: Password:


--0QxAaZebDU/txdAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:00:38AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> After pm_runtime_enable() the AUDMIX hardware block is powered off and
> remains suspended until the first runtime resume. Any register write
> issued between probe() and the first resume (for example from DAPM or
> ALSA control paths) would target unpowered hardware and be silently
> lost.

>  	platform_set_drvdata(pdev, priv);
>  	pm_runtime_enable(dev);
> +	regcache_cache_only(priv->regmap, true);

How does the cache get turned off again when runtime PM is configured
off?  I'd expect the device to probe powered up and then be powered down
and put into cache only mode as a result of runtime PM running.

--0QxAaZebDU/txdAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxKf4ACgkQJNaLcl1U
h9B7dQf/W/e8VMHNcIYJXnNZsr/kx8uz9FBbVMYpPUftjvAh3scxQ8UUQdJvAPbg
tKXGbdyhKSiPUVqpX8l4uqDUYnl7gbtwBYJqto2bwwg+iiGyo2PX/tXPpwODzAqY
LIXtws7AnKUAJ/biDa8btHIRjein0m496mC31pphbg2roK3Ohx0WVrq9kjV/IeBO
LlyxMHSeYr+4IEDhjvifa2+kMH+4JusPTp5Mpg9uU6Y9viIsgbX9lBmTY+VVEVST
6WlryPoyIxSJ+U8+N0UyjqkIj/OdSS8Hkvb4PCEMryn1EqXiqJWFqUXpDdEvLn7e
D5lh6XRTEOuKylHknmTLPpepZcx6uQ==
=7epm
-----END PGP SIGNATURE-----

--0QxAaZebDU/txdAX--
