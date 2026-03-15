Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8740244660;
	Sun, 15 Mar 2026 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773618967; cv=none; b=KpCfs4muWHvVZnNFhCvFDVlm0/kRcbvig+KDWTHhYu6gqkImcE9hhqqKMDDv4cGEeFIb7IbP8P/9LtQSTSqMT8J29/QpRGtytOENlZVETIIj5y7SaeVezSBPvC3tKIm62N3lRb11iM7rZK2qKj6HY5yqTzc0/Od4ShOY8+hbdQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773618967; c=relaxed/simple;
	bh=DE+KUBV8FLRWjAylKdIKw2xH8QgL9gnuK/ZTlhKbFBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rElMTXzYC97MeWTykVr+b26wXOGSum/MVw01JxboA3/ROyolgsadazTVsFcOHLmpHIIvT161BpJOHm0ve4QfzoCdfjtc7TkI+1zrxyZBOfmVG/BFfarnaq3YsMeArhmse0Y8KXHwk75ioys8+Km2Q7/UXiG3AdsquULZpdxT8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ5pBGl4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ5pBGl4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D61AC4CEF7;
	Sun, 15 Mar 2026 23:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773618966;
	bh=DE+KUBV8FLRWjAylKdIKw2xH8QgL9gnuK/ZTlhKbFBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQ5pBGl4coQOjkqD3FB0Bb8Dke6w1cnluNmw203Dc08NJk57xFNxq7QjCTeXO4O9w
	 G4fcPWPKYcVflCVcdfzzv16lvEv4hyTl4FT+nRD1J4qq0a+saMKSWQx4ozdOSLEmWv
	 VZMCzJm1MKIcYGAxcaaCOShRx017QTBojzP4mjhNFuyycUGtWWQB/KBLisLyuqr+AY
	 voUhqxOS5WHdHTpRrCqIU72K2qKY60QG8F9Be8/3Qij3o+KVR6vAL2mngoeRqGz7cY
	 +JpGLWRWmZuDkNDPXdLhwp0cbwZo+M7/fxk1ebAa92TuY3PB46jLAwD7LJMsch8LvZ
	 8hnkCzJBv4AMw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 025EE1AC5656; Sun, 15 Mar 2026 23:56:03 +0000 (GMT)
Date: Sun, 15 Mar 2026 23:56:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mfd@vger.kernel.org
Subject: Re: [PATCH] mfd/ASoC: WM8400: select SND_SOC_WM8400 from MFD_WM8400
Message-ID: <abdHE2O9Na4u-qDj@sirena.co.uk>
References: <20260315202117.200641-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bkll+UJa1wo2t22g"
Content-Disposition: inline
In-Reply-To: <20260315202117.200641-1-piyushpatle228@gmail.com>
X-Cookie: Identify your visitor.


--Bkll+UJa1wo2t22g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 01:51:17AM +0530, Piyush Patle wrote:
> The MFD driver wm8400-core.c unconditionally registers a platform
> device named 'wm8400-codec' via wm8400_register_codec(). The codec
> driver in sound/soc/codecs/wm8400.c binds to this device by name,
> but SND_SOC_WM8400 is a hidden symbol with no prompt and nothing
> was selecting it in normal configurations, so the driver never built.
>=20
> Fix this by adding 'select SND_SOC_WM8400' to MFD_WM8400, which
> encodes the implicit dependency that already existed at runtime.
> Also remove the FIXME comment that noted this gap.

This doesn't accomplish anything, the driver will do nothing unless a
sound card binds to it.  This is very standard for older CODEC drivers,
the comment just shouldn't be there.

--Bkll+UJa1wo2t22g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3RxMACgkQJNaLcl1U
h9AVxggAhDsHDp9Y5c9iQ/HLsQDazUbPW05LxA2tiyBhsODa9hi51gngtU0lIhr7
ZiohvgvfPsu+ntoTe6aEgmappDYWFnHwf5Ry0lH7bY7Q4O2ME2AQVoL35X/4vPR5
CAap8quNXudI3LrJT6GF9A7FyTvYQcUcHoJAfQ6lgWldbyU/j17kLJQUFy/peVY1
FafnsC7PTN0esEifvCBykaF6hYc3QXi+jkR2pxZhc4rrCzdWPFIeV0587U6Nh3nC
4CXiz05kPE+ltf1ZS16RChKQNApzfCXCKQNxU7fK8kzNhX3tpHHFCS7EYXLrTTL+
mNCsXRyLebuX/x8u17lL/4Z4sVjDNQ==
=c9di
-----END PGP SIGNATURE-----

--Bkll+UJa1wo2t22g--
