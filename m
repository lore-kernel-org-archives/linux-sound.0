Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898433DA7E1;
	Wed,  1 Jul 2026 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782932127; cv=none; b=mjKhVGTjxz8lbsyX4cbfA9WNhQg5uZBOa/Mw+MeCI7/Lb28iSj1L3M6vtRa/bAXFfSnNQeFxMA5AXuoCtZWPnSn75WG2+sab8Rm6wx+L1rN4PbVkU6RH9pfzCVx/efoO93Q30GTavRAT+IhjD5B51E3rJy+x2DrGptC54G+RYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782932127; c=relaxed/simple;
	bh=wjhE08/Vz+GLYIoyS6PekF+MYGJmIifPN9PM9YMel8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtfKMgf11HuPLuOp9koCUEisXs/djd8gwGIBuqh29xC3oleV667MLqmxr/ydP2npD/YlDL7aq2xERoVk1VwzUi/mp/FF0OIR2cm3bQlD2FfxsPZhWsqzwbKAHVRNCq/rFJZe2Pa6Ml5+TTJWuv3F9aVzVUiqfFcofUU/0dfNQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krkVh2/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krkVh2/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2A71F000E9;
	Wed,  1 Jul 2026 18:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782932124;
	bh=wjhE08/Vz+GLYIoyS6PekF+MYGJmIifPN9PM9YMel8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=krkVh2/51s+V8Hx7pArCpbO4DsnxkU6L7TbAyK8KhBs3P9uF/w01QsIw9tpMuAFNC
	 z+TuHgdTCXnAB03VXdOctHGscae6wnbx7BOggU/7H0po04xhZuB+v4AMPGwD4d8dYY
	 81RhM4h2uGubh2G2QxHa6gMl21spaPKJH7s7zlQc4qyPRAIuGQ6LyahKc0eA2722aa
	 P/HEoYCNi+mFSx5H8EpOyXVhOYPARfikM2vu/mu/3hg28vZfLSCMVpUMiYI/Yixp8o
	 DSnR3Fw+EZtRuNEtWe1iY1SW0taG1a3NThNqVQg4i3ynVYn3TINStnifdY6rhQ3PTu
	 /mQcIZF2ifOpg==
Date: Wed, 1 Jul 2026 19:55:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: codecs: tas675x: use READ_ONCE for params to
 be used concurrently
Message-ID: <53fe396b-12c6-46d0-9cb6-d492e8cc7d96@sirena.org.uk>
References: <20260630183126.2588322-1-sen@ti.com>
 <20260630183126.2588322-2-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PeiBEmCLrj9WIrdF"
Content-Disposition: inline
In-Reply-To: <20260630183126.2588322-2-sen@ti.com>
X-Cookie: Do unto others before they undo you.


--PeiBEmCLrj9WIrdF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 01:31:20PM -0500, Sen Wang wrote:
> active_playback_dais and active_capture_dais are written atomically via
> set_bit()/clear_bit() and can be read concurrently from the
> fault_check_work delayed work handler.
>=20
> fault_check_work already uses READ_ONCE; extend the same guard to all oth=
er
> reads in tas675x_hw_params() and tas675x_mute_stream().

I'm not convinced that any of this READ_ONCE stuff is safe, that's a
very unusual pattern for an I2C device like these, but given that I
missed it earlier I'll take the patch for now.

--PeiBEmCLrj9WIrdF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFYpYACgkQJNaLcl1U
h9D3MQf/VOIDtQptD4b+4G4GFt+n4+cpF46wzC3wipDlECpTX1U+vt56rtZxEEy4
fPdfqZCjR4m1KEPxxQRMNeb3KUcQbffiAFp+N9Z547yQ9KqrxceCWftT3c476y/2
eERIUVNzmp0UIjJsrGrEDQuPKD46JuEuhQKjtfv0Cs++2FbRGPGhwLvoSzSlRO6f
KmScN58sgKGwaFfBgA83TQOnw9Hbv5QjGL9D4Wl2sHl73vkJlAGMNJjZ+HE3xbky
mmq6pFCeUg8hH7DeRHMMyMJIOLAcQfRzrDYq3vnULESyvZ8K6l3EM6crRQBos9Im
4cnzOe08/E/mTsICTNy1Lu8E0MsbBw==
=ruD5
-----END PGP SIGNATURE-----

--PeiBEmCLrj9WIrdF--
