Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291941D122;
	Mon,  7 Sep 2026 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782928; cv=none; b=iQbk8IxEPnDtm2GGWT/Zf+HovTtkQ2eF7JauZAt1WFCtGFRgdS3+DgsBuYVe4/lmY9vskCf0z2REHGTD5pz7veGCsWC8id0/FnvADvVaZo72b/Kr5pp7iHDm1WEIiDnXdKFx5DNEnPNAZeAh3S9XWCsi1sOTU+HGFvBXX2Q9SII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782928; c=relaxed/simple;
	bh=biYw2wB0Py4pbHn2BhygOpvspdOcowmWtnaTlLrDGZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/E7o/rwqkyAQUWR4QysIMgdxOxLG9Fu2YVuHHoMXPiBgvy19JOp00MqS8jZgOdV3zNyz9Ak03ZMgcaxxJM/YG0+BvqtHfeW1OQOoFhL5oYQdfMc3ussof5tTUy2ssHD+NE5RsRQxS9PkO/fVrqSzv/EwjX1iZ1CKzV2jF6OxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPE6Gp0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPE6Gp0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040F21F00A3A;
	Mon,  7 Sep 2026 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788782927;
	bh=biYw2wB0Py4pbHn2BhygOpvspdOcowmWtnaTlLrDGZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aPE6Gp0SESAgXCgga7cyGEzkDzsxkx1R3I8AVPrNBq5EF4CnCbb63VYFmdtb9B4kQ
	 2AZPg3jwlw+64KMA0YfSZ0TXi0MGW4INyx5sKmLXmqmabCBZpRypX5sbivIGvvp34f
	 UMmbNFV+DqrOETi7C/oaRNoMeqDMauBxab6PG/6/DqBlqSo3pgy2VJFbFP4MthPQcM
	 V9M7OtJj0yLh1LkKnjEwRW3E55L9KO7t9VcpMvHmPcSaT+09NL3K8PkGg2mp06ABUh
	 jSA45ZJt0b6z7ws/5bScBODYwiXqvkF5iGx//tzsFTibKPAyoLcV2clShzapit1wKQ
	 53KMWJLVCbCzg==
Date: Mon, 7 Sep 2026 13:08:42 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v2 1/2] ASoC: codecs: nau8360: Set DAC path to bypass
 mode when DSP firmware load fails
Message-ID: <b74f633e-85f3-4ced-af78-82e664cb91ba@sirena.org.uk>
References: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
 <20260904060035.196399-2-YLCHANG2@nuvoton.com>
 <apsEO6K6Qo1ADH-y@sirena.co.uk>
 <a5a983de-44f2-45ed-9a71-0839f5349d46@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G9WZqs0xGJIBruP9"
Content-Disposition: inline
In-Reply-To: <a5a983de-44f2-45ed-9a71-0839f5349d46@gmail.com>
X-Cookie: Who's on first?


--G9WZqs0xGJIBruP9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 11:45:10AM +0800, YLCHANG2 wrote:

> Thank you for your review and suggestion.
> I will remove the register update (NAU8360_DAC_SEL_BYP) during firmware
> loading.
> Instead, I will add the following check in nau8360_dac_mux_put_enum() to
> warn the user and block the path switch
> if the DSP firmware is not ready:

That seems like a sensible approach.

--G9WZqs0xGJIBruP9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqeqUkACgkQJNaLcl1U
h9AfTwf/X356fqC0l1bdCY6UN7dCumPayT9K90eYSBlWUAHxLhL6AHuZJsYK4e/f
JLiRqT5iUe1yo3F0uHep04BV4ohQzK0pIfawAWKTN49sUninu+PqkKngtIPylHVg
/6cw9mgQxaTutRCNXfnqK+O+X8EeKej4ZGRXCocTZccFNZ6G+5kZNayUe4U2vuWg
14PUjKy/+9ibOG1anCId4vlz5fGxjBOsQpMGdpoEYczOsgU1N9DJxofoPikkkePV
l/CvQNoRNAmzP8H6Uecvgl/eGnXnixosIHRUMbowuzgyuTCh51fVqKZVLGq6yufm
kqjlpQRUGzLzDc8TC8eRvPW2ycjt2g==
=a+nT
-----END PGP SIGNATURE-----

--G9WZqs0xGJIBruP9--
