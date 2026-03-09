Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66593D6699;
	Mon,  9 Mar 2026 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071334; cv=none; b=IuaPzIVS61eHiVdcOkWldFeh9iXCejS/uh17n1G1h4M+AL/tZAhXW1E9qloDQ0aiRYY5ADZqj6NZZ1oO5VBihQOhCq0neOtMDpMSrsgJ+8Tj15I683GnleysJNngNwXeCgmhEM465tpASHSw38OV1PSl+HsMyq6QQ+C394xKCP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071334; c=relaxed/simple;
	bh=9wGJ8qaSXb6AKuG9y05tY2Py+cmSnC4IvHSPJzn+b/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcNr4jAsrdr6BwgLZBErpOnqxcg1QDiOBp/NnRLczycqlnCjrphgXYaf0SUptFEcsHjb9I9UwooWX+s4Vm6vmXNfS0OPu2YjQgbzsYKhfLajv/F88siZFRowkGVIl1leyrhzYcM/qJdKS+bApZ3PIN/uqA6qY3W4Ssmz0gZWttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faft/94K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faft/94K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA1CC2BC9E;
	Mon,  9 Mar 2026 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071334;
	bh=9wGJ8qaSXb6AKuG9y05tY2Py+cmSnC4IvHSPJzn+b/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faft/94KsH4lMZsf2Q7S7pr2lSjokg85Lz8jBu+n6ZgvAwSJGwlLfMwkPEMRAt6+v
	 e6wy7pAXxCW9dYXsbVAy5CbasZjHRf6hcTbouPLNOurfw8avLWVUm2FUvCGV5KrFSu
	 R+gT2oV5BkKXPKfKdAZ3fIOXNWd837KfnA5VMFbW+AIpB7kO4GE3MiZ8vW2lXyCOCn
	 DijnUEBStTbyZRplVeyox5M9Asr321MrnksiG5+eMAXG0EBOCPMdgK6ARZtipgHk89
	 aSqGxxYae4kuhtOkQ2o+z8B46KHD0D8PSIp/UXFkrB6Rv49lPBV6LNDd2rYYcADc9d
	 gVFYpkVtZ5BJw==
Date: Mon, 9 Mar 2026 15:48:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, hasunpark@gmail.com,
	linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: add DMI override for ACP70 flag
Message-ID: <5fcdbec7-697c-41ae-9d3d-8e6007225d27@sirena.org.uk>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-2-hasunpark@gmail.com>
 <55265fbb-490b-4af9-aee5-1af1960c2b51@amd.com>
 <4f5ccc69-628b-452e-be40-a022c3fd517a@sirena.org.uk>
 <cee01998-e94a-4f73-bcc8-2e71513166af@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/QGsy9pJUkKWRJ5V"
Content-Disposition: inline
In-Reply-To: <cee01998-e94a-4f73-bcc8-2e71513166af@amd.com>
X-Cookie: Do not dry clean.


--/QGsy9pJUkKWRJ5V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 10:31:00AM -0500, Mario Limonciello wrote:
> On 3/9/2026 6:34 AM, Mark Brown wrote:
> > On Mon, Mar 09, 2026 at 11:03:21AM +0530, Mukunda,Vijendar wrote:

> > > ASUS has to update the BIOS by changing "acp-audio-config-flag" to zero.

> > This is a good thing to have going forward but I don't think we can
> > require that people get or apply firmware updates for existing systems,
> > there's no guarantee that vendors will make them and the process of
> > getting and applying the update may not be trivial, particularly for
> > people running Linux on a system the vendor shipped with Windows.

> At least for pre-production hardware we should not accept quirks like this.
> Vendors should populate their BIOS properly.

Yeah, for preproduction that's definitely reasonable in the normal
course of affairs.

> But I gather this is a production hardware and the vendor made a mistake.
> In this case I guess the vendor doesn't make Linux BIOS update easy either,
> and thus the reporter suffers.

> So maybe we should let this one go, but let's look through these closely if
> more come.

> We really don't want to end up with a giant quirk table of BIOS mistakes.

I mean, that's idiomatic for ACPI :(

--/QGsy9pJUkKWRJ5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu6+AACgkQJNaLcl1U
h9AKGwf+Ka8acN3i0bi9XYmnN9HVO8z0/1Sxqjv9ZlF+tWHUWMlJ9wmfPBo4qWeG
poaROiaymA72g2O+XLs0P6A0yWHB+m+86CcKfkczvUBxdIRSFA1bjCmCjUCPOMvI
7tFdLBq3P9JsPPZjlU0nubMVaacHqyQ+KJU4Fl7dOgpIl1WmPMdK+9zc3oFk/Vjm
BYUNfzoX5AR/259uCuZebZ1wLu4dJwyKZmegbniQwy2gIyDLvHGKGBhYAZwEQeeh
NF30n8gCVQdUgwHYPlhb7x3TcjPMWo4eaumCOKuyC6z3oc0+OaeuOUzK5r1LIvXQ
Q05uNo+MtzAfW9GK3VlBWDhqFpVLqQ==
=vQCU
-----END PGP SIGNATURE-----

--/QGsy9pJUkKWRJ5V--
