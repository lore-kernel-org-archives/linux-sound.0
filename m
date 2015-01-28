From: Mark Brown <broonie@kernel.org>
Date: Wed, 28 Jan 2015 19:31:10 +0000
Subject: Re: [PATCH v3 1/2] ASoC: codecs: wm8904: add dt ids table
Message-Id: <20150128193110.GI21293@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hZNcg5Zgu0ROmvXA"
List-Id: <linux-sound.vger.kernel.org>
References: <1422329800-28481-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1422329800-28481-1-git-send-email-voice.shen@atmel.com>
To: Bo Shen <voice.shen@atmel.com>
Cc: nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, Alexander Morozov <linux@meltdown.ru>


--hZNcg5Zgu0ROmvXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 11:36:39AM +0800, Bo Shen wrote:
> From: Alexander Morozov <linux@meltdown.ru>
>=20
> The WM8904 and WM8918 has the same data type, while the WM8912
> has different data type. So, use the data in dt ids table to
> distinguish them.

Applied both, thanks - please use subjct lines matching the style for
the subsystem and CC maintainers (including driver maintainers).

--hZNcg5Zgu0ROmvXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUyTj9AAoJECTWi3JdVIfQvGsH/1WOvFO1DaNSf9xCwdhhKk/3
QDEey4WnmaU8bsBlecqtyoNVeKw01ymjETR0b7r5fTq5vNCJQNbaoIbId7g1YxDI
Q7ReZcl5JTLFus5sZlW4y0+94vGLjOxqecmIKWw4hIlwpAV2gpBrO49DlMcjw3y7
tpDvLJfrX+Su+mgkE9+N7MXWrK7BAARZ72PlN3Y5PvDY8UAq6lH08nqvlUfIkniC
0c818pv7xvH4K75DI/lDPTSt1+h+wT3LKeHlpxQXiGFsZa7SmryvGIDFac1zy8jT
BttMGkAzdxs9ua8kU9MJ9JtNADqgAoqT+1njgDwSM/v8Sb2CTtlHTMuE9B03/90=
=u0Lg
-----END PGP SIGNATURE-----

--hZNcg5Zgu0ROmvXA--
