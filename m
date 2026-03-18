Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3643101D8;
	Wed, 18 Mar 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850659; cv=none; b=dHIB45joTzfxVMICKyRo4YXNqlGEGrNWE9hOdMCX2F4yAE1TbscyjZduVjdbqKVOqHgpHZEXjF1zcs6t4+/30QPeCjG6l3sG+xFZslHeGW+6SslIbszghhXHleef4oqYX3Kmsif4USpZG0ouWRvtWZ0iEH4S68LBZBlUhVbc05k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850659; c=relaxed/simple;
	bh=04y6croxeOmqjnbcWmSl67kEZY37J97+g2n9aRbWKxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biaGY2McnM5wGmbrMPl6QlWpwgiiTXGOXeOBN83vIKb+UHeY+N03+3bZA69otUxYFAVj5juI9ACSH2wZVCJvwzt1SUauUjq7tstEsPwtqub2dyB+0IGIZ66+9nREbGghdCAzQZKBpzqWEwYkq/rtRnw67nHZPhOmQfkZlTb1RD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMyFt0sl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMyFt0sl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64BBC19421;
	Wed, 18 Mar 2026 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850658;
	bh=04y6croxeOmqjnbcWmSl67kEZY37J97+g2n9aRbWKxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMyFt0sls9ZMvB259JQK5xEKcwEU6tWQCb7EZVPtB19bPLNOuPh5DGBjKXLHDad5X
	 z4UoXfYnrB/j2H9Rdn13E3nXLIXOprLaEnc91zJjr4Qu+G2Xb/v33NIuxYR1qaBOxc
	 LqjIXQTs0tFQa76Xqsh39hHSnVsEc6R8BDQP9iCTUhNBZ2EjEBnYjCLwvgZfvU2DYi
	 aDGwm13JxDp+0vLUXP4W/pWCo530Ug9MgLRb8EypHKYuIr5aEQ8P3DRB+cm+6GA7sF
	 iL3Zn8hc8eYBS7GqTOG1xR9J62Fp8s5CX9PwCDIJtVTOtdWYzE5Y/zz9s5Vd5WFy2o
	 9t7QlYpbbm3zA==
Date: Wed, 18 Mar 2026 16:17:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM
 mode
Message-ID: <339ebaa9-9642-4716-bca7-6a32a135124a@sirena.org.uk>
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zb/SnunaRrrnfbVQ"
Content-Disposition: inline
In-Reply-To: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net>
X-Cookie: All celebrity voices impersonated.


--zb/SnunaRrrnfbVQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 06:50:25PM +0400, Alexey Charkov wrote:

>  	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MAS=
K, val);
> =20
> +	if (!sai->is_tdm)
> +		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> +				   SAI_XCR_SBW(params_physical_width(params)));
> +

What happens if playback and capture have different widths?  I wonder if
forcing a TDM configuration with the affected CODECs would be easier.

--zb/SnunaRrrnfbVQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm60BsACgkQJNaLcl1U
h9B0mQf/WnluiIQfcuWPQwkJP+jdH4bqZ9WjRB6WWfMMfGP2Q+Q9lOEN0deP061G
alqHGYpFhgQYNqP3lYb+pY3hCxWPhnCeDtuSlWL9i6Ir3MY4rievxqOHpG8O3gXK
A4eQzHNfAdp6szh9HMWfd5bUR2hkaH8UNhzQrvwSVOMWd0ks2x3DBX3uH/iFS00M
nAU47rUzn/jL6wfOTHKflWvgBdXWw25nbfCHKpRb1rNjBqSleUR5sxwIG3QpOlkr
aT0R36ilXkp0J+JnKXxbEcilgVfCcC8Jyz+UVSN17oMgUq3oj8+TaYRhovkBmtKI
4dsbyvbA/pgZ8TPiVzLIr8+mCmO7dw==
=vI0e
-----END PGP SIGNATURE-----

--zb/SnunaRrrnfbVQ--
