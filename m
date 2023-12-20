Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810783EA95
	for <linux-sound@vger.kernel.org>; Wed, 20 Dec 2023 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeGZaNVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51684C433C7;
	Wed, 20 Dec 2023 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703096945;
	bh=bwfx1VrVY/TB4NsCugn+B4teBHmThgHszcjdmmNdGtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeGZaNVc8nIoIRi5bdfhEOv5SnQ3PAoOnWrSLFIalUohTAEGNh0SSvA/Vo/Yc0JaH
	 nlf+xJF4LeO2E4LBVyefLUbJDwV9aLQwBJKjvAH2dlHMmhoIG+R06T3IwZtzT4SEbC
	 ZTWhMZ7jeV0Tyc7gofnm/+fCAG4o/ii6b8y3jhdg2Di88P8zyCDGXd3w83agGUwRU2
	 +3PWY44u6ErbN8tWzTgMxhXauc3WHONHpTkDXGBOb/OwSXbXUvNz0BaoQ2Fxe/h4kR
	 +pSbrumyilR6B9zqWXQXMLANLmIaeYXC8CyDw9poFpR41VnJS4/6RgYsocvzzsG/W5
	 UWm0LE0y8wYPg==
Date: Wed, 20 Dec 2023 18:28:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	tiwai@suse.de, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <f555a9f3-2c84-4cff-9eed-725514fb443b@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
 <20231220151631.GD14858@ediswmail.ad.cirrus.com>
 <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C8sfTuKxQW1uWAiD"
Content-Disposition: inline
In-Reply-To: <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
X-Cookie: Apply only to affected area.


--C8sfTuKxQW1uWAiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 20, 2023 at 07:26:24PM +0100, Pierre-Louis Bossart wrote:

> Put differently: is there any sustained objection to the proposal of
> extending regmap with async BRA transfers?

Not from me, and I agree that it makes sense to do it once the
underlying SoundWire bits are in place.

--C8sfTuKxQW1uWAiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWDMmoACgkQJNaLcl1U
h9BjQwf/dNHgBeN2zx7LCtcnwVHRQNvrDRedglZRXkijstSryyabkdcC0CyMyhjr
b/B0oi8HSbl988Oo84IweKRh7xzSS5Gh4hD8r1iEHYpSO2/Jhi1Bkoiv+bRyaUrx
m3XvTepWfmSZHQNNigiq/wdtl6zbY5uKuxEiTxIxkIJohIdm4Nwq8Cfrr0t/Ew7i
thuk7rc8n/QO4KY3+csruF482kDATXr1wCJEo4wzs/jgDa8nRNiTUju/74XfUzG4
5RAwx9bZZA++FgDLuODqlbDIXmngSStPp95xVMQThceYiH1cSA5PLRXbcW4rWi7b
jJXiYlibo8+z+wBYcc2pjzCTbHGBqA==
=j7/c
-----END PGP SIGNATURE-----

--C8sfTuKxQW1uWAiD--
