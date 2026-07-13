Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A034A3BF
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963997; cv=none; b=l66q85YtSGKsr6txsis2BSAIpDWemoYyii2t36JoXyGmRDxMW19IREIsO7WgP2ZT0GavBGqlP6ewzcfzNeDBbFdMJEomWkN1NZL+k5/rmkMUNqZH44Ayy3Ba9Rofuw4LziItjOK+s/DVxJMWrjBRbgdc8huTP5irSUuLpiFY4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963997; c=relaxed/simple;
	bh=NSQlJSEsN34YS58KS3YVh19IkLjK3UDGpUPMJhg+2Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEFVvhqsXWU3SGgyOQf9XtrQiUzvthKRLtGh0I7hIrYQJ0bFWpu0Uc8UYyp1whx2feGQTUamFhLVOwBEZwFAVYlSHWgK9utKnrV1efGy01g01B79WGaK2gAjo548SnaY31Fmxydf0t84HjeI4XzikiLWu7iqogxV5aiRlhFyNdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYZabEe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYZabEe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1001F000E9;
	Mon, 13 Jul 2026 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783963995;
	bh=v7NfFVNpfsASCvQc21abWWSPiT5FanHJqZiJk2EBW5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HYZabEe9IJupRu1V95R80pq16Lc7lXedfBv/aYWMmA1n0M7I6AnMZ9F6HJiTGdDPf
	 uAsJC0chvRtyQjGv7qgtd571tIMrx7D++6wX3bu4yyKFqFywPOTUKvWzbdHo9a21Ak
	 4grHwOYwZDwL6whyp20Q0BCsuKg3oqJtEddwQ8Q2A00l1NuhbIWWCpPAnShgeb//LY
	 IWzC4oT2D9ueBVctccq+ohVjMNnLx1oEvV2FbZveQ3ZT7cBHrNRlBllSuhGxh1wAd+
	 4p/47aZkiuNw8T9MATQxXEkavw5QtbaHD1h8zWJJuNyDBwz8bzRCXqEk0vxqx4/46I
	 Q2hO4PgCOwjbQ==
Date: Mon, 13 Jul 2026 18:33:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	=?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: apple: use .auto_selectable_formats
Message-ID: <9b2ce09d-45cf-4277-bcac-72cae66f8216@sirena.org.uk>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
 <87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IS+qv+TJ3xRDqCtY"
Content-Disposition: inline
In-Reply-To: <87o6gb20py.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Courage is grace under pressure.


--IS+qv+TJ3xRDqCtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2026 at 12:27:05AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.

> +static const u64 mca_fe_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops mca_fe_ops = {
>  	.startup = mca_fe_startup,
>  	.set_fmt = mca_fe_set_fmt,
> @@ -706,6 +714,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
>  	.set_tdm_slot = mca_fe_set_tdm_slot,
>  	.hw_params = mca_fe_hw_params,
>  	.trigger = mca_fe_trigger,
> +	.auto_selectable_formats = &mca_fe_selectable_formats,
> +	.num_auto_selectable_formats = 1,

Not all combinations are valid here, should we have separate formats for
_I2S and _LEFT_J cases with the appropriate clock polarity settings so
we don't autoselect something that doesn't work?

--IS+qv+TJ3xRDqCtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVIVcACgkQJNaLcl1U
h9BClwgAhcyy6OODpQImHwsrpZPcoqlnAwDZVQVbrMzLIAEdktJJ5oni1hkcvcRc
iz8CuWPQBtHKvFjVFnbloQsd507XOFYnHy88cG+ltgkZgWE1AsdjQwQFe+dpBhZk
ooy+wspJFZdWVT2appEf2iLGK2Jz4u2s/g6D+M0W3Ergn/Xp+Z20pcu4HO2b6GLX
lv2lZZ+RQZzkixt/TP2fUtVU+EvePTQdQp/U6NkEcF+j9Ya5EfU8KTfTOYSZ1nrB
0uVwIj4+P4ADCGVBDQZd9tCOMHt5LptpOJ9+Qh/rLel7ueZCwSf75j9kDtC0hAxC
Q2J0OETAJuSJ2QsPJlphQ8iwVvRjmg==
=p1XK
-----END PGP SIGNATURE-----

--IS+qv+TJ3xRDqCtY--
