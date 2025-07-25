Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C39475;
	Fri, 25 Jul 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753450401; cv=none; b=K8rmMl2LTx4uFWRw4gE9d2HJO/BNInxJUjjU+khXGLPnDW5w3aXVNvrW0CjTHDlQL/mimR8m4Za3jFpScef4gUar2HmwRwfG77fyMnEyQpglhOC7n1lRZ9Mw1zY6PyDJLt7zbidB/FZFMIjoTaDbAL9pMlcED+I5wcs5zeZ0eDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753450401; c=relaxed/simple;
	bh=4sLg+EgwqWBjfXcv702Eo7YeTtmXUWeXtD0WMZD6lzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fThT4qp77EFQ7sTzW8fFULIrzbYu7zNONqps+sg7Ks892RnzMpTNcbYfIVfL4OiS1Zb1Bl4OsweevhmYutD1usyGK8Fs9cy2wgu37xDRD3Bn+47LgfwuJ5jzv0APbNwIB94zFziYwDoDvDdJg4SBBGxgwOkBw7jnx/3+9CDZR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfG8J1ZY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfG8J1ZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26014C4CEE7;
	Fri, 25 Jul 2025 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753450401;
	bh=4sLg+EgwqWBjfXcv702Eo7YeTtmXUWeXtD0WMZD6lzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfG8J1ZYge9rQfMdIjnNWaiO2gfQrQ9IsCXlFsd+wJxDFqlCdMscUUU1gbGVSHyl0
	 GqfLYocX+kvZVztkDqYHHFi35cn24idMgUKn0vOVJrWgQlVKuVpINp6q8YB+Xq3K17
	 r8JeUMVzjEDu+cVzXGKeiKKX7e6Y4tbG59TdqFuMqpbSqIbphFdUWR9EvEGnjH+N4L
	 b+GuY5xLdirFG0sYXkU65PvNGApRYi/L/uXp/VrgYTNFyfQEMNNGvsb0FCSqcblL5w
	 L4pgP6iKPDE/bYi8jcmFs64TiZPxTzxf3o6jbqAV5/kEfng0xpesMOVRgOv5wvhhlg
	 2VzEtkscE3njg==
Date: Fri, 25 Jul 2025 14:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shuah@kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [Guidance Request] LFX Mentee looking to contribute to ASoC / DT
Message-ID: <aIOHm4AOrhHBf6Xv@finisterre.sirena.org.uk>
References: <CANBuOYpLNAtLVWBvR9E74Ju4cM1K7H_bS2Z_UhthQFrJaZXmiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lMv1BgC/185tsbyF"
Content-Disposition: inline
In-Reply-To: <CANBuOYpLNAtLVWBvR9E74Ju4cM1K7H_bS2Z_UhthQFrJaZXmiQ@mail.gmail.com>
X-Cookie: Do not cut switchbacks.


--lMv1BgC/185tsbyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2025 at 12:50:15AM +0200, Jihed Chaibi wrote:

> My name is Jihed Chaibi. I am currently a mentee in the Linux
> Foundation Mentorship Program, working with Shuah Khan.

> With a professional background in embedded systems and a strong
> personal interest in audio that extends to my own projects, the ASoC
> subsystem seems like the perfect place to blend these two passions.
> I'm eager to apply my experience with hardware bring-up and Device
> Trees by becoming an active contributor.

That's great.  To be honest it sounds like you're already very up to
speed so I'm not sure I'm going to have anything here that isn't pretty
generic.

> As I look to deepen my involvement, I am writing to seek advice on
> where I can best apply my efforts. I'm particularly interested in
> finding a substantive task where my skills would be a good fit, such
> as:

>     - Enabling audio support for a new board using Device Trees.
>     - Assisting with bug fixes or small feature additions in the ASoC C drivers.
>     - Tackling items from the TODO list where my DT experience would
> be applicable.
>     - Helping with other driver enhancements or cleanups within the
> ASoC framework.

> Any guidance on finding a suitable project would be highly appreciated!

One big thing with embedded stuff like this is hardware access to test -
an awful lot of stuff is going to be hard to work on just purely with
software.  Given that it's probably useful to take a look at what
systems you have or can readily get hold of and then consider what
problems they have that might be good to work on - things like board
enablement would be an obvious example there, and it's common that
boards have some support but pretty basic so there's useful things can
be done extending that (eg, leaving a lot of features unused and just
supporting basic playback/capture).  Knowing what you've got to hand
would make it a lot easier to suggest concrete ideas.

It's worth noting that a lot of x86 laptops these days are ASoC based,
their SoCs are built in the same way as mobile SoCs, so might be worth
considering those too.

--lMv1BgC/185tsbyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDh5cACgkQJNaLcl1U
h9CWQQf7B2QcAHti/sJu183O5pFVKe9roafrx7nvoXYFFdIEWb+3yyhESKB3w2wM
tBxB1/aJ6lBIMq3gDpCM3ZlHWP+qEbMtE97b+HseeRtRWxyN3OfaqMYbnVUxDpEz
jqHDtaGZLz6q71XiJ4y1JDwBMZodBsbxhDbuQbFItHJpud+HsqGIraWaQlmtaW04
gIScLb+lW0ULXFrzA2OHPiw5CD2qZmVRkiiP5XhiEq2Qx82EQJygaTr8LZd6raLu
zjuwdHP+uR2VFLBqCUFvGeoeIn8BFgRIg6qBv+Gum7UR+/uIRHpenE4x1FSP/AQ1
eAq3HlVxaVckvDhrsgRaQQ4P45w3kA==
=Ra9K
-----END PGP SIGNATURE-----

--lMv1BgC/185tsbyF--
