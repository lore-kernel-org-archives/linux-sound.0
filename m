Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C543BBA0E;
	Tue, 11 Aug 2026 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786469091; cv=none; b=o5ZYgcs9r8sckI7UDg9+jrdk1MVGrfQFn0VYIFqMsYuas6S5LcKRIKs+8a2j2lvGTQwdsAi7vjr254fZnCzsIJOZ5y0yhbm70iIOqrKUGv7XC16qhnv3ywSUg7Fe4r4jY8nRbw3dkCGD7lKsKLVql8CSt7cGVcjuv+F1+8/nLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786469091; c=relaxed/simple;
	bh=QnIc6uA7qmBCjRgcmB2UQjbWj0nH4OLpRV7JrD1hItA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQ5w1CqrCS0fIeGZ8171oZtCxcSV33wYxKNMaj/YZRXBXcMnETFA3FWvc2l6XO/tbALkHkYbENVV9fxsrzB8oMh7A23WI9KLv2noG+ntZmXddde2Z5J8TvsdLswcNg2uCz/yOWq1eKowbFQ++6WqWH5o7lPgyRcUwuUrKT6+qMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxbDubYy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxbDubYy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B083C1F000E9;
	Tue, 11 Aug 2026 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786469090;
	bh=IJ+prsR4t2X1qxrlUt1fTjTZQ/fOJb1m2x3GN6qGEsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxbDubYy9G0i30ossYM9NB5ldhK9hVnfMTz99AU4g6HJSbmI93QOjL2ZQte2igc2i
	 sZqCqnhPuHZB1/IiXxkigAdNMNfWjT5yAjFznO6b0URHcj0l/IUa4BTnci5b0UYBCp
	 pQG+ZFLv+BftvitBLlnpk9e5vHYw08fsCsdJ7cbE3vs3M+4p7R2wCq6LTKhAKdG5mg
	 /BT/Ycag8K7SCbPP5qPiMz6sWIUYzLFAUrPfHdWEPkqiJqmfJxLSapsICjFMAlNku7
	 AtHgpHnhtSmLcAHge0bRY0Yhehollz18IGjFgdmjq6TjVmKkUOc/9a+S4Gt/KUqwZy
	 JNjnMFhWBXiig==
Date: Tue, 11 Aug 2026 18:24:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: cs35l45: Adds support for SYNC bus
Message-ID: <72a2051f-32b6-40d7-a400-c090dcddf7b3@sirena.org.uk>
References: <cover.1785855013.git.rriveram@opensource.cirrus.com>
 <2decc44a938373375530defd9a1645770987313d.1785855013.git.rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6DqvzqLxCZGZRj3P"
Content-Disposition: inline
In-Reply-To: <2decc44a938373375530defd9a1645770987313d.1785855013.git.rriveram@opensource.cirrus.com>
X-Cookie: Take me drunk, I'm home again!


--6DqvzqLxCZGZRj3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 05:06:03PM +0000, Ricardo Rivera-Matos wrote:
> Adds support for the multidevice synchronization (SYNC) bus.
> The SYNC bus is an opaque one wire bus that is shared between
> Cirrus devices. Initial support only includes software (SW)
> data packets.

Given this description...

> +	SOC_SINGLE_BOOL_EXT("SYNC Enable", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
> +	SOC_SINGLE("SYNC LSW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
> +	SOC_SINGLE("SYNC LSW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
> +	SOC_SINGLE("SYNC SW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
> +	SOC_SINGLE("SYNC SW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
> +			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),

...it's not clear to me why this would be user controllable.

--6DqvzqLxCZGZRj3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7WtwACgkQJNaLcl1U
h9B6IQf/bIGh/XXa/ZsBdI8zJeLtC0fjhuwV/O06oU30L39323rZxqzkcxWh4Yhk
+8GliOwSjeP/htFd2+9EvBCRSHTwJGr1IebIM7ITG1BUMhXqNn9SAIVW1bLlEkMI
TIiukBRSU3ln7l17XQE5cnmJRPmYjq98v0blR7/Hp2LDedwSePMe6+75rAKwi4Ud
d4NHF/6st/weVh95GadHtlb59iwNms7SW5AC2FEtBqHsI082pQ0SSz0D58yUigzq
FerLJIlrJUyt5HBVwsC6kXGgDvOAj3ObsOb/CiOcUjYNnNvetOhPIfbDHyiUQD3u
I4bUffVUmjWjVO4YafVl6/MB3oZaIA==
=zsBb
-----END PGP SIGNATURE-----

--6DqvzqLxCZGZRj3P--
