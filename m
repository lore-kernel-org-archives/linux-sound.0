Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466B31C570
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030346; cv=none; b=il4mVYUwdI6ymRQmMMdtkeDrUDtaO6gyRZz5TREGLJsUpiwecH9P3UQJJ1zsRaq45dabV6tkTnK+CUA33S0A+Vs6btPPnRyGFRC1DPmiWbaIs4qnD+3CO1JZhnN9CZ8paBrPlce8uJkObzNiBjLsboFO8BN9j5TBvfRNhJn6vps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030346; c=relaxed/simple;
	bh=G8YuobKOoYrEqOmYixPyDFCl+yaGvW0/9WH/LSEnT4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4YPtjfTdO1bQnqBBDCodq6u7EX99f471H4ZI6cjr3v06iS3VFrgvitI3wwFTDFO0oaFmK6jHlH3PsSdpmmtt41og1hed+trZikgIgsiZzM3vrfq679iH0otKCqxcE+t/04Q+6Fmte877NrW9VDmNbQ4QVUXemxOG/xOYkwhkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9v2Srjn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9v2Srjn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99931C4CEEB;
	Tue, 16 Sep 2025 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758030345;
	bh=G8YuobKOoYrEqOmYixPyDFCl+yaGvW0/9WH/LSEnT4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9v2SrjnjgSGoZV7wgv29U8A5sH8cpe3oZthzRQLVioO7OKLbkV/kgFbpbfHaNukp
	 u3f8gSpnd+MAQKiPigIo4B0C1+xW6kVkuP7Ec4PgDGTE2exzHLxjgzsrRlKxOnB2j7
	 gaX+YDE51K9LDckzA8KaavZlDLIztWLxbie/5GIeD7XSGXrFlKgigeQ8beACA3Baj4
	 tOQ8ynS4u1OCF+dIZ1O7kkJJxD31rIpDJ+bOobLsOOfD0ypm/Of7+bqKFowNUnE20n
	 pqBopiHmpKviUTIJ1CXh0JZV0DO5p5kxb8aImR8yJ9++WZmZ9Tcx7rZFPTwEwWcKm1
	 iY2AQkP5Uwp7w==
Date: Tue, 16 Sep 2025 14:45:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <82caeff8-76eb-46cc-bc2e-8d498f361892@sirena.org.uk>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
 <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RYfosTxJAfWFy1Co"
Content-Disposition: inline
In-Reply-To: <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
X-Cookie: The people rule.


--RYfosTxJAfWFy1Co
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 02:38:11PM +0100, Mark Brown wrote:
> On Fri, Sep 12, 2025 at 11:34:58AM +0100, Charles Keepax wrote:
> > From: Maciej Strozek <mstrozek@opensource.cirrus.com>
> >=20
> > Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
> > DisCo contains a list of File Sets which can be requested by the device
> > and within each of those a list of individual files to be downloaded to
> > the device. Optionally the contents of the files may also be present in
> > a special ACPI table, called SWFT (SoundWire File Table).
>=20
> This breaks the build:
>=20
> /build/stage/linux/sound/soc/sdca/sdca_device.c:40:26: error: use of unde=
clared identifier 'ACPI_SIG_SWFT'
>    40 |         status =3D acpi_get_table(ACPI_SIG_SWFT, 0,
>       |                                 ^
> 1 error generated.
>=20
> The identifier is added by some tree in -next but is not present in
> mainline or my tree.

This is

commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT) signature")
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git

noted in the cover letter.

--RYfosTxJAfWFy1Co
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJagMACgkQJNaLcl1U
h9DrPwf/XGH9qqtEnOutImAxKZT9HGt72i8WQrNjuNhAgXNJip5YIQnPdjYZwpUE
ojq+UxqGd8P6jlsJuBsYEEUTVYSA3GWZHOP3GPm/Do3+KiXlOCgLqUygEQiqfUdu
f9CM0ZYsGi0pKnveoSt44yLo7mUTcyyerJSY4oNiVwt7NZ96hXwns+E4oS7+bn5E
k0/PxiHDRZYAqn1h0lu2BdQEhRO2cF9uIoAih17xXaCmoHr7yAef/Y4SKP5cH2/y
nEvw/nenmpJvzhWYuXvpircBubqX0c1FC/bsXN1FRY1SqRFJRuVwFWcgQ/vbsOWO
prK0lXdO9qGyrE4gbgk7YyB36zOlng==
=GFa8
-----END PGP SIGNATURE-----

--RYfosTxJAfWFy1Co--
