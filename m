Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304493E7BBC;
	Wed,  8 Jul 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531373; cv=none; b=Cv2mdRE+bp3zwkcCNoj6haVjNZrBa8Ijfq0xnnGUEa7e0cIzYPdLBlBb8AUhAbu8oQD8MD5sq6KqYE1DnlsfZpmMNQStbbcc2CQJiKDGHpxJC8GB32Da1vEyBcm18KtSrmNTEFrVou8zXBWxLtE5uZB9wExTiTtW+3wOHnO5pLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531373; c=relaxed/simple;
	bh=i7IPmNgvS9mOLFEChWl8INVOYxpfS2/NOpNSeCStxpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyTGWHndU5HkDlGFVfujvBHKEjWLvJFD4txwP5h1Y1rU8PKJmQZ3kSxqmMnqMTga/FXkX1zDv3hkI+w0htQLXaUhQgNQtu9nPPr8dssoBm8d3ugG1Ei+xOoyu5hGcmrgKK3U29WeU872iZFVPuQdJK/hQifkwF5f58NDoLmxSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h++1O9EN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h++1O9EN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE661F000E9;
	Wed,  8 Jul 2026 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783531371;
	bh=i7IPmNgvS9mOLFEChWl8INVOYxpfS2/NOpNSeCStxpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h++1O9ENPah2e3Ku13KPLHp893MhKU+YG8XBJT1RVVBjXvzCfjcXEShyIaRP6wggM
	 R9Tr7x6BoME33r+edVBHNsW3iFZAU+BrJ8UDv8g8hrqAw8HZQAdEvFj0N+fWmty2G+
	 M4Nv4QRACaZCYMWM+UYIKV8KamYtpI3JoV4roGDa2v8eVfXJCl7qP2r96ezkYmEgI5
	 UyO70ToZ6P5z5EQdwoGQNG2mU8XG/gN3bbiQU1+rYCn4NPzYIoEuJ60PybSp6WAdRH
	 I8cVW8wA0Dt0MhQaRIMOavPaPWqZisxasJq6Jb3QhJu5kI6i8U7g5qAHRYgB7O6jJq
	 VHruDas3phubw==
Date: Wed, 8 Jul 2026 18:22:43 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin
 locks - part 2
Message-ID: <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PgruSEpo43eVP3iy"
Content-Disposition: inline
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
X-Cookie: The other line moves faster.


--PgruSEpo43eVP3iy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 09:17:07PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Hi all,
>=20
> This series converts mutex and spinlock handling in ASoC codec drivers
> to use the guard() and scoped_guard() helpers.

This doesn't apply against current code, please check and resend.

--PgruSEpo43eVP3iy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOh2IACgkQJNaLcl1U
h9AHoQgAhXWcuJJkJInaKgPMlux4hFBIjfDxewy++xXi2dE4XZFZF9qSXoZ7tP64
OjmBor4HySFyF0TcRcavMwLenxRl4hNX4GheO004Y93pxBC/tWufADjMLYCDHE9h
BjFlvQyoP5A3VovCCADSNqMcDCBqgcgz1KC0NpwTyTXzgGgOtCsT38do2/WKBH+q
G5DJvrjY2TZpzcIqvF9VMqxiQqUCXMEFFz29fsjP+4J2lhRjxMb3fIJeRsdhw3yT
nbNBZooFgQiKUwh2YpA9Mip214LxN9UEvd5HkehzudvMfMIxwUyKE/Io5gKKsCNo
lq7PXPnBIfRaMWCJUDCq632/gxKqSw==
=rQ7N
-----END PGP SIGNATURE-----

--PgruSEpo43eVP3iy--
