Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C0308F15;
	Mon, 11 May 2026 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509293; cv=none; b=K/FepipyeVHCfPThNsev1aW39zEu2GsmgWKGzxfN55+FoQT8KQShHbace0KTR7fsPUXoBVf1fiL/iKL4B0CsXN+LeP4HfCfrQ9K/JwGj6PRGnubTdOheNTgzr3toa3faElupTGbpUgxhJPbZfQgnKFJbCWyowg4IHlcaKlgm7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509293; c=relaxed/simple;
	bh=ZBy4LQy3G5oY+enGMTuTxblEOqHxjUpTY2UJ0Jx24To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz7xqhuurYxdIZen699p8IqNhmgkqLkJ6nMFTjZ93MmMDYJPPRANnTlqsztgOME5OZvxXHH7yktZPUOcOhT1xnekFVmVmxR4p6963WSCRvywWlYmXzivrgrJMN+JCB2xacexsRwYXxt9+xBrKZVrm9IrRfu1xhniyfFxPIlnc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrpW5tDj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrpW5tDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A955CC2BCB0;
	Mon, 11 May 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509292;
	bh=ZBy4LQy3G5oY+enGMTuTxblEOqHxjUpTY2UJ0Jx24To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrpW5tDjVCVBmo8sJAn8DpXIh4s/WpBaTT2/nArzSIqZ0jek4l/5u4Eh5jpBeHTLS
	 WajraIiZPYZM95Wv6LuXi+kt3TSaUvMuAjAKsQMlN8UTdAWtNJdUtafCYILx6WT5ob
	 AKL0SRVLutlOlZXXZ86cNYDXca8POlyAyVTv3QPVEYIZ9v+IzY0p6WC+80oaW0Q1zA
	 mmdnJW4N2z0kN3jEHoVyAzluzETZ+gIiS9D/pRDxx4a2G+fHVvUAq4HbZbtkZAEWWq
	 A7WpeKmoxN+XkdR2Rq5Hep/wnZ0Fxaxnaitu0RRg9NBkz6asOOgEG6GsZgIrgC3ikh
	 kgf9++gagR1Nw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8E2841AC58A9; Mon, 11 May 2026 15:21:30 +0100 (BST)
Date: Mon, 11 May 2026 23:21:30 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH v2 3/3] ASoC: spacemit: declare shared BCLK for cross-DAI
 rate constraint
Message-ID: <agHl6p-JEjpsPsPX@sirena.co.uk>
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
 <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FToeJ0M9a9mPmegE"
Content-Disposition: inline
In-Reply-To: <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
X-Cookie: Truckers welcome.


--FToeJ0M9a9mPmegE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 06:31:44PM +0800, Troy Mitchell wrote:
> On SpacemiT K3, multiple I2S controllers share the same physical BCLK
> (c_bclk). Declare this clock via snd_soc_dai_set_bclk_clk() so the
> ASoC core can automatically constrain hw_params when one controller is
> already streaming.
>=20
> For K1, c_bclk is NULL (obtained via devm_clk_get_optional_enabled),
> so this call is a no-op and behavior is unchanged.

We don't appear to have a c_bclk in current code?

--FToeJ0M9a9mPmegE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoB5ekACgkQJNaLcl1U
h9Dtgwf/e8ZiBgJyxowxGkq0N6uC5OBXBADNJx2cI54gJhzEsPEvo5gxrS7a7u5c
PwSNPv/UeigMQI0xIPjzcPEvyKWXP8R0Gs0PoDFbVYhqS+2zxDM68LpM6O/plRYk
Dov/IuOBjWdozrR9LQa5GXouHauZu3qjYreeJcEcv+me6r9n88eG4KoZQcDrgavr
AXe36c1S9svnWzNTdzy/aA1pfl0k1mBEZNekrIERVVH4B2BwzWfTTAqG8ZngBI/W
11tv5H3tHMFyg60+FA06goQ0jhq//DyjiNEy76VCI8uL3nGqyezJdYJx/kXEuDRw
A55UojxM/joMZqDiwjajidaeGnf7OA==
=Z7xu
-----END PGP SIGNATURE-----

--FToeJ0M9a9mPmegE--
