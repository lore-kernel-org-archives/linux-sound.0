Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8317B418
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332328; cv=none; b=iKAW/3eFxgWl47XKP/TyEmWt7T+afva2VwoKYfLW7ldX8XRp/EfhL69KhwPyNL5DmX+HKinhECcykRqe3jLb6pH27FCqvEOHlkDX+WBZvJCJ92ohu9oK9q2CgdGQQk1YwxiUok+GjO5JAJU10GY8vwXb10O/tNQtlXwvYuroA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332328; c=relaxed/simple;
	bh=+zjpEEu2iw4fPC/i7y3TDV9fNeCwu2FPObBstIVad5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRZmGuQnIeTF42/e7uqEIDOSzsb1HrXLJ1dLQxRmzFI/3z3ur9K/DZc3O+I/Bw7kNjkQKWrC5LYr0H+oNJMaEa0KhwCpTThy3B6H2Efvn67p8vhE6kb0lU8/oqUcg8SDRsuPoe+OwTN/6hpWB3+oAywb5TUfFUBBjXuFwzNm3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGri9Rp5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGri9Rp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D03C19425;
	Mon, 27 Apr 2026 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777332328;
	bh=+zjpEEu2iw4fPC/i7y3TDV9fNeCwu2FPObBstIVad5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGri9Rp5XuFYhSJG9iIhmgLPKNU63zUT3aTyZ+SLeQeXBDN/JSv1Y/J03pw5FzJAU
	 500LrpyFej2i2zR7I1fXNw/C8SCdiVouEkibydSyiCnq+x/oNsEnW+5eGihqTmHFx6
	 WM0O7vuYyyTmTdoEOlpxgvT/CjHQeR7DxgTfG9n15vzbbT+jojHXQYt5atnAcL1drO
	 8ldS65VU1koJg58/Dq9ixC9ZGgaXyrh1fQ4r6ybYzWUgQh6Ou7vy26pU5vWXdpspmM
	 mRcO6JES2hxGt2vMAoVl/66P8JftlesmPLSGQosqlqETtKoaGV6Hcwe4NlO2bQv+ia
	 atWQnSlFx2u/g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 827991AC583E; Tue, 28 Apr 2026 00:25:26 +0100 (BST)
Date: Tue, 28 Apr 2026 08:25:26 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 2/3] ASoC: SDCA: Remove sdca_function_data duplication
Message-ID: <ae_wZiInOgauLyPx@sirena.co.uk>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
 <20260427115925.3801099-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xr2RYDanygqLvql7"
Content-Disposition: inline
In-Reply-To: <20260427115925.3801099-3-ckeepax@opensource.cirrus.com>
X-Cookie: Victory uber allies!


--Xr2RYDanygqLvql7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 12:59:24PM +0100, Charles Keepax wrote:
> The class driver internally has an array of sdca_function_data pointers
> that it uses to store the parsed DisCo data. However, there is already
> an sdca_function_data attached to the auxdev device. It makes more sense

>  }
> =20
>  int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
> -			struct sdca_function_desc *desc,
>  			struct sdca_function_data *function);
> =20

This will need a rebase for the tas2783 driver.

--Xr2RYDanygqLvql7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv8GUACgkQJNaLcl1U
h9D6GQgAht3KPq2BAVqPo2WPtrur7nfR81UG3NduD3JXWRuE+YDPIUz2+ug84ZSE
iI/S2Ld2Jbo5HSiZppQakZsXpojWcRucFW+XVpAAUaix99AovDengzaUbeFttbnG
ECsWp7OUyM+1mN1PcikAO3UuFZJx5+gpS8tgajo04cU/7EKwTOTrWcb34FauORYB
zAfagXA7oiM2oPRBnSNHHERU+PYcleP5eCzAtNOJ/FxQHFSyimNii6wENKgk+CiL
VMj9DPQ4+skiWMue0YOFf4OmopMOP65suiabAccn1cUPjvBDAb6Y1Y0IlclVTy8T
kKkDDjE+KvT3oJOrhqVSF+0P6sB2vA==
=OoaL
-----END PGP SIGNATURE-----

--Xr2RYDanygqLvql7--
