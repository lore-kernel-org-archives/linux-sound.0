Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555020ADD6
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606649; cv=none; b=uhIrXAi9CspeM2uqZJD2x1MNHv2cEV4/VhkPVjxuWt4HLDly8FA9CdFBKXuqr7dkx/02KvfzdOpkK3anU/YJuxSknL2G2adReVD8WmJ15P0EeML+pmHd8KfVqNGkhsFW3lMcBuddQ83widqGiE49+UMIUtrRxOEVwcXtxg/ScfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606649; c=relaxed/simple;
	bh=EtjA6KHz4f0Bo0AftpsmVvKJGgrz5xR0jEkqXVkrxIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f48C6c/8hJSN6TMfTf6SOwqH1LtPBHFm0wTrJPxG9hQif3Kxt4JRtFK0PYVeHockvItjhqc8sBwKhXHSbSOIEyWoMJel256VsJ1+hlJb6P5ggZtpYzg142D4R9TM240qP9SyRnh1w2Y6aH+ZD3YTuXm126p2IHX7Ouu2YAM5BgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfol2yeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfol2yeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC1CC4CEF0;
	Thu, 11 Sep 2025 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757606648;
	bh=EtjA6KHz4f0Bo0AftpsmVvKJGgrz5xR0jEkqXVkrxIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfol2yeDwJdsswn7tIhCL4q+6Nk/h4fy4ANGM3mjK4JWOWt23MFqTcMje0eO9mXUS
	 zZJAqwbz0h0csUFH9J4iWCsI1cRX6t7ZxygTJN/Rsdb6hAdW1gI7r/lMK6FFZMy8dE
	 6hbX0NNFgrrOANy2vv50v6oTgiKMI1Ey7y4Pbz80MMLNaZq3uUoKxVjbQCsYD3+a47
	 ivQhnlufx+4rd20Xdq6T1cAD/qJL/OQo6V+981+tMGblL3/SW14FSt2iFiw5KydfRM
	 PNA+pJPtY7fq9paWo+7jMz2h/9e0UR/Qg2tax9tLZKcqiHNc6+2GFA3ZA1tdG2i9OC
	 rnnvYJHHBcqaQ==
Date: Thu, 11 Sep 2025 17:04:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com
Subject: Re: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Message-ID: <652726cc-b286-4ba0-b49c-8b981d6d0244@sirena.org.uk>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
 <20250911155704.2236-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nudhPraOH89YU/Jv"
Content-Disposition: inline
In-Reply-To: <20250911155704.2236-2-niranjan.hy@ti.com>
X-Cookie: Your domestic life may be harmonious.


--nudhPraOH89YU/Jv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 09:26:59PM +0530, Niranjan H Y wrote:
>   Add API snd_soc_get_volsw_clamped to read
>   the volume from device. This similar to
>   existing API snd_soc_get_volsw. But has
>   additional step to clamp the value to max value
>   if the register value is larger than max value.

Why is this a separate API, what is the situation where we would want to
report an invalid value from a control?  I was thinking of just adding
this to the existing operations rather than adding separate ones that
need to be explicitly set.

--nudhPraOH89YU/Jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjC8vIACgkQJNaLcl1U
h9BMggf+PmjIfR2DMy732zUgzi5xKsl2VNVltZ+Oe0qN2R0ZwvHFR4D197ZnYp1E
q187MsFCKImr2yZnjIPFxVkuTPE78cRK0fUcGtRLTttUe0LWV0n0QbHFZjr5vQH0
hs+buZkW6Cci4gHJ5W6g6ci4ALZtnamqo706n45wSJO3q0txT3Qa1jriX6fM+V14
mY9fTQpXgizbn4PAsInR0u7M6OcnRE/fyWYvX5wunLnLYJKhGZH1+khUedMTWF5N
UryXBwnvk4l9e2TFcKUdgluTudXd+qsy2Lw/JJWIxDQgH+XVlTKIehGqoCwDSzop
RK6hw/zKIB5wvaf9AzVu7H6H2XPMuQ==
=34f5
-----END PGP SIGNATURE-----

--nudhPraOH89YU/Jv--
