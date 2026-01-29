Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804DD33A030
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709777; cv=none; b=GHAqHpAxxNbrO8WSCDqSn70Y3cPxaol9E/wzvZ956QqgWOgRbGute/wGuoOiMHFDC3Reoz4XFo/abLR1BNg4kimcAt2zihmfbGErl/QpFP78MOwvdVqoONYwA1LBBlDPRRmpoYmXPZEmsZRRJ8tRRrZKVjk7XkUEwoKJHYJAEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709777; c=relaxed/simple;
	bh=+m496zieNrrVFPHysVpP/+nP3RnylXLTx9VVClUxD4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJaBqKokE4a3E+TbcYYLBKhpWIhYNGBZ5jh1qqbjDR+bA+6SdFyzzQOvVqxJWAZHiEPBd3FgFzM61sGflBeuW1UgOVKTQqm79mKxA3X/9zY6CybH25J5Nj74Oj6tn2FECtA6ERxWDX/tEwCZEl3qmwyVpYotz/m24+k8COj6K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGyfrE4E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGyfrE4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD97C4CEF7;
	Thu, 29 Jan 2026 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769709777;
	bh=+m496zieNrrVFPHysVpP/+nP3RnylXLTx9VVClUxD4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGyfrE4EQOAr9K0oZAV/ul7bVnQVE3vphBLyznri5NkE+L6NMsB9lMc57KSqfx51p
	 jWQYczlEoDAeR6SzUflXCi8mwlVJw/17UjoslOZHUSXbHVW97xWhFT06qcpDrmJOvd
	 gSygkKFcKQMXmoUJkgTPfSZWykQiYl4pe9jMnJNuijzI+5SDLzAxLS/ivh9Vhj2vxJ
	 Scxaeyo2BvXIzxeQROf3eAZryRhXrFm15QExkkzk3gR0YSu+xQq1QA5fwsEBCF+G5P
	 1eOxKaeeBpXMyWMi7hZNxt+NpdTK0LnaB1fyHGkQn+tF6qJYzLg2mW0BwBHq3Z4OUS
	 NL9YtIH7zf0Zw==
Date: Thu, 29 Jan 2026 18:02:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsieh Hung-En <hungen3108@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 3/3] ASoC: es8328: Check errors in set_dai_fmt() and
 resume()
Message-ID: <584b2e7f-bf94-48bf-9b85-26a8ba9d0ba7@sirena.org.uk>
References: <20260129174733.6660-1-hungen3108@gmail.com>
 <20260129174733.6660-4-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdJb//b1tzzY/uVL"
Content-Disposition: inline
In-Reply-To: <20260129174733.6660-4-hungen3108@gmail.com>
X-Cookie: You have taken yourself too seriously.


--kdJb//b1tzzY/uVL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 01:47:33AM +0800, Hsieh Hung-En wrote:
> Check and propagate errors from register updates in es8328_set_dai_fmt().

> Also use the cached private regmap in resume() and add proper unwind for
> clock/regulator enable and regcache sync failures.

These are separate changes and should be split at least three patches.

--kdJb//b1tzzY/uVL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7oMwACgkQJNaLcl1U
h9Au7wf5AQVacP5DKvlGNYhL2+eZFKSK73eeMQmpd6Yom+wwuPzzR6QDXXNRAdA+
zgqtP3GYo0BU1LT6w++0JL9XQlTapV79+eQD6jgWMqn2yw1tFNMnChIebeBubfdC
tKYEqyneWF/1uKMjopQslSItiv1yOp8NF2OVK2GN3o59frBoKM11tBnuV0lePzjG
MMuEpWPKJSep7RPHSZnmJhMfoBu8amhpYKnjfBSqi9GJKjqwLxwjhSh0ja4f69zh
bs7eVr+CtVvaVEyhOQ/cLcwFs0JzZ7splB8EgWb4kZ9kvYKBPthlQ3TsmYZ33ZzP
LdJib4joAKRrSWjWm/3EPruoZs41HA==
=5PAH
-----END PGP SIGNATURE-----

--kdJb//b1tzzY/uVL--
