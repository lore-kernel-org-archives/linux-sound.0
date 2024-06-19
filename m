Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B37F14373A;
	Wed, 19 Jun 2024 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718813730; cv=none; b=W9INtgdmVGbf4RvJpfCZE6VJ/LTJgrMHrg5pzvJCExePaLh2BigbPeh3fyKlWGGyhsbb+01G9oXhOxUN9xeZgbXI67jDI48g8ysBDXZYHmYbKqtpift5SHmyb2kQjW9gc9vfqn1IOKIJQZIIOuZE4pHGEMWNwmTiDxyeePDHLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718813730; c=relaxed/simple;
	bh=V/iKpVAWhGqqi/DaadaulhItRZsarpcbvMkh9hi2Vko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpF7lzs3htyEKzKWg9AFaPG27X/uahwAEhrILyWSaElB7d7bOastCkKk0ldyyeAC7FysFNBGaSFUF94KDZ5YasgBT0Fj7Pia7gKpHP6neSy5CwZExlymjhFT3UuiG1Zov20TFAlWgUg1+PczB0OmTh1pCUUaMF0jwbU5K7wYvJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZS+K9S2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZS+K9S2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA4BC32786;
	Wed, 19 Jun 2024 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718813729;
	bh=V/iKpVAWhGqqi/DaadaulhItRZsarpcbvMkh9hi2Vko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZS+K9S2TNlY6i/F2h1+DiasulkMrHELttdcpaLL7tFnH6HsN2a7G2A9k9TshSLP/
	 pUbGyaK+VJafJmo7XmSiFUQ7MawgCgKJ6Wcy9in/2pX6dRoNuibvkOJPI0GqF6hUM/
	 Lox34/VleUg9xn84H8ZsBru3kjTJvE/o65qn62nmMzx8yW5NCJwp5T6YAFJ55tzkjI
	 aAb24NvNJtXpV1dA1cQABDyNb3VXNfWWhTAK1LBaTLlSDfwzWfkWHWv2idFwS3YPVG
	 yeZOc+2Sp8aClAuMGSLtyvo9l2qysRekFk/O3wybXviq3Ex2AssAJ3mxHEdLxMm9Ds
	 dLB2oS8h+ODrQ==
Date: Wed, 19 Jun 2024 17:15:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: cs530x: Support for cs530x ADCs
Message-ID: <39628488-296a-498d-a942-e64c3d245190@sirena.org.uk>
References: <20240619145056.1379266-1-paulha@opensource.cirrus.com>
 <20240619145056.1379266-3-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FnoY3QRZRKw2m1kM"
Content-Disposition: inline
In-Reply-To: <20240619145056.1379266-3-paulha@opensource.cirrus.com>
X-Cookie: You are as I am with You.


--FnoY3QRZRKw2m1kM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 09:50:55AM -0500, Paul Handrigan wrote:
> Add support for the cs530x family of high performance
> ADCs.

This breaks an x86 allmodconfig build:

ERROR: modpost: missing MODULE_LICENSE() in sound/soc/codecs/snd-soc-cs530x-i2c.
o
make[3]: *** [/build/stage/linux/scripts/Makefile.modpost:145: Module.symvers] E
rror 1

--FnoY3QRZRKw2m1kM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZzBBsACgkQJNaLcl1U
h9CXQAf+K1dHyXqX+Vd8YqF2EIrT1piFkCbnoeTT7ZcDIzyRofSEiVsryDQ00k1S
MaaGhPOQmoGeRKiqYH5CmaQ9T4ncGU95LLF4mlcmRjGe8l45yZND4zqJplK9hxue
KCsPR8Ni0ZKFh3zXPAwjjaJXEFKTBiLdGW7J7k6q3u5mwG4GfEMOegwOuzRSikCy
mr6vxTceiiw8h1XdCVgChdcFXOPdGynhE7bVuqRAQJqF+AN2Qtl5avhjebOq1CX6
UX/GUf1Lq/iYpuVxL0MukGaCKYGW4T5pfMzSCveGDr/KkvJelT5Nt+oVgSnWHZ+W
gXuBhRqW5trStT0PCfdE4AzQRoE74Q==
=C2h2
-----END PGP SIGNATURE-----

--FnoY3QRZRKw2m1kM--
