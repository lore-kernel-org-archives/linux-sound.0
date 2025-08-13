Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EFB1E520D
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755089866; cv=none; b=Sug1/B3jVzD4x+eh3zvCofBHTNaKwkKo7aDP5Op8vuv+vIUEKwFL7I31q4i8sj7ZNqFL97VeYC6xf99upkky7fdV4R2OGYmp+a3iBRfjY0BYr1QItIQvpNLLW9BZ4jH1TxUR5S6FD0V1NYgappt2G2GfmP8Izbs5JwZNZ2MKbsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755089866; c=relaxed/simple;
	bh=mRp7krziaGDMdyQ0zHD3qUlJrYZMJmsfivKslCVYrQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZvMsjBZOU0ppwWsR2gPe7rhFd86hZFzjH0m/kX1ee6lGBgx/tvFdn0U6cPsy+qEa0/j1msONaF9qhC/kmIE+t/IqH1tuTTHAT+lP6hAzRn2V/VMsW/t7lgaT/HodMWAZgSLNo8QF8j3DawerAXUlOgGtcck3Gr4/krAsvOe1Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPKp05t/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPKp05t/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F49AC4CEF5;
	Wed, 13 Aug 2025 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755089866;
	bh=mRp7krziaGDMdyQ0zHD3qUlJrYZMJmsfivKslCVYrQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPKp05t/mAACleM8QYc85J/0rWkixw52SqfLLCBzRTCVuzkTu/guQLSo4WP5DevoD
	 ivIJ5TFjjnLjeMyEN9vbR0dbupv4hrT/7fHcokztflprgXps0zTRCvUF2YEzoVgudx
	 EYDzV54YUq/c3I2hzR0a2mk5jFGMSJDpyPrgO5GrS51H3uB0Ml+vxA8Ln/ZcetGWgE
	 rj/HianjreMZhalK0GtApx80uRNSihI55vq7WvuDi4CUj4063a0WMF8ybUu2k2prSw
	 WWj4HPKfED45SmNkSBf0TdBSsWFmUczOkPoaMCZnY9EWqRSK3SICU0Y01LjhO4/Qh2
	 f6JN2Baem/DHg==
Date: Wed, 13 Aug 2025 13:57:41 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, Deep.Harsora@dell.com
Subject: Re: [PATCH] ASoC: rt1321: Add RT1321 amplifier support
Message-ID: <7ff24fbb-00e9-4a1a-b674-d66255b73ebe@sirena.org.uk>
References: <20250813090019.1404356-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uO9I0N7poiJ3o15x"
Content-Disposition: inline
In-Reply-To: <20250813090019.1404356-1-shumingf@realtek.com>
X-Cookie: Turn the other cheek.


--uO9I0N7poiJ3o15x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 13, 2025 at 05:00:19PM +0800, shumingf@realtek.com wrote:

> -	if (rt1320->version_id <= RT1320_VB)
> -		filename = RT1320_VAB_MCU_PATCH;
> -	else
> -		filename = RT1320_VC_MCU_PATCH;
> +	if (rt1320->dev_id == RT1320_DEV_ID) {
> +		if (rt1320->version_id <= RT1320_VB)
> +			filename = RT1320_VAB_MCU_PATCH;
> +		else
> +			filename = RT1320_VC_MCU_PATCH;
> +		min_addr = 0x10007000;
> +		max_addr = 0x10007fff;
> +	} else if (rt1320->dev_id == RT1321_DEV_ID) {
> +		filename = RT1321_VA_MCU_PATCH;
> +		min_addr = 0x10008000;
> +		max_addr = 0x10008fff;
> +	} else {
> +		dev_err(&slave->dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
> +		return;
> +	}

These things are generally more scalably written as switch statements -
it makes it easier to add new cases.

--uO9I0N7poiJ3o15x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmici8UACgkQJNaLcl1U
h9BTngf/VUq15zP9IWREzdsTLWtNJqp8/w+EOwJMFbW2vBNK2kVVLwP/xBeZ12lo
22vOY0su+Gqi/vWQCbJAui9azCpTQZWtKer9ELCUK4tIKmglPN87Pyhm0VZq+FdR
rhVje9PawEL2KEEO+ySLp3Y4TlWgC51v/ky6mhPbCoN4H9AmJyFS7eJmo/wlkkqf
YDJnRoylLbROYN5LNFMJW+yEegr+jC9uu7JwrRgFaevQj9Y+ONDM8BuUo6APqGJs
B1uoauNskUedznKcwNfKGPV2mCMOXr8+RNOxg8EMkU6uTzuprU2Ht6yuhoMuqjNO
q3HA8JmvL3USNep70x12fSAclGcFNg==
=sThn
-----END PGP SIGNATURE-----

--uO9I0N7poiJ3o15x--
