Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A791D63DF
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733487784; cv=none; b=V4lxFHIyu65dicUSBQPfawsKtVoXo9+T7Rj6ongkzeMOOn59PFgON5vHpxjVkTDPDLNJ8avgU9f7nYwNVNTphL8fOO43V8nwK8CULJ1VNqscpYx4cNTeZlggtVtrLLIEY48k25q3wijtrgJgHK2rltO6TXxMHfZhVxStXNpNOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733487784; c=relaxed/simple;
	bh=lfZyCMJBHc0E4Jf5MQXOt4/tCjXDyyPHtj1WY7KI0Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF1uaHXDe9sZ68Vl88lxrCEpVQnmF96W83T4Xwx0ZxpI7CqoEEBNKu1JCBuPHsqIRFFpunVnP/eo1awELrTJ9eNgXYppMiSEXtTUxRQs0e8+eS0qgeCe9pCk0yuXDzpAR14GBcKbpFrtuaSz3RmMT9Yz2nuJTF5soN5TxbnsYoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+38nhNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+38nhNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD32BC4CED1;
	Fri,  6 Dec 2024 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733487784;
	bh=lfZyCMJBHc0E4Jf5MQXOt4/tCjXDyyPHtj1WY7KI0Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+38nhNMvkxg/KAVZT2+IUZcXFG2GN6bly7H3wl1Xd105M3Kauu5CstiJZcNMEtt3
	 tBUPWln1npjQM1fDCib9UCAofsyTDctbI3logX+p66QIPbFhWkm8wkcy1CDcknM/aU
	 B/cmMiKA33qLSkGUdM2EM5X4LZttJBU2mDW3yXIpJrOP+W4XLi1nFGoY0fo47MUHfN
	 fXi2Th3vF2gDDBV/j/M+obt+SWYus/gQIHT7i8znGZewrw0XeG1lhyq7XtKMVYmz07
	 SpHWj7iM2LqlpHgrYkNfITK+PhGOtWhl8bkwBcL2f7ImdFv15LybjGFiis9kVN9cyi
	 AQFjantm5MPbQ==
Date: Fri, 6 Dec 2024 12:22:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
Message-ID: <cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
 <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QotOsj6kQwLvH2TK"
Content-Disposition: inline
In-Reply-To: <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
X-Cookie: Sales tax applies.


--QotOsj6kQwLvH2TK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 10:54:43PM +1100, Stephen Gordon wrote:

> Scenario is that DAC's clock pins are tied to ADC's clock pins, with
> codec acting as clock producer for the I2S bus, and the CPU has a single
> pair of I2S clock pins used for both playback and capture.

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ,-------------------
> ---------=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ------------| LRCK=A0=A0=A0=A0=
 DAC
> =A0=A0=A0=A0 LRCK|-------+--/=A0=A0=A0=A0 -------| BCK=A0=A0 (producer)=
=A0 C
> CPU=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 /=A0=A0=A0=A0=
=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O
> =A0=A0=A0=A0=A0 BCK|-------|---+--/=A0=A0=A0=A0=A0=A0=A0 | --------------=
--=A0 D
> consumer |=A0=A0=A0=A0=A0=A0 \=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 E
> ---------=A0=A0=A0=A0=A0=A0=A0=A0 ---------------| LRCK=A0=A0=A0=A0 ADC=
=A0=A0=A0=A0=A0 C
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 `-----------=
| BCK=A0=A0=A0 (consumer)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 `--------------------

> Both DAI links will have codec acting as a clock producer, but we need
>=20
> to configure the codec so that only one of ADC/DAC drives the lines.

This looks like something that should be done in the board
configuration, not hard coded in the CODEC driver.

> Add DT options to support this configuration. adc-force-cons/dac-force-co=
ns
>=20
> cause the corresponding component to be configured in consumer mode.

Any DT bindings should documented which should be done in a separate
patch.


> +=A0=A0=A0=A0=A0=A0 // Force clock consumer mode if needed
> +=A0=A0=A0=A0=A0=A0 if (pcm3168a->adc_fc && dai->id =3D=3D PCM3168A_DAI_A=
DC)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ms =3D 0;
> +=A0=A0=A0=A0=A0=A0 if (pcm3168a->dac_fc && dai->id =3D=3D PCM3168A_DAI_D=
AC)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ms =3D 0;

The clock consumer mode should just be configured via the standard
set_dai_fmt() operation.

> +=A0=A0=A0=A0=A0=A0 if (dev->of_node) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pcm3168a->adc_fc =3D of_prope=
rty_read_bool(dev->of_node,
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 "adc-force-cons");
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pcm3168a->dac_fc =3D of_prope=
rty_read_bool(dev->of_node,
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 "dac-force-cons");
> +=A0=A0=A0=A0=A0=A0 }

These properties are not documented, and you don't need to query to see
if there's an OF node to query if a property is present.

--QotOsj6kQwLvH2TK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdS7KIACgkQJNaLcl1U
h9DUJgf/b98tGb11g51ycBRYIzk/dCaOtTN3rHDaw1AAmhDcZT0BKZ88PRTTv+ih
2I9g3pQQwLlsGU7lHbtI/mbH8BjumD0RvbyaAFQ5qBPptQuHnUqr1p8HfihZeEDK
mNNUoSE2I4fCu0ymuLPMXyRaYGB089H3JxPb0PZwYFkTVyEZwdzbZ1PVZmQrn2N+
uw6VqjLe10hAfnvKZou1sMWxMrUrjW19NETfKTRa1Z12pOsMknnFgJq5f65MYjaf
YEaPgLlf/Cj/5Xfv5vhYbZRa5ShOVfzd0IMgcpxHOYp/RL5Oh4HKXkTa2YNeXw3m
Ss/gp3C4vHiM49rVOkj7Z2TGMUTxEw==
=UXoG
-----END PGP SIGNATURE-----

--QotOsj6kQwLvH2TK--
