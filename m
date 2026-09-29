Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28083D669A
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695490; cv=none; b=aabOnRtlBFmt+s82bY6KRyOwKpQO/xqOqnFTQEjskFvlphIGxyRGrx9FOEYMLVseWvaAg6h0eDqalXjo+VjAAPkxze3hXbs5i2RhywTnadOn6wOfxlpUMr9UA3LEmpLDSh1WIELpEsVCP/rsQxkzqxoumnSiUU/KiyHlMX5qI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695490; c=relaxed/simple;
	bh=mDROLr297tCXRx/vtvZlPKTPKQLPZBMaINVlTthQUzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9k1ttpeJHrFZgj2jExP6dplI4nRdPgXLI5Nhp38ue7ZDVhm7gweWQ3t1z9j36zfnoIgpvXEQeBlQ6v852Awil4ht7Qm3jA5trYfZbbOCDih398/aAB/BTCRpdHzxJndIS2XMYWJJXkhRkCZtFDvsrzNMQwte7WufWx922lAOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPGXh9fD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPGXh9fD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096121F00893;
	Tue, 29 Sep 2026 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790695481;
	bh=mDROLr297tCXRx/vtvZlPKTPKQLPZBMaINVlTthQUzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPGXh9fDtBUd/cQgMCmRHwlwFNgNBeG1H7p8R98j2u1m5Gkgag5uG2VGNbi2SsBUx
	 aaDSqLLY1MLQE7wNDMWsW+qMZuQN7gCdiFvtYCGl1JPgFty6nZQTg/QsyODWvPc6Ri
	 3jBGCAzanu3Lxml9igfQ10N7nKACU5Ko30ByGCUngBZ68MRh8DGL90rChRLoLUunXR
	 pHgwJ1hDaQN6A29A2EWcpYnY4AfJvyBJdJad6RDOUWDzGUPbhQzR2B1gWI7vnJ8dbS
	 O6ObOyKwNIVGG+MOzZ19cVlFOz+ZhbRxvwM5Mj7vfbtZpFScxwZwi8Dz+WO/RZu0cS
	 3vzSdEkAQVZFA==
Date: Tue, 29 Sep 2026 16:24:37 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"13916275206@139.com" <13916275206@139.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"Xu, Baojun" <baojun.xu@ti.com>, "Lu, Kevin(CAAH)" <k-lu@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Add TAS2573 calibration
 support
Message-ID: <08ee7688-eafe-4c50-9c6b-ea5319c26ced@sirena.org.uk>
References: <20260915044735.1305-1-shenghao-ding@ti.com>
 <178949457658.151760.15632737262810659230.b4-ty@b4>
 <e409dd4b8fb94b93ba7d2c0bbd0d5b9f@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ttC2eWrtLJtmwVyb"
Content-Disposition: inline
In-Reply-To: <e409dd4b8fb94b93ba7d2c0bbd0d5b9f@ti.com>
X-Cookie: 1 bulls, 3 cows.


--ttC2eWrtLJtmwVyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 02:08:41AM +0000, Ding, Shenghao wrote:

> We have been tracking its progress but have not observed it showing up in=
 linux-next after the=20
> usual 24-hour window, nor has it been picked up in the current mainline m=
erge window so far.=20
> We would like to check if there are any unresolved test failures, regress=
ions or other concerns=20
> we should follow up on, to help get this patch merged smoothly.=20

> Please let us know if any revised version or additional fix patch is need=
ed from our side.=20

Nothing needed from your side.

--ttC2eWrtLJtmwVyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq72DQACgkQJNaLcl1U
h9BXBAf/YTlONzKm22boNuGi7nZo4kIDSSgkQnrkKjtPnu/Lvotyxiw1jWN5+vd9
VWV0oGLL+LaIY5BwZvlmZLpkvu/iiOm9K4QQl62GLJV0BEHhFFYiRG3E3zH1PswA
cRgkM+EDqzWdQYQ78lA39G1Mu7iIzmcZyWfMHHlxxXNmrMj0sq/CmHvKmg1dNvOI
BKOIgh6D4D7qkAUGLIwYDcHRCgDl0vo7X+I8S9ND4dp4ZAYcZOtt3D+qHpZnVVc3
DSfFxKctgJL1PYDDrxW7rwf4M68SLGCRhUhFQEG5ROhdIelt91P1zGgLVQDueeNV
IeDRLabsKz6rMohQ4Ztk8BVx+zIULA==
=Kn75
-----END PGP SIGNATURE-----

--ttC2eWrtLJtmwVyb--
