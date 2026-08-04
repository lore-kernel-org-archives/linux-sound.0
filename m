Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E36481A8C
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864733; cv=none; b=d7VJAHZ4a9u4or1lr1uNKIvEkZjC5lAjVTT9EbVWiFT3mz+Ahv8iT0cLCfYoQebpdjMnYvBbgrmj4Ak4G30mfqwU+EyOJKJY6qbKNk1qG/ngJdftqhgSVHYrFxC9ojNH8dTMNqa93cXCOuBk+9Gz68vIqBcnVfqUn0hoRxhoR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864733; c=relaxed/simple;
	bh=dde6mBdLPi7s1r+c8LeK4eCe3bAGSo2LDbuabJ7Sby0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NujRvLWWPIs5Fb1prMz7BolkiWX+5nHOFgCG8oS79xRZkXMftZKuFfrWpEHfUVVZWBCtPY2X2mPoAR2TuxyHcdqn7jb6bJHprBg64RL0Rqpj6yctwimEI4ubepdAwYhTqSa7Dp+NQne8yc+TOErG2Kow/3tQw5adZ2IsGU0aLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpMAibBx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpMAibBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D34B1F000E9;
	Tue,  4 Aug 2026 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864732;
	bh=o6Q6elsInYpgLy+55oQTg7YH7ifUP62k/efuSxnoHLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpMAibBx0g7om36C4OpGNW/KIIUwQ6BpWAqpQePUOmoZYYs7pYuOMWzRgpCC/MBCO
	 AR8BD+r0aCWZj5+dAqdSpaGo/cOF6eT3yFZbC+LjFKRGe6CsdUxgGDKfy6/dAsz64V
	 ZSEXYoXs2Vhi0pz5e4MSfMNTcVK4pmqgGNSrgxdZMyLmIm+21FsJ4+BPlal2E74yg2
	 PYMQygkkKgv6tkpuys70FRMbs0neFGO7dT08EdrNBj/tlINFtUhVmp4L0YqyaVZ3yI
	 ukHqJcq5RzkFuINpBBiIRK0cmk3phmkIn75ccpDpRk75j5LKKg01tzNP7lSGowmkB0
	 COxK6smw3m6RQ==
Date: Tue, 4 Aug 2026 18:32:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/44] ASoC: codecs: cs42*: use .auto_selectable_formats
Message-ID: <f128852c-550b-4d06-9873-9fd5d363990e@sirena.org.uk>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87tspawwci.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOGAHJ2tkhWlJktG"
Content-Disposition: inline
In-Reply-To: <87tspawwci.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Biz is better.


--zOGAHJ2tkhWlJktG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 12:41:33AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.

> +static const u64 cs4265_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>  static const struct snd_soc_dai_ops cs4265_ops = {
>  	.hw_params	= cs4265_pcm_hw_params,
>  	.mute_stream	= cs4265_mute,
>  	.set_fmt	= cs4265_set_fmt,
>  	.set_sysclk	= cs4265_set_sysclk,
> +	.auto_selectable_formats	= &cs4265_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>  	.no_capture_mute = 1,
>  };

The device has issues with _RIGHT_J for capture for some reason it seems
(see _hw_params(), some of the other devices look to be similar).

--zOGAHJ2tkhWlJktG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyIhYACgkQJNaLcl1U
h9CBuAf+Ie+YaSEeUkgzN7GRPQ5NBCwDxLAR1QvsK+ryG/h9xnVl2lmlyMTf54Nm
wcqhFL62O9SADfsZnBIo0IES/Z+Xni/H19H+rFazsx4KhAtJsYR0WOK8K3/ut4qG
993t+0ggfDbGM0AyhpDgoFsujmk9KiBGTHQ7eqEZp0zDvyeMrnTvPDw+fySqKk9g
aHYX87sJKAoYSaytCUvgKBh7ldj7WFMn/kq6lhGSIydasR459nX5yWNWm2G1AEpM
bbZbkM2t7slR5MKWmGPGEBy/jIFits7j05eNNWRnTUinpmGAAt2+VDOw6b+dfNIm
cLEGpUiOONCzWDRnjMRwHhF7rx4Unw==
=fYlr
-----END PGP SIGNATURE-----

--zOGAHJ2tkhWlJktG--
