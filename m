Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD952EC57C
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897087; cv=none; b=TXimnA+JbFY4kOGylD60Hj4i/uISsf7kdgWhs9H2ISfwWOCJGMWmyUZGJJ1mhVWx/wLkHKs57lmqk+G7Cyr0HwThx8hiIy7NojE1eowE8GJr5wGBhWefO/tUUiW7cEZn08d1lYhZr/53USbCtEzbDZx1T7eVHloL0uzaTqyZaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897087; c=relaxed/simple;
	bh=LvsWQyMcY79ubIJTVH4uGMeqT0CyYoJiWTh9CN1I+Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFE+vJnqsqfsxr2b7gakzp9WGlhtJPbB2hsnMsVZtEq5Nv8PMJZfhdUdvRJ/YLn0KYkMqYC3WQQynXLBZJitb1TvPLTgiYB5KSKUCX2bUWkmcB+ff3hAPQ0t+BhpxnOP1vjzSKPnTlH+NMbJnamrW+6zbhYlTAi0QfM2oL9lQFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7Pt/RLm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7Pt/RLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48467C4CEF0;
	Wed,  3 Sep 2025 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756897086;
	bh=LvsWQyMcY79ubIJTVH4uGMeqT0CyYoJiWTh9CN1I+Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7Pt/RLm3ALZHqjrt+7CWBDoQcCnXO/s3THxV7PMyJbSxWfy625xU92rGO8Satjsb
	 ondYCbyXuLDZgSeeSCscb50QiHJD2Iy2CmUyOtQri3hgQTAty1qdIjbU2YH7TbT+sV
	 OSINUsiM0ERxKsNqSnyXemD9CmzMlRX1YLjbN5Ll1U0NqcTPq3AzIPbzEyfxQVNwmV
	 m53mpriF6LLsgRV3B8AabBqmH23wzwP7I9afJek1PKZeea3Vknzp7Lgzbl9LWhDi+D
	 cW5B2Qn+RwaxLgo5h/W8s/oTnBCjscXBiLgQy+HoaJuXxRBE1CqHQk2lSygWWbla9b
	 NsrrvTLRVyV4g==
Date: Wed, 3 Sep 2025 11:58:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/17] ASoC: Intel: avs: Adjust platform names
Message-ID: <112981f8-9828-409d-8015-1b1fcd390343@sirena.org.uk>
References: <20250902094853.1231842-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLU4AtBleayeMKTJ"
Content-Disposition: inline
In-Reply-To: <20250902094853.1231842-1-cezary.rojewski@intel.com>
X-Cookie: You were s'posed to laugh!


--lLU4AtBleayeMKTJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2025 at 11:48:36AM +0200, Cezary Rojewski wrote:
> This series is a direct follow up to the recent
> machine-board-registration changes [1]. Initially, a number of smaller
> patchsets were part of a bigger block of changes. My attempt to split
> them up to make the review easier was unfortunately not successful [2].

Amadeusz, are you OK with these changes?

--lLU4AtBleayeMKTJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi4HzkACgkQJNaLcl1U
h9ATHQf/R57o0bknkonlBm49wfJqUxXI+c7xExYJq6tDjr0BYFrdN8UOYx2gkaxV
OHnUToGNm1L4amQn2bKdWcdZLW0OF2Q5ZPCf/JvTwudqAno3wp+f+TzEjMc+Uag8
iYg+aTCXgHcEtMMIJK8dNsghjZOHFIv85udB3K7dc1DhNU+QUkSnaLciYIo5wN99
6edb8ax6HYYNUZpIj543kqGPbBjUxBQdxzum9VXwrUc7Ib6I2o/sEL3uM6jlQphE
cb96/o3ADe0FwPpgqK39JA8NC9ZPH6xocRczO5PMTVmCnjvi9ZRG61mUZQDFDJJA
2dHiE+QaiqQ9G9IK2ZrXNCXwccuGYw==
=GbFV
-----END PGP SIGNATURE-----

--lLU4AtBleayeMKTJ--
