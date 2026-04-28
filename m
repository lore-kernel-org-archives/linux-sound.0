Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3C7E105
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777349842; cv=none; b=d7gIqUxo5WCaY2ovagwTFrOMIAzcpcH8PfBb3XqW+/92nvypN8mcpenqSt1JdG4FzBMH8QeRaZzHozk+mowILahDjRGEoUUGLKbVfOb0krZBidrLVotMZYpSKir3K+X0iQc9uIK0S+bDge0CWf8bc/BgPWNQ2MR4iY8ETo7lCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777349842; c=relaxed/simple;
	bh=FwX3Npo0IP8F2VHF8VkX56dxYoYNnBMkobhhBS/IoKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1SMrRBuDOLxD5Q6wLeKNnmgy/DYQJ79Rfi30gLHeOrStY7BUcXXxAAKe1RLg61kEeqRBoPmPuyN1Yg/9FXsn3tksrgP3+sP4gO8D9vrQLZ1cXg+H1rMsWiZLviV/6eApvMvLPo5ayE9bWbVHVoZl31lHJE47hkz1+JWUIFoNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccBgIQ5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccBgIQ5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E9DC2BCAF;
	Tue, 28 Apr 2026 04:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777349842;
	bh=FwX3Npo0IP8F2VHF8VkX56dxYoYNnBMkobhhBS/IoKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccBgIQ5g2DkgH7ieCDKa36IdHaydBzWrqDx+lxQTgSWmw9AxotLhrlk3W6LJZwppE
	 K1i6uvq4T6VQ2kuqAIn+SSE/TF+FsTftxSsom+hPBJpHc1DW4Gb7AWxHlClw2AxF3v
	 w/fKcnda2qDZGYs4incj0AhU310zG5jYTOw3pKvivq34RAaxtPY3jo5xAGukzMMKWq
	 XfjUoqxgvvU8c3fbKTWxm3nGfPRPJoNK9OUJJG7UkxFO+BCJQ9bS77FrQ+UYRwpXrU
	 jb5QS4MSFp97MNO45+Wd1lZUOSXayRn21l+UNRnc+4ylzcK+Jb8CEwWizp9GwZcq7W
	 0O2TLvJJ+69Tg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 75B341AC5840; Tue, 28 Apr 2026 05:17:19 +0100 (BST)
Date: Tue, 28 Apr 2026 13:17:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/2] ASoC: soc-dapm: move card->pop_time to
 soc-dapm.c
Message-ID: <afA0zyjvdWdXwAF9@sirena.co.uk>
References: <871pg6d19f.wl-kuninori.morimoto.gx@renesas.com>
 <87y0iebmo7.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UrLfytMb7SUW8hXO"
Content-Disposition: inline
In-Reply-To: <87y0iebmo7.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Victory uber allies!


--UrLfytMb7SUW8hXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 11:27:52PM +0000, Kuninori Morimoto wrote:

> +++ b/sound/soc/soc-core.c
> @@ -194,9 +194,7 @@ static void soc_init_card_debugfs(struct snd_soc_card=
 *card)
>  	card->debugfs_card_root =3D debugfs_create_dir(card->name,
>  						     snd_soc_debugfs_root);
> =20
> -	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
> -			   &card->pop_time);
> -
> +	snd_soc_dapm_debugfs_pop_time(snd_soc_debugfs_root);

This is still in the per-card registration so we'll try to create the
file every time a card is created - it should be done when we create
snd_soc_debugfs_root instead.

--UrLfytMb7SUW8hXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwNLgACgkQJNaLcl1U
h9BgRAf40MDsPErhn9mbrvan7Ykw4gHKDVoHWEKYqtJgoFGzZ7LoROep+XSQmzD6
4Adr+R5BRaEI4ZxPfu+71uxQgccrGbvnlMY5QcWkXDijR4WwZ+I2rlmcvtAy4WTa
8hB+n2DY3Wjyp4DFknSmjKhItBzxNPvjCFOc40/4fIt0GF6VB3aP48mbf12FgQYu
ipx8UDjBRT2pL+KDhWetegUzXRHWafxvrWynLXESmjLc/Z/M226kv/lLFCTztvIj
O2nWWDj50FNLE4D1mC4kqSbUe8iSvs843e477LpfT5HSQk9AVyie1blKptDQmCRr
chUtiLvFvG01hlBIeB45qXiMapEp
=he7/
-----END PGP SIGNATURE-----

--UrLfytMb7SUW8hXO--
