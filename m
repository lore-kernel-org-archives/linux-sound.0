Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF237C0EC
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250241; cv=none; b=Juh8AXQLPbfq90wVfMVJXpf5wL80mgNZlaN3Q412i60CDt0IW13iwjtf3r488twbSbUNtnUOwybS9w04Yur6bTprQckz3l0ByHPwqvfgpwInFi8H3G1FVxArS3My5T1/iukMgEV+xj3zJ50MoLSNE6VN30aknfziQ3yAjLg5gB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250241; c=relaxed/simple;
	bh=xgLZ6ydEdxbm7XtxVmmjX5AJUpXge0zzzM7UHp0ej2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHtTGYT2OV4WNKofuG+LOw07Mn0WTQbzPW1My80h60T8wJ8bClApog5ozIfGgB0JXD/KB5XqIuei0sUBj9dMlX0uQW12+W4G/mAO2PzXlYMLsq++zXbPNBhlC7Lr7TYcplIv693KsG8BXtfTeILmXAh4EePyCAPKSrC85fal9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jn4oyUUm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jn4oyUUm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso4937485e9.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781250238; x=1781855038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Rxr3RDnrGDap9ET6pVXLfD4X7lIkVPiU/6HValFYlE=;
        b=jn4oyUUmU8lFKGSp8oNixWQduVa9uqTC/hdb2bhX0boJZxKCDb0/eV+xtQZ4l6Nesf
         W8cHOolrQsecZGM7VsEqIXPjkK1dfRymfFFz9625BqO0JQYOjWacLgz/vcLMPY1xsCpl
         BfXdbTqtfZIEgCNoZhDnuBxd85tCgSPN9VC3KgkBxgZiDiDAIBOl6OuVQO4VxwnxPv3O
         Dq4qaTd/LH90YPNQOfC6Vga52c2DiXF4TZk475KEWMu88PkhIWGukXXEH1F3r0FJbYeq
         4QfEHB8gx/GA8C3rxokF4Or6OEb/LAhyU/uUn7NlId47MACyLYDcArYE/Szisgqxt5Y1
         k65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250238; x=1781855038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Rxr3RDnrGDap9ET6pVXLfD4X7lIkVPiU/6HValFYlE=;
        b=QkQ5TftXLYn24vGX0tRqWkEyMlglt/o68MrySzsyhoUVHc6vJNOSHLcCJ4/XP81DH3
         lrhMKdoNg12ibErdPMY9NbcS1CkuUU/P6/egiuTwIKf0rpLymU3W+GGrvxTlGDKKU087
         3nx2w1iF+fSYN3ZFoSkNUuntd9WbBODbd2TfHcnwcEtDLwCELKd5GSqsguM6maZYwb9S
         uifZl2tXxF2lSSOnBxi6lOZ/knceo1EYOt7imSCbZQM2XnJDgCD1SYytfyZ1Wuu0vWk4
         T/Ikr7VjGCycy5QgXlfS6v7qvW9y39UW5VxPzxAaiXM7XY62LG3UhHiNocbW/WKR7Z7f
         EnFA==
X-Forwarded-Encrypted: i=1; AFNElJ/HhcTfK2As1UNKMYyqdUD25UcfeYVbV/2o0MWUkdaO/bNfsZmIVhG05ibkwdbISKJU8Ktv5P6aKwtLBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YL88a6iMQQ51jS2uEJAjULVScnQmwl5UJjbqgMEPzDKMY6Yz
	r5XnBx9mJXC7txi9jFsS/ytYDGOkuE2A9ZkvwSoOc5oagIi7lhpEw+hgfeOu0noMnEA=
X-Gm-Gg: Acq92OFj4rWJiHCr1pYHSNf6eYllPh5QwEx282jNu4GFYpfErm2vPnvxCTI6DGlvl9U
	3UROE4IZjo6/qXpjPE1UwQluVD2Ofud5mk1xhyJd6xTgN/ezQx99gXVkfBhxCm8G6+oxMdwriue
	+EIa5iLa6WuXUFQjhBaf/uBI3fPCdHgD9VGtLfGbdbF9mIhqUPFCpRdvR0PAL7H7VFHARsy+ZvL
	3xd6ccTMF/4ZymoUCSXuS2vVX7WDt4COF86gkySECIBgLB84zbz0ag7JTc/XI0PHhHZZqhrx5Rr
	+/UgSvPcdSfLzGO1jPMN+1TDbUCPv86Il7zhxkqrR8+A0DFQ10ZPQJdh5TPjQRA8yGE6aa7YZyR
	QA8ZyAKchFpq75lSsD9rja/bT4N4NGojf5XM3X+ZtuYjd3BYRhp+5ET9RlaZhFXVOS3OrjHooxz
	Q9+n2R4TH4A+NB8DkIic6domc6gYU0cFk0LW5Z1aKT313IWk3I80OWnp0BQecMkWvu9EQ0qbSLD
	JfsdFNbW4Vf9g==
X-Received: by 2002:a05:600c:820c:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490ec4cd08fmr20296955e9.1.1781250238091;
        Fri, 12 Jun 2026 00:43:58 -0700 (PDT)
Received: from localhost (p200300f65f47db040e4e5c1e98e7f0ff.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e4e:5c1e:98e7:f0ff])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490ea7c09bcsm44786175e9.2.2026.06.12.00.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:43:57 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:43:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
Message-ID: <aiu4T1HgDW8xl2nC@monoceros>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
 <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="33zssqxog3lq5pt6"
Content-Disposition: inline
In-Reply-To: <308c08c0fb309c190412f5ceb21b0027842b6294.1779958164.git.u.kleine-koenig@baylibre.com>


--33zssqxog3lq5pt6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/4] ASoC: renesas: fsi: Simplify driver_data handling
MIME-Version: 1.0

On Thu, May 28, 2026 at 11:06:01AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Instead of hiding the fsi_core struct for the only supported (non-of)
> device behind an abstraction for multi-device support, hardcode the used
> pointer which gets rid of (open-coded) platform_get_device_id() and two
> casts.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  sound/soc/renesas/fsi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 8cbd7acc26f4..efd1447eacb9 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1905,8 +1905,8 @@ static const struct of_device_id fsi_of_match[] =3D=
 {
>  MODULE_DEVICE_TABLE(of, fsi_of_match);
> =20
>  static const struct platform_device_id fsi_id_table[] =3D {
> -	{ "sh_fsi",	(kernel_ulong_t)&fsi1_core },
> -	{},
> +	{ .name =3D "sh_fsi" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, fsi_id_table);
> =20
> @@ -1929,9 +1929,7 @@ static int fsi_probe(struct platform_device *pdev)
>  		fsi_of_parse("fsia", np, &info.port_a, &pdev->dev);
>  		fsi_of_parse("fsib", np, &info.port_b, &pdev->dev);
>  	} else {
> -		const struct platform_device_id	*id_entry =3D pdev->id_entry;
> -		if (id_entry)
> -			core =3D (struct fsi_core *)id_entry->driver_data;
> +		core =3D &fsi1_core;
> =20
>  		if (pdev->dev.platform_data)
>  			memcpy(&info, pdev->dev.platform_data, sizeof(info));

With commit 38d3273075d6 ("ASoC: renesas: fsi: remove platform data
style support") this patch doesn't apply any more. I will wait till
after the upcoming merge window and then respin this series. (But if you
take the other patches until then, I won't be angry :-)

Best regards
Uwe

--33zssqxog3lq5pt6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoruLkACgkQj4D7WH0S
/k61EggAgll/pk23f8RfaCUiIfOyRHFxGAcldRRnRxxCMNzlPUzrpNxBfDyxg2y7
DAMOlGiBXys0r4vCUHYvDH+ShS0qQifZV8oNXy3r/mRaRRP20Fw4xhopzGiQUYCQ
aDsBs1NOQUaD0VraBA53JBkLQpL2I7osSlq62GgF9n1dkL0qIXgK1WNYaLc1QT5l
oUzcBzyGVrldHnG5D8TMfZRAx206Kamj04Qki7zp6R7QG0IuiuIq4IMd2006FMES
uBi/B7T1fctq8uLYMqkBwAbyy3mYsaWEpIfAYCi7GjJwpmPhnd6FiaQ24sWnRHvT
sboWrBbS1d8HbAmFGsG+Ed4IB3xH3A==
=3Yia
-----END PGP SIGNATURE-----

--33zssqxog3lq5pt6--
