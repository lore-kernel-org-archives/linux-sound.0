Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A34AB1D7
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054134; cv=none; b=RWGqYClOnkHsQKO270j7/nh5htFapEzDgRJCIVlYJxEQl4sN3YuoloqyNpknu+o8IR0tASMwaaWlYFVcLhG+OoMgWgO9Jl5wtcmB3nJID90DQiNq5PxxFnGDv1uBS1RhoYLMb+S22nWb39xtjJKpPINLF7mM/Ky/te7Tgi7hZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054134; c=relaxed/simple;
	bh=y7ON+8qcT81Vfk2WnWiNZ+guWKPeprgicnwgnK4Rabw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuiH8z9XP1TzhY1zLv+jACI5qaLD+v8THY80wyVmd6+An/tNadpEhFtjrcU3LLjtiHoNl7BuDh2bt09MQqttpcH2EaHx7Uc7RezKwSgT6eNO0gDf5b1qXqh+uUeqNwP+fCp0xuLYH1vA7KwVMoCnIMrmGegirReEzsYFWIl0HLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ze6h9acA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g34eL2Iz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ze6h9acA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g34eL2Iz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6Or3S644679
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 08:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CQ7otyR+RYmTpGsE7cFuhQgfjawgGWN8r9jLptBkR0=; b=Ze6h9acAYpsMtz5j
	1werfpAfpR4a+T7mGVZ48Y6ylTDSFbW/8vXFpoiphcSF3foOiGWywQYDfcnAdd/I
	l1CoeBqrNjl/yf77+PVQ9Z7oG3pJfvD8v43gKpjKJ2NDHVWxCiZlyrys3X9sRvck
	tqW78ATShQvaOXwnEMVB9bp6eA10p5AbsPhz3sAj5yLUfTqlNJ0n8Q+67wXSgtgX
	aVgLGBVHyFG/Fq+2g8+nlhFQgdKIFl6pfwNtN/EhIzrFX9itDH3lQENGFYcra5dG
	JxhTa6bXpeiOCKzwnJ3UCk5HdBs5Dt+So/D2n5U2q7BCKlIg0Zh6n7+vFBMzRxcO
	orPciw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya2k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 08:48:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91064f6e75bso173546236d6.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054128; x=1792658928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CQ7otyR+RYmTpGsE7cFuhQgfjawgGWN8r9jLptBkR0=;
        b=g34eL2IzT/N6CyAKOi5Y3VzCx2dOLhUkQdvQOk2Bm9YF2OXJqGhDKszFPUAfDJuXC5
         V4wYdEPnW6w9yBwygvC50X724DrkOQ5/NlZoUhaF5dyyil5XLePYbpQgAQtUySL37IlB
         kdQ5mkBUcfzj5xj5vsa91TkKz6x0Z5UGjzPNAqaaxYHUP6JdMdhx3oxsNRQ1rFiTlZ4W
         v4q65VyHUrzZE0ekv+Bkx4suNm3EMNWUAADq1dXvaOOmws0t8O0I/huPaBc1vjXA2NjV
         PPZFwt/67oE6Spma/lehU6Wq/KIAO1ZYZN12qUf3UsHfbwbgBvb3ayKFfqgSr3fSum3S
         yFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054128; x=1792658928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CQ7otyR+RYmTpGsE7cFuhQgfjawgGWN8r9jLptBkR0=;
        b=cPs1bzjRaEmfkspWHXp43My0qNUBYfMimaRY9IQCVN93fyeiro6H2cX2wDJpnhUVkC
         BAXFEBlhUvoIlQK2UuwJaQGqG1/IqMXA1Xk64CjEUB1dm/VvzPcg9p0WneVCBD2U5fCc
         5JeW0Bcu7rJHtpKmFLf8kx7ixl1Hujdxtkctq5JHTi0hsnQGqk2a1EIXyyIbUqEstWU4
         OeH8iZXXwcsnf/h9DEyUrlUjJU65rcAKJgzObUIugckF6jKXIzezViFHHDU8T5jYfndl
         LD4mVFPka0XVvZgeoKYDDXeAo2RwleWoLArfqPGPvWIPytO19Wi6FI1D+j4Abu4HMulP
         5cDg==
X-Forwarded-Encrypted: i=1; AKwUvBwyrbbLuSBHuG6rnAWHg6WOaoX0JdpPZtGZye4qENOnGv7GRsUTkSulZb3v8r13WBcw6e5uPSflTYJ2GA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJE1WfNGoLqOgewQ0lggQ0HLsfVp/oKhQShn4rdvrVc4Y7+AvBa
	n4Xn8+Zjkez1Vyy5BjjuLjqRCI5Tj+e878wvoTR08QYJ50aL04ylu1QnGc6EIEtC7Jmvw2bEp/E
	4J+y8uSqEzq+C4cDC45NH8Zr7HG83j1HAwfieyqVSfuvmSQ2btPyZHLOcnbqkOGPqmw==
X-Gm-Gg: AYBFou0cpbAxrUbHM+cVZb5CNPrSqu3h0NXuf71wbyMhW55z2ALZaxXCP9oZ2fC52mk
	L+uFg9pZ+OERI7SkVna2mUNtXYSpKPAxxNxNM+R07bcT/nmtVf8+TC3u488Ogjb9ajFWNHvuU12
	ySNreN0/qLFRBcgneyGlLW6y487zbBw2p0PTnxa7DgxGyvfie7ShnEGnMLJGlWr15ijaCnmWZ5g
	t6OzSpMh+M0S2O16bIlr07dsN/7NavxMgt6SZqtTjMyQouNklH6TN5h40iOCZDakqapvuedsQC+
	Uc9OcFn3xKkO/1SjDOfBEqSkOEY3W73E0Y1NvtRcM3FAUeN7v3UlxxS9ufBHbvnVOeqhhpHwWt2
	pM1YJGBhbQ3JoRtwXv/xb7FUaYg==
X-Received: by 2002:a05:620a:4556:b0:93e:bdeb:f067 with SMTP id af79cd13be357-93ee10415cemr2008779385a.48.1792054127926;
        Thu, 15 Oct 2026 01:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:93e:bdeb:f067 with SMTP id af79cd13be357-93ee10415cemr2008776585a.48.1792054127436;
        Thu, 15 Oct 2026 01:48:47 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm63749335e9.5.2026.10.15.01.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:48:46 -0700 (PDT)
Message-ID: <3c284bd6-20ba-4ce4-8421-56ac48be457b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:48:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-4-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-4-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NSlZ4qXfg3PbdpHPQwnX9I7IrmLNsCp5
X-Proofpoint-ORIG-GUID: NSlZ4qXfg3PbdpHPQwnX9I7IrmLNsCp5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX0mWhelT4AW/9
 5devEbP90nDpteRNi+OU1Bjiro6Idj1O1qiQ+1FZ6pZ32O89MZClcprvdNo6WzHXn9CpvTN0rv9
 qEE2TsD74inS7T2X+y2EL9EifWWmV8k=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad09371 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FTiPbF0PEYynNRljgLcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX/Bh1jeoMS6+A
 3KaTJlijR/45O8n7ec6mOJMIVSeBGPFYydrDitwo1/X1BTHw46M1mm31wMLB8m7lcWClwzTFbpB
 Xa81V62pkPc+GvSUJS+QqDE9pmkohx94u9eGgpHLIzFfx2+Bo9zljUnGGXfS27X1MaCz0eF12a2
 wxhIbMoYIPWlNxQRwNC6jxDjP50Iws7yFBQ1zs32LN7YKhjekF9nxWd0nv7nhtNndnBNF26z+/A
 mRXeEF3LruI5FkBDGdD4KC9q+9yjXIlJ/TNuz/vwfcPD9rwFjJAEbYKt6WKLjcPq7UdpJZ/n6lT
 k1l3QtXLC/+5Rl42AoWjrFxkETHY5tSSlD9yxZG+YEdmEd/CIAMZmcMR5U3RmcLoQBwRavhRmAK
 h4uRzTn8QCF6PbKK8mPVrg2KDXvBcGHxWL6Al6iHba2e6v3mX72qAOebFWqGXKfCUanSje2lpvs
 KJckh9+xXhPf9hJmmDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

On 10/13/26 6:51 AM, Harendra Gautam wrote:
> Add the QAIF CPU DAI driver to support Qualcomm audio interface paths
> used for CDC DMA and serial AIF audio links.
> 
> Implement CIF DAI operations for CDC DMA paths, including channel mask
> programming and dynamic clock control. Implement AIF DAI operations for
> MI2S, TDM and PCM paths, including format setup, slot and lane
> configuration, bit clock management and stream enable handling.
> 
> Also add the QAIF MMIO regmap setup, parse per-interface configuration
> from devicetree, manage required clocks and register the CPU DAI
> component.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qaif-cpu.c | 886 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 886 insertions(+)
> 
> +	}
> +
> +	idx = v->get_dma_idx(dai_id);
> +	if (idx < 0) {
> +		dev_err(rtd->dev, "Invalid DMA index: %d\n", idx);
> +		return -EINVAL;
> +	}


This is repeated like so many times in this file,
may be consider a helper,
> +
> +	reg = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +		QAIF_CDC_RDDMA_INTF_CFG_REG(v, idx) :
> +		QAIF_CDC_WRDMA_INTF_CFG_REG(v, idx);
> +
> +	return regmap_update_bits(drvdata->audio_qaif_map, reg,
> +				  QAIF_CIF_INTF_ACTIVE_CH_MASK,
> +				  regval << QAIF_CIF_INTF_ACTIVE_CH_SHIFT);
> +}
> +> +
> +static const struct regmap_config audio_qaif_regmap_config = {
> +	.name		= "audio_qaif_cpu",
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.cache_type	= REGCACHE_NONE,


> +};
> +
> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +				      struct qaif_drv_data *data)
> +{
> +	const struct qaif_variant *v = data->variant;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *intf_np;
> +	struct qaif_aif_config *cfg;
> +	int ret;
> +	u32 dai_id;
> +	int intf_idx;
> +	int num_interfaces = 0;
> +	u32 val_buf[QAIF_MAX_LANES];
> +	int j, n;
> +	unsigned long configured_intf_mask = 0;
> +
> +	for_each_child_of_node(np, intf_np) {
> +		if (!of_property_present(intf_np, "reg"))

Do you have anyother childs that will not have reg?

> +			continue;
> +
> +		if (num_interfaces >= QAIF_MAX_AIF_CFG_CNT) {

This limit should be part of dt-bindings, is this hardware limitation or
software?


> +			dev_warn(dev, "Too many AIF interfaces, limiting to %d\n",
> +				 QAIF_MAX_AIF_CFG_CNT);
> +			of_node_put(intf_np);
use scoped ones here.
> +			break;
> +		}
> +
> +		ret = of_property_read_u32(intf_np, "reg", &dai_id);
> +		if (ret) {
> +			dev_err(dev, "Missing reg for interface %pOFn\n", intf_np);
> +			of_node_put(intf_np);
> +			return ret;
> +		}
> +
> +		intf_idx = v->get_dma_idx(dai_id);
> +		if (intf_idx < 0) {
> +			dev_err(dev, "Invalid DAI ID %d for interface %pOFn\n",
> +				dai_id, intf_np);
> +			of_node_put(intf_np);
> +			return -EINVAL;
> +		}
> +		if (intf_idx >= ARRAY_SIZE(data->aif_intf_cfg)) {
> +			dev_err(dev, "DAI ID %d maps to out-of-range intf_idx %d\n",
> +				dai_id, intf_idx);
> +			of_node_put(intf_np);
> +			return -EINVAL;
> +		}
> +
> +		if (configured_intf_mask & BIT(intf_idx)) {
> +			dev_err(dev, "Duplicate reg %d for interface %pOFn\n",
> +				dai_id, intf_np);
> +			of_node_put(intf_np);
> +			return -EINVAL;
> +		}
> +		configured_intf_mask |= BIT(intf_idx);
> +
> +		cfg = &data->aif_intf_cfg[intf_idx];
> +		if (v->aif_full_cycle_en)
> +			cfg->full_cycle_en = v->aif_full_cycle_en[intf_idx];
> +		if (v->aif_ctrl_data_oe)
> +			cfg->ctrl_data_oe = v->aif_ctrl_data_oe[intf_idx];
> +		if (v->aif_loopback_en)
> +			cfg->loopback_en = v->aif_loopback_en[intf_idx];
> +
> +		switch (snd_soc_daifmt_parse_format(intf_np, NULL) &
> +			SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_I2S:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +			cfg->invert_sync = true;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_A:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_ONE_SLOT;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_B:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_SHORT;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_SAME;
> +			break;
> +		default:
> +			break;

Error?


> +		}
> +
> +		if (!qaif_is_aif_mi2s_port(dai_id)) {
> +			ret = of_property_read_u32(intf_np, "dai-tdm-slot-width",
> +						   &cfg->slot_width);
> +			if (ret || !cfg->slot_width) {
> +				dev_err(dev, "Missing/invalid dai-tdm-slot-width for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return ret ? ret : -EINVAL;
> +			}
> +			ret = of_property_read_u32(intf_np, "dai-tdm-slot-num",
> +						   &cfg->slot_num);
> +			if (ret || !cfg->slot_num) {
> +				dev_err(dev, "Missing/invalid dai-tdm-slot-num for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return ret ? ret : -EINVAL;
> +			}
> +			snd_soc_of_get_slot_mask(intf_np, "dai-tdm-slot-rx-mask",
> +						 &cfg->slot_en_rx_mask);
> +			snd_soc_of_get_slot_mask(intf_np, "dai-tdm-slot-tx-mask",
> +						 &cfg->slot_en_tx_mask);
> +			if (!cfg->slot_en_rx_mask && !cfg->slot_en_tx_mask) {
> +				dev_err(dev, "No active TDM slots for %pOFn\n",
> +					intf_np);
> +				of_node_put(intf_np);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		n = of_property_read_variable_u32_array(intf_np,
> +							"qcom,qaif-aif-lane-map",
> +							val_buf, 1, QAIF_MAX_LANES);
> +		if (n < 0) {
> +			dev_err(dev, "Missing qcom,qaif-aif-lane-map for %pOFn\n",
> +				intf_np);
> +			of_node_put(intf_np);
> +			return n;
> +		}
> +		for (j = 0; j < n; j++) {
> +			if (val_buf[j] > 1) {
> +				dev_err(dev, "Invalid lane-map value %u for %pOFn\n",
> +					val_buf[j], intf_np);
> +				of_node_put(intf_np);
> +				return -EINVAL;
> +			}
> +			cfg->lane_en_mask |= BIT(j);
> +			if (val_buf[j])
> +				cfg->lane_dir_mask |= BIT(j);
> +		}
> +
> +		num_interfaces++;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * asoc_qcom_qaif_cpu_platform_probe - Probe the QAIF CPU and platform driver
> + * @pdev: Platform device
> + *
> + * Initialises the QAIF regmap, parses DT, sets up clocks and registers
> + * the CPU DAI component and PCM platform.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int asoc_qcom_qaif_cpu_platform_probe(struct platform_device *pdev)
> +{
> +	struct regmap_config regmap_cfg = audio_qaif_regmap_config;
> +	struct qaif_drv_data *drvdata;
> +	struct resource *res;
> +	const struct qaif_variant *variant;
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *match;
> +	int ret, i, dai_id, idx;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate driver data\n");
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match || !match->data)
> +		return dev_err_probe(dev, -EINVAL, "No matching device data\n");
> +
> +	drvdata->variant = match->data;
> +	variant = drvdata->variant;

plese use device_get_match_data() here,


> +
> +	if (!variant->get_dma_idx)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "variant is missing get_dma_idx callback\n");
> +
> +	ret = of_qaif_parse_aif_intf_cfg(dev, drvdata);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse aif interfaces\n");
> +
> +	drvdata->audio_qaif = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drvdata->audio_qaif))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->audio_qaif),
> +				     "Failed to ioremap QAIF registers\n");
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get MMIO resource\n");
> +
> +	regmap_cfg.max_register = resource_size(res) - regmap_cfg.reg_stride;
> +	drvdata->audio_qaif_map = devm_regmap_init_mmio(dev, drvdata->audio_qaif,
> +							&regmap_cfg);
> +	if (IS_ERR(drvdata->audio_qaif_map))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->audio_qaif_map),
> +				     "Failed to init regmap\n");
> +
> +	drvdata->aud_dma_clk = devm_clk_get(dev, "aud_dma");
> +	if (IS_ERR(drvdata->aud_dma_clk))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->aud_dma_clk),
> +				     "Failed to get aud_dma clock\n");
> +
> +	drvdata->aud_dma_mem_clk = devm_clk_get(dev, "aud_dma_mem");
> +	if (IS_ERR(drvdata->aud_dma_mem_clk))
> +		return dev_err_probe(dev, PTR_ERR(drvdata->aud_dma_mem_clk),
> +				     "Failed to get aud_dma_mem clock\n");
> +
> +	for (i = 0; i < variant->num_dai; i++) {
> +		dai_id = variant->dai_driver[i].id;
> +		if (qaif_is_cif_port(dai_id))
> +			continue;
> +		idx = variant->get_dma_idx(dai_id);
> +		if (idx < 0)
> +			continue;
> +
> +		if (drvdata->mi2s_bit_clk[idx])
> +			continue;
> +
