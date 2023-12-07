Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC8481CD
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ermeSQN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D639C433C7;
	Thu,  7 Dec 2023 23:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701991754;
	bh=w+3Svb6n9Ly6uKhJZ64/Ys4Z7dzGeHoD8YN3bJljioA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ermeSQN8+asnah9uhS6WaitYbAr1xE7aUmImekpaKpbPFzcL0m+HpB29MQE2X3LY7
	 hMxwAd/gaH2IwVlNawrE9wDIoqSiot1JoJ6o0xsC2787+FihMTnHGTp6NnnuXafHtk
	 i58uhtLi0lk/sgYXiqraGdCugHaiYD+7qZxtbMKEGgAo7XhRoNQpRIwhH7jqFC2+aZ
	 OByShy8mH9wb2lB93mzUaaLqm2JO3Xr+dpFwPkJHtLe8LpECQJ1tP45EHz1fyEAZvC
	 Pe6Y927R+e0ytugEpWpz5RLr25XgcKAFW5EpPEvgzGDBCtbNCAGjxY8obHW2tPEkJo
	 lwEuD1JWX6zLQ==
Date: Thu, 7 Dec 2023 23:29:07 +0000
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
Message-ID: <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XJULi6ZoZiphACov"
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Two is company, three is an orgy.


--XJULi6ZoZiphACov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 04:29:29PM -0600, Pierre-Louis Bossart wrote:

> +Addressing restrictions
> +-----------------------
> +
> +The Device Number specified in the Header follows the SoundWire
> +definitions, and broadcast and group addressing are
> +permitted. However, in reality it is very unlikely that the exact same
> +binary data needs to be provided to the two different Peripheral
> +devices. The Linux implementation only allows for transfers to a
> +single device at a time.

For the firmware download case it seems likely that this won't always be
the case, but it's definitely a thing that could be done incrementally.

> +Regmap use
> +~~~~~~~~~~

> +Existing codec drivers rely on regmap to download firmware to
> +Peripherals, so at a high-level it would seem natural to combine BRA
> +and regmap. The regmap layer could check if BRA is available or not,
> +and use a regular read-write command channel in the latter case.

> +However, the regmap layer does not have information on latency or how
> +critical a BRA transfer is. It would make more sense to let the codec
> +driver make decisions (wait, timeout, fallback to regular
> +read/writes).

These don't seem like insurmountable obstacles - they feel more like a
copy break kind of situation where we can infer things from the pattern
of transactions, and there's always the possibility of adding some calls
to give regmap more high level information about the overall state of
the device.  One of the expected usage patterns with cache only mode is
to build up a final register state then let the cache code work out the
optimal pattern to actually write that out.

> +In addition, the hardware may lose context and ask for the firmware to
> +be downloaded again. The firmware is not however a fixed definition,
> +the SDCA definition allows the hardware to request an updated firmware
> +or a different coefficient table to deal with specific environment
> +conditions. In other words, traditional regmap cache management is not
> +good enough, the Peripheral driver is required track hardware
> +notifications and react accordingly.

I might be missing something but those requests for redownload sound
like things that would occur regardless of the mechanism used to perform
the I/O?

> +Concurrency between BRA and regular read/write
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> +The existing 'nread/nwrite' API already relies on a notion of start
> +address and number of bytes, so it would be possible to extend this
> +API with a 'hint' requesting BPT/BRA be used.

> +However BRA transfers could be quite long, and the use of a single
> +mutex for regular read/write and BRA is a show-stopper. Independent
> +operation of the control/command and BRA transfers is a fundamental
> +requirement, e.g. to change the volume level with the existing regmap
> +interface while downloading firmware.

> +This places the burden on the codec driver to verify that there is no
> +concurrent access to the same address with the command/control
> +protocol and the BRA protocol.

This makes me feel very nervous about robustness.  I do note that regmap
has an async interface which is currently only used for SPI and really
only by the Cirrus DSPs (plus opportunisticly by rbtree cache sync), the
original usage was to fill the pipleine of SPI controllers so we can
ideally push data entirely from interrupt.  TBH that was done before SMP
became standard and it's a lot less clear in this day and age that this
is actually helpful, the overhead of cross core synchronisation likely
obliterates any benefit.  There's sufficently few users that we could
make API changes readily to fit better.

> +One possible strategy to speed-up all initialization tasks would be to
> +start a BRA transfer for firmware download, then deal with all the
> +"regular" read/writes in parallel with the command channel, and last
> +to wait for the BRA transfers to complete. This would allow for a
> +degree of overlap instead of a purely sequential solution. As a
> +results, the BRA API must support async transfers and expose a
> +separate wait function.

This feels a lot like it could map onto the regmap async interface, it
would need a bit of a rework (mainly that currently they provide
ordering guarantees with respect to both each other and sync I/O) but
those could be removed with some care) but it's got the "here's a list
of I/O, here's another call to ensure it's all actually happened" thing.
It sounds very much like how I was thinking of the async API when I was
writing it and the initial users.

It's this bit that really got me thinking it could fit well into regmap.

> +Error handling
> +~~~~~~~~~~~~~~
> +
> +The expected response to a 'bra_message' and follow-up behavior may
> +vary:
> +
> +   (1) A Peripheral driver may want to receive an immediate -EBUSY
> +       response if the BRA protocol is not available at a given time.
> +
> +   (2) A Peripheral driver may want to wait until a timeout for the
> +       on-going transfer to be handled
> +
> +   (3) A Peripheral driver may want to wait until existing BRA
> +       transfers complete or deal with BRA as a background task when
> +       audio transfers stop. In this case, there would be no timeout,
> +       and the operation may not happen if the platform is suspended.

Option 3 would be a jump for regmap.

--XJULi6ZoZiphACov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVyVUIACgkQJNaLcl1U
h9B4/Qf+IaFH8jmqjcL8xV2f9B7E3egdTFeoh2xbNIzGvsuxFsZ03uMuaZqL8I8r
mR/gelMNyXJFHQqBfpPJqzG65eCeeI7pSaok2i8ALokpPFbMbu5FLHomHQNELRXx
tCHL4gLgUTN3yuKchpcrnB3M3MxJQj3C2EseaEmWI2UkERv+57lqRHv1ER9zEP37
8nFRPoAFQZw4BFVOC4Zfyhd71O7XZKi6kLZc3EKlOHtjWh1S/RUI6K6sFf2U9LXb
544H+Dm9YQgp7gejXy3h+0JHWlnV3D/Z5yJ+Vnldgz6hMgfs9HXWkfoqpuU3kWVU
K0peOA56AcP5CwlEsB72nkEfgccarQ==
=L/7P
-----END PGP SIGNATURE-----

--XJULi6ZoZiphACov--
