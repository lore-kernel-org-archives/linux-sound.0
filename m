Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E357302
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4zvvZUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1597C433C8;
	Thu,  7 Dec 2023 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701989781;
	bh=Gk4izPLJryxMUzNd/B9l1Pz1NWeIrxzkdQLr+umc/kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4zvvZUe1aof6SXqLH99lYfNvR3nBI1MUfVzUoq5fY1DoFL2bnyKzBKDOSvpXHZfY
	 72f4gdW4c4yJMm+NTxGyejeytMwAP+zmhplLQTe555tT9u71+oxO2LHF2HTHB2wCEa
	 rrD35ymKIrmXA17VMf1PmBvgzL6fRxaTIXnymu1ieqrBEBhg+9OKKqGiXP01C4SvL6
	 MszTP5Oo4tY+bOcG7TVdp5pdB3+A8TA42F9/DBUILcXPgOsfYRD6xu2blqzbNtwFvk
	 rtlDNRMnctxDCvL5Hke2xQCsd1ffu8MYjZ2SocKWvRY3VlsRVb4TcdQk9NirgMC24r
	 4PxywW6dMmVQQ==
Date: Thu, 7 Dec 2023 22:56:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 00/16] soundwire/ASoC: speed-up downloads with
 BTP/BRA protocol
Message-ID: <eb50a35d-9d77-48c2-ba76-bf5c1c3f1959@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XLs3TFacXRp3blk"
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Two is company, three is an orgy.


--1XLs3TFacXRp3blk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 04:29:28PM -0600, Pierre-Louis Bossart wrote:

> The MIPI specification and most of the new codecs support the Bulk
> Transfer Protocol (BTP) and specifically the Bulk Register Access
> (BRA) configuration. This mode reclaims the 'audio' data space of the
> SoundWire frame to send firmware/coefficients over the DataPort 0
> (DP0).

So the bulk register access is accessing registers that are also visible
through the one register at at time interface, just faster?

--1XLs3TFacXRp3blk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyTY4ACgkQJNaLcl1U
h9CPsgf+Nv6pIfHfZ2c0n0F2CCuIV+9NeaccprxAy2mvTo+tvoLIo58KmmqNdrHn
D4ENuSDWyDXCu0qOc9szZlOZXFZGZ9iDVRIs1M9KjhEBp4lU4F6mGofRXyDOoQim
h50/WaoCLmNG/U5wu2Q9lrpnidrY0sS8gZTNwXFFTpwqOwQLeasdXbD+iKRd6T/g
Ph8VyAeSHcOMucuaaq2RoH1MyjO9OFNsjeUE+eCIwHcZme6rOAIhBRmfOBUjhBeO
hhOhTW97ZrsvjkXlZq+/VLrZ9rzlBl+N1qJcGYpt4vfXcKllWaYCumt3Ds8EWa7x
3ogKAU0HoJwuAvg2txUUgpGdm+aqtQ==
=YcQ/
-----END PGP SIGNATURE-----

--1XLs3TFacXRp3blk--
