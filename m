Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C663F44FC
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482795; cv=none; b=Wv5BGCeuKR1A1NmwHZ2ngXMAVQdBFSRAPnH4y3GJtsvU0fdqH9zk9av9OAljeMjp8QAI/PKSEQiiW/E5gRCs0MrJoOJEyXuVeZMuXSmJ56PtnCSSoJhcwU0J/M3bW61Cs2opjsXOLAGKlBOaN4l+XRUTETEJ9nhjh+FyWRPVQE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482795; c=relaxed/simple;
	bh=wIab6OslXPgN9h4lUjdTDDBrI1tJpklY8rwBiyQxJMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp8BTtPBKVv42qkfGyTYalcFtlHdBddcM9YaeJChhPaMsGCGJkl8CLvJtUbGFukB7lDmw7tQNKdsLrLF9679wbToG2duLHDgJELNTX6MWJ+aLZvnWpaJnvEZ4VZBjuSnVo7nofbgJ+i9gZCFkbjdzTaP5LEtv4ksV8QZNKvsNCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joIbUgAW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joIbUgAW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060EC1F000E9;
	Fri, 26 Jun 2026 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782482792;
	bh=PlFh/O5gVIHyGI96pBEV2BswDSLXWU9KkeR29oMqzFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=joIbUgAWu4xrj6s4zcNQxMjFkT6M9m4FNdRRXaIXMSd+v9QSWrE1gpdsqGXKm62Fk
	 xSMO/eU9qrCzCYulCJtboBK4jrdH4wCCSVWaOcpgSSsOl9LphrngUV1X4XuUdpqfMT
	 JtIGv8RaYGxc6Bto7u9BHXREpGhjthJY56w1m357NF540WQGMk085TX0+XRZu3RjTa
	 85HQ3FP2NiDcfI+bzNJo5knEjd7xVBrvyZn6tXGJPewOSNq0NJ7kHGsUSjrkdzXz+p
	 yXHmaRf0JdD7515P8izu+G5K/vy1LHqeIK6siAOQQbcZ/yTpfEK6mVaqIKwJ0r0Met
	 O8lyrnlH5dMsg==
Date: Fri, 26 Jun 2026 15:06:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v3 3/6] ASoC: codecs: ES8389: Modify the clock table
Message-ID: <df181e29-9c1e-427c-9c81-a0bf2cd9fdf6@sirena.org.uk>
References: <20260626113614.27893-1-zhangyi@everest-semi.com>
 <20260626113614.27893-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kAKcSacxTS79Jnjf"
Content-Disposition: inline
In-Reply-To: <20260626113614.27893-4-zhangyi@everest-semi.com>
X-Cookie: A company is known by the men it keeps.


--kAKcSacxTS79Jnjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2026 at 07:36:11PM +0800, Zhang Yi wrote:

> Updated the configuration for certain frequencies
> If get_coeff does not find a value that matches the condition, return -EINVAL

Do we have values for all advertised sample rates?  I'm not seeing
11.025kHz for exaample.

--kAKcSacxTS79Jnjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo+h2QACgkQJNaLcl1U
h9BLTwf/TYCQs+CwSvpv/ZF2hebnNz3FEtJMXIcgPF8VXoV8a66a0SjeFSosF7Xo
YEgfQUz9He3VzzYO+LU4EfO5UIJevs2mR3xxaRLSjUlYjY2tRCz7hqH85cYIQ60w
/XM8AR9a6D5uZUd1N6ElClHiI/POjukLcFAUUWNAPa2f3bZlsmXLuifdN8MKWdEo
gXC99mwdX+lNw/l10oD22jAU6OSO6um5pK2EyqZPDGUIjsZeC4tT/YtXxjwf//Qr
PA725n864OAtrn0cQ8dT6gVztxJfys1MpH/pFpRcKAF1jOtDzI0yBekvyvkXj/WY
homiCKCzIwVGpEbLM6sGZJHqfw8tcA==
=Xxo8
-----END PGP SIGNATURE-----

--kAKcSacxTS79Jnjf--
