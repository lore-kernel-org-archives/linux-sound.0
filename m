Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36231201266
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346332; cv=none; b=B1JxjE925KMijHJoOlMX5Zcr9ud6/Vp/g2smF+ibg136FqZArZO3uowRSlDYj7A8c0Soyaucfcyhz9S7DDxv7fEJvwruA088ogTUVemwMm7Nn/FniSauTL8Xe3brzaZv5VsNvKxZt4OFCqDDbT4N0ZgzMMHCsuU7otZ/vmJzXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346332; c=relaxed/simple;
	bh=nJIebvcyngyJZ2+UfsCZceP9yS7NAjwxq6xcYNWN6dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5QGbFeKt+5AoHrAxQzlfKLAak7Ly0kMNcGBKL0qqQXWQ4foNJOHm7vCSrd82vk7e5ZfPNsb0kyjhfoovm2xMuVGVv0HCcUsutdqZFHxVL73YG7d6YXUcgnRSux+pyWFynPWgp7RAskBHczKY7uToZdQ2c9/9iuCZZJ4KYWTQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3T5nNp0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3T5nNp0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889Gt9g022886
	for <linux-sound@vger.kernel.org>; Mon, 8 Sep 2025 15:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMNRlKzBZ3IefkcX/KGz68yVL5VtqThtJH2q7iGmDA8=; b=m3T5nNp0HlxJj0Qv
	VkssrGVMFG/7TTFyE+uhTBdcNcA+x+0gG+bRZ+Hh8fZHQK9mUlH3T8L3hGBDowZ2
	p0LOg2aTbD00H6MgE7vQh06CR23yaAVHHtknSrsuNRapFfG6qjZIBKosM+n93kUC
	ozSkzuyrR4wq2kOzuPbjxxSxaot8DJfArcsI/OvXRBkHZeRabn0f9k8X+i6ZfT8x
	yKJ4FD0J4yzUWmeM/+61jW3hwKeF9ceIOSPB4R/nFLdj03vCSEY/WXBZHS3AlkNe
	Ctd7eaW0liAmqp6T2VJiNlQa1j9sdwJKRB0uoFxuW/tGNyBF97oWyuaWqQu05vEV
	aX7JNA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2123g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 15:45:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-718c2590e94so134034176d6.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 08:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346328; x=1757951128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMNRlKzBZ3IefkcX/KGz68yVL5VtqThtJH2q7iGmDA8=;
        b=sa+nTf0JofAc65BUu3t83F6Osoaza3h1ICdkk/68eom1DaCcsCh/7vVUCfVXIdDnvl
         1jbOFuCn01zGJ0yZj/HouJ0XuYxrK7GEaNVVKPUjgPDgRDbiI9bneNIPR7RLDdOq5afj
         H7q4eT4xRCHyX1lkflEuiqluNALXDpW/DW4CPD/sDM5ppQJOx+Oc+x5k5xsVGQJH9Sjl
         er5Y2HDft50P/5an8s4lTIiP5WrnSTWGCQCMcvtL1AytMflEE0KTKoUshkYQa4szZAYw
         9QcmFAgjZREAtB6fRh25mbW/H5j3zCOd0qhUqU8pcmAu1T18etp7b27wEJ4ketW+A15e
         kwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWtIzAdC4v3kvtpBABSfZfb/Tgd7cHKvKS01lGkhInzcNQh0GOTBsoooI7EqZ5KQezp+DmWSGYRZBi+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXrkqeMjFi2fGE7JIvSVi/TOKM9+g6D+MT6kpTWyADe/Mirwr2
	BGSqB1WGC5tpiRTvEL++C2daNiurShdKEbOURTvtFfykL7dM8g5BLD+0JGyKsmQ/wpOR77j548s
	VaQ2OGIQDHlSdFbh1TffrvZ+3t41P8P9GwUx+UbCuHVMcmXH6kqYr7g0zypNiVj4p5g==
X-Gm-Gg: ASbGnct6WsQIbZktimNcuvJOlTiNc04Zmc7dq5jAXC9AgzkvZ7yqkv0HWZWVivVFtad
	uORT4KRBjJXMyhiSnVWpQ2zydIl3Sj6zPI9VTOaIaol2ZWukNPqzbCpO5OGxGABJ6r9xp2eZ+Ny
	e2gnDAIMHXnrnWqKEXSG+Py5qFux4JdBhEKfJpAJghdjdhy6XeJy/WBsl8GwZH/3+JvSzwPTv1J
	vNm6d0bdqJmJ0iznQwLcbGgewu46B0fGMeTLwEaamEfUtukk53/jtWGPyVsUy5iruCBHldp8rVi
	3XXXMhC9w0wYEt49ize94H3iLkqHOEvkEfmiHuC5w+ld534NZbHvEqRxWhbwLQw46qQ=
X-Received: by 2002:a05:6214:1d24:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-72bc5746fd8mr136887646d6.30.1757346327872;
        Mon, 08 Sep 2025 08:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtI2W+SVe5jgIkKVJegNqUo/KHDwuBa+slvMvbAKTs7rlFU/MUiVUjxng1HuQHTtLbnh2XdA==
X-Received: by 2002:a05:6214:1d24:b0:72a:2e5b:af2f with SMTP id 6a1803df08f44-72bc5746fd8mr136887186d6.30.1757346327206;
        Mon, 08 Sep 2025 08:45:27 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm447523425e9.20.2025.09.08.08.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:45:26 -0700 (PDT)
Message-ID: <690423ac-4283-47a0-9250-4c740978ccac@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 16:45:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: codecs: add new pm4125 audio codec driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        christophe.jaillet@wanadoo.fr
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
 <20250814-pm4125_audio_codec_v1-v3-2-31a6ea0b368b@linaro.org>
 <df884334-c850-4ae9-b5e8-63cb834ae259@kernel.org>
 <DCNIVW9XSSY3.3H7TSNFDH7TKT@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DCNIVW9XSSY3.3H7TSNFDH7TKT@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68befa18 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ENUQA5pCW4QF4dO5OUwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: QjD7sgv_uMLz6K2CI92zmdb_mkcMglUe
X-Proofpoint-GUID: QjD7sgv_uMLz6K2CI92zmdb_mkcMglUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX12eI0W9rxdW5
 mWhFYWZ7xpIv6ygxfpSIaVJZc1b1M5qpXE/A87EzniEAFJKZEh20CKze1dCDPiMzs62eC3nJ2Nc
 6n6ZF1NJMJGrJ6viDT2OdcuccL8+Wc2r5scKS4n+Ok/XtGcIQCd4g2t5wfkH0ATC7ahkE6Nad/+
 XQRGt0GXYgphE1aRPdamnMLBK0qQnKfAP12d6cViDF+69nkwdbLdxenSeavjOdBB7APkHHyufSV
 BMuhzJ9FJcVKynFLasmlwJOpR0TFL9Pyo1EE/nrR16xrOfp+woYra+JyfIeCbWIFH9HurLEzv9q
 SRYHv8qkJFiMd9B9ySc0Y5J+vHDJAemOEchn+rfbqhsZx7AwAVvRAbiPh5Pa6+NOJFETCLJr0NO
 fdR6sR15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/8/25 4:26 PM, Alexey Klimov wrote:
> Hi Srini,
> 
> On Fri Aug 15, 2025 at 4:36 PM BST, Srinivas Kandagatla wrote:


>>> +static int pm4125_codec_enable_rxclk(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
>>> +				     int event)
>>> +{
>>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>> +
>>> +	switch (event) {
>>> +	case SND_SOC_DAPM_PRE_PMU:
>>>
>>> +static const struct snd_kcontrol_new pm4125_snd_controls[] = {
>>> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
>>
>>     SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0, ?
>>
>>> +		       pm4125_get_compander, pm4125_set_compander),
>>> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
>>
>>        SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,?
>>
>>> +		       pm4125_get_compander, pm4125_set_compander),
>>
>> This is same issue in one of the WCD codec, which am going to send fixes
>> along with my original wcd fixes series.
> 
> So this was in other codecs for years, right?

only in wcd937x since it was added.

> 
>>> +
>>> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
>>> +		       line_gain),
>>> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
>>> +		       line_gain),
...
                          PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
>>                                       PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
>> @@ -309,8 +307,6 @@ static int pm4125_rx_clk_disable(struct
>> snd_soc_component *component)
>>         snd_soc_component_write_field(component,
>> PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>>                                       PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
>>                                       PM4125_DIG_SWR_RX_CLK_DISABLE);
>> -       pm4125_global_mbias_disable(component);
>> -
>>         return 0;
>>  }
> 
> This doesn't work. Playback has two issues: 1) volume is very low and probably
> not adjustable and 2) sound during playback dies after a couple of seconds.
> 
> Returning these global_mbias() calls restores the good behaviour.

What is global micbias to do with rx playback? Maybe something is missing.

Which RX path are you testing?

I am testing this with Headphone and Lineout, it works for me.

> 
> Maybe let's make a widget out of it? In such case I am not sure about
> routing meaning that I not sure which paths do require mbias enable.
Not sure why RX would need mic bias?


--srini
> 
> Best regards,
> Alexey

