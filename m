Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EADE318131
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136336; cv=none; b=phJfBuj8/WhvV3FudvaptmVWUEKFVvTreQ150e4vzU8+x7H7ImLHdKHmoc5XmzrktsvTEE7DzpqunWI9VzkfEWLO7ag9olwPY8yWjB7lLqUHkesux3vVV4PBzKYcNEw+OSzn6BAFDc7LJy/aguF+P6SOaQBw1vA6QWF7QW4B3gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136336; c=relaxed/simple;
	bh=0lavaWXtQpY7sp1mDBNAIuE0ucJV9ovQQQ9SaYjdx1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCC0e4T3KuwEY6TGIKQfrrmjTC1blDL9pOBuVdoMSaS2+pxUeDU0AbMh9uoh8cTm5xcUJw4gdMAmrVFdb8kfW+zt4WaYXInfZs9nQvyQ44rEVkTZhjE7oOCNdycrl/vaJVp+W16JztSRAuV669n0T06gtcv1JPB6DLebdBpBs/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfGbl0Zh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfGbl0Zh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC25C16AAE;
	Tue,  3 Feb 2026 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770136336;
	bh=0lavaWXtQpY7sp1mDBNAIuE0ucJV9ovQQQ9SaYjdx1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfGbl0ZhiGSBNmQEXcmw35NJi4fPe/NFXJXCRB+SJw2i1+6OUR5UBcsaB+qnRh6u3
	 7yeA/HJeKNFs1tdfw5PPuGStarTtszf66Tu8WUb8LfWC/qlKn3vipyW5u+D8KOeg9s
	 yg66o/dkbNyioA73Yux4JAeMkV7r2wzjyQ0XpJgEUGFm/6Uj9WxU7l6p95C66Zns3c
	 tKmaHAscQBuTpBEv3xP8AMA/mWckDjVGoZz8aNPXvsZKbjU9qS5prW1eS9pNXZvO8a
	 TcG6yZuA0i4pzkkzuMVsepu5OlhnUYj24op+8q0zFxsMG5wD5pBxJ3IFNo29pWR0Z4
	 2e+EH5JRrK4NA==
Date: Tue, 3 Feb 2026 16:32:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH 3/6] ASoC: sdw_utils: add soc_sdw_es9356
Message-ID: <67151aad-3c76-4b2b-877a-63bd5e42c849@sirena.org.uk>
References: <20260203052406.28562-1-zhangyi@everest-semi.com>
 <20260203052406.28562-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="88WJoAVcnv2w04fC"
Content-Disposition: inline
In-Reply-To: <20260203052406.28562-4-zhangyi@everest-semi.com>
X-Cookie: In the war of wits, he's unarmed.


--88WJoAVcnv2w04fC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 01:24:03PM +0800, Zhang Yi wrote:
> Add a utility program for handling ES9356 in the universal machine driver

This breaks an x86_64 allmodconfig build:

/build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c: In function =E2=80=
=98asoc_sdw_e
s9356_spk_rtd_init=E2=80=99:
/build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:83:39: error: passi=
ng ar
gument 1 of =E2=80=98snd_soc_dapm_add_routes=E2=80=99 from incompatible poi=
nter type [-Wincompat
ible-pointer-types]
   83 |         ret =3D snd_soc_dapm_add_routes(&card->dapm, es9356_spk_map,
      |                                       ^~~~~~~~~~~
      |                                       |
      |                                       struct snd_soc_dapm_context **
In file included from /build/stage/linux/include/sound/soc.h:421,
                 from /build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356=
=2Ec:14
:
/build/stage/linux/include/sound/soc-dapm.h:654:58: note: expected =E2=80=
=98struct snd_s
oc_dapm_context *=E2=80=99 but argument is of type =E2=80=98struct snd_soc_=
dapm_context **=E2=80=99
  654 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
      |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
/build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c: In function =E2=80=
=98asoc_sdw_es9356_dmic_rtd_init=E2=80=99:
/build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:103:39: error: pass=
ing argument 1 of =E2=80=98snd_soc_dapm_add_routes=E2=80=99 from incompatib=
le pointer type [-Wincompatible-pointer-types]
  103 |         ret =3D snd_soc_dapm_add_routes(&card->dapm, es9356_dmic_ma=
p,
      |                                       ^~~~~~~~~~~
      |                                       |
      |                                       struct snd_soc_dapm_context **
/build/stage/linux/include/sound/soc-dapm.h:654:58: note: expected =E2=80=
=98struct snd_soc_dapm_context *=E2=80=99 but argument is of type =E2=80=98=
struct snd_soc_dapm_context **=E2=80=99
  654 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
      |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
/build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c: In function =E2=80=
=98asoc_sdw_es9356_rtd_init=E2=80=99:
/build/stage/linux/sound/soc/sdw_utils/soc_sdw_es9356.c:127:39: error: pass=
ing argument 1 of =E2=80=98snd_soc_dapm_add_routes=E2=80=99 from incompatib=
le pointer type [-Wincompatible-pointer-types]
  127 |         ret =3D snd_soc_dapm_add_routes(&card->dapm, es9356_map,
      |                                       ^~~~~~~~~~~
      |                                       |
      |                                       struct snd_soc_dapm_context **
/build/stage/linux/include/sound/soc-dapm.h:654:58: note: expected =E2=80=
=98struct snd_soc_dapm_context *=E2=80=99 but argument is of type =E2=80=98=
struct snd_soc_dapm_context **=E2=80=99
  654 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
      |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~

--88WJoAVcnv2w04fC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCIwsACgkQJNaLcl1U
h9DvUQf+MjKwufNEW1YJ/ss8lA1jgMvqbF8DfG48KwJbg9utmES4lDVV54Bh9DG/
PhEixVZEbf1Qy1pmLUOZ3LgfiI9VbTwWqEdbx+PjnZdf9XHWD3Yjgb2sYCUPV3VK
afNwMedCR+9/zvgu5pyGnh9E80bYpZI8G03Knaso9RZYTylwlse8hqhm0C+ZbdFu
fCDnqRWvJ395HKBCNB4m6VBVYMbx0g9FijE6tVoMu3hE8MUilV6EbPkyxSaUQdZz
FRkXJEmsChBCI/+2lVdBqK+G+0kfFRaO2Sn3FXPyJrriNZqj9KJPg0VvLjKBn4QH
X7MebMzFK4ruBbNMGjM9dv1+5vtsTA==
=2vqc
-----END PGP SIGNATURE-----

--88WJoAVcnv2w04fC--
