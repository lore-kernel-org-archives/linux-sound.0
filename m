Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F98134BA2E;
	Thu, 29 Jan 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707683; cv=none; b=FqjzYOFgyeHulVRi0vo3FQiGUpTtqRwzcQaJlZebNCLnhkq5NVUq8mahO/Virk5M347Z9TTmujsTqi1BpPs09E1JP0+W6UJtZB5AzHz2Iio07lTNZ4q+AHsCwk75FTXDO/DVh5WhvV9/h9qcC87hWSZDGNwo0zUa94J8njnHRN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707683; c=relaxed/simple;
	bh=oWa0Fvq3q+D3Yoo3dUfogBnn7h3DGJAXHWy9PefNDko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqDqXHkZoS/VTbhQhxpVsxPs2SkHB15xKyPFHDdUstIZcDvjsVaFS7lAPGAa5MEFpC37OoQk5yuggg6xoRsSoM4etTBcYvLVhU9x7K0arh4MIhjL6BCrN99Gj8JOnwNatkPY81nG30vkg0MakgbJRuwKD5qCCgs67oyzF6cj7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0mY8bcq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0mY8bcq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622C0C2BC86;
	Thu, 29 Jan 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769707683;
	bh=oWa0Fvq3q+D3Yoo3dUfogBnn7h3DGJAXHWy9PefNDko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0mY8bcqHCzCMhVJDrwmeWjUmf+i4NTCM6rnsNCCZWK4w64UiSpx/S9IXJ51ve+6g
	 viqzj8zpgL58amsin0jJwQdsV5cfcN7vGYBWjUC6Lwf1BaoUfefdjFJPkL69p4lq36
	 XiQt6BvDOQvYybv6qGfJZYvOC76SbRtaGkfd0od7IfMBgd2qeGA/wKIxt4yoIrue10
	 gtEX5cELkmxqrz3M+23R98YCYxyweAAZIzwNbCcwIjZKk0C6heSkOaSRVlZgDbxOhv
	 a/t5aMci4Bs4x0weGKgHwYcFxAgty2zTxbB8wb8nLuR6WpYah7h92VTc2Lma0ClWrQ
	 R0X8fECCmXemQ==
Date: Thu, 29 Jan 2026 17:27:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alEpQpaCvCSpPLWS"
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-3-sean.anderson@linux.dev>
X-Cookie: You have taken yourself too seriously.


--alEpQpaCvCSpPLWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:

> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);

> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);

Given that the properties already exist it seems wise to continue to
parse them if available and prefer them over what we read from the
hardware, it would not shock me to discover that hardware exists where
the registers are inaccurate or need overriding due to bugs.

--alEpQpaCvCSpPLWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7mJ0ACgkQJNaLcl1U
h9A4rAf/bySY89fyno0iSVbW8kKmXh9XYhW/GP0nf6ewJsn3xuVUI83ySMRTud7S
rfaLLqcFZ6OnMeZBMpeISiGGmAneV6y4JaKSlw6c06BGYxLP63PzDozrTghgk+9f
jtkj9YDXTMvpmsh9SrbUl+a7m6HTg+40CaJxWwjc+aAXfideUtmXwe0sAgD2lNOk
/zofPqNRL7V2aLrus1x8erixbALMaBuh73kL1CkxAS7n/6i4VcVVyclJhl/Z7Mh7
fDbQ7qwUo7eerudfwTaHKWUlWGV1f0/7hCsr12O5QVS0XrtR/b+t/en+qMeUYpdh
+sESZVbFPRGhE0U9HhrOPks5hOpiYQ==
=l6Qh
-----END PGP SIGNATURE-----

--alEpQpaCvCSpPLWS--
