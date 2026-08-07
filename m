Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A81A6814;
	Fri,  7 Aug 2026 23:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143913; cv=none; b=ArRCYRAx2XUlKZMbulgO+TuksE5s+r5rgOqt6UJHGF3iK+KBYzWh21JbgaUwLgowHMKDaRm3G0vtxNlpCZbBF3Q5jCka5oH+WI7lEZRwM1PNQVHAWmcDAed7fA5YNcTyZL+w420TB1dxIqQB0FGcIfz2ebzxzGJCZ7pJ/F6gtgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143913; c=relaxed/simple;
	bh=vxKXYQUoQkmNt6eRSpmBDHfBldMg5ayqRpmTliTKF+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clysTdS44Pn5r2r4GSMT7lu2xOYAS8jeE6nA7sauOw4iTLkfhXM3sIp5wZkDverDrAwt3TyhpUBZoelaIxwnJGF2lcUebYwETEzZb29LktQbQ+EG94kM3WobiL7gDfVRMQq01dwg+NfERR5FhpzK9wY5acn9l2fgpSjBFZHDMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwqO6m2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwqO6m2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FE1F000E9;
	Fri,  7 Aug 2026 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143912;
	bh=xbEIosNJCaP3EJaufvPQKfBBttV/sl6714LVS/JGpXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VwqO6m2qcciWO1XY1NfZtb2rO4Wi2HD/3rxLNplnQVdVr3HULoSTBgYytJgf5tpGD
	 X5+9/lTbvrH7wUmN9pt78eJdf7RF3RUjR86+eMhLHX8wm9MBpCflS6SP/QQnTLTMoe
	 henAyXF+wrDipKLLFdUh9Gw9I4400uvMTF4jjS776z/aZqijGqosP7pEwnPxY91Icz
	 PqI6qRYPq0hxtn0a4+LJOfrhxNLe5ciRIpaY7avuV8GP1tWRUc0K/g2KT0Wtk8NajX
	 JDIK58eFHSKt7qhigffnatg36d31+05ct1btkP0/etqSlhPFbKyJeWe8PG/ryy6pm9
	 wrkXOYIUUKnog==
Date: Sat, 8 Aug 2026 00:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Message-ID: <645bcbb1-978b-40b9-84d0-a199b3a508d0@sirena.org.uk>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
 <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
 <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+3mYRGFLj7ilQ38p"
Content-Disposition: inline
In-Reply-To: <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
X-Cookie: 1 + 1 = 3, for large values of 1.


--+3mYRGFLj7ilQ38p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 08, 2026 at 12:56:53AM +0200, Christian Marangi wrote:
> On Fri, Aug 07, 2026 at 11:52:58PM +0100, Mark Brown wrote:

> > This should be more patches, the machine driver should be a separate
> > patch at a minimum.  Possibly PCM and ETDM drivers too.

> Sooo you are suggesting 3 patch? one for machine, one for basic pcm and one
> for etdm?

At least, yes.  Basically one driver per patch.

--+3mYRGFLj7ilQ38p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2ZKEACgkQJNaLcl1U
h9DMrgf7BHtogqj4DSHF9g99FPOtRVrxmKPlNjM902FlH/JmKVE5cT5AUlEdMIQ7
tlb2+Cb8luOavgvtUzPhpSwp0lZGtxaZSrwYVDLQ/avH/L876i8ahADONr9XcJm9
fw9kzXqpPQn90bAqLJ5XXStskqeTBGfslEzZalKqyOPKbo1a/YukkhNyang7uhbr
UN6OQPbug8wEZ/xje38jzeeLDK9dsbnC+kp1npJ+hpjYSIc/hlOI7ya9nOQfOb5G
P9E2uaj0AieQJaWMS/3LE8BASMxYhczoUY0YCHqrhwnQur/I2uXJZ9u+yYB9RFaO
l9WJnfaItHWZy+vBcekpkTvFY4R/Xg==
=8gHJ
-----END PGP SIGNATURE-----

--+3mYRGFLj7ilQ38p--
