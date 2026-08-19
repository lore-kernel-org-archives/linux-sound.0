Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9C22F767;
	Wed, 19 Aug 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147457; cv=none; b=GX+zsPCbur/g39U+NiricuWCKaqv4WaRloZScF0FrYshXtXa3ZAUAVh+MQS6RSmUOprQhCPRj6RSQG5rkwcOTSizS5ff3a0RKmojma+xzX6LnMFES9qCD5YSVET8iyzcnVIuOaKUkvMhEZLrblpVXzXo78Le5qDv2qpyMLQl0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147457; c=relaxed/simple;
	bh=JpqxdrYIymncfJM2QZGgoVyH5kp2lcwpWLy+u4YnlR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lltUKb/aUOP4iaDrnGY7CRM0dCZOE7iV4i0PwlykFFkCaQ/mjSj3gIFXbSHR0YRgLm8IM8ocTy0C1l8BC6VpJa4HnzJxdPW6utYgMiNj4EvUejnFOiBTPCgplNtCeYOYK/9KHyAq57zP0S0YbT4RrC0ZB/gZfKGgZeLoe8vQMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9v+FGIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9v+FGIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC46E1F000E9;
	Wed, 19 Aug 2026 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787147455;
	bh=dcqFv8a8GGHH1ZPHV28ZvuS5L8E7imICJgECEKm+Xkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B9v+FGIX6VnUuOwnQR0bTzlaReSxVq91Vwuiiq3K62DH/lv4fhqIzJFOfq7fyBJlC
	 pbhfT/I6bcR8jHpn/M9WOnkmQQGWM804uTUmh8SYIPJYa4tpL3RuEzFkzyZ4oj9wXG
	 o7gDT02nOGdMqQiQBQrS6AgRYZF8livwMf5wpWdYklpZac/6QB/zaiE7vamiFdN5XF
	 3SUVFMC9z6TfIhJfqCGxKRD6KxKubz4BrnLVoPQNrDzCiwUkDTdDdBKaLv7IPgnPHw
	 o7qyn/XUX838qn2vrJXGurvQjLv6ngtvwaRA9xm3Wsf1V+++vX3gFSs6PIZVc/z1iK
	 T+jamO9SdFlhQ==
Date: Wed, 19 Aug 2026 14:50:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com,
	v-hampiholi@ti.com
Subject: Re: [PATCH v1 2/2] ASoC: sdw_utils: add spk component string for
 tac5xx2 family
Message-ID: <4cb67411-b478-47b5-8641-c8c4653a25d2@sirena.org.uk>
References: <20260819053427.2277-1-niranjan.hy@ti.com>
 <20260819053427.2277-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qUoOHiBirj4sba0R"
Content-Disposition: inline
In-Reply-To: <20260819053427.2277-2-niranjan.hy@ti.com>
X-Cookie: Allow 6 to 8 weeks for delivery.


--qUoOHiBirj4sba0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2026 at 11:04:27AM +0530, Niranjan H Y wrote:
>   The tac5xx2 RTD init does not populate card->components with the
> spk:<prefix> string. With this change, "amixer -D hw:<card> info"
> includes the spk identifier for each tac5xx2 speaker component,
> following the same pattern used by other codec families.

> +	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
> +					  "%s spk:%s", card->components,
> +					  dai->component->name_prefix);
> +	if (!card->components)
> +		return -ENOMEM;

See 0f60ecffbfe3 (ASoC: sdw_utils: generate combined spk components
string) for how other drivers do the same thing.

--qUoOHiBirj4sba0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqFtLkACgkQJNaLcl1U
h9B3Pwf/QHWUmakw0YQ2MROe0wPcdjsn3/wZhxom7H63m2ZMqjaO/8MPXLDnx398
xEXA/2y1vD/vCAIa54mNg8CQxjQw1+TAWKEB4VViOmLd3+ZxzehsxWoKXGzXpe6c
tWslXOtU5KgJghLhDbAZq9wj2YvFVeR+bSkLcrJQKUL++49LZYnT721csPIaOOqF
PofaSE5IT9fOB9TcWxaGLGzNHqysHoono8pJ713UAirSONeqTB4mv55vVZIpxVpw
Bn/M9hXXx+TuerUmVC/UbgPZHaA2UMaACywlKPxm5zrRlYylIhCZqGnulzXyLylu
Lsa0R3BprRZ4JFgOCmjBGppZT7Z9nA==
=erQq
-----END PGP SIGNATURE-----

--qUoOHiBirj4sba0R--
