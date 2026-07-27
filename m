Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7043746A;
	Mon, 27 Jul 2026 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174176; cv=none; b=fELWDqeTQ5sp77ot0I/YSukFbPr0z6ajkKZFLleOhwTZ0MSWPN5Ej0uecKuoaD851CrUPuk/IosoaZ24RcoLZ+O7Zz7yiBZ+OQMVeEFcGXwwBSOV9fm2GBQr/9T7SU6Yj9VC5N4vYNSQKfmIgu72eb6MuVrC2Cr++gyjWxOjqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174176; c=relaxed/simple;
	bh=+RwV1CphlreX+H2tAAEyk5SYVGBCizlsVkAXicKNDKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZX4Umx22tt1mOONDrxeeDBGvbbj5EmRRWtHDJyI0Pe2o9UCM2GUnzI7Utmvz9YAmkdDKK6d58nkkqy68sqO0g5rAsHUHZcEqQka+EQ+3LxGYdZ1E7DJ6ZiN0l/c7ID8Hp/O9dbnLSIRGiCWMUwSjizkSTSqhlul+rgCv+AuVHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLZjPGxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLZjPGxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6305C1F000E9;
	Mon, 27 Jul 2026 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785174173;
	bh=BdtAG44nKKMZhNjBFIUS3ecktiBD4EReMHnl2xbL+vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BLZjPGxS8aDZ3GzIkpOy3ryTa7tqfrBEZWd//TEUvMpRq6XPm/yitBVShzWmz37wE
	 2cB5/2r66xnBIzDtu6VN4omhF8hrNCnGtZl0dtlGTUYefn9AwM9R3alCNV+XipY1Ae
	 2KzyxPmH4cN8+SW9FhDvvfkJcofNs+oRbG/zYUx4Ypa/upc+cZOx7q+0+iydZSzjFO
	 WtXZ98b3hkfhYMts/OFv/ooDAkvgg9mKEzPUHYMr7vPzVMiMmjBc0tLW065fOZ6aAq
	 ci4ZRnswlOxbkjrAe86KzllH2v2g0JtyXh8UMguisoky6t7OWOlRL5rZiFfCNxJnMg
	 c1khp+pVUPP+Q==
Date: Mon, 27 Jul 2026 18:42:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Message-ID: <05545bca-6ff3-4a15-bc5c-1629d805f72d@sirena.org.uk>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <8fcea280-02c1-4511-a51b-438254e0b8e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3F4ZSul2k4J0QrPe"
Content-Disposition: inline
In-Reply-To: <8fcea280-02c1-4511-a51b-438254e0b8e8@oss.qualcomm.com>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.


--3F4ZSul2k4J0QrPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:17:34PM +0530, Ajay Kumar Nandam wrote:
>=20
>=20
> On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
> > Add support for MI2S clock control within q6apm-lpass DAIs, including
> > handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
> > now retrieves its clock handles from the device tree, allowing per-port
> > clock configuration and proper enable/disable during startup and shutdo=
wn.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--3F4ZSul2k4J0QrPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnmJcACgkQJNaLcl1U
h9DaSAf/QwOc1xeo2TkIV2UNmlwynGQkpdq68Oq+3S+gTs9eopAcy2MXWsZI46yl
7FbyGH4XDiCFpbmagtgOPbyayW26FoPS0Bbe8o24d5xyNJ0ioqsjCxpUNvE4Jzbd
R68tljk2FCyD5Ya7MGzhqy5Kyz0r56aWkb45s1y3PJvZum6QLqvdhczLf0OXuUHg
FxcYr31k7GKTwjVCAkEmDJmwws2K+8PBSEjl/lbJd2jcw20p3jWKxhLZ/aw/PaKC
ZpU+MwPcPz4Z1OclnzOcxfl6yGA4AHYon3M1OpIbYD4gJjFX693nAk+3Oc4JN8yc
r0RLN4CajZvhi+YKU35/5PoVKZSsOw==
=zazJ
-----END PGP SIGNATURE-----

--3F4ZSul2k4J0QrPe--
