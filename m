Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919244779BF
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636082; cv=none; b=ALI4WBQDpwV4mwJVken31J/btE5xPOMoM/8aq5beU3fIs8A0v4yJfF6/Wip7Qi9PpXen47uhEBYyvTxfb26EyFKjX1Iv5nBURGOjzxNKUzB3gSunVqIUlzIMFzms8hCVI6Cto3pWAlswygfbiUNMXDqh0esNnvPTfsDHH8R0dQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636082; c=relaxed/simple;
	bh=9P5ywowxZ7sG3J0zUIV+m1n+yJLNaTIzKokqaNzncAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SEYwE8umGf5z05WdDNmcWsr5zWlM6xOHh5gm3Ryk8oBYxUy5v8+ft7r6MGW91gFrYcUwPr82CT/ErifKl5mOXpvgaDoy9eHsWCzj96B58MPCdgKi3Yhpe+uPtFn7yuXDOVwp/RLl9a6UDI1vHpGQ7tbgSSWkT1dQWvwWoVBHTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3V67WP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvYwH9SU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3V67WP5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvYwH9SU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOgWi2544086
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpOyMKeLDAw+3XSNLlU8yH505LS9kArFfaRTBNtkEvs=; b=Q3V67WP51invc51Z
	BfpLxw+Mr+UvbTy6/2m4Bj9aMuvrTfLpMtbwNkRgeJLRIBnwoxwt0a195Cnp2c6L
	08vbPson04WvDAzA/0A712wPG40xpv9I6zHZeZ0SnZvb2hQVH+19xIRQY/MHjIOj
	XcO1Ob1bv8U3rY92+Mu5oxR5FEPGPuntGCem4j3d25wB4h1u+8paua1l/Z1mZQd2
	faCD8Ab5HqK9JUsq0rAHM+L6RDtmvzSc3wdkKoDbEOgl3E0qLkMMH8h366yoyvED
	YzQmtZAubIX3DOzTm4sQlYhBvz8ZRoJ8am5MO2G4337M/BJcVHAYbki9Vuk+Ml32
	0MPc0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct2rr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 18:54:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso916969985a.0
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781636079; x=1782240879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpOyMKeLDAw+3XSNLlU8yH505LS9kArFfaRTBNtkEvs=;
        b=VvYwH9SUHCA++qTEPOcn3t9wJqGLcvMiMycMqJZVI4PcUhAJ47SdPd8Pq7GIU3cXTZ
         NV+N9QIS5U+ngXt5rzaKmLrRVqFycjKmce8WgtyGE0cQVMabGj37Wnvd9pu9UCNrO042
         xg4BOKV8NHspFCcs4zWMsgnCIorQIfawVrn5OK83MQK2RiQXmNTPeGv948JnSKiD9dHh
         c+JiJ7Wy5oskkGJwHg2d9XqdRAzAS68KOj+TrzMJtkZ36pXg8Khw336xnjZb4qyTqEx/
         nSSE6P/MkLLdoxb4FbvfiVBsmFdwHQdhMSlYRxsnKUEPgsmj54B0y9OWIwJ94fbfCzp0
         1L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636079; x=1782240879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpOyMKeLDAw+3XSNLlU8yH505LS9kArFfaRTBNtkEvs=;
        b=i/8gSMrtcNtHvrbz4S/jQ5dj+Px1B6Ijen5pCi7eQSebiQeZmyGDzNrcxcD3yzqdXD
         LjAjoRZC74yXkupQW31WyWTQJiHYHibMAq1bh7YouSStc/E7ZpRbWR+ZCHxym2Snpeo/
         ndnPKYE7kFDejQrzihDdr9FsOjjmsOCTr8UxDLOoCLlgk/DevMtFYmmddwRw+//XfWKp
         QxrlNYhYTKWItrRmlqvdV0IgK9hDHqOx0j8AJVq4kTYZCkR7tYidEyIx6w+SC5cF/uNH
         g1Dka9H4qkDCvgU+1mEFH31/aKGqui7af/sqGrus8otX/+Xc2Mh1F+3c8Aw8iMJg1kFg
         LDRA==
X-Forwarded-Encrypted: i=1; AFNElJ8F8Vlx+qzUPY9qOTGF8Qs1NXwwy94AygYhuiYNzs/GItndBGLFcml0nhPJ9GpookoliPNjCqPJJvIYDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywVJZ16aaV0vOt2AuiPEDHibsIDAg1NXXjxbVzWpmHuWUmIL+/
	JtPy1YKxRmNi06YMetqGtXdl1cUH5terDd2q+bS+RC9Cs5TEbliYHBcFlusaoiGyS/I/HnQjFmd
	TTiwcN6bj3f320MewIIXfDjEoJB7yfIhpGwDP2H5nxpO/7szrTZIJ1OWrGADTdObEaQ==
X-Gm-Gg: Acq92OEFSzP2S4F8NQU77eMZ50F21P09r0ClTU1BGEVc2EG0Sfjm4YDEA0mhAw26l5c
	7tgDlsMbiXYY/3qUIZk4eb9Jnh7xsFNKJmAtwv6ntejpjS9y5Bx6xIKX5BiUiKcxDlvS/bu9Umf
	dwFqU5dzLP1wp/uXKe1qXVGyVEaPQfZfLRq6cxOVnjpNwRP7kRaIwnUR9iM+1+GzZX9qp+xJvyo
	H/kACupQ4KTSHvQsDxxP1ielflX15nNBVfMzwfDFJB794jdpwxvqJ9TSbluyvGfbFBHgYJyK5SC
	s0n8UI0WS8739eTjFiL/S79NhDwlLB8GM+vKoeUcY54UATl47tb2EYZSeX5qUmpW0fUeb0wgM0a
	F5i9BbjP/GYdCizeDOPUnPrEywTMzKKUPav1+EFEv2v25oza/
X-Received: by 2002:a05:620a:2b94:b0:8cd:9033:1724 with SMTP id af79cd13be357-91db9495476mr32832185a.9.1781636078796;
        Tue, 16 Jun 2026 11:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:8cd:9033:1724 with SMTP id af79cd13be357-91db9495476mr32826985a.9.1781636078155;
        Tue, 16 Jun 2026 11:54:38 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm1980892f8f.10.2026.06.16.11.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 11:54:37 -0700 (PDT)
Message-ID: <5d820cad-255b-4f9d-bf3c-1c7ab9e53f5a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 19:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with
 special WSA channel mapping
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a319bef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=igH7msBiZFST2wJAeAMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P2rzShJ3Bxz61f9hZM53dc6ASDcrGmTr
X-Proofpoint-ORIG-GUID: P2rzShJ3Bxz61f9hZM53dc6ASDcrGmTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE5MyBTYWx0ZWRfXyk81otlMcHq7
 8hx/9X4XfV7m91c/HTAKDp63GdNtyVzCKJFo5+eMpVwCAUuV7V+uGW+1oMFhsd3+U+b0aH3ho1q
 iRVqygrXKABr+flFEfE0r+NND35R/HzTZMxKEFTnohuTviTlTQquaOFaG2qN13kpT8Osqqp5fje
 92XOWU0Jia31HwVj9iU3NEFiyrLx04ZQF9mlx4ExNXV8VeQOccVkqNXX5L/zpFIV0UrPypQoIpa
 5asZo83Y1Z0ceVJRnm07/BerqQB3pnZinbjleR3iBV6VS4cYC+56P/8ZWijI6iaW6NHO68zrlpW
 zuKiovF4tSSTD/ynTUklc/732Av3LM27fcvcrXH/mKHA8oMNFnZ/qFGK7zVAOjdGzpqTDtAVpOy
 a6gHeC+qFf/dVR3+2B9Ulf7ztQj2gy1Ituisc2His3AE8qR3D4Ap+2aaHj+zqNABqSuUJx6kvvC
 r9flx274eQUFyw0Phww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE5MyBTYWx0ZWRfX/fRb9TntvoB8
 aIDzJZdvWVxBOqaEJe1/n7eXPQuGK8LTElAcC/Meq3ctcrZOGs8wW20HP3dRfssk4Rc6UiT+FCZ
 XsWp4O6P5HfVZok9zaIOQQLvcYTlTnU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160193



On 6/10/26 8:41 AM, Neil Armstrong wrote:
> The WSA Speakers are connected on the WSA2 interface, but the
> WSA and WSA2 links are handled as a single dai and DSP interface, so
> we need to specify the channel mapping of the Ayaneo Pocket S2 for the
> WSA dai in order to have functional playback and avoid DSP errors.
> 
> Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
> callback in order to set the proper channel mapping.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/sc8280xp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 1f3afc6d015c..2f1688c9f317 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -14,6 +14,7 @@
>  #include "qdsp6/q6afe.h"
>  #include "qdsp6/q6apm.h"
>  #include "qdsp6/q6prm.h"
> +#include "qdsp6/q6dsp-common.h"
>  #include "common.h"
>  #include "sdw.h"
>  
> @@ -49,6 +50,7 @@ struct snd_soc_common {
>  	bool codec_sysclk_set;
>  	bool mi2s_mclk_enable;
>  	bool mi2s_bclk_enable;
> +	int (*snd_prepare)(struct snd_pcm_substream *substream);
>  };
>  
>  struct sc8280xp_snd_data {
> @@ -193,12 +195,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +/*
> + * WSA and WSA2 are handled as a single interface with the
> + * following channels mask:
> + *  __________________________________________________
> + *  | Bits  |     3    |     2    |   1     |     0   |
> + *  ---------------------------------------------------
> + *  | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
> + *  ---------------------------------------------------
> + *
> + * The Ayaneo Pocket S2 speakers are connected only to
> + * the WSA2 interface and the WSA interface is not enabled.
> + *
> + * Set the channel mapping on the WSA2 channels only.
> + */
> +static const unsigned int ayaneo_ps2_channels_mapping[] = {
> +	0,			/* WSA Ch1 */
> +	0,			/* WSA Ch2 */
> +	PCM_CHANNEL_FL,		/* WSA2 Ch1 */
> +	PCM_CHANNEL_FR		/* WSA2 Ch2 */
> +};
> +
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
> +
> +	return snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
> +					   ARRAY_SIZE(ayaneo_ps2_channels_mapping),
> +					   ayaneo_ps2_channels_mapping);
> +}
> +
>  static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  
> +	if (data->snd_soc_common_priv->snd_prepare) {
> +		int ret;
> +
> +		ret = data->snd_soc_common_priv->snd_prepare(substream);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
>  }
>  
> @@ -273,6 +321,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
> +static struct snd_soc_common ayaneo_ps2_priv_data = {
> +	.driver_name = "ayaneo-ps2",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.snd_prepare = ayaneo_ps2_snd_prepare,
> +};
> +
>  static struct snd_soc_common kaanapali_priv_data = {
>  	.driver_name = "kaanapali",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -341,6 +396,7 @@ static struct snd_soc_common sm8750_priv_data = {
>  };
>  
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
> +	{.compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data},
>  	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
>  	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
>  	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
> 

