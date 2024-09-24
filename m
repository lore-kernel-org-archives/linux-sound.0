Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F851A724C;
	Tue, 24 Sep 2024 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177674; cv=none; b=N9Wy7NI2wqQd+USErKjmz4aTmSsBBevBJemPMQWfV1dNw7/EB3qiNQnryvE1yOsYQ4OIqqt2bClnB3PbBLV7dlbqLJ53ZeFENrjynVUKL4Z+7P546fZoOJmOVFCqyJRKO9/awNwDN2YYq82tLfE2uh50rpA4kUTbeBd/8WIH6io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177674; c=relaxed/simple;
	bh=rKs5/OSc6TyjTgwrhhTpYVqo6h9fokjAxNm6K24eta8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIhfSZQMw8+YaO3v6uLUw48v8yt4jOt2S8ZfzkGmQe+Bh94wHLb6aEbyRQw8ipRJpc6xNtJGYroLwbWQt/YL/Zxlex30rAEkOt7pUQdZziy38c2rhBuhXcVHoyeugWppvRdgdPDpfX+JD4wQpDEo0crlwqzkTbmgOEihfqb7Wdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT+qfoni; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT+qfoni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7986FC4CEC4;
	Tue, 24 Sep 2024 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727177674;
	bh=rKs5/OSc6TyjTgwrhhTpYVqo6h9fokjAxNm6K24eta8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HT+qfoniodsdsvA9tRVsn9P5BjNjM3VyrZoKTShpi5saHjINGVY1GzvkpAhIzgXth
	 YajRsmI4u1MTiDNOqYXpqhO2i/HltzbH+csHny4WmzR48Dm6J/34Gn/UOmBxA2dfln
	 S2RBYR4d2ELJfzoE7DcRldj8FUU6pHkgeaLpVv13jDVqXshcjd76s33RuufCU2o+qg
	 LVjKL74KQ71EYsacnX3BoUqI5Z9yE2YlBSkcu3z1Ly6hT7n5L1+p6i9h1nzjDBHPT/
	 Yeob+mwVCZq0J4TCS38c106VTLcO02qcQRHvauKdKn+fOVEziZUBLDpkQGWFYqMiJg
	 b3RG+9pXZizGQ==
Date: Tue, 24 Sep 2024 13:34:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
	claudiu.beznea@tuxon.dev, lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, nicolas.ferre@microchip.com,
	perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if
 substream runtime is uninitialized
Message-ID: <ZvKjwNiVIaPJRgCz@finisterre.sirena.org.uk>
References: <ZvJ_ZFpIiRpD_uzO@finisterre.sirena.org.uk>
 <20240924112542.78321-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OPMTtk5A+6W/AAfB"
Content-Disposition: inline
In-Reply-To: <20240924112542.78321-1-andrei.simion@microchip.com>
X-Cookie: Editing is a rewording activity.


--OPMTtk5A+6W/AAfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 02:25:44PM +0300, Andrei Simion wrote:
> On 24.09.2024 11:59, Mark Brown wrote:
> > On Tue, Sep 24, 2024 at 11:12:38AM +0300, Andrei Simion wrote:

> > This then means that control writes are just discarded which presumably
> > is going to upset things if they actually saved a value here.  Why is
> > that a good choice, rather than either fixing the race so the card
> > doesn't come up too early or removing the need for the runtime?

> Ok. I understand. My first intention was to follow the
> https://github.com/torvalds/linux/blob/master/sound/hda/hdmi_chmap.c#L794
> but after your point of view, I intend to return -EAGAIN in V2
> to specify the substream->runtime is not ready.

> I retested: configured pdmc, then reboot the board and the configuration:
> as a result the configuration kept.

> alsa-restore.service status success.

> Do you think this solution is enough?

Ah, I'm a little surprised that we baked retries like that into the API
but if userspace already understands that then that'd be fine.  Though
now I see that the HDA code already does what your existing patch does
I'm happy to just queue this version, HDA is so widely deployed that I'd
guess everything will DTRT and it's probably best to be consistent.
Sorry, I hadn't seen these nuances of the channel map interface before.

--OPMTtk5A+6W/AAfB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyo78ACgkQJNaLcl1U
h9DYOAf8Cc5jBlDbQKzbxYO70e7NQhNEihYy1ZOIKmGdXp0SzVHK6pbFgmOkEwAz
Ea7AERt3Vsuk/ALjjzZ9WNiyTf2NENQIz4+E4lA0VUL+iuKCxpxE5gtr0OnLi7Z/
1NZevWL6CNmAq6GjbTaqLCKd69fQxjTrmVeUrr6A+1rvG+E36/GG749RmtRonaRN
eP1qYv4aLBuuaD38eDViLg3spRSryqGe/EwRnxc2g8ntRKQll2/TFqXegJ/4mjyZ
B+KSZMKVQIlJ6z3rJDyt9nT1f7rRSPq8I2Ez/a8v13saoqzSK7k76nVR46Xlse9A
HaQJyY7wIsPr778y6ToS+POfwGlNbA==
=Ib8E
-----END PGP SIGNATURE-----

--OPMTtk5A+6W/AAfB--
