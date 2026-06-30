Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA219407CFD;
	Tue, 30 Jun 2026 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825922; cv=none; b=ZwScDYqcV717nncIzHWpNcCheB57rZagP32Cr6HvOGms6v49J7QX3JS34bG/MrGaUxYQ9l6lUIeH17WqFoNIXzP9bbWIu0SYMd55wYmTWckRQZlVOqI3NQUBTZqnXK2veV6swSOtlf5/HqVTtKSwa5z04P/gfEMtcXuDDtXNU44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825922; c=relaxed/simple;
	bh=FcLJPhH4M4zTiLQGk+qNu5fLEbmYRaKQWFaFRa0vazw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyZXc8EyglhrgrZh0Kn0UUwIyK0APnUVSlV+Xm/ryWSzaK3DCtsGDbfP7glVJJBLxN/lytY+2pK/qf2NgCfxTk6LRGYlcS4vITyJbNEzJbjWlOwScBpeSIo5R5tpPNSIKvkrOzygH8MIP24GGSnBah6WJj3P7Ikz6/Ub2FwD+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPGrUUeS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPGrUUeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941CF1F00A3D;
	Tue, 30 Jun 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825907;
	bh=aN3AhlhZvp+Vej1wTa9tcQgECOaxstihSa4ef2eA6j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PPGrUUeSl/XrMhQtEga5FLzhwJipIBhyy+Cl2YlPEKnbd13fF0wc9hMSdiRwnO5S/
	 FsEv3G5Wtln7mjfJypkaeJ1fqn4Cr962msmXnlH308MOswPjSfDa71eOvV70fDxfBw
	 IIuq33OvNwHzzY+yCmZxkbm7mxAG163Gq3135+/QCZctY+po8c49SgYbekXWt9X8LC
	 49nyZ7qXskvfBjTypvDirUlkvZB73efQ5s1/g6t8BNTc0AgADRndfTp/gFf1ewvG7m
	 XXOHBNhXt0DVzo8/6yuzsFoz5QPQurWFcm1pJmv4IuCkLUNkqOGXFbXabcdCVjL72R
	 8pQTfvoE2PB4g==
Date: Tue, 30 Jun 2026 14:25:03 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] ASoC: fsl_audmix: rework runtime PM handling in probe
Message-ID: <e0367509-358c-4ace-a7b3-56b903cee0d9@sirena.org.uk>
References: <20260630124016.645114-1-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7GzKw/gt5Rm2Xcy"
Content-Disposition: inline
In-Reply-To: <20260630124016.645114-1-shengjiu.wang@oss.nxp.com>
X-Cookie: Air is water with holes in it.


--k7GzKw/gt5Rm2Xcy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 08:40:16PM +0800, shengjiu.wang@oss.nxp.com wrote:

> Changes in v3:
> - address the comments from sashiko.dev
> - replace the pm_runtime_put() with pm_runtime_put_sync() to fix the
>   race of async=20

I already applied v2, please submit new changes with these updates.

--k7GzKw/gt5Rm2Xcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDw64ACgkQJNaLcl1U
h9BvwQf9Hij/dQrKYeOKMveHecl8CVNUC7XqMFWQpw1P5aqN+PrK+R9mZnTrKUxe
S5BpWKmNeEN4hwPpZA2FfPZlKoRWDN+3/ecyQWqBvAy6Vl0ThGKMWrzxYhTvov0C
nanG7svDN36m8qyiitKuYNGB1c/FsizZe15G4Q5PPM6Z/7fbFC7asTAUQVaCJd3K
T/m3WsHbzYyqEmXPSCgHJU9fwroFT1/aclyUoscscLDEAaFrfQi1A9W9s0CH0nzt
V3G4dbU0O+xkA+zCDsn819YOv3ighnoJIVumTQFlkv91FXYfUUnO+4MvB+wWlmJX
Qn/hQV2+4tWeSOAhCJYBgyF+dz6AZg==
=Gc+K
-----END PGP SIGNATURE-----

--k7GzKw/gt5Rm2Xcy--
