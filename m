Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46A1494CC;
	Mon, 20 Jan 2025 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392915; cv=none; b=mRkf6gqk1bjwNpMI/2G2EuLaKW+wjWB2F/dwlOzQAu5FsjY+rnav0EnUPhEa8nURJJkhkNzEdD2E2OmbuP6e4TlFCTbZJx6okNCSxYq1TBa0LBJ5VgztHEBEWdUMD7Tg0bnfjk6Jbh51N737xSdsIIu5f+sF9Sv7iwqwj4FeX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392915; c=relaxed/simple;
	bh=Mb2l0XcUn1bmh2jkx2y08ChvluRoWNylRcDXRyL0v18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0IYsareMvJoevq+hEwjLO9ezOfftPQgNMc10v1TEXq82P0+LpBkT9pv4E7xXqwdiljSJ3LPvQHWRBNUvCVyaySYpRMiaSv70N2uqsUlxRM6ApMpQ2OOcsx/EF1mj2zFD//fUVOGbHka07wDRH9hX4InpHQBzSXTUqjZvmrE4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uyjc+hu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uyjc+hu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE151C4CEDD;
	Mon, 20 Jan 2025 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737392915;
	bh=Mb2l0XcUn1bmh2jkx2y08ChvluRoWNylRcDXRyL0v18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uyjc+hu5XSVws+QzPhj6kX4J77LbqsRRoGglbT/acbf4Xjky7jhTF5uo1PWqv0Wht
	 1z6jgFFALMiNjioUTKlsFC2Qm7XiX5VcqGLzmZaPJEv/zp5EyV3mXnIcBArhRPjrAV
	 aEOdBJ/qOywVManvDaqJfb9icJrsG8kxz7KqNmfUg/IDFyXQutuwwnm/zERFGWorA/
	 /8O0CuKGJkG7ANn5mlMNKY4IVkSLxBPweOU5MeJaTFzH1SbDpD1qYBkkzDBxrUgFxK
	 K2ipewjCkFyqT4IxV0mLDyq3UCKm4rwP1vyfTsaA5wdL6c6P9h7IhnY5clHdfqkLGl
	 BePnRRPPs8fSg==
Date: Mon, 20 Jan 2025 17:08:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0
 and ACP7.1 platforms
Message-ID: <e5d8c2a5-98cf-46f1-b942-8792289ec363@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-3-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8BbpEGHtzEpea4jW"
Content-Disposition: inline
In-Reply-To: <20250120100130.3710412-3-Vijendar.Mukunda@amd.com>
X-Cookie: No lifeguard on duty.


--8BbpEGHtzEpea4jW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 03:31:09PM +0530, Vijendar Mukunda wrote:

> This patch adds common PCI driver to bind to this device and get PCI
> resources for ACP7.0 & ACP7.1 platforms.

> +	ret = pci_request_regions(pci, "AMD ACP6.2 audio");
> +	if (ret < 0) {
> +		dev_err(&pci->dev, "pci_request_regions failed\n");
> +		goto disable_pci;
> +	}

Looks like there's a cut'n'paste that needed to be updated here!  I'd
suggest there might be some chance for code sharing, but I suspect the
amount of code is so trivial that it's not really worth it.

--8BbpEGHtzEpea4jW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOgw0ACgkQJNaLcl1U
h9AK8Qf/Y58VwBIH0bJ3HcA0LJTE7AvXKD9ItYLsXczKd0E4GpaiOgJAIUigw57t
qk/ofTDNc2ioy1agFYGjr5gL5tm3gIHNdbkgZP++DdhxWQh2BoNeRGKF9+uhRuz3
+R96VaV93fxDdzXUceHuKlOCLTL04tzQbj0RzHHdlg1pk/YRlztjaa7xhNRaYO40
ifPYGOC9+YUEtqhw8VoWoYN+Tv+hPAUPiyrwFvsBdw/aueSfTV79B36yUMaekfoW
Z3Fs8VedBLeY21ak+/+R6Fm1b34JwTwUqkCVSRDJtxR0jrxOC9cM8ROlEfDyShaZ
k/D7VOfPlBl1cMLerQJeQbjj86v+AQ==
=pT0d
-----END PGP SIGNATURE-----

--8BbpEGHtzEpea4jW--
