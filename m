Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17830442118
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837602; cv=none; b=kee4YG3+yczmsulD2kzILr2s2NDZIbBfw585Qq4tIDeAGocwMgiu6ZQNoYNw8auFZtHeEiEyOii+PS6GTv3cOIzLL2Jri0QgXqhKKVqo6/+Hz3DEyL/U21/aMxs6989nxhd4QxskBAHbH2fT6UaF0mtSdM0B2CKu7ePIezIW2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837602; c=relaxed/simple;
	bh=LaQhNsK2UESgfQY8bwynw9UAgpj7qFnD/HtpQpzYPA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+eB8iWM0SWbVwKi5Du1QSyYlSI1pJbpN1Y1HRH2bpNOM7B0UmA05p11idUF/PFg/O66512GXAcaMsD2x+djhSoUuJoz6iJL2rXLvSA2kD6yt97Dg0D9jnZzlbljkrEdgxRXuxrkQ4GbusD0J64mCi8OTrX3gdCcO84X0bHAYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9jQQUt0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9jQQUt0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37E01F00A3A;
	Thu, 27 Aug 2026 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837589;
	bh=KUTw7WdNMoTAebyoxpTkQCVJJ9lm56dFPkXBwBX7t3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9jQQUt0cszfH3DUxPggezWy2N/n53Z6k2tqlhSxdtukaB1WPvH0MQeCZWYvd4/jo
	 X/IhwPkcm3BPE9InZLkvsBy3ayZe1Vm55dFYduiBPO8GM7QBZ2rAcldep9NzJbgGf7
	 +/ezu3gQLh3jQ7YpHKIMMiSvYIbokmFvygmcy0cpUyguXuMdq6TVagQXr/tTgTnv60
	 2WE0UT6/blvRSHPUwK56P8PnSbmvszkM0sUZAldsGUn26mjm02yBJG3Dhxa5NXWURK
	 7DO9fhoGtE2Hg3L8WG/OCpxy+/vCX8lhofS5CcQqRrgijAWNZTr5SJwm/Mz9oLjHDG
	 PuzpgwcsUfBtg==
Date: Thu, 27 Aug 2026 14:33:05 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt766: fix the warnings: unmet direct dependencies
 detected for SND_SOC_SDCA_HID
Message-ID: <8fe4e182-f177-41eb-a4d7-8d6ff7f36a7c@sirena.org.uk>
References: <20260827074155.3938361-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NlA2Zuq4EZDa9dOV"
Content-Disposition: inline
In-Reply-To: <20260827074155.3938361-1-shumingf@realtek.com>
X-Cookie: Alimony is the high cost of leaving.


--NlA2Zuq4EZDa9dOV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2026 at 03:41:55PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>

>  	depends on SND_SOC_SDCA
> +	depends on HID
>  	select SND_SOC_SDCA_HID

SND_SOC_SDCA_HID has:

	depends on HID=y || HID=SND_SOC_SDCA

The above isn't going to DTRT with SND_SOC_SDCA=y and HID=m

--NlA2Zuq4EZDa9dOV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQPJAACgkQJNaLcl1U
h9CIbgf8C4NTCKbyd3HL06q05vVRVdwr/N6ExssddcGmKz7Cs9qPr745XOYdOTdK
NakN4zZMAF/S7fRZZt6lfA4wjV1oT6lexdf862bD5KTZD3oqkKC0lOhu3tjg80lE
pJbho/RZFilEaIs1dvZDtq8Olaka64nNmACq+CkNyssspMvehU8zYjTaPEvxTzaH
Hz45zEENP7aApYVNBBvXd10UVRamhR1lSmEkkIQcVXOudJGa3BonkRJ21Z89jt5+
lX8TqhxVib9+PXAkUXMk4lxXfoRVltAHtsddDLBzCu5PNF9lmPdxc0D4TpH0J1VT
j1J5CaU5V2GssJOHUb9AptbPmi8Srg==
=Rn6A
-----END PGP SIGNATURE-----

--NlA2Zuq4EZDa9dOV--
