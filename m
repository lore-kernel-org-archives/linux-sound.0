Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93091EB48
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243356; cv=none; b=asOhHULuJ/5JXgLgSFB5k22lVPgXP+CzY0cbk/xBC7n3fTMe8n8ut1UA4Bm1vrPojMQ0A1sRM/dESAFQcgJSoY5o22DbxE167twvFdsDwuSoJsknle2nScVJ1ah4U2GS8G3xH4hwewezSFrg9ArrFHOCe1iBjVCm+L0+ZxjZ25s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243356; c=relaxed/simple;
	bh=EgQFS3N3hCwlYCyajVqk4Zaaf9e5hnpWdPb+4aYNjC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIA00l5DusQGZkeySMSzUZtPv4D+BUzBOHKUf/N8Mt6TWufHWrjF+scZmflgrJezIcQEQ+SyfnUG3gczxgR4+K4ZRXKL1mlhKYc9qATjetSPW93dXIim7O7FdTw+9Wqa8qB2S0Ue3SPyg1DGvm+lv7BJ7bJs/GQjgwCAm6gf7lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjdGYeA4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjdGYeA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0105BC2BBFC;
	Mon, 24 Jun 2024 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719243356;
	bh=EgQFS3N3hCwlYCyajVqk4Zaaf9e5hnpWdPb+4aYNjC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjdGYeA4syzMQZkxTRcer3cCsEaZxlx6PKpC99s07L7jeXNfAmqzvLSO+v4dBYaxQ
	 AX0b77QZbhnNZ7Qy7JtrjGDQto6t2gz7pFX92K3sXHG+xeSp6gErNWRSOYIvyrja6D
	 wg1GUFhI9hVdaGAdrJ31iPl3w8xs0q+iKi5WMyuTl+5I06itUm5nlEtjpW8f3AnM1F
	 yPnRlJtChYQDVVhA68QbC/tOZC7wCSZ7gEqMvpOpq2Di2PFvOzQauYzX7PLFL09j7q
	 czo90fYVYggkHsFmllID/Z4qSPsQkbTo9dquxtKWd7rBtCrUAolJLKYUMYzIDu7YpS
	 EpxZ3cL/IDbvg==
Date: Mon, 24 Jun 2024 16:35:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
Message-ID: <93abf3e8-ceef-4ad4-923f-ad7f9d9d7f85@sirena.org.uk>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
 <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
 <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
 <9394ab7c-d628-489b-9b88-66eb11fca0d7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gELP69sMmSUr3IJ+"
Content-Disposition: inline
In-Reply-To: <9394ab7c-d628-489b-9b88-66eb11fca0d7@linux.intel.com>
X-Cookie: Allow 6 to 8 weeks for delivery.


--gELP69sMmSUr3IJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2024 at 05:26:37PM +0200, Pierre-Louis Bossart wrote:
> On 6/24/24 14:37, Mark Brown wrote:
> > On Mon, Jun 24, 2024 at 02:11:17PM +0200, Pierre-Louis Bossart wrote:
> >> From: Brent Lu <brent.lu@intel.com>

> >> Add a helper function max_98373_get_tx_mask() to get tx mask from
> >> max98373 ACPI device properties at runtime.

> > Similarly here.

> I may have misunderstood Brent's patch but this isn't a fix really, more
> a cleanup to use ACPI when possible, with a fallback to the existing
> hard-coded setup if ACPI properties are not found.

> I don't think it's a real 'fix' impacting users, in the linux-stable
> sense, nor that this needs to be back-ported with case.

> Brent, please chime in if I am mistaken?

Yes, in this case the issue is that everything else looked like it
should be a fix but this isn't.

--gELP69sMmSUr3IJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5klcACgkQJNaLcl1U
h9ATaQf7BS0MRUDq8ll2yZy/3GxQTDr1QWBMj4d8XiPFn1wPdMU4X105ErVUPZSa
hRop3SqlCJlrJ+YfqaCfjtq26517mHXrUtADTN3zmGcJIjG6UTmjox2pFxI82yFa
wxxDrRUCTLnZwIQJDZGy2zQPvXueWy9+psxHKMM2K7t47feb43Iw2drpxByKUUYQ
H1DCxOT1Dv6ZEsVLqpzrhfAuE8MAxBB75g76BoiDvJBpvyDheuVZqMfFIHbsCmwZ
sUPE7SvN04hbB5xaj88TFxcBoe1AfmL9roQAGUcd8w08QdNBRuOHht4291Dpa8mm
ss5+gq0LDmeHVQjVJo4Dq8yf7oeXpQ==
=0k7m
-----END PGP SIGNATURE-----

--gELP69sMmSUr3IJ+--
