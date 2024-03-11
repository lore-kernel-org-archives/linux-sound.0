Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB15B446A2
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171657; cv=none; b=MQ6XktzhGYjFX0d/8MgdaSkRCPbf9EtxdgR0NEVMPRFTDzJZoCLAu+gclN4EJEE6UqbeE2RVoVBYGnULwqWKXHiwin67Q3e8wwlkoCwgex5yXqBGOoTC2YSA4Akk4+GnympLMZdWOKGtvm9WaD08fp1GVpWG/fsBDjBTnlmnt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171657; c=relaxed/simple;
	bh=ZmxJWUh1bAcrrHRRVHlSdkvnDgWju5IouKIMETq3cYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RobaqtiPGZ+1XBlVs2bKhL3htYMYZiNYEkkGuRauFyh/2wYHThUebWcGbbtZ0rO+dKUUoeB9pwNW6Wk6HTDJ5M+JUVOpp3mtfrHoJdGS/M/32m1e2BojHksq3/SIRrTgNXGzT7SYSFWiB/76K1llpa6YWnMTNV057oEl4ePwC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2ICL4xJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2ICL4xJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5B2C433F1;
	Mon, 11 Mar 2024 15:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710171657;
	bh=ZmxJWUh1bAcrrHRRVHlSdkvnDgWju5IouKIMETq3cYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2ICL4xJoS0IUyr22PCawrwaieB1lHAInzBr9cou7D0vxjJSEIK/GfVtTAZQHNA1H
	 GIZ4ShucwdVtHRLItc2fP+i9QnftBg+TEqiqCelOxdQAfTNfgpy3CmmRomxSTAQX/p
	 WEBg6YlPJLDdZRgd5iEOEGXflu1gc8pwcQnH+VIYYN+TkBkAcN7AAd//zm+C8VOgdf
	 NzVzoLpx1JUnXLBTtfQeriAw7TtG22aRB3MPBXEsLhWRN4PuNgZu4QRuyov1ZjixQM
	 pMCaBKmhARbDlT1eVwOMEhOp8NUxjzWvdEMMTNJqlZhqdPASjGe7TqlXTGqyz74bIG
	 BgoZpefKJeK9g==
Date: Mon, 11 Mar 2024 15:40:53 +0000
From: Mark Brown <broonie@kernel.org>
To: M Cooley <m.cooley.198@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE
Message-ID: <41397b36-cbbd-40b6-83c6-b047bd933d34@sirena.org.uk>
References: <CALijGzn7GL_tmdGZXy-tTGCgpT4bwLW2+QU1QBseMRQwjPhbtw@mail.gmail.com>
 <5eb9f2b5-62ef-442d-b93f-ea6b0d85eac3@sirena.org.uk>
 <CALijGznExWW4fujNWwMzmn_K=wo96sGzV_2VkT7NjvEUdkg7Gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewWmQLoixYssUBIm"
Content-Disposition: inline
In-Reply-To: <CALijGznExWW4fujNWwMzmn_K=wo96sGzV_2VkT7NjvEUdkg7Gw@mail.gmail.com>
X-Cookie: Sorry.  Nice try.


--ewWmQLoixYssUBIm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024 at 05:35:40PM -0500, M Cooley wrote:
> On Fri, Mar 8, 2024 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> > It's a patch whatever the reason for it - basically your email looks
> > like it got almost everything right (assuming git am likes it), you just
> > need to delete the process question above from the changelog and add a
> > Signed-off-by as covered in submitting-patches.rst.  As that covers
> > there's legal stuff with the signoff which means I shouldn't take a
> > patch without it.

You shouldn't include this quote here, just send the patch independently
as a new thread.

>                 }
>         },
> + {
> +         .driver_data =3D &acp6x_card,
> +         .matches =3D {
> +                 DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +                 DMI_MATCH(DMI_PRODUCT_NAME, "M7600RE"),
> +         }
> + },
>         {

This is mangled and won't apply, there's a level of identation missing
and it seems like tabs have been translated into spaces.

--ewWmQLoixYssUBIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXvJgQACgkQJNaLcl1U
h9BtAAf+Ll14uxF0hcV4eaH79P5glMDVYYJHp165fMONo5vZPBOKuaxoJPNov8fy
6P8XAlfSd6IppY73nxLBiYuh+K0SEr46bGp6TxverDNH8cILXkaYVHHB3TXVRzTI
7Pad65i1vxhpr+2AAIK3QIjEBuLbhnrfSin65+uO2D8Z9wRFUqPW/HkDy1IkdzPR
xWN/BRxuSjKh+I/3xqQSNno1kOhTrGobMVe9SnX9zOCObtui506jx4aoKifAfCMq
HerFWJwe6dDKJGcNP/vGBpGjQM59Psq5XgSuFWD+HcWvt1S4jS9WdlkNyge0L9CN
7b4fDMZIPDScNVbCvcS3aMfE6mvb2g==
=ioFM
-----END PGP SIGNATURE-----

--ewWmQLoixYssUBIm--
