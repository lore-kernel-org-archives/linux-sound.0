Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B092031A
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xie/VrEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DF2C433C8;
	Tue, 19 Dec 2023 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703004838;
	bh=T8jB/yO9FUu/W4RhlJE5EiKrrszTT5Rev2qthCXr0eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xie/VrEdybQkb6KXqrZ2qDnQ7l4hZlvK9ELDz0/6OyB8vx33/L61NVw9xK9I6vQIe
	 yp/r6jm17wAwFH5OmAIAtJRUPUA9xqwef+f+FMye6ZX93AlLnPfJO5ekcWeWXP+g9D
	 T8khun+8VHsAnD/DFChHniVyTNiGNpxSrIL8G+30MPfnydOKJn5D3xGDSOT/KuW04S
	 zyHwMlvweJreyB/4WIoVsAWnL43jUvJD7kxaO1DzY/3WVF/TgOVYsgoG5jLvCKyDBa
	 uvD13akTIZ2B2dhD+W+ptDBB9uKk5ewf0jMisBE8SzwmDP70yWCRK6RZH8PsZa21qq
	 ogMUsoOyVVctw==
Date: Tue, 19 Dec 2023 16:53:51 +0000
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
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OLqZmS3zSp2PK1pr"
Content-Disposition: inline
In-Reply-To: <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
X-Cookie: System restarting, wait...


--OLqZmS3zSp2PK1pr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:

> > grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
> > or there's the rbtree cache sync code which uses a back door to go into
> > an async mode.  Basically just variants of all the normal regmap I/O
> > calls with a _complete() call you can use to wait for everything to
> > happen.  The implementation is a bit heavyweight since it was written to
> > work with fairly slow buses.

> I spent a fair amount of time this afternoon trying to understand the
> regmap_async parts, and I am not following where in the code there is an
> ordering requirement/enforcement between async and sync usages.

The only actual async implementation is SPI which processes things in
order of submission, the sync API wraps the async API.

> Also is this just me spacing out or there is no regmap_raw_read_async()?

Right, there was never any need.

--OLqZmS3zSp2PK1pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWByp4ACgkQJNaLcl1U
h9AXugf/dPfmV0KskeKlFgS6fzM62vN5KTrHj/4XqqMTkHFV1a5FRrK3OUGWVnl9
DkP+gIrkm78rgSA+fHWLpqfAQ3glNlsqevFZ7YuTPxf6BII0IfjbhZ1ZkTwfTFkh
9IC1xQcFEiSVXzFKSlpafCOR2fX0AcauX6F4QFzzk8hKabeJy9UMkMqsrAUWtUyl
tOTd8igq8hQumSRCUGttN7Jqcls5ZntR+uBbFXIj+XnvNO54XXRYQj7tK7IHgAiv
tYrqIafZYK61FlHktmMpNIMAKEJkWe0My+7GEHauk57ryX+F13CdpyDMw8LmpDQ1
5UDeEdoYmAWjUCdFAcg9YGPOYUT36A==
=Ei3c
-----END PGP SIGNATURE-----

--OLqZmS3zSp2PK1pr--
