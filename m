Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32101426EBB;
	Thu, 11 Jun 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204171; cv=none; b=oTGS2vhCA+8ZubEtisDxvhkWGBl6CX3z5D8CsaStjIVMoa67bU84DJrD/PNs2DqHD2LxUxbNsQZoUgGRDbBRqE5Gscx1biqs6j21sWw/UtqdTnJtsbbiUdwMkeDh4q885NJv7t672WmeOn/2hDnu+keaF0Q2onU474+9oV2TCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204171; c=relaxed/simple;
	bh=tPWfOyzXkO/qCtwlgCMvgkMCpqQPsvI/Cr63py13Grk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfucmWVITLKibppzFBAkwDFt0R2u0hFcODVFnuUQ+VCpZcya9YPHjzmh6IXaFqFsZPfoqYxujBkXVMowSKizkvqPVj4utwYwpV3kBY6/70CkVkTMdfzc1i3YXsVuUFc17xAzaCyrely54HiC7jKgpbpnMlBR495miCsORvXr4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWh94g+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWh94g+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41601F000E9;
	Thu, 11 Jun 2026 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781204170;
	bh=kG3y2LrYGyQJXM489Xdqr8aKhB5FAJ38QrgrT+++6bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWh94g+zhpW8wiQHwvc524GKuS8vmk5W/+6sJaAuklBWzbCK6TXTKJLR7zwwI9Q3y
	 PuSO2CFSm9dzEeCuMHM/8C1Y+9bhqELoNLM3+yhHA9mLWZb256gqmT/0/mg/y4eAso
	 OkBtR8dgZ9LRgULREdBYgy7JRcNWz5rM1SiO0cHh1CHPMX7Zr7cQ8sfFpFSvhICFyG
	 ntzMMV9v2nYz5emkN6LBWg6jWrJZ1MJ/3A3ASJKSP8iAyYmmxE+ugSsgBlxye77xnC
	 gXcRnseC5RlM/eRsqqXfoOSYurXFZZ/MN8dZvO6FsR45rZGFnQVtQyv5sQ8muhji6u
	 oqPEnkWk8HCRA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AA9971AC56CB; Thu, 11 Jun 2026 19:55:43 +0100 (BST)
Date: Thu, 11 Jun 2026 19:55:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
Message-ID: <aisEr9qmav5i23CY@sirena.co.uk>
References: <20260611132310.137688-1-arnd@kernel.org>
 <airEQ7ER7jUF3SQ_@sirena.co.uk>
 <c216893d-0548-42ac-8a3b-4be397a79fc7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PC7wq+5BzCWpHtGF"
Content-Disposition: inline
In-Reply-To: <c216893d-0548-42ac-8a3b-4be397a79fc7@app.fastmail.com>
X-Cookie: Leave no stone unturned.


--PC7wq+5BzCWpHtGF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 08:22:21PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 11, 2026, at 16:20, Mark Brown wrote:

> > Can we end up with SND_SOC_SDW_UTILS=y but SOUNDWIRE=m?  Though I think
> > that's a potential issue anyway...

> I don't see that combination in any randconfig builds and haven't
> managed to produce it in menuconfig, but I can't swear that it's
> impossible either.

I think

  SND_SOC_SOF_SKYLAKE=y
  SND_SOC_SOF_LUNARLAKE=m
  SOUNDWIRE=m

Skylake doesn't have Soundwire but does select the Intel stuff.  I
didn't test though.

> I do feel that the entire set of dependencies around
> SOUNDWIRE, HDA and the Intel/AMD drivers is too fragile,
> so it would be good if someone could manage to simplify this
> in some form, but the best I can do at the moment it to
> address regressions when they happen.

Yes, this stuff is all miserable and I'm not convinced the granularity
is useful.  Kconfig is pretty unhelpful for this sort of library code.

> With the patches that I have sent, plus the "ASoC: amd: acp: Fix
> linker error with SDCA quirks" one from Syed Saba Kareem that
> I'm testing at the moment, I get no link failures in randconfig
> kernels.

It does fix some stuff.

--PC7wq+5BzCWpHtGF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmorBK4ACgkQJNaLcl1U
h9A5JQf9E9jRuHbiDKgxhMknI9hbKlLRqV4qSYG9b/SOem7nCqEEVJ/zji5kzqpK
Z8AZPUDc9kv+ZVjwVQ3yky8iXExsP63wg+Rep6cpZ+/Ifa132Lk7fb2+oseDRhHp
F6sCGeKhk0rFBAakeP6FiXrea6//xo5AxzNcolwaM8GZZf+kgJGWG8WvkDK31FiZ
2aEKCiNhhTC8obXFceBycneNhjnzS9cnS0KGyob3sADA1gKh7H+SqaU/Nz1nWQdm
GGVygdDAthzvaNZGePcFJrVA9vxQbysQyyIB6PxhLRJUS5nBrnadYNhVX4Qf04gq
FmzHQhFW4Srxc2VLEa5/8PYQrSAmvQ==
=c2aX
-----END PGP SIGNATURE-----

--PC7wq+5BzCWpHtGF--
