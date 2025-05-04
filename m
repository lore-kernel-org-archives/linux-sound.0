Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9AA29
	for <linux-sound@vger.kernel.org>; Sun,  4 May 2025 00:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746317289; cv=none; b=LVAlvql1laUPa2K/SWwpbol11yQmkSK+zseV6sCvU3PVkCXF9b9iAhzlLrDbly4BcCuq/l9d8IibvCUXAa5+DaRBGILxQvrqAoSdmat27pjgdj33iFSKD5vsiTza0HMdXpSupSEsIfi2Gsz0Ju7d+7lRccijDZOH5feqRgRVidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746317289; c=relaxed/simple;
	bh=QPwi7cD5qQzQmYNNbCaDvgZCKO0z0JgklHVPxH50RfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKmX/VoiJLcvtWR21hg4bu7SJAwqTp+l9/+zpXYeA9oBJ7hZuFkZOy/OmQXfBhTxX0MsCaN9SCwykNY7E2ZE9yjlaNlUQkru9dpdDZHbEtW353O7DBFlfp0xvtXuekVxRU0IaKAthTw+XuMEiWWRGBd55nUojL1Ok498XqkosUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7g4e+ri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7g4e+ri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FF1C4CEE3;
	Sun,  4 May 2025 00:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746317289;
	bh=QPwi7cD5qQzQmYNNbCaDvgZCKO0z0JgklHVPxH50RfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7g4e+ri650+FWiSNw/PfAji4lEnpOJS+6W1ajRDVPXM/cmcWx8iqPfOfz2fYyIze
	 fHbpyKgZmYQM1LVCDqSyCBBclJ+DbTeOcWJtwtwxohek6QLPNhRlQ0n4NQIYX1spg3
	 vfquFS57e8MWS2UPArQ2grdDzVe1moku3VtGPp3sjDfYXXXfWKSAbU3scMoTj+ouoX
	 kPmuQop8l2WYglHR/w7uq4TQA14/bUSR6WD9td2IcaH5M3JAK3FQEQ7BCLvuBh3oXR
	 NoMI5qn6SGZZXpJdevwGqzmq50ICAGQoK9xKn1FRz32LH/otOoGsGdwAGn96KBltGr
	 YmU5GObSfppFQ==
Date: Sun, 4 May 2025 09:08:05 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: sdw_utils: Remove num_platforms from simple
 DAI helper
Message-ID: <aBav5YeU5-TNHoEQ@finisterre.sirena.org.uk>
References: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eCqafhVhe/CbTvr9"
Content-Disposition: inline
In-Reply-To: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
X-Cookie: Well begun is half done.


--eCqafhVhe/CbTvr9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 29, 2025 at 10:39:30AM +0100, Charles Keepax wrote:
> There is no point in passing num_platforms into
> asoc_sdw_init_simple_dai_link(). Firstly, as a single pointer for the
> component name is passed in only a single string can be passed and
> secondly if it is a complex DAI with multiple platforms it would make
> more sense to use asoc_sdw_init_dai_link().

> Fixes: 59f8b622d52e ("ASoC: intel/sdw_utils: refactor init_dai_link() and init_simple_dai_link()")

The changelog doesn't seem to describe a bug here...

--eCqafhVhe/CbTvr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgWr+QACgkQJNaLcl1U
h9CaSgf/c+RwKGKpHL54+fiV6V2UWWUd+4mfwJui4gtB0wnfV2Ub8CnnE/4aRa8T
fALQhy3j1SRpfZRQdT0lgMiY02avoowW6gEPl2DC1VziplM3aSkKoTC6WMuelV/V
hBRWYKUemOdxEAum9cgBfK1PlIEAY6LT/UcQmrfhHMZVf6J9FjoLJsoYkykN+QFK
GM0owhnty+T0nJGZIhgr1SkRXOcIDOxEKy3m5WBpD5jk62JSAzWW3T3WJBy0rqjM
zj1ZZF14y7xN6LpG+VHIlTuM3NC0qRSqVci6Jk8PYMWZHLXB/m21bHSavTEykrsi
1jlze2jWOuE8jhh9ybM2LA1Vz/wSXQ==
=yxYz
-----END PGP SIGNATURE-----

--eCqafhVhe/CbTvr9--
