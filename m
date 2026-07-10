Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68785285CAA;
	Fri, 10 Jul 2026 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696073; cv=none; b=LV36dr6Y36fM6ITSEADPgxtfxKD0qEKGL9FRA5UvxL3rlYQWrVHexj0cvkYwtt2I9KGNpiGKdCiH/gbhhLg7GHp7rG6JbLRvzRBR3LFQ3XpbGrnq+strTU4X13ReeeQWkH58ztbaIsyisMtOCgzVGxqbDVqRQ2/P8KvZBPV8zvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696073; c=relaxed/simple;
	bh=e4Ge5wzqZN1cG3hFCUVWm7MzT1hx5H3j2dwHOc1GSic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5L8WGyi+mzqWPc7RDWE3SO20jgYMbvgN6RLJJz3ug4qS8pBXiisAAerymI71gnBX0ipGI5JI/omsQX+yrdwMMyiJphx+a/GQDaE1WiCyaRZnrQXLXldBLAri+EkL6guGOUYEptMRNOvN2EKs6/yXQxIAnNjagg+Zek92xm3FZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlV85tcm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlV85tcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4BC1F000E9;
	Fri, 10 Jul 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696072;
	bh=6cLlwZEogPH8ppzA7eKtjjQx1kbEb1QU1EG0qOLtAlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TlV85tcm3GYPMXPMjJ+66ZJISSVznxL5YsvYORoXyMKNfpGO9kEJ+vcYK2O/28Ywq
	 CSwWSdQfw3petnzBz2bOF6kT5V2qZ+Cpq1U/fiXzitL0srT3PG0/XivHvEnZBJlOb5
	 O5HAxKguIrVzr9Qfvk50N8aOO2Fa58+z/SEgvBUj2E4+KTQ/F/geWfwT8oH9EHD5Ch
	 Yo+xiTD/3O9xyKVvM+axr7jlhQBrorsCR8tEuh0tZztoOKTzyTjllMQAgofly6YqiF
	 U/xp32ANtZ8iPq/jFGrQ75f/tkyTL7zfhs+LdQpi6EEg9oLLWVb8CxS2prKGzbSPXI
	 /HEcWg9kRGNLw==
Date: Fri, 10 Jul 2026 16:07:43 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Message-ID: <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
 <20260710050511.14439-23-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDwogXtsq8RsMi6d"
Content-Disposition: inline
In-Reply-To: <20260710050511.14439-23-phucduc.bui@gmail.com>
X-Cookie: Did I say I was a sardine?  Or a bus???


--BDwogXtsq8RsMi6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 12:05:09PM +0700, phucduc.bui@gmail.com wrote:

> @@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
>  		return 0;
> =20
>  	if (!slave->unattach_request) {
> -		mutex_lock(&rt712->disable_irq_lock);
> -		if (rt712->disable_irq =3D=3D true) {
> -
> -			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SD=
CA_0);
> -			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SD=
CA_8);
> -			rt712->disable_irq =3D false;
> +		scoped_guard(mutex, &rt712->disable_irq_lock) {
> +			if (rt712->disable_irq) {
> +				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
> +						SDW_SCP_SDCA_INTMASK_SDCA_0);
> +				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
> +						SDW_SCP_SDCA_INTMASK_SDCA_8);
> +				rt712->disable_irq =3D false;
> +			}
>  		}
> -		mutex_unlock(&rt712->disable_irq_lock);
>  	}

This function does also have some goto based unwinding, there's a
similar thing in the rt721 changes.

--BDwogXtsq8RsMi6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRCr4ACgkQJNaLcl1U
h9CpsQf/Zz5nqEo4Z/MJiZGvwJUID88/cEjWwK5VttpBJJMvdsC8J/zRa7/kWLDW
tunq+2S+S/kMBpXjJdL2CCowgGN/5C3YJps7AHBvu+ZZTskmSAPM4Bf83pTKYq9j
ADgruP/KcDzIn0D1ZDbFwOwIFVgLvTIqyTKftrvr+tTsJ8nXttcun+/3IJSoC+Ct
ds2sN+glOg48dkd2cgPn5j1CBirm71zV0iPHMW7yxOhC2nf8YgpvtG6BuTkDHzo9
8MfMTrqIll+jqK0KtkTcA6HEmlJ1AyNe2UJlb7XM+mFucpLmUESb7gCi7cAmsHBE
mXgSotbSmxQ4GmCFa/b0sJMtdgkAKA==
=oChm
-----END PGP SIGNATURE-----

--BDwogXtsq8RsMi6d--
