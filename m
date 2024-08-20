Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1A18E054
	for <linux-sound@vger.kernel.org>; Tue, 20 Aug 2024 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724154823; cv=none; b=ibik8wcIGscskU3yv33AxaEKwmruI8AuF1Awn1LkW44FfgyotBWSzoT6+HVyRF6NW0Y47GGjQ1WD0LzEMEkxKYRMylF7E9m4O+eVji9wl6MFq4ahdPRBulKdDBixKx6y5YhUI+CNg2YfF+nE+a3RaOSqd18c1FC5k/6gkOxROQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724154823; c=relaxed/simple;
	bh=TP9TtVQgR6n4hw0qJHDIBA6p/NB82aSLfZbbvJIyc0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmpK469cJORKvBJjC9sglLqAjfhIrNTq8/JQqiCOy5U+a0/dXcwIRhwvQGJJg23qf43qCx3NBjaoxRHOVe4CbvZ3M0oaK3q4bbLl3d2ZKyQqk7ljISYXVNQ2SJhcx0kNH+jmdbvO8pasyinkalQlPvt/ZTj0WhSQN9r8cksAeGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etlVxEdF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etlVxEdF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8666C4AF0F;
	Tue, 20 Aug 2024 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724154823;
	bh=TP9TtVQgR6n4hw0qJHDIBA6p/NB82aSLfZbbvJIyc0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etlVxEdFB3HsVRgybpMy0QxV3pepYuet87GF3D1Fx0AKBdkuJxL8lva5EW1BTOrsg
	 UvaOhXnJAZ21kg1tu+NoR1jy21KMQhxgduw6LCwc8HeG6Xnd8Wnbd7IkZS2s3fZ/T0
	 8CEz6gg68p/diAWlIDUBIYWLdmmupTCocA2rN6kYzlghcEw9qVMSnVJ2Ahd/EJ0L/p
	 dO9f4m1a+bbcO//rYoHMfaBuZB8i/T3EhG4SXTNvekGfixQLgEzcAx2JlJpgYeUD2D
	 gBcoVsUillohgE5TfB0mwRt5wQ6L6M5P5XNdGAdBV4i+sSzhlgdOIUJTyyr8C5B+Fp
	 OrgrVnKVtY9tw==
Date: Tue, 20 Aug 2024 12:53:37 +0100
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
Message-ID: <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3npxPyIhAGu7xZY0"
Content-Disposition: inline
In-Reply-To: <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
X-Cookie: You are false data.


--3npxPyIhAGu7xZY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2024 at 09:48:05AM +0200, Pierre-Louis Bossart wrote:

> > This feels a lot like it could map onto the regmap async interface, it
> > would need a bit of a rework (mainly that currently they provide
> > ordering guarantees with respect to both each other and sync I/O) but
> > those could be removed with some care) but it's got the "here's a list
> > of I/O, here's another call to ensure it's all actually happened" thing.
> > It sounds very much like how I was thinking of the async API when I was
> > writing it and the initial users.

> > It's this bit that really got me thinking it could fit well into regmap.

> Do I get this right that these async capabilities could be used to
> enable this faster SoundWire protocol, but the regular regmap_write()
> could still happen in parallel with these async transfers? This could be
> useful if e.g. there's a jack detection while downloading firmware for
> another function.

As far as the regmap core is concerned, yes - with SPI we do wind up
with ordering but that's because the SPI sync API is a thin wrapper
around the SPI async API rather than anything regmap does.

> The only thing that would need to be extended is that we'd need
> additional callbacks to check if the protocol is supported on a given
> hardware/firmware platform, and if there's no audio stream. In these
> cases the async writes would be demoted to regular writes. Otherwise the
> bus would be locked to make sure no reconfiguration takes place while
> the firmware download happens, and unlocked when the transfer ends.

Those callbacks seem reasonable.  We already do the demotion to sync for
buses that don't have async, it'd just need to be made dynamic.

--3npxPyIhAGu7xZY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbEg8AACgkQJNaLcl1U
h9BhCwf7BrVu6S4wLOF8+95Z3N2BxswzQnSQX7eYOcdYE04H4zXaORGHKClsnMNM
4M4so+loGfrKwPojTpGyORyikP4G4G+sxtPCZZ7poNkwtBYc8yFJa/gvP+pUZkfT
oPyb2QguRJ2jtrvZg3spm1xns7Y6SfNN6XOFRuI8WatCqHvGvweC0QvkjOvIOO7S
3AuD9DrLyee0bZE9BpVYbrk5dC/xaD44d/Domj8PuGZcIsSdlfrsIw/Bvi2rYhcr
yk704B0c5K/BgiKxV4WFwWzspSDgZTyvNaaL/fYa4k/TkFRxX/1Rn8KWEeMFjCI/
UI+vVoLw5Mc+WQIz9veGqInwETZV2g==
=9A04
-----END PGP SIGNATURE-----

--3npxPyIhAGu7xZY0--
