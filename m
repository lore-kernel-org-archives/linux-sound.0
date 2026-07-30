Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1A409272
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412050; cv=none; b=bS9ZlvxbItwXc7oF5BLGEnrVSr/ih1tlPC2qjT0nVbb0hKSoThDG7N8RiDz8FNh+ySFHuY9QsXdmGlo7U2gP/fS2edKsm2bUG0RtHRHfRE+OaOjEkIpMG/L1nYeBfEDHl+Rcnc9sVwYpVWHVRMSuwL3LXLS1vNGOeRameSf3KaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412050; c=relaxed/simple;
	bh=r1x57+76IofifMl3m+leykT0LbecfY3BbZB7rpT57vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI1cQa5WzWxv4x7oow+Tx5bQxc8Kc1HHzGzFuJum0zDd0iNxA4Me4+KfDRiMCLtB2S1OxX+bo7/539hmF/Gf+daWFKJcUDNOeAw7sRvl+Tr18uMFAGzRbyGui9cs7wS0yL00qHd8hLMM5yn+SV8M0MKCOK2ygMnFVu478OXKbNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtsR7KY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtsR7KY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9811F000E9;
	Thu, 30 Jul 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412048;
	bh=T/gSdGk8JGM/snxp/v/AsS64nrwS6xpTRIDIXyKMZHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtsR7KY2y1pCOg9P/ij48Be+sRsW1qV5rL+CoFgIBvw/AdC9cG406A6UUKFgUzrYV
	 LTUnSVko3guHwwibe9/AN+YDfVR99kJtKUUfkU4sEHsEP5C1+cpAakStpTCC2YGDrK
	 TrDmTInPQnKTKnPqUeGSOJDjBsZseH0V0rcc/MYnEOBn4miIEEiXwmI4Fct6OrVHcx
	 CnGCFZwSIE0bD7SmU6CIs3C1RJ52xonFRcx4i1cq2joQ1Hvzm5IXJ12K2YwmWQT5Vs
	 dXjjzh7js6w3QV5pTg6aDdifiRB8yfxYt9fn37NeN6/1S+qTDyY4R9RAeLPksBKsSR
	 ttWwEP/J6sveg==
Date: Thu, 30 Jul 2026 12:47:24 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH v2] ASoC: rt722: reset codec to fix abnormal sound
Message-ID: <008f1f5a-babe-4104-bbbc-ac73a1acb5c8@sirena.org.uk>
References: <20260730085938.3920122-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lenPlWuLjbFbCs5M"
Content-Disposition: inline
In-Reply-To: <20260730085938.3920122-1-shumingf@realtek.com>
X-Cookie: In specially marked packages only.


--lenPlWuLjbFbCs5M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 04:59:38PM +0800, shumingf@realtek.com wrote:

> +	if (rt722->hs_jack && (!rt722->first_hw_init))
> +		rt722_sdca_jack_init(rt722);
> +

Please send this as an incremenal fix, I applied v1.

--lenPlWuLjbFbCs5M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprOcsACgkQJNaLcl1U
h9CAJwgAg5WqH2Hvm7yp3F7/3G82300AXN8sawibQjD/CjzEE88Qf6YBk0CnqNyK
JbgZ0YFPJkgr+P2r8AuGZeh9OS3s+QvucteoS4JBRwRnIiCzikPUU4ZD2BLFi095
GxiIPrsNnkwpX7IAtTTCuRJxrSufVcAk3QC7A2/mLa0BGFGuDrhOySq711baYexl
p9+oYKYF8yHBY5Vojoyokw4IcMcj0gFc4HMK3LD6KcQN1fy3H25anhRgRKBPGZka
SKZ5+7M+2YzVon/dP3clkSpH7RwPUIb1WFEflGFV4lYwd+ka3C1ZD0VD/xWmlhVB
cZr/E8h3PRh4s/rN2GNgOPjMMWeMgg==
=WeBV
-----END PGP SIGNATURE-----

--lenPlWuLjbFbCs5M--
