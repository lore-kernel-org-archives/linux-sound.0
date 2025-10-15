Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2B2494ED
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524559; cv=none; b=eF9gOCQaTgYUz4d5IuS2kMCYcmlYIyR5negNB387C7Vax/rRc7IT4LjK7xGwoTWI1eC/B02K8fZ/ouW7u9numAFfu3sPsCOv+fjzXVkbgwsSgBZ8pRE8uP9dTouQM6o8fkmKSbRS89F3L4tbr4nYFYQ7NvY2tHnp4VUAjkOFBZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524559; c=relaxed/simple;
	bh=fx706Mqmmy0zmQNMIJ7wcGD5PiomNIovIku3hyqVdj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2X1DVnvU+GCjuYIx86mYqxEiCXtjgXIAaotsDZrMP5QPO4J37dMaLrUDjdgT0lY5pV/YIOkEmgPOLudrACLrnzvXVG5z+XUA8nXV2+IQoufkUjLoqAtGfy22H0PplME+nrc/xknQKTP6UrjMP97b2tyuebHCYyExpf/Eyl3R2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw70WsoH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sw70WsoH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFD0C116D0;
	Wed, 15 Oct 2025 10:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760524559;
	bh=fx706Mqmmy0zmQNMIJ7wcGD5PiomNIovIku3hyqVdj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sw70WsoHBmL+EN+EKGCdcYTBXSNkoH5OIedndbILUNRdDsIZJ9Dsy8j5DE1wimrvg
	 iJwmdpt2BXH4UxISb7N1nOMCz3KhiYmh2ZfdGCJFazsSaPeRicoop2q6IDp3Mj1k6M
	 bJIGaOz0DtmgkPMS+3CJECwKptM1I5dyJMS+AFTdN5prUADlxwaj4Vp9rfAS0dDFD8
	 dBGrE4PligarF7+QdVPQgWgBjD2XKy4SMRRCOR7TdriePvS1rcr1ckvOLGfHKweH3c
	 ZqrVrqtP1aXH8qPr5qLh62Z6L0VxFMt5XgFWqXDKWZ6R1SlKHkVKc1hAlhrbffoQgs
	 BqOv2ucfAOYjA==
Date: Wed, 15 Oct 2025 11:35:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: linux-sound@vger.kernel.org, perex@perex.cz, lgirdwood@gmail.com
Subject: Re: [PATCH 1/3] ASoC: max98090/91: added new ALSA routes and widgets
Message-ID: <f91b4c05-e6a7-4291-a481-97190755f70c@sirena.org.uk>
References: <20251015093628.659936-1-sharq0406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+JSXXNnwxXGo3fwt"
Content-Disposition: inline
In-Reply-To: <20251015093628.659936-1-sharq0406@gmail.com>
X-Cookie: Long life is in store for you.


--+JSXXNnwxXGo3fwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 15, 2025 at 11:36:26AM +0200, Sharique Mohammad wrote:
> The widgets and routes for max98091 were not available, although the
> compatible flag has max98091 but only max98090 routes were present. So,
> new routes for max98091 has been added.

The additional routes should really only be added on the max98091,
otherwise systems with the max98090 will also see them.  There's a bunch
of other drivers for device families in the tree, you can see how they
handle them.

> Also, the digital microphone M1(IN1/IN2) and digital microphone
> M2(IN5/IN6) could not be enabled or disabled from amixer controls. So,
> widgets have been added, and now a user can from amixer controls
> enable/disable the digital mics.

This sounds like a separate fix so should be a separate patch.

--+JSXXNnwxXGo3fwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjveQoACgkQJNaLcl1U
h9BOygf+Ks84D0j1bJsyAXQsLK4ZVHJie4ZV4NKOYSyLsrWsDTsFe5chxQVLem3K
oZA+Ys0NXiZ0944HER7XqjkHensbT7tWBjw38W3USJwulscz1hup4J79rpbPIgDi
lL4PACDe0YJmPQOMaLQ6piPH15mnyLtYs2qCixzaJKIv7kb2Qsqjsq2JjGKdn+yj
QK3A/ecfksbz4rl9oyyKA3zpTtnsDjQQW17Fh2Vvg1rAcGDWJNRAxEEAhJExBaPN
5QmIZJOWwr8l0/ThuI03HF3tI7OvOc+UB4CiTlwtyp8A4bJyVNy36HKYwFFsreFV
kIFQTuBkLtVHuaG7CmP+69KPrTeWpA==
=3ptd
-----END PGP SIGNATURE-----

--+JSXXNnwxXGo3fwt--
