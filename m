Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E2271A7C;
	Tue, 10 Feb 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731866; cv=none; b=C+nQM8oTY8/Zv+EvhvX0il8LZhxMZx1eZFnOUA1T2dHVyUZPmoqDKL4f40sX52r1HZ7yH6I64ifkF/jX76v4hUYSs9aKRuhKEYBu+zhI2Za3WDQIRcBc0MbQy70W55n5yCNEfYvbtjKUtk5fxAsvGPOvK6AmMp+rq6UH4VH9sNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731866; c=relaxed/simple;
	bh=czuI6swrGaUma7tJTDCAg011fytzT+/paEmEhPyGsU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5aI+WNOWXUHQV2G9xd1UYwIYH+9ebLZTe4kjCRDLKMWZx0yKKblpiine5vyzVeGYtPM/Y8DKychJPocGhw6aYWTWbuvG8PgdIe6YWspcK+8Y+m+ZpFXot25UIBy7xQZ9wWlnK/JWHfg+gmJ0uKp0PJrtB1XEZ1GJ9o/ZWUcfR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3Dk3Mxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3Dk3Mxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CF2C116C6;
	Tue, 10 Feb 2026 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770731865;
	bh=czuI6swrGaUma7tJTDCAg011fytzT+/paEmEhPyGsU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3Dk3MxaHzrB0xSFsF/QWEkTbi0xTrXBqqsULVouwbf+v5h0sOwJj5ucK6np5rul1
	 h/FPHvSA73j4GUi/k5ZT7BA5bRuudh4OW6OAQxB5mP/cvDPKtj2lln6DVIhM+zjwYR
	 wrfOeu3wGN7Z8wkuimeBN9ZrHvC4eRux1QwrDUs/WQaPn9tqU2maRrePW0oSy/PPX1
	 vB6VXnItP51Q0CEPUIJVc/bW6aeKflJJbGVSGTPQwCLbXFaz0g4f7EDpi4v56PQ8+K
	 6Qov5ktEKJtsXsiaP3mlC19FNJyNYDZUqSkzsmbAWZJvYvNKJEQhMKrhyqpZBTsQaA
	 uhRLR/cgWzqng==
Date: Tue, 10 Feb 2026 13:57:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Message-ID: <df0669e2-949b-4d6e-b734-d87333c2d6f9@sirena.org.uk>
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
 <5056506.GXAFRqVoOG@steina-w>
 <CAMFT1=aJa92RO4j8ipcRc0NJ7DjAvgStkTiSx-QsrqQQzqkV=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C2ElNylhWZPDuDeN"
Content-Disposition: inline
In-Reply-To: <CAMFT1=aJa92RO4j8ipcRc0NJ7DjAvgStkTiSx-QsrqQQzqkV=Q@mail.gmail.com>
X-Cookie: Spelling is a lossed art.


--C2ElNylhWZPDuDeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2026 at 07:55:28AM -0600, Ziyi Guo wrote:

> Thanks for your time and apologies for the inconvenience. I think we
> can drop this patch.

Please send a revert explaining the issue.

--C2ElNylhWZPDuDeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLOVQACgkQJNaLcl1U
h9BN3wf/QVUs+vKPEw6CuD6bOSL1eUA0yxJmuZhjqWvNw6dsLfYqcFtB7qkqNMFX
rD4KmO6+UPFzjxbYSxond/gajh4FLfNExuwZJfK7FpWVKXBPRB9aP6R1tKEVnYhh
X6MXKjhTLWHYWD63BcNIeZebEavzrvhXiZ00KzKJHh5DwBXjd7uaitXVvHAApbOn
ThZBVdif7uO+EQU//CHvhZO0WT6OycXWog8cq/12uKFQWltBjYHZRmISMcrFyjwI
1Q3JOfvt4asCc1ISpA3uftImFiAf4j2hxBwgBjEWNLPEfxKhPD4AF6/cRI9QskJs
Lwv0dmVRlqN3GhCfu5HvWd5JG/oHRg==
=3ICV
-----END PGP SIGNATURE-----

--C2ElNylhWZPDuDeN--
