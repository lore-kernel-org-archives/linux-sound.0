Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8D22741DF
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 19:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715395; cv=none; b=ccCnQ+rmtgAVgeA5lJ6bdNjDTukotMIthwAIwZuqhwiSG5UbAZpqzYgws+2ydv4MI1wHlKxW7RBx8neXi94NYMG2V/qVlL5WptmA62k5CLLDCXoKnPjol1GkXw+dZkzZ1oGsKyQBdmBQ5iRjMWA99yZj1xRN6Q0S/VRGsJb8wbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715395; c=relaxed/simple;
	bh=avfXf/yoy+yVf6X2NRrAxUcoXAjHcUjvE+SJssebJ6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=isRCc9uvcZ8ok6sswIkvlik/y46wTThW9Llod8fv+2Rch4SugYT25+0y6ztq1h5RKoQlgQR2Rv3tK99OdF2yh+0PIxF05m//EOInHDcHmgQX4/CISLEjSe61jJN2vkG3VHWWTzqtJb9R2iYu8KXzsAzy2fOtre7FD6Lz8Ogss2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT1N8b4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT1N8b4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9562BC4CEF7;
	Thu, 29 Jan 2026 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769715394;
	bh=avfXf/yoy+yVf6X2NRrAxUcoXAjHcUjvE+SJssebJ6Q=;
	h=Date:From:To:Cc:Subject:From;
	b=cT1N8b4qSTdpnblyZKDO7/fDYh59I7Y5gMdUhIiPYnqKeyPu5+2jzDrrY6x75kZfH
	 arcBRgP2ZO/ZS25lp+bb/cBAY3oW3wc4L2Hie1Zy19KqDRhK8Ffpn5qSvWk0BEHU2x
	 u4ZXC3P1IsNWSgAAxTBmXlVoVBkrNC06Bt5fWEri4YNJwFTtBGaw5D0Lh9zGFJbcId
	 vvtqdD9IBb4YRaxQROkRaGwyoRDrq8Xmx9jmn59ImcUt6T3F687e5yjlbmad71hMZF
	 9CW0CADqNZoodCLg4KLGbuWUq6TrRQBZSLezrgGrXt7Vl9TAYMpBCFJcLu6tyITO9S
	 ydn87qH2ESisQ==
Date: Thu, 29 Jan 2026 19:36:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: KUnit failures in the Cirrus tests on arm64
Message-ID: <28d988bc-0c6d-4368-ab96-a82f1a15fc11@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HXqfip5FFRTH0+8v"
Content-Disposition: inline
X-Cookie: You have taken yourself too seriously.


--HXqfip5FFRTH0+8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If I run:

    ./tools/testing/kunit/kunit.py run --cross_compile=3Daarch64-linux-gnu-=
 --arch=3Darm64 --alltests

with -next then I get a bunch of failures in the Cirrus tests, including
some crashes:

[19:20:54] =3D=3D=3D=3D=3D=3D=3D=3D [CRASHED] wmfw_too_short_for_block_payl=
oad =3D=3D=3D=3D=3D=3D=3D=3D
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing expected su=
btest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: cs_dsp_wmfwV1_err_adsp2_32bit: missing subtest res=
ult line!
[19:20:54] # module: cs_dsp_test
[19:20:54] =3D=3D=3D=3D=3D=3D=3D=3D=3D [CRASHED] cs_dsp_wmfwV1_err_adsp2_32=
bit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[19:20:54] [ERROR] Test: main: missing expected subtest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: main: missing expected subtest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: main: missing expected subtest!
[19:20:54] [CRASHED]=20
[19:20:54] [ERROR] Test: main: missing expected subtest!
[19:20:54] [CRASHED]=20
[19:20:54] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


There's some other errors there (including in unrelated tests), but
given the crashes I'm not sure I trust those reports, the ones I've
looked at run fine in isolation.  The equivalent command happily on
x86_64.  I've not made any effort to investigate what's gone wrong.

Thanks,
Mark

--HXqfip5FFRTH0+8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7tr4ACgkQJNaLcl1U
h9Ck8gf9Hv+CkDj7Rz8so5oO5iNJgylI85+RXWvr9cXcxfmZgAcCKYx8Y/BIqrBV
vFb5PiKeGol3867up5bqzlicYSaOLYK0nTLQYDlAYlzwy0Hz3dTelz3gt3xuNt96
LRqn5+N/Rl3w/9EHC5tOgPMqoEK0cVRZEiFQad9dgTmLVt+gsZBmkK6eh4rI9qC+
wo7XKTqreeikk/h85cAYAzQf9o+cyfpRw4QP1HitkYRYy8pR3TUxN5sCpygZURFt
i3UazmeIlsteCoVwc3vhJab86fdxLag9Autvp01eDdJBUmR9gNMar+6yfob1Evb1
NIeJB40r3pmzsKld/lnVoMcj+9wuEA==
=NBaW
-----END PGP SIGNATURE-----

--HXqfip5FFRTH0+8v--
