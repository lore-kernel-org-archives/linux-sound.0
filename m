Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217D32F76D
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528437; cv=none; b=NSSgEfuD1g1BfGnxNvneh7SChfH+IzYngueP26cHcYgNTQhl9y7Ocq5ZIgOJ5H1BKgM11wr/QtTQTqdXgpKfat5zKzivo6fmZXRqKBSnHvB2SihwcmcXTdm/JuhGKDTzYQ5MpVNZmPhZFcqV8jXTCBpQKSHW0oJ4fI/oVR/oWAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528437; c=relaxed/simple;
	bh=1he6KgrHdojFgunxp0pp1XInrTa/sPDQxo+qWZxUn0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOpmt+c0wLpgvLyi39EwtJBdanngF2SHiQ7koCjW/KiDvjnRE+1ZoQ71WbuKxbOVuH6GDGUXLCu3ME131F5lrU4OiaMvk0twSQciu6GBpKCwu+z6htervjZ2uyGgeM0keisLefgd1FIQ6Cw5AQ/gYZDiyCslmWrPcK1k35A6cbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7qG7uti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7qG7uti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F46E1F00AC4;
	Fri, 31 Jul 2026 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528435;
	bh=cX2CbKe5Jn7Xqd4EwfiNwaaHcrCsnI4Wa5ACgDSAuHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O7qG7uti3WnAcmtJE4uJkWaqv7XppolUDYsQS5Zoq6QKG8zUc3sT/nQZWaU9hHxiA
	 g2IzORqNMsuvjjpI41i3Np5rIbbpny5I+CUpo9Ol99iQNbTkQiHNHrxMsQiDeB0B9r
	 JWkENTkUgsIagz+RFj/l/kd9UOhEmHES/yD6yFNu47ZQ/YCYZNTSKIN1vNzlqAW5m3
	 zkWGvfiWdMpCsj4Sa0vcyYAdY9+d0B5wNpgmnTSHwam5KaE6ba1dGuP2NcRBkfv4v6
	 jHjkl321oQpVC/xhjoqsKTT5Bp4PifJZkAkr/Ud42rNGnWhkIzeJ4DggKP9CGUQ6dg
	 lyMUMzmsZakhw==
Date: Fri, 31 Jul 2026 21:07:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
Message-ID: <819c2b3f-ccda-4bb6-beb4-4f17af81b651@sirena.org.uk>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
 <87ik5vswok.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r68qD0RSwnqdcS8V"
Content-Disposition: inline
In-Reply-To: <87ik5vswok.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: No shirt, no shoes, no service.


--r68qD0RSwnqdcS8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2026 at 02:46:35AM +0000, Kuninori Morimoto wrote:
> Migo-R / SIU are not compiled with COMPILE_TEST, and there is no defconfig
> which selects them. So it is easy to be overlooked for compile test and/or
> ASoC updating.

>  config SND_SIU_MIGOR
>  	tristate "SIU sound support on Migo-R"
> -	depends on SH_MIGOR && I2C && DMADEVICES
> +	depends on SUPERH || ARCH_RENESAS
> +	depends on (SH_MIGOR && SH_DMAE) || COMPILE_TEST
>  	select SND_SOC_SH4_SIU
>  	select SND_SOC_WM8978
>  	help

Doesn't this continue to need I2C for the CODEC, that's selected so
won't have it's own dependencies enforced?

--r68qD0RSwnqdcS8V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptAG8ACgkQJNaLcl1U
h9DQVAf9HlTS2jMlVJS4/XuOsPQyW0EQShwyEDcZV3E3fUR+DOVKaDMUNH5QhezU
kBVDx1qbHq8XXwFXk60LnfM4N8eEV76+4hzkL5OEmj/SuWKQkgFpvrkKzCXzM2Vq
qXG9XKtHXadEKnGsTrePBkdfZ22cj5ST6zpn4wb8wtO+VGtN6cguXaEvuwrIxK9t
JXvMd7HewM6NmsRtCkdtfvRg1SuRJ9VAAFeqkdD4DfACsbcHY3fA9ar52XQBegqr
kbnWKUy5OVAKzX7lAHadQhJ53nZJKGDCsPZc25FrU/JuCDJOHK4oE/2yHOOgLvr4
4B888twgRcl98m7k3a13hOfUZZVurA==
=CSh3
-----END PGP SIGNATURE-----

--r68qD0RSwnqdcS8V--
