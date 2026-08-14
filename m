Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00B495047
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 19:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734785; cv=none; b=AyklDmUIGTppbifpVLcHXPP7HLskH+fRlAyoD3UQNmGrEb3Q2phpI8NZSsfZYFICHp0aYAt7f6LovxbDsEX9+iEP+2IK8qx6dYjSsw4CiaGOKDljda75pmxyjUVyeRathqUZu1/MITcclO3tf5KV8RvljKaV+FetNjLg5v0uKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734785; c=relaxed/simple;
	bh=p3k4uDeW82wgHc/Ng5IQ3jFutkkscaDmKeYtdPRu/IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvhoxCPiirkiIDtSQi/h2slxvVDbIvAHEgRtVLpaTA80sjZGLFyWFFM1hxgzHANGZegNlK60AI8Rgjq+IlEWrbRwLd1w24Zg6t8+ZZpE3Afabt1sfjTIkFphHirHMhXpvJong7Vi2TYMIOXO0ZfyEX+TAA7Fu87qFeEqGfCBuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOQZXoBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOQZXoBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D861F000E9;
	Fri, 14 Aug 2026 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786734784;
	bh=ExcBdJ0VyQNB1c6tij1IFXPZGmtG2W/b9qz8vqICz0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DOQZXoBKAVK2q+KpfEYqyAbWQUZqh/6YqZyH3DXNXXAjNuSwz2WJP6GEMMu+j/Uud
	 Yt31R6UupmdsyWJ9nLqt6TMSAams/S8S9ikYWrniS/8r1HEx3t6Ld1laGaelNtLsjJ
	 gkYus9RbeUn6YJVaefGdCvRqDwl0pEPY8RBa1r+TDnKaWpOHOQ3gUbR9X/1ES3VFKE
	 /08fHxzCaS9RVOhe54PDjJv/3Ic/xUMdDYXEA6DBkiDpAs2TtjF9BK9g/sENZLFvO8
	 EK2MWQoldC8P83ZPCplFMR4+boLTJqt84T73q9gxf2yl1PhePgalDFoI7YUsplUhkf
	 uV0PlcdGusupQ==
Date: Fri, 14 Aug 2026 20:12:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH v3 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Message-ID: <a6df9a90-f1ab-40bf-9fa6-c82473919b7f@sirena.org.uk>
References: <20260814025653.5484-1-qianghua.wang@senarytech.com>
 <20260814025653.5484-2-qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="30tHETMPpBPt6355"
Content-Disposition: inline
In-Reply-To: <20260814025653.5484-2-qianghua.wang@senarytech.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--30tHETMPpBPt6355
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:56:48AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and
> extend the Senary MAINTAINERS entry for the new codec files only.

Actually this breaks the build, it needs updates for current APIs:

/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:412:44: error: passin=
g argument 1 of =E2=80=98sdca_asoc_pde_poll_actual_ps=E2=80=99 from incompa=
tible pointer type [-Wincompatible-pointer-types]
  412 |         ret =3D sdca_asoc_pde_poll_actual_ps(dev, regmap, fun, ent,
      |                                            ^~~
      |                                            |
      |                                            struct device *
In file included from /build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c=
:26:
/build/stage/linux/include/sound/sdca_asoc.h:110:49: note: expected =E2=80=
=98struct regmap *=E2=80=99 but argument is of type =E2=80=98struct device =
*=E2=80=99
  110 | int sdca_asoc_pde_poll_actual_ps(struct regmap *regmap,
      |                                  ~~~~~~~~~~~~~~~^~~~~~
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:412:49: error: passin=
g argument 2 of =E2=80=98sdca_asoc_pde_poll_actual_ps=E2=80=99 makes intege=
r from pointer without a cast [-Wint-conversion]
  412 |         ret =3D sdca_asoc_pde_poll_actual_ps(dev, regmap, fun, ent,
      |                                                 ^~~~~~
      |                                                 |
      |                                                 struct regmap *
/build/stage/linux/include/sound/sdca_asoc.h:111:38: note: expected =E2=80=
=98int=E2=80=99 but argument is of type =E2=80=98struct regmap *=E2=80=99
  111 |                                  int function_id, int entity_id,
      |                                  ~~~~^~~~~~~~~~~
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:413:53: error: passin=
g argument 6 of =E2=80=98sdca_asoc_pde_poll_actual_ps=E2=80=99 makes pointe=
r from integer without a cast [-Wint-conversion]
  413 |                                            from_ps, ps,
      |                                                     ^~
      |                                                     |
      |                                                     unsigned int
/build/stage/linux/include/sound/sdca_asoc.h:113:63: note: expected =E2=80=
=98const struct sdca_pde_delay *=E2=80=99 but argument is of type =E2=80=98=
unsigned int=E2=80=99
  113 |                                  const struct sdca_pde_delay *pde_d=
elays,
      |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~=
~~~~~
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:414:44: error: passin=
g argument 7 of =E2=80=98sdca_asoc_pde_poll_actual_ps=E2=80=99 makes intege=
r from pointer without a cast [-Wint-conversion]
  414 |                                            delays, ARRAY_SIZE(delay=
s));
      |                                            ^~~~~~
      |                                            |
      |                                            const struct sdca_pde_de=
lay *
/build/stage/linux/include/sound/sdca_asoc.h:114:38: note: expected =E2=80=
=98int=E2=80=99 but argument is of type =E2=80=98const struct sdca_pde_dela=
y *=E2=80=99
  114 |                                  int num_delays);
      |                                  ~~~~^~~~~~~~~~
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:412:15: error: too ma=
ny arguments to function =E2=80=98sdca_asoc_pde_poll_actual_ps=E2=80=99
  412 |         ret =3D sdca_asoc_pde_poll_actual_ps(dev, regmap, fun, ent,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/sound/sdca_asoc.h:110:5: note: declared here
  110 | int sdca_asoc_pde_poll_actual_ps(struct regmap *regmap,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c: In function =E2=80=
=98sn624x_parse_sdca_functions=E2=80=99:
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:746:48: error: passin=
g argument 2 of =E2=80=98sdca_parse_function=E2=80=99 from incompatible poi=
nter type [-Wincompatible-pointer-types]
  746 |                 ret =3D sdca_parse_function(dev, slave, fn);
      |                                                ^~~~~
      |                                                |
      |                                                struct sdw_slave *
In file included from /build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c=
:27:
/build/stage/linux/include/sound/sdca_function.h:1465:72: note: expected =
=E2=80=98struct sdca_function_data *=E2=80=99 but argument is of type =E2=
=80=98struct sdw_slave *=E2=80=99
 1465 | int sdca_parse_function(struct device *dev, struct sdca_function_da=
ta *function);
      |                                             ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~^~~~~~~~
/build/stage/linux/sound/soc/codecs/sn624x-sdca-sdw.c:746:23: error: too ma=
ny arguments to function =E2=80=98sdca_parse_function=E2=80=99
  746 |                 ret =3D sdca_parse_function(dev, slave, fn);
      |                       ^~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/sound/sdca_function.h:1465:5: note: declared here
 1465 | int sdca_parse_function(struct device *dev, struct sdca_function_da=
ta *function);
      |     ^~~~~~~~~~~~~~~~~~~

--30tHETMPpBPt6355
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/aLoACgkQJNaLcl1U
h9AGbAf/X/b12dgsLHpOouQRvVkIwjeT3UuQcp+m0+IhqFUg6ANSz6bSQLzcx08P
R3/g8PlbEt84ZjM5L+MCFDPjcErNnZ3oetneuT9bwDa2WtsUthoAGa3Gt+boRWem
Tew3+0GB/mnCcdNaG44OA5Gikj+dD56Mii7/nU92OWI02dZ+QDZK4v8t4tX1NSb/
us7cdZ6mJra52U6H+Tk9FN1TqkksKnRQgyEriAjJsMU5bFuZCZGuQpAgAS5BVN+q
pYG4hjLYFuDKtD9LQjJnHQTu37sxvkcwLFT6d42AY5jv/y9kxX1RFM/sYIcsdnBv
no1BC2rnKl9JMDlvSfeVUP+VnKlHog==
=F94r
-----END PGP SIGNATURE-----

--30tHETMPpBPt6355--
