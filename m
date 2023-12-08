Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30A81D55F
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcJ37UzX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3258FC433C8;
	Fri,  8 Dec 2023 21:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702072156;
	bh=d2psA4cl4ymIOCGDsJbbgAjeRWSn5Zqfkh2ZcdDobkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcJ37UzX85WmEgj5IKkzkS7vWlo9cZR/oqnSQlF/kST+T1Mo7df65S7WtSo+yAbZG
	 z/JI190QBjfCB5y+Qkr5VI32RYj2FGQXCsw0e9YDf5LzeiplC/mN4rrx7qYsURl3W2
	 5o829UC1qDcgcSxpQnm/gH95zazY9gDIXJtL9JTS7ns+84/ok28ZWiSiwyl+Wq4dtY
	 y/rz7UPRwTlq1PCMmRA5Ve+s3RVBP72rk0SkVkW5auts1d7hHirzxrKS50BQNvbMy7
	 vyBL52VBltdC/w2puD6jwuwxXhAncdSL7UdQQ2FklGpzBpclyIFfQPb+++DBvIJKur
	 hF178BmVK6qWA==
Date: Fri, 8 Dec 2023 21:49:13 +0000
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
Message-ID: <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FhLkZBn3JkiCzQ+m"
Content-Disposition: inline
In-Reply-To: <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
X-Cookie: You might have mail.


--FhLkZBn3JkiCzQ+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 06:56:55PM -0600, Pierre-Louis Bossart wrote:

> >> +The Device Number specified in the Header follows the SoundWire
> >> +definitions, and broadcast and group addressing are
> >> +permitted. However, in reality it is very unlikely that the exact same
> >> +binary data needs to be provided to the two different Peripheral
> >> +devices. The Linux implementation only allows for transfers to a
> >> +single device at a time.

> > For the firmware download case it seems likely that this won't always be
> > the case, but it's definitely a thing that could be done incrementally.

> One example discussed this week on the mailing list is the Cirrus Logic
> case, where the firmware contains information on which speakers a given
> amplifier should be doing, and each firmware is named as AMP-n.

I can imagine a vendor structuring things so they've got separate
firmware and coefficent/configuration images, the firmware images could
be shared.

> I have really not found any practical case where the same data needs to
> be sent to N devices, and I don't have a burning desire to tie the codec
> initialization together with all the asynchronous nature of
> enumeration/probe.

Like I say it does seem like something that could be done incrementally.

> > These don't seem like insurmountable obstacles - they feel more like a
> > copy break kind of situation where we can infer things from the pattern
> > of transactions, and there's always the possibility of adding some calls
> > to give regmap more high level information about the overall state of
> > the device.  One of the expected usage patterns with cache only mode is
> > to build up a final register state then let the cache code work out the
> > optimal pattern to actually write that out.

> I did expect some pushback on regmap :-)

> The point is really that the main use for this download is a set of
> write-once memory areas which happen to be mapped as registers. There is
> no real need to declare or access each memory address individually.

Yeah, normally it's just write only stuff but I've seen things like
controls being added in the DSP memory before - the=20

> In addition in terms of error handling, the expectation is that the set
> of writes are handled in a pass/fail manner. There's no real way to know
> which of the individual writes failed.

That's the case for any block writes.

> > I might be missing something but those requests for redownload sound
> > like things that would occur regardless of the mechanism used to perform
> > the I/O?

> What I meant is that the codec driver would e.g. need to fetch a
> different firmware table and download it. There's no real need to
> maintain a cache on the host side since the entire table will be download=
ed.

I mean, if that's the usage pattern surely things would just be marked
volatile anyway?  A cache is entirely optional.

> > This feels a lot like it could map onto the regmap async interface, it
> > would need a bit of a rework (mainly that currently they provide
> > ordering guarantees with respect to both each other and sync I/O) but
> > those could be removed with some care) but it's got the "here's a list
> > of I/O, here's another call to ensure it's all actually happened" thing.
> > It sounds very much like how I was thinking of the async API when I was
> > writing it and the initial users.

> > It's this bit that really got me thinking it could fit well into regmap.

> I really don't know anything about this async interface, if you have
> pointers on existing examples I am all ears....I am not aware of any
> Intel platform or codec used on an Intel platform making use of this API.

grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
or there's the rbtree cache sync code which uses a back door to go into
an async mode.  Basically just variants of all the normal regmap I/O
calls with a _complete() call you can use to wait for everything to
happen.  The implementation is a bit heavyweight since it was written to
work with fairly slow buses.

> At any rate the low-level behavior is to
> a) allocate and configure all the SoundWire resources
> b) allocate and configure all the DMA resources
> c) trigger DMA and enable SoundWire transfers
> d) wait for the DMA to complete

> The codec API can be modified as needed, as long as there are provisions
> for these 4 steps.

That's not quite how the current API works, but it feels like it's close
enough to the intent and there's literally one user of the actual API.

> >> +   (3) A Peripheral driver may want to wait until existing BRA
> >> +       transfers complete or deal with BRA as a background task when
> >> +       audio transfers stop. In this case, there would be no timeout,
> >> +       and the operation may not happen if the platform is suspended.

> > Option 3 would be a jump for regmap.

> Sorry, I don't get what a 'jump' means in this context.

Big change.

--FhLkZBn3JkiCzQ+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVzj1UACgkQJNaLcl1U
h9BTNQf+PXySbVwffDnK/35/VRjN1pPCvkLXNjvmEx5BqWSJb0btw2wC4rMnK9Da
z+2c1rQRdtPPe9uduGNBz/C4SkzRva3C91OX8HWET6WfWqAloUYPhJmQsYphQpVz
ArD2a3kfk9RjDAK6lnldUWi73ViDAq2ouxMjBl/W7gvuj5kHdf9nYPcJm+CtlC+1
YVA/QJ83VR+WnWUc1Nx0w3Hq8hPD+mGEJFZu1vYUIIHXBOo2pZOSLI5Ozlebzgu5
4RUWXXeSyvrQwU19f2akMSW2b7FAI8Fdi8aG2HpM/XDsj7RNFrjVmWP09MhGpqIF
1t+JGCA9iMKHbPMWvK06/SadypKWKw==
=YY7H
-----END PGP SIGNATURE-----

--FhLkZBn3JkiCzQ+m--
