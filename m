Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E443F86F8;
	Tue,  4 Aug 2026 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825597; cv=none; b=XcfVbiHJ9FWfiOKlcdt58oh0VjZwGEo6c2VoREb9HicaOTi0ihB4PJlOb4aXJvFx9HBX8E7erpIpYOnO5TJ0QABipxs8+Sy5j374zEAKC9EOZsqz+TeNFLCTQ3AFioqSADL2eTSnYlpYbD1ntldpG160CH0ExhRbaxZifDPaybU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825597; c=relaxed/simple;
	bh=8YPwB/ilrgq2Fo4ZejWnAQgW0JiHVrFzi0thZ417Ilk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=Qd/Zbui1Aq7lDznr3UMJAcUgoYEtePK4I+EwvvZ9JUtCMTCmfrRA8ohjfAMM3nwqnkOkTfu9ZXgC3088r3Ihe4S/VbBJ7q4OAjxClmydKg93M/Xcn1MSgluQL29knoCqzQJ1yv0Oz2fyQlkT7nhLfJBtJKPMEozbszhPbeBXmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=sYvhd31T; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sYvhd31T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785825589;
	bh=LTq95m4NZXUv56aybCVzoaczk2vxOrA0Jv2yXEWtSSY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=sYvhd31TgYnMKQJpLLUlA+1VccY8F5ejrRGrvvOfPB58K69dgsC9VfqYNs//E18Eb
	 zkOFaqrqucpCHyM+28Q9PS309oA854/Jj2lUiCtIyQeSendw1FDVgf1QtlAghHf4Zb
	 rz7MrfBvrBXxEUmaoLfV4639dZb5kUiBONTn/82o=
X-QQ-mid: esmtpsz20t1785825583t9654d158
X-QQ-Originating-IP: mRnntLrRUGnKaEWnui5APgcJXpIUBJXfl5KWk4O1viY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 14:39:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16990820903706416116
EX-QQ-RecipientCnt: 14
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 03 Aug 2026 23:39:39 -0700
Message-Id: <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
In-Reply-To: <20260804043036.22065-1-phucduc.bui@gmail.com>
References: <20260804043036.22065-1-phucduc.bui@gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NMergOTTAZKxyd9cDLCRVVofEru43iwjl5BWjZLTXuXpLLKLQjCXNELu
	UscLO41BS0vwZeyvhb9zmZRSTdDvPLIcOyUnOto9arA3zsGCrxB0DBNpubkCe5T2ziMczN4
	awD2sl1Otolmw3Vfg0w7VFNy3nzUdZ6yfBweu0WiG6Dlkujo/WQXqK+gqQQTU7eXM/1emPe
	dVpO8hjWsza3R6bHXnTWADVWfwzESmw2IQpLDFb2jAh8qYuEIZv1D6mmHn2gfGBHl7X+HLn
	5e5Dmmc3vS/woiQANysw1LPrVlAoonFyQsr26srwkbcwz9opD8MoG6KN68Os7LqoMKY2GqW
	kUng32mjymgCvJWsxPC43aoH+xrcJPx3tEAGSzuzd6Ay5+qGdwTjDCQLuvGvDaKEzyQ0LWR
	Ncyam0EMlFIJEgrlNc7WHH9AtzfbVoAwpTNzw+xbQ0ERIsMr4iWVKTdY99QyG5YvFvtCDyH
	JlHixvPHUNnPjW+9bmzVAYTsUll4LNsEmUl++3a/KiNsTxJXLa17egsmAsnq6oO9ncYGMlE
	Uh5Tp8vZPKmK5LF8J7jcCYVCskuoxbweauryZ4Na8XFjfere/1qpWm9hn8n4eTeBAcC49cO
	uWtCvsL9LgL1kfhb7cwYHXnmE9xNWa0pmPjKOkLqIPbLOJMbijlQiP9z0wPaSr1s7iiqq1d
	+B+rtxYvacqFrPhsuhiHNQYH+TOjL6pkwPASTIO3yIjSL6QNz5jpSQmqZEe1MGEwepu2+Mz
	9Ua7RmS+UNRhk+PLnvqufNjb8FyLsvpNgRl5e9Z1tFy96iu7NX5oWbta8mFtd9dBmVmLwLD
	BikL9pJ/pnLydnpbtiTsuGCNHYMbVZu8yFteK8d/aS5iTQPlvOODQ6dgH2HRnTdaiTiYRss
	y8UI2zyqPL+gpYsh+oeLnpLOJx9HXtlHVWt0uUW8w33SqFQxR+tSQB7XRF6OW2QNmoaULoc
	Muxx+kQujTP1DMCctOgeA607E2F79Eq/2HyTcHCWnKTVZnXNpgLZzz+1kK9synNRNXHi/6Z
	5p2L29P5Cgc+FviDpvcQgcZxmsEKl60/XBk9HYU7AndjlzZfPcjILyi2zJBNFqK7tPOfSxq
	0FsAO5ZXMyS0Y9bMBC3O9+cLKA+i+rI4I9ZtXKlvnUQ
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

--61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> spacemit_i2s_init_dai() already initializes the playback and capture
> fields after duplicating the static DAI template with devm_kmemdup().
> Remove the duplicated initializers from the static template and keep
> all field initialization in spacemit_i2s_init_dai().

The code change is functionally correct, but the commit message currently
describes it only as removing redundant initialization. It also changes
which stream directions ASoC considers valid.

> @@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai=
_ops =3D {
> =20
>  static struct snd_soc_dai_driver spacemit_i2s_dai =3D {
>  	.ops =3D &spacemit_i2s_dai_ops,
> -	.playback =3D {
> -		.channels_min =3D 1,
> -		.channels_max =3D 2,
> -		.rates =3D SPACEMIT_PCM_RATES,
> -		.rate_min =3D SNDRV_PCM_RATE_8000,
> -		.rate_max =3D SNDRV_PCM_RATE_48000,
> -		.formats =3D SPACEMIT_PCM_FORMATS,
> -	},
> -	.capture =3D {
> -		.channels_min =3D 1,
> -		.channels_max =3D 2,
> -		.rates =3D SPACEMIT_PCM_RATES,
> -		.rate_min =3D SNDRV_PCM_RATE_8000,
> -		.rate_max =3D SNDRV_PCM_RATE_48000,
> -		.formats =3D SPACEMIT_PCM_FORMATS,
> -	},
>  	.symmetric_rate =3D 1,
>  };

With the current static initialization, channels_min is nonzero for both
directions before dma-names is examined. snd_soc_dai_stream_valid()
therefore considers capture valid even when the device only provides a
"tx" DMA channel, which is permitted by the binding. The DMAengine PCM
code may then create a capture substream without an RX DMA channel and
fail during PCM creation.

> [...]
>
> @@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_=
dev *i2s,
>  		dai->playback.channels_min =3D 1;
>  		dai->playback.channels_max =3D 2;
>  		dai->playback.rates =3D SPACEMIT_PCM_RATES;
> +		dai->playback.rate_min =3D SNDRV_PCM_RATE_8000;
> +		dai->playback.rate_max =3D SNDRV_PCM_RATE_48000;
>  		dai->playback.formats =3D SPACEMIT_PCM_FORMATS;
> =20
>  		i2s->playback_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
>
> [...]
>
> @@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_=
dev *i2s,
>  		dai->capture.channels_min =3D 1;
>  		dai->capture.channels_max =3D 2;
>  		dai->capture.rates =3D SPACEMIT_PCM_RATES;
> +		dai->capture.rate_min =3D SNDRV_PCM_RATE_8000;
> +		dai->capture.rate_max =3D SNDRV_PCM_RATE_48000;
>  		dai->capture.formats =3D SPACEMIT_PCM_FORMATS;
> =20
>  		i2s->capture_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;

Initializing these fields conditionally preserves the existing
capabilities for devices with both "tx" and "rx" DMA channels, while
correctly disabling directions without a corresponding DMA channel. The
added rate_min and rate_max assignments also preserve the existing rate
constraints.

Please update the subject and commit message to describe this functional
fix rather than only the removal of redundant initialization. A possible
subject is:

  ASoC: spacemit: advertise only DMA-backed DAI streams

Since the issue was introduced with the original driver, please also add:

  Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")

                                            - Troy

--61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanGJKw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvrYMBAMbOjR8cB3gZnCCwoFuogtbhkkXZKuHUVOalvNnO
xLXaAP9cyjXtTVuRiipuj1Wc5jAjZomGvTqPv1ctpbtf1xqFBA==
=BzH6
-----END PGP SIGNATURE-----

--61ecdfd0fe19057f00ac6f6f76c3e71ea0f2054d2589209ef8ab808b217a--
