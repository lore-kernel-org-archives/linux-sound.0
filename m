Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D6D33B949;
	Thu,  5 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697460; cv=none; b=WsK8lVbmef0vwyFeoUX3fbysR4lEF/vWQpG+ThIgsWkworMFQ+1VP8CrDfpxoPnD+axn0pfwaHuKPhj1YyNM27ZTvQXGHN8J/k683S9DPi16q7lbNf3aXSA4urNBSZqU/TPVJB0Q3t7XGOjhhhhV6zXh43ttSZI+4Xt26v7RI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697460; c=relaxed/simple;
	bh=LTFCOG5QXLiQSKnu7SNj+IKfRYZTwEVJn8wWTsU0rXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehYUZ7oshWn+dWNnfpYgAWd9wXuCLeCV/3ugfHAgOP/UQwCXG3pr2MBGRJYMXM9TxEWNNQtgW54cNu1iMQTDJvDGX3hkts5VX8h9Ky0NBu556gDNTK4CirhBzGk1AO6aFiD1sLPb4B6WHZdNA5wVyG/1kIvdc4kdDOfxVpsdL6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eq93sB3x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eq93sB3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955BAC116C6;
	Thu,  5 Mar 2026 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697460;
	bh=LTFCOG5QXLiQSKnu7SNj+IKfRYZTwEVJn8wWTsU0rXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eq93sB3xaArZGPVhM1mPmY8W4sl3biK2h5i5jDNlSguadqXTPx9IgZ5tWipSAJmB9
	 N/zDvFpjmoBGM8P5a7r2tb6vOLWvdFu4YNEDxWL4TPwac6HgXAZTD2yJ2y20bJ2Rfr
	 K+QHBlHUHNw/JHAOGMZyyxAub/6P4GIOxWFMUCR68z26IDQHpYoKUBJgsBS5EPTV6u
	 O8BbRQx92ZWsTi34C0gsf0RC/VKaf6/3b21asXEI3uMreRXctXAEiE1fHZ846dWtkp
	 MOaIL/6GL2LmATWc4kgBmxgQQmwwBOtOffy411lETfZA2/MIqF5NYjq9y+upo8PPIm
	 Gu26d5F8fZYZg==
Date: Thu, 5 Mar 2026 08:57:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
Message-ID: <20260305-fluorescent-gainful-unicorn-4f8d7e@quoll>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-3-mailingradian@gmail.com>

On Wed, Mar 04, 2026 at 02:58:06PM -0500, Richard Acayan wrote:
>          then:
>            required:
>              - qcom,sd-lines
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 6d1ce7f5da51..6753f7bf004b 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -140,6 +140,20 @@
>  #define DISPLAY_PORT_RX_6	134
>  #define DISPLAY_PORT_RX_7	135
>  #define USB_RX			136
> +#define INT0_MI2S_RX		137
> +#define INT0_MI2S_TX		138
> +#define INT1_MI2S_RX		139
> +#define INT1_MI2S_TX		140
> +#define INT2_MI2S_RX		141
> +#define INT2_MI2S_TX		142
> +#define INT3_MI2S_RX		143
> +#define INT3_MI2S_TX		144
> +#define INT4_MI2S_RX		145
> +#define INT4_MI2S_TX		146
> +#define INT5_MI2S_RX		147
> +#define INT5_MI2S_TX		148
> +#define INT6_MI2S_RX		149
> +#define INT6_MI2S_TX		150

This conflicts with Srini's patches and looks pretty the same. Please
look at his patches and avoid re-doing them.


>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>  #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> -- 
> 2.53.0
> 
