Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8093E121F;
	Mon, 18 May 2026 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093556; cv=none; b=cz8CvetSHNO7pI16LMu1m9gQF2abg+oHNAkMl0fyP1b8QYufP18MUx25dnVVcCdIXFeTGzUME8nueVqlisVk3CEymfMcy2gDcQkvhv25NYFfaoa+hLnZrWoQEObeJcBrpqXXxmWkpqdMQsNkgricJO2wbFtebX7VIgYthUothU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093556; c=relaxed/simple;
	bh=EM/vuq06ipJ3jZTDxc5cOol6qGY/s3px32V2TtPjDhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI8ntDTwWVdop4gv9gTNMr0Io2UfWAgk37/m6C2iS7iKkGn8edUrq9YNX0I16x5tCPGBlOCpRvgeyt8E2O+55b/l9eAIF8RlaSvO4zq56KEvSa5QFbNyW+7iED358UapERX4ytx1NLwI/i8lNFKjayuoWI0h1MNSEifMN2kf9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNofPN40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNofPN40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59FCC2BCB7;
	Mon, 18 May 2026 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779093556;
	bh=EM/vuq06ipJ3jZTDxc5cOol6qGY/s3px32V2TtPjDhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNofPN407UBjmolqx7qpBq73ZMKPHREuKXOt0IuQAEbvS9xyYvoUXtFUMYzw14ujT
	 RyACz48/5nDEAi2omCikiQ9+q3u5f+i6DnMuLrgTXTufD5nVLuA+BaoW+fKFIM2YO1
	 vH82qR0aZvgSPV1wn4vpsvQLf9ZJ7V6qS+wr5VopAhkMcO3nb2vXVztKulfDOp6ywF
	 nSlK0VaLBVAstbNDpI9NXEVW/NyCZR9CSYZgFyTrCI2jZ63HWczut9eOY9fTYhekei
	 XXqqUOL6XUz7S2UsB86FLwp2rifiUXvpSKHhcVqvt+QUeOYP9+j8t7trLJ20woS3Jj
	 v6U8AIGdBj8HQ==
Date: Mon, 18 May 2026 09:39:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Sidharth Sharma <wednisegit@gmail.com>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: amd: ps: Add support for MSI Crosshair A16 HX
Message-ID: <d6776836-9a1c-4663-b435-8d5b05b8b956@sirena.org.uk>
References: <20260517203955.42490-1-wednisegit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H3Kn8p5P0ilN1DYL"
Content-Disposition: inline
In-Reply-To: <20260517203955.42490-1-wednisegit@gmail.com>
X-Cookie: She sells cshs by the cshore.


--H3Kn8p5P0ilN1DYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 02:09:55AM +0530, Sidharth Sharma wrote:
> The MSI Crosshair A16 HX (D8WFKG) uses a Ryzen 9 8940HX processor,
> which identifies with ACP PCI revision 0x62. This revision is currently
> unlisted in the Pink Sardine driver, causing the probe to return -ENODEV.

> @@ -587,6 +605,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
> =20
>  	/* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
>  	switch (pci->revision) {
> +	case ACP62_PCI_REV:
>  	case ACP63_PCI_REV:
>  	case ACP70_PCI_REV:
>  	case ACP71_PCI_REV:

Don't we also need an update to acp_hw_init_ops()?

--H3Kn8p5P0ilN1DYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoK0C8ACgkQJNaLcl1U
h9ACbgf/XoKQVvN2nhrCBZ7xv0G9QzkeTLrLxxi+wzm+gTO1Pa0LUbWS4FIoDqej
Tl15ZzUV1CRwij+p68Mtn/Co+DWdTbFBwgRakIOCrdSGTNr3uYAxwtlb3eKYtYPr
MIXiy+jdE0wKQMvOzlLiSRVX76fgLoqft79Gx/yz2LzI3qJUaVtZGPMm1oWL6Bo0
1UF8hSBzHsmmsMFYAgmrSojCKR7qv1PJ0CvI/bCtiCOuXsxE3/Nfi/SFlHVzAuKX
GNMEuGTlZUcb9eyHQVwPoJB47ZeQH5aq+HxGnXHg2+XgV70IViYQCJwWkTg2f7tq
PUMQ3CS9PipLYuNLDm3O3g5HpXd2Yg==
=AQKc
-----END PGP SIGNATURE-----

--H3Kn8p5P0ilN1DYL--
