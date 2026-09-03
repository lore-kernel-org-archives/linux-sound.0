Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A4749483A
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437216; cv=none; b=BY4xflBNF0ORNho4SlN/z0tMbUkt+3Pk8V6cptibVCgn+bMlvWr+gJdHLNUQrM/ISUjKOEbhobGVu9wveNfbkoke6dahnmlI5nVJwM/A5Jegtg8/PY3rzFmyNkhmWMD6UdKSVsGELM4RJcTCn+QEYLadEngbh7g5CjzyZL0iI1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437216; c=relaxed/simple;
	bh=g6q93ChUYLuONoJSIxom57YcE7/xEFVmhJQHhWol/yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCzTEE2rAOmq77uQhxhTsFUL8Xy09aThj0QN1hXDbkO55R1Ih2e6ca0IUDPrCp+hMfRaEKhv5qV40JpU14P0LdYD7MqBhP/OuhbgwLn7o5gVhYKwLV5fEZqGTy7WpVCYtYiFZ34dkmypU9GB9S5BlIKiavO2h3qFC8II1AoD8vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jY/0uuZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jY/0uuZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD80F1F000E9;
	Thu,  3 Sep 2026 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788437215;
	bh=M4wWqFGGen0W958cVnag8PQoYeb9bgQQKBmuacCCdRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jY/0uuZRIZh8jpp3fab9mgbZ5O6VmBqYPGeS6wDk8InrVSdI1U89hyoStTnlUWNDW
	 gJNmqrRwkeFCZSCTuCC2ITSKDy+drymoFp+gN1ge3RTkiJ1xQ2q+drFdIAXDtTEXsK
	 EK6UhwPLfdMIDSFQelurc5qepYY2QofMMux1uXMH8Jvg2wypuedKv69JwPTGZw+t5U
	 D6M5cIZf3HFYlD4YiIPORb4JJhIgAc2+W7SwMaHvwyZoUEw4EJFDOD17Wfnkgak2sl
	 sbGLgB99nkqfhuIWsADfYnu1TOd0WICRRoTrCFLqyqI7DWT8X3WCZeOejwHC/hegeg
	 FpUMrMK3hffjQ==
Date: Thu, 3 Sep 2026 13:06:51 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH 2/3] ASoC: rt712: fix uninitialized stream_config->type
Message-ID: <7ecf49c6-91a3-4b67-8cf1-51df492ff0b2@sirena.org.uk>
References: <20260903111300.3830237-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jFL4mGcmzTePdyWZ"
Content-Disposition: inline
In-Reply-To: <20260903111300.3830237-1-shumingf@realtek.com>
X-Cookie: One picture is worth 128K words.


--jFL4mGcmzTePdyWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 07:13:00PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> The stream_config variable was not initialized before being passed to
> sdw_stream_add_slave().
> This may cause unexpected behavior when configuring the SoundWire stream.

> =20
> @@ -1449,11 +1450,11 @@ static int rt712_sdca_pcm_hw_params(struct snd_pc=
m_substream *substream,
>  {
>  	struct snd_soc_component *component =3D dai->component;
>  	struct rt712_sdca_priv *rt712 =3D snd_soc_component_get_drvdata(compone=
nt);
> -	struct sdw_stream_config stream_config;
> +	struct sdw_stream_config stream_config =3D {0};
>  	struct sdw_port_config port_config;
>  	enum sdw_data_direction direction;

Do we still use direction after...

> -	stream_config.frame_rate =3D params_rate(params);
> -	stream_config.ch_count =3D params_channels(params);
> -	stream_config.bps =3D snd_pcm_format_width(params_format(params));
> -	stream_config.direction =3D direction;

=2E..this?  Some compilers will warn on write only variables, not just
completely unused ones.

--jFL4mGcmzTePdyWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZYtoACgkQJNaLcl1U
h9CfjAf/baj3W4AY48USzRUTJb1SGOApYDAA/diluWsxamQ3RIBQthDVD6i/L5Gi
4NtlMbWK2BN2WqzKYcd9Hm0rs+6vaR6KORseGzLuInRKwASfwpzHs+die1n/N94U
jVcu0X03YhmEdPD1KOq8/+xaRBYAMyPAzEzZBr3O+a+k1nAqEo9yaJ49FaiG3kFd
JejSHx4TgLVxxrhsS1gyifttQVgxTcANSQqWQg9ikmCFuYig+5mFXn+/TDeILyTc
mvqA9jHQxTkU45V/EdJBlnHqHYLpQqM2aoxZQHh+kpcRwr3TdNdLtiLQC3U21d8b
cvgzvw+tjoA05qfMY9vvCkDGrxpv6A==
=Kdou
-----END PGP SIGNATURE-----

--jFL4mGcmzTePdyWZ--
