Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64936897E;
	Mon,  9 Mar 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042096; cv=none; b=C5t/1ylbgtFmduPGDSvbe/WdBOEYVbpRIpZdfTdKC9i0Xm7DmxvLvbNL+Xi3evZyXPvPxTD1e5fDk3xQB5lEUpCkS5nomyabM1o1n7g0wd5XQQGgEYqmpw4riK0pnhZvljOqJF2WQ8Uheo0pIRpkA5OA9r4d6g+jcjr8AULq7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042096; c=relaxed/simple;
	bh=S5lpZ2tWpeOHXFga/6TSs8zaeH3bzpbOvOP1BgJhGYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dO67nXeutX/uKY9OKdrg0N8x+y5lvuAJU1PQG0GIdhpwFtjnFRLSLIseIsTwJCD2IeYAAScpdVODssl75GL77Vy1oaTPeB/h1VPkyNwLHUgL7OREZtadMWn9j9vaR0a81X79IU9IqHRVLH3nZd4hv9QjLrMo+7f7Vhg/7Bm8CKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3Ve4I2E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3Ve4I2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E46C19423;
	Mon,  9 Mar 2026 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042096;
	bh=S5lpZ2tWpeOHXFga/6TSs8zaeH3bzpbOvOP1BgJhGYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3Ve4I2EU1mcCD+R2yP6fmm6S/f1x9gFuwwzXrAFBlf1blT/0lknlV6eHz1yzvQHT
	 VVh66BWTHHoGHmk6xajIFZDMualJs7hIzNX7CXvwy4XDu9f86AML4M8msSyexQl+1B
	 WSZ5ImihaQetNF6Xb3lEu0YVuQhyqytJR4WQFQW8lApAkzjYdgEhY5Wkm06xSd28xt
	 U8xt/YSI2FrrXGNEPmXOIsB1BMvLNKlt78sBxkEXWTGxrBYqn7EcDZ57Tehoyxw9Vr
	 KLBKJjsltLqK0ChiQSmmh2ZQON+Ig0Xh3oqNxTCMNpcuoU85PBnt9AyScVsS/pRv0K
	 XwFWCAO1qxTWw==
Message-ID: <5a10a4cc-56b9-4695-af16-48912e63fd8d@kernel.org>
Date: Mon, 9 Mar 2026 07:41:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ASoC: qdsp6: q6prm: Add MCLK and internal digital
 codec core clock IDs
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Roger Shimizu <rosh@debian.org>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
 <20260305-rubikpi-next-20260304-v1-3-327595a4528a@thundersoft.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260305-rubikpi-next-20260304-v1-3-327595a4528a@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/5/26 5:47 AM, Hongyang Zhao wrote:
> Add clock IDs for MCLK_1 through MCLK_4 and internal digital codec core
> clock to the PRM clock driver. These clocks are needed to provide MCLK
> to external codecs connected via MI2S.

This patch has already been submitted previously by Neil, Please pick
the patch from https://lkml.org/lkml/2025/10/6/828


--srini
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48ab00..8c28d33b2a54 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -59,6 +59,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),

> +	Q6PRM_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
>  	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a32086fe..85e6df6bd39f 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -52,6 +52,17 @@
>  /* Clock ID for QUINARY MI2S OSR CLK  */
>  #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>  
> +/* Clock ID for MCLK1 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_1                              0x300
> +/* Clock ID for MCLK2 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_2                              0x301
> +/* Clock ID for MCLK3 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_3                              0x302
> +/* Clock ID for MCLK4 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_4                              0x304
> +/* Clock ID for Internal Digital Codec Core */
> +#define Q6PRM_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE         0x303
> +
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>  
> 

