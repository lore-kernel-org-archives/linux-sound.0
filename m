Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F4B50291
	for <linux-sound@vger.kernel.org>; Thu,  2 May 2024 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714641924; cv=none; b=q7DJTwbSpv8ESRJBOwV8AJX/WJGQT+RwbZk+YE9GVTFvnwUccju/YOdAl1GbTJW6fQGKIjwvjVqp5jxHuZXOIgVwONB2YHCftXL/QwQ4hSuDeLzi40xFJNdU6eBRuj6y3eRM1b9qOJt216u2/LfCxssFWEIrRSZNOGP7/JcfeZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714641924; c=relaxed/simple;
	bh=L+8MSxbbC4GA7RzAdnfcmEm04PpjGSEE0FJmumIjkUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qpj4BGejAa/CwUzggpy+0S31F8qumRDRMkBS73DtvCRaQdxK7YVWeGLZzHMgx7CaCB7HwThwH2+FOo2QDD9EDnnzt1S1I+nY5qFnKGmpIo5ljN5YTi2K+Da7iPRKxQf6fWXVbYmpYJSaxCDycJeEJruG6gA0FWbGPC7M475mPPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s2Sgk-0001lU-P1; Thu, 02 May 2024 11:25:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s2Sgj-00FUhj-Vr; Thu, 02 May 2024 11:25:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s2Sgj-00Daal-2t;
	Thu, 02 May 2024 11:25:13 +0200
Date: Thu, 2 May 2024 11:25:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, alsa-devel@alsa-project.org, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, kernel@pengutronix.de, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <6uj2suuiu7tpomecii65f5lxuwgkhxnqs3lrpa54s2ptsorkh3@lzmnapdw4cri>
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
 <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hbkefkyasb7fug6"
Content-Disposition: inline
In-Reply-To: <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org


--6hbkefkyasb7fug6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Thu, May 02, 2024 at 12:02:50PM +0300, Andy Shevchenko wrote:
> On Thu, May 2, 2024 at 10:47=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > These drivers don't use the driver_data member of struct i2c_device_id,
> > so don't explicitly initialize this member.
> >
> > This prepares putting driver_data in an anonymous union which requires
> > either no initialization or named designators. But it's also a nice
> > cleanup on its own.
>=20
> There are some drivers that have other (than I=C2=B2C) ID tables, which
> follow the same format. Can you also do the same with them for the
> sake of consistency?

I'm aware of these and plan to address them in a separate quest once I'm
done with the i2c bits.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6hbkefkyasb7fug6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYzW/gACgkQj4D7WH0S
/k6TEAf/cw0zTMhVbRaMJYPm3VRPiLAt22Znb0NVIN/ufUGYr42GXzCYXb0OQFOd
4hPA8IzOqykKjp2ZE2oDKEUfA/I8xhBJNSFtiKmVaKgq3VqMNY+hgVSLTeJvENbX
fDJqWLPd9x1sIDjAzIymZQLC+y3OmL/iXfaoaez31Oc4RRHsRhLyombWapJz13jz
CVdaBQMNq9gztxt8iXiaBcws9mabQJdkrzeC7Fv+RzlnTfnTI5T8teN8N3AqBBVP
JO9hISzB2cgrhUrqvYgFbeMjqfFq7QEpQZMNTbZYajJLB7P+l1rMZVN4K/pxD3wt
YyHWQPa/UchR+EysxeN7f2vdtAK25w==
=emKf
-----END PGP SIGNATURE-----

--6hbkefkyasb7fug6--
