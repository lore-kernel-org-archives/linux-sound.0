Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B17406D
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722511897; cv=none; b=r12YSFKwA345Oa5M/VVdO3FSTAC46zUehLO2LbMOJ78luox8XrRnqsZjH5CeqLVYLguEE+bc/VaDLs9yl/9Z13yrc/iJiRWacxhQFcm5rizGxr8BwDHr88d0CUARB3YFd9IlhE0UBt81DbOB+RtTPVd7Fh8Ih8O+DPU58n0iWIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722511897; c=relaxed/simple;
	bh=ClC7xlDcPCk6bj3RY8lf6TweEYWzrsuR/1rH9Vz7BPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loRjLeDkgecLE/K5k8POd0J7OaFnS0Ea0HyQwahEogiImSVn09cw6QCa4c4Dkd6bMcD9O39ITvSU49ZnPCkZ7op+br9YA1a0lQ7MCzCP5FYGiaVpEixhaXhwn+zSQJiEQOfy730XtInsgSRFiig7PSGbn46cDmtg3tDiH/5AReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEPBpvVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEPBpvVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8783FC32786;
	Thu,  1 Aug 2024 11:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722511897;
	bh=ClC7xlDcPCk6bj3RY8lf6TweEYWzrsuR/1rH9Vz7BPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEPBpvVa4BEgPxhO0o2VYdbw+PvIXqgU1IleNdOnmjlSsqgJJIebUxlmzI76U/uGA
	 e76+IsX37J3Q6DyBpQe11AJM81f7Z4IfWffWk5CX9wiKGt7G8cHLOdO0V9KWXiuZMY
	 vFZfue2R36LX833gaztc1Z8oVh0yU0iDhI3AWpW4HCIDbL4YqPEYKcos/JwHZobh+B
	 Llgf5yt4Y6N+v2nBa+37aYZVuWqFDjJ9Di4Fja1oQoOlH3PCv+Eskp+t1V7eLypFkH
	 mECYzNL1/5+4LrRJr0WV3PuBaMQvpFv7H5ZJNP/hBBbTdpJztWtTXIISYP9ozDtCfm
	 UZoLJLmcZsUNw==
Date: Thu, 1 Aug 2024 12:31:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: Drop snd_soc_card_get_kcontrol_locked()
Message-ID: <16370ff1-a41b-49bb-8921-153b5bae8a95@sirena.org.uk>
References: <20240801074617.4997-1-tiwai@suse.de>
 <20240801074617.4997-4-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FeOIIvVahwF2aIbR"
Content-Disposition: inline
In-Reply-To: <20240801074617.4997-4-tiwai@suse.de>
X-Cookie: Be cautious in your daily affairs.


--FeOIIvVahwF2aIbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 01, 2024 at 09:46:09AM +0200, Takashi Iwai wrote:
> The recent cleanup in ALSA control core made no difference between
> snd_ctl_find_id_mixer() and snd_ctl_find_id_mixer_locked(), and the
> latter is to be dropped.  The only user of the left API was ASoC, and
> that's snd_soc_card_get_kcontrol_locked().

Reviewed-by: Mark Brown <broonie@kernel.org>

--FeOIIvVahwF2aIbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmarchQACgkQJNaLcl1U
h9AK6gf+JjXWTzgUpjDJLCB+esXSjDc5gup5iC5cz/h8msh1T7RIZVfb4a6MOvzg
yUBn481EMnbzyNw5d7qQMeyPVqd4PVC2902lHbRhJYCCTzmp8V/aH53A1LC88Ynk
nc4ZYrABhRIFm2emcRQoXU8L2vWsW/8lc3Vz6Dda+x5Do9ZAWMvKlAlOKALiaYW8
Z/hT5w0KViZorxww2rv/W6k6jZRCRhhfE4RMvODiUUVsMpvz4rxFo1ExhkxfGRMn
TrSTeTcLHaO5aOgcAOkqYI+NtsJfFfw1OczSZu+sD/LpwpAhVXFYqnDIVXE+Ln+x
MYlf/T5Kt0DkiqKMvwPWpIcH1HgDxQ==
=54Al
-----END PGP SIGNATURE-----

--FeOIIvVahwF2aIbR--
