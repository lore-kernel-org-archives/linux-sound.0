Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D3014F9FD;
	Wed,  8 Jan 2025 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736356963; cv=none; b=IDbdHLrK0BrTNXxne2Q50yLLnAgDc1PjLpQyxDAOEN6Qr318Ua2EKWbvKdG7oBeM8KghPDYMhamRXK4qX03quUAy2dW24+4eB9DbyNDRVKjRqPuxNDs11gw49+QjTsENeDNVY9E6spe0smSFkdJzIK9f5eA6ue6QPfnOnVMRQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736356963; c=relaxed/simple;
	bh=PcHYDGejbj7HSnlfwgDmFCrAdoKik0MqYOZ0MbjyP1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUcmSWgr+5dne2O4GW+sX+6d/bSEx0GgwVUzsuGnEo1w9nUFpABxbc29S2hIk1Nop1rzwv6aLl6wdzCqTqyVITV8QatJJOz6Slf90dQUjgNx8LNcKJl7OjXY0+WarJT/1oc1qmuzaX+ZgVVyFaS/65JRPYDm5xqjgRpjm6im4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoVSKe6h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoVSKe6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A9DC4CED3;
	Wed,  8 Jan 2025 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736356962;
	bh=PcHYDGejbj7HSnlfwgDmFCrAdoKik0MqYOZ0MbjyP1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AoVSKe6hXd14uA77x2VmjUuhTvJ+XwvW4Q3fGD/OMFecnIZosrGs8ExDXACEmPLFd
	 N42XznhnDGncNTYUbd3xUBV2wBVFlJmcEqEUP0k7g9dBL9wF7VA76sp/F6OT65KSC+
	 j6EvKZMX1Fyb1G94DLemXvBLGPhStPnj1tMvQ6DsUN7Ui9eHZfh1QwFg+lg5+DRRHS
	 M06+cS40FUTpyvX1KeIJjb5uTSaRzafTlIbyf5spN7ESZQn3EL/aVi+TB+GY8jI9yp
	 bQ9RIrJSjSvtKy28s5wA68NVhyNRHT6Q/FSPmTshS6b6kHpQOl1uAOu1wu7d4PHnaH
	 js6dSRRn6equg==
Date: Wed, 8 Jan 2025 17:22:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: hdmi-codec: allow to refine formats
 actually supported
Message-ID: <485ed7fc-c259-489f-960c-470d6ffd645a@sirena.org.uk>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
 <20250108170356.413063-3-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AICZ0BGAZMK3hfk5"
Content-Disposition: inline
In-Reply-To: <20250108170356.413063-3-olivier.moysan@foss.st.com>
X-Cookie: You'll be sorry...


--AICZ0BGAZMK3hfk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2025 at 06:03:55PM +0100, Olivier Moysan wrote:
> Currently the hdmi-codec driver registers all the formats that are
> allowed on the I2S bus. Add i2s_formats field to codec data, to allow
> the hdmi codec client to refine the list of the audio I2S formats
> actually supported.

Acked-by: Mark Brown <broonie@kernel.org>

--AICZ0BGAZMK3hfk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd+tF0ACgkQJNaLcl1U
h9A6uAf+KCRjDfjMSPoVkSLJh/fAGdDbRdusmyhr/nvmCax9FGaclaM/TDr83kmn
GRdMve0OW9x1sGjPVLycncH5JVsipMKOH11XrxmBpjAx+yhs+98VZOYu+bxneROp
TJpmrUpyx/IEpyHzuguXCGn9CUi1qgCYpJ0s3IOWdaqP37kAz4cJv8QBYOpmM89V
5fuW6UvvEA6emDoIO/stutFQsOZdJwquKz5QoHogm8AKnVrbLEq5xixcXt9+gHqY
Fe513VTzuSgXeCINdwEijvcOHsJY1eoUc+WGrCnekCg/SYL1StvrdDMX+RTVz9Cm
Y8xRKWG4M7NdiSuPDgsu3C+LpIMtqw==
=ny3b
-----END PGP SIGNATURE-----

--AICZ0BGAZMK3hfk5--
