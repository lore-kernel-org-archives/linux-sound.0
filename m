Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474A568522;
	Tue,  8 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874318; cv=none; b=rn2CuMb+r4E5VMBV7ji+fRSBsYtPPAIjwcTlVRukXf3hzGMYf0GB7B98tp3VH/IOQU2OaQBMbVi9do7V9VzFQsyTnRElMQ3B81s0DuNQdgf6fSFnw/fBY6D0PWY/UeoPpW7lbcnA+wQk1Ea0DDBrI7RSGrT/uW7gqcnUatXn8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874318; c=relaxed/simple;
	bh=cyG+sSh237EOVnuMFkTK1wpwDyjge8f0jycj9+sSLWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pze4tx2PCqqSEfV0fa5Epd1uTi3JuiqP7EpwTMJmh3sDYhlGQOk69FKhIYUglMO9nBFVpRoAonwyk2lAv8rXmaa9kpUjQKGV9xpIZOJeRj+4weMxMp7LGiG9fiXTonTvgsOvqtbo2kyH30nyElGmL1nQYpjTnndH0EpDeF0YXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNWapE1f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNWapE1f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDDD1F00A3E;
	Tue,  8 Sep 2026 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788874288;
	bh=MJB6EV6B8H1QkWSKyg6bAxo/dFbrWzrSiPC8c5mTVQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dNWapE1fIJQeVp0KKq5Ybi4QjYRKAreXIP/TfSlvMMabSgKtyXMBU2jj924WySLpH
	 P6GvTI/55RckumCUCJTyvFIe9+MOfxNwq2wH5oEAtcjQtnMVj8EPpj2ZE+2Z/soRlH
	 S9AT2sGejp2ChMJSTGVXjtUpDfEA1Ej0XbLqutajl7qcYwwqacaIowrLQ162ro7Xqr
	 BynkAyC6vFNzzhO3OGLKnzPl8FRPEthx85fs6qGvqixknvffMjGt3VX1ADoJt7UCYF
	 LrIV7xB4FkrDQzj2jAiUd9nvcZSj8PLoVbBFZyzGHDJz2AHNz/HkIl/T/5qA7Lt4Yw
	 MP8jT6KjNFYgA==
Date: Tue, 8 Sep 2026 14:31:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v3] ASoC: codecs: nau8360: Block DSP path selection when
 firmware load fails
Message-ID: <c068db2b-e21c-4891-847d-01a6a201e33e@sirena.org.uk>
References: <20260908030342.222655-1-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PzAFdN8Mc7izNR9I"
Content-Disposition: inline
In-Reply-To: <20260908030342.222655-1-YLCHANG2@nuvoton.com>
X-Cookie: The world is not octal despite DEC.


--PzAFdN8Mc7izNR9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 11:03:42AM +0800, Neo Chang wrote:
> Block the DSP path selection if the firmware fails to load to prevent
> invalid routing states.

> +++ b/sound/soc/codecs/nau8360.c
> @@ -719,6 +719,11 @@ static int nau8360_dac_mux_put_enum(struct snd_kcont=
rol *kcontrol,
>  		return ret;
>  	}
> =20
> +	if (item[0] =3D=3D NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
> +		dev_warn(nau8360->dev, "Cannot enable DSP: Firmware not ready or disab=
led\n");
> +		return ret;

ret is 0 at this point so this will look like success, you need to
return an error code (-EBUSY might be good).  I'd also use a _ratelimit
print here to avoid spamming the logs.

--PzAFdN8Mc7izNR9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgDiMACgkQJNaLcl1U
h9CkJwf/el48DUA/0/pug6z/kykTBH6+ujIZlS2GWiEt64HCfjfu8RsIqRbILDpp
Kcac061HmF8BE77McbqVO0RdR3ce2RMEmpxlarJKAyKqt25EIEITsBffEPasAPCc
HXZ/CRGEtsEf38ged0aTU4rJm0Hhk1s64S20MzuNWkhzeDv4VAbxRVxJQJCEUTOz
2ehKtTyJoeYJVWiqnnc6vVqhcEQ48qBKGuVuHoLc8NpPqbdEs4z20tGWWhj9m8ug
Xik9ujRG7tMPY/oLQML8LjObe9gxP2CNnMZjYpHrkGES9XTcXDFhCmHB6k4PD9C1
6/vAgi8dZAgzmTpqglUJem2B8+p4Dw==
=JCPF
-----END PGP SIGNATURE-----

--PzAFdN8Mc7izNR9I--
