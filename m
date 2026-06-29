Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF4411680
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743386; cv=none; b=Q+qK9csCI/7KDNwIbovcxp30fSeJO4PdNWQWjb/QCMPdawhYnJiO8ZaIeBU+g9jKF1NlyrWPytQ5Xk/krBe8FhwOmfPhKXTZfzreJb+PjMfMH+FrGIS5zy3ayESJ5gbpa29ywkvdC5QjDQSgGXqWyOAJTwCGHzy7vD9QmLE09+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743386; c=relaxed/simple;
	bh=YHdENS5QrybigwPmSYcvEIYxrBr1qKFyawa1kVuvA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ckp5xKlTWkX43W2Db3SnJUTD9PjtPfU56bT4QkjbOMPw4Hbw1ZKz/htxBfdMJNHGp45ALg6BXpKvmxg82jdYXdXQ3liKltTQiJ5tO/IqgtS/Zg6u956cDrP75ERxRR56N6xMZp9uwSAorX8SuaqgMJTYCKNeWHID2VbT/ZCV8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTA96tLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHGMIMmp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTA96tLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHGMIMmp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASu2x2640954
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrPfCVtzcYTluJGDibIbTcC2lDYpcbpvsZXAB5YYg58=; b=UTA96tLAEifRgAa5
	FZDNJruqGHR9j/0I6myP22H0XA/Yhn8cgWybUCiV5oLasjuQaJnr9/RWwsfahbQw
	oi4u1y4/qe37tVUFej2wuElYm4Bi1UALqPQKhLBv9dGm7PPiy7l3mCcACoJRmuQ/
	NqEHlfEk53VtzoROux0RvTeYWy7LPzrlyvIA0O2IIJa9ALko9laOCvJshbjl774T
	zta6rsgGXQtbTmu/0SoDv8UQaTrV0FR6ozrzaoEjJkpmE+Emj5s0+13ptkWqwsP7
	MCoL3+3Uu/h+U3RTBjj16fwLzjctOs4fIG+kNmSjggzWedmVnEP3GdqfgYtEy4+z
	D3sGFg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1esc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:29:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966a617821aso1717447241.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743383; x=1783348183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrPfCVtzcYTluJGDibIbTcC2lDYpcbpvsZXAB5YYg58=;
        b=GHGMIMmpIj9HNiC9A68mRajxU9OmAtTw0A4dYs3rAlMPqOkxgj7r384tXkmwiNt9yf
         oGLG0IUr767HNmoVT1NmEGlDykloNv7+mOcr0Kux3et+aeHAksEZ4fLcJMbvh+0TTLkJ
         1nRk7UXdPg2DlONZIBTYce6RFPA/9rELSRgCRZklchntEMNQt67t4POnmhQaDyIueobA
         SoUM91qYmDVxyQvDz01PUIJZW3gjds4hNB3k9GiM93ALrmgWmoFDb6ct+eVTGiy/r8uz
         336GHfWEJtvLDZY7Q3MUzrkZMH3TBQrDZVA4OrlUEGocJsRwX9HmMwmUINjzH5O/uRNc
         73oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743383; x=1783348183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrPfCVtzcYTluJGDibIbTcC2lDYpcbpvsZXAB5YYg58=;
        b=EZFZ6E8ysNfL0fv1ykW6r8U3ASCNFKt7zeg1CFVhbY//pw0ZNib8DkoX8i7fMgdjxa
         0oCXs3edt9j0c58mJimwRkZJP4D27Zr+50nY3H5QqRqyM0klo8gXc9K8Lty+hMITZ2Dw
         DNWSYBie0gsvnhgjoAQriYUFfwqhLXHZJH1zEb+J/jGShHISDhaLJ3mfKSvNqAfX/kNF
         VYba5PuSS4lt/295A2hEft4yhx60WfU0ObZ5WNq9dDfCacV6k+YO4nTAc6U/SF+wl2CF
         QCrvXYhiGfC0pWff7+XbREil3lB8sqanqiLI9X7SatfqmZaUO69FeQO6UfJNubXpITzu
         mFWg==
X-Forwarded-Encrypted: i=1; AHgh+RoYMD5UX+aMAj8MsBOHYJi2z0Ej+O075yDueC3Ii2C4DRFJLBrHuTDQb/cWKA/5Ulj+6QqFDxKp7WSOww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIPEK3NQ/tZ9AIiPb+8CfTnEHXbmuSiDMX9Tu9iU7i0ILGir9L
	NmTvXtYeEvnNv4Zh+6hcCHp5ZA7zaQxs1o6RBEl7CsCCjBObHJ1oCVxJGqBUOCWrKgw3S+ThRrx
	X1m1KCDWBhO6tAd7OAaZaaDUkEUmfgzI4cUbwJ5bLRPJzQlIpYlZSLjNiiKeVSUGNvg==
X-Gm-Gg: AfdE7cncea6ysSSpmdbiTDRai8FnAW3bPuxuqjye62EFHNi/MwCHO22XPGn46VhLb8d
	8reUTXwQMlr2BLYxq8amQC6l4H+y7UnHMOrlmv+eM88Y+9KWUQxAIR2HcAku88LbmVGaCVa/N/3
	CqQZ1EXinVUghVUcFBYnsELVryquGs0wjQzHHb2GNFbz+U78GYJRvMf06tCs31EhCPisQ2ngjZ7
	z/JRb7LOQ3lUCg5SCHRUl9biY3FHNfIs4j2LqGAc3zVIe5M9yB0fteoHXOJnRSFunj5zUqVr8Wg
	cWYxQnIz/CgR/5vCSNTbvh70jmdfyJABTikleYYfCS/lennKe8W75RVmNGav6O8tjErwCA9sXJE
	XYQzLgwNvjZjDGX94ScOvC93tldpglySXcYqVAg==
X-Received: by 2002:a05:6122:1785:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5bdba587a99mr533880e0c.0.1782743382906;
        Mon, 29 Jun 2026 07:29:42 -0700 (PDT)
X-Received: by 2002:a05:6122:1785:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5bdba587a99mr533845e0c.0.1782743382102;
        Mon, 29 Jun 2026 07:29:42 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6983a7f3989sm4367253a12.16.2026.06.29.07.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:29:41 -0700 (PDT)
Message-ID: <6cc41123-6d6e-4a93-91c2-5a2035dfccba@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sdm845: skip set_channel_map for SDW
 stream DAIs
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX+53OfohaiCbo
 xWnVRkOUZca+BQfrv9pmJxpBlURfM6dsTocLo9IthNB8YC3MRN/nPI6v3pRlcKQH3LZBRmMN6cN
 3qBgM12L5KOR1CVt5fo9sTuh03lEO/A=
X-Proofpoint-ORIG-GUID: kV4HT2ryUF4zFWeBGlxzN1HZPpQT00Fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfXxft4vonQNb8j
 n6IZdCR3gJ/D/+jmjqfnYfqj7MDErg5nm0rulmOo/tZ1yRcOHwvWEn4SlmFAb30OrQK9eFdjrXc
 PdR9+nSSEm22wrpNlIS86m0AbXUQurq7jZ9V1FP8NeLPobLMNPjJ+QV0H68379rbOlGYH9TleYF
 r+zcq/6K065CHhL4VtrqbK1zdkC0RrYDi/3cSS670H8rSaEduk5CRzCmQbowHEo0b9buNsmGlDO
 ODEDY/F9z/3LGRrmo4D920cXod0KSX9TxzQG2quGcL8eRLvGDf3Ive+SgTJyHjqQHyJ74DPuwTo
 iKr/UG7fMmUItPECwHcSzihevKYjPbFwwEsGuxfND1nOMLyF/WJsbAtzXtlJvIusPJ82ikiKnuj
 sZKVWhx5/RwPu59OePSkeN19E/wFd1mR/kzaNS/nwfv0TIWMEm0Kxck+LPKYE6UD3s90OTD/5Vb
 nz0hnxym3p78Hp1Gqmw==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a428157 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UGUCIWXfjIFFGtpqo3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: kV4HT2ryUF4zFWeBGlxzN1HZPpQT00Fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290120



On 6/29/26 3:16 PM, Mohammad Rafi Shaik wrote:
> On sdm845 the SLIM Playback backend lists wcd934x alongside the qcom
> SoundWire master and its SWR slave speaker codecs as codec DAIs on the
> same link. sdm845_dai_init() was calling set_channel_map with hardcoded
> wcd934x SLIM channel numbers for every codec DAI on that link, including
> the SoundWire ones, corrupting their channel configuration.
> 
> Skip set_channel_map for any DAI that implements .set_stream, as that op
> is the distinguishing marker of DAIs that own an SDW stream path — both
> the qcom SWR master and SWR slave codecs register it, while wcd934x does
> not. This confines the SLIM channel map to wcd934x where it belongs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sdm845.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce9dff4dc52..509d7a551397 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -294,13 +294,26 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
>  			return 0;
>  
>  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -			rval = snd_soc_dai_set_channel_map(codec_dai,
> -							  ARRAY_SIZE(tx_ch),
> -							  tx_ch,
> -							  ARRAY_SIZE(rx_ch),
> -							  rx_ch);
> -			if (rval != 0 && rval != -ENOTSUPP)
> -				return rval;
> +			component = codec_dai->component;
> +
> +			if (!component || !component->dev)
> +				continue;
> +
> +			/*
> +			 * Only wcd934x (SLIM codec) needs these static channel maps.
> +			 * DAIs that own an SDW stream — the qcom SWR master and SWR
> +			 * slave speaker codecs — implement .set_stream; skip them.
> +			 */
> +			if (!codec_dai->driver || !codec_dai->driver->ops ||
> +			    !codec_dai->driver->ops->set_stream) {

This is totally a hack.

--srini
> +				rval = snd_soc_dai_set_channel_map(codec_dai,
> +								   ARRAY_SIZE(tx_ch),
> +								   tx_ch,
> +								   ARRAY_SIZE(rx_ch),
> +								   rx_ch);
> +				if (rval != 0 && rval != -ENOTSUPP)
> +					return rval;
> +			}
>  
>  			snd_soc_dai_set_sysclk(codec_dai, 0,
>  					       WCD934X_DEFAULT_MCLK_RATE,

