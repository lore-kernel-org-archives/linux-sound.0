Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6B313E18;
	Tue,  2 Dec 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682659; cv=none; b=EJQdxfvsiI1MeKknyOgTgtguUhCha1N4XU1DmZWvO28iKp4jfOLpMZdYfmBl9K8o03A/l85Ybxf9b8CPs6STBBFm4y8cgwfeNR/B4osnDWnSFEI3vr+/3PYS48Gm4mC2Vob7a1vecqa0kpHd1M+tvLin9SfiQ3dA/HeqgcnsN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682659; c=relaxed/simple;
	bh=duHmrRw4HWtkbcNnGvOEjOK2apUznnWEUAAzFnFmtG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAnmWXt5o/m6iuwPzb7oCtAGwOp4YjyY8pJB932tyZ7CXNGyoufxCJAUk62sLn6JLr08rGTpiSLZg4K4P1t8SCQuU03DaJgMYKEgXR7S+uQ0h/jn+mSsn8A7HxZou71qTfXiSWaSR527SnbSI1CQdCrgPpbLhKyf/7SDgryYSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVJrM3eC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVJrM3eC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752E4C4CEF1;
	Tue,  2 Dec 2025 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764682659;
	bh=duHmrRw4HWtkbcNnGvOEjOK2apUznnWEUAAzFnFmtG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVJrM3eCxMrZbh2Nxm4nPtsIHbeboRKKm3yxwcJZWhh0AfbtIDC/34IowiB3asg0N
	 KzyLP40VlL2g6XOTnPM8K389RoBJFiNndotisGc1UxpPXEvfc0AUmztEm76kGUqglD
	 GJHeocHSx9/A2DsZooUHGjzsFwIjT31HGQE29LvWBhzBVzkYi90JClrb/bpzfPudQ8
	 fuYEHyU8ZU2fYH7VUEBKDUGeIgTqrrHjCuB7PQhEIrPMX7ZAx12my/97uVR2RXtY3l
	 fEzhwp4X9apnjKMEuPKMVUvlDt7ooyWb/MHwnLSAHbkHflg1iEy0syy6/v7tqvCOIO
	 Na7kjffCImaZg==
Date: Tue, 2 Dec 2025 13:37:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	andriy.shevchenko@linux.intel.com, kuninori.morimoto.gx@renesas.com,
	nichen@iscas.ac.cn, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: ak4458: Disable regulator when error happens
Message-ID: <7d926b4a-2fde-4411-9f4c-e12a9a2fcb81@sirena.org.uk>
References: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
 <20251202083535.1985714-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAz1IroAdkRA0vfs"
Content-Disposition: inline
In-Reply-To: <20251202083535.1985714-2-shengjiu.wang@nxp.com>
X-Cookie: Beware the new TTY code!


--RAz1IroAdkRA0vfs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 04:35:34PM +0800, Shengjiu Wang wrote:

> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -671,7 +671,14 @@ static int ak4458_runtime_resume(struct device *dev)
>  	regcache_cache_only(ak4458->regmap, false);
>  	regcache_mark_dirty(ak4458->regmap);
> =20
> -	return regcache_sync(ak4458->regmap);
> +	ret =3D regcache_sync(ak4458->regmap);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +err:
> +	regulator_bulk_disable(ARRAY_SIZE(ak4458->supplies), ak4458->supplies);
> +	return ret;

While we're at it we should also put the regmap back into cache only
mode, not that the error is likely to be usefully recoverable.

--RAz1IroAdkRA0vfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmku650ACgkQJNaLcl1U
h9BAwwf/ZMCOBBj2XL1cjXfzoNJH3Lq6ecyGUU959qGfWSbX2X+aflGVG2W4uI2x
jp60zSa1wQQ30OKaGv9qY09hlVM6FsCvoI+GzctUxln9lfgumTuhxtVLVoXrPYpc
bzYsJp+Y2SLHVtUwwRwax3/Eb4JVjBYvJDCWhHr918fccqBAaSxXuGv0INLuGlvm
+KYcFgqcGvMfo1GAcj8JXlMavoE7+73DMd5R+WQso95YclqtyN9Gta547zEQmnV+
CuL2Mj/ZVCmLdBaS/QiFe6aff72LWG1isqhrLPVvpUW32i/8+1xbjohKuRQsdg3Y
Cqu3GuHQPebHGmkJPtIirJ7aZ7AeTA==
=uTaZ
-----END PGP SIGNATURE-----

--RAz1IroAdkRA0vfs--
