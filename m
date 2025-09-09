Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA485274FD5
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408383; cv=none; b=Txd0NnAZMw1I/xXdy6ODSYPk/Gse1SIxqvyPvQTREi+NewN/rpQLQeJcZCNANB0gjDd5bmcvX5Eqs/7ns95xyxz+WzAvbTb3r9P3vdPEuAhhTotU2fnFpF1KTxcm48iFbmyqjRHsksA6ei7juW7PLgnLr7fFaWp0PDjT+ZCsHZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408383; c=relaxed/simple;
	bh=P5f6Y1ie90f3NrcxzPSA9or+iXu7oegMxJQn2yHblUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJodzVqGtdseQltouaaS03j3GWaPNY7ONuQqNMYLYNZiYg1q2Slo0qAyBNWyUP7xSPhPpeMQ9F0FjQ0wRRlbjR5H9w++kHJQ6+K84nQcKe+T0ArJEGeijrt9/jGU44Jki3a5Z0x9zdd0WQ7lE3xamdgTkukgY5mmDx58Yr9IBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhD45UHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhD45UHO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SjoH024335
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 08:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdz14Bg4xghRr0ECw7idvzBERq015x3/DUoRn1a89I4=; b=WhD45UHOV91nNnHh
	BLAs1ZYsW/UGPn9OXQX3OuPOKFNWDxwndhSQOnR2w5nOYM0zaVzNIxB4WFNhynT7
	XK+/mhC2m2gimLB4lQ8DxYONy0H0Gzoky5pg5QSCF51H+oPrCEuIHdToZxX88k1R
	ZWPeb1bPQy2/913eI+vjbo2/UUFPg2BTGZeZVa29pY5qiyk3pJxd/ts7QOM/EyWP
	vL6ayhtm691w7rowKZZJOO9DcjVUlkLYXEkFgY/7VToZ2QhHFS8DtO1+HElIllgd
	+1lf3CT5/iSmsxDkcWWVIgAnuFjuNZ4qKERrQwjUBJVNbWMTKY7XkwnOpw4JwLrW
	UGhWNg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws7qdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 08:59:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72023d1be83so188500716d6.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 01:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757408379; x=1758013179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdz14Bg4xghRr0ECw7idvzBERq015x3/DUoRn1a89I4=;
        b=sTrvtZd1QKzg+YZ5Z2d8z4wZEjUuvrDfVKuAdmANTeE8bVYrqkvhYJX/eGm3N1939T
         RyJ4qcbrBYdFseOzTSeV/RL0MxBLurEJLgrRpA8L+qXMNe7J2tbyCgt9GlxXJwsetMuM
         +hsT1aD9gngiqLXKqAEhJ3HCrTKEjoMis0oqf3hkHcwOtwynHeXPmliDlNAchz1eYWHq
         T2oR6mORr1QgSD75xxlYSnPgNy40IR4yzzUSLz/pT1EYxU+jMJPKsXeov7ym908gSbHm
         PDwdwaFCjREzVmBDSvT8U5bHp6mRQofS4d27y6u8Axvb5kCesFInAKRmziuFY6zWrek1
         JaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdrCqt5tcGCKGSG1sCs/5ighEIKIpyp1/7UJkxyUc9i7G48i7FrLxj9l1Nm7QFcJvMVSmGLOP6PqqmMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LR5VfqHHTnzhbiwljcDxgravFklumLa8YJl9iGec76jAJV+h
	AQDkTn5kb6agi7zjGB48RRHel6hlDZAAg8yHgUNIUAzw2nstNECkC2e1CU+vs4yXvhvcTs9sV4V
	xf5gM5z3kltTy79UHOrG5eXQvVHOeMb2sfvIWB80cmpG+h5VtYFjzXuijgurSvUpYKw==
X-Gm-Gg: ASbGncvZyejZ4xY084IFbYWSqg4Z1Rq45+x5j6QXP+CRk9qakzN9u4LTBuLaLPjOH1S
	co5HuuUgJpNSICct2hSgeLLpdRM4AENBw1/54RDB9dQf0JrXDpsoVc8r63qz5HrzRRuiFiauSR0
	WQsfvWSdn6RUDPdoBfytYRQZHJlo9sGI4e8PxdUELCrb0KqUoilPuYgzZgOYHelHSop47JIi0Q5
	gwwwAtbeICj23ANMJzPinND/gFRhGOTsGXAn7QxQ7CZ2bjtJdQzLkQweNBMdTXphv9mq28iZCRg
	Hb7W+xLCLfPeGmTi7XWeOMoHJnR3/0y8afz/c2YoySLdrOjXECSZUcds/d4Qg7JSaOE=
X-Received: by 2002:a05:6214:21ec:b0:70d:e81c:2afc with SMTP id 6a1803df08f44-73932e924cbmr111729076d6.29.1757408378653;
        Tue, 09 Sep 2025 01:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrXIllQe6JlmakB5gb4NxUmjAze0ngHBzvcwXOlEsn3zCyudA+uF+goeWctYB2ACNm+n6RVQ==
X-Received: by 2002:a05:6214:21ec:b0:70d:e81c:2afc with SMTP id 6a1803df08f44-73932e924cbmr111728756d6.29.1757408378032;
        Tue, 09 Sep 2025 01:59:38 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e7521bfd97sm1758251f8f.7.2025.09.09.01.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:59:37 -0700 (PDT)
Message-ID: <fad744a8-f042-413e-98bd-7f66c957dee9@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 09:59:36 +0100
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
 <690423ac-4283-47a0-9250-4c740978ccac@oss.qualcomm.com>
 <DCNMJEP0XW33.1AUMCTJU5UPBY@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DCNMJEP0XW33.1AUMCTJU5UPBY@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _NHtGCVujKG8pydyhU2SmOTN9lCWfWUb
X-Proofpoint-GUID: _NHtGCVujKG8pydyhU2SmOTN9lCWfWUb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/tipPunU0ZdZ
 g6ma0NdeSh1CVzSIE2SwMo5o8rbnKNK/uavleqMwJnxhjjnNGZ5GMmkv4q/x4MDFfZch/kPFfrc
 UN6UYzZDugWyH40tLzO55c8G3ZSSamtO1yxE7LcalyU4Q4LyS9lc+jpfJXfjxaA9mWeugNVbIW4
 BeRjkYZPsr08RiA46lUy/NH3UTnrufyF9ylzIAMvxoV2shDsTxVpcI5FFy+6RUhlyjlkGOFLDhj
 9vQk6SPrglBfPILOoUFZT869ndGLDyXQdKqvjeY93MmeODUPjpRvAov6MWDRQ6oiXgU0mnxdtzn
 r5sBw52x2Q9AxVz04eg5qv/I9BANmsUMngZddQ+TOaidBu8cwHB39RFZe3IzyBTt1smzcM1hToJ
 efZwdc9T
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bfec7c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ji0vVS2q0_Gih0BFB0gA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/8/25 7:18 PM, Alexey Klimov wrote:
> On Mon Sep 8, 2025 at 4:45 PM BST, Srinivas Kandagatla wrote:
>> On 9/8/25 4:26 PM, Alexey Klimov wrote:
>>> Hi Srini,
>>>
>>> On Fri Aug 15, 2025 at 4:36 PM BST, Srinivas Kandagatla wrote:
>>
>>
>>>>> +static int pm4125_codec_enable_rxclk(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
>>>>> +				     int event)
>>>>> +{
>>>>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>>>> +
>>>>> +	switch (event) {
>>>>> +	case SND_SOC_DAPM_PRE_PMU:
>>>>>
>>>>> +static const struct snd_kcontrol_new pm4125_snd_controls[] = {
>>>>> +	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
>>>>
>>>>     SOC_SINGLE_EXT("HPHL_COMP Switch", PM4125_COMP_L, 0, 1, 0, ?
>>>>
>>>>> +		       pm4125_get_compander, pm4125_set_compander),
>>>>> +	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
>>>>
>>>>        SOC_SINGLE_EXT("HPHR_COMP Switch", PM4125_COMP_R, 1, 1, 0,?
>>>>
>>>>> +		       pm4125_get_compander, pm4125_set_compander),
>>>>
>>>> This is same issue in one of the WCD codec, which am going to send fixes
>>>> along with my original wcd fixes series.
>>>
>>> So this was in other codecs for years, right?
>>
>> only in wcd937x since it was added.
>>
>>>
>>>>> +
>>>>> +	SOC_SINGLE_TLV("HPHL Volume", PM4125_ANA_HPHPA_L_GAIN, 0, 20, 1,
>>>>> +		       line_gain),
>>>>> +	SOC_SINGLE_TLV("HPHR Volume", PM4125_ANA_HPHPA_R_GAIN, 0, 20, 1,
>>>>> +		       line_gain),
>> ...
>>                           PM4125_ANA_HPHPA_FSM_DIV_RATIO_MASK,
>>>>                                       PM4125_ANA_HPHPA_FSM_DIV_RATIO_68);
>>>> @@ -309,8 +307,6 @@ static int pm4125_rx_clk_disable(struct
>>>> snd_soc_component *component)
>>>>         snd_soc_component_write_field(component,
>>>> PM4125_DIG_SWR_CDC_RX_CLK_CTL,
>>>>                                       PM4125_DIG_SWR_ANA_RX_CLK_EN_MASK,
>>>>                                       PM4125_DIG_SWR_RX_CLK_DISABLE);
>>>> -       pm4125_global_mbias_disable(component);
>>>> -
>>>>         return 0;
>>>>  }
>>>
>>> This doesn't work. Playback has two issues: 1) volume is very low and probably
>>> not adjustable and 2) sound during playback dies after a couple of seconds.
>>>
>>> Returning these global_mbias() calls restores the good behaviour.
>>
>> What is global micbias to do with rx playback? Maybe something is missing.
> 
> No idea. Spec that I can see doesn't say a lot about PM4125_ANA_MBIAS_EN register.
> Just that these are main biases.
> 
>> Which RX path are you testing?
>>
>> I am testing this with Headphone and Lineout, it works for me.
>>
>>>
>>> Maybe let's make a widget out of it? In such case I am not sure about
>>> routing meaning that I not sure which paths do require mbias enable.
>> Not sure why RX would need mic bias?
> 
> I am testing lineout that goes into wsa881x amplifier in analog mode (mono).
> I use the following amixers:
> 
> amixer -c0 cset iface=MIXER,name='RX_CODEC_DMA_RX_0 Audio Mixer MultiMedia1' 1
> amixer -c0 cset iface=MIXER,name='RX_MACRO RX0 MUX' 1
> amixer -c0 cset iface=MIXER,name='RX INT0 DEM MUX' 1
> amixer -c0 cset iface=MIXER,name='RX INT0_1 MIX1 INP0' 'RX0'
> #merge two channels together (right channel goes into INT0_1 input1)
> amixer -c0 cset iface=MIXER,name='RX INT0_1 MIX1 INP1' 'RX1'
> amixer -c0 cset iface=MIXER,name='EAR_RDAC Switch' 0
> amixer -c0 cset iface=MIXER,name='HPHL_RDAC Switch' 0
> amixer -c0 cset iface=MIXER,name='HPHR_RDAC Switch' 0
> amixer -c0 cset iface=MIXER,name='LO_RDAC Switch' 1
> amixer -c0 cset iface=MIXER,name='HPHL Switch' 1
> amixer -c0 cset iface=MIXER,name='RX_RX0 Digital Volume' 80
> amixer -c0 cset iface=MIXER,name='SpkrMono WSA_RDAC' 1
> 
> and then aplay. With long .wav files the sound dies after few seconds of playback.
> But volume issue is present with any .wav files.
> 
> After playing with pm4125_global_mbias_enable(), tt looks like
> both PM4125_ANA_MBIAS_EN_GLOBAL and PM4125_ANA_MBIAS_EN_V2I should be enabled to avoid this problem.
> 
Looks like this is main bias for all tx and rx circuits. we need a power
dapm widget to reflect this dependency correctly.

--srini

> Thanks,
> Alexey
> 

