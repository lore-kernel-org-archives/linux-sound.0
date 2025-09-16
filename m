Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25722F83C0
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029891; cv=none; b=prOwTcXTtXi8vBT2O4v1Djfo2wYQx14mODvSK1ih2Hohft+oxtIFkYa3ooDQoFt4cCX4Cl3DpU245OcqLhMPH+yVdqFbnzEzO6hbGJ3Ab5v6V0jZzZW4NTJNHf5/QjlaT7KHLC0ZqCn3GZ5jkECQhI+DkTO+QPJ4CJWLSRHP/lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029891; c=relaxed/simple;
	bh=XVqbCHg/p26KwNDRVH4aNulCmSHmaA2toyY3n1F2Cjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+CaNRJvPh1WzcxrdpjSk4rgoO0updlBiGse5XVpiaD2hjNh/NboA00IE3hQ970iywwl1pR3EYO/ury/uDzJMfBpvRxIi28SDWH1xKxRdKgVc0Z1+ZJGibWIuAgN50IoPPTStxHN55MWJZMMNjoX2/b/8fg3Cf/IWGxahbEv6gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bfs8ppaO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bfs8ppaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83228C4CEEB;
	Tue, 16 Sep 2025 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029891;
	bh=XVqbCHg/p26KwNDRVH4aNulCmSHmaA2toyY3n1F2Cjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bfs8ppaOMVnAQe1pF4pHwxvbG+5ly7BXewW0cxAcXvHg0naD999EXXdxkRl+ZvVNG
	 amelrse5zKvo6HPWuUGTpZJwjwS9qaV2cgwFsG5Zp8myUxLfzj23YTEeuxx06riXqX
	 6vug+3uycv11v97KT4V8oaySrBDnZuheTutiFw59J1ljWICP6BtBUt3qKrSCja+lFr
	 JW61DwuAQKpYq6N1slK7bc/V/HN5vjiz+kTdoUnUlKc/MDyc0PiiH1CwJlLFq9g/r2
	 D1cgyDBVRIqMeFqae5qdYBduRg0c7dhthz0gpPA6gYd2OMP1+8EJM8KGJw3ZOd9zNE
	 /kColZX1fgXpw==
Date: Tue, 16 Sep 2025 14:38:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LWtAehMMIkTpEdEu"
Content-Disposition: inline
In-Reply-To: <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
X-Cookie: Biology grows on you.


--LWtAehMMIkTpEdEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 11:34:58AM +0100, Charles Keepax wrote:
> From: Maciej Strozek <mstrozek@opensource.cirrus.com>
>=20
> Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
> DisCo contains a list of File Sets which can be requested by the device
> and within each of those a list of individual files to be downloaded to
> the device. Optionally the contents of the files may also be present in
> a special ACPI table, called SWFT (SoundWire File Table).

This breaks the build:

/build/stage/linux/sound/soc/sdca/sdca_device.c:40:26: error: use of undecl=
ared identifier 'ACPI_SIG_SWFT'
   40 |         status =3D acpi_get_table(ACPI_SIG_SWFT, 0,
      |                                 ^
1 error generated.

The identifier is added by some tree in -next but is not present in
mainline or my tree.

--LWtAehMMIkTpEdEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJaD4ACgkQJNaLcl1U
h9C4iAf+MoDxGD4jqAk3royTJ4L6qsDtiU38asGkCkuJeQ1Zx+ZYbEVNT3XCZaN5
O661o8pX58mT3YOTQ/30xDIRpov1OPjbQfcukxl7skV4y4RQZXXyFM9/j9ZhC8QA
guYy7j1Vfyhsicdqx806LOihGeJvsYNujcIVzwQa/vsJw5a3OMZorGwtMf9jJrtI
TS7RR6v5sb08CYdNgSQzZUFod7Wm/MjCvDQ7yzZItq01wwlDKPjhZ5Fg7vjUUIe4
1nx/gT5UWptoRHENmqo+YCZVnygZ68/1/xsNaHrkZjYL5ZRchFiB2DvietmUK5eT
Si5SKuLvMAngRBdPmWx/MEXcZOdtig==
=8osF
-----END PGP SIGNATURE-----

--LWtAehMMIkTpEdEu--
