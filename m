Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A4408009
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208247; cv=none; b=toeTBsH++ThT/FTEN0WIW8CsbXeoeUeZ1MMGTOQn/wt+ZzeQccUL5a00Is07+cpTw+SWYsm/A8McCnuRoZB5yDubwOuYBmwzMJP4EEeELFHSzHxiZEJAhNIfDfHNhlir3vIHzh4+CsoemJTNd2S28+TN76J+n+A4L5yGRictdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208247; c=relaxed/simple;
	bh=5yOIrS3ksWla5Yez7B/apoCFMcj6JSJLpCMvHb1JK8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVQ+mf5xAvjJqvS30F8BDp81EU1MbPtsbn8IxswKxX1usWbozdJriKZzmzdvWtehliRe3kXPbZWQQCFz8Y8Mc6jWw3tZGNGb8p4qlLGpbq8Rpl0pCp1UL/BytiS4rWqXWtU3hPRTS70SOKiwfTOguTE0VVhZkiqTr/S3eVTF2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+8Y9RGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+8Y9RGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E13AC2BCB3;
	Tue, 19 May 2026 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779208246;
	bh=5yOIrS3ksWla5Yez7B/apoCFMcj6JSJLpCMvHb1JK8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+8Y9RGlNsfvzNqfk0smEvsTc4TOXF5jjUeG+B7qsLrjmGAbeAhQo6XC1Id3bjom7
	 IeJ7g6HFqxuLxdxVr18BVHR/U/DnJgI9hwMly2e58BaDKmjehJ9MJ5FBvhoASSrJpL
	 cN2N06IPFPxHdQRjinljAgkuN0feQARdsC48abrHCaRVVAnNuwuD8eTTNdB6m9JFoK
	 lpkX4Jx7Yni952cxvUN6fCFOs1pyT4OPF9amuC8TDLGwZWvJ6+WmgIjhTpDV2EbInu
	 NCz5lFuW5HFuiiw2O695sRo5cStEA0cYcTm4t2uXQL82NNLxQ3d5RCA2DctrkBGzy4
	 slcSH1UKvghBQ==
Date: Tue, 19 May 2026 17:30:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Zhang Yi <zhangyi@everest-semi.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, ckeepax@opensource.cirrus.com,
	vkoul@kernel.org
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <b17f8125-89bf-4032-a166-725be94466d2@sirena.org.uk>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
 <20260518224657.GA536765@ax162>
 <22c7d187-b696-4411-99db-3af470f5fcab@linux.dev>
 <20260519162352.GB3527449@ax162>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z6Epq/IZn8mOLW7l"
Content-Disposition: inline
In-Reply-To: <20260519162352.GB3527449@ax162>
X-Cookie: Huh?


--Z6Epq/IZn8mOLW7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 09:23:52AM -0700, Nathan Chancellor wrote:

> Yeah, I realized shortly after sending that suggestion through testing
> that it would error during the Kconfig stage due to a recursive
> dependency issue. However, CONFIG_SND_SOC_SDCA is not a user selectable
> symbol and I only see it selected through

>   CONFIG_SND_SOC_ACPI_INTEL_MATCH -> CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS

> so is it expected that users have to enable a driver that selects
> CONFIG_SND_SOC_ACPI_INTEL_MATCH to get CONFIG_SND_SOC_SDCA?

That seems off, it's not like SoundWire is Intel or even x86 specific.
I would expect either it should be user selectable or the drivers using
it should select it.  Given that it's a class driver that probably means
user selectable I think, some devices might need no extra support?

--Z6Epq/IZn8mOLW7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMkDEACgkQJNaLcl1U
h9DYvwf9Et9GIA8ajyHh7Id5ilQnEGqS2P1c6kbowe44viSTolkvE4yzIpPwW49c
CwTCsVKNa++n8hUNk0Qh5Gz9ji8bJFNnAd1d30Xw0B+lC+F48lHQ+p/4+vK80NWl
b09Wo7K2Ixudl3k/eLD3Q8KgbSK1mvqk7/olkggJ1GpgoIAPEl1WKvz9hFzenIW3
hoIEnxxc54+Z5EtABSvEA7sPzzbjKonTzQXFJQEFlagoj43XKZew+rKsbKRfyIKz
RurEJI+WjMRBjdMM96kaN+IGW9mFyjyyht5mb3RrtOUUSUPffRZTiCQG0d8aqJDY
QpCb7eMhA+Hdd6TXLimtzqlUtUihDA==
=FRg6
-----END PGP SIGNATURE-----

--Z6Epq/IZn8mOLW7l--
