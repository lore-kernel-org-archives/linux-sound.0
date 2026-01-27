Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A8A3624B8;
	Tue, 27 Jan 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533226; cv=pass; b=I05pt3T2mrs7E21XvufSuFc4inJWjf4F0L7+uVnpQUXp8JAatR2dMqQHiHIbURZwMS2/33pL5kD3OdtTQJuUHjNcVjjV78Q/XX9poVYFQlR5LMZB3yyFX0blw58bmHiJo6Rf3F36bUtYOxatbtpL97XcoCqVOzCNwNFzDEE5Wuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533226; c=relaxed/simple;
	bh=WexaDWE+AgKQI9yAuhcGjDzC3JDQQLm2WA9/v+0QF0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiOg/AvrRQ/Qr6Mwe1UGoMbHXfPAjYXeloI+7skWoSBE6z2+vS1a6fXVBMvD0pXR52AKkr/1ArBlN1ob1PuMzZN4f+4GeqNKvbcoVoFHdxe7B5cAa28YdRV7L6F/YkSdQ8csa9JcXPv4neGPNM3UKr8oJcWf/N5d/S3r5U8zAEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=AcPnDwIs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="AcPnDwIs"
ARC-Seal: i=1; a=rsa-sha256; t=1769533198; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IvYTHi7s+e4M/AXPy86LDlyem7lHx3ZcV/ZDGPkb+JfIx0B/ireZWvcaK0TH8CvvCNR6sJpfhKnrTyLAgv+xRS92MbrZzHed2D0OceR1Q5HGNxoJlqCFDA1/QaMIJX6kcKdr+T5O+dY3qRdDjqW3OZM1PZbMvPXnae77DrOAp2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769533198; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k/JszvMiIiD7raLAHEMZbMvUPwemPiehQnGnEHCgw6w=; 
	b=HqAeofXH8cfRubZnMaastkCiKGKaPVv/yC55+S921YD7ApdyN1gEKzcArAybxmNE5eip0JnSBOJ21Qb7NcI//BXx8lLQfx3hxLoQv2FjmWeV9ML2uD0ahpDfTbROfyhex4tP7hicJma+LbGdySCn79j7OQ7zydTzISb86qiy/LQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769533198;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=k/JszvMiIiD7raLAHEMZbMvUPwemPiehQnGnEHCgw6w=;
	b=AcPnDwIsmdn/qO1kNSQAAYVCg4uVtwGVGDypsbUC+6kBv6T18kUs8t3nykATSHRl
	OR47GP6E61ba32Xtu9Y+Vdsmi79vniQFiy0fLYpnBufwoeA9WIaR0EiA5lXQeFvDFY4
	Np7b8OVgulFv3ocxOQzmcU/DlBwL/47cA+Ydfk4I=
Received: by mx.zohomail.com with SMTPS id 1769533196286377.2516394328777;
	Tue, 27 Jan 2026 08:59:56 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 33D751807C4; Tue, 27 Jan 2026 17:59:51 +0100 (CET)
Date: Tue, 27 Jan 2026 17:59:51 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Alexey Charkov <alchark@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
Message-ID: <aXjukfMRRIADB1mc@venus>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
 <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-5-a7c547072bbb@collabora.com>
 <0d7af11f-497f-4c12-b439-41c30f10e087@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbyqyy2ee62cusqp"
Content-Disposition: inline
In-Reply-To: <0d7af11f-497f-4c12-b439-41c30f10e087@sirena.org.uk>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/269.526.30
X-ZohoMailClient: External


--zbyqyy2ee62cusqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
MIME-Version: 1.0

Hi,

On Tue, Jan 27, 2026 at 04:28:30PM +0000, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 05:08:25PM +0100, Sebastian Reichel wrote:
>=20
> > The hardware supports all typical sample rates from 8000 - 19200.
>=20
> All sample rates up to 19.2kHz!  :P

Indeed; I will wait for more feedback before sending a fix.

Thanks,

-- Sebastian

--zbyqyy2ee62cusqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAml47v8ACgkQ2O7X88g7
+poTbw/8D/tapoNf7C5G3rC2p0//Eew5HzP1yRcHa280Xpkqo5+alpMJcBvsCKi1
J9C1tANe371RNE3f6A0mLEBDLA5sY8130QnGRYLO7FLw6i0A8v2xUcS4LQowoAWg
ryIesztFaNnCfdZdki1siDiNG1wMF+4RkeU/CvcohKq0DJaUiGrfv01Emz2G3M6C
WUY0W+F7WywxWIQLv2edjp0daCuivmlbzZ/ubgJUlK71Pb9aaUcNuT/ZcXgSlP3O
iXPkYU0PQCIq+7Azt8F3VMRRhA2mCj/MMzJ5TUmpaKcDEWAUMc1TFXw3LzZzIGzm
HERQrOjUBR2J9WIubR9j3d8j5E5EtTDZyFga4e3qG2zzTode7kWNz3nIyZTADOvL
5Xs7gKX7P6qtsuGgyEABiNvjU+1weDob2oMvjP6eY93cuW/LNukh7Zj6TLzN2Wsz
pNcbabRzVZ76kznnGMbob+uZG9tJ69VCZzLaBd39nXKQs8NYf60PGquJAZtQ/4G+
5oumY5QIFcqW0AZbQMP23bmZf2nAHGmIqOiS3416Uz/UyCB6MwRH6Wx4M57xDzsh
T+9s5CDapfkoTzhxuwIcxk3kUY/MgkH6x1Xe7aJWo4rPo++dq2oaqzW2AjzNhc1Z
PwCsDd9opc52VTaKXNJn4PI1/xpMwzXYoIAECl83Vv7FdUvJnsM=
=8OX+
-----END PGP SIGNATURE-----

--zbyqyy2ee62cusqp--
