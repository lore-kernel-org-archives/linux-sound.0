Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17AFDF76
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778417832; cv=none; b=ZggayJQ7eGpNwgC9Simw2i0GAn+Q8XhBb1G/PLusdFu9ECKrc7pxr+mpkaR+AH3FpUQ1Lwpkh25giC8tgMmRUJH9O8epe6wOQaaQp6a6c7SUzovzRH7kHCX9ZBua+2KqSjm8MS2Q16IxL6ToLTTseWCYi/fbEYRehK8/DBi01pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778417832; c=relaxed/simple;
	bh=+NS+mXELE481716R2xNZldzsT5uuYWBaGG4XaPtkZB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0CcBrdSSFom8D1NILet40Swkz7OdKc9NDqAE/AnHMYpJKwXfW7LxtLIaPjKlrndqy1pK0tGdDILRgGlmJZvBX3HY9NjCW8DtHpXObvl+SdsDezI9gGW6CSJPByGIcfdaye0C2RghdJCIyPQGsxIA4ZrLU8rZlECZx1AYW1OPKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X35Jy1xx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X35Jy1xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A9FC2BCB8;
	Sun, 10 May 2026 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778417832;
	bh=+NS+mXELE481716R2xNZldzsT5uuYWBaGG4XaPtkZB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X35Jy1xxwjZiXNL2+9B0ZW8989OIFO/yghiQR4xC/S83dLejud6EqKzTkvhnt6562
	 U37bcycl+TgDrMaDcjA2JYEkgT7lEvZZBrr1Vv/6RrvHPx0dWqVbHw7oCj0VMOqG4A
	 AyxP8ybpUyKxZpj+1vxN/13O8irYjkClKU29gcrFSrlQurtLJJcRIarkzkpmfTpKOW
	 O5mHBRPNthwy1CTZFiL224RdpbG1s2eSiIlT2gUcGunf8BpP+HwQtnS+QILuXs5o7U
	 j5Tb2nGAStnXgNaZgFZxceRHqneDy2yOtoaTrUMwXFvxkvShZhuYvsDzYZFP+2gEsx
	 zukpylrY8x7pA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0F0A61AC5898; Sun, 10 May 2026 13:57:10 +0100 (BST)
Date: Sun, 10 May 2026 21:57:09 +0900
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to
 use the DT
Message-ID: <agCApXl_RwG3r2iu@sirena.co.uk>
References: <20260509214622.38319-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="moTdlZ1qRYHiIRf6"
Content-Disposition: inline
In-Reply-To: <20260509214622.38319-1-enelsonmoore@gmail.com>
X-Cookie: Truckers welcome.


--moTdlZ1qRYHiIRf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 02:46:19PM -0700, Ethan Nelson-Moore wrote:

> index 6be074ea0b3f..2e6abd620571 100644
> --- a/sound/soc/fsl/eukrea-tlv320.c
> +++ b/sound/soc/fsl/eukrea-tlv320.c
> @@ -142,7 +142,7 @@ static int eukrea_tlv320_probe(struct platform_device=
 *pdev)
>  		eukrea_tlv320.name =3D "cpuimx-audio";
>  	}
> =20
> -	if (machine_is_eukrea_cpuimx27() ||
> +	if (of_machine_is_compatible("eukrea,cpuimx27") ||

This renders the inclusion of asm/mach-types.h redundant.

--moTdlZ1qRYHiIRf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAgKUACgkQJNaLcl1U
h9Ax4AgAgv6+tIbDDD8stQVUf7j6gAchwIieJhA6JxS0eCb4ecn1MK83Uf1bfuVn
7sqL965uvAq/aC1lxo3VG7m/gAWRlVaDv+7OioA9JUxssJ6IERpte+/TKNNDYhrH
3MBFObS+EuAwYX0VZFT9jJ08x8TJp3PFjBflqDhLj0aRGZxymNa9o1KQH3IVeyMe
FydtycOaC+WnXh5Nnb7DpAZF2NiKsmvtJwgMKXLtjP60hHA14Sv6xyzZhbltaPh5
BatDdFzgOBY+0EmOG0O0e8vnfv483HCZyfx6ddv7RHpTYSA1mtPpsqVpCtSJ0Far
F3oXuc1b+nDm5G2SL5WXYxFkOVM6Ig==
=l4qE
-----END PGP SIGNATURE-----

--moTdlZ1qRYHiIRf6--
