Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1622EFD
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEiDVoTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B56EC433C8;
	Mon,  4 Dec 2023 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701692873;
	bh=W7f0pOjg304HyKPpQW7nP4LI4oM3YnuorMhU4Q0ZrLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEiDVoTK2D3qff6nHAmnZtWpkkVNTUSyGrqjuyC/u/Q8CHrOEMmrUYWZD8oSMh6Et
	 l8iSYt3cvd2nczJWYc+wV3VP1XW+fh28UByZKsxZXhGBECdTsICPmkVWH1jRT1MfS0
	 /590eRRWIM82tMFK+qd7H9524x4c+T/UPIzT2fvouOgh7KAaiQ7Kyj9M44Ur6gg0g0
	 oL+belo7cKfxKocpm5E2wY0FTWX1umZiYntOgDXIsaN4jJaB5Nr2voskSAo1Pfb/bB
	 szKZqxUls0w/qqCduZuiHes4P3PTZT13cGluVIbVRQoTjP9KTVcoOKQxNXaW/JTMUW
	 G/BA+vlE8me7Q==
Date: Mon, 4 Dec 2023 12:27:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Move sof_of_machine_select() to core.c from
 sof-of-dev.c
Message-ID: <76ca7ffb-3881-468f-aef8-47ec6723e4bd@sirena.org.uk>
References: <20231204033549.2020289-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UcsYHd9sLq57ihM2"
Content-Disposition: inline
In-Reply-To: <20231204033549.2020289-1-wenst@chromium.org>
X-Cookie: For office use only.


--UcsYHd9sLq57ihM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 04, 2023 at 11:35:47AM +0800, Chen-Yu Tsai wrote:

> This reverts commit 014fdeb0d747304111cfecf93df4407c1a0c80db.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--UcsYHd9sLq57ihM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVtxcIACgkQJNaLcl1U
h9AynAf8CEBCwsobXc9txfMwNf9AcFUdJlsRlH78OTUCy5HjmnqVhEvigo19ZCzl
MRalW+nYuo1UneAK1iENEHzBrl0wJEJzgeiVWoCLINrrpOVfHno6j+8XGFt8+/ef
WI0hbYqByLuZLxo0ImrJc86HUE5RL95khKkaJjk7cMVKlY6l4jqusubnmrbM/fEt
mq8rZLnNGLTf0XR/K3YkI2s/wvbsxdVVEQ/TSqoHgQzQcsUVGK1M+uKL8vNKSuI4
SQiZRuh3y6xgIgrNEff+TdVo4itr39uHj1IOjxNdNsBLx0xQITBWN2TaMMrMb1FD
UeeTbYxEM3MbmTwtgwaoDrplP4dcAQ==
=VXtL
-----END PGP SIGNATURE-----

--UcsYHd9sLq57ihM2--
