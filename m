Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653F215179
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840764; cv=none; b=SLF4G3coalqFmYCToB215tcl1V5qTkeEEpqdA548ze0PAjot+VGeGnEH64iEiFb3pmdwS3heZbP+le785Pid96JXtYPAmlcKusY4oNhRXHyTZ2tfpxfuUWKZ/Xh0HL41rBqWUIctNOJqBQQuIGoc2p+5BjwxeK7G/O4ZqVBOT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840764; c=relaxed/simple;
	bh=Ud93BPg7e+aYuD31vJgdHclRrPjLf4XpRGMBpEuxS1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxuM0qzlILm/AMkxfQnAGJ6d8XbwRRs8oJ+u4cXdV+p7dVd6Zt1W1IRH9kgeHGk3EIyJzNnVfi+n+v9M+CJ8lIr7spHfFGJtnYqzjBHXe+bEhXuHdrPjAurxsj+obdM7IlLMncdEq/Rd+85GdFo6RP2KGa8MiPNxbfd2mWM8NCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDT13mix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDT13mix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D683C4CEDD;
	Thu,  6 Feb 2025 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738840763;
	bh=Ud93BPg7e+aYuD31vJgdHclRrPjLf4XpRGMBpEuxS1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDT13mixBt/0NTe7MbR+fxthAftt+FjiiNe1aIYQHhNH3IYtZnMbYRWlCfdQZE5xO
	 5gLs1+Ztbv52WDLkE3g8WCOICN4fYkOYBp+OsWkgSq0Wk6yhZ96prpc0Vi0R89DGVS
	 aQin3yHebiey9XmGwnzL2AXIYKKdV2ODCX9iENY9w7pxUMqNY1gb8yKWeRmFaZpPG3
	 iRWEKY62oozy/FYUFeAuAeJCgck+0ojBV+Opwz95wbz1f5zoM6Y9509SplAcGpWZ3W
	 cSdxbrGOv/K7Rfd9gVu/bcRnREnb5ZmXFHvPIV11YL6ObQ7fyp80xTDokOoOGazd25
	 Zjo7sqndsKLjA==
Date: Thu, 6 Feb 2025 11:19:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: soc-core: remove verbose check from
 snd_soc_of_parse_tdm_slot()
Message-ID: <a12541bd-2cb2-4b2a-b913-f4cd44a4d3f4@sirena.org.uk>
References: <87o6zf3gg0.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fxnT4XegOxlipvom"
Content-Disposition: inline
In-Reply-To: <87o6zf3gg0.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: With your bare hands?!?


--fxnT4XegOxlipvom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 03:22:39AM +0000, Kuninori Morimoto wrote:
> The reason of of_property_read_u32() returns error are
>=20
> 	(A) -EINVAL:    if the property does not exist
> 	(B) -ENODATA:   if property does not have a value
> 	(C) -EOVERFLOW: if the property data isn't large enough
>=20
> Property does not exist (A) is not error in this function.
> So, current code returns error if (B) or (C) case.
>=20
> But these are handled by "DT checker". We don't need to check it in the
> code. Let's remove it

We're assuming that people actually run the validation tools, which the
reports that Rob sends out from his bot seem to indicate doesn't happen
reliably and I'd expect would be even less relaible with out of tree
DTs.

--fxnT4XegOxlipvom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmekmrcACgkQJNaLcl1U
h9CDPAf/cyNV4jc+8KZAgcSBHZNwl6vNBIFg7N2kvmD+TT/+llPsRBFGzBNtao1C
B4X1UcTZ3yXFBK6RnpQvnhsFLDa7LuND/mpaZ+P4p0f1XaY0IFl95G1IolPROAuq
O7weybi8YdHfWB5VbbmPxgfc1Nx0twFvfLhS74/1aVT1X3wu7orp0VzHpkHcI2IY
CsHAo+yZwNqLu9Hs8ON8uKwOrCNRWZNMnX/ByL746wqeb+MIypiqBRX9F9p8fBeg
tsHPouo1IhSXZT7RrSk0GisxeyZ0JDsftPrLoMJfEO9Qv0ml/QsWd2QFCO0oNKlm
bGHSW0O3hdOw3NpiJgAo3tXdpVwLbA==
=5qfr
-----END PGP SIGNATURE-----

--fxnT4XegOxlipvom--
