Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411E28E25;
	Fri, 24 Nov 2023 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rW0B7dko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5556C433CD;
	Fri, 24 Nov 2023 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700835431;
	bh=umb1lq+7x0di4GkTWElfAJiKHuYnyynTpxF8V0VWQ14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rW0B7dkoDAMXF3C8b51xqQYnjp/0ej9P/oNncvvL07WENujuurblmbxVjJSwx7wmB
	 9KKHcOIYNeCVw4zCJhk5eB9xPYx1FC6SzFhublw39agOIs9ybkipKrUVf8kWaoPQB1
	 5Oz0ulLztmqTP5R8wxPh9L8QI+4CmGvYsrs5ti0tb2QmZes7KUvcsXl0xtptfsqCVP
	 BAGOB7XRL3w0YUYz1YRDr2amdMod2abgiEEgaFMdczTGqoUdW1zB0kkvS+cAK2mjcR
	 fbj52ldJjgY/aKo/vWb0aCc5aaJOuscmUqgjnVk5MCYQih0+KJMbjPQZdsubDy3NQA
	 WKH/df1ixMCvA==
Date: Fri, 24 Nov 2023 14:17:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com, daniel.baluta@gmail.com,
	robh+dt@kernel.org, iuliana.prodan@nxp.com, shengjiu.wang@nxp.com,
	linux-imx@nxp.com
Subject: Re: [PATCH v3 1/2] ASoC: audio-graph-card2: Introduce
 playback-only/capture only DAI link flags
Message-ID: <ZWCwZNzWZNIefNjB@finisterre.sirena.org.uk>
References: <20231123160655.188428-1-daniel.baluta@oss.nxp.com>
 <20231123160655.188428-2-daniel.baluta@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KPJm13OYvLGl9q7Q"
Content-Disposition: inline
In-Reply-To: <20231123160655.188428-2-daniel.baluta@oss.nxp.com>
X-Cookie: Slow day.  Practice crawling.


--KPJm13OYvLGl9q7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 06:06:54PM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> We need this to signal that DAI link supports only one direction that
> can only be either playback or capture.
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

It'd be good if the changelog explained why we need this.

--KPJm13OYvLGl9q7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVgsGMACgkQJNaLcl1U
h9CQZAf8CQihmPYaPIZSCRjd6wUATVjtfC2gIaucJq69pLgqmWIvLjsCCAnqqJbM
MlwcKVML2trFRWXG+bvNrIdtXLGr7/Hp0MiksG6oPuJsfKLdNPIEyKF17QYKs2iq
gPonNRnz5xePhFu3JWPJGbzeSu/kf2uq4mXOH7iwEBRmZFS35chTGBX5Shvrbvx2
UoNoyzy1nynNEAmplvYuqCvwXa6WD5UiwbgjMoIXy9UeD7tlytbxxUjdhSRPIq0e
cAfvAczOcivL6kSw079o4UGhAEOlU+fvm1YOn2QFoGQvlmQFtyBxhd02KhwKXfXL
7FxvwpPzuNJ2xjWnnIR3bf0Tlk11qw==
=c549
-----END PGP SIGNATURE-----

--KPJm13OYvLGl9q7Q--
