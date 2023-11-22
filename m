Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A931BDD6
	for <linux-sound@vger.kernel.org>; Wed, 22 Nov 2023 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7Si9alC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62E1C433C9;
	Wed, 22 Nov 2023 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700654831;
	bh=FgOpIzOkt0J5Z8tPaNlDWaJw0YU3y8AkRtllfRJfNGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7Si9alCKqN80zIFIOgOua+WLimk1dTCXEiKFifealPGQPddSc0E1r8Ccj/kV857X
	 Ztkpqbz/FAtumHCtrYC8DzfirPDp3pLghDbdjPr33N01RcXHPH3H7UUksbCQyebl49
	 xACEubE4zwvT/jblBO1dS01JhdxlHd/4r5Vm9lpI4svDQRuwCDyTRpUWIfanIPVm69
	 kcY4symh75xohuHzCZTUODbF2s0D7KtPfwnDJeHmtgnedef9GE0F0U7SF2D1moNCJy
	 8DepkPXC3MD46QD2FNPNXVgj36fwFdTI8WWezGmNjqJTNj8roXHeFGzs9W6tzeI9hb
	 V4C51Mv2iMUQA==
Date: Wed, 22 Nov 2023 12:07:07 +0000
From: Mark Brown <broonie@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 29/39] ASoC: ep93xx: Drop legacy DMA support
Message-ID: <ZV3u6/awTLMF56RB@finisterre.sirena.org.uk>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-29-d59a76d5df29@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4/hYSGfAD8LteuZ"
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-29-d59a76d5df29@maquefel.me>
X-Cookie: Slow day.  Practice crawling.


--y4/hYSGfAD8LteuZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:00:07PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> And rely on OF DMA.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--y4/hYSGfAD8LteuZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVd7uoACgkQJNaLcl1U
h9Bnjgf+Ks8h4hRMIeznb3b40XFU5GjSwLBqJXdTYsRpmrWFf8XPpCn5ZB1Tj2h7
vnfuPeefiecLtGK+9TqlhsgmGxZdwkARIEhfAobCINiHsgVPEXg6PiEW5RovS1L7
SiwJ15K+VE8PwRIrsMAx/lf0Y//YehIXQbbi1kvCcmZ54uY5FxRiUADs5ZDFY1Zg
za6Ru6qtMfpvxpNSJpi6J5v1bUEgeM62CelT7MejyRfw8/JanKmMjS5ZRfi7zQMD
jZI403ejsx4Gke3q5c6cJM34I97pwmWQCC/hgUU2kQ5NiFmF8To1Qp6KEL4Pi6kZ
m+aXz10SZA31YciX5e+dhkUWbfebTQ==
=BU4x
-----END PGP SIGNATURE-----

--y4/hYSGfAD8LteuZ--
