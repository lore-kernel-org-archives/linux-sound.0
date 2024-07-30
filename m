Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1922190070
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722381646; cv=none; b=u6vgh7oFY1HFWsBLHpMcZ++B6kT88RVPGl9Dvnj5Q4RKAQkV4LzkeQoKJcHfr/P86QAN0HMfy1hJr/sg/rbAH/VPxiK6+UW3iYtd3s5sw4aFOUi2xJoLWgAt9rj99TDBUfoMu4Hxhf+yTEfH2jerKr6NhIZoCTY2TxDqGb6cFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722381646; c=relaxed/simple;
	bh=LZxzyKDhj6ONY/YDDRGa3J9/pKl7a/fn/RY1T0fk2qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHgaPtZFyuxg34dB8PZkCh1J1VyaMeE/i0YoPz2Rl0RdTDwPkDWlPSwiUEYx47v3X9pVujVjHQZY81s6ROYezK/ZaaxM/Amf7tnec5mA8+ZUC7woc4WiWI1cyiO0Y+F5MyZ7ZaTfuJDXkZ6YwRWSF9RMAt4XuKUELm0WDzMqKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6XVsbBX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6XVsbBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A15C32782;
	Tue, 30 Jul 2024 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722381645;
	bh=LZxzyKDhj6ONY/YDDRGa3J9/pKl7a/fn/RY1T0fk2qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6XVsbBXuUVziJQrvPS/YAVPT0FHFJ33mVqz8N6l/Irh40pviSsxm0yIaDlQ7hyGj
	 2oKwFD/pqTgj3xFqYACOhil72s1+9/XXFaoCwnvMsZ37q5pk/H6Xf77FyUM+b1z7kp
	 CczkobDRg7YGKfrMO6YO2xS8gPhIBRiFxmuZDFXwVTca+nBfKMXrN+KW+FGkigQhu2
	 92YJfNlbhGkSZYJLWbdFjoIPg49SpQd/l8GuZkPJZLAwudr8NyyNjr14rB+DV0gLXt
	 PlMRId/6spvqfeyxQdd0hkEasDZJtTHugyEUroC+IuDXBjQGvJG999fPMV3t0k7gHm
	 extDPL7Wd1Z8w==
Date: Wed, 31 Jul 2024 00:20:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
Message-ID: <c555e200-af4a-4b71-9e04-d03f3f10c8d7@sirena.org.uk>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
 <87plqw9no5.wl-tiwai@suse.de>
 <ZqfHC7IodobTlVT4@opensource.cirrus.com>
 <87ikwo9etj.wl-tiwai@suse.de>
 <ZqinleaAqikxdQGr@opensource.cirrus.com>
 <87ikwn3vqf.wl-tiwai@suse.de>
 <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
 <f7503750-d751-42e7-88de-061f6263e4b6@sirena.org.uk>
 <3615b393-64cc-4983-960a-44bd2b0773fe@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4UdLT9TaKlnEyW14"
Content-Disposition: inline
In-Reply-To: <3615b393-64cc-4983-960a-44bd2b0773fe@perex.cz>
X-Cookie: Don't SANFORIZE me!!


--4UdLT9TaKlnEyW14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 11:47:48PM +0200, Jaroslav Kysela wrote:
> On 30. 07. 24 16:44, Mark Brown wrote:

> > With some of these slower buses it's not immediately obvious that it's
> > worth the bother of caching - the overhead of doing the lookup is
> > negligable in the overall context of handling the interrupt.

> I don't buy that argument. We should always try to write an optimal code.
> Every CPU tick counts.

So do the bytes of memory you'd use caching the pointers!

--4UdLT9TaKlnEyW14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmapdUgACgkQJNaLcl1U
h9DpKAf/a93dyr8c3cLH7JS9qp4ZtRcWSyOlynUk+kAZ5MSYSn/yiMCbdYbGpzJe
7bXjzdfELc6RXiehuAKSJZOfq05MkZiFeFjVdg0+LJPRs5i4zFW/MVR5ruy4h0i9
n0W8GYX93dETszSaCu9poT9PpMqfGUWJ7kBzSdROjem4LWlYXQet/wtNbMWfQN5N
/TImlLaSQFowhrMwa2d+f+d4DtoblFLC18PEPNpIxJG3N68qJo3U7Yhc7HCzCgLN
sC1yO8qzqQKOu2dP22avasaXr09wPc4MM+RhxBaI9NNI10dNUHmgJhwDApa2b+sz
TnUv5detWKYprQBmv7gMz4b3iBGfXg==
=ECEs
-----END PGP SIGNATURE-----

--4UdLT9TaKlnEyW14--
