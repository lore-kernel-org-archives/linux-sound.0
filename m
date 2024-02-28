Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B2E6EF01
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140916; cv=none; b=bpT2UffOKTU/obpj0F/1mUZtP/nDpj21IgQ0uSTTYiyk1y6UJcDFWNa+yHQhnuEw83sOx7S7qRw6W7V4VJNwFliWloz2L+ToUStLWyNHIQwf2/Sl+YIv5GGG2IsEakxUsc1Qo1IYQS4EY34/Z0jeZPowfsKqd62+kI3hxQPzByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140916; c=relaxed/simple;
	bh=IdzX1daifoNbsjtYDp3Q/p54xzf2vmD7Pd4A4jPXUVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M91fB6S49KwuFSvTQgr6ZHxg5Txrfz6GEFdYq6S9qHiNKpx1bSyfvju2bhtmAfPcBH3GxlKVM0opeJvEjfYjqdxmyG4OZnqa/zFMOjQg9AIuJ7IefqB8oEtt8N2JYyHgGBmivTXfd5E0sfYHI52bRmohPtWE0i8QhBtpsBAnH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms/GE9ra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ms/GE9ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DE0C433C7;
	Wed, 28 Feb 2024 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709140916;
	bh=IdzX1daifoNbsjtYDp3Q/p54xzf2vmD7Pd4A4jPXUVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ms/GE9rasK+9LhTcZthY7FTR1yQhhlpPZkFs9ZBMvGJ/CjHBYEwEEvlYNRWCnokBt
	 EYT+nZHQVAEsGo/sUgsKOYy78OoQQcYdLfoc/mL0bfVFsCmDp1STIaDfBfDZIcNGVW
	 3JttXvJElftsFg+MJ7Y9tuH5nRWhdnxXfj4SEFwiBHpETPajQ17cRI+2SpeCF4mAEe
	 5KyjaSrBWakzNJJOLQIdy07TW9pkMZSah0+fbFsXaqnTKwRRtxXUxIzK/rlAY+BBu4
	 caDsofjI0jI+sXSYPkIGMLbhdUr0ekO7xrDItTf8r2PcXWi+nZY/F0QX4GqM8Z6Vnv
	 mjVDoN5jOUT6w==
Date: Wed, 28 Feb 2024 17:21:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 2/5] ASoC: codecs: hda: Skip HDMI/DP registration if
 i915 is missing
Message-ID: <d79e0336-58c7-4ad1-af5b-fc6934c2e921@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ai/7cep230enU383"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-3-cezary.rojewski@intel.com>
X-Cookie: Function reject.


--ai/7cep230enU383
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:29PM +0100, Cezary Rojewski wrote:
> If i915 does not support given platform but the hardware i.e.: HDAudio
> codec is still there, the codec-probing procedure will succeed for such
> device but the follow up initialization will always end up with -ENODEV.

Acked-by: Mark Brown <broonie@kernel.org>

--ai/7cep230enU383
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa60ACgkQJNaLcl1U
h9AIxgf/aE9dWFzQfCG0Di32ndV0EqQxs1Nz2hFLNJ6P6zBxMvAzajZB3qDjJ3XI
xXw01xKmYAvK377Gp7p0LnR91wMO62ePladK4ECjIlgu8Ju2Frd5gdR/aRpuKWv+
aCcfrEVcwaz9aCuKA/5ZvbwKHRlvoyNMfCX2nfr9jTrbYA0oYF6HvpGJYvwaDwnp
7yS2ITem2+OoKrx4jDZ2cLBaZO6FE3TOAVeHBRr9B5DsFX9mK11VFaIfKCYKeYqS
czXdWiRwzujKV66cf8XxbUWHaqd52UOR+h2L1GvX56rVKcq3FkuCQqmb3VbCuImf
O6gbkzuB43qmtFANlYGaT1Q9EcXk9g==
=wTRz
-----END PGP SIGNATURE-----

--ai/7cep230enU383--
