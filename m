Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BC920E309
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366984; cv=none; b=az4EnwE3Rn3Y773A3g2+Hweu7M/C7NpUEEwmGJ7abksoDPgWid++ahQBmlF3x9gfFz0X8kTuoZcokV1uwvFB3yIvem6/xDoeortmaIJ96LtytyPQw1jZCzyt2NvoI6zwUVkZDwYzRJ8K2SEUnCGBVtclm8XNv+eS7C5xmpupz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366984; c=relaxed/simple;
	bh=hgigH80BHSZscTjjz995OOOoeaJ4ySIGVZLCjEBrBdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dfd5USkWnH7lSty+OhRpG1pAAOY72/bisGm22vuXxDwG0I4/OL/87+nV5zb4HHNOxTkvpZ1flLU0RRFCnrtT3VIRz+jx+WbikFwxGQMvCrATbW4xwnz5620hUz6VRYK1Fr0VzuObTmOFH02xru05SYKy/hjhXHOllUFX/zAAXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoxqTxT5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoxqTxT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8081C4CEDF;
	Wed, 12 Feb 2025 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739366983;
	bh=hgigH80BHSZscTjjz995OOOoeaJ4ySIGVZLCjEBrBdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoxqTxT5yjsTNjacZTCTY203YwJypzHTUyjkFU0EsU5/0ZC2Psd2oRvJWxx6l0CW7
	 +KQ3xiI9VZG6/R0IONxl2h82bkEU6czKvi+9TuQiQsls7SB69k82/hjKkgOXv5WFW2
	 9QxqOsuAZwMjhInJ/bP0ADmftN1c0pIrdH6tyTX+/omX7s+aG59gMIh3UG1QO+GZso
	 2T2BuZ5J+Mg6pkjuQBCy+H6hBM9SrSDM7FaKzjtnsr2Wi0oAuhs+vhhfTazQ8PaKwO
	 UYeTahHp9t72Dp8BRQhLd0L9P/ROqg4MhhEqHCpGnCqyvoXz/2ySHmYhkGuva0TF/Q
	 lim73KDPc4neA==
Date: Wed, 12 Feb 2025 13:29:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/12] ASoC: soc-core: line cleanup on snd_soc_bind_card()
Message-ID: <3005f200-3e1a-4836-ad45-46b13085e36d@sirena.org.uk>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
 <87r043yk6e.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bTxay6QfPiowxXfu"
Content-Disposition: inline
In-Reply-To: <87r043yk6e.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Reality does not exist -- yet.


--bTxay6QfPiowxXfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2025 at 02:24:25AM +0000, Kuninori Morimoto wrote:
> We can use 100 char in 1 line. Let's cleanup code.

> -	soc_setup_card_name(card, card->snd_card->shortname,
> -			    card->name, NULL);
> -	soc_setup_card_name(card, card->snd_card->longname,
> -			    card->long_name, card->name);
> -	soc_setup_card_name(card, card->snd_card->driver,
> -			    card->driver_name, card->name);
> +	soc_setup_card_name(card, card->snd_card->shortname,	card->name,		NULL);
> +	soc_setup_card_name(card, card->snd_card->longname,	card->long_name,	card->name);
> +	soc_setup_card_name(card, card->snd_card->driver,	card->driver_name,	card->name);

We *can* but not everyone uses such wide editor windows so it's not
exactly a goal, more just something we can do flexibly if it makes sense.

--bTxay6QfPiowxXfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmesokMACgkQJNaLcl1U
h9BEWQf/WvbvGKenZbAayg08d21E+59fnCg1ETkuOOAaKvc0uwh+9gyvS4CvWOaD
9O0kv4w6m3t8PU5JW0SfqL3CFUStEaE/Rc7zj9foUPs+0lLchoJnBu/Xe+JbO92f
5ONYmX0Jf+YuoHgHGJgv/zjNgflbm6nUv7Vxp7s1LhxBP8bnQL0lv33OxuKjYLlF
Ix/uZD/7F7HiaX6K7lwCEnBfqoRZFMI6csMT0CkAXebwOofEOWO6UUFRsyh0mXd9
AmVNOcQj0MUF7KK04I3PFVT1QessSq8WUhZL/oHrnlx8QPWtX7CcfWfDNH8aMgi+
n5d2Ig6vKAs3wGmRRVjHLmJERMF64g==
=FTx6
-----END PGP SIGNATURE-----

--bTxay6QfPiowxXfu--
