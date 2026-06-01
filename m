Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129163E1D0B;
	Mon,  1 Jun 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338538; cv=none; b=DGfZwfADH4HPGIoXDzW+E2Q9dswFM+mVkL/CCUKD5uAk4MGAEjavFzG0GTHQ3sDebE0VQRC6fLF+qGTGvyuM89TFgxF9GHg+XFSVE3/CwqsDCcTuHfgVBvMnWffVr725AmFQcVOu1TkTfs3YfvzNm+T2Mqpt8EZ4h4e07jn/FVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338538; c=relaxed/simple;
	bh=E+dYWrT32GGBqleltKVGkvSZJfKQEJz/9vZ3MLeYhgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4i21MGp8GJx96QvegmmL6pTK0DV8qOcEytLeZiDETb+iFubre0Da6BKLI0g1shQadkywx3NZrM8c1a2wq6fKwD8xJyVK2pI50nslBI7rxh8w5QE8JfvdQyMjNPAj3KTasLvh5PAPNZSJ61FEJZmaVKbvGQkRQ5PQTeASnZYpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnf3/Pqe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnf3/Pqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527551F00893;
	Mon,  1 Jun 2026 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780338537;
	bh=p5vPvbuuihkxV1n50/7KfLBmzT3OGN6+wFVZ5hTVciM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnf3/Pqe9aUKgJpBRqxwFEFg/D9bflCqbGoMOd4wCw2lwnfGXo15XgrII9d01Jlhv
	 IAEunoRcBCF2qavMhTjVfqqzTv+rQ+dj8P8iOWEbgCx+4YVcq/qO0yW5rvAYrLN8JF
	 7MVzqDVKSXOTE0llOZlaNgD4LbIYlaxbwcZ88/xtrS40rnh04cTlx38IXauG2ZUvu2
	 dfHSbG6xuMclvxV2TGId8QZu1ZldpVKdAYSMfrmFeMPR5X2yqvIIxl96MQeMv7jppx
	 P1DYxvDCLyNKie90OI/EuOKh/GUDX+XKwJpiYdfDSWsRrSrigVhQzBzqUUFFsJqYBN
	 2cQ0RIIDuX9pQ==
Date: Mon, 1 Jun 2026 19:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-ID: <7ff4cebc-4873-4135-b58c-29a9ce2d696f@sirena.org.uk>
References: <20260601084309.845322-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M++ZiabQa6fJi7Sj"
Content-Disposition: inline
In-Reply-To: <20260601084309.845322-1-lijun01@kylinos.cn>
X-Cookie: Have a nice day!


--M++ZiabQa6fJi7Sj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 04:43:09PM +0800, Li Jun wrote:
> The "invalid position" error occurred when the DMA position descriptor
> returned an invalid address value (e.g., pos = -1048838144). This happened
> because the `bytes_to_frames()` function returns a signed value, but when
> `addr < runtime->dma_addr`, the subtraction produces a negative result that
> gets interpreted as a large unsigned integer in comparisons.
> when the addr is abnormal, for example,the DMA controller is abnormal in
> hardware,x=0 should not be a point(x == runtime->buffer_size),but a range,
> which includes the addr address being less than runtime ->dma1-adr, and
> the addr exceeding the DMA address range.

I'm not clear in what circumstances we see an address that's outside the
DMA buffer?  Is this an error that should be reported as an XRUN instead
of silently masked (which will presumably lead to audible issues)?

--M++ZiabQa6fJi7Sj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodz2UACgkQJNaLcl1U
h9CJ1wf/Zc1bVgqevBHFIeuvfzP5TaTeDBJvVkklARA9HvdEHXO9e9+z0J9YIcAy
vbqHX2U1v4HJ9Ih3a/sACMoIOWhtA9XDJ/CXQU624/uK4VG66FosxnMN/eNYrY0D
LDqsg0NgFtTJBkeP7k6i0KuNzj/ZkpMtTGLaVpG45AxLRCdw34XVkmI07aAKKda1
W9TsqullUgkxemC9qtNilsFJZEji66wuO2+3rIW2XeUigqCPrAstoM2TnoYoyRLf
Dvl58IvZeFYGaU/OP7qfdO8q4YAPaeJorWG22kLHbi3NW36R4xAfcUug8226l1q2
1jqRUnzCnyJouXY9wQZPTgB8pY2Cvw==
=Si7k
-----END PGP SIGNATURE-----

--M++ZiabQa6fJi7Sj--
