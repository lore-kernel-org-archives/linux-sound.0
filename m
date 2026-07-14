Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143813FC5A5
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017937; cv=none; b=GMflu+VKBZprm+bhaQFQ+2uzsHvd5r78uaCgiVVT2J+/bEKcWHZelSkLPhnmfJ82/ro+iizSJBuv0GVVJaGT9W5c17iRQgQLS/8AoMlyjlHb+87qUtAoJyHA03br29jD7EV6kEa7nI6g4nC57IEXVxGIzlUthXk6KMRce9Awcg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017937; c=relaxed/simple;
	bh=BNx/cHZjW+rS8Q0g1cL/miwCM3f1tAwoVC1y8S6rPC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXqh+nqk5vX0xxiEBgltp37Cluvv6i5Tu2XuA5DZVg7e9/UJz3gtNXOLAei6nhWVOo+V67leNFu83ha92Ml3EWchi2pWjYb3yYijy5/nfz7ZHzYrbdbvHdJ6Uf4exMbLgnWr9trYGi57wiqvKxAY7wKR7IxVlTZGOJqt/7c/eqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMkwNLts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNT/fMbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMkwNLts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNT/fMbq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SZEG4005248
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=; b=lMkwNLtsH1RglDoL
	P1957EJSlyfKvaozt+JP44IRJI5mL2BvDVIgpcgX5AskFCdvfn9OxCs4lwL1jwj1
	IGPB5GCNAynYZUvx932/BIca71ykrUbY3ENbOLPthTsyD9EPVqAIM1xNc8Ixan4X
	kfci8NnUFqt3znAzoX34dxrD4lQdOqQ/NHVfYvLdNy3+evbe/b1oYE1R+2OBA2Gb
	RZFtWIHyZQjDPJPD+DLW/HtMXDvPVBvIZRGBtCU5RL+U+sl7wwbch+ul3FcsQem/
	SCZfILDZkHeCENbalt7mujhh5qg65EEy24eJmGPWOzTLaApZZR8Kq74eitlO0z0E
	74lPsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctu65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:32:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a87ef9713so6664101cf.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784017926; x=1784622726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=;
        b=dNT/fMbqfiPU6N2La5Y9uF1yXcQgAxHx98m6jOYoO/lacSJzV0dJRT+mwgl4UaILTf
         kCaG2hp+GzGSFfEHja30F7CCTy4ojR3DVAbD5hNe4szbZMTUlbjEaLiLLz4aKk5O9Dkj
         mPYx/DMos/eLT+QAGUCZFMdx8ZP2RsialvqNcI8QC3sDhp8/UeBWyCbBfNdavaOi5Umq
         ZQxfC78oL/oyxEbeB3iY1ZPq8z9R0IQjxzRl4QdJWaL1jmEA2JmQ6SLrvGYp3oQWnT0g
         wamTSivdHXa57jIzEZsxCildzif30MvB0sFYQHBpWb80jN1lyF4VgpF49iT+troT9toM
         n/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017926; x=1784622726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=;
        b=kuna1Pnz0yn8f2vBEew6aa9h6JC8XrdoHOmsByjnzqzL5CAt7nnHGAhYjPBEQ2AJns
         bNGjOIPgQ1TqTkC8EBf6h3aNZ0bnENzk5K4XBOSV8mc7Zcvb07GA0zcaJBV45Xqev85F
         5cOALNYrVX3uZSfLNHbUe4du1UCmeTgE9fUgr/s1227GM9xpWKjTVsZxElQF5DFmGiWX
         D+xDSlomG0IXG9ZzgndmnWWUQ6jqptHP7pkfyo5tiBZMn8+fDE3aMBfzSBuQzqN/vS3k
         udN+H41H/MYSSocCTxzpZCiccxVWbEwuXJo4XbA5d8SYeiPeOk7795FxKmAqoCkPRikP
         m5Ng==
X-Gm-Message-State: AOJu0Yxfbq+lkLJV7prFyvIyhAUPm6E0Em1X/BWp1qLPzy7RV0oIWlmP
	RKhpdf6Ayrs+s578Y+pu7PF/0CCO/4OIaaZw7HTMkiS6THyvR4N4qNevEvPU5LTROTqbobpz+r/
	qn81Mzn66uC6vDCdeRgjmSqzl3bEbfl12p2WID2bc+pKtcCqIjuolCvO3pr9keIBqMA==
X-Gm-Gg: AfdE7clKEzjGZgktiTiIDnHO68im69Hb2rP0bBpsgtUtqh9bg8nk2phGq9aWsDNjBTf
	5lQr6xt/d2E9pk5fyGuDGutjvyrThayo74iKspSewGlw5WY7wwyoqO1NmesQGwY3oRir31bTG8z
	Wicmzq/uAXFCp4s0ADTq6qH/gq5VzRFGaM7VPKrsELMTfkdkenm16wKB8IW0O5IDm/0LJPEEbqV
	ZhZaW1lJ3ddBCUUQ+h9BX6hJn62pqzpY6oKU+iJUPfEE++RaQ5Q39/5bjQYqswOkimfut0D4asS
	pK9Lh+ptEYNvgWT8QNcFcwEwpd+5h56dC6cn10Idnpv+wKMT32IiajvOu5TXkpNDldI/vzlwMoN
	ALAiX/ge8vbQJN74KGOVAptoVTpT9vrFGKI6wlg==
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr167868851cf.0.1784017926317;
        Tue, 14 Jul 2026 01:32:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr167867781cf.0.1784017924003;
        Tue, 14 Jul 2026 01:32:04 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm897380266b.42.2026.07.14.01.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:32:03 -0700 (PDT)
Message-ID: <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fjBih4ajZm3WVkvA1UGz7X7ITuQR7Y7P
X-Proofpoint-ORIG-GUID: fjBih4ajZm3WVkvA1UGz7X7ITuQR7Y7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OCBTYWx0ZWRfX+ACMbMzhDeWp
 55vCJi8GOLMRsIgBeo7Slv1bWyV2ZUCLB98kbF4NHcPfwbxHOi22HRYKyziKVK1kLPwJBpio5jy
 IKzb+wKq+Be0+NVMwNi6go17qFwxwEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OCBTYWx0ZWRfX4J67KNySfQax
 ifxKvqVzMQsaWr1KPlOB0kecQRG+fwNQURemTpwuk2OPZOoLsf4NaEc/rmxzc018Fhcv6p5AISz
 Jp8QLkCWz/dFWCTJEWxs16eszCG2gAoO0JETBJYs6t1e4yWV1ljam/Wr/YnnA6Q6VFbYgKVTeyh
 /FNhndVmFd8OJEKm8sgQNfq+2U6ZkXn+RMkAZ/ml6Q67Sgc/f0qFVLMSS1/dX9Y+AHzifvD/gZW
 SwGL0A83gbazG+Q1Es1yaTs5rVmF1vppebPuRjKwRbBCBqqlCuNqpklvI+wGNHhaGK74EjAF2q2
 GzLm2uRZMWPqO85VCiRWRzkJSbt4L8ztAX0N5YEmQHb3tXSsLTlDqjjqsSpky0oNImavUWIoy93
 8hocKuKFq2pLQDQzF6jrTtW6ydYcmFAmHzmvb/gbct/806XYe/bCTvH2LJX4yDPY2hA5KuihRs5
 iBxDu7+HUR8AeQ9Muig==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55f407 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHJlbi77fKg4ZXaQ5xoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140088



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
> backends can be configured through the normal ASoC hw_params and DAI
> setup flow.
> 
> The TDM set_tdm_slot() callback validates the supported slot width and
> slot count, stores the active slot mask in the AudioReach module
> configuration, and leaves existing DMA, I2S and HDMI paths unchanged.
> 
> Reuse the existing LPASS child-clock handling for TDM nodes as well as
> MI2S nodes, since TDM backends also request optional backend clocks
> through the machine driver set_sysclk() path.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 57 +++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 5743586ff..672189625 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -372,6 +372,50 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	return 0;
>  }
>  
> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +			      unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	unsigned int cap_mask;
> +
> +	if (slot_width != 16 && slot_width != 32) {
> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	switch (slots) {
> +	case 2:
> +		cap_mask = 0x03;
> +		break;
> +	case 4:
> +		cap_mask = 0x0f;
> +		break;
> +	case 8:
> +		cap_mask = 0xff;
> +		break;
> +	case 16:
> +		cap_mask = 0xffff;
> +		break;

switch (slots) {
	case 2:
	case 4:
	case 8:
	case 16:
		cap_mask = GENMASK(slots - 1, 0);
		break;
?
> +	default:
> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		cfg->nslots_per_frame = slots;
> +		cfg->slot_width = slot_width;
> +		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;

Should we validate the tx/rx mask here if its with in cap_mask range?
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_dai_ops q6dma_ops = {
>  	.prepare	= q6apm_lpass_dai_prepare,
>  	.startup	= q6apm_lpass_dai_startup,
> @@ -401,6 +445,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
>  	.trigger	= q6apm_lpass_dai_trigger,
>  };
>  
> +static const struct snd_soc_dai_ops q6tdm_ops = {
> +	.prepare	= q6apm_lpass_dai_prepare,
> +	.startup	= q6apm_lpass_dai_startup,
> +	.shutdown	= q6i2s_lpass_dai_shutdown,
> +	.set_tdm_slot	= q6tdm_set_tdm_slot,
> +	.hw_params	= q6dma_hw_params,
> +	.set_fmt	= q6i2s_set_fmt,
> +	.set_sysclk	= q6i2s_set_sysclk,
> +	.trigger	= q6apm_lpass_dai_trigger,
> +};
> +
>  static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>  	.name = "q6apm-be-dai-component",
>  	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
> @@ -429,6 +484,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> @@ -490,6 +546,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>  	cfg.q6i2s_ops = &q6i2s_ops;
>  	cfg.q6dma_ops = &q6dma_ops;
>  	cfg.q6hdmi_ops = &q6hdmi_ops;
> +	cfg.q6tdm_ops = &q6tdm_ops;
>  	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>  
>  	ret = devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);

