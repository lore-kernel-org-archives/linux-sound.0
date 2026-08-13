Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822ED12E1DC;
	Thu, 13 Aug 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786650797; cv=none; b=SWvJdqwrIW5fH+E8HCve/AL1DV/mbMyTh7r+gAx+OkoqXotmJyFs9qPNE3wAfjxJ68te+e8ptw/y2SBY4KBobdJq5DKXxgBJW1X5KDqdqK3hASmfNV4My8Lm3skHlZjqzx4X9PYqjxtFFSoM2cqoLc1SG0Jez622YEo1kHks9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786650797; c=relaxed/simple;
	bh=7AuMuTdhLDG64IY9Gy9Ucah+fhemG+aPhHdzEknA9eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t59uY0t3sv182I4n0r2Ug2S4in56jBg2brOZvAi8OOWrPiigG307nMJo+qQxtsNZ3NpWziFb2dMSeOZ2sf6JWM+Z/d/cSjO8+o9lqqc+nAgkfBaIzkq61ktJwd9PN965riUBUBFdJd+sRRYJG4JoK/LLbC3aRaxkFRR1dam8OFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pt9VrXUi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pt9VrXUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD271F000E9;
	Thu, 13 Aug 2026 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786650796;
	bh=iebpBReB5T893rVJkefzP99amsY14iiMjZbPvwhzhCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pt9VrXUiiO7WvQrkI14LS2NWnQNkMl4NbZPX+s9+E4g7KnaOXNMNK7/qmkmu1A0MV
	 NBfhOgiLNYghns57EXCHWrzWT/XyqXKwKjF3RuspVIcgbBVCkAdFhWaTgpHhHTkXoG
	 iKrqN+yqoxWPJsAhuX65pNK0QYWV5vUBuAn5kIyng2s9eqF2o4nb9YFk8YTnjBUlw5
	 WZb2iuGkMn6k9n/5IGsH/PkyKMq1jUVu4ru9Egdh6jMhzl6ZNYmxAUU02G1HrDm28k
	 jPR7kXoX2V5+LZKUj05FEjKiVht+M5vsPZYduMhPDDZzxskj42SdIZ4kDhd6F31uwo
	 RGnMu+KHfTcEQ==
Date: Thu, 13 Aug 2026 20:53:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrey Golovko <andrey.golovko@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Antoine Monnet <antoine@montane.tech>,
	Robin Everaars <robineveraars@pm.me>,
	Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: do not treat read-only Controls as
 writable
Message-ID: <4207280a-35d3-4902-ba8e-e8466f5c7f47@sirena.org.uk>
References: <20260813203500.12106-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rgPLhXgkvai3NyRX"
Content-Disposition: inline
In-Reply-To: <20260813203500.12106-1-andrey.golovko@gmail.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--rgPLhXgkvai3NyRX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 08:35:00PM +0300, Andrey Golovko wrote:
> The regmap has no writeable_reg callback, so regmap considers every
> register up to max_register writable.  That includes the read-only SDCA
> Controls the driver itself describes: the Latency of every Entity, the

> +	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_XU22, 0x14, 0):

0x14 is SDCA_CTL_XU_FDL_STATUS and AFAICT sdca_fdl_process() might write
to it.  Not sure if that's reachable with this device or not...

--rgPLhXgkvai3NyRX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+IKUACgkQJNaLcl1U
h9Bygwf/e0Y/bEIj4dvcYvycCKJr5MbKQgCivxg9fRjswFXpS/R9UZ8oo5EaU1r9
l95MAkWKTXlQkFr/YJ45SkeJtzdASlYqdXu/QBDw99YIxgAGicjQxxjJUiagR6Z9
unDQPSJQA7MY+siA8ARsxy5s5B3/H5bI1qdN64x1EBvZiEIUeLqkZwhazbLrCMmH
AQR9uThtGSGQJVFDr9zMQZb/GXP9XU1qdshMDUvbgXoqAq7UOssIzyV1J/QdXSdz
DEchgUtVf8h/++ak3/CGoFz98uwh+c88tE8RqLTNBML/e/vtMsgUHDD8/Uus3YUY
R5GOASZHBhrGiE9aYyfJBT3fG2aTRw==
=yHSw
-----END PGP SIGNATURE-----

--rgPLhXgkvai3NyRX--
