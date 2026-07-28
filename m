Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E439CCFD;
	Tue, 28 Jul 2026 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259717; cv=none; b=OsoVRDvmWHddaMGUmlzRI5GWToFz1TnLu5tjcdrQMe/VBtMusFtbDtvZ97xpiu73zhSazBui5E/aDQr8FzQ7M9h5+R6zMFB1XtT2a/IkdWwkIRkIFGvEEZmXDdVValBwVwAFuR5Lc0nHUOXNz19Dfvke8BDEuwXkW2+bPHsnFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259717; c=relaxed/simple;
	bh=d7IHnLeF88O84LYV+xP+a9UUxqsramW2fy6tBg47VCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL++q3EJACjYYDW3R/jKBjnyjr6O9b+HnaiQA385JI3R2LjrmOeZ8dhYxj0Yvwx/IujVVmDFI+oaZED63IM/vTL9t6Iaet7QOxIcnGxR2hGrwM/U9YRqBbx0khMa29MZpGhEEM0JUYgt6wg11RnbUOLqDXZ20UPn+DI7izcV7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRlMelmn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRlMelmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3461F000E9;
	Tue, 28 Jul 2026 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785259716;
	bh=yWW3MGewi3htmwbZfkC5km15Wltd1/JLnEf+dmgErdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aRlMelmndy0Rqyazb/PUuoNW4jGehI/41Hc9rmR/xAfMzvsxUj324Xg+vOYsYB31t
	 RYAX+dc58czUdZYhWkJ5pJKy+HsZGCmZ044cG89F45cB5dkam/K5uvx8Y0mRexzqIp
	 Pj3utnaIL3ldbU5kEleVDSrXqjATBwdpEsZzPK4MYmBClkhEWsAFZRdAMFvUolkMFI
	 6psAb8WxAwSI3bEYYFlnePCz4h7oxHQ1RZ/wvIVNcV6V15VX0X0vHPuA5HZb9rT0d+
	 Dkwwdi4JF9zuC2JRE3wc/pMVlAxRYm3p9Ddaurgt1dSJxyUgsFRJalhMEfKGXWgxRm
	 Lcxn0DCJwQkuQ==
Date: Tue, 28 Jul 2026 18:28:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card
 with special WSA channel mapping
Message-ID: <69d28133-29d2-4b80-ae69-20117474d364@sirena.org.uk>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
 <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-3-b29f44720178@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J0xETubsF8VHYlQy"
Content-Disposition: inline
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-3-b29f44720178@linaro.org>
X-Cookie: Stop me, before I kill again!


--J0xETubsF8VHYlQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2026 at 10:46:45AM +0200, Neil Armstrong wrote:
> The WSA Speakers are connected on the WSA2 interface, but the
> WSA and WSA2 links are handled as a single dai and DSP interface, so
> we need to specify the channel mapping of the Ayaneo Pocket S2 for the
> WSA dai in order to have functional playback and avoid DSP errors.

> Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
> callback in order to set the proper channel mapping.

> +static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	unsigned int channels = substream->runtime->channels;
> +
> +	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
> +		return 0;
> +
> +	if (channels != 2)
> +		return -EINVAL;

Do we need some constraints somewhere (perhaps it's already taken care
of and I didn't notice)?

--J0xETubsF8VHYlQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo5r0ACgkQJNaLcl1U
h9ApEwf/cMtCjuOeRWOP9jWg2lvfirrItfAoU6URYMUzcUIFA09zxOg+Lx4HBOTJ
aoxrTGbmDTNRBcvMrDt4UjeoNTs0RGPUveJrZ5uSes5H4KF24n3TCjsQmCf+trEC
I83Xty1Izca0t5p01078i8GYnesbuIDbWsl0D/1gM0IWBv7FPwJqAQuf6O8k4lex
sPepmfQis/plWGA57UlBb0tZk2Q1sVTx2hM2txpWZ/20ZG+AtPSc3IqlSyLUN+KZ
0h+reN2im2Wc7Dik1zXWf5EYagZqSlEXkYPK8ySDR8P7O32VGewuiu/cU1igNi7w
NXOewCVmvBkN5ba2BedUfERW1LqXdg==
=sSMk
-----END PGP SIGNATURE-----

--J0xETubsF8VHYlQy--
