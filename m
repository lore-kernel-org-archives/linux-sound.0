Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7735223394B;
	Fri, 31 Jul 2026 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479790; cv=none; b=eMTTUt0u6+oZy00ERp6eIjDDbB9DbL2z93vcYJRnZ0vh+rvuWBG2uWgOcqdXhyGgbCRmOfh3YCWeYKjuJARtxJLMPEdkmSc11rG431Ve5f0L0aV97zxHoS1cnvUQIS03UBfUQBQ4I1uy4nuh2l5k6mKj4dbU3GInP3ZaJRA3RF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479790; c=relaxed/simple;
	bh=gLLBa319Ch2k0ouDlfZdO98dUNLhLSfFi6Fjp2SFqI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTRbkk504/XybBvSxERsI6Mvv9vkB92u2cZaUDly/MnVvqjc4ujaCcdc+JpWAhMdXRc7KZ6z75SM2rDPjvhv35dFbipfEJPaJACmzvPuspWiC4OxWYkNQEUF/7N9CSP3qWF9/RvFgmb+7WehnBcp+LnZlFQr+1jwil3LxyNkaBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPjHVUiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPjHVUiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9021F000E9;
	Fri, 31 Jul 2026 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785479789;
	bh=faR5nLwAyjNkb6SLuxgloXlJznndwcKce+tlBIGFpPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hPjHVUiZ9pXbFGOTGVwBkJBRKXduuO9xJKQVQcHKGUglCsjqNkDC97FSeXJ1Qk+1e
	 5Af9sfkLfoK7jyDZMDiVfe7WK3YjT7gYemlaC8UehWAn6cf6dy4tCFFOdWPW59zDCp
	 Lo4UW1PEV1EHT8OdNEgdIWmgZWGA18IAJLzqIo9UMtQaWFzEkHiAM4LZbTc+xETYM5
	 YTZh6+1IW4nvqNLdZtLjcAq7hRQmiqlEVB6kNd6GBYlmHp9Cwr+QO6IUBR0h69e33+
	 iyasYZYq4g7532S5n1rhYqjTudsqNCD+/XBs6lD82WtvIhaHAGOGUVV7BUi97oycJf
	 S13zlP7Rz+rcg==
Message-ID: <50c6d86a-3648-4ddf-9c94-5512a7976b27@kernel.org>
Date: Fri, 31 Jul 2026 07:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/15] ASoC: qcom: sm8250: add SDM660 compatible
To: Richard Acayan <mailingradian@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
 Adam Skladowski <a39.skl@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-13-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260730174353.108023-13-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 6:43 PM, Richard Acayan wrote:
> Add the compatible for SDM660 and SDM670 devices, which can use the
> support for WCD codecs connected to internal MI2S.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 1952c599e004..76dc3a3f4a31 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -210,6 +210,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
>  	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
>  	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
>  	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
>  	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>  	{}
>  };

