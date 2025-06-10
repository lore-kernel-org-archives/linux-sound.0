Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89AF28DF31
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553650; cv=none; b=SmqrRbLdI5FFgsWhKYI1xi9wfQ/X4IHZ/42PN6RHBwP7oPR6EDxoRFgKN5US1L5N/m0NtiZTy+GU5mr8JMuA0Tdn7MHVGFzwV+BBNoBogOzrGZWHtXWOKKKn4sH5i54AFSJS+PyacEyEX0v3UqX1nsStKd8DwNKJ05APN6z7AWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553650; c=relaxed/simple;
	bh=KAoR+QN7px6dyei0VHqt89GBZ/MkJNq9lkU/+wlJmak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjsZbdDppMqVTDZE4VoJBozSrr44/vOOS/R6O18GbWSUoYU9AO1Barwek5ok34+7XME06S7Mflq5r9cAfu9pqa84FmtcjJH5xaJ8JN9frnsLt7uukEsnOcjJ1NeeMV7EKioaju9R9tnZvsfVLyIvnvCjtcwYIKxt6BHTPXAPgzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REyHj9WV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REyHj9WV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADB4C4CEF2;
	Tue, 10 Jun 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749553650;
	bh=KAoR+QN7px6dyei0VHqt89GBZ/MkJNq9lkU/+wlJmak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REyHj9WVl4QC2CeT3hKv41sj1r6i1wpv9WXv9hxW7XQsmLFBQXvJ1pNqumu6P5t/U
	 +aquIkA3WPf5b91CFedzlFikyA0uNsSxnD3hd68Y8rjtj9rhxm/A1A7i4s3kxtXNSh
	 Gn9tjR/pBg8qDMWgXo5nPyDezah0RRNpE/sOSGb9+4rvD8CxkUFHP4EZjCJUY1Lm2J
	 KIHyVDn+XXzXjLLv1qibgNLswi5KH/SyifTq1uhuuZxBCaHi/5sw+NFCnbVGCJaBEE
	 EKZPrfnUaG0xeiOh3RWhni0R9/Db6cWWkxMEqxnF3Xw0QP3AtdrQI7mxmsbCPDD4e+
	 FKdVAY+Jt0WCw==
Date: Tue, 10 Jun 2025 12:07:26 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
Message-ID: <cbef2f84-9f83-4cf0-87b3-39173099d136@sirena.org.uk>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tMn8b1uIOeqCpMgA"
Content-Disposition: inline
In-Reply-To: <5835adae-5dc6-4896-ae04-690ac6893f02@linux.intel.com>
X-Cookie: When in doubt, follow your heart.


--tMn8b1uIOeqCpMgA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:51:41AM +0300, P=E9ter Ujfalusi wrote:

> This is how the menu looks like after applying this series on x64:

> --- ALSA for SoC audio support
>       ASoC support for Analog Devices  --->
>       ASoC support for AMD  --->
>       ASoC support for Apple  ----
>       ASoC support for Atmel  --->
>       ASoC support for Au1x  ----

> We have quite menu empty sub-menus, partially because they would include
> something which would not be select-able in this arch (Apple, Au1x, etc)
> and things that does not even have select-able options (SoundWire things
> for example).

It'd be good if we could hide those, indeed.

> I personally would prefer to keep the 'Sound Open Firmware Support' as
> it was, probably moved above the CODEC drivers. SOF is more like a small
> subsystem within ASoC and the stack supports various vendors (Intel,
> NXP, AMD, Mediatek atm).

> The other awkward thing with this change (which was awkward before, but
> going to be double awkwarded) is that the Intel Machine drivers will be
> quite detached from SOF, not visible of hinted that they are now under
> "ASoC support for Intel"

That does make things in line with other platforms, though (as you
mention later).  The issue I guess is to an extent that people might not
know that SOF is important for a given platform, prehaps it should be
selected by platforms that need it similarly to what we do with CODEC
drivers?

> The other thing which made me wonder is the 'ASoC support for' repeated,
> would not be simpler:

> --- ALSA for SoC audio support
>       Analog Devices  --->
>       AMD  --->
>       Apple  ----
> ...

> The title already tells that this menu is for ASoC.

I don't have a strong opinion on that one.

--tMn8b1uIOeqCpMgA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIEe0ACgkQJNaLcl1U
h9AE8gf/QbTimVOgjW2O0K/bdKDj0hFnKpCf41LeLFsnO53lEtvJaVzPRukr6MrH
2OxjrG135nEGAblSPymYR4RUN/Goqafx9L/0Afw0J9xQLhSJCi+Oc/UHn95ochu3
2pS6RqNW8e9EFlnEbpE/AsLS/Y8fFHJ68IKuS1m/E6w6ujCBiC2+v7+sYJ1hYXFU
oaRi8HDVX5QPI9mTwJ8kIe7JtvsSAB4sYOw0yqDsJtCD2ycaL79akn2OdEtzFs/D
kNWPlvLdOfd2Mf2L0JL/UGXHUbwRusz+CrX0fdAMBbhi4nzwMsxv4oLyJ6RhmqPA
L1gmeyY1i+jst5g1nV47hviu4niG/Q==
=Qvjk
-----END PGP SIGNATURE-----

--tMn8b1uIOeqCpMgA--
