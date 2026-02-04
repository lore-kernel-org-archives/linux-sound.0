Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53D03A8FEE
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207045; cv=none; b=eJL8O6ARPWVSCpgoKEFtxXQkcKHdwrP/ZWK9WxCqgBzEwJGtteKW3l6s186zvzmOXPT7c/rba7wtGp3JxHXjHFgU7Xgv7LykoqpLAOy++vUf0GDb1F/TV07Mieg/u2MuQo9QmIWkMyLritb45gxHGcbtt5Ix78RQ9f2CTGTq2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207045; c=relaxed/simple;
	bh=6tHrjd+pnIA6C6je4B+ZQych6nrPGC1XdxGzGUDhdSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3q3LfX4f9mQjEWfAnw4esLc0yZNGaKtb4l2vGSnEzf/+/8F2JC5OW68Zcgk6mSRJmFSD3wdcf8j1r/HLBFZAUGjlUYENRlSTnQoWdrVKm9+sJqDaCSdfrZ94hlMwMXz7Tjf52bJnvXF3JouqCo1uk1ntWml1emyw/+tt6HXvoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcTFkbYt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcTFkbYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B19C4CEF7;
	Wed,  4 Feb 2026 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770207045;
	bh=6tHrjd+pnIA6C6je4B+ZQych6nrPGC1XdxGzGUDhdSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KcTFkbYtgMlb3dziccFlYR/xWMUfZAiTtZAdwA8LpQQRV8AGYSJ7mDZUW35YGrb8j
	 T5G+Wv8edHTSzpNFB7KrvWJULxgmu8jFqBBcPi8EbVxSQshMTYey2sHvqm6XxbVG8+
	 QMt8u2ewXnF7FFxvmh4YhxQuUH7QXf8uZhvsQn20X0Z1MATlqqtBH2QoAskNSJzEnw
	 LcBgciBUH0TwLxD7zCtzsyWXQdzMW2Z4RARiyOx7oBwYHbk2bbz/LcSctn3VKVoafU
	 2W81fvHDs7ZPkjrC4In84JhgIrLlXc0oOY1sE0gzgI6HgN0WGgO/AE+35HCU4wf/6F
	 LicS4Kx3O7TZw==
Date: Wed, 4 Feb 2026 12:10:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <d122b672-468c-4122-aa46-5dad427b7a7c@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
 <b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
 <45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
 <877bssopsk.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/fQ8ONvNcMyvfvu9"
Content-Disposition: inline
In-Reply-To: <877bssopsk.wl-tiwai@suse.de>
X-Cookie: Are you having fun yet?


--/fQ8ONvNcMyvfvu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 09:50:51AM +0100, Takashi Iwai wrote:

> Basically it should be relatively easy to implement a mechanism to
> make kcontrols invisible, though; e.g. by introducing a new kcontrol
> flag like SNDRV_CTL_ELEM_ACCESS_INVISIBLE, and some machine drivers or
> codec drivers may set it up depending on the demands.

We already have some support for marking controls as not visible by
default IIRC (I'm not immediately remembering the term that was used),
the trick is more finding a sensible way to turn it on - with so few
custom machine drivers these days it's much harder to enable sensibly.

> But justification to do that would become rather a bigger question.

Yes, the case where we know that what the control covers never has a
useful signal going through it is easy but people want more.

--/fQ8ONvNcMyvfvu9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDN0AACgkQJNaLcl1U
h9D58wf/Vqj8lJnpIMFAJstGop+nee1xtAlmvXGeXLuvNeM0wAwdp691u4ua1VAw
Hj5rwttCy3b8x6i0tsIr17mEvnyhPt41wi1iIIFtkEssEpcHlmRW9QcoxHHFDiUT
K84mxmi+Wu0F+1V+HoL+BICQ+yHPbjXdNWBg5iIx/WJztTGudyqHEo+u8YjO9Kt5
1jk55i8451u+wwQSRvSQlxzfpZnpXDkyzGWCPPDpqJIdcVUIuZZUwsNUrxRt6ziy
eszMbN43FRtetRBi6Lfmi+y0CRJR+IkiTR5QR50nBF38Y4W9Hz0Z5IJSpuj3bYYR
YEMVOFYIzxA9c9rZy/osos+JT3h1VQ==
=BZM0
-----END PGP SIGNATURE-----

--/fQ8ONvNcMyvfvu9--
