Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD62DF132;
	Tue, 17 Mar 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768163; cv=pass; b=K/kP9eDRAOv9K9zUy5E/30Dxrfy/z0HP3g5oZPEOogooZT8vqhEasEiIoU+6zQsiZvPMbqzt8kPwagVlKbzK86+6W5sB0Ju26xj7WTBktWzF8STrTlJyEksTu3RwqNP6TQHroxzfNN98TeJFW+KeY4NQy6c7UHgWdK4OPI570mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768163; c=relaxed/simple;
	bh=csSww+WIybtBNldf33djiUaktagQrObOaKalU3CZA8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV/ElODoK/5sXYv7KJzIzlmVjNi823jVaGje56f+Jc9N4WLW4J8d/pQQPavfMGGNnoG9B3WN92kGMj9HzGwauC9k0rTWuWIPNLU10GhTtH5PUktTLw958q4f2OhGYXYbq+dJs+8IKLOvMpg+nwpePsA1a2ck3Nm5ehAWKKg6xeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=RcVe2aKd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="RcVe2aKd"
ARC-Seal: i=1; a=rsa-sha256; t=1773768141; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HPFcjpjFhaIdcBNwj7gmuEk50vuOsqPaTQ6rCVKuI/RROM22Ng1P2I2Ep8YXaK4AvamqMxOpV+P8btcO2pfbqV6jD00WoSIL1Y+GdIFWY9NvHn2YUoImWNvtafuV3ukDMZBhVLuCwWSonuKAEhVHqEXsqDW/ZjnhSN8UY5Hz0JU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773768141; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=csSww+WIybtBNldf33djiUaktagQrObOaKalU3CZA8k=; 
	b=BUCLmoZwQ2+LSfBX2hkBAYr887/eWL7DPoc5VEqkvbxA2NldzH9MWgNw2rSeHwn49uY0H0ZqoY/hKCCI1weGferJ6eHhNZa3UCrqXd6HTVNkefeLdEYVCzA6jRP4gK3+ogkmwrIzyT1v6e5lnP+M43WwSNze/mWgVg2PkSQx+Eg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773768141;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=csSww+WIybtBNldf33djiUaktagQrObOaKalU3CZA8k=;
	b=RcVe2aKdIYXcdGrxc3GQ/hFLkfmPl0xwq29Qj1m+xoVDJ1f0kezE0ZVAV/MxKYar
	2t9piYXgQOPrHnk7EyOMkGGya0Ct/wDKjUdmlRgTIU3rz0ZhUPy2sqzFFMDoNN//f5W
	C2yw4vyPhOIC2zrrLvbdO5fHXcxi57Bsb3n+vJeM=
Received: by mx.zohomail.com with SMTPS id 1773768138648743.3558401817487;
	Tue, 17 Mar 2026 10:22:18 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C4470180085; Tue, 17 Mar 2026 18:22:14 +0100 (CET)
Date: Tue, 17 Mar 2026 18:22:14 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for
 RK3576 SPDIF
Message-ID: <abmNLwjx4FJ5N_Px@venus>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
 <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
 <50e2f262-6fc8-429d-af0d-5f9d1a0d6ab0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gu3fveioy3pqqyrr"
Content-Disposition: inline
In-Reply-To: <50e2f262-6fc8-429d-af0d-5f9d1a0d6ab0@sirena.org.uk>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.758.55
X-ZohoMailClient: External


--gu3fveioy3pqqyrr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for
 RK3576 SPDIF
MIME-Version: 1.0

Hello Mark,

On Mon, Mar 16, 2026 at 07:44:45PM +0000, Mark Brown wrote:
> On Mon, Mar 16, 2026 at 07:23:00PM +0100, Sebastian Reichel wrote:
> > Add a compatible string for SPDIF on RK3576, which is similar to the
> > one on RK3568.
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Sorry, my fault. I used the same prefix as the one adding RK3588
support to the binding and forgot about the different preference for
sound DT bindings. I would have prepared a v2, but I see you already
picked it up.

Greetings,

-- Sebastian

--gu3fveioy3pqqyrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmm5jcYACgkQ2O7X88g7
+ppwyQ/8CCHnmOnwX5ap5MlSA3+bsCIwDhlkCQ4FXecT6EJQRYR9HlcBeaBOM73b
AgVqwYCRnHJlLgpGFiExZAstwSiUIAUT7adyut/MmouWOBU8uUq1l7csVSC5oT9m
24nPCEVL1Oj8iGsrp6mmQCVkqBqjOf+RNskYwq2pPfP2+5mYIX0CxzubyK77zECS
RYaLASXlMWpoGUj2ITo2PQZJYcndtv3rTnOv9SjnGSG+hkB1wBeet/EQmq8ulE7G
dYvibi1c5YHhxkNM3LcWjIKcUU1b3AAbGf9htlDZpjQq3pOKWglSyeuECHm+7z+P
4dLCVC94hV8FptcNU9Iq/r0qCRuPBu1nW+6IyIIe11xYPR6Iyk6tbWGwG42FBLvK
amEXxHw9gGn6tBSfzDVa7nenglg/jBrVqOKo7npN1110X16PzRcTsO0/471ClYFN
9ZSg0vbU1fbI/OdGkpYsBGRsXVE42vASfz/rEI61syr9sC8o+4muWtHXuonkVrFS
l1+svdDjUcdnu4dknyWkXhUWSh/vBp1Mtjtiotp6B4ZhjC/ds8CmKdCaf8NqX3j4
DzEkYmM04XagLXR/TuPcieDxJ9HwsA5pZV5901DD8kT7rmLg5jiNc6xcODILO4lL
Uqc9W4Fue3D4LMq/aH0qxJYriLxJBKrss3N/+bH+e21GmoiEvtQ=
=Eg5n
-----END PGP SIGNATURE-----

--gu3fveioy3pqqyrr--
