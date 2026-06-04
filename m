Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B540962E;
	Thu,  4 Jun 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571141; cv=none; b=B+AQqQpomEYJEEUJwmvS7cVPqJIK4kURkYVMAX8KW3IdW6pMYFO69tzPsBZN9h7PX2POayBEpoKv3+BNory0F2AE6QjPSVB2H/gIXF0Lp4CxJYyPxdpI5zmsapAVqZXXktQaGWzXM0G3jYFd6K5EJYz0n+oVI1l/aWIq3IeXzNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571141; c=relaxed/simple;
	bh=WQosOY0FPKIb4m0ZBv2aAmL7SsbwHe3LP/V4aivt6qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWVAmKJhTChNktr7FrbNpVy18P47WinWFvwyrMAp4keuBHCw11DIwWK82tpmC/9oJi2TKsFDR0YOKzVxTOUE4BMEicbR7DngpyJV/t0zK7jWKyiyhYuU8bc6gCIYCKaIkfrPwtN7JYAqkDc7Tk6QXSKalMgEphy/fz5VIXZhSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddXIjTe+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddXIjTe+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FB91F00893;
	Thu,  4 Jun 2026 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780571138;
	bh=7/JneShqByCmf/uyvPj6YDNNPTALGKtoMobR+S/Or0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ddXIjTe+9ys993wStzA29zw3ZOlm/h3JY+yAECpLv66f+Mb/j+Q/MyeL4uhcg63n5
	 WhqHo/gkDCVsCpo6ikOcfpE9XogQrBGAOBLVWq1iqkTRwov8ZsYp8xm1Bs0O0XR6H6
	 ukEC13gboXqdRYWGpTOWk7eGo2nX+HVqM/fnmsBmMd3E92+ttk6kqGmD5PZmJdQXrz
	 ZHTw6p0jNRDW4dZkAKI2frkzF7TpyltAxCywEiIPL/pzW8/TQOZ6Q5mocVw0konkpb
	 8nv26PmWp3wAO17ZgJjQu+el85s6WWHUqT9k5E9EasjbucHONCNVTCqgYuYBzqtmiA
	 PUbsURq1Wjttg==
Date: Thu, 4 Jun 2026 12:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 04/10] ASoC: rt5682: Use new SoundWire enumeration helper
Message-ID: <022bfbf7-aa10-497a-9d3a-d4037c266d0a@sirena.org.uk>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
 <20260603144443.593230-5-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0IJ6tYOfKiULYpPa"
Content-Disposition: inline
In-Reply-To: <20260603144443.593230-5-ckeepax@opensource.cirrus.com>
X-Cookie: Q:	Are we not men?


--0IJ6tYOfKiULYpPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 03:44:37PM +0100, Charles Keepax wrote:
> Now the new wait for SoundWire enumeration helper no longer depends on
> unattach_request it is safe to use from probe time. Update the driver
> to use the new core helper.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

> index d39f8e4f3474c..4b82e07d3b2c7 100644
> --- a/sound/soc/codecs/rt5682.c
> +++ b/sound/soc/codecs/rt5682.c
> @@ -2929,20 +2929,14 @@ static int rt5682_probe(struct snd_soc_component =
*component)
>  {

> +		ret =3D sdw_slave_wait_for_init(rt5682->slave, RT5682_PROBE_TIMEOUT);
> +		if (ret)
> +			return ret;

Similar issue here with !SOUNDWIRE builds.

>  	}
> =20
>  	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
> --=20
> 2.47.3
>=20

--0IJ6tYOfKiULYpPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohW/sACgkQJNaLcl1U
h9BaXwf/XeLAu59JutgO9HixR6cJ5fuDE+Ma6K3ezwMf35ODi9JN1s6ifL2Y9s/2
cnRNEukSY/n02TIRWB4GuG8OJfYq2Tevtj2XwQFmW1f+vp33MPcXsYVWA7+brUKR
jKq4STwvDqm4cduV0i7+fKKK3yQomKLoaE7mXXQlf4UVTAzWYPkhENFALOeWAqeT
XmwK74wLirjbFsVHZRMNZGuX6byicv+Rx2cETIehF9KQ1uvP/DesZ8nKKuV8fToQ
9V4G7vDUuJhnQUIF5s2zkQWamy9FCgv/b76KmNPXt/A1Rw8ytjMkwVrAmjTxIChf
TyIM0Ngvzx2bdJYcUpNg8P9/U4O9IQ==
=GWzJ
-----END PGP SIGNATURE-----

--0IJ6tYOfKiULYpPa--
