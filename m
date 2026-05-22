Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49A1A23A6;
	Fri, 22 May 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454741; cv=none; b=j/CAk1PRxG4Gj4I/t6R00UWsrCDEAafe/ONiTKBZh1L7zkJSYrOxoT1Ir6wrmyK4fJZwof0pDx4hk8G7AP57dL3zMp91kRtxkbGr3JqZfOUrFpYJQmIdsOfvBsYABe6MeinFQS/GlGUr+3dzu3Xf625SlnP+K5LXsLGnDiWeBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454741; c=relaxed/simple;
	bh=WZdL4ajWIMPy64SlgTcFPX9rVhAj1DrKanxrjeCWZjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4fe/TwfXNtLmbqBKqyt46tTMJAZTzqNoFYXIYNMGA9OWtJUIBHXD7Q5khAx2z7CvtIFci1SQa4WPOjb4IGr/ffyeXOu/ry6yszL9Zb+C5+qZrgBW7ES9cabqegZFLacHsydHDjwdhuvt7CxT3IS7gOHo83eocgDN+czkt9zbCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AodPdG6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AodPdG6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8721F000E9;
	Fri, 22 May 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779454740;
	bh=dwSUWSNVkWQiU2Ps9u08I+NkEf0pbbAy9oZawlGfs7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AodPdG6kqN8TqpkCsUXCZOv+7MY36Qy89EI2xQcgUo7TTd0ky/v1q5VAVq0Rd/Ydu
	 cITFfow0zhLSKsnzAzwugCTevD9e61iLHD7wSV/7E9cXXL6vthpMGOF1BAza5cz4Ly
	 dA+PNm4ItVfQCaLWVDnnDEZQiwmgSPnG9Bgl8x27Bam0AZiMHeZjdOZeSXUtUq8Qzd
	 PB5u1OwvAsGdWrtLtD0AEi5k5q/sjGruk/fjypCTUtL8+NMBgCMBP5zqAotooArzgk
	 cvnnBfg3F0VjHR/2/tCB45NEP8/GQBm6+vcCOYYk01LCmbznedCj1MHyi9p9nIHZJB
	 pnQ5iX+nbJuQg==
Date: Fri, 22 May 2026 13:58:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH v3 2/2] ASoC: soc-pcm: constrain hw_params when DAIs
 share the same BCLK
Message-ID: <be91aacd-2e02-45d8-9293-e9551f688c68@sirena.org.uk>
References: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
 <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKTSFcLS+m+I2M8w"
Content-Disposition: inline
In-Reply-To: <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
X-Cookie: Celebrity voices impersonated.


--sKTSFcLS+m+I2M8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 02:21:09PM +0800, Troy Mitchell wrote:
> When multiple CPU DAIs on the same sound card share the same physical
> BCLK, add a hw_rule during PCM open that constrains the sample rate so
> the resulting BCLK rate stays consistent across all sharing DAIs.

> +	/*
> +	 * Protect the rtd list traversal.  No nesting: this callback runs
> +	 * from snd_pcm_hw_refine() which does not hold card->mutex.
> +	 */
> +	guard(mutex)(&card->mutex);

We have helpers for acquiring these mutexes which deal with some lockdep
issues using subclasses.  Either use those or provide whatever's needed
to have the equivalent thing in a guard.

--sKTSFcLS+m+I2M8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQUw4ACgkQJNaLcl1U
h9C7OQf+Jwocql2ZUuQWSU2AMaZmusiVEka81SMZdP6KS2iSwEL8pf6oWkxkCcTs
jnHnBGKwmPtnApfDY+mN2FmkMrFjUGf5p4Q21j4YoXYA9I3tnj84SAyxP75mZ8DD
c788haT1VvukP/xOi1aVmQAZDxrrZcM9c+bB4h1t1CPCSwFCTRs6Qy1Xunn971Kq
l2gLaQOZNdPAUZrnzwUBRZp3m7vfF+AYSeONZlLmKWSwlSmZ9srpCSB8dRwj+oqo
pKo6258W0y0dduExgblci93/+kft52DovE4X+RvJiYPi+dx+5A+5ir9nFbMvwNDZ
rabUYy1fGILu3GuPhD89+3KrXeAEbg==
=mDIW
-----END PGP SIGNATURE-----

--sKTSFcLS+m+I2M8w--
