Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F434756CA;
	Thu, 13 Aug 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627379; cv=none; b=u/9RnQ7XXJrxxctk4aQ399ap8d/ixsuh3zcgp9V8WgtvrQtqPg6sLu+piOVhi3C/GQf/ojDbbK0aX0hqS4cZ+EP75KgbK+w/A7lVtI9lcYYH8EOrG4RdBMS0SMzr7EXHxGjzW5S4dX+NsAiOFHnvtv12yPeGiBmfTrpZOBzPKWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627379; c=relaxed/simple;
	bh=pLVMK5TjHGsjjseeiiHNIxERL+Y5j8y349nRNhVaPx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcWAnCF7wPELMsi3iO9lFhY3SwhiawMu1Bqlg2HvSR8cSAPgZPJoCvzHygBmYAfz4Csh7OGp9l9Dbda4AUTixfrMz0/YdmsdcxUzS+VzjaY0c0sNmrjzfHKT9d/Ok6im9M7Q/aAmGPesi8gTh9dAqPcYR7fMRNEYcXzjpDNMq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr4aB/+A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr4aB/+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F7C1F000E9;
	Thu, 13 Aug 2026 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627378;
	bh=pq4r3lap9HMkA3eDZuE5tar8pKV7yibqNTsv91ndCv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zr4aB/+AVtk6NzZuyfchFoAx7I7lqMUlyN7efAV/CId4KPGws4F/lShoCCMSnJk2Z
	 Tp/z4L/jjtin0ve3WHqRj/Gvb6Oz7LrYS7YSA3hPuUoIkdjIQTStcc2b3h02us4o28
	 qx4yBXMNrhUwyJxTNx9is4Vzx7NorZN9cL16IYprQF5cs0QXRPev8wrSOrrsVDcK5D
	 YemKmPNlXJZwoYr8hCKeUpuiPRN/FvioR2wByzcRa0NHoltGJw/WI6kUneT5MHLvFb
	 EOdI0ca92H49IVo/Y7fME6u/iGIJrP+RmIGU2+T9XznzZ4uOXIgOQ+zLa0gO29VNTt
	 zV6HsoFiyJ8yw==
Date: Thu, 13 Aug 2026 14:22:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrey Golovko <andrey.golovko@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Antoine Monnet <antoine@montane.tech>,
	Robin Everaars <robineveraars@pm.me>,
	Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before
 preparing the port
Message-ID: <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk>
References: <20260813001500.9218-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BsOP7V51+ru+V0Jg"
Content-Disposition: inline
In-Reply-To: <20260813001500.9218-1-andrey.golovko@gmail.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--BsOP7V51+ru+V0Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:28:10AM +0300, Andrey Golovko wrote:

> A Data Port cannot complete channel preparation while the SDCA Function
> is powered down: the peripheral raises the channel's bit in
> DPn_PrepareStatus and never clears it.

=2E..

> Power the Function up in the PRE_PREP callback, immediately before the
> PrepareCtrl write it already performs, so that preparation has what it
> needs on every path that prepares a port.

>  	case SDW_OPS_PORT_PRE_PREP:
> +		/*
> +		 * The Function has to be powered before the port can complete
> +		 * channel preparation.  hw_params() does that when a stream is
> +		 * set up, but a stream that is only re-prepared - as userspace
> +		 * does after the peripheral lost power in S0i3 - does not go
> +		 * through hw_params() again, and the peripheral is back at its
> +		 * PS3 reset default.  Power it up here, where it is needed.
> +		 */
> +		scoped_guard(mutex, &tas_dev->pde_lock)
> +			ret =3D regmap_write(tas_dev->regmap,
> +					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
> +							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
> +					   TAS2783_SDCA_POW_STATE_ON);
> +		if (ret) {
> +			dev_err(dev, "power up failed for port %d, err=3D%d\n",
> +				prep_ch->num, ret);
> +			return ret;
> +		}

Does this DTRT if userspace restartss the stream by directly calling
SNDRV_PCM_IOCTL_RESUME (AMD adverise SNDR_PCM_INFO_RESUME...)?
Similarly we can suspend while prepared.  Either something needs to
force us to prepare again or this needs to be moved somewhere that's
always called.

> +
>  		ret =3D sdw_write_no_pm(slave, addr, prep_ch->ch_mask);
>  		if (ret)
>  			dev_err(dev, "prep failed for port %d, err=3D%d\n",
>=20
> base-commit: 6f6fb37f9f9a8ae88faa1b5b1978e57381488502
> --=20
> 2.53.0
>=20

--BsOP7V51+ru+V0Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9xSsACgkQJNaLcl1U
h9AaTgf/dt1SUkgojEtim0WU7g1RuptYHb6PEEeQKjTy3DjQ5P5pintbG9PbB/EM
orr3lbUKTHOg6kbsL4L3N6/gDGF+eBILhNsaCa+d5gJuGfIqi+PnPHTaRsHbwExv
glspKvJO0EPWhy0jGMtfvneatLhat2gZfGWKao6HHxS6fPkePdUyovDFvhMX55aN
FtGutRX7tJ/mnHv8yCNBJTofGplX2hNa0FPR31Wh0VgxlfGAMIwvB5pbfIS5k/aQ
0eFBpusAN8VjvMGDsAr9EoWjg5UbEus70AbPXhpjGSfkYaonveoMjAopdeJmv4Yu
Dg17Sxr33bxuvRWBncpIG4rS+3/POw==
=KRHp
-----END PGP SIGNATURE-----

--BsOP7V51+ru+V0Jg--
