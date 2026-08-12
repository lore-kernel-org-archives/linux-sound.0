Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31183EF0C2
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543494; cv=none; b=F8P/61rdXTphruU+a3EXdAtad4rrRyVmPYkaUO0qU/L/B+2tZbxYtGPE7f2nkrjdImDxNOf2zmoyR2TmB0tot2XZIkmShcDHGMPW5s8tJ/99/ivz3CpENj1wQbjqVg+vkENN2hYSXvPVEPWwVyEa5bZL7AaJFVOvdfEaYPkAhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543494; c=relaxed/simple;
	bh=G8YFoDj7q6dAbSPlvdPStcmNYkJzNj9dy1T0mfxuZoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJqK4q8xyPVJBLBreUELwLHCTAqY8X8q3EjDyTuukmjJcLKiSy/jfxZyIw/roHjiFpRn3+hgFXnzWy+cr3w+J1wDKeUIuj9L4Hrd+ViJvsDf/gH9TnB7a7Z/Xh7RgeTkJFPhazZvsk5yNAu79i8yB8zMHvdRNbGmcMxqj7P1eMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWei/vOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWei/vOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810761F000E9;
	Wed, 12 Aug 2026 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786543491;
	bh=G8YFoDj7q6dAbSPlvdPStcmNYkJzNj9dy1T0mfxuZoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWei/vOP5k4Hri+kSX8UbrRK4+jG36/uqx/uJSVpVUulaVJvXg6GJhG8OGF9BYugk
	 puWzzPdmcB1lqDWMkK++OhXiYSwm53Ks5AsM17mFkKebABPgIA9Kdmk/OSrSql/KZp
	 pETotHLA72ON/VvSfdRBHS7Q1wCAwR8XSMQb43V0i3eCrOEHMj5xtRcF35Pw0rInU/
	 155gOGGUwrMe6Iu7RCCvdViMSW65lN18ry37swtsQYRsL6UFQ01ag0hvLwklHJ4vdm
	 g7xcbiE8uvY+3THZaw3LKpPIOhIQQEh/ZsXJHuklckBuyEYN5zX7PBvvAt76seM66p
	 s+jbHUI2+4qbg==
Date: Wed, 12 Aug 2026 15:04:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 12/14] ASoC: Intel: avs: Drop __force cast
Message-ID: <096a0e20-c40b-4705-8c0f-ef4abbcaface@sirena.org.uk>
References: <20260812060557.80445-1-tiwai@suse.de>
 <20260812060557.80445-13-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IsTc3A6LC6R7TKeB"
Content-Disposition: inline
In-Reply-To: <20260812060557.80445-13-tiwai@suse.de>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--IsTc3A6LC6R7TKeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 08:04:44AM +0200, Takashi Iwai wrote:
> Now that the bitwise parameter definitions are gone for PCM
> parameters, we don't have to cast with ugly __force prefix.
> Simply drop a superfluous cast.

Acked-by: Mark Brown <broonie@kernel.org>

--IsTc3A6LC6R7TKeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8fX4ACgkQJNaLcl1U
h9C0Xgf+Na49w3zG4joQS6+CExdeMPQZVJ9LcVkGJjZKyq6k/puw7krHH5/E8XGQ
Qlv/tBlYbGD9zm7mMlO9oRm+C7A2AQJ6OQ51+rRqWwzWwb8fAOlZ/hJosqE71/1H
Hd0wESZajTT+tCAE4Xvq0MD6lnKiZnJiAQDur0uli51G+KploOaJegUtlsIZXOgI
BkHuiagP9jlWST6JXA6Wz5Ph3XFpoULjPPw9hx8Yk4yOTmBS0KUJvOuJHwmKK4wx
gAdBK5V6T6Y0heeqVM2R8trJppB3reefSXkbcFlnckBNOHqQ1AE/aqyTVtzmJn8b
/bSRXa27CcD7610349Sz40uCRadbNg==
=fymz
-----END PGP SIGNATURE-----

--IsTc3A6LC6R7TKeB--
