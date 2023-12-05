Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B97692AA
	for <linux-sound@vger.kernel.org>; Tue,  5 Dec 2023 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p04zXYeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB3C433C8;
	Tue,  5 Dec 2023 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701797326;
	bh=VjMuyjx48RMDpAEidQsQ9e57dddsq66HW9llT158txg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p04zXYeNYvuIHmsqAHhwMDGM+Tn/MyUQnRnu8e2GtEEc/YL6VMpVqazbalAwZWyrv
	 92UD//Qo1Fld8TrKGkACwg68GYlJKxZyxgrSS28/DC6oK6BQ5M1vaLgJSUodSnFMIq
	 5m+YcY2/5NHhcKlEOaUyRzSDphOitSFLRZdwCMdc/0Tzjx/oUrEkOExEw5Mi4VKEfD
	 Iw/Ku5KvGOw5+JK/a5WPw/nbaeYtSy63uaL/eTs9ucTE2w9uIDqTfZYKbHqMFqPonU
	 ndcWONL3epyrr4j8Yo0p/A7SbZyRI6k2p9iLVYHWu2PKu/bGhcKxHk0mwaGoomMysq
	 tMLvagUYB5NEA==
Date: Tue, 5 Dec 2023 17:28:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com, perex@perex.cz,
	allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Message-ID: <91546240-a2d1-4d65-b976-626cb1ef67e0@sirena.org.uk>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
 <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqFgQ+hFNzlp8dii"
Content-Disposition: inline
In-Reply-To: <20231116093512.4180240-4-zhourui@huaqin.corp-partner.google.com>
X-Cookie: I've Been Moved!


--wqFgQ+hFNzlp8dii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 05:35:11PM +0800, Rui Zhou wrote:
> To use ES8326 as the codec, add a new sound card
> named mt8186_es8326.
>=20
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> ---
>  sound/soc/mediatek/Kconfig                |  1 +
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c | 49 ++++++++++++++++++++++-
>  2 files changed, 49 insertions(+), 1 deletion(-)

AngeloGioacchino, does this look OK to you?

--wqFgQ+hFNzlp8dii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVvXcgACgkQJNaLcl1U
h9AG/Qf9Eigu2fTuVLZjSCY//wCqSIv9O+6Y6pGIYz8FacNMWdn5a+HspXIQiqnc
r+3i9lF2dfD5emd6a2rq5xFdCmmbPmyKB8bFgvfgIdlr2Ri3YJkRy9MH7UwEhHO7
L0MjNGGozqbYPHQd4cBZ9TwLAJVzebrCjvUfERc5vfnGV27mpcKa0hLWEqNLnptY
xVcyjQaVYtcvkU8F52tUYHJNVkeeBa5YERfOR45XqJhy8uCKmb11Tfe9PveZZ+1+
f1P2KbQ7UbDPi++1mCoE+aNIsLlWKGyvrHeWLUjfJnx0Peic6NlOU39Hw/r0J99c
RqgPtlsE0/jhT4cUqj67hW4MNqd32A==
=IQvM
-----END PGP SIGNATURE-----

--wqFgQ+hFNzlp8dii--
