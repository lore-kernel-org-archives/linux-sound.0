Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0530C37C
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855710; cv=none; b=DH3VHayUb7JtvStW57JoOb9t7pcXDLV39epT9RZQYfFg2g1gx8sRJ3BcCaqe8hM1VFmTgGydH1X0hvZ85AVwgNcYvLHf7q+URTAIsoFkycgjopS6z46K9sbkKshwQ6YZYPVhB6Xgy1HWIBVd5Mea5Qyq5Y1ccyXA46FKesyvoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855710; c=relaxed/simple;
	bh=cOWnCO/nW8/dwYEizGfJY7Bc02Nx4H/olS1ToIQBGFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0uQtNIGIGn0x3TZ9QxenjNho8JwS9vajIXPkBNJZpiXyfxYPP0ju9SzFsJ5+utd3ZJdMcvc58b9KdKL6SXEy/fEA1hkv+hGTIX4AeiMCpYOkI8aoP2WI/JaXBZHuUGk2leB5z+v4l0vJYLcab2zuzn+FJre6HA6rTRVVmsn6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocRfABL0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocRfABL0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BF71F000E9;
	Tue,  4 Aug 2026 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785855709;
	bh=EhoFFt9IooFKN73pSCayBG5bDZeZmsuwXEONRqQLJHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ocRfABL0eoiuvPXPgQ/gk1hhmqz56kfdXfpjdZ8pDXfypH2H+03AGkzuLnArJiMF0
	 JcjW1XejfPNbaYEOtkIS6pdMubppl5WsygPzKXRJW3R481iwxB3YJtohWotOs40SPx
	 JikaPngmRv3TbPc4ydRrFCsWY10sFwMMDjbISSZwCNXMmRJ6kMrQ1y/6Zsflupb4Uh
	 5sSIl3sYW0KI9lvQdzSfCa2pa8OrofUtH/a/Usgtd+Ke75+AFAI4zvsiEbEWg5RWrY
	 qbjkCL46X3xvQJAx0ztrFYnGDVx6VLjDd16CYtUjjlt/bY74k6O1BlTdTQokSoUibE
	 MLg4lXCn4obew==
Date: Tue, 4 Aug 2026 16:01:44 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, pierre-louis.bossart@linux.dev,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v5] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <2fd91870-51d8-4604-a281-36b6c234d737@sirena.org.uk>
References: <20260804104828.557228-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YPNiJMwxd9QLzhqp"
Content-Disposition: inline
In-Reply-To: <20260804104828.557228-1-shumingf@realtek.com>
X-Cookie: Biz is better.


--YPNiJMwxd9QLzhqp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 06:48:28PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch adds the initial SDCA multi-function codec driver for the RT76=
6 and RT767.

This breaks the build:

/build/stage/linux/sound/soc/codecs/rt766-sdca.c: In function =E2=80=98rt76=
6_sdca_irq_ct
l=E2=80=99:
/build/stage/linux/sound/soc/codecs/rt766-sdca.c:240:41: error: implicit de=
claration of function =E2=80=98sdca_irq_cleanup_late=E2=80=99; did you mean=
 =E2=80=98sdca_irq_cleanup=E2=80=99? [-Wimplicit-function-declaration]
  240 |                                         sdca_irq_cleanup_late(dev, =
function, info);
      |                                         ^~~~~~~~~~~~~~~~~~~~~
      |                                         sdca_irq_cleanup
/build/stage/linux/sound/soc/codecs/rt766-sdca.c: In function =E2=80=98rt76=
6_sdca_probe=E2=80=99:
/build/stage/linux/sound/soc/codecs/rt766-sdca.c:858:35: error: implicit de=
claration of function =E2=80=98devm_sdca_irq_allocate=E2=80=99; did you mea=
n =E2=80=98sdca_irq_allocate=E2=80=99? [-Wimplicit-function-declaration]
  858 |                 rt766->irq_info =3D devm_sdca_irq_allocate(dev, rt7=
66->regmap, rt766->slave->irq);
      |                                   ^~~~~~~~~~~~~~~~~~~~~~
      |                                   sdca_irq_allocate
/build/stage/linux/sound/soc/codecs/rt766-sdca.c:858:33: error: assignment =
to =E2=80=98struct sdca_interrupt_info *=E2=80=99 from =E2=80=98int=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
  858 |                 rt766->irq_info =3D devm_sdca_irq_allocate(dev, rt7=
66->regmap, rt766->slave->irq);
      |                                 ^


--YPNiJMwxd9QLzhqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpx/tgACgkQJNaLcl1U
h9DF2wf8D8e1acCNX2SNZz9Q6N0ns0i+fbSrfIQqxACbfyDyVkT37CwlRuR8MdEK
dC1IT45dRYwnBSBNyIenVIsLyr42ggqSJiZuYDFORGB3O+xp//zPuSr8gQZaHFBG
eszn3QR9+qjwgXICLe80FB7xaDS3cdnuJR9zdTsPbFtQ50TUt7nS3z7A5UhgoJBL
lKnC40RPsqnHWuOlmvpZyGD7tV4gcp+92XbmBREfO1/Tbkd8yifQhTkecQixnykk
LE+MVNSwkEqCDkvg4V6Zu4z+oZfs7Y5wKQ0sSbredIn0Rqbl7EDY0Rmjrk0WomVa
OYFiM7XE3D3akrHYTBRHx3UuFRDxQg==
=Cjdc
-----END PGP SIGNATURE-----

--YPNiJMwxd9QLzhqp--
