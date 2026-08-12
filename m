Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F9423A80;
	Wed, 12 Aug 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529782; cv=none; b=BAoJgC27eChmoled4gYYvFBv6tMQp7s516H865Wjpuli7Nwdd+B0WLLQ+3ymrADe3rmbjLSfEDycBGoiElzULckphY9/kcyG8+7EN0X94pWDzX0AUo1srx8XaUQ+HDgHYeHlRp9juDL+Q1lrekZNLb7aX5cX/LKLz7uDY+Vn+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529782; c=relaxed/simple;
	bh=/WGf3b10YltXID+nIZciyhC1Vge6h+q9GY0sPrCo7SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffbmQ41+3G+YK6dQmxy9cIVG4eiexBy1BnU3g3oxMeeNa0nqK7L9AWID4hpamTbFf/7E5iFb/VUmXPd9aDAkQETjKw0UW05zkmplqF2b32Xvd597xAZ9LFcmEKdmBH+zB+p9hW0rUHa7jIoOJHsm7WTkQzIu1R/x+ntknhSC8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuCOjGE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuCOjGE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A971F00A3A;
	Wed, 12 Aug 2026 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529781;
	bh=ut+V3KseSh4eYJkusl95jQJnVPMpgE/trF8B0ZPWHAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuCOjGE+Y2AG5z0+og+zew/WtI2kYltgC1GUl3fgDc3L5B/Recish3bW/1pERzvYY
	 trzTUgwPngJ0A+5wTsHbHnXNjpllRAU+nvEPsfI+8AayglaXiM+8qTy579FZdRPUgg
	 EteBAPs4rnW9z+nzM8JtFh2E+30hryQ8R7bPEj12hatUp+U4D7ceNIfPS1hW3UEsKo
	 hIk2eWXcCjEaXZFnZqdgE6UNzE8WvjWBblpe/6h4dvfDKytDwuNxeiDQvMsxlEsPJO
	 I6BO6tKWDFlWbDnT7RiKG0YaM0ekh8L9lARnVu5oK6g0rV/IBxEfWVJHvSgbS1HrYX
	 8an52fF116axA==
Date: Wed, 12 Aug 2026 11:16:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <c22c308d-ce38-4327-a9d9-19ea995584e5@sirena.org.uk>
References: <20260811185013.26960-1-rosenp@gmail.com>
 <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+shNZ2aS8W/JL81"
Content-Disposition: inline
In-Reply-To: <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--/+shNZ2aS8W/JL81
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 07:58:23AM +0200, Michal Simek wrote:
>=20
>=20
> On 8/11/26 20:50, Rosen Penev wrote:
> > Use devm_clk_get_enabled() to let the clock be enabled automatically
> > and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> > clk_disable_unprepare() calls in probe and remove. As a result, move the
> > clk struct member into probe, which is the only place it's used.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--/+shNZ2aS8W/JL81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8R/AACgkQJNaLcl1U
h9B/6Qf9HATYH1keNl7jmNP54GvocXgMJ8FoZoYGeP5z5EYg19v1hrFQ9rXa/nFm
TOqwYItNcjlth2SskjOyN40TnNPiDVlk+HAyjqValGhriqANU86f3u1Z51237FCu
35W0hxDjE7MykqMKwS941dBD+Q3FOkGv0oE7gP5ktyPSYAUcys4zplr+e7STKsC+
U5kUbGSKHmLFALlNkbFLaYhVC3gJWMqNlEQ/Lc036i7lJWp6wlRgtIqd48aWac6+
My4ZqhEn3xhm23XZOMfXDyRvyNHXaamPl2Zf289LeQNcuJQL4QjhM3kc32+8SoQ1
0FaaqAX+V/Ew4uWrAUSo/U9W6jezlw==
=0u+6
-----END PGP SIGNATURE-----

--/+shNZ2aS8W/JL81--
