Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604A125A9
	for <linux-sound@vger.kernel.org>; Mon,  2 Feb 2026 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034893; cv=none; b=NzAhXjBEZpJ2ubheVVBr5W+sNh2EzpRPOSZxAwrjT/YgzpTiQiS3VQcoqpdpdAyapL6rSutIBwHc5h4RPtITfLdKf3Ghcf2nWjMQMQywsPNB0paZxOxTTuMi6a9kfCg8o3cp1485rGeZGBKCIN85+513eDvgCJpZz74T4epk2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034893; c=relaxed/simple;
	bh=tQTtxudV5D1aY5fDTIGfrnS4HQRmlhQ2X2DR48xfrdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPIAyRbxOfNZ30Sk5MVGVYS6n9qwiy8MwHyqiQ5AwhIu1A7UwrI0QPrYlS1dhu82HBe/07HKs+60aFvB2qENcT6SO0t+SL7V1ptxINnkQYl/wRdgJ+IN6GIM1+t8lAht8sBo6j7UDC1pkZQzG5VacJ/+R8ty4lGGC1b3jTMisCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zz8agpcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zz8agpcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEC0C116C6;
	Mon,  2 Feb 2026 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034893;
	bh=tQTtxudV5D1aY5fDTIGfrnS4HQRmlhQ2X2DR48xfrdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zz8agpcKfcBE4mS/6fL3yifYdy7RASSpvZS6OWH1wcvpvGG/XDEXIZcnlVonMxzxv
	 KelerqcsoOg+COyve6I2Xl9Exa40/MSK8q/6IV0+q0HAantsGvzP4ls6PlXE9fjv89
	 CRksYBBynDJEcCkr4Pa6A6Qb3ZICQFVGGU9Anj015wVgPdLF4Cvn/S9hlccggHNw5+
	 99Ox+rSVPODSu8jZrPV+A8oUREbxzfgM1TwAQ5tty4AiTWPwkvUrA9nh/ept0gFgZl
	 j47nwQPNt4fu4vJLIbCdevrNyWZ6TpCedqITc1xdEmkfsx1HOUSQ6IQZlNEmOXZOSI
	 dgERJnYsME9Sg==
Date: Mon, 2 Feb 2026 12:21:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com
Subject: Re: [Question] Dead code in snd_soc_dapm_del_routes()?
Message-ID: <d9975127-b178-4be5-bd60-5b590ecb772f@sirena.org.uk>
References: <20260131151001.3296905-1-ingyujang25@korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJs2373EM5NNhS/k"
Content-Disposition: inline
In-Reply-To: <20260131151001.3296905-1-ingyujang25@korea.ac.kr>
X-Cookie: Bedfellows make strange politicians.


--DJs2373EM5NNhS/k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 01, 2026 at 12:10:01AM +0900, Ingyu Jang wrote:

> However, in sound/soc/codecs/tlv320aic31xx.c, the return value
> is checked and there is error handling (at lines 1044-1052):

...

> Is this intentional defensive coding for potential future changes,
> or could this be cleaned up by making the function return void?

It's defensive programming, though it's questionable what state the
system is likely to be in and how useful any error recovery would be if
things fail.

--DJs2373EM5NNhS/k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAlsgACgkQJNaLcl1U
h9CSZwf+PMHJzvapJYR6IidKbvjtJQsMm/kAIzDCVsrxzqlv29aoYKFknkt+qARt
MtHgPMx4xkv6HzbQzbFR2AT65ZQFH4aQTN4IHlfJDsG3XPXDfYhgIbdxRpTcLpuB
wyp4O4vXsGK9PCGsb3JaQ/m0zaf6hLJ4Zmjcp2WG4kCegP9DfrDfXRF+jidsCNnW
BuTW4cXGwyvQNzFU0DwN2fINeMMMtvHGquorVsqXewusB8iclH1/Q3+w7d58Z6Ng
ULCac5EpUgL5XdtCpu/Z7Hq0YowrtpFLbj530892L8+QvAmQ333mkIQfMxodVfg2
kb7SO1jRTz4Z+dIhzGfYKKgz/jypPw==
=d0UF
-----END PGP SIGNATURE-----

--DJs2373EM5NNhS/k--
