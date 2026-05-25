Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29153603D1;
	Mon, 25 May 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705953; cv=none; b=mFP1ynpiVeLVHOsYXz5BxSuTif70KESPLej/BpvnbjB65/Ha3NNJ9yChwrGiUktzbtFbKeNe0joamfAIemhWORg4Y4WqMQS2elBNnIBBQrtdXSlrgJvlqXmcu18pCVR1T3ieT/29B5AUhYxu0ceW2DYouT98mz7yYg1Dxep7G+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705953; c=relaxed/simple;
	bh=bT46bqL02eEb1hsqiaDF0RkdFR3DT91vv53E+6lZDgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZE77lhQXqd/jEIuA+mC/9vZ0fxyRj/pIBYzvLTOQSpjMZm2nhB4kws5I9PVFXBiGC7aITYx4pm83ZAVO9LgqmmK5viBpk2OfXpRBhhNexApQh2Q5G4nZtFiGqSCp2UpeoM0zfgjERtnSqlaN5rJVKXt/QCVHsfCP6UDK7tQ4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lE11Y2cb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lE11Y2cb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5D41F000E9;
	Mon, 25 May 2026 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779705952;
	bh=bT46bqL02eEb1hsqiaDF0RkdFR3DT91vv53E+6lZDgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lE11Y2cbBisUBW21RlOrCvvFhW1d0dThJhjs570rSRpFBUrVUJfqIMfn8RWZsTd3n
	 kjdHenk1cbMSGaiAwEtVXhQoqpa/AX5+ysbrA77wnCMXTGZSgPo2VHVCNoZnqWICuZ
	 qEiaoH24c6q4mueV8DG3gGnEABPwKWk7pnsLyCj6bJ/ziwXqMYv3CZ/ujDpql0UzHS
	 sDKBpiYLR4hx9XE491UmFOUpdah4kvVRyMBTml/xfa2Mq7u31nsM+nNSPXYpaQpWXz
	 5eTt9MFDUSwEbeXJOWH+wukSHbpACa+xYcAkG/LepqnyjE5/9KWZ1ST9rLmloBkZrT
	 EcpWVFDzJy1Gg==
Date: Mon, 25 May 2026 11:45:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs35l56-shared-test: Fix possible null pointer
 dereference
Message-ID: <f325ab56-d2af-443b-a9b0-174e3e55061b@sirena.org.uk>
References: <20260523211522.522616-1-ethantidmore06@gmail.com>
 <c0252afa-ad78-4e36-9a7d-8a8afb04e1d8@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8df3B3e7Uze84Mc+"
Content-Disposition: inline
In-Reply-To: <c0252afa-ad78-4e36-9a7d-8a8afb04e1d8@opensource.cirrus.com>
X-Cookie: Prevent forest fires.


--8df3B3e7Uze84Mc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 25, 2026 at 10:49:03AM +0100, Richard Fitzgerald wrote:

> patch series. It turns out that V3 was already merged, but I didn't
> receive a merge notificiation. V4 has then been merged on top so Mark's
> for-7.2 and for-next contain the combination of V3 and V4 but this
> fix commit doesn't make sense for either version, only the final
> composite result.

You'll only get a notification for the most current version with my
current tooling (people complained about getting notifications on old
versions...) and if you resend quickly things might already be in my CI.

--8df3B3e7Uze84Mc+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUKFoACgkQJNaLcl1U
h9DhPQf+JsJwoFNgRuioSnjgDRhOCBl7kcE/2v9qCBWLDrZyldEfwWFCbqmevj/Z
MXrKkaw3+8T8NPu1LZP4iHKC3bi26S3sjsjYivQoj/F6gwnW9mr90FqEn5O0M+2U
ShEgSDFZuYxUO5LEuCpzEJpuF0mrNVVlJgn9W0+5DvW4uvfvb/OHtUcpsCrz2qyu
fGn3TP5hJYg6Mo0hexxwVjvTPHT5ZhKzrFEKyxpPlH6VxwgqjIzw36/g+megARVH
GAY2nFBCLRvZKqy7xWslhkYTSVf7Rsu+Vn7yIkHFgyGDYTQyYtYa9J02G6efRlI7
pH/joXJ2j10LEGEzxnB108ktpMd+Qg==
=Bfo/
-----END PGP SIGNATURE-----

--8df3B3e7Uze84Mc+--
