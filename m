Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0581364A0
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg92Chtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4EEC433C7;
	Mon,  4 Dec 2023 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701725996;
	bh=leSfSnBRwqTUt2OzYv8JNFItDo6hQXFHCgFZZ5ni45w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hg92ChtfxlpJEyH1OdGbHj0vXv/eYjshdnZ1f9TV7/r3eK0/8gqYzCq2qyqWlsshw
	 46WqjA90svWcdVvvpj5L/Nd/jU8zS3ZG20fOaveETPJ3MkBENg33LxINkT0N8tQoDb
	 b4IiWR9G3iTPXcMpTAOIxRiMha5xqns0ep6mJJWd9At5uLAXdFut/DyXirCgz3RpKN
	 Zd//EjqQ6Y8uXHPLIs77EbnmQv+4ART/j5aSG1FDd0h2W/89WDN6+0/owE6pVMD4IR
	 QAPASn3Y0Q/0DJNE+RHBLl1SVLsgehiEOvwTDSuQ+Yf4PwiqyiEIU3xcMsgpueLZ89
	 SZUqQH8mNPRJw==
Date: Mon, 4 Dec 2023 21:39:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.de
Subject: Re: [PATCH 0/5] PCI/ALSA/ASoC: Add IDs and definitions for ARL and
 ARL-S
Message-ID: <f6552678-0b67-46ca-bcb2-382d5fe2fd4c@sirena.org.uk>
References: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NwKDhO4hJLvzYVO3"
Content-Disposition: inline
In-Reply-To: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: For office use only.


--NwKDhO4hJLvzYVO3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 03:27:05PM -0600, Pierre-Louis Bossart wrote:
> ArrowLake (ARL) and ArrowLake-S (ARL-S) have different PCI IDs. Add
> the usual slew of descriptors for those devices.
>=20
> There are no additional PCI IDs planned for this kernel cycle so it might=
 be
> simpler to have Takashi handle all the patches with Mark's Acked-by tag?

Acked-by: Mark Brown <broonie@kernel.org>

--NwKDhO4hJLvzYVO3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVuRycACgkQJNaLcl1U
h9AezQf9GEjZPk7l/qR/nfkfV7In2dbvDhJXEz+GKfw9RQkxyiPi/4JqBt+rmmmc
pGm3uVUoPlG9Bkmrvkxu4v7hq/Y8s4uTu3dVSiI+cftwT5IQGQ4P9QF+mZaFlkHM
Im38nzFOooyhdZemHJdYM8ZPrrQtbBViEd3qInOQjTZnZsFQnd0ztwgJr6zVsP1h
h94NRmnEQPjRSLLelrxNJ9kvLJKxM+SllkPabBS2QpRrbwnRguXoD5g62JcKwug9
ZT2V3XtChMgTU4BEB0UPsxYc1yq21aFBO9Tl5GPZP4AWGF1tCQG8xluh0Zppbyzq
G69zJl8/UaaWCQXLe/UrAv3BIf/OEg==
=ZCtD
-----END PGP SIGNATURE-----

--NwKDhO4hJLvzYVO3--
