Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CC23B2A5
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+svSqqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02B4C433C8;
	Fri,  8 Dec 2023 18:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702061741;
	bh=zH/mDq4ZOeaAVNaDkpZYAJUFG8NeBNcHhSruGzw2UZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+svSqqNyC59FkQ3Di/HGtc7nFA0kGtyLrT7a6g8cYI6h/57bCYyJe5z5btCFhaTQ
	 zhzLpMV4diruDb1wMmPfXYCBN0QYuqKAvV3mQgeuqS8nBZ05NWIkGKShdzr3+r6so0
	 qj1Eww75DDXgbHV2YaY+jWlOKp4dDZHjkI2aF+zA4LtdKbVZlYR9lCAetmghNROjma
	 w7j1uDth5zz6vyU5rUwGFOICX8EoWNVdQbRFUtCkdfjnhVl+1BZuqjXVliYZwJ2QLT
	 Xu864n1kUHJv4AzhxZ2X+yQsAUe7fzY9PhzVxb5V8otkTnfEdaUPU1Fh8CqYAvu3Lh
	 mRWPChkLoiPMg==
Date: Fri, 8 Dec 2023 18:55:37 +0000
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
Message-ID: <ZXNmqaCb+6SsXQDV@finisterre.sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <20231208162735.GV14858@ediswmail.ad.cirrus.com>
 <4048c3a3-f694-41c2-b338-57e524544c92@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVF86aoH4KxUkuhv"
Content-Disposition: inline
In-Reply-To: <4048c3a3-f694-41c2-b338-57e524544c92@linux.intel.com>
X-Cookie: Slow day.  Practice crawling.


--CVF86aoH4KxUkuhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 08, 2023 at 12:45:21PM -0600, Pierre-Louis Bossart wrote:
> On 12/8/23 10:27, Charles Keepax wrote:

> > I think we might have some annoying restrictions on the block
> > size on our hardware as well I will go dig into that and report
> > back.

> That would be very useful indeed, we have to make sure this alignment is
> reasonably supported across hosts and devices.
> If we can't agree we'll have to make the alignment host-dependent, but
> that will make the logic in codec drivers more complicated.

Hopefully even if it's complicated it's something that can be factored
out into library code rather than replicated.

--CVF86aoH4KxUkuhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVzZqkACgkQJNaLcl1U
h9C2JQf7Bq5jbqQ6iqt8mpE6AqCVorJswEqPHo8EGamnfTLhb8+5leETNjC6fPsn
khC9gqWnhSDVZzwatpBdqhvgKL7pxNpRbITMeCQ7fp8g3CUnWCM1ooN6KgwHj4sI
4HMMSglyYj3/UIjqhoTLtdOzymkx3BTrPFsknBVQcJxzgS7yUlp+BdZxIQhhp3cR
swKSDl3HrcNkPnf9zV13l/SYX2z9wj/zbvcPdAypzHArdLhtk+Cr2HGg/QNWgAOh
KdzGazckFDVxHcx00xPrTGyaZs3MZP5FBUyZIKkcWTnGHJObLESEqTwRkS8qf7Gy
9LQpvKSQejFdX35BbfAVRUtdAoBlwQ==
=yFie
-----END PGP SIGNATURE-----

--CVF86aoH4KxUkuhv--
