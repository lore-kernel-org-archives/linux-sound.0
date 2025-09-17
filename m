Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5BD32BBE2
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758111254; cv=none; b=ZoHUZIKhiZL0K2l/U4EVyusMovhfReZ9h3S5vRFgpdSTfCmSgDP+LiOGVnYp10fZ+By572/cbzw/GMZcQYMG4sSwKS/2DiTRElMWeq9qnmlCR7d0um9hVdgwb27zEDtCdIHOIa7uoKfP9iZc9+BqjFyNzpxUd219bFunSOYZgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758111254; c=relaxed/simple;
	bh=FCMRwsidcdL9DWisFCckxJ5XMAX0R4oYfEVYN6VnGcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPww9qWI2/SvbhhhcI92LkvGHDsCV5WXgzjDadZdX1KXee+UI5qtIzp+HJBcUNkIotL15yBAOVegypJsK5MeRi8E1XiR17pW2iIkda4ZOkdbHbdn1nO+vmjhiAT9NsLMB113LMdhb0I8TWwHrKhW7NasxBHMLtowm6kM6Bz+Chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2N2P8Q+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2N2P8Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2CAC4CEF5;
	Wed, 17 Sep 2025 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758111253;
	bh=FCMRwsidcdL9DWisFCckxJ5XMAX0R4oYfEVYN6VnGcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2N2P8Q++cSjD5ErWoFDSuvaiAjggMa8x81Q1Nn9jjxA0AVJhciL4Izw+rGP1yLD2
	 3CLet4JwfMPIDnNlrGCUwwGhxcfkrhW2f3q0vEF1XxtX1imbJh11bZtuBjUmJ/ok7s
	 dB+LF4vDKGNMjnkM+NNNNXk9oHYwrPfFOIAbVJHTAZvVymQ7oe+RY0lBfKQVsowSFM
	 43wFf7nvQj9Q6M0q4Q+aFV29RDOsY5JuBlZJKAhEtIHDMUj+EPR1C+TKVQuolLtkzT
	 nZS8pTBGTo4CKLy0kmP+cdo1dcBB/7utFAra21nEoHyBSun4Lk80tMm6JArtm8NRLL
	 4Cvsq0jg/e9eA==
Date: Wed, 17 Sep 2025 13:14:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <ea3cadd8-95c3-4b4d-b1fb-c8ee23f36804@sirena.org.uk>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
 <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
 <aMlrfFqcS8gu9XXj@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="609c5Qcnp+jDTCKR"
Content-Disposition: inline
In-Reply-To: <aMlrfFqcS8gu9XXj@opensource.cirrus.com>
X-Cookie: Lake Erie died for your sins.


--609c5Qcnp+jDTCKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2025 at 02:51:56PM +0100, Charles Keepax wrote:
> On Tue, Sep 16, 2025 at 02:38:06PM +0100, Mark Brown wrote:

> > The identifier is added by some tree in -next but is not present in
> > mainline or my tree.

> Yeah apologies for that, it is called out in the cover letter.
> But I wanted to get the review started as soon as we could, as
> most of the SDCA stuff has seen a fair few rounds of review. If
> we are ready to merge it, we would need to organise some sort
> of immutable branch with Rafael, he is CCed on the series, for
> visibility.

I at least wanted to throw it into CI since it looked to be settling
down.  I think at this point it might be easier to just wait the three
weeks or so for -rc1, that gives a bit more time for review and it's a
lot less effort.

--609c5Qcnp+jDTCKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKpg8ACgkQJNaLcl1U
h9Bs+gf/U73IZxElpHprpTy+ZJfxr5MKsDb5GGIQVq9Ilv5kjuWfUKwj4VPxYFze
P2tALVMp5MxSaU4rrloBAkwP6DoYw9tbq6OUNox90O6oLhzs9ul78Bd6yw/k7ySV
W4U3Q1aExe19zGANFhBHS+jY72s6rIWGbz05tLKrvIBO6cPzLWJq3Vi0337+VIIp
9mqQ8puv97VPQd/YQlMZ/hJcmCfFQ0AqNbmavjzMk5i7crEC8bsKk6p32JWyyLpI
B/3lRNRSvPs278+ZQnxmT4uJBNy/GtHKZDNs6+QPx2lGWeShl+TuKE/vKySplwjI
lnherKDkdYjU0aMrhsGCCATpyQTX8A==
=l5ZK
-----END PGP SIGNATURE-----

--609c5Qcnp+jDTCKR--
