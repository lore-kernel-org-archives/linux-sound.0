Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECDB61699;
	Tue, 12 Dec 2023 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I91eYWU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DC5C433C8;
	Tue, 12 Dec 2023 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702387785;
	bh=akGtfnhFjBe2nMJrOHrsifjEJFT+LBYPgT6oz4LXzME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I91eYWU0dv2do9ItHh6PHh+aRwaLPA/Jd33srZNyc4mUx4sOJgjBuorFWbE+rTlww
	 da04RlXImPAOY/EeFm0ecbpfzal6l/0MB8Gpvwfzvu9E2x8xX/gA9oZ4OrOKbAxriD
	 OXu6NH8Mdxy4lQP7VDPmqssq2+cfAsHTIT0f5zQ2M//YBmNMxG4wZqSGuuGP9/MyhU
	 ACUXS9vYpiMby8t/07sCD0X7ONeiKRPxciEIFUdEKfqzVqOB/ybLqBlV6TPK2w5BN/
	 1u3+ykiL8sD+rTKQpRVbXWslikh8D4wpZlI6Os7OR5Ss6KZSAxBrbXGN4AiLZ0z4x6
	 u4y155nUT91VA==
Date: Tue, 12 Dec 2023 13:29:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: conor+dt@kernel.org, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, devicetree@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, soyer@irl.hu, tiwai@suse.de,
	peeyush@ti.com, navada@ti.com
Subject: Re: [PATCH v1] ASoC: tas2562: remove tas2563 into driver
Message-ID: <872750ee-92b1-4cdc-940d-50ac7873d8b3@sirena.org.uk>
References: <20231212050831.982-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BNqNRrW+YuOQn9ax"
Content-Disposition: inline
In-Reply-To: <20231212050831.982-1-shenghao-ding@ti.com>
X-Cookie: If rash develops, discontinue use.


--BNqNRrW+YuOQn9ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 12, 2023 at 01:08:31PM +0800, Shenghao Ding wrote:
> Remove tas2563 from tas2562, it will be supported in separated driver code.

It would be better to do this as part of adding the new, split out
support - otherwise users might get a release which temporarily drops
the support.

--BNqNRrW+YuOQn9ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV4YEEACgkQJNaLcl1U
h9D2Bwf9Gh3XP7TKDQmWleAoc1a0UkGsfNxJCgVE2O06Y4V6BdXElgFkZFNFzSWn
hEh5g+XfthG2fcOSh4sVmsjkjbe/mccqOldIYX0oZ5Go9C0w3wL8aTsKQTk6t1IQ
LQZwhIoYnbcXw0CQ+QpoYOV5FB5yixfpDpa3T8GH8eLip/vYYviG9oH73BrmfvHB
5BiKoYgkY0jviIZ/L97ZufFNK3bph/5QgzzScOXSZVbXNuwWZBiCa9Dzp62T5uQw
26zqC7ixWAopZRTuaabhMvWkVpfgKC+bKAhsoX5wXdvX9EgUg+/KcacghVB+UNAA
ydZSQwimhuiW1pl9wU972JxMxI0Dpw==
=MQ2x
-----END PGP SIGNATURE-----

--BNqNRrW+YuOQn9ax--
