Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227AE331209;
	Wed, 12 Aug 2026 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561557; cv=none; b=LxOMmMnM5lQm2kouWBmqiK/aATb2DdweG9Zbpe1SW605aLkku2+Vgdz4SjUe6LpthNblCG2fCI/82qzjgkaefEdew5uOCi/RQKiZPOVEOlUTkuI28b+HyeaONkztIMGuaeegxEOXeZATiFjDzAIY/6GdW4pbeWnp9HWBkveBrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561557; c=relaxed/simple;
	bh=vZgjjqCCSgN43qm7Hu7d7kDhPuEiIVexeMTaQHGkUkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzwfbETxLjrTevAzVESWOXeUFJ694KLtZzvQAdATmvqi8JZP+6LApPKp5JPzdhWBP/zO59wbpzkDXkR155DpJzpY1zXqsc8D25wR1MRfQXGGJPtGnU7ficT/lmAPXfnCXx5ifwv9M1dAPVRp7JGb99Gi/nLI7Qg9JDRrICS4WME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAyuebM4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAyuebM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969FD1F000E9;
	Wed, 12 Aug 2026 19:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786561555;
	bh=yYRvI3p+YqnIoeHEXIGJSOMVNP/nN6/OaUJV7G1idt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAyuebM4/YbNLcl0fmWUv3W1RxkBMN2Be+dzH0r4x4wCQRu4kQu6SgtxfnKLI1Wsj
	 bioTrT8cN/UAHekphV+zeR+eT1sZgSLZpjqh0mcqaYFxg7CoFaOGquDxI94pH7ja1X
	 NGsM3jTw33QL/fEqW3vNTukWSYzInEfGuPBI2P0P7rejuZ7eyUmimzLpw6rUT0erWu
	 LU2hW1HV4SY6MT935bqr6fIqDV1DqMj6XnZ9BxQzh/M5TtWfwYV7ixhn2MCy+JNO4U
	 PPYtp1qKwBK5Arg4Fs4oOcOQUcA8hFBjDX/gei2B7iUOCGrA03v1XFIycfzu60Rchz
	 t6H2fk+pFeKPg==
Date: Wed, 12 Aug 2026 20:05:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: tas2783: drop firmware-owned registers from
 the regmap cache
Message-ID: <0de8a9a0-1929-4210-92dd-2376550fd841@sirena.org.uk>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
 <20260809101541.4969-4-wiza@saarinenkoti.fi>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6f+7k6uBURRqob0X"
Content-Disposition: inline
In-Reply-To: <20260809101541.4969-4-wiza@saarinenkoti.fi>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--6f+7k6uBURRqob0X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 09, 2026 at 10:16:10AM +0000, Ville Saarinen wrote:

> The firmware image is downloaded with sdw_nwrite_no_pm(), which writes
> straight to the peripheral and bypasses the regmap cache. The cache keeps
> holding the tas2783_reg_default[] entries for every register the firmware
> image owns, so cache and device disagree from the moment the download
> completes.

> +		/*
> +		 * The firmware image is written with sdw_nwrite_no_pm(), which
> +		 * bypasses the regmap cache. The cache therefore keeps holding
> +		 * the stale reg_defaults entries for every register the
> +		 * firmware owns, and the regcache_sync() done on resume writes
> +		 * those defaults back out over the firmware tuning. That wipes
> +		 * the per-amp configuration, including the channel assignment,
> +		 * and leaves the speakers silent until the next full re-init.
> +		 *
> +		 * Drop the firmware-owned registers from the cache so nothing
> +		 * stale can ever be synced over them. This is safe because a
> +		 * suspend deep enough to lose device state also takes the
> +		 * peripheral UNATTACHED, which clears hw_init and triggers a
> +		 * full firmware re-download on re-attach.
> +		 */
> +		if (file->length)
> +			regcache_drop_region(tas_dev->regmap, file->dest_addr,
> +					     file->dest_addr + file->length - 1);
> +

Are there any controls with values that come from the firmware, and
shouldn't we do this before rather than after the firmware download?  In
general this feels like the wrong shape of fix, it feels like the
problem here is that we've got a register cache for the (somewhat)
dynamic values written by the firmware download but we never synchronize
those two.  I think a more robust fix is probably a combination of
writing the firmware values into the cache and marking registers that
get programmed by firmware download but should never be cached for
whatever reason as volatile.

--6f+7k6uBURRqob0X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8xA4ACgkQJNaLcl1U
h9DRewf+PdDWe2/OmQna3KDFecd8RTcN2vfxuUkeZfYbNEziLvzEdBv3uuwm/rrO
nr9DnHCqXSOS6eejYHElYflsNwkXwVn9+qa2c1v+iOuPfDVZjLe8iPwYO/8jcxva
aKIFNEhucdkn3E9t4oGnw2ABxGqkVpSlfgp9fuh3w75z3l4JytjpezHI+cVdLAJS
DnBoh4N0B2cxsX6c1Z28ww1HrslTSBAoDm3KHxK3X7LxOdqg77KM7kQeJAuXbyo2
OBewrJaGGDA0Ue2H1uwwJi7lh+nYkaq86EwinGFrTOz9d8bNwI4SQJIL9JndBraB
+0SEd5V9XPEE8u6o4giE4W1G2iW5ig==
=Dlx9
-----END PGP SIGNATURE-----

--6f+7k6uBURRqob0X--
