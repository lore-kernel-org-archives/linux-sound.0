Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147667;
	b=3moIOWrnYyalxViodvgej69UodHj+BNBhfm9ISjpxtq62B1FaqeYn4Xlto3kQ3qTUlPU
	 t8lqjGH5A43Ttjf1UhpczCFKtehBq9ilm/VCdWZPnvv943ZwlgpogKAOuwPCR81KTZ2WS
	 EwUcewyfXppDyl0wpGZ2bKTFwua2RJYH/K5m3Z4RHlL24eCI416PNusGKEfP2Yd0cWsbj
	 sngIY82eHjHuMkmzTOoXVRTsLHNcbYbhZTSWU5ZXhdDe2QBEcX8IXQF6SzjKh1Q23qiRS
	 EwgfwukG49oQQ+WC4N/ImvK17XoMUjPciIpcOiuiQjrmmpqsDcp7PA5McY+XAnsJocQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147667;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ou2adSDhgVrzb/beDDr/5aS4r+HK6/fpTz/BDpEW+bs=;
	b=rOhyweovhN0QgZeAD69cY/yjQyih9IxOSulA9TOcZYlf+TZN6DzIj9J+hC3ijX2bqxV5
	 AP7vjm38SE/Da2EpjpmS2bWgMX5aTaoyFjtQew3qax2UXrw+J3n7gS1WceIR0yVblt67r
	 30jb+DeOdMnWsUZArTFTrcdY1ARI25kGnkPlfemYcbDZ96XpQspVNGGfDFJSvxRDyvZ5F
	 28PVvxUmp7wSYuXYAon+We2dN53sfgsM/2isU8KQs4DewVf6vInjdQ+cY7Jekb/xmJs1R
	 QLfeBEc9W94MNj8oqeX9bGmpnlLHAYPidGKBTb7t4xHq+rOiENapZ2J6sHC4pkHSXAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCvGUQTX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1EC606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 04:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCvGUQTX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674741F000C4;
	Fri, 20 Nov 2026 04:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795147666;
	bh=ou2adSDhgVrzb/beDDr/5aS4r+HK6/fpTz/BDpEW+bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCvGUQTXu03n4lmpxf2VDEyDP40Gd560yA8t1ZT80gFq3/syqxUzjkaRsdLLyctzO
	 oVlD/zKx2B9QrkS/jmLmiNdk8ScJUf0kbtzPAeR+htazAcK2k32Ib2ooXd4Y3YyXcc
	 hadktLuIWGMMKMqT5lix7v4IW9LRWaS0vCudIjFXfMKcNCtUKD3F81TYyEOJGEuQ70
	 o2s2P0TzYB9riTehhlmLRE8UtAHsNYZv8IEfHwv/EV+DHpr7AwEM3UNnywefcmln2Q
	 dY7gb71RfBfUkgUO3DbBOkvnNGaj0T0tWVE1rQGfSUFprLqAi8zM2eD5fFRUjnaGqG
	 x3M/G2cr/Ib3g==
Message-ID: <sashiko-outbox-224436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] ASoC: atmel: mchp-spdifrx: Fix 16-bit
 big-endian format check
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120035939.12774-2-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
 <20261120035939.12774-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 04:07:45 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: atmel: mchp-spdifrx: wrong 16-bit BE format in
  mchp_spdifrx_hw_params()
--

commit 35438546e4acb88091a245628184b5c5fc916afd
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check

This commit replaces SNDRV_PCM_FORMAT_S16_BE with SNDRV_PCM_FORMAT_U16_BE
in mchp_spdifrx_hw_params() to match MCHP_SPDIF_FORMATS.

> diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifr=
x.c
> index 63089ac3ebdc9..80a64af0878b5 100644
> --- a/sound/soc/atmel/mchp-spdifrx.c
> +++ b/sound/soc/atmel/mchp-spdifrx.c
> @@ -455,7 +455,7 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_subs=
tream *substream,
>  	}
> =20
>  	switch (params_format(params)) {
> -	case SNDRV_PCM_FORMAT_S16_BE:
> +	case SNDRV_PCM_FORMAT_U16_BE:
>  	case SNDRV_PCM_FORMAT_S20_3BE:
>  	case SNDRV_PCM_FORMAT_S24_3BE:
>  	case SNDRV_PCM_FORMAT_S24_BE:

[Severity: Medium]
Should MCHP_SPDIF_FORMATS be changed from SNDRV_PCM_FMTBIT_U16_BE to
SNDRV_PCM_FMTBIT_S16_BE instead?

IEC-60958 linear PCM samples are signed two's-complement values, and
SPDIFRX_MR_ENDIAN_BIG only switches the byte order in SPDIFRX_MR without
converting signed samples to unsigned.  All other format pairs in
MCHP_SPDIF_FORMATS are signed, and the companion linux,spdif-dir codec
(sound/soc/codecs/spdif_receiver.c) used with this controller only
supports S16_LE and S16_BE, so advertising U16_BE prevents 16-bit
big-endian capture from being negotiated (or delivers signed samples into
an unsigned stream if paired with a codec that permits U16_BE).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120035939.1277=
4-1-phucduc.bui@gmail.com?part=3D1
