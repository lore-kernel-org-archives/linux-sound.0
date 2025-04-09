Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C615A85E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 20:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229222; cv=none; b=TRD9KJGugWp8YJTfHqux3EJePEyulAdrNdyzuX4kFxGpYNMnnXvpOf+ifVsiCall+s4wyGvenwmNBA/9TGW8UT3pbz5GLHJj9joof/9z29aqWy3AlKT7l+NHA8/MsJdq1LHo/xHdY2Aiw9AMtyyOYKy5Wn/n1ORbdXyyYm8Y2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229222; c=relaxed/simple;
	bh=arYB9iOa7LU/bm5KHvYajz6tOX+iu97dgMhaHnHezY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7WXjmOaAb9f1DvAEE4aY8UPQaglbkouvX8Lmjo6mncAgqDsSwzgukPCQ+RqrIswZLb7Wrx+rAVdr3Pvt65+ERXIDIwgYFFdxDEB6P9Eck5LRErSRPZuKpbfr5s/5R/IuHG8igH7PyUU4xMx09aXMs9lohgnN0ohAEg0rcKqWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2ZLDBXV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2ZLDBXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E5EC4CEE2;
	Wed,  9 Apr 2025 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744229222;
	bh=arYB9iOa7LU/bm5KHvYajz6tOX+iu97dgMhaHnHezY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2ZLDBXV+/c2m6awmhnAbVnewepT+6wZmjYaOVK8sV3mpFtk/2CJPq8gBh6M3Yo8d
	 oOr8e/J+Nao4ahQkPmIW4FpE85Zl3nnp6DKhenC7Gl18xN18oTOQogObk/kLFWm8r7
	 QcNFqwl+OLV3RxFl1ZhLhAeRKVouagLWc19h96SdDK9xUrpcd4v4XZU8fEXDB0sDmX
	 HcdX+zErR2+hyQreF4k99fqcBT/XWmh/SHaPGZMP48vVCDgaqMZ3h3Ze3qUpJtpaWx
	 c70DGn4Kf6X7yyaKTOCUlmlcsL3CDBwpyzzAlDiLpUW2eMoQBgkkMogGjB8lin62qi
	 DZsjUbMV84VHw==
Date: Wed, 9 Apr 2025 21:06:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: Debugging CPU-side DAI hardware with a dummy codec
Message-ID: <3c6141c0-0add-423c-9e69-ffb3c545071c@sirena.org.uk>
References: <4927043.LvFx2qVVIh@workhorse>
 <e649be07-108a-4f7c-9471-74b74a4f73ad@sirena.org.uk>
 <5586956.31r3eYUQgx@workhorse>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6pU1V/NsYSeaftY"
Content-Disposition: inline
In-Reply-To: <5586956.31r3eYUQgx@workhorse>
X-Cookie: Words must be weighed, not counted.


--t6pU1V/NsYSeaftY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 09, 2025 at 09:56:35PM +0200, Nicolas Frattaroli wrote:

> I actually ended up finding `sound/soc/generic/test-component.c`, which almost
> works for my purposes bar not having any tdm slot callbacks, which makes ASoC
> core not use it for TDM. That's simple enough to add:

If you want to sumbmit that upstream (probably with the logging
dropped/tone down to debug) then the TDM support would be there for the
next person who needs it...

--t6pU1V/NsYSeaftY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf202EACgkQJNaLcl1U
h9CkFAf/QhjASDizNAlGr5R3JXX5OOoAGSr+OZVGyqhjh4jiSykbmqWI9gnXH8uN
vwkeLjq5YfhQ0BjH4jMTExD8/nFuKphV8MDP9SQ1RfFhxVH2HI8dm3xGfmrwS0Gb
BXv2jsCmMvCd6KOSH+LH9xd59K6lfHzXlfHSlBK7c7JUQQk9QiqV+jVjA0VMzd49
GllBEUYR7DtVaq9SGA0l46ezyz4vjk4+q45Z9XLKFxPwFD1VGNMAkAK04LfdoszF
KqOvX5W0lZrADJRQTjqCZVQwlEej1WW71sFFHsREqtm4YkrVt6aZfC0QecIb4otM
P4jSVWfmGesHYXDPS6w9xTnK5k4Y2A==
=uhid
-----END PGP SIGNATURE-----

--t6pU1V/NsYSeaftY--
