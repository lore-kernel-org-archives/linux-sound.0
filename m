Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C053C5833;
	Fri, 14 Aug 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720430; cv=none; b=LQRN4kczhjgGmsfb+xEVP86FLdjxPkSJkpbmbsXu+urXzMpek0Nf+YTrUpbX7TjAFbDoHcUDEwZY9bu8nG3bsScZQebF2i7910F6xAs0EXwhVQ+ab5hzWQAHeCuKqDStNgYyH6isqCIWoxwaKsFSfNBO/PfeTHQcwlvRQG5j6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720430; c=relaxed/simple;
	bh=Vq+6huNNXV4zAiJ6QEmO/NJb4GNFrqKvfUnxhgjiLXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFmhn1qsKfgSDXB9HCfzGv2FofVv20HPGgnA9zFZuDqdifLDbirYodQeWM7fK9nzB4DEz5kbuLoyVPQfPmWR9ak6ULp+pRwFEt+5H0s3NR2BEGLd2t98raWae39Vg18wuX9tACCh54FlVmN7+Yk6Io+URflVX0QubZtF0/5+UQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQ9xm6JR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQ9xm6JR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7CC1F000E9;
	Fri, 14 Aug 2026 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786720428;
	bh=HgJkIJxrwQtXF94Hd21Hj2696gdsz9xnq/sWbR5SOPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YQ9xm6JRJkVg+Qd8LT51ACi63sZhRJ+SEi0HaMZiPZLDGYbBcCbyi4zVycmEzMWrO
	 3fwmYtN2jkjYtmEtO5/UD+qGzsEtwKP4TuciqgBCWAm7eYP1pvZA94cC0TCxt+NVJ8
	 Eeg06asmkv8qKaIyXCpGTXYDu7KLFskcDHIE0IQKOwSwiMsZvDeNRBBgAmv6ROxvv2
	 2pw5gGPGnBtpQ529HT+CIoXqws24J5hjaKlu3xqxUeUb7ZAHkm4bnR49Kmcka56L5N
	 95fv0Q32HPw1Ysmvo6nY+LXNS3lzPg57JQ+2Zqh+aU/cqUYI8KBsI2wi/NA6YY1AsD
	 +l4DavveFe4Ew==
Date: Fri, 14 Aug 2026 16:13:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrey Golovko <andrey.golovko@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Antoine Monnet <antoine@montane.tech>,
	Robin Everaars <robineveraars@pm.me>,
	Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tas2783-sdw: do not cache read-only Controls
Message-ID: <e3103067-f8ea-44a8-b430-4abb61e45d6e@sirena.org.uk>
References: <20260814094000.22118-1-andrey.golovko@gmail.com>
 <20260814094000.22118-3-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aaMOf5PEcoTJ8FK8"
Content-Disposition: inline
In-Reply-To: <20260814094000.22118-3-andrey.golovko@gmail.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--aaMOf5PEcoTJ8FK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 09:40:00AM +0300, Andrey Golovko wrote:
> The read-only SDCA Controls are readings of device state, but the regmap
> caches them and tas2783_reg_default[] gives each one a placeholder, so a
> read is answered from the cache and never reaches the peripheral.  The

>  static bool tas2783_volatile_register(struct device *dev, u32 reg)
>  {
> +	if (tas2783_read_only_control(reg))
> +		return true;
> +

Does this work for multibyte reads?  The regmap has val_size set to 8
but some of the read only registers are multibyte.  For SoundWire
val_bits doesn't really matter so you should just be able to set that to
32.

--aaMOf5PEcoTJ8FK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/MKUACgkQJNaLcl1U
h9BKdgf7BGMc1lwk3Sc+fI/9MjG1d9LtnFVFczPq6XcD943nq+M8GSDpeW+0ISGb
FB+3tmzmknZqPZAE4Ar0xo6TVeX7WGUvNqTuiBwh76y0Ml14hJhFRY+a/Ala2b+H
UPYajuoN9kpnCVcc3O9Le3m6nDv+q+xROy/FqStHmo6nIt86wZ05i2mtoB+9X+9h
hNY3z1lC/IPGkgwesjvzDHeukpr8u4FBRRlKYTZUHMI60Y3513POum/0uDNwvJ1q
i0ylYtGTaf+tFAhNb5VMiO5fYsQLtizxpi0ddng6GlkcqW7u8RVagiHUqFKqODwe
5MWcEGKJGoRZcxRK0AmtQOT4Hvpkgg==
=qUJv
-----END PGP SIGNATURE-----

--aaMOf5PEcoTJ8FK8--
