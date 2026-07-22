Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F6423A83;
	Wed, 22 Jul 2026 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750999; cv=none; b=Tgyntri3GapuHshRV5TMhZVVFBzLGMFRte4j46PBJSh0ZL7dsmAAphq56NyP4qOTb5sQ1vh/Mv7v8Ke0OMio/BGJIGWEbkAXlANuD+uJWJN01xmhoN/J5H93KwZxDgfCzrJ0cS3UTwIGnBIW81yIKI4z3nG/hjaEBdtzCRP0TME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750999; c=relaxed/simple;
	bh=8wGUtkpaa6l5ex8a6YuWiIPU+0+YiqWveT0toBcO+A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8Xu94StCE/8usdFfNXBDHtnXKDmHONlPU82b283dnYDD1dM5cwXHhaUoYsgbnJVW5yi9jHuA83YqPqFEhAr4ddEoHwUfTrjn87au8c+qjCwTmPCE7HLpMLCyR4ywUadFg2oA/Bq6q9huD9+7wIj5/QwsJM9LkUerWwdSkZ5dAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFu1b2Nj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFu1b2Nj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E34C1F00A3A;
	Wed, 22 Jul 2026 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784750995;
	bh=8wGUtkpaa6l5ex8a6YuWiIPU+0+YiqWveT0toBcO+A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BFu1b2Njd64ZPgpGvhopOx5JvktGgyu9Wgy/Oq4mhAcFbJlxmTXAIDSSTX54LmDCC
	 D1/ypYjUqztGcZtYeoIraazJ0hnwchI5L+ZOUbgzX7xw+jQN5PKK2M9QAvazF64ocD
	 KpKTEdig+KaYORPLJ8JY4CBtYA6SW0CdmsTQJCTot+Psu30QYTvaBvZqNFYcVq/hmL
	 dV6VhAjTospl1ksLuS59isbkZw4E163T1yuSagqU4HB5XynKKu0mjPRLSUQuisORKy
	 APk+8VMddwT2BwuZ625stGtYOMUmNtRzBPrL5S9rkY3n50OmdpnE7V3wqUYu7NnTMA
	 kB0JOKujdIUKQ==
Date: Wed, 22 Jul 2026 21:09:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Rob Herring <robh@kernel.org>,
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: sound: Convert TI OMAP2+ McBSP to DT schema
Message-ID: <96c3fbf6-cdcf-4454-ba40-dd8425356a2c@sirena.org.uk>
References: <20260722171654.298557-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MdROuNUDL1Dcdy5F"
Content-Disposition: inline
In-Reply-To: <20260722171654.298557-1-egbostina@gmail.com>
X-Cookie: Life is like an analogy.


--MdROuNUDL1Dcdy5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 05:16:54PM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP2+ McBSP (Multi-Channel Buffered
> Serial Port) bindings to DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--MdROuNUDL1Dcdy5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmphI40ACgkQJNaLcl1U
h9D4dQf/ZBRGzG3If1fxQ2R3rRkUEcoKums4VwrwkVrlILfapg9u13mTHdiwiTC8
9naYCSByyf5HdeN1WxlrS0DLwKYrUFTKee9oBGsEcjOa6Mqo3VCNAoS6PFKnebln
dL9StU7oyzQKZNsfyGRdoMPU7Bh/2W2DKCl5QPgn9oq6GNxMI+jAJT8m9zE3HKYI
RGdhWegEZfqTkrvi0FW0CSzmFrH2I2n/+v3R8hY9bGW2lcdyLRmEwJswDNen7MIM
eUvQMhjIGgMWOIMsv4TeAyiowWmlQrYdpnM+2pKPgQcnU0ZX2B77qneD838g6rK1
v7eEBtDCa773LE3XQDvUC5TTTQpJjA==
=+cTa
-----END PGP SIGNATURE-----

--MdROuNUDL1Dcdy5F--
