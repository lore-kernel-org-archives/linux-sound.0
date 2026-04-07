Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33EF39FCD8
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561311; cv=none; b=aKwJwrodpRpKqySfELh0DbE2oWxheU0TCUiVdp/NPCr9DJ8JVa23RanLk+SOldUMevm/HYVKBoUGowxQLFG6oV1OFFfK1WrkpPxxgZHgd5xgFQ8TbOeqfaNQHgMOFhDNq3sZGIellRFMHJ+KV4rS1huXhh4vdi1bLs+MTzsArds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561311; c=relaxed/simple;
	bh=k2Z8MOmvm4pabCre2FqpBpNFp2XXqqwec8f65DgWbaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOfKpF0CId+2lTOfgKpEdY9MMhpsa5cVfUghcfAAKCKR/j5P7n4HJvGa6X7gE4fyDyblxWc9UHkw2pvGTG+PG6XHo6K0AKgKK0pMc64eO1nPcodEFPSsXX58nZNMflS1SPo1CaCuUG/tFZfC4sHFpc81U9pHQ4yiqnFdgYauSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5UZaBtt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5UZaBtt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C993C116C6;
	Tue,  7 Apr 2026 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775561311;
	bh=k2Z8MOmvm4pabCre2FqpBpNFp2XXqqwec8f65DgWbaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5UZaBttIcYpLTvf3R+xb9kyWLKOWJHLty2BuCGSlgIozzgU9oQ8QLV9fg+xKR20I
	 8/d1Y9MDdCPVdNZ8liaRPcKXlvkOs2kr1q9FjCt3gToLVydvrdO2z/8nH+NCwKpPSP
	 +oyVgh1OV4iSZ6cQUYsvhY33sVI1B+tEOwO8V82Aic9IntWU48yhe/I/AzPPP5fSKO
	 dXuTBBVJV6deFEXvyRES887wTSiJKvbwTE6E4LveKUKTrk5Qws9VWBtn76wGi8HPX1
	 b2TW4M38/r7Es63bIzLtGofrVcrSzgUMk/Ga4tvwDOaxdfA0uKhyGuzHi/DPz5Oft9
	 iWKZQbZZ8epUw==
Date: Tue, 7 Apr 2026 12:28:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Fix type warning in
 avs_probe_compr_set_params()
Message-ID: <416e2b85-f0a1-4dac-9e36-5ae31551539b@sirena.org.uk>
References: <20260407085459.400628-1-cezary.rojewski@intel.com>
 <20260407085459.400628-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VWZy0HKjy1LCh9Eb"
Content-Disposition: inline
In-Reply-To: <20260407085459.400628-2-cezary.rojewski@intel.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--VWZy0HKjy1LCh9Eb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2026 at 10:54:59AM +0200, Cezary Rojewski wrote:
> Expected argument type is snd_pcm_format_t.
> Found out by sparse.

> -	bps = snd_pcm_format_physical_width(params->codec.format);
> +	bps = snd_pcm_format_physical_width((__force snd_pcm_format_t)params->codec.format);

There was an earlier patch for this one that didn't get reviewed (and
every time I looked at it the __force looks super suspect):

  https://patch.msgid.link/20260325021752.238203-1-songxiebing@kylinos.cn

--VWZy0HKjy1LCh9Eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU6loACgkQJNaLcl1U
h9ADRwf/ZgWGX9MZ331ehG4z1J8jwtxyUZycQGimdgNrVRJ642taTSctffMouYbc
IaGFq9dQ20VMj2X7T7XdQ86tekTuOZowwyMI3XFFu6htaWDEll34eWCjsRWRVi2u
Kw+qEsXCak4fPvrw85oxz3rRrCO2cKTNFuSjmWjHQ7jeRbx7XAd2OX/xMKnmKCCC
8P/zGhfQ+YNOS75fJC06yp1Bvki/msU7uvsG9lgUBAoj90CRVLK2DZp/PFF8q94r
YugYKbdYjvRmt8eADEP92d2w5+PovIuPI+pca2Mo/c586JuOtZA64g/If+PLm8DY
No+2Ju5BOgU3FuAvQJG5Pu4enehKQQ==
=YkBB
-----END PGP SIGNATURE-----

--VWZy0HKjy1LCh9Eb--
