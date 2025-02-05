Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543FB67F
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759538; cv=none; b=pyRYMQXfft5eR/xTkQuNli0jZTWJR3FFg+TmMyIgy3wwu1TD/WmjYLh0S+9OHvtmub6dcIfU9r2/z59XGN0OT18sM+a8Sw/HuNx3FuYsMVKmyyPC/UF4sen12vgdUEqsWf3AxGKocRiWCMn58MK49bXioyyH//V/Cj6jUwru260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759538; c=relaxed/simple;
	bh=NG0fJecNBfjyUXzWvjDPRK547CzZswvk9ZzJALAJppM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smKZhZ58EDwW7tlDoCxV/UV6Ws0WFRgoWRv+ac1DGE5C9jcTtioWQtFJ8o/myR1C0GAmU9AyGwWR9uwoFMf3M6FBCGTU1Bc62U0vmKd2Qfzi05+yx50dKNjzpe2sYNlYQkVnn2PhWd9BxS42FDarWHQ/AoY+Yi1jEkIM+H2RC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZEf2Apd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZEf2Apd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48140C4CEE2;
	Wed,  5 Feb 2025 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759537;
	bh=NG0fJecNBfjyUXzWvjDPRK547CzZswvk9ZzJALAJppM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZEf2ApdyPwstlLm4/KcRNU1ZBoy6sg3INN2+VsCC7vAw2yMrx68LTVTsZ3h4ag8D
	 WzH/VfE5c6TQJp0LqB15QBHI0SMIATmDJL1kOa7nu+m8MvTlJ3SZZEFDG5ue8V0/J+
	 BDugysfgQ5ppqzpzcAnETKTnV7kSY+rThs7CaFAJog6E8oNgrnG/MfApBJYzbjBNpW
	 oXOJZjQK1oy8AIOIAKt6CYIOwMH4Jn/sFs7mhFkjSu1DcUqOyr20xTcD29KUkXPbZ0
	 0Je+beSFpThZSMf7CX9snuyA78D515AEgdkTr/0OYIHB8Jd/z0AgFmaPsISMEvKyyU
	 wOZX8/OBHm2Mg==
Date: Wed, 5 Feb 2025 12:45:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ASoC: soc-core: Use of_property_present() for
 non-boolean properties
Message-ID: <7f78ee88-e33b-481f-9a65-88d67451d95e@sirena.org.uk>
References: <20250205120128.1080295-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aMl3+Y7yaLceharH"
Content-Disposition: inline
In-Reply-To: <20250205120128.1080295-1-festevam@gmail.com>
X-Cookie: Do you know Montana?


--aMl3+Y7yaLceharH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 09:01:28AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.

This doesn't apply against current code, please check and resend.

--aMl3+Y7yaLceharH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmejXWwACgkQJNaLcl1U
h9DBWwf/Wo+4Ck+rysSortFTIP/sFNZVE870oMZnfFSbyr8M/V267N69A52AlZSq
eZtGXGfjOQ28sX/lbKvAeM/yUoH1GIYn7oUR8Nac7mC3seapjBMk0MdbpEYH12K7
9uXyfpsB+mQKTILT1ILJQVXNgD6xx4+G1Hidv2mB1KdvD8oCcB2VXTyKNQ+znuO8
XFGRhFiOc0C7/7Q7HGRF4HCQBhnIPhzbaqlfWNva2PdEN/89JFeEKE/jH7gudqCV
tNUyuL/hQhCFrArI654bQzR9w7US3AY17mtf2TAssIOYK+gPngoVFWY+OI/z/32e
fG/ModU6yuVOizQRa9MehMUvG06C8g==
=K7aI
-----END PGP SIGNATURE-----

--aMl3+Y7yaLceharH--
