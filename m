Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6518E361
	for <linux-sound@vger.kernel.org>; Tue, 20 Aug 2024 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724166556; cv=none; b=DC8UBkzqPUjHz6RlKYOh4KEt+5xMCQgMbJRo7TxJB1u7c6zrz8YRZ9Jik3MgNiQFgRgMpP4etMcHQmiLYMzX6o2jyN6Zd0+CxGmKhkavVpKbOLMj2UuH68pjcm5xGSR9mUwwufT3griovi7mhqVj6ak+W+0jEO8S1WKHoYVjbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724166556; c=relaxed/simple;
	bh=KiHywWfuUc+o/StRBaQwmAr/5d75+0UNF/dulRFDC9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvXQCM4NJCvMGX95zvxEV1P6l2tSmQTHN87shdbHozoPVRNY8caf5fJ8YO5Qyyr8bR7gOGN6re5ND3QVBR+mExNvBBGOEL9+Pwd2zMUBQfgEd8YnzVWhZFa+W9WmTdjSkbAVUZIzkDhm2wz41F91eu12C38cvOvx1HUERRlzDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrBPsUFa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrBPsUFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF86AC4AF0F;
	Tue, 20 Aug 2024 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724166556;
	bh=KiHywWfuUc+o/StRBaQwmAr/5d75+0UNF/dulRFDC9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrBPsUFa15qG1SwQRydjwJx6NwTz9RGv34gGpaTiZWei6rlWKMEXJJGEYIAsEYd4e
	 oH35ZUlYgdioL0w7+JTMISl3Zf38XGwSvW5CU6pOxks4kfS3YETzwu0FxoKXHl3nKp
	 oWHz1E3QAF8Vjmqtqn2kNJKzTIA6r7hsVdZgYnGFEBj5IvAkRsmtYAo2g73B/kf8/o
	 xY2ovV3Qh+sMLsgwVHaX8D8uzsE8XHjEj+q1Fk9ce74l2VqXIzFHRDYVhrs/u+fOSi
	 JXJ1DVx7vW2Rigbp6aUdwkkZVXrpuzDLCTd4AbDrSytcTFbA488ArmGYh3nQv4Trnd
	 dHZBHge2GcLFA==
Date: Tue, 20 Aug 2024 16:09:08 +0100
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
Message-ID: <c3f0e732-7118-4868-8b61-a9c288aee1cc@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
 <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
 <fe930297-a6f6-43cb-86cf-d49939dc5090@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OHDe/+eYMNW5Bw4n"
Content-Disposition: inline
In-Reply-To: <fe930297-a6f6-43cb-86cf-d49939dc5090@linux.intel.com>
X-Cookie: You are false data.


--OHDe/+eYMNW5Bw4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 04:58:30PM +0200, Pierre-Louis Bossart wrote:
> On 8/20/24 13:53, Mark Brown wrote:

> > As far as the regmap core is concerned, yes - with SPI we do wind up
> > with ordering but that's because the SPI sync API is a thin wrapper
> > around the SPI async API rather than anything regmap does.

> ok. I am struggling a bit to adjust the plumbing that was obviously
> defined for SPI.

> The regmap async_write() doesn't have any wait, but there's a notifier
> that needs to be called by *something* that waits. I think the SPI layer
> has a set of kthreads but in our case we could just rely on a a
> workqueue after 1ms or something and do the wait then for the DMAs to
> complete and finally call the notifier to wake-up the regmap stuff.

=46rom the regmap point of view the expectation is that when the caller
wants to know that all the I/Os have actually happened it should call
regmap_async_complete() which will do the actual blocking.  regmap
itself won't autonomously wait for anything, it's up to the caller to do
that (presumably it will at some point care).

--OHDe/+eYMNW5Bw4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbEsZMACgkQJNaLcl1U
h9BTaAf/Sg96OU2OZYHZQtScOCZXaX4NSWY4h4fmi8obkPYGy+sk7iMAyBOU1w0b
/MvV8GHE53CBkj6mlamTFY/2KwXIvbTXOJ4HPfqqPLBr881d7ywMEfNl23GF3SZx
qsQNCvRkYr4No+j0YxqDDuNlvgxnhx3UqwH0QRT2Oa0cmQhsI7KH7pT9CUWBUY50
7vjtSUv5VIglZX8mut4JyaNSkKxeUFo1JDM3F7JN+bR2YzCKJeVTvshQtVbS0Nl+
1/tfvS+5gzbLbSwQ7yesWgbiYUWpDf+r0yib1GrGl5xdasqNKcbt+5Y5iu6+h/39
mUQKmtqzE+oHOHGCSOm+LvHNzP1M8g==
=43Eu
-----END PGP SIGNATURE-----

--OHDe/+eYMNW5Bw4n--
