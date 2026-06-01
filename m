Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB82830C15F;
	Mon,  1 Jun 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332813; cv=none; b=q6oqsUmeyPGLFmbkLvnKT1bcxXfUmU5fpq8LkfVkOPRWhhaFr63rxJOuUm5FVQ+HMCQnRvcnz7F8Ue9GSOhLijtnKbnWfWZRG9YTplXDXtBHOvBoYIONjLPjKC3jeKzByURyRI8JjDcpZk8iOEsMjchBxUYJ8Y1bfPWCbKajUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332813; c=relaxed/simple;
	bh=g8StwNJi79ve0ZBHSM7QhCdLWK3lpOeORYCCRuJPB84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBcLtyK73wkrNQ+p2x2t+n5rCYE9O+O/ynsO9ePP3gF+iZEmmJR5bmtsvZSCoQFx2jKlmUeB1cYGB+hwasPtUimTWUClvitpbXY2OHC1I323chVL7UGFw0RRjUviaqiCiHwldX2aYyVNc0HbbdDJrQpMv+A43Z1A8E6pVk1Cb5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7LYrXac; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7LYrXac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2E81F00893;
	Mon,  1 Jun 2026 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780332812;
	bh=Hs5PdwFLptXpT0tB2pJaRnUtEYfRt4SMpNOxdYvNr9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b7LYrXacRAuOK7FgDvGHtwDsrWBxFvqqDjRtISxLkYQcDKPVzNWBuDrUwIXJwHNF1
	 SSaURj8nZPW5kTOtmaJ7jAnPPqTb5cyrKT4Eis0+JXBoBb+xcswPfggIp6N2fvVlry
	 jDY4HaEqRV2Y31rA+v/bYJScCosOkKzOyx03ZJDaf9y9bAl7ZralhbDZRncpf74COV
	 3OnMkveJFpu+jdMWg88gPxESxF9dGP2+UzuZhqo43RpR32EXT9aJdSQ89NOEhwLYtt
	 tYcRl3U4EVBXGdkVLA+m7sVM6CE6G5/1heo0ySfy3BxKd3y/YYhxKPftnh9qqbr5FI
	 iBw+praOdM2tQ==
Date: Mon, 1 Jun 2026 17:53:27 +0100
From: Mark Brown <broonie@kernel.org>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Message-ID: <ea0e8942-75d6-4a02-8be8-cf0f7680f825@sirena.org.uk>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vo/dz4/+VFAEJQTG"
Content-Disposition: inline
In-Reply-To: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
X-Cookie: Have a nice day!


--vo/dz4/+VFAEJQTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 05:02:24PM +0900, chancel.liu@oss.nxp.com wrote:

> The existing cs42xx8 driver only supported I2C control interface.
> Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.

> + * The SPI frame is 3 bytes:
> + *   Byte 0: chip address [7:1] = 1001111, bit[0] = R/W (0=write, 1=read)
> + *           Write: 0x9E,  Read: 0x9F
> + *   Byte 1: MAP - Memory Address Pointer
> + *           bit[7] = INCR (auto-increment for burst), bits[6:0] = address

> + * We configure reg_bits=16 so that regmap treats the address field as 2 bytes
> + * (big-endian). The chip address byte (0x9E/0x9F) is placed in the high byte
> + * via write_flag_mask / read_flag_mask, and the MAP register address occupies
> + * the low byte. This produces the correct 3-byte on-wire frame without any
> + * custom bus implementation:
> + *
> + *   write: [0x9E, MAP_addr, data]
> + *   read:  [0x9F, MAP_addr] -> [data]

What about INCR?

> +static const struct of_device_id cs42xx8_of_match[] = {
> +	{ .compatible = "cirrus,cs42448", .data = &cs42448_data, },
> +	{ .compatible = "cirrus,cs42888", .data = &cs42888_data, },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cs42xx8_of_match);

This should have an update to the bindings as well.

--vo/dz4/+VFAEJQTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoduQYACgkQJNaLcl1U
h9BELQf/Z8p0kOkZaV2ukPfycAxUVCGYkbQtF1m6YG8sWtMWKXnCs3OHRGSnyJgq
Wm9sZgNgpfUuW/yy26oF6I+sZUjKn975Tgg737ZEglOzgUA3YT2czGGu/t9DU09U
5RtPkIoT2bfgEGEZGcpl5Wu4Yjg9E1UH2SXburkByX0o7wzOh50lbrEx500k6EYV
fvZGw+BGnNACGhjgPX+4QqdNm6yAtShlxpXCN9dEXVohTti4l9+O+2NyYvbHMtLC
WkjS7vIFrUL5bBv+0xyw9do/i9N2wHn+QsBbnhJXg4xgd9JrjdXJWai6nioxtYnx
soZ0vxJeFH2eXZzig2e9CHuhUabmOQ==
=zX48
-----END PGP SIGNATURE-----

--vo/dz4/+VFAEJQTG--
