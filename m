Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B092282F2B
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 04:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777524969; cv=none; b=X+Wt2KvzgjZ+59td4vTX+86jS9XkCi7nhuU/mVAOGc1ne0xNyObv/+xELVBNkTvFYwB3j3CjdYm/7gxOkevvzHgsHJwk+xGtfE62FNRsd946euZ84ceCln55rU+iFaMo0gnATCC26POFGdbPD/n/oN89r04r5F+7TU1AfkIInKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777524969; c=relaxed/simple;
	bh=CjW2MODREeenE4QC1R9k35reWomsQ233m1EKM/U6wMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1uiUvCDLmzjgmUV+92fEvWRPJDuTDFeRdMXU7YKPoIL/p3bwwxFzhK1I1cLb0iyfDPAGSpzI8V1jS85S75HI41oHh4j69KkFQ1UbDqz8mK4LegTgiXStDq11kWH2DuklYXToFQwVHcw25envt6U8yfXHgWQKnly8fGHI4nxxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgtuOQqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgtuOQqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163F8C2BCB8;
	Thu, 30 Apr 2026 04:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777524969;
	bh=CjW2MODREeenE4QC1R9k35reWomsQ233m1EKM/U6wMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgtuOQqIuOrtFKkQs0WAq2zF0nb42RPnoG7iuGD4MC74iu/9TGJgAVVK5rsYMAy3q
	 B139LDyUWTf/SxFa5fvwV/OkDbp1NgeYR82rqYqk23+ZaRq8ArSeoNMVACYpGfTECt
	 q9sH7ZpOvjq6kcVQLsBY0Eo2C8/Be14vJVIQParNnVrKkVspCV8WmcZH7h2vqCi9yz
	 b092E/gEr4gGJZOh7X3gZgeSXi7QMscTPNR0uFUb/Q9bk9qtboH9B6fAhejjh8EWL+
	 d8DfHxnGeGeMPBooocMLXBtPkMe3BGMbs3jSbfinOcnF5DUz9gLcndfontmAjPVLUP
	 wh2f9xdyrMrWQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AE0D51AC585D; Thu, 30 Apr 2026 05:56:06 +0100 (BST)
Date: Thu, 30 Apr 2026 13:56:06 +0900
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: ab8500: Remove suspicious code
Message-ID: <afLg5ghOpedYgJ4P@sirena.co.uk>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org
References: <20260429080810.2375150-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bKj0hpCOBKLbZ7ta"
Content-Disposition: inline
In-Reply-To: <20260429080810.2375150-2-u.kleine-koenig@baylibre.com>
X-Cookie: 667:


--bKj0hpCOBKLbZ7ta
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 10:08:08AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:

> -	if (apply_fir) {
> -		if (drvdata->anc_status =3D=3D ANC_IIR_CONFIGURED)
> -			drvdata->anc_status =3D ANC_FIR_IIR_CONFIGURED;
> -		else if (drvdata->anc_status !=3D ANC_FIR_IIR_CONFIGURED)
> -			drvdata->anc_status =3D  ANC_FIR_CONFIGURED;
> -	}

This could go a bit further and remove the driver data associated with
these as well.

--bKj0hpCOBKLbZ7ta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmny4OUACgkQJNaLcl1U
h9DGhAf/RbH/0haVbyBc0Z5Di+0XfM8vy2aeULDWCOF2X4vYWw2H+L5wVEPtyaml
mqwvnOEfS54/foZ9TP26zclzVenxPO13dC+XPrtJurn2AWVUSE8q9tC9bsA+Blhy
PPEinYHVbp/oJZjG9Bwgzp2DUy+Yt+WYGBXyQwCj8I1uQ68jN+fcq1OKtziK7TxK
g8qx/cToXt4FjmvxMny+RW1i7F8U1dzpW9IVrLhNyTggSdVhlF+/PQV5I7XqIEHX
YDZF4Kdgwcyv3UO/7hukUpGvIMWPO/iWxfyBykdFFSIXO7D5F0oc+G0CVkmLJPq6
hefj5sbjU65dXLE6MLYKmOQxi2UxDw==
=2pNu
-----END PGP SIGNATURE-----

--bKj0hpCOBKLbZ7ta--
