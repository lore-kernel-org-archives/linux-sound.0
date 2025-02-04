Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B83C78F4C
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675851; cv=none; b=GJ1extr7qD8RBcm4AwmZgvLJ0wOr2GTGi+pns9ILGj7ERu5lwdOsrKgcFGbNtxGZolpPr8hPPaq2fZnIKZw0HX/7zLl81eIrdAKZFc6dYzH0hCIeGv5UH/ith0ZhFtvwK9Zix9/sjbk21OWPTpUD5SeTuwqOfKrgcVm1qWGfzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675851; c=relaxed/simple;
	bh=2AoMVGHk8NxZebojJ8CFLXoGVcJtcJBv/ONCUU9GsSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW7ltuP19lE24N5JEDBz8ZsZg/CWLoUME7gBEurFHXOo7w17Vi61e53OtiQgfdDsGn7ZBFlDreeFY1VtgUWzdgoS/RsfoVeC8chUVCcFx7rUTjj/wnx93UldTttJSdibl3SrllrSnXt5Rq1TMBuodYXLrmMTmNjYsmDUBcG5gaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksSdeFhw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksSdeFhw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F8FC4CEDF;
	Tue,  4 Feb 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738675851;
	bh=2AoMVGHk8NxZebojJ8CFLXoGVcJtcJBv/ONCUU9GsSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksSdeFhwFept7vpVOnLfJGQvBMQZmhKnxkZdkwCy2tkyHw7rLMuVa770N3+Vz4foI
	 hOB275C9RSsjQZwRIr1uFnzLnWQnprmAoFaIQnQAk18zNKEnei++IUGVaVtYxkw+mW
	 WjIGcjKH8QG+KN745qT+gBos70/nURtalV9zUbxIMRZZ74Q5uWM+/fzUZZUCCez2Iy
	 Y80KQb5lqWi75xEJhnztf3w5gxvu5A97wNvtF/UtndMNKopiH02CNOAw7kblIHWqd5
	 6eJyPwSSsOX0Cy13JhLjvE8kLHeqv7vZb8EYvHUof6Yq4SDK7GWuMGjyhzcjoMwcPY
	 9am/tvVcjNX/Q==
Date: Tue, 4 Feb 2025 13:30:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils.c: add missing dlc->of_node
Message-ID: <5e9c2107-d906-487c-84b6-bdb1a00fa3b3@sirena.org.uk>
References: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rxVIrusgPU8cmdAb"
Content-Disposition: inline
In-Reply-To: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Spelling is a lossed art.


--rxVIrusgPU8cmdAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 05:37:09AM +0000, Kuninori Morimoto wrote:

> commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
> support") added muiti Component support, but was missing to add
> dlc->of_node. Because of it, Sound device list will indicates strange
> name if it was DPCM connection and driver supports dai->driver->dai_args,
> like below

This is in mainline but your patch doesn't seem to apply on top of -rc1,
could you check and resend please?

--rxVIrusgPU8cmdAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiFocACgkQJNaLcl1U
h9Dyiwf/W0e/xZFLRtZzO7VoKTmaGZFs3+GYgFc2HVIXyWMFjSvows84ya3LmjF0
bhnjmkuERCTw4WdvafwGALs08Fj3/GdEI9kDZuc3AL4eCE30FM85ygtdSxDxI8QZ
gX3Dxkcw6hzx6Ys12x04c4L2tsMVFc0ux4b1havlEr221Ok8rQb2qcSBcv9rsClW
BOSWw2iuqiZJWQN5qa8fmNb4E1Uop1fc7b/bbvYWBPgFYk8syLk2ITiEnkfs65z/
Q1dcykfSVHbNXcHVkRDXCPHSPu6q9HQZkvuMiqzP35VCKsYt3+DC1vyvIC99EKWE
cT0hvahkCDwTpQB4w4HPA82opYrk0w==
=Z6sU
-----END PGP SIGNATURE-----

--rxVIrusgPU8cmdAb--
