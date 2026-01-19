Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4442285406
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826983; cv=none; b=FC/kaY7ZVARcYgaMd+jDJe4/VqSFIxIfoFVHqyELqhUsVX2q6LAKT62WsQ7njGMoPJeJqzK/XnoA9puyI/uON35z1TBHbD6WYFk4V260LiTu+8lknw3mjlG+d/LGBjPgpHe76Q1dHFxxBy+dTf2q6uRcv/EIz4ZMsijRZAh+jlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826983; c=relaxed/simple;
	bh=8Uh2I3bDddV6OOdw8KyXbYNNs544q6+9b/dJXEGCStE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTI3X34hgHYyOaorRqXXHHj1cuHxt5mMJCXnvUUHSAbMoCQ74VYuLJYu0K6+UyspQWqj2aYIxBFR5Uz0TouOhgabIqm7hnmZA1iBRV/IFdYJD+SsH2z1ZC9gaRcsQd9e4Pg7dn48vMmhfxNcPPHdcgsTGyZggSZ8gowlOPocI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7AQmeNs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7AQmeNs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0E7C19423;
	Mon, 19 Jan 2026 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826983;
	bh=8Uh2I3bDddV6OOdw8KyXbYNNs544q6+9b/dJXEGCStE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7AQmeNsYG+kgcDKaoml9FY+eAJ7+EMdm9l8p+AHcu49QP+7akovaIBuULiWTMnbT
	 tqiABSSRCdXc0s27509BcYj9IzI//sOHG2m95Q3exAuoQu+bkgjWJO5ZCLwd0PNr14
	 Pof9GSqoZBAUP8OGZcmbuF6PPJoZsQIKZn+KC7NxarOKWzEyH5FXRm2ZuZV8CmDt4s
	 0jvUesb8sVTl8Owve6g6G+5lEYnci33hMuEyPULJkvvv6sFxrm+4Nr0M60lNIEmkZY
	 I3bo53WzULUBeWEpNcDIieAozR++GtTWA3Et85R/5S6qqWQQpQGyjE7MepweFG6Ek2
	 CMvpSqSgVcYxg==
Date: Mon, 19 Jan 2026 12:49:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Anatolii Shirykalov <pipocavsobake@gmail.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks
 list
Message-ID: <a7b9267a-6330-4ee5-b710-9a1c22eba376@sirena.org.uk>
References: <CAFzRAosPRRt0AvJDwVjgrbbYTkWjd8ebq3ixC5RcCwGTLpyfVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uP3/Mm3ebS49EsX3"
Content-Disposition: inline
In-Reply-To: <CAFzRAosPRRt0AvJDwVjgrbbYTkWjd8ebq3ixC5RcCwGTLpyfVA@mail.gmail.com>
X-Cookie: Does not include installation.


--uP3/Mm3ebS49EsX3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 17, 2026 at 04:09:49PM +0100, Anatolii Shirykalov wrote:
> Add ASUS ExpertBook PM1503CDA to the DMI quirks table to enable
> internal DMIC support via the ACP6x machine driver.

> + .driver_data = &acp6x_card,
> + .matches = {
> + DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> + DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK PM1503CDA"),
> + }
> + },
> + {
>   .driver_data = &acp6x_card,

Your mail client has corrupted the mail, it looks like it squashed out
all spaces, so I can't do anything with this.  If you're having trouble
with configuring mail then b4 has a web API submission feature that can
help:

   https://b4.docs.kernel.org/en/latest/

--uP3/Mm3ebS49EsX3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluKGMACgkQJNaLcl1U
h9DhzQf/VFFclRE+Ym19EtfRAItkBix3/3kMxtlj4+nafzSJ0KzvBnNKeBxJCSpB
5MKB2343TUYveNPOneiLN7bgB8KaXBhycl8oMG640ks6BN5Zc7F/KOL538FMg94A
d0+5BT04oIWwFSgeWCMQXN6B48SMcEdllUveDLlIfkPqwTbnoIMLGdopSgPMJDZS
DXzSYHk/mxPctlLoogfrKMIYgx9tKsCd+bTquuz8o1b7sAEZSkDx4w+F/eacibsZ
Rup9Td6DEyTRD+Am8DBYlFJcVIh+eLEw4rumRzCEN0SrEA9ZUjanrEcus9UxUPmb
5X3tIC7/T7iTQimPF5KoJQuZ+q/Vtg==
=pA03
-----END PGP SIGNATURE-----

--uP3/Mm3ebS49EsX3--
