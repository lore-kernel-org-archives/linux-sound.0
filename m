Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955BE3D98C;
	Wed,  6 Dec 2023 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSqiW3da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB5DC433C8;
	Wed,  6 Dec 2023 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701876797;
	bh=+KufnjekBs7k1dxBXkozFQMVh1787reUg2jquh7y+7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSqiW3da4w+WP6qB9fSQwv6ps3glT26uqr7NddyPkKUOFQZmtTSukxasj4WM2eSE3
	 jSf8yxmiPqNSrwrt6UeqykEDNGITsCRPD7PKF+sIrwPdQrBK5c18BnkD65sDikgBMX
	 Klgz0c0orSMD1jX9LvhS9Gs1PwFkIa3pvqlqti7Nhbd1ryImTmItegf3b4ElwpA9Tr
	 swTO6Di1H89xiJ8dbbg9EwJzqz1N1kaxx5r9t0T3qHzeLM9/i98F1YXz85h1UlLu6D
	 ej2jM6iY3yKwrktUhDefqxEUmthJzHbENgqh4JoV+E4cTHa/U+5tf8/f1FTxKN1q4G
	 zH6no+X+bG9hA==
Date: Wed, 6 Dec 2023 15:33:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	viorel.suman@nxp.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,xcvr: Adjust the number of
 interrupts
Message-ID: <20231206-favoring-ditto-3f8853272d21@spud>
References: <20231206113047.2240055-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a0plal+w/R74LBEf"
Content-Disposition: inline
In-Reply-To: <20231206113047.2240055-1-festevam@gmail.com>


--a0plal+w/R74LBEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 08:30:47AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> Unlike i.MX8MP, i.MX93 has two XCVR interrupts.
>=20
> Describe the two interrupts for the i.MX93 to fix the following
> dt-schema warning:
>=20
> imx93-11x11-evk.dtb: xcvr@42680000: interrupts: [[0, 203, 4], [0, 204, 4]=
] is too long
> 	from schema $id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--a0plal+w/R74LBEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXCUOAAKCRB4tDGHoIJi
0uvBAQDIzbUW3PUq2K4i05wGJEg30nDdjQqegsmLJVmOYi6hqAEArKwSI/Nu/t0O
e2tU1SPwsM2WHq1GLKi4zVJ7ynklCQA=
=zTu1
-----END PGP SIGNATURE-----

--a0plal+w/R74LBEf--
