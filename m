Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424643DC4A5
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861325; cv=none; b=htZgyz42PDrw7LQkgAegTFgcC9klLB/ZtoW7U8ai9LHYqRvvStNMW2i4Yj892kXmQOUIBmPGRlfUS73lOKlibE2mLwwQ+w4n3bxE0/W1iM4/+lJzh7Rlth60PMR/i0/PdIL3TLpMaUtVfDWdLiLfV9tEqyzFiCnEcbBWDTcAq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861325; c=relaxed/simple;
	bh=Hebuwg65VU4UfEVMuu6iRAehj7gFFM2ZngBpIFItMEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chSGO/uhR2GKF4/UOb1EuZd+S54rFptX10nvKCZ0Zi1tu9NvI9yqkJwFIjx7O4UD9uPSggFAUGgXXdiO22X7XDYme9ELYfU+Rjs4fl7+7Jr9p0dmoNxzy1oqEMaXMgXB4xWfayncQpQOShMbnKvf7l9Qjeti5jX+Sn0nwpfbTJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSYbITyt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSYbITyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC05C19425;
	Wed, 22 Apr 2026 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776861324;
	bh=Hebuwg65VU4UfEVMuu6iRAehj7gFFM2ZngBpIFItMEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSYbITyttlNDTrKZ5FpMfOXDjOoKtyrA5YJvM8d9Nj7Se6nFfibRp7z6+GfMlqvd4
	 8TBp9tWGnQ8ftMjqmsC+jyM/tGypgIcAS4I+jxKdRY6X3JUfrKSYw177jb/mH3ompV
	 /5zvq59KpBuot4pLZ98y/Xe1AGbBd/a263QVtp5RrFiCfbOmFtD0eGY8KGuMv9hNUb
	 TmS+aehDZKlPSvyr0NtRpdHZEHE1zusOii4wtpGYBhWPR5Nahi4y+gwUG2ER/KmzDq
	 mjbw70GluL2rjuqu/cfnO/DkMFiEzkMaOBbfxKGSVnyTdqD+GIEPzQkNuRnx02vwbb
	 Ew0OCtmW4PStw==
Date: Wed, 22 Apr 2026 13:35:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: soc-dapm: move card->pop_time to soc-dapm.c
Message-ID: <30e956b5-7fed-41fc-b70b-85d76a805848@sirena.org.uk>
References: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
 <87fr4nk8jh.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wxnnknZVsQx/BDr+"
Content-Disposition: inline
In-Reply-To: <87fr4nk8jh.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I'm definitely not in Omaha!


--wxnnknZVsQx/BDr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 02:56:02AM +0000, Kuninori Morimoto wrote:
> Card has pop_time which is have used only from TI, and it is now stop
> using. This pop_time is used for debug, and can be access from debugfs.
> Let's move it from Card to soc-dapm.c local.

> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -194,9 +194,7 @@ static void soc_init_card_debugfs(struct snd_soc_card=
 *card)
>  	card->debugfs_card_root =3D debugfs_create_dir(card->name,
>  						     snd_soc_debugfs_root);
> =20
> -	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
> -			   &card->pop_time);
> -
> +	snd_soc_dapm_debugfs_pop_time(card->debugfs_card_root);
>  	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_car=
d_root);
>  }
> =20

If we're moving this to a global we should move the file out of the card
directories into the root ASoC directory.  It's debugfs so no ABI
concerns!

--wxnnknZVsQx/BDr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnowIcACgkQJNaLcl1U
h9CEAwf/U2vLlnK62swyq5K7diBoKFY0HitIHi5MOXtxcrRPWMeEmpbykB7PE6Us
yfdsot9TWZkrdKzejodCsiSGNuzZfixk6Y8Em3eUhmeeeHbqfCTEfBO46PB1hIru
hDXCWnUIrXI3OrzELQdTs3QgXLTxVYOnAv+9qjnKcBjXrXp5q1E7wYQGSwfcoApM
RAdoTICmL6+0Z1P7FDvwPtMQbWRJg5/Yn9Ckhxq8l5QLR4J1HQCIXwwgdDoqXczp
7kK0aYrOVOrevX2XqG8DqVfL8IDJRcL2hDwFm/ZIV/qqyUXvBW/brSb6EU7TkmcC
PfW6zOnIMat+XaD+dBKZRgVM8nsAvw==
=1tRp
-----END PGP SIGNATURE-----

--wxnnknZVsQx/BDr+--
