Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246927;
	b=csANwFGhpXVJhpU/IiMMTsTwmgSEz+VkLrZxBjZJ3pIOF9ra/+KjUlfF/3Q9a1kMdMS0
	 0DGsEJvsA2FsQQSYXR5o/JgTZeKH36zV7CJZs9wX4iD6uMSJDgDtr7g0LikRd7YrK3rkm
	 Bad6VWRAXk4/KrZykxVN1Zba70BKQMqRz9yt31192QFS6ACwN9G1QaJMsOJ4TWNKp5qP5
	 V+w2YNzB7sknXGfXWs01H7bvY7SZArZDBALdJ4QeFu59REmAPowUYHg+dv//764W/5ar3
	 CPb38TeOwb9SIncTF0BGOo3yE1dKCAXUiwrg4ccXkWE80pZnpdVgO0WGgvMe3qJLz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246927;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G5mLxsRrqvZQDSYxRr/nesVK6DHJWKmLewMVRfii6Mo=;
	b=YVwmdYULKcP5WWmLFkkhAqmHoPb65ZNynrDAilddIBN2Ze874aoGECBULFhFwNFDWgAN
	 qwdbrZoHm5YwaSTQTOMBICaj+RHSNYxUNWunZWq9dDdAepwOhbjjLmixOxNzmOvjlW60N
	 IAoFNU3wXa+YDeiD0nHzUQylMtKS1+N0SJxtLes9bTis9tP6xP6g1UFMmg4ZbwvJuQwjQ
	 Es2IURtD5QRtKl4ZyOhcEGLRm6vBNy/YooXywLZ4nEuiqCLnYoNUbk0Z0u4nN68hFBbEY
	 fi77NE4YhsPQWtasCH9LwxcmJ+wfPY6qDY3sHR+dFgG62NKQipNwX9jOY5mXNk+jBQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FngYM0w8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072B8606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FngYM0w8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FA61F0089F;
	Mon,  9 Nov 2026 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246926;
	bh=G5mLxsRrqvZQDSYxRr/nesVK6DHJWKmLewMVRfii6Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FngYM0w8wvjHr2dEjPfz3ByaFo6gk4JOA0DVnbgAiaQofI4uxxBeCT5aSrM09qh/Q
	 3BWv9XKeubiyOKOhET2n8LrrEs1uRmHNVFStAJGDQV5W7Sn5FXaP9hu1/9wBLLhGYZ
	 2hM/QvPJv5NDstXkO9OvOKW8+93o5HlSohiWFzNtUo0eAMVriUTMKbWYhv82seutwO
	 EBEKwdwu4Uo6/4Elgy3Mwe1QyGlcnU93ih+xVRg2yzcmwx17NWLbi/bGr/0OaN5FAp
	 Ymf/GvH4ZmiEnx5aPqEyBinjcVUqYO5oQGe1AfSSu1ZdavWNLu+Jxv32m1Rz0LGOti
	 7XOwVFY2sGyBQ==
Message-ID: <sashiko-outbox-205353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: cs43130: Take the frame layout from
 set_tdm_slot()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109174514.84903-1-olivier@mgcrea.io>
References: <20261109174514.84903-1-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:55:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] ASoC: cs43130: unchecked error returns in cs43130_hw_params()
  [1]
--

commit 7ef1cbcfb870223ab41a2a71fc03df6192352302
Author: Olivier Louvignes <olivier@mgcrea.io>

ASoC: cs43130: Take the frame layout from set_tdm_slot()

This commit adds a set_tdm_slot() callback to the cs43130 PCM DAI so
cards can specify the TDM frame layout directly instead of deriving the
slot width from the set_sysclk() frequency.

> diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
> index 7fb23522f081c..3a1588645b405 100644
> --- a/sound/soc/codecs/cs43130.c
> +++ b/sound/soc/codecs/cs43130.c

[ ... ]

> @@ -960,18 +967,24 @@ static int cs43130_hw_params(struct snd_pcm_substre=
am *substream,
>  		break;
>  	}
> =20
> -	if (!sclk && cs43130->dais[dai->id].dai_mode =3D=3D SND_SOC_DAIFMT_CBP_=
CFP)
> -		/* Calculate SCLK in master mode if unassigned */
> -		sclk =3D params_rate(params) * bitwidth_dai *
> -		       params_channels(params);
> +	if (cs43130->dais[dai->id].slot_width) {
> +		/* The slot width set with set_tdm_slot() */
> +		bitwidth_sclk =3D cs43130->dais[dai->id].slot_width;
> +	} else {
> +		if (!sclk && cs43130->dais[dai->id].dai_mode =3D=3D SND_SOC_DAIFMT_CBP=
_CFP)
> +			/* Calculate SCLK in master mode if unassigned */
> +			sclk =3D params_rate(params) * bitwidth_dai *
> +			       params_channels(params);
> +
> +		if (!sclk) {
> +			/* at this point, SCLK must be set */
> +			dev_err(cs43130->dev, "SCLK freq is not set\n");
> +			return -EINVAL;
> +		}
> =20
> -	if (!sclk) {
> -		/* at this point, SCLK must be set */
> -		dev_err(cs43130->dev, "SCLK freq is not set\n");
> -		return -EINVAL;
> +		bitwidth_sclk =3D (sclk / params_rate(params)) /
> +				params_channels(params);
>  	}
> -
> -	bitwidth_sclk =3D (sclk / params_rate(params)) / params_channels(params=
);
>  	if (bitwidth_sclk < bitwidth_dai) {
>  		dev_err(cs43130->dev, "Format not supported: SCLK freq is too low\n");
>  		return -EINVAL;

[Severity: Medium]
This problem wasn't introduced by this patch, but should cs43130_hw_params()
check the return values of its configuration helpers [1]?

sound/soc/codecs/cs43130.c:cs43130_hw_params() {
	...
			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
			if (cs43130->pll_bypass)
				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
			else
				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
	...
	cs43130_set_bitwidth(dai->id, bitwidth_dai, cs43130->regmap);
	cs43130_set_sp_fmt(dai->id, bitwidth_sclk, params, cs43130);

	return 0;
}

If cs43130_set_sp_fmt() rejects frm_size or fails to find a matching
cs43130_get_clk_gen() entry, it returns -EINVAL after writing the frame and
clock configuration registers but before programming the clock generator.
Similarly, cs43130_set_pll(), cs43130_change_clksrc(), and
cs43130_set_bitwidth() can fail with -EINVAL or -ETIMEDOUT, yet
cs43130_hw_params() still returns 0 and leaves the codec unclocked or
partially configured.

[1] https://sashiko.dev/#/bug/linux-d87cb6e4-e153-44f3-bf43-c8028f4ce12f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109174514.8490=
3-1-olivier@mgcrea.io?part=3D1
