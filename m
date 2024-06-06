Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D717E443
	for <linux-sound@vger.kernel.org>; Thu,  6 Jun 2024 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717672175; cv=none; b=fGIAIVpnrX+CAy8L046yAaJICnHPnru/nYuQzIZT7QexmTAA9OXzocOcqqwbJ72xSOX2rv/kG7GUoHl7vop3ZF70yGrDK1DxWbnK5SYvWMXialniMgsonD9s8o/34RVKfMYTclfjYtGO/wesBJAK7RKQySMkEQP7yRYSWK8BJoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717672175; c=relaxed/simple;
	bh=//og06QxQGR3thdssDwa2YdAd3ko+6WtkRiWT8D2KxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc/SH30QpSGAbcTvRwNpQ54cpDdmCUsM9Vbx3jd+5le/TD2k4d9Fp02gXbl8c55N6koqpiUjf+OZHg6Lvh+Oh8Mn41MImufrI9pfEbnYDDQTVAtBYQtUQKHPPDLShwvH3OAqG5qFIU2Y5nGZG+J1m47mi2vbjD5AC8Q0XlzFFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ck5WfC01; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ck5WfC01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB24C2BD10;
	Thu,  6 Jun 2024 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717672175;
	bh=//og06QxQGR3thdssDwa2YdAd3ko+6WtkRiWT8D2KxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ck5WfC01C/H6b0csJpelUMGmDIoIsiZYOV/TJ7yGDkqM+qzjU3t2x0Pz0l6mscWjI
	 FDyPu1jgFw9v5RywxsEg9rSBzXWGEzJ7gi8bKGf9L94E+XiRdVZfsXaPjWMjvtaDkh
	 Fdq/fDuCM6JKwBWMXr41xx7zlfJ+ij2Q0vrRmpGLGYjrC1F1fNyf4+9SosC8LJi5HV
	 qIHE4qDmm3sYzTrS7ZA1yVbNxptnyWtFuyKr/IP7FIYOKBkuy4wVC0b11tHRFVrLrs
	 Sd+EECYFBTCqDu8AON579jGy+GGtfTqDLa+j2wHUt8hVzcu+00xiQt7eik0oef8ovX
	 cZ6x0/hT14PoA==
Date: Thu, 6 Jun 2024 12:09:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: About snd_soc_dai_set_fmt()
Message-ID: <a9b8ba84-3f10-42e2-83e4-2c8549bb43d3@sirena.org.uk>
References: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
 <1f5a24da-547a-4faf-b1a2-34982f1f7cf0@sirena.org.uk>
 <CAA+D8APemxqMXdDsS5JVbWXfZPRPF8=eobw33WEhchF418TLPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fotxi4mGlpkxYHiq"
Content-Disposition: inline
In-Reply-To: <CAA+D8APemxqMXdDsS5JVbWXfZPRPF8=eobw33WEhchF418TLPw@mail.gmail.com>
X-Cookie: Simulated picture.


--fotxi4mGlpkxYHiq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 06:55:29PM +0800, Shengjiu Wang wrote:
> On Wed, Jun 5, 2024 at 7:40=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > Do you have an example of such a use case?  If you can do that it feels
> > more like one end has two single direction DAIs (ISTR some of the
> > Freescale platforms were built like that?) and it might be better to do
> > that and make it easier to combine two DAIs.  That would also work for
> > things like combining dedicated DACs and ADCs.

> one of case is:
>=20
> +-------+                +-----------------+
> | SAI1  |   --TX-->  |                     |
> |           |   <--RX-- |                     |
> +-------+                |                     |
>                              | AUDIOMIX  |
> +-------+                |                     |
> | SAI2  |   --TX-->  |                    |
> +-------+                +----------------+

> AUDIOMIX mixes the output of SAI1 and SAI2,  AUDIOMIX's output
> is sent to SAI1.

So that's a DPCM case but hitting the DPCM scaling limits.  One of these
days someone will actually have a use case that generates enough pull to
get digital routing done...

> Use multi-DAI may be an option,  but for fsl_sai driver, in some cases it
> is used as single DAI.  So how to support single DAI and multi-DAI in one
> driver?  Should we define a new dts property to distinguish these two cas=
es
> in order to register different component + dai driver?

Some drivers have bodged it by adding 3 DAIs, one bidirectional and the
other two unidirectional and relying on users to DTRT.  Nothing is super
great there.

--fotxi4mGlpkxYHiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZhmOoACgkQJNaLcl1U
h9BA7gf/Q+g21CJfRvV0hDxUqNiGq9OcHoGERPc6k2nxV47n7NO79zo3wbudopHv
lX4vhSiaPxdfWFtZ6TJrVTPGzVcCLzJ/GpWQPI6rvObBcOyDC5FNUkUVoLiUFi/4
LVgZZn9WaU4scT/QZA8wIV7ye304+vsFQ9cOPUCTRRJ5hoXpUm/VTE9BcSSwdxrk
BMsmrqkEPCNRpLzD+VvUu3M4RQRfOHKgwQ91tXTGnJp/eEwmdC7rCZrvVdb18v4z
Wf0X4iyz+eT0eMWUTBwzOEeK1plxcSX4nppqMSjCQDsNnjXCRjEfHbaf0gr/OgXY
y/6xQOTY0WGYOwCdGRN0I5ZMrYPFkg==
=92Ba
-----END PGP SIGNATURE-----

--fotxi4mGlpkxYHiq--
