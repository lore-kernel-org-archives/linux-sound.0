Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EF35C193
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759974; cv=none; b=pnVLL1iYPwFjrD+65FtcNCmgrt8CVPDrzdxJ2SnD81yqdtQibffSftsEe8uo4vErsRFWrcu3F0rgt/+i+Ts3Nl75uJb3yCsjkm5vuSHOkwv8IJN/tCvc9unO9mj4wZFN0jBPW34C9dFb7n13S0MsMPnqQ4sKPC6vn2kZfjI8EbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759974; c=relaxed/simple;
	bh=4Eq66gtX8KXYfObOr4vzvv/FmUwB5JlQJNQ+edLVN4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwewuQwFuT+rYvasx+7ql5WVzA7reCIWCLwQjI0owi2dfh3IhTlDrFKIDWfRkC4NuSyEJ5rL6HPL9H3EA6dA+zPhaKSmPP7Y+sRHwzuDWRUat0am6C3pK92Az9OHuTsTh1FjgJ53/aw0IOopwVyUxhJtoNAKriKMdgS1QfoWJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzkwV0ud; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzkwV0ud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38001F000E9;
	Mon,  3 Aug 2026 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785759972;
	bh=w/27EyTA5/ZHLzPd+3IcRb7lgCLZnklulIgSEtvynJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DzkwV0udrG2YxgDQ4rN+UYLnjx6qMAAEsSqOoZqck+gMrHU/NrWcBRGyYLYmoSKLQ
	 1rcCKDCkfkkM/ZZX3TVvlFsttA93xOCil3fdtgqA2hMtM17T1pvcikGsRgy4Gs64w4
	 Ty2ua/avwxSz0o5YbBteuOTfj43GFvv3ITPUMq3TDOjm+ZH/j2Fel5lAmKVEcYYBaA
	 60gzm5E5VB9XO+xboT8oftIrdln9JCmHJL42d1JGC4npMV2PHE2PCj/fIItaw1zzwz
	 euRLvxQ0024dNfoI0AnJlfDuGUJTUef/YokOvK8XPN/urMNDPAcTv/Tkir5DtI5c1C
	 Fma7pbx4+L1Gw==
Date: Mon, 3 Aug 2026 13:26:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
Message-ID: <5f29d5ef-7b11-4c39-a05d-7a3e470657aa@sirena.org.uk>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
 <87h5lfswog.wl-kuninori.morimoto.gx@renesas.com>
 <b7dbea39-5137-4d97-96dd-2d4e08423dd0@sirena.org.uk>
 <8733wwt9zx.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fzfS3rYescYNfJYQ"
Content-Disposition: inline
In-Reply-To: <8733wwt9zx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Prunes give you a run for your money.


--fzfS3rYescYNfJYQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 02, 2026 at 10:48:03PM +0000, Kuninori Morimoto wrote:

> > > -	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> > > +	depends on SUPERH || ARCH_RENESAS
> > > +	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST

> > The DMA driver includes asm/dmabrg.h which only seems to exist on SH?

> Because it has "depends on SUPERH || ARCH_RENESAS",
> non SH will not related to COMPILE_TEST. At least x86 didn't has issue
> in my check. But I will double check

ARCH_RENESAS is available on arm and arm64.

--fzfS3rYescYNfJYQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwiOAACgkQJNaLcl1U
h9DVHQf+JFkQ/xeeUQRMoLdhowbenqe0wlOkSQHypGperBy4xR70kSnS5uOLDBIV
jOM5oszJGkT8rfXtt/osQLgtw/sG694A5J0EFMcPb08AOtovZSqk0SjRCa6/LvJT
Cn1HposiMC3GaFoTiXXjzSAnbBPJpZswwpCDetr2Age1vSxff1zXBwYr1BeTzNiY
fr0LZFcLsruLKCEFWIZTUXYJcP4hWkI3EHv77PI+QvFdadjgFeADaOS3P0Qc1JN4
rmvoTzJTRez8lMvsKqUFlmv3NJN6xtlPwClUrRH/yKCBQYt5/0sZw9Af/mKZgBVe
npsdRhRH+1FkUN8gDo4dPxBNv79Hyg==
=ao6b
-----END PGP SIGNATURE-----

--fzfS3rYescYNfJYQ--
