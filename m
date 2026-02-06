Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4026F29C;
	Fri,  6 Feb 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770388669; cv=none; b=GBiZfrUY3kBMEgNuTAW2CiuBLYyUoKKNG3ENkH5C9GE3YsdVa/RGhQktXApC8Jz/XNoeDdKN2hStX1WaOWYOHwzKf0QZ9cP4KwSZ9NFhAt2G6Ha0vhaPNb3WKvo1YK4dGZDhC6kSnqwiqy4TczhJ1N7xghdrRGK8bQ6QmaRmHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770388669; c=relaxed/simple;
	bh=Jb40v8mY4M7tTNZXeR7aVTdPQb1xvqpEjVIz9gC7w30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXXpPXuVlMn7HMh9lXLe39wbho5VOOH+zJgtSipy7e8Cu8DpceeNBLtn1r9Kf8Ak+ximRXNroyTOjZp8JZT2UoPyR4eWoCo8fIbrQn/40qnM2jkJvfTYYype3VwNcAM/WayODgCjmDqem5YrBEjXQq18O3WFWPQ2a3I00J/lcLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTApNlbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTApNlbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A47BC116C6;
	Fri,  6 Feb 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770388669;
	bh=Jb40v8mY4M7tTNZXeR7aVTdPQb1xvqpEjVIz9gC7w30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTApNlbHQajRJxUlp3PS9vUGXFC1v/0fN2X1ol3nL/kZdnHl7UklO7cwosQ5LDnVe
	 0CI+sdQg2ArK/yn7uYHIf0HB9NzLe/w6LIlI8UhpoUdhtfp/P/GUKwKrX9sYM0+oir
	 XI+K7FEOQsKr4fXY215UOONyDh711Cbz7GkHkRPvBDxfOLUTv53OUsa53eveBM/+FN
	 OJf81TyuWlJd0/eFbaO4JLgZdk4F1fzSA1OGr6ksV1YPPaxMUouq80yBI8/aO+6XPG
	 yvTFNG3h0LaFrDd3sTwUKSGnfP9WM+dCA/UpGwJpXdSe+21wN1OqOxGH+RafcguHbd
	 yfZEBy+VoJqrg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E78FE1AC57C7; Fri, 06 Feb 2026 14:37:30 +0000 (GMT)
Date: Fri, 6 Feb 2026 14:37:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
Message-ID: <aYX8qnKiPxHej-Xo@sirena.co.uk>
References: <20260206084334.483404-1-shengjiu.wang@nxp.com>
 <20260206084334.483404-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4U4VAjC1uItOIZh0"
Content-Disposition: inline
In-Reply-To: <20260206084334.483404-2-shengjiu.wang@nxp.com>
X-Cookie: Think big.  Pollute the Mississippi.


--4U4VAjC1uItOIZh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 06, 2026 at 04:43:33PM +0800, Shengjiu Wang wrote:

> +	SOC_ENUM("Transmit Timestamp Increment", tstmp_enum[0]),

Don't have arrays of enums with magic indexes into them - this is just
error prone and hard to follow.  The normal thing is to declare a
separtae variable for each enum, or if you *must* use an array use
named constants at both ends to index into it (but that's not
meaningfully different to just having multiple variables...).

> +	SOC_SINGLE("Transmit Timestamp Reset", FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_RTSC), 1, 0),
> +	SOC_SINGLE("Transmit Bit Counter Reset", FSL_SAI_TTCTL, __bf_shf(FSL_SAI_xTCTL_RBC), 1, 0),

__bf_shf()?

--4U4VAjC1uItOIZh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmF/KcACgkQJNaLcl1U
h9Ds6wf/YWaxs5YOsfGQrXDpwAs4yUlLFDh7y71lDdgia/JOhB8hzK0DcB/7IIm1
LLdfmXH7FtIoJRSC7vnsb5Z0aGZHs2K/uiD4qBt5GIvJO5tB710tCR8I+g69wQiB
ojaYxQHlF4OOIz+NOoWCaBUtJUEbMaEPntJtL9gmeCWYgFyYXvXFk1zmcpdyYCWy
O3IDrXOlJF66o88YNwtQzlNfrBLnMNMAoP1gdZaEA5ffpb0y5f6nT22UzKmTBMYD
m59LPLxxlCP73/Kre6gxR0PuRoMCyNn0vrPwgfG3BE/1QjXzhdO4fS3aSCUEewJw
1sHHbF7Jn2kP525HIOYPoPgm9hhErg==
=XqPH
-----END PGP SIGNATURE-----

--4U4VAjC1uItOIZh0--
