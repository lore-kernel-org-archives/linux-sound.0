Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C5325495;
	Mon,  9 Mar 2026 19:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085697; cv=none; b=MxOPd+MZPpKU4UxM+SciHsuIa+Ypy/d7aGuvQBssVNQHi6Rn5WlfmbK4ubOGS2xTfTXcXQYkgYrN7hrKN4b+1HXrOT8hsqmWetHdZV/cOZL0GKq/6b6KnQNehKDW1gJp/OWKgwP8Xxeb1+cxtnkEpoOxwpVqCeNkVvd4Y5HfNNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085697; c=relaxed/simple;
	bh=QzTWT6ia2YclDzM1HBB1Vumppa1h5wSwHqRivPG7FAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEdTyvzLRm0IJis6pJLiJGETxeaM2qWifwVLNDAckHmr9JM+hyiPqPVTFeTjSkFyRyznumDM+5z8EqLpOCLcJ53tVl7S0K/buF1ewyPoWA2g2e67GJKpy0gEtAkifUtWVkPpQbHodLuLVNg8sbboZw0r3V20qAznFpDuO5FL4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqaoZboT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqaoZboT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8278DC4CEF7;
	Mon,  9 Mar 2026 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085697;
	bh=QzTWT6ia2YclDzM1HBB1Vumppa1h5wSwHqRivPG7FAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqaoZboTeCRmDB5WS15fZMc2qJFQrxb4hRxTJUvFqGIO5XBv2O6vgA3G+2lfC62bW
	 LecXbbuRszN9KY21YwDQCYpTExa5rR0xCQmQ5bzhISTEtXdsEKJxIgF27W5x+Gdtfp
	 HFu3Wm0udXg7D9z1tIj/HMrl2Qa7pp9E5vW+PM1l1PBd3VIZkbizYtO/3kFouLQ/0r
	 OhZAmMnxwiwrz/MSjsK945odTn0ak+z5vpvHm/s5vuAlCxbKDNdONIXHGyCZjHprp8
	 gfd/LS40FXuCH6c25YJ9DOmpB9xtu8P4o/AYdZouPuGLp6ypEHZqIzYvapPVTUoXQF
	 AfGwD/F1tzjIw==
Date: Mon, 9 Mar 2026 19:48:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	18291782795@163.com, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] ASoC: da7219: scope AAD suspend and resume helpers to
 CONFIG_PM
Message-ID: <bc8a155b-9bf1-4902-854f-b67c1b70479d@sirena.org.uk>
References: <20260309082824.717012-1-pengpeng.hou@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6cQmEi3k61O+us1"
Content-Disposition: inline
In-Reply-To: <20260309082824.717012-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Cookie: The end of labor is to gain leisure.


--d6cQmEi3k61O+us1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2026 at 08:28:24AM +0000, Pengpeng Hou wrote:
> From: pengpeng.hou@isrc.iscas.ac.cn
>=20
> In current linux.git (1954c4f01220), da7219_aad_suspend() and
> da7219_aad_resume() are defined and declared unconditionally. However,
> their only in-tree callers are the component PM callbacks in da7219.c,
> which are already guarded by #ifdef CONFIG_PM.

This doesn't apply against current code, please check and resend.

--d6cQmEi3k61O+us1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvI/sACgkQJNaLcl1U
h9Bzhgf/QMtQMwhdAIb1rlxGyE08R4uv/H7NO299cMejnYO/L1SUdQKzt5ju+Pvo
D/O31YXmGU1LjfHmrwQi99MKSBlZO0eugwtP3T/0kfgD1v1YGYMq28/2sJrBikU3
JWyM5fQ+utOHYsUgfgZNdx8aIvNLrSxU943NOrHa0tNU3ssSjxon2ItAzhxgzfCg
D/nhgnFV8BRYLNSHgbU21ZqAki06blL6C2S6swdmQVnsjkyM4Ch1+nG/tNu/QiF/
i1ZP+2/JbGKlf7WsIxPLQ8b5s2O31KyMLT9qRv+SYPaUaPhIk3Fp32QBgVXfCnFY
powhUMzCK0699a/AWAsxV3h8TO+l7w==
=+cTn
-----END PGP SIGNATURE-----

--d6cQmEi3k61O+us1--
