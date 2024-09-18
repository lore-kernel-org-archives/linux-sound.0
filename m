Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8417C991
	for <linux-sound@vger.kernel.org>; Wed, 18 Sep 2024 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726649689; cv=none; b=sKam9XSbpPQUu4s0IwdXcnjZkVulDgEg+vpJl0DCzaAYuu8lFBjGbpe3MqScIOXHK95EYIO9cQkztwwIWw7+KKs4PSOe4mFuShZ5Dad86oGdJd5A9vI+wbA/l+6AypqRV/AsyBuLA7l5ErzgBcHNEqD74D6odsYrC0HbFU2Z0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726649689; c=relaxed/simple;
	bh=zyEnzj1tJy50MjXs/BX4sDEEp/zc78dFEsSJALHRsp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7mNaA8PHWyIm8EjZGVU8P1yXPXq4FgkMbZVZxSl5CccTEVc5uJAyThV70B48GBWDeKAS45CO5Ag+Eme7EQ1lxIKxR9UtgUnxU3+thNVP+3CzELiKeaXS2h50iZTNegRzKKAK7W8gtrXcaf7Si4lHXiQgwWEhyuPoooB0Eoixu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aiz5e4zD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aiz5e4zD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBB0C4CECE;
	Wed, 18 Sep 2024 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726649688;
	bh=zyEnzj1tJy50MjXs/BX4sDEEp/zc78dFEsSJALHRsp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aiz5e4zDjdeu7c7GNOhWjpiGoM2aN9pIZuZPmNlFZQ8JkyC7P7etD9KpurNPX0W9p
	 5uqWpnQe50yBXVkKFDy7/b470U6zQkKqmbcM58OYD7cmNvViSl1VvERn5m3Z8jxOuN
	 unMnWRXKRk+tn5DCVYMSuRp2BXPkQt5XIQZ36DAoy1I+xxZpQzz4/mJ+6fQeMaSNuo
	 AKuf4PdPU9/5oatwqx1VoXcsmvu7tCgt/S64ZXC5gxDRFYU6nlcffp/jhycYHjQmn7
	 56TsxpuB6vrH2PNOchJ3Edyvy5J49+ZQH0ESiwY+TOy1Urt6P7AX2WbJHxDAMmG0BL
	 w1sIH613naWKw==
Date: Wed, 18 Sep 2024 10:54:44 +0200
From: Mark Brown <broonie@kernel.org>
To: David Lawrence Glanzman <davidglanzman@yahoo.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
Message-ID: <ZuqVVJJFPNbeurt7@finisterre.sirena.org.uk>
References: <229243264.8919425.1726551100908@mail.yahoo.com>
 <ce69045a10eb78066a12f142768257d87761669e.camel@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B0lRzSwXFKkJ2FX/"
Content-Disposition: inline
In-Reply-To: <ce69045a10eb78066a12f142768257d87761669e.camel@yahoo.com>
X-Cookie: Stay together, drag each other down.


--B0lRzSwXFKkJ2FX/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 11:40:30AM -0400, David Lawrence Glanzman wrote:
> Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop
>=20
> Signed-off-by: David Lawrence Glanzman <davidglanzman@yahoo.com>

This still doesn't apply:

Applying: ASoC: amd: yc: Add quirk for HP Dragonfly pro one
error: git diff header lacks filename information when removing 1 leading p=
athname component (line 6)
Patch failed at 0001 ASoC: amd: yc: Add quirk for HP Dragonfly pro one
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-
> mach.c
> index 06349bf0b658..ace6328e91e3 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -444,6 +444,13 @@ static const struct dmi_system_id
> yc_acp_quirk_table[] =3D {

This has been word wrapped, not sure if there's other issues.

--B0lRzSwXFKkJ2FX/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbqlVMACgkQJNaLcl1U
h9COrAf/UgSOvagPiQCqTrbD1p9aTrEM3K0/e71/NryREmGNs69pGcqm2SQOTXe7
e32GrMFl6rf+g65P0F1Hpn4hivvEhfimfMAFcETnSsEwzdXStkLXAmBI5Qcydk5r
ghG8HwIySQEkkeBrBIPGk7F2NDSdNJzVrgN/uHPnSkai7/CpfqKElxMUKAyHGzjG
tGiQ+WyaZso7CjMrCUTkbDN59GTISTvSZy+ezeMIm3VWwnhqRrnQN7HLd9OgvPxx
pUdqziGC/xh5I5A20Vob3dLePttBy75qVsPdnkcOqUTiT5/lHo0Ns8JphjVr/xTv
KK/LAsEzWCvHBFygHcEGpw+VyemWVQ==
=+YZi
-----END PGP SIGNATURE-----

--B0lRzSwXFKkJ2FX/--
