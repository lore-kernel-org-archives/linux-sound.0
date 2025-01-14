Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DE20C47F;
	Tue, 14 Jan 2025 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884005; cv=none; b=OroYzbAAYQte/FfZ8c0h3U89cg09jL7G+/6paEcb5eWUyKq2Wy2snEaLRbiVPaDxELPds9iRSNeptjIiKhak1i1NsEM/UcWDfXvSo79kcO5lNgBGNJGGuWlYQ8D+x5QgV7WJOVfM1xEAEkl96c7Zz5gGAfF6tqHFqAPqzTriSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884005; c=relaxed/simple;
	bh=ss9W6ejS4vx8Ylzbk2m+zfe5qLug+p4Bn2vLgEPjeOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnJebiwVkC5lM7IbE/KzuM5yatWlhXCPqpydvuZX1yeeSvgyZT1RNOvRwvIwnKEbC8uwMGu6p0lftq/v8JoGdbpU2j9ZxZZkfftBLpkMLh3ZGa6rlnUN7LX6PTFmN8DGDet+POyEeF5ltQOWsWY5+ydOgmnjsnDLwm7i5uZhzyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3m9wSHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3m9wSHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F184DC4CEE3;
	Tue, 14 Jan 2025 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736884004;
	bh=ss9W6ejS4vx8Ylzbk2m+zfe5qLug+p4Bn2vLgEPjeOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3m9wSHxPGSpD21OxDWEjQnzdWKy5DvvOhVfKHQOg+XE7W9w0+2DYP8qcRueCPCIr
	 SHjDgJ6fG/FcTMLzU5dTAfMwJTPvsiK6aECtY0yHlYSsEmplJ0xd2gTsChknWWvI2s
	 AV99MqTMAnu88q+Wqq1SmFFSjhp3bu8XC5c/GG+bxYmzYitCSpE26Sw7Ld6FeFAV1P
	 SLoVDEIXobUsNc1IFnLDYnRH1lCXs+BF6X76rgJVK8ILxaAICS0gOVtSuKFZWP8rFL
	 cgJWTC3EkB9k1sF3NteDsBmikY4v6HJK/5K6ZQ5SW0oLsB3HfyvNhx3lytK0cPN8cq
	 b4mMud7ApdBiw==
Date: Tue, 14 Jan 2025 19:46:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] fix priv->dai_props indexing
Message-ID: <b900e044-2a23-4880-ab16-738782f92994@sirena.org.uk>
References: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JNH5ap0bplwK3AIf"
Content-Disposition: inline
In-Reply-To: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
X-Cookie: Sauron is alive in Argentina!


--JNH5ap0bplwK3AIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 01:43:13PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Fix priv->dai_props indexing in simple-card-utils.c by introducing
> a new macro: runtime_simple_priv_to_props() that can be used when
> dealing with PCM runtime data as rtd->id may be invalid.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--JNH5ap0bplwK3AIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeGvx8ACgkQJNaLcl1U
h9Bl8Af9FJXrSLrRM54dsyV1vozHT5yXyl4GPPqM9BRr8Jh3azTlPFdSbV+WQy6B
QJgeGP452xHxNgBEGkteXjvCTlBiTtVFAxmKqwNR0PW+5tISJk64AyF6Wo7D1AG0
Ito8TwzzHkWyHCbAHYswWtO9NeET77WKSm438YwX5J4SM/8iVSBlkzY9DBCfC0AG
1blEyuOihGLobR0mEnygXyRfAyHFm/P65zyvi9RaQTbWxuuMcy16JuElc0sAJiei
A3VunXv3atRy/K3mksEh8rVO0iXqIPXT7SmSwNA8VoDvqh2drS2G40lFyyQ+CUCW
F2VoejwgplopMYc+v2OwbNYj/9NLSg==
=C7eu
-----END PGP SIGNATURE-----

--JNH5ap0bplwK3AIf--
