Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200923392B
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829562; cv=none; b=gaNh2AontJim5aPx5Tvi7rzDa2eo6m1U+u8Q9jO2RCvwvqM7lc3ixRgR2DcJt5PJ3aFTjiZ2TV7ONhxCj6VBkKO60fWKqAZ+jeyV0srzh5iNWrpeXf2rMSr8YLucoJfNIeXyjFvZfPm6oCucRWGbQmuGpCbLTqf7Q+QloVwLSIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829562; c=relaxed/simple;
	bh=BBAsAABURvVuMyDFM6m1n5UyI3aYSRusSuK27fdJnto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mcrf8uq0IQ2VBo7EFUHoz912riVfA8IGNdGEyr04PpoYKyWVp5SROfunanQxAttR9AMW3266EA/R/N59c0wyamYTyWrgWTOzzo1GP2AdZohMfQYlmclD0kDe1SazySJqNGBRljttM+KX+qaoIrXZJWxTrtqWfPR++4/2OTouuWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4Y8bh/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4Y8bh/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03791F000E9;
	Tue, 30 Jun 2026 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829560;
	bh=0ZYaeC89HgkKShVoB3obz2slzfIZEgSNaILe5drSI1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c4Y8bh/StxU0NSgyoR5NyOTm7/jernCOsYsR8de2Y7+XpDWVHuortTFFc5E7dzjHE
	 6JIe6yVaPKSr26jPZSI5skdQdN5ezv4MCc/KiFsqqQYpUTEQhFDkQ3DDO3KEfiuro6
	 DpjsRWO6OTBtLQtvomtlkNKUsN8HvHxMIcYGUOiGvJ9bwysmVKeIiKyeKlM9653hpR
	 oN5sXQyDqqiOmpRfMg9FLn6mqIxawSHwP+Jp/6kq7t6AUnx4KAtD2wqzCBfVpoWNbq
	 ck2IPELvvKAA1PHQ32HlhozJZ8+Xc6PKDWKauXAy5FrD4Vyq2gmNNw561NiZg1FY6V
	 rGHPmC0oDdKSw==
Date: Tue, 30 Jun 2026 15:25:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/12] ASoC: simple-card: tidyup
 simple_util_parse_card_name()
Message-ID: <d1fa5017-9df4-4479-a9c8-cad124eada38@sirena.org.uk>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
 <87y0g1dddl.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jwmjK+nc48L9rrMf"
Content-Disposition: inline
In-Reply-To: <87y0g1dddl.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Air is water with holes in it.


--jwmjK+nc48L9rrMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2026 at 06:28:22AM +0000, Kuninori Morimoto wrote:
> We can re-use simple_util_parse_property() in
> simple_util_parse_card_name(). Do it.

> -	if (!prefix)
> -		prefix = "";
> -
>  	/* Parse the card name from DT */
> -	ret = snd_soc_of_parse_card_name(card, "label");
> +	ret = simple_util_parse_property(priv, snd_soc_of_parse_card_name,
> +					 prefix, "label");

This now has the prefix applied to it when before it didn't so the
lookup will start failing.

>  	if (ret < 0 || !card->name) {
> -		char prop[128];
> -
> -		snprintf(prop, sizeof(prop), "%sname", prefix);
> -		ret = snd_soc_of_parse_card_name(card, prop);
> +		ret = simple_util_parse_property(priv, snd_soc_of_parse_card_name,
> +						 prefix, "name");
>  		if (ret < 0)

This already had the prefix applied - we were trying both prefixed and
unprefixed names, but now we'll try the prefixed name twice.

--jwmjK+nc48L9rrMf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpD0fQACgkQJNaLcl1U
h9CluQf+OaxKGFzUDqBPGUyQKYPde5HTRRUVega/n8do6FDxDGGSBLtQqPM+QEmk
vv5MhOsCWKXd3Vd8gWkYvxomd7AeR5OrV2IbvdX69JmFDtgHcLDgE4k11ngmNpm9
16VWaZaGHIw9/wANZz3anAWMfUZj/1zHxOBKwqX5jN8InbIM/jmo+SRyMKLjtprf
6hJHSvwGF1UpMJb1+ZoyvuKg7Gc8i2nfMTi8uQwPrCwX84QwZOwgZbfc1Y1Ab4tz
d427FALt+fD+MkfyfOVlTBUWRPsPGKzicjHxdUSnDn+aLvul3C5lmyNb+kvESF7Y
xGb+6kconsPSH/EjFYkLTm9oi12RNw==
=YLTL
-----END PGP SIGNATURE-----

--jwmjK+nc48L9rrMf--
