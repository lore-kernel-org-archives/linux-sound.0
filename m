Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA51E32BA
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642879; cv=none; b=BOM0PdYWYvRqmHwShOINk/8Z2bKSWVR0TvnRVVSOP9xc1kyd1chxXDUsy699uW5iy4yNam+pBNb4fsaJiBAtVMcqwnhc0MrlR2A7Bds7eIaD10CHK2rqEDKjCf6LWv8hHRPh1jOhchSfI1Ks4kqamXf7vSORgWE6TaL+hQPJRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642879; c=relaxed/simple;
	bh=qQ16roEGDzzhrrlHe5OgeITXMOUTiK9RLz6nEX+V15M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCZJ5ZKKSAk3a3ujrtN+pLOTgl38b8EZ3p/vzJbx/W3kM1zMFGH8e/eJHzxC1z0tUNvBXCcpiqj6EgRq0TLp3dYJoRHuXhCfhaAvDicNL4oQxpjIDy245mNzPAZpU5zJGhcm4hjT4qLJhzjL3G9CI+v/vLKHo62AvzqZMNLwbcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyPW6hcB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyPW6hcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3DFC4CEC3;
	Fri, 11 Oct 2024 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728642878;
	bh=qQ16roEGDzzhrrlHe5OgeITXMOUTiK9RLz6nEX+V15M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyPW6hcB8OXcNJaAXrQk1Xx91BTEbZHAPVRgX6DFEQVhvQGvvsyZoHxVa7yCon5Od
	 QqJyJO120BoTn+adDM1WmFZOq7Ouunv6AsHE2UQzwgyrbcgMpN55nZNaLxGvE6Hc4U
	 BpXtz+4iUy59wH0Oc1wlUxV3xEjGgrDBD1hgOaBSHgoh8kHqu5mvgVHhJdGa2SKliB
	 k/K4HpHCl6Gt60oGksyuJAEE3yh90TmRK6cogpNg0kZ7yQQm+z1w8idThC9nbvGkrn
	 Scwnb5DTCyg/03CS3YPL8pyLmmetjjdGt7voQWmvzH8ymYKX0YnOzV7iDXUQ1pZHvQ
	 CTp4P3I959pKw==
Date: Fri, 11 Oct 2024 11:34:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: Intel: avs: Fix return status of
 avs_pcm_hw_constraints_init()
Message-ID: <Zwj_O1tmrQmA14ud@finisterre.sirena.org.uk>
References: <20241010112008.545526-1-amadeuszx.slawinski@linux.intel.com>
 <172864164240.3853572.8328107515251289485.b4-ty@kernel.org>
 <d7e02acb-fee1-4d17-94c6-96b07f4938c4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgJCL6T1o12Zo4yG"
Content-Disposition: inline
In-Reply-To: <d7e02acb-fee1-4d17-94c6-96b07f4938c4@linux.intel.com>
X-Cookie: Editing is a rewording activity.


--xgJCL6T1o12Zo4yG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 12:22:14PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 10/11/2024 12:14 PM, Mark Brown wrote:
> > On Thu, 10 Oct 2024 13:20:08 +0200, Amadeusz S=C5=82awi=C5=84ski wrote:

> > Applied to

> >     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next

> Seems like I've messed this one a bit, additional comment should've been
> below '---' instead of '--', as it is now part of patch in tree, should I
> resend?

No, it's already applied now - it'll be fine.

--xgJCL6T1o12Zo4yG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcI/zoACgkQJNaLcl1U
h9DvaAf+MEQAc61p4jEn3Q5I4s/ce7jnONGeEiesfwlsc+gjUB/AQMk8xpgSMNoC
Dc214CTQuTT6L6wF1d5PAULQee36HILvo3E6Y2QDJ6j/ajB22TG7rwPCzv21Ttzl
EMxWGgz2Ad1uFgyMhzRBWAp4YdqmR5Zb0J64KB+pQmcLDI4p5CDekNHOGc4tIM2b
6OU3hidTv0i5B4UrLXxEsWmxtKQsfbae5nAor3EqdfI15hVTKqL1WNicOxOSC5Uh
u4P+nGCTkHp0lGQeZsNJ0u8VehU5mkwUYnw1yc/cWffSkv7fSXro12+hs632QjIX
OxiVNqPQFIXFw1CVImx7YJnaEA0cSA==
=nIDn
-----END PGP SIGNATURE-----

--xgJCL6T1o12Zo4yG--
