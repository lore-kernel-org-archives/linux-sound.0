Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481791DE4EB;
	Mon,  6 Jan 2025 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736188239; cv=none; b=K3+CZNvMmPJKJPZiMu5cFtTs2uyKWW48uCGjGbOqYPID9+x3Xd85bP7M2vkSCAFV2o78lnF6XMzQd4wZ0FGA8pgt/roUs1or5NvQOmVpnEXWX8xgke4cPiI060r+mzQsMOmrjyj45u+jXQK9/u064m82pNFdCZsjYzlW2WtOpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736188239; c=relaxed/simple;
	bh=EQz1rlAiEbS+P7P623N3jaq6DQBwTOdY6kRPu1sNoTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atUyHPatHapfcZ9/aJdFxH+Nii4iEi3L+nByPek5TaehaM/0tHgL9h8nyGjWt+AEdRfIaInS22o2F4RCR1WlFjD8Yq04weFp91+mU5ye84IgNhKEag65WZsvcfH073PhoupWph2MKLqf9x5/UEMwZiAHzIF8Ps2wGR1msRqFQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ux39bEST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ux39bEST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A04C4CED2;
	Mon,  6 Jan 2025 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736188238;
	bh=EQz1rlAiEbS+P7P623N3jaq6DQBwTOdY6kRPu1sNoTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux39bESTXPdPkbwuHaPQG/Z9MTB7ZcQZQURnqios6qWW/4JNq0uP06epVp9oL5ZDD
	 KWUFnVFUVTT3mSYavfnRubSzQ7PcFzt//lGpnn82Ff+qk7tjxZlIQ9FhoQw5KIFIFE
	 a4N1XlMVCYE3xr/Fyn4UfsRq1YgtBDTLJLSmDjg2JIete+cphn4e4o8IrmsRxL6rXr
	 mvmAs6yTrDIL6UzlZmh8JYi1S4QWJHUqP+4Zl1NTnBv6GbZRYjjSryC5WQLZz9NuG7
	 Ez5fasVFrfG7kyPaNiLby5vZVO6mT+RKd4WMYOKnh1Gawo6jHQlcCYP0EfJvY+DSTl
	 w7xGsiT0TUebA==
Date: Mon, 6 Jan 2025 18:30:33 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic
 codec
Message-ID: <e375b833-2ec9-498d-9042-f18c3b5536f8@sirena.org.uk>
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
 <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5a+Se7219/TOLYZo"
Content-Disposition: inline
In-Reply-To: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
X-Cookie: Do not pick the flowers.


--5a+Se7219/TOLYZo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2025 at 02:33:10PM -0300, N=EDcolas F. R. A. Prado wrote:

> My understanding is that the dmic codec was added simply to allow the usa=
ge of
> the wakeup-delays. From [1] it appears that DAI connections between two c=
odecs
> are possible, though rare. So the PMIC -> DMic connection description mig=
ht be
> possible in that way, although I'm not sure it brings any benefits besides
> closer resembling the hardware topology.

> [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html

That's quite widely used in phones FWIW.

--5a+Se7219/TOLYZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd8IUgACgkQJNaLcl1U
h9BvbAf/b3aJl/ynw/PxKc1fDmig+T+I1qsslScnfq4MyKgtUZQxCx5dkWd4++/8
0IkOBnNcsDqpEyQwxnHynROIdh20WqaZWmmgDdvMIcd50xsyfOuqatBRrevQkdM0
Tdfzog/8igzJNW4d1G2WaNeim4uqo3b4ROsu07MTwsEk5a2C1e73R3ULS5BktZMJ
MB38Fdd/wxNb7LrxXFNi6uOY/flKCwtpfNZoM0cknOVOlqLR0wYD1GnMNIYIWK9a
vjw8JxA5mIVRpl+pxl5e93KoGoCN8bN3x5OpsRhsvZRihZHG9U4kznmiCq5MxkRh
isSbRFEiltWwpAwI/r1SXOzW+ZZ1rw==
=FekA
-----END PGP SIGNATURE-----

--5a+Se7219/TOLYZo--
