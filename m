Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06F1ADC7E;
	Tue, 28 Apr 2026 01:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777339078; cv=none; b=BonZVDB4um9tmfwn+zk5I5i8UIDU0YHwDqeBYkiiCfaXAncjsjTgY6TTpEn6/3MbkZQZv2NBPYndCJ/nuIQK4b+BLIGqdR23QjJvJe5O0l/MeC9P3HU/AQqJj5dAOTaSs+0lS/VRwKbqHRICZksratH38rQOg7luSamfBdPbfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777339078; c=relaxed/simple;
	bh=lnatxAseg/VlSa/dZ3dHZcsixRi59pi17ZRA4tvWVxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gc0VR0uX648ttAqcZtDWqmQfHs9DEPxcc2ftFRtSuHYIcBwnvz61s4d4zzy3CoHnQt8lPHcY0K0aKNluz3CWKctiiS5GLphwE9CwSG+5y0H3flrxqSZ4/k6QrBsQaxh/8GBul1a+7u1ZK5Jqw7nGiD9LBqQ856txDZtihDT1tAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwLRdUEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwLRdUEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD92C19425;
	Tue, 28 Apr 2026 01:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777339078;
	bh=lnatxAseg/VlSa/dZ3dHZcsixRi59pi17ZRA4tvWVxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwLRdUEuT13Z5jL7BIjjEeSClJ3sTIcvE4jKIG9NbEXFEnlw02xmec+nYT4Axfz39
	 loPRdufJfRkYsuf9qJ+nR8MFDe/4xKMF9YU83zX8BwA4XlSh3b7hhKwhAg87AQkgA4
	 o1y+Ga7DXh4Kb9ueGEeJ6kRy+pMOs8lkCyM4oOnb2+RFSgCRXYcWWdyQfkCNeyRslL
	 IahrJzqajPu+KtsVPBv6FaQw084ZKNeDwSDrL7CXj7LoaY8T5XaObqUh3PtaQLJT1d
	 c9U5JmueIQ8eXOdqUaxyrpOeZXWVz3iNCL3VmK9VNvwUjqsVpjDKlIKqmV9TUNvqxk
	 bwkmwtmtZteyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D8FCD1AC5840; Tue, 28 Apr 2026 02:17:54 +0100 (BST)
Date: Tue, 28 Apr 2026 10:17:54 +0900
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afAKwpgvUjlB6dI2@sirena.co.uk>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVzPYmLerYKR8SAr"
Content-Disposition: inline
In-Reply-To: <20260427144658.3609647-2-arnd@kernel.org>
X-Cookie: Victory uber allies!


--wVzPYmLerYKR8SAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 04:46:30PM +0200, Arnd Bergmann wrote:

> +	if (cpu_is_pxa27x()) {
>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
>  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> -		if (IS_ERR(rst_gpio)) {
> -			ret = PTR_ERR(rst_gpio);
> -			if (ret == -ENOENT)
> -				reset_gpio = -1;
> -			else if (ret)
> -				return ret;
> -		} else {
> -			reset_gpio = desc_to_gpio(rst_gpio);
> -		}
> -	} else {
> -		if (cpu_is_pxa27x())
> -			reset_gpio = 113;
> -	}
> +		if (IS_ERR(rst_gpio))
> +			rst_gpio = NULL;

Unlikely to actually fire but this now squashes -EPROBE_DEFER - the
earlier code propagated any error other than -ENOENT.

--wVzPYmLerYKR8SAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwCsIACgkQJNaLcl1U
h9A7IAf/aqc2tJtiaHuK91LB47kTPzvHdNqZm4yTOohJEFun33G6R2au+wsF60Xw
u41rVQner456C0O/uF6YqM3GizfqBE83UdrZuRiIjOUpZLRx18oSoHHULK6CMOT8
85TZh43RxRKnefG62g7uIFEXb28ep5JEmHw7Pu17XEvC5UcOc81M+ktrD2r5SH+g
2Yg95I3GTPlhUaFeIEGWJ91M2ZhllRkEWEyH1tVvj9h63Zl/C+5l+mLIp+erDVts
3NMJa8iZe8WKn/CBiW22rdGgS7XR6Ghkzxm25hXHXm3qwU7qei2fVN0jswDVF1xk
Bn2PaAB7/nukeR1uLu8Sm+EzV5l/LQ==
=cMgY
-----END PGP SIGNATURE-----

--wVzPYmLerYKR8SAr--
