Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AC3A6B8E
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519205; cv=none; b=X4H7pLlS/v7BauXJq8qbIC8iwRP+Ewn1OncN7i/TY0b3bigI/PCOcRK9+gkqyAEMx3bbfw0x0IRUsLN3ed+Wv25re+6iKk3CuT8M2C8daNHNCu95EoxBa8P1Srfh/YdbLHLcCP6BMo3wpKnBuMaqETFOJbiaYqWOeeW089+WyXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519205; c=relaxed/simple;
	bh=+zzLtHCyZ71YS9DpwgnAZ5vbTSrb+9acQ/ZyXLsxFdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiMciLQFAgIPvXkNC/lU0SMM8jATTyRwHpJtaPAl7KCCVxuk1cw/tzsdgIWbluLtAdIFUba5TeocmT2/bBeYzJ+DG9i+nPV59ObEtmyV+5o/BH48u9fNBiE4kflilSSVJb3Mo59XrsndIN+Jdai42zOZhLraDf1SypCna41x8fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEjcMzGZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEjcMzGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD621F00A3D;
	Fri,  4 Sep 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519198;
	bh=JcqutnxbFt5vEzUdItOR2kf92XE17K1Y+Cjl1Z0Mlx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XEjcMzGZDKaLOWN6K/Tjz5S0weocYUg2ZH+LyQmvCUGKLAIq1gfhWI3jQnwJAM8pQ
	 5Rv/XRuvPtg/qZIY98xl7wPewYJiT4EEVsO8QNOqKIzAg7tmhBgmJMF9sHJIVyTONs
	 dKetnQ4zsqXjohiXLqlKyZsFhyHdSRemPnCOp3bwqXVFNIF2QTBEhBjzNnWA9OCh9y
	 /rxZ+dF+gm5HzadmhT6MP8+SUzwDlLQnt/e2ePmCqIulb0LnsEcdYY72XPQ3f51ozc
	 +I1oQOxy/uLYsiCR7ByX7jxvl0113hQhqWgEJk6w3v06gwsT/auvxinAJYZZbpTcxv
	 74+EDVhe2DVRA==
Date: Fri, 4 Sep 2026 11:53:13 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH v2 1/6] ASoC: rt766: fix uninitialized stream_config->type
Message-ID: <605813ee-72e2-4fbb-b665-202a118059ab@sirena.org.uk>
References: <20260904075737.86525-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1EZLVYfSdAJcaCHI"
Content-Disposition: inline
In-Reply-To: <20260904075737.86525-1-shumingf@realtek.com>
X-Cookie: A is for Apple.


--1EZLVYfSdAJcaCHI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 03:57:37PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> The stream_config variable was not initialized before being passed to
> sdw_stream_add_slave().
> This may cause unexpected behavior when configuring the SoundWire stream.

Not related to this patch specifically but I notice that whenever you
send a patch series you send a bunch of individual messages which don't
end up threaded with each other, this causes issues for tooling so it'd
be good if you could get threading working.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html

this will thread things in the expected manner.

--1EZLVYfSdAJcaCHI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqaoxkACgkQJNaLcl1U
h9CF4Qf7Belu4VVH16OVlnOGnZUL0Ux50lr2YzxRTLawjk0o+PDxz3mIPGAyyXS7
k85zuscJ3YbOn2sfGveBz+zplYujAXdi2d3o9XbfYZRtUfcojVyCYjY8nwA+1Pf9
/vkQ+LG3LWljq7gp7pZocB2ZQDt3XYEXJo/aSxVUlQ/rPDV9hrgSH+BymO5mMjHN
DJ7K0sMX3m3WvwWKvQEs1Cy3iCkfk7ozoWXR0bBV0rSJc97qrgbWUyXNK3hNLpOb
tmqte3UrnWVothoOEMSAo0e89jLAzOoJaFMNyszKZRSmq1cVJbweEazONBMisO4c
DGqHTiqhf9wBSKTDfJyJ3UGnO44cMw==
=JwaS
-----END PGP SIGNATURE-----

--1EZLVYfSdAJcaCHI--
