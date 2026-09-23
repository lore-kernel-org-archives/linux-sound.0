Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D993C2798
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152912; cv=none; b=QO1VA6WgafNLrS208flyG4WPhtdQELmgMv+7XsDClOX4X+E5XaBMH3kkXiy0gxtdjWTisNqfbLTqxAm8PjG1hxB5kAy9+eY1eotUTp7Ua8nzGcHLy07qN1jVlB5p6GdCO7RAyA4D5GcmUejMVZE9jVMOmemV16Zqqxth/ycuvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152912; c=relaxed/simple;
	bh=9YOaFSimOgf9WwwJRbni82EgV7YpGp9Ie4zjZ8FZvOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IN9OYwTlngDKzyVP4bjm49ubyyLsnOADfXd4zw5CcNWCTn6TULFXy7/zt8NNakTJWzbsg4KxwB++wgGHPXdv93sslpOy0YQ3JtSgyDNx8uO/21b44gkb0ltcczJX9F/yksUz1UFHMsjiCWNOy8AAX0gZK4xj4wH8DWE11kifa7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKOJmaBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKOJmaBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E351F000FF;
	Wed, 23 Sep 2026 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790152904;
	bh=WATjSFJE+ECCSEBpMKBEjPG8ECDBfFWUd4vzI5xHkfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKOJmaBJrN8ps9WI2CkuxSSuvxXLoG3D25IR5UTKa6D8LFk+YJzAF8kasq4CBIiH0
	 xNWQy9FzqXargeTocjurm7Bdr9ndJl2ntn0mhMXCS4QxoocNB0st6dltAhjyYkDP7G
	 IzJP8rLrvVJLCkmXyoT0TcEismq3h3VIQY/yyRjuKlcQNyVJLStUkShKbW1S/ir+Dx
	 RfddibJPHMCkWbN4+aTWhjpMS47XFQ6WQcboZFhuS44vbkRk7P93qA1F4ebV5d8rGa
	 vnMaJoJ++GpKtXoes9KfH9YPUqNp4y4Fy235vFHZ8qk6b15kR4Ihfinl/jFdB02eMZ
	 O9HOl7ly+Q0zw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8F0FB1AC5735; Wed, 23 Sep 2026 09:41:41 +0100 (BST)
Date: Wed, 23 Sep 2026 10:41:41 +0200
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH v2 0/7] ALSA/ASoC: Intel: add I2S function topology
 support
Message-ID: <arOQxUNzv7CXiPDc@sirena.co.uk>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H1CsOTXe6GGBkhMm"
Content-Disposition: inline
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Too clever is dumb.


--H1CsOTXe6GGBkhMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 01:28:25PM +0800, Bard Liao wrote:
> Currently, function topology is only used by the SoundWire machines.
> Extend the support to the I2S machines.
>=20
> The only ALSA change is to lower the log level. Let's go through the
> ASoC tree.
>=20
> v2: change sscanf(dai_link->name, "SSP%d", &ssp_port)  to %u as ssp_port
>     is unsigned int.

As I mentioned yesterday please send an incremental change for this.

--H1CsOTXe6GGBkhMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzkMQACgkQJNaLcl1U
h9Bz1wf/ZnP89Tzw74kwJAKu9xRdvU6mJYigU/9o0MsmaPEui5B4bDftuqdmUV6g
BGY25C2bMDdcPXP1CtvZxe2eKfbZJdOik1ZKTQBopSfdpD+KX/iGuTaUhhzvwIuO
74JYY+XfIMq2ZgheY7E4dYT+NnN2IoyIyPAUq/I95ivEYaWLlSnuhe7xwa9LSxvg
E7AakC8cD7urYe+rUPd4/b0XbSJf7hXpp6FYXUos6hfoTzNZ6BMCDDDaP8ewep6D
a7v+i476QbUnBUOmjdiVLtTRt78Ot1VfM08Pj+zSTNCsBl61z7x8gv+0o3aXsXk3
p3W9CpzxCQIsJ7h3/F9jWFOQYWh1Zw==
=1Pcc
-----END PGP SIGNATURE-----

--H1CsOTXe6GGBkhMm--
