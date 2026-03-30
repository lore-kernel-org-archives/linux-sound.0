Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A82377016;
	Mon, 30 Mar 2026 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891377; cv=none; b=P/dXjGFAKhIjSJNdYMlFjfvW2ssybU2jmBdvWoTnDo0tqiJ8cgcyViT+BKtkwVy+Hngbz12hXe2TG/L70NPumMMgaNopHsw5XWRr8kRDdC/j5tdWUl1ubPx2eGcd3FnXJykmOKQedeDzBEoLIukS/aaX8/mE9xRBI/4+v5PgyiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891377; c=relaxed/simple;
	bh=WhxrWyvGYeN2Z/akOkjnLPhumA8J3ehMg5o0iafmK8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsfkYiSlHz5SWGe8trRFMx6OqRKjC8C51je3/nWq2WCCkEDrXC92OfZokpzWFbGvzpFlPCh0/epGIODJw2A/yRu+8oDDQZ9o/DJ8Yf9E/cqq5bAjkIEtkX1q/3u+SWcgOWK2WU5ZZjEd2JnjIg6wc90kmuUR/gCHHLqCLxoWVHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxVz6abq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxVz6abq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEC8C4CEF7;
	Mon, 30 Mar 2026 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774891376;
	bh=WhxrWyvGYeN2Z/akOkjnLPhumA8J3ehMg5o0iafmK8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxVz6abqFAmNnV0xVHAnxosYj6lDiurYFj2MpEpTgnq7gMS+clDPPzWGebZ9hoPK7
	 l95qH+3tTrYob/75bupsMC+c1RtIellmWTzfRnf2YkDQlcNpggsJwWh7fIqYwr/c+3
	 iszjz/2y1xUxM2bSbKDWCNTzVmqneLa2bQ2Jg+fuW7C+iVf7FbzMJL+3aKBxUf6t1I
	 gPzj3IuvpmWzHUbGdqPJY25v1dNDPsOI+AymVu8r7f+Ls3JAyoizu0NKwKhrNzrSwj
	 N1MK+Vo+JwsFgn5Ij/Kaa5Uzc2pG5KZgL7RJeARlIEEHyLu0qU7yYt0Uz4wi587UUz
	 nXckbrveM0bCA==
Date: Mon, 30 Mar 2026 18:22:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
 <aalV5dBloD1BmwzZ@linaro.org>
 <acqvm25ap4LTSB8j@rdacayan>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqLoTX8rz4gZM6PL"
Content-Disposition: inline
In-Reply-To: <acqvm25ap4LTSB8j@rdacayan>
X-Cookie: HUGH BEAUMONT died in 1982!!


--dqLoTX8rz4gZM6PL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2026 at 01:15:07PM -0400, Richard Acayan wrote:

> It looks like the codec part is mostly complete except for some trivial

There were missing signoffs so I'd be surprised if anyone had reviewed
this, I certainly didn't.  Looking at the thread I for this version
there's a bunch of high level negative review comments that you have so
far as I can tell ignored.

> changes (empty line after compatibles in dt-bindings, constant to use
> BIT(n) macro). I can take the codec patches if it's okay with the other
> submitters:

Given that it looks like the series consists entirely of ASoC changes
I'd be *really* surprised to see it going via another tree.

--dqLoTX8rz4gZM6PL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKsWkACgkQJNaLcl1U
h9DvhQf/Ye/xkAPq3i8x9/xixK0WK1XcHPCvag4gJqcwem1Io99PaNzChVytwVBP
SlvNkqssHrR+wB2NGs0KxnetYuaQvm3L+MQqLb41a+Gv4wVA4kFAYApn5ndEv+lP
tOEaHhoXmlHDx7z1vek6ub1u/CF5DhFeg4pwB2tqwdkq609bqNrA6iSNaP3sMk+b
Z0gAS2ipakokudM0ddC/8alKNL4EEVRL6sO0/BPaLuNTINQOH3MC23EhEE2zJcAe
jye6j/hwkksjPRZuQeYj95VhPoxEnU6XoANyYhFXuBOrkohxWZ9VX3Z87Nwqflel
whFSg5P9WKrxh3dZkx8UB3wEC2cK6A==
=pdpo
-----END PGP SIGNATURE-----

--dqLoTX8rz4gZM6PL--
