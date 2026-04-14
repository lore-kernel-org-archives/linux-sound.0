Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02B264617;
	Tue, 14 Apr 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176502; cv=none; b=skWcscau/Q+D4TbveqXKs7X5RCW3dnwLOq0EBq1jHh3IBqVKPBSx6G40BsT6rtUQ1u8l4O44+UPvl1vb1k1Ir7FiDRzTGAs/JG3jEO2HtPaV6dwKXuXDvvioRa4LnoxfK3T9MbFQoxw7nXAc7/iSIr2oYi4Pz4aV4vORciq+7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176502; c=relaxed/simple;
	bh=542y0Reg1wfkN39Mlm8Bc6OnGlzXXf9YYnupzX+2uE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz+khY+IW6EGcrBvgxk5YG+fHw+rXP2/wmPvTOfygqBKIWMBo36IGC4QI6znZlY2AD+vwSLjZXyE5m+2zz8ixxti9FQ440UCelUew4ZP1xBs5nx43ACj3bCWJLXMdhth1FgWlKxESef+xTY1KaqICVSlyZlL8R31kWUnJ86J2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6x2ijRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6x2ijRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E017DC19425;
	Tue, 14 Apr 2026 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176501;
	bh=542y0Reg1wfkN39Mlm8Bc6OnGlzXXf9YYnupzX+2uE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6x2ijREgwH+UStvzWlGDEDBRe8zB8b6za1EM+WgFeFv7NV9cad02cipg52mkzmYn
	 Lz6fPhjs9Ll0z202yAJV3k98Kt6ZBlVNQ0YBk74hs/r4P6iys1z+o1qiOMamVt8oET
	 D0OquLq8xRQr9ZmNUKSWBHbD91owjeTSO7qoJcdkH/30MkHvVwBLjWohdP4IH7FTZa
	 oG+SjwvWNmfv4b3t262b+J1bP+2bD/7AsjuOgiOoTdJf9K0MW4dLN+C4bK9dvPQSpi
	 BXi/zGNPp9OhlnmSo4aqzldBjvsz9a/H899YuRwJ4ia/5MdKYRmYT/jV9WI2uAYMt5
	 l6zFsN9qb4xCw==
Message-ID: <f9806784-8145-407e-b77b-403327aaccf1@kernel.org>
Date: Tue, 14 Apr 2026 14:21:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6dsp: Update bit format support for
 secondary i2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/13/26 9:19 AM, Kumar Anurag wrote:
> Add 32bit for playback and capture over secondary mi2s.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

Pretty much simillar changes a are already submitted by "	[PATCH v1 0/2]
ASoC: qcom: q6dsp-lpass-ports: Add support for extended sampling rates
and PCM formats"  https://lkml.org/lkml/2025/11/18/673


--srini


>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index 4eed54b071a5..0664f18d7a44 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -380,7 +380,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  			.stream_name = "Secondary MI2S Playback",
>  			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>  				 SNDRV_PCM_RATE_16000,
> -			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +				   SNDRV_PCM_FMTBIT_S24_LE |
> +				   SNDRV_PCM_FMTBIT_S32_LE,
>  			.channels_min = 1,
>  			.channels_max = 8,
>  			.rate_min =     8000,
> @@ -394,7 +396,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>  				 SNDRV_PCM_RATE_16000,
>  			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> -				   SNDRV_PCM_FMTBIT_S24_LE,
> +				   SNDRV_PCM_FMTBIT_S24_LE |
> +				   SNDRV_PCM_FMTBIT_S32_LE,
>  			.channels_min = 1,
>  			.channels_max = 8,
>  			.rate_min =     8000,

