Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B72517AA;
	Thu,  5 Mar 2026 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720706; cv=none; b=BiDFQQh78TLiCZ89zhdsL+1dobpbPCV+LDxzlaazGLke46jCWC3Ns5pIfu215YWb6fij4xWe8cfaVYNO7HSrBHrGW2/0JcV/CGKcBAt9HVE8uQLzdxnVQHDv3MHfYk8id3jDm1cQG2T5YoYw4lyW/OJH4HC0vLrhSjuFKt2tROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720706; c=relaxed/simple;
	bh=NCTQvhEXJwerBS/eA6+58u2aqcdSzQ91SON9U+rDKV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/IWzN4jru6HFB8a2n7VWg3pSsJq4SQbDp3Xj43GOBqkNct1JqKjOt8oYPCvnNYIWFf0+l7zm2rGkO0fkcZRrtU5dY70sjKSp0Cc8FjWU+CVir8pbwXdDILHB7jB9i6CDpd0v8qhR65sZS9ibfnwFT5xcfbgIQypXbm4+ydTVVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYRSHCXh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYRSHCXh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74731C116C6;
	Thu,  5 Mar 2026 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772720705;
	bh=NCTQvhEXJwerBS/eA6+58u2aqcdSzQ91SON9U+rDKV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYRSHCXhAywEBDmqGVbHlwSBT6LqNWwvta9/0xVtf6U1IABk5Jl8YsDVA1Lef5Zh2
	 iFzbYf9HASEfo7dNJFRQLrdCNj2BmnCOl3YpZYTGxPz6i5cxaYxfAHFp6+2yZjPgxx
	 B0098oCpfAeYphY2lmdJ2rmOw6ldSWR59ZC0e11JlY94OOpYeEGNFSm2IshE0t4TI0
	 dcgKFlbXu3r3ZKr3X6/GUQQ0vCCSTANcOW3C0j2YIhrxd9SxfdeVnu/ieqyWeOhw3c
	 jbBlUYVBdqR7e0Uvr+aY560AdwOMrZi4iKfNT97Q4I2tB9QgcMEwEdiSYDNM4MKt7U
	 ffmGl/OcCMyxA==
Date: Thu, 5 Mar 2026 14:25:01 +0000
From: Mark Brown <broonie@kernel.org>
To: El-Hadji TRAORE <elhadjiboubacartraore@gmail.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: acp6x-mach: add DMI quirk for MSI Bravo
 17 C7VE
Message-ID: <a3248ba0-8d26-4210-9d54-91e94bfe670c@sirena.org.uk>
References: <CAEk54sxKcSy0i8R8+khKoR1mP2k7QknvC_wF5hEF8K1ySRa4Qg@mail.gmail.com>
 <CAEk54syf-h8Vq6ZdhQjGHpADoqoo_nyZrAjLCD7MyG21B3-g6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ql8v/wAh8asKq2pn"
Content-Disposition: inline
In-Reply-To: <CAEk54syf-h8Vq6ZdhQjGHpADoqoo_nyZrAjLCD7MyG21B3-g6w@mail.gmail.com>
X-Cookie: Onward through the fog.


--ql8v/wAh8asKq2pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2026 at 07:07:27PM +0100, El-Hadji TRAORE wrote:
> v2:
> - send patch inline (no attachment)
> - fix indentation to match surrounding entries
> - add Signed-off-by

Changelogs should be after the ---.

> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -487,6 +487,13 @@
>   }
>   },
>   {
> + .driver_data = &acp6x_card,
> + .matches = {
> + DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
> + DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 C7VE"),

This is still very corrupted and hard for tools to work with.  I
recommend using b4 send for patch submission, it can take things
directly from git and use a web service to send the mail so you don't
have to worry about email configuration:

   https://b4.docs.kernel.org/en/latest/contributor/send.html

Hopefully that makes life easier.

--ql8v/wAh8asKq2pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpkjwACgkQJNaLcl1U
h9Buiwf8DozQ4aAA82Pp3cOv1vpK7EwF3fiQRfnWJznuf0G8E7dtp2ueWLbNo/3T
VtIq+Z1BKRszfNA+S2vDwDMKJyaEcWjjniqhIvBXggYO95BqYhsTmvtXrJWx1ao3
HkOEpkYD++t1fndY4VVwm7Fp4RUQixLJL3LOz2FhlZDZPDxIfj5CtBrFOjTshehe
qxRGcmc4R6ZXJBdSWS+BGebmIC5csgGiK8OxcfP0ZHzKkGQrlJ6rU/DNoUtJts5s
uszfRZ6J2MGIntvpjNZGxFgIx/cu39NptnwrEV96l6T8boqLsBYEKir9FmM02G3A
DHqygRlZ5wCJHdjPnxaTgmhzRH5H7A==
=eMYT
-----END PGP SIGNATURE-----

--ql8v/wAh8asKq2pn--
