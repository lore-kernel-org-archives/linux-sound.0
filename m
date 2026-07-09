Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB13F0AB9
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585951; cv=none; b=LRrUrFd/e21QvJTjpcHmjC2k0NsKzlJojKwZTBMqYniowYPteU+h3QqwmawkgUDWitv4y2ayoFesTj0CFLP6NYwlHXEHHwyScY5IdotKuzkd58ge9jAycRyhw1jzIlleZF9+zxS8cJTbsKskJ1aax66uaYqvBV2mGdkCyZAlpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585951; c=relaxed/simple;
	bh=V0YXLnYwbPTjAP6F5DvVbhUKyuCphnicmr/wDylbkw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOyLrx/2KpqRGCkYS4bJFlDJdOpOV36ynyfo+ND4XnCbiD+/yrqlomHd29kH5tyjG6Q4MdE5Bg6qKDjkgVlWPzCc9dDHappzsNbKwgSka8nvWCiaA1BZbMTFSG7bygycFaSeef/Rh9/GYjVYRBrixrASEkkdDFClU0bUcNI1768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F14SN/P2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PikIUVBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F14SN/P2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PikIUVBr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960aP5837412
	for <linux-sound@vger.kernel.org>; Thu, 9 Jul 2026 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=; b=F14SN/P2ZZEPU+vR
	MIMBndaSYEAFgqDT9PDp4xrOKND6zZizHM729CTxuoAwS/Z03uXGeB+SHQAjJ4EA
	hZ4W6cdZiB6PVOg/6LhXmp/qJHJP2kUGBmtPdqjmiYYAITj35qSQTb2ZO4ZPhWTk
	XkxMkbiU2/FGuSWfU3E1KpsNWagTb4m8g5m7i1lz2GcVMmGcDBZkw+LvRVct+dtw
	SQdACpujWhDPyXS4+cIz1GOlH5cDMnJbnzMy7tMerDeApQDfphHabzpy0h1ppsxs
	NlNtEhbf5lLQV2rHcDNX5rmOHv1f9AI8zcY9FHRTA2/7yTzhYtOEz6VvpWm+X0li
	9cmdvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb6yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 08:32:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1052774a91.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783585947; x=1784190747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=;
        b=PikIUVBrY/xEXaUuyyhjdF7hdXh0GwP0dyeUiRCf46HCWrnCvtTO/yRmBr7F2ys9bM
         Jfuwshlxx0TzmLfuhGf/gBZih1Q9rrm4nGxJsCUzcEX9VaOe7bjLl26F5RgKMgD937eg
         z2qi7iTdREIlnLu7QSochfAh5VyFnUGF85ZrMq252RXsVIsKsgourjsoE5NjiT58rpem
         SVFKOPrDg3/UctPrZcTzQvxgs5KK7ugOv1JKFWbisnPBcembkStDBeV+xQ28KTGjFo3t
         z0BFkkaag1hHjAPbRZSus3riEqocj5rZzVJnqwXszU+zPflrkJP4MvPZpmi4NsoC4Oa9
         bMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585947; x=1784190747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=;
        b=gWJTZ1pYBcLaA8pCKznlwkfbm4GUY+Bqak22CJ2imSFPY2MUiPq7soqUXpDTRdk1vJ
         Mncu3S5h6HHOEnnQsptUmpo/am/tVU2LVUNTGHVbzSLGDlTVJjT28usYVsQ1T5qA5/3g
         TJa/AIpJmudeHQSAQ76ESN1MTlTXDrtw1iTisRI8NoQa8oaRVdDZS5dX9hLSBkdpP+3v
         QZyN8NF9GuyFrUqofO/VjpFyrGDmL0mV5ALotreTM3AHSSeLbBoEpASPmfNUxc5M0J9w
         +HvkTBo0RfbT8vH0qBIVNEex4meqZHX+DxxEixvgrEY3rzeAsTYChDTTVZbhMfqYdNAV
         UmKg==
X-Forwarded-Encrypted: i=1; AHgh+RpAPPpFTuDG6pGEvVzw9uEsIUh5PI13wZVE/7RDDRLl14EKL675LuOflBHHilPbQMfjY4/BAkxdHPKh0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaEOwaZeqTMpAp7KtZ70O5c9fZkCVX2jgsN1EUvXatiBPP/UZp
	c079BBJNja9UEFbub4QcsKReSeHwLt70AM7fmQTDlZRzPDiyWTl4llTyVaPr8h8yyckpB2HLDmn
	WGW5qHRaz80AhgNEVuZvF9ZNJd+npzpY6I0Im2N8Jxj+g14/6JbGILUzEaMCKJrOepg==
X-Gm-Gg: AfdE7ckZYLAeitjZS9YlU7hmGA2hkbBopZM6vNRG98dkjOOLaen5Z8tllQVacIoVmQI
	v0Q5eipWx20z0VyZ92F8HfuBdYHOJFRhRC9LvEV8rlIWjyHgiRTME+pB5SYCJd5VQFLfq2oMYq0
	TvyD+zVH6OUujABP+2ptwgCctkgI0OT1hvepWJfD4YPWj3mEiD8dqyi/3bQzR/AEgI5EUGEXVAF
	70po0xZSw4NkK/2qYROAcFEgNt/Payzc/8Kpx+y4eLQV+YuoxfklthQvoUwHFX1qRPDWww0ChuK
	lzgiqQqsMdveVwiN5TjtWiR6/dNCOQVsCza3OD7DJig0jbHJ0VxMXRpD1AITKlAgOI+NRsHIhAf
	3K1ZDiO1qvoChJqZ4tmFhn1rDifW00RNXPEQ1FDA=
X-Received: by 2002:a17:90b:584f:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38b7493b7c2mr1671123a91.16.1783585946862;
        Thu, 09 Jul 2026 01:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38b7493b7c2mr1671084a91.16.1783585946361;
        Thu, 09 Jul 2026 01:32:26 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm765039a91.10.2026.07.09.01.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:32:25 -0700 (PDT)
Message-ID: <5344fcd3-8c2c-4b61-a21c-af11550aa8b8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:02:20 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
 <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MCBTYWx0ZWRfX1tSV0uYhq9t5
 2vW8cR4lySWilXGnukUsgZcdTB+KsUl6lo03ekQGxZYLAa/uJ00lY7E/RGsFGMUgG9GJD8C2sNW
 duu0vL2Vr17gyV0CKRkrz4cWlBLNTr+sCJlJS+jIKsA3/H9DGzS4J10ss9vmiKjCkMauGAKszd5
 y0UiCwD5q8s65Bm1EaCt4fsixooyclkqGdP/yKYHF1m3mJW2PVbjU7svn1ViIFM0LgwmHOo9jeQ
 DvGFgZ6UQTjcU+jU6pgid8urLKjj143x3405LWNcare1XFEv2VRKt75ZdfIev6AxfN2bl9vMeoJ
 y+ACHOnHQz1XOEoccsVcdsM6+3xabS30r/IMFwtOQxXn0HCSuwgONTyqGMwkrKpihcjyz4rT+3l
 XdMGvQXjSfBFOUJNtmwEkY7TYKDQGD3kHDZgK//PhveVXH/THd13jJPL1Kd85QtgShFxi07iYPU
 A09PF8hVZxlTyna76tg==
X-Proofpoint-GUID: UNnKsNrcSEUgBRC0IHkWYnqxeq5ww77u
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f5c9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2RTvg86By1wPwCRoaxwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: UNnKsNrcSEUgBRC0IHkWYnqxeq5ww77u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MCBTYWx0ZWRfX40UE8tHfCqX0
 ItPSgrp8sjWP57bTdk3fuEoQ3ihzgnSw4nDjM/Qsu4YDWm3Orcgoj9QcwPwIqUuDpe8K/J70kSG
 4GHqT649+e7jc1pGBgh6H48rLxyL8mw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090080



On 6/12/2026 4:46 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 04:59:46PM +0530, Ajay Kumar Nandam wrote:
>> Add machine-driver support for Qualcomm Shikra EVK variants by matching
>> dedicated compatible strings and applying board-specific audio behavior.
>>
>> Shikra platforms are available as CQM, CQS, and IQS variants with
>> different audio components and processing architectures:
>>
>> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>>    PM4125 + Rouleur codec components.
>> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>>    on CPU only and no DSP is involved.
>> - CQS uses modem-DSP based audio processing.
>> - IQS uses a third-party MAX98091 codec with modem-DSP support.
>>
>> Introduce variant-specific handling so codec controls, DAPM widgets, and
>> clock programming match the board design and avoid invalid clock setup on
>> variants where it is not applicable.
> 
> To me it looks like several independent changes being squashed into one
> commit.

ACK, we will make seperate logical patches in the next version.

> 
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/common.c   |  2 ++
>>   sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>>   sound/soc/qcom/sdw.c      |  3 ++
>>   3 files changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
>> index f42c98ded..32d6c09b2 100644
>> --- a/sound/soc/qcom/common.c
>> +++ b/sound/soc/qcom/common.c
>> @@ -3,6 +3,7 @@
>>   // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>>   
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/jack.h>
>>   #include <linux/input-event-codes.h>
>> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>>   	}
>>   
>>   	switch (cpu_dai->id) {
>> +	case QAIF_CDC_DMA_RX0:
>>   	case TX_CODEC_DMA_TX_0:
>>   	case TX_CODEC_DMA_TX_1:
>>   	case TX_CODEC_DMA_TX_2:
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index e5d23e244..4c985f81c 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>>   	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>>   };
>>   
>> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>> +};
> 
> No speakers?

We are using the WSA885x external I²S speaker amplifier, separate 
machine-level SND_SOC_DAPM_SPK() widget is not required here.

> 
>> +
>> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone", NULL),
>> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
>> +	SND_SOC_DAPM_SPK("Speaker", NULL),
>> +};
>> +
>> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
>> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Speaker"),
>> +};
> 
> No controls for CQM/CQS variants? Why? Or rather why do we need
> kcontrols for IQS?
> 

CQM/CQS use Qualcomm WSA885x and Rouleur codecs, whose audio paths are 
already described by the codec DAPM topology, so additional 
machine-driver pin-switch controls are not required.

IQS uses the external MAX98090 codec, and therefore the machine driver 
exposes the board-level endpoints through DAPM widgets and corresponding 
kcontrols.


>> +
>>   struct snd_soc_common {
>>   	const char *driver_name;
>>   	const struct snd_soc_dapm_widget *dapm_widgets;
>> @@ -49,6 +68,7 @@ struct snd_soc_common {
>>   	bool codec_sysclk_set;
>>   	bool mi2s_mclk_enable;
>>   	bool mi2s_bclk_enable;
>> +	bool dsp_bypass;
>>   };
>>   
>>   struct sc8280xp_snd_data {
>> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   	int mclk_freq = sc8280xp_get_mclk_freq(params);
>>   	int bclk_freq = sc8280xp_get_bclk_freq(params);
>>   
>> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
>> +	if (data->snd_soc_common_priv->dsp_bypass)
>> +		return 0;
>> +
> 
> How are e.g. MI2S signals configured / routed?

In bypass mode, the MI2S links are configured and routed by the QAIF 
platform driver rather than through the DSP path.
The check here only skips the DSP-specific configuration performed by

sc8280xp_snd_hw_params(). The MI2S interface setup required for CPU-only 
operation remains handled by the corresponding QAIF/platform driver, so 
skipping this machine-driver DSP configuration does not affect MI2S 
signal routing.

Regards,
Ajay Kumar Nandam

> 
>>   	switch (cpu_dai->id) {
>>   	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   					       SND_SOC_CLOCK_IN);
>>   
>>   		if (data->snd_soc_common_priv->codec_sysclk_set)
>> -			snd_soc_dai_set_sysclk(cpu_dai,
>> +			snd_soc_dai_set_sysclk(codec_dai,
>>   					       0, mclk_freq,
>>   					       SND_SOC_CLOCK_IN);
>>   		break;
>> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> +		if (link->no_pcm == 1 || link->num_codecs > 0) {
>>   			link->init = sc8280xp_snd_init;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>>   };
>>   
>> +static const struct snd_soc_common shikra_cqm_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.dsp_bypass = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_cqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.mi2s_bclk_enable = true,
>> +	.codec_sysclk_set = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_iqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_iqs_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
>> +	.controls = shikra_iqs_controls,
>> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
>> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
>> +			 SND_SOC_DAIFMT_NB_NF |
>> +			 SND_SOC_DAIFMT_I2S,
>> +	.codec_sysclk_set = true,
>> +	.mi2s_bclk_enable = true,
>> +};
>> +
>>   static struct snd_soc_common sm8450_priv_data = {
>>   	.driver_name = "sm8450",
>>   	.dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
>> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
>> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
>> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>>   	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>>   	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>>   	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4..0be743cec 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
>> @@ -4,6 +4,7 @@
>>   
>>   #include <dt-bindings/sound/qcom,lpass.h>
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/soc.h>
>>   #include "sdw.h"
>> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>>   	switch (id) {
>>   	case LPASS_CDC_DMA_TX3:
>>   	case LPASS_CDC_DMA_RX0:
>> +	case QAIF_CDC_DMA_VA_TX0:
>> +	case QAIF_CDC_DMA_RX0:
>>   		return true;
>>   	default:
>>   		break;
>> -- 
>> 2.34.1
> 

