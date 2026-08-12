Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6A031A807;
	Wed, 12 Aug 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557820; cv=none; b=LCFd3ismMaGtjzzSQ2a96GRaoJn4VH2wiokb/MaIeHP+ZNgdlfgRkKXKkr5tnjyW/1/2XqhQ2NjZ9ZnHmAxjWa59Eccp2n7MDA1J4gpxS/cC0wrfG6A9T8pUeTLMBc3rrcfaBYIrRhA1LoTJq2+XU1/UZce5WGlknQiNIokYG5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557820; c=relaxed/simple;
	bh=pCZvmg6IewgkNWdHNLkkT3KoC0UdF3XOSadPtn5rQHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paYw1t2+IcvYjTaaKs24RG3dfLl7Ht7MWhd+RraGRbNkDYoOyssLVTRb11a80JDrj49Th8Q/VPcj+glBtjh/9FyK6ZiaZr0NQZuJMJYeZPyDh10x6DnaYYx7RcO9N+iTz17EKfgyjVE0E0laQ+4ruXZv0M5RuUsO6DplDkEr/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5UikFai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5UikFai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AE41F000E9;
	Wed, 12 Aug 2026 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786557818;
	bh=EHebvdsoVvEcKSBny0QQUvX2i+BTgR3tgsWFtE8+SB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J5UikFaiAVgFrMTWBFnBdnQQM/0Snfv6GMVzSgrW+spKu57p198SJg94//nW6auj+
	 7zBFlxZO6bxpp4UGQ0cLz0iY/JU7TgIjSWxWzy+hROCqheZiUTnOXOXvCejSsc7QNU
	 t7jONej8kkxJEBU5UtTeuYvxJJYACdYnTsamCkrLMXjSNVpdJML9qO+pvex1x+dMZ3
	 /NebBHEfJdU6FEswY7W+pBipyPe8sPQCB3TdIwKAoiAkhn2PX2pdtYPDqAJE3UApUL
	 CFShFKO96YoxF5B1WtCGyvNIwhuAZV6YYdnBQ4QDRFJYSz4KG1I12sFjNHGze+8uS/
	 ZBIRSoR4o8wWA==
Date: Wed, 12 Aug 2026 19:03:33 +0100
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
Message-ID: <ccd9a584-0f3e-4585-a563-e2c720e20b92@sirena.org.uk>
References: <cover.1785855013.git.rriveram@opensource.cirrus.com>
 <2decc44a938373375530defd9a1645770987313d.1785855013.git.rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoA1l6IofpbgC2Z+"
Content-Disposition: inline
In-Reply-To: <2decc44a938373375530defd9a1645770987313d.1785855013.git.rriveram@opensource.cirrus.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--aoA1l6IofpbgC2Z+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 05:06:03PM +0000, Ricardo Rivera-Matos wrote:
> Adds support for the multidevice synchronization (SYNC) bus.
> The SYNC bus is an opaque one wire bus that is shared between
> Cirrus devices. Initial support only includes software (SW)
> data packets.

> +	ret = of_property_read_u32(child, "sync-lsw-txid", &val);
> +	if (!ret)
> +		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
> +				   CS35L45_SYNC_LSW_TXID_MASK, val << CS35L45_SYNC_LSW_TXID_SHIFT);
> +
> +	ret = of_property_read_u32(child, "sync-sw-txid", &val);
> +	if (!ret)
> +		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
> +				   CS35L45_SYNC_SW_TXID_MASK, val);

These are namespace cirrus, in the binding.

--aoA1l6IofpbgC2Z+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8tXQACgkQJNaLcl1U
h9A1tQgAgsuCZcXPEesxJrfYeqdGwHsmvYA7fJu7rRWU7QiQhf2yBAXmAjTDlgAE
exhQJq0L64wmAg/aH5WtcdvDVRcEhQeeEHCStBvQhcQ1+n0TjTTSKgN7JoaasFQC
eKK1VDDNqDo+lfbV5sQA1VQH6RLni1BmpZ+2qLGoOrYBJ0ksWBTiyAauNtf/KWEa
wJb6SHMmCgGRrXk+FE5JiD+wc0qoakCVQyv3xLUewP6Xlw4O4BXixr14SP1RTDuq
kK10pkyUPYvpvCwTYT8dM6yD2YoVEgcUjFy9kZdL8GzvV+zbD5JP+g2ZMj69RJxg
Z92gKJXBPqzwJjXrny6pU3n4a8kJSw==
=ttEZ
-----END PGP SIGNATURE-----

--aoA1l6IofpbgC2Z+--
