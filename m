Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C41F667E;
	Tue, 21 Jan 2025 17:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737481082; cv=none; b=Z4KABOKNPJEeyIx99VkXO5XLkzEIoWra2Z29+EkW6QxN7tkiijUmcIlbzG1V+/BngzoQBQSnTbLAtQHx4sQjCWRFp+35FhJBT4l0jpNTeQ3XbaUlcVN3xYfBR/MAw4HyV1ayCfsA/6Kx4SRf+3DTPmUwhznhJAdgb5MlHwGRWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737481082; c=relaxed/simple;
	bh=qxYcUeEcM4f/WwaTldAjO3e7nkHtWW2voiysZRTuWyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POV7/oWzN43ik3sqzOmIP+/hPDoo08EOBDhf6dp07+QPLSBGCOtj+bbpxBa3fEnIrHNkVE7+I7IQgkOenGgCH1UHvf5KlVwogjgzlb3enGf3l8r9EHngleLlherSkj7GPOPXFc2O/Wc1nprbby/fiuAl9bAsR4n51A3Rz8EVHs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiqjL346; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiqjL346"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C7DC4CEE8;
	Tue, 21 Jan 2025 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737481082;
	bh=qxYcUeEcM4f/WwaTldAjO3e7nkHtWW2voiysZRTuWyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiqjL3468L/rV/VZWgzE7fFNVBAVmWixEgFEJuO/qHnWZz3k4gsJuoEJ5jKlM0Nmk
	 5Lh4CPGnLppqeV3VxmOw3KGIfUtAGyiaUy2LGc/L9bIgsEQjvaPOo85ytwGEvSLwcR
	 kMsroyU5/dJ7glmsEddr0q5Uiz5tiuNOT3Ux4lMkZT6/wjB8Pq/j+YtggxAFBPG2EA
	 e6IQrHuiwYm7m2dmkipd/v8DUVpyIro7xQtpkcMkd7zPuux5Y0AViGthL3U+axMgT9
	 +raz44MfTfWjRn2d8urRnVgfJ7oGhupX403TL+DzTLbZAEhhl68hpU0K3nJeR2IrU0
	 5Oqp8/mF5j5OA==
Date: Tue, 21 Jan 2025 17:37:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for
 RK3588 SPDIF
Message-ID: <20250121-spruce-lushness-28295dd0c1ed@spud>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Eg+/63bRy/+Kd9J"
Content-Disposition: inline
In-Reply-To: <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>


--7Eg+/63bRy/+Kd9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 01:01:27PM +0400, Alexey Charkov wrote:
> Add a compatible string for SPDIF on RK3588, which is similar to the
> one on RK3568.
>=20
> Signed-off-by: Alexey Charkov <alchark@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7Eg+/63bRy/+Kd9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/bdQAKCRB4tDGHoIJi
0v6dAQCdiL5ocP5h6iXJYNUPS5M6hVgkmbV3X0Xq5KqJOTTDFgD/WlsZAd3l0r8A
u92LxGktYcLWsvIVxY2tyw5bxiafAQ0=
=MnTB
-----END PGP SIGNATURE-----

--7Eg+/63bRy/+Kd9J--
