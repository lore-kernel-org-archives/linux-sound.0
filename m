Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F3183CB7
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722509266; cv=none; b=u9T2CuD0KR7lQqtjUbCTzo7LAFPlEXFGKdro6ZM88Xui6KfIXPeQzfwWcwbTRexHZouCFwfgtPt/KxmPowNc5M2xcmSMbL6v+Vk2wovwagDp2V/vpHwqM3q7sv+fRRuCITAK+GaYyXhQaeBOt0rNNkL69nJd2Nu+FZVVfOyeEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722509266; c=relaxed/simple;
	bh=hSVSRrz3fsl8s+TtTum1SWINf7gjHKl5ODNPOppJJBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp+WvuwAaDIAIqc8yZe4ifIbMA+OeEp+oEN5ERuB++7nqd8mV8GvGguSm6fvZ6pXgdeX2CuKoAwL6mnCCOl9BVuM+jHhpgz6l18f4ln6GEGQ1OXPYQsll8wmSbR6+497mwGfXV8LK7Dc2hAf+z7Q6jmVRvftSgkfkDFAZ6tN8rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usKRXty0; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usKRXty0"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa7bso7532177a12.1
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722509262; x=1723114062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z85y/g+9vb81jKmcafP4dvn4vFmY5QR0yXRNZFSsnR8=;
        b=usKRXty0Tl6DGc7zqv6nzKvz6NXTR2yK4G6w+Qhkb6VvyZpihOrUc6d3CE8KInBXZ7
         NQJqMihbz+C2pkIQXkbJ49VSxKRQTsW1KQxRb9K0XGjrQFq0Tmf88cMK7IBqfUpuxFWI
         UtJn5yzXU5+ysu2LfLcX0skhzPgMakqCveB4CMwlrpYc93rR9wFF9VUleuUlO4w7S/B3
         NQM7rpLrhGZ2dJb1k18KeBaD1q5Snbst6W7JSfqKqf7XQPi3Fkv4iPY85u2YoXnXDefo
         B2nwUwWh1/99fQ976EROMLXSEvsP6EGjWn6Pog7vuWVNkPBAyvmoIQZW4TILWlXf3DRq
         8ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722509262; x=1723114062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z85y/g+9vb81jKmcafP4dvn4vFmY5QR0yXRNZFSsnR8=;
        b=T2l4sDhlwbW7f2lbSFJERG5N7ujARM1hNJDiSiYXtxMVrHBel0thK3CvUDg+SRnv79
         TIp/2adwHqMZFBru2J27lJm6HI9jpIib4aOnd4qE2pb8GolF1fF/IEMacqSEsl3UWM9M
         HU1/RbFb4efgH9S61nnIgxdsECJLiBmrE+vvWvBZw5gMKz3Yt6GMELxGKeTChl7wCOtb
         Wbf0k5cAWOQ5iuyQGNCfgzfChGrHkxby1QTabdwCyOdLj2ugGjHACHpKl6ibQ8AQqjb6
         1YLIxuzLXDKHDBID4FHg/3leamg08D1x4FUqnaLBV6B4kdyFUx9BynSipoGlHIYK1a21
         gPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVltHb19XDMjqtglVamckBrzafs6CX1237x4Qd60r/JxeleKeGU8RAGwCx7WMMiEXMcUfJ2kGlr54wwRd2PgwC0iwm7JY51uX60Jxo=
X-Gm-Message-State: AOJu0YwpE/7j51Z/PmLqK9MtJXggm5qTN2xMwgZwKWV+CWv5MWI/UoTB
	fppyRk9Aj+cQofXx2wPvBgU2wJfpdyC2SBg41jZ9guX7VLa/0TbjM1ZzdZMZJ64=
X-Google-Smtp-Source: AGHT+IETKes+z6wG81VpgxVv6mHim0SINXPJ9ewGaBVr6boePMQ9az0QkbZ1hzXP5XqyWc05zbL4WA==
X-Received: by 2002:a17:906:c108:b0:a7d:391f:17af with SMTP id a640c23a62f3a-a7daf65a227mr145607566b.51.1722509261910;
        Thu, 01 Aug 2024 03:47:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:31d2:aeb1:18cd:e482])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4de7asm880932766b.66.2024.08.01.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:47:41 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:47:37 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
Message-ID: <ZqtnyWAXTsSGAg0i@linaro.org>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>

On Wed, Jul 31, 2024 at 05:25:30PM +0200, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953 platform.
> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
> supported by firmware which influence way we set codec clocks.
> SoCs shipping on at least msm-3.18 should use v2 clocks.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: rename functions, add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 5a29adbd3f82..3ed35beb671a 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -22,6 +22,11 @@
>  
>  #define MI2S_COUNT  (MI2S_QUINARY + 1)
>  
> +enum afe_clk_api {
> +	Q6AFE_CLK_V1,
> +	Q6AFE_CLK_V2
> +};
> +
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
> @@ -29,6 +34,7 @@ struct apq8016_sbc_data {
>  	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> +	enum afe_clk_api q6afe_clk_ver;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -192,6 +198,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
>  	}
>  }
>  
> +static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
> +{
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
> +		switch (mi2s_id) {
> +		case MI2S_PRIMARY:
> +			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
> +		case MI2S_SECONDARY:
> +			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
> +		case MI2S_TERTIARY:
> +			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
> +		case MI2S_QUATERNARY:
> +			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
> +		case MI2S_QUINARY:
> +			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
> +		default:
> +			break;
> +		}
> +	}
> +	/* If AFE CLK isn't V2 return V1 */
> +	return LPAIF_BIT_CLK;
> +}
> +
>  static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> @@ -215,7 +243,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>  	return ret;
> @@ -236,7 +264,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	if (--data->mi2s_clk_count[mi2s] > 0)
>  		return;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
>  }
> @@ -265,10 +293,12 @@ static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  {
>  	struct snd_soc_dai_link *link;
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
>  	int i;
>  
>  	/* Make it obvious to userspace that QDSP6 is used */
>  	card->components = "qdsp6";
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
>  
>  	for_each_card_prelinks(card, i, link) {
>  		if (link->no_pcm) {
> @@ -279,6 +309,14 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	msm8916_qdsp6_add_ops(card);
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
> +}

Is there a particular reason why you decided to hardcode the
q6afe_clk_ver for the SoCs rather than finishing up the dynamic
detection Otto proposed [1]?

This works for MSM8953 but there are a few SoCs like MSM8909 where
both clock API versions exist (depending on the firmware versions).
If we want to support them at some point, we will need the dynamic
detection anyway. It would be nice to finish up that patch set.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/
