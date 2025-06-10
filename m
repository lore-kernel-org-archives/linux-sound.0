Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55276223DC4
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558406; cv=none; b=Yehg28yLiClyrhXqLkiRVO8VV4B8WGGdqotGQnkon0RdbCkIIhbfwDHY0r6JjO9ctKwZS9y50IAUlDZtfqB9CzEs3OntzXP8H1mCNF8q4QwylqFyHcp2QoOdA5INhvAQ9bM+vahbc47lCzqG0Yh1goT8QQ6C7YgEDQsoZCXVgCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558406; c=relaxed/simple;
	bh=ogZDEZ6ApZ9ncDB706+LR/kyQPRoa3NaYcBXysQTpZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLD9ywlsZiPFn72DjIkgLWvbH8eg/s/lKdy650d8OJ65hHrRgB7ynpt8shHl8jFGXyfcPPLtNWPXEVKwAIxFv22QVVKNwzTTpBvBIgwUE1QCqYQDESX/Wrm0LIFxWauJsBpzuYiw+uVqHs3e2jC9OsHtFaqcRJBCxvg1Q8z2XHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adzdqbrk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adzdqbrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4E5C4CEF2;
	Tue, 10 Jun 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749558406;
	bh=ogZDEZ6ApZ9ncDB706+LR/kyQPRoa3NaYcBXysQTpZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adzdqbrkUJHneo7YZcAhBpYyLf2Dlffs/TyEUDF4OexRNuujHuOpBtsWTGlPH7Srg
	 XXQtye7B7qMwz1R/B9amOP5scmJ5l002FoyxW7a/nfzFxxP4Xsj8p7qqwuuXKGmmw/
	 7bmF5UKCtkzAhV7sPwAET718plUo9NKjtQJ9xn1g8vMSz+TMqEhLz/5mctREfhxhGZ
	 rOcKMqOXpDiDWQqLY1c5dxI1sOayq128k0sTyNGf4jWjj2XdFC2vtgmiuhXm3tLK/t
	 F6liX5fyMYBp1Wh52nxjOexPJ8c5Lm34pGb2cUV6h0C/I3l5flGgrDn8wKQUcZ+jc+
	 ftlKydDyucijA==
Date: Tue, 10 Jun 2025 13:26:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add some initial IRQ handlers
Message-ID: <6c1d909c-9617-4f1b-a158-6676fe27475e@sirena.org.uk>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
 <20250609123936.292827-8-ckeepax@opensource.cirrus.com>
 <283bafe1-136d-46f4-a83b-7467d0344fd4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qRHh/xVxb1DrN6Ij"
Content-Disposition: inline
In-Reply-To: <283bafe1-136d-46f4-a83b-7467d0344fd4@linux.dev>
X-Cookie: When in doubt, follow your heart.


--qRHh/xVxb1DrN6Ij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 10, 2025 at 11:07:00AM +0200, Pierre-Louis Bossart wrote:

> > +static irqreturn_t function_status_handler(int irq, void *data)
> > +{

> > +	ret = regmap_read(interrupt->component->regmap, reg, &val);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to read function status: %d\n", ret);
> > +		return IRQ_NONE;

> usually when a read fails, the entire device is in the weeds. Not sure squelching the interrupts is wise, something more drastic should happen.

It's the correct response in terms of returning from the interrupt
handler at least, it tells genirq that we weren't able to handle the
interrupt.  If it's a level triggered interrupt (or otherwise keeps
firing without being handled) then it'll eventually get shut off by the
core.  We could potentially do some Soundwire thing to try to kick
things into life, though it might be better to punt that to a higher
layer.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--qRHh/xVxb1DrN6Ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIJIEACgkQJNaLcl1U
h9A2Hgf/erzFqSrOqQEM69UH7S0EQIY+VzjnY/H5R+d7MTJyhN74cc0a4/nRE9EZ
Mb+VKJAlo9R75vp2AaKJ1/ptZJSejjvCmnqKXmwxFKcOnSXlYAapoQX7WYtV7UW8
+nLrrkitdG9vYP24wb079jtiHOVQEwQnCrQcQ907QFQ8mzG7f4gEG6Ga5U/ZJu+i
Znm1+8vIxNIl4CW3fr8zOLc+bdmiw+TjG5WGdjghM3iUt055LUXuNqAEglsIEw93
USw27shFrhftQ2afIHWHyHNdIYNjJRlZMtLs5Sz8BoHTVopLXQiHvAH+KfUr6MYn
SFRt6P5v4FGYK7RzcIkxzHZvW6fm3A==
=vVbR
-----END PGP SIGNATURE-----

--qRHh/xVxb1DrN6Ij--
