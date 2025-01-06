Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13731DC074;
	Mon,  6 Jan 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736165231; cv=none; b=aqdUuF6IH4Zh7PzzDB0YqhPPN1EaMD1YU7A50jMtgXLYPwSIjFkfb4m0X7SY9/yX4sZ6Tjz6TPPH6I/JyQlm1QxoxAah58NhxucKmiJh9haYW+dMRJouW6W+bCjaAGo9CGxRLLlr6NQobAdIKwSV+kafB8iRgfP342SayLEi+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736165231; c=relaxed/simple;
	bh=7dcTj+naT9SjaLCs2dOCbEkreiJvtxo8XtMdv5xRFM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAkjCLvvZJd69SdzlGXgWfGLPwxCRdQVxhy+sJIl4CngEBEisntMLdItSN08ianwyNguJjEnr/N0zGuKCTTU3YlfxgIPZqI2vmajUhKdpf2iVBahpJGBHO9mMkj4lDfLGYzNqkuyZFbzCsZ+LrMavx6nLgJJz78UGqulbo64AEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQOrpQnq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQOrpQnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6BEC4CEDD;
	Mon,  6 Jan 2025 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736165229;
	bh=7dcTj+naT9SjaLCs2dOCbEkreiJvtxo8XtMdv5xRFM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQOrpQnqOwnJFA68QFh5qsnmYFrtn+BjcBgkhZ/PK5PkZ+Et+Jq32RLqg7Fxb2Msz
	 +5IHzMbVE6qIe722uQL44BEso9ZI4m7AbJXrFAB6COKDw/OuEQviBB2TwiMLNMY9yh
	 aYW5e7/5TaqgOHDeT5IoEU6Hh1CNwid1x78ohAC5RP9w7hN4arpKDizAikuqOEtkgE
	 bUY0BChXKZ/nXhU3xxZRAjn8//H4pfEsOaH2bqkdLX2hRbfcLB7LyeIk9B0rQQdTkX
	 Wlb5IbG5DGS2B9VqY1MLHy2uLxFEBqhCdp4ckTpsGwkmQsDxjBVT54vhTh6Srj0lpK
	 oOQMoLmXFgHlQ==
Date: Mon, 6 Jan 2025 12:07:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/5] ASoC: SDCA: Add missing header includes
Message-ID: <b5a172a3-2c53-44ba-a6fe-7ed569c7959f@sirena.org.uk>
References: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="meNQ/tgPGZjWFSuD"
Content-Disposition: inline
In-Reply-To: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
X-Cookie: Do not pick the flowers.


--meNQ/tgPGZjWFSuD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2024 at 05:35:12PM +0000, Charles Keepax wrote:
> Several of the SDCA files don't include all the headers they use
> locally. These are included by the point of use through other
> headers, so it is not currently causing any issues. However, files
> should directly include things they directly use, so add the
> missing header includes.

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

--meNQ/tgPGZjWFSuD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd7x2gACgkQJNaLcl1U
h9DD/wf+MwHxoBs0GU6pULeOcjbvoIjQVWdEBapYOAxFTh06rctliNvF8UXG0XjK
0ogLPIswvMDFrkSPj27cy4+V2VBqNgSyljdpMheIlJMcBj0gXCMFUdNfHqHvePjg
qKZ9xpXKsV+uPDNPd25+sebiVzhtBmkrjX4PjH2r18/AJU3F5lC3SPEI/A2VyB+I
+v0bQm7ce2eut5QxFgUyNSmsvZFjUCK5A6EJlonKgdaYPgYIxwAvJZf4nWF8eAK8
R6qcsY+RAs7OgWHoyMDsR7qVeDHEMvfF6wMRfs0g7I2g1NKR2jT9yrDQG4t0yJ77
QcADd9+WlLz8PG0saDneMU0Wl9R0hA==
=E+ox
-----END PGP SIGNATURE-----

--meNQ/tgPGZjWFSuD--
