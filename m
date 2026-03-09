Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021CD3A4F43;
	Mon,  9 Mar 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056061; cv=none; b=kCVD0h5app0ckVhWwgZcD9p6KoXod8ItGbXje7BUQp8RLqmJ30lotJqMQM9um5AJVSQeQoJiRzBdB+w7Da9jcdNMxsyHoeII1HQ36xO7nv73fKXGL+ieyofxyj7lkTOiRB8V4TJIgPpIVfJRTidPRUF5+MxXbDvmmDqHQXWZf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056061; c=relaxed/simple;
	bh=UP2Lbs41YwS7rAb53X8+Zlv1ab+8je73f+gRGljKzSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz3OWO7FBgZ4V6ggEGz6gMtp8kdj6RhjdURX4DQ6+6+rqKX2q4VwSvA8NQvECFz6nSs0y72RUxe2eC9FLEgSS6OUr1v1E0QlTQRpYRZooMCTs7sTPUZIIjUMyO+y51rC0VxjonusHtsHJJ/dpr6xVkINe+uX3tV4A3IsarTk/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSvUmEy9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSvUmEy9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A941C4CEF7;
	Mon,  9 Mar 2026 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773056060;
	bh=UP2Lbs41YwS7rAb53X8+Zlv1ab+8je73f+gRGljKzSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSvUmEy9rDS9NQc/bZIrwQUCtAII9LbDysT7EiJSw3LzUiXNbuJN7WqdyKjIxGZxH
	 eNZpDSPNGMBzQHImZjKGLOJcAaV/wb9Y1OBYMmv1GI2WXTBPxT3fcV4wXsBAvtAeR0
	 8rlzAZ0t6Uk+oJ3Cg03IIIsoUSLGLEfM6r+EkWOhSJcmVUKu7sER8ne6L91ZiL+BjB
	 XXDoOKRahs3IlOBs5/mIeB6XuPDc/18CJQ+t3+AW/oCa/sV+V1c/Mm2ULDI8AcQdcU
	 rMvaiA5cAMt0YVo3j1OFSPg4PHtS4MNrSEjMxk/Ug41qqE2nLehDORMh46GBo5tdsm
	 0XqkF3VL4fq5A==
Date: Mon, 9 Mar 2026 11:34:15 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: hasunpark@gmail.com, linux-sound@vger.kernel.org,
	venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	mario Limonciello <mario.limonciello@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: add DMI override for ACP70 flag
Message-ID: <4f5ccc69-628b-452e-be40-a022c3fd517a@sirena.org.uk>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-2-hasunpark@gmail.com>
 <55265fbb-490b-4af9-aee5-1af1960c2b51@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wYAlZCtZTwvd/BVq"
Content-Disposition: inline
In-Reply-To: <55265fbb-490b-4af9-aee5-1af1960c2b51@amd.com>
X-Cookie: I don't understand you anymore.


--wYAlZCtZTwvd/BVq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 11:03:21AM +0530, Mukunda,Vijendar wrote:
> On 08/03/26 20:46, hasunpark@gmail.com wrote:

> > Add a DMI override in snd_amd_acp_find_config() for ACP70+ boards and
> > return 0 so ACP ACPI flag-based selection is skipped on this platform.

> This patch should be dropped.
> To avoid overgrowing DMI quirks table, we have introduced "acp-audio-config-flag"
> which should be updated based on platform hw configuration and required driver
> solution to be loaded.

> ASUS has to update the BIOS by changing "acp-audio-config-flag" to zero.

This is a good thing to have going forward but I don't think we can
require that people get or apply firmware updates for existing systems,
there's no guarantee that vendors will make them and the process of
getting and applying the update may not be trivial, particularly for
people running Linux on a system the vendor shipped with Windows.

--wYAlZCtZTwvd/BVq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmusDYACgkQJNaLcl1U
h9C2ugf+LuxIYAvMvMGqmf5Mj8EtSQgPirvov5E3JjYoqsdi9mQuWgI2BAKt9ex8
+ikcY53fbBXXoGBlf977YpmOOjly2ICCVlNepnMuOkDmB2aWXmSs09474zJXkto3
uH4lu+2Cns4pNEPtJhV5oA3YNyFIIXAShhRwk4fN85RxgmvZ18V199cmZ1JX3l31
CKzO2qZbHn8Hlbngq9JNi59AoC4xrTO7haBe/yPuxpFDgb1FtUQByiRMwbCBQIiT
Nb2UvGKM3vkm20u9UIlt93WwPbw25l+DnRK6jFrY8XR1dztNjiJAfTMhNb8AKrJr
w9wykWakjQmw5/xKOdEarTGREEbDew==
=WhUN
-----END PGP SIGNATURE-----

--wYAlZCtZTwvd/BVq--
