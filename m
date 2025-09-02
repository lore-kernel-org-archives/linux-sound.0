Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146120766E
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 05:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756792116; cv=none; b=uKf8K5M7rtw/Osiv6BZOVVZKqhX5afleAJUzyaS1T2yP4zePWCOfuMcYcWYCCbk6EBx7lYQklhHS9DA0I0utMAZz9aFWuyLz6RqlVNSSKNgnVnYmOtJCLHOR4/I0hsCLEtLfhnRCqQeS9Bycldy3GuK4N4cQtik+QaUKm1nJRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756792116; c=relaxed/simple;
	bh=wJUXVzZEjt4dllkF9GBssUfByeZHIyP5zZLl0B3Rpp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVbrW17nC2/nSxn5IMfRqC5Wg3s1UMUWjI8hyS7npSZ2q2M8ssRgQmWe6w+TQt6PdAkXsbo3X3d/yWiM5HsXsdEvrfbl58rXuYgrZOlSofFJdeo/HCgjV6TtxlTdbATWHpW3xfKd8Mow3j1D7KCNo4AOrRxPR1D6cWIQXz6Cnq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OS7MG+/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OS7MG+/D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5K4025153
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 05:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRMEVrZIzXTP/WpidTvtFL57e8Y6bQRpGsTye5PDzTA=; b=OS7MG+/DfR8ElpNj
	VxIVSDgxszHN6osKnBWQgM90cQWfcAk9Iz2RXju9zAo/ZUqsWUutOlpec9CN5baY
	Uxc+w3aYnrDZMQrYU6uoZ44oexiSw389Cp4j2wL6+9AA+O2kQoOJblgrMpoVSf9u
	l+xTR+lkk8BV+JO6guLeW4TzQzZNu3IvlUXzYshApRsDftDvZ/jcX6Dk/65wHJSD
	aQ3ubRqFR/txwG/o0ThY4YwHiB/AfySuI+IHtLrw65XA2EVwNUxyJl7CmAl+wEHL
	jYGkF4LisVKi8x8SkF7Ciz0RVQvMnVSmE5ib0clRi9DGZZg/07T/5qXnjv0hZZjQ
	l0fNlg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxpnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 05:48:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457ef983fso98560555ad.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Sep 2025 22:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756792112; x=1757396912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRMEVrZIzXTP/WpidTvtFL57e8Y6bQRpGsTye5PDzTA=;
        b=HIs9lI/wYwTJdC5LGmDXcT0rvkouOXZavHYGqBrohd5R19yeDwBa7mOIYxcVo8WFui
         b26wINDtksASQo5oe+69J+P3jZpNF6oFWTg+rtYMJVq/W/XT2ZPqqTR70R0LEtWeLi2g
         lVZgJ7wqR9v2KGlIuivu1ISnquq66zRefl/JsJV5X4hW4iifLzGBnDuzGbn6RCnMJLdj
         cnIu9YnhBXy0KAR8Wd5P17NMRw/GtL56NGTv3CefTRIAAD4Ihx+Y/zk9ivqoXMYFRraH
         gkSXWEZ7f+IvG/4wRN9VXaOxO7FSOqbC26+XXEmQOHy5vnjizZzWCG0fnjes/bHie2ep
         OW0w==
X-Gm-Message-State: AOJu0Yzwtq1LaOcLrc6fjz0C5vlozAInYBjBEhxpHCBYFvU6/Sea81lw
	Riyvj/Vg7wr3CbUywDjpVp4xV/G8Bcdds5vykyDZOZ/5H8rWCt9grPJjkCCXAE5wH01fPYaYoTN
	iRefNxE2yH5YFA3cSlUAT4Sxs1NkrqkBS/b5TURqV9FLBhFR2KI5Zts/YRxuyK7B8NQ==
X-Gm-Gg: ASbGnctHiNEcQlFDIlDQI8nVbrA8VwwKI0xuRut/eHb7o5FKXE9VzRAy1n7XhyDWWWL
	3Idr1cFmxlqAZy26aLYfCFk6xnyapghfZzVZJz2xDxnwZLcBk0OSmmNOJD+tKRjILEnDXmQhS0A
	I7ScWRnBW8dZZtYyrB1JSLovUFnBBIGUuuvZ2QCTAaDt/Zx/VOX0he0Q/k/Rpvh8XZ+TP1jC/0v
	7V8iURBL0Ke+YfSs6g6BYWL61aMa1lIKcPsgkupd9wgSC/I/6C2QDsiFj/Mb64iMN7CXmoXIY4k
	cSku245mpPcPlacPhJoWGkfDKVFf1H2Yz1iFmL7YI+EY92ppsxl+jocmz6wVgqr61swWSjBedox
	Xww==
X-Received: by 2002:a17:903:2302:b0:24a:a724:717f with SMTP id d9443c01a7336-24aa7247fd3mr107166515ad.47.1756792112114;
        Mon, 01 Sep 2025 22:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKd6LawW4ea9rkZQXLiLMf6L7YBrtKTZ+bAhxeuf0bof7iqODU73Oimyrd5cxBoD3ntRSIyQ==
X-Received: by 2002:a17:903:2302:b0:24a:a724:717f with SMTP id d9443c01a7336-24aa7247fd3mr107166175ad.47.1756792111624;
        Mon, 01 Sep 2025 22:48:31 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490370278dsm121876375ad.1.2025.09.01.22.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 22:48:31 -0700 (PDT)
Message-ID: <0d60f70c-dd62-4e37-8eb2-dd385506980e@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 11:18:27 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: audioreach: Fix default WS source
 assignment for I2S interface
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250822171440.2040324-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <6ca759f1-27ef-4cf4-833c-ee2f6a9b2d87@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <6ca759f1-27ef-4cf4-833c-ee2f6a9b2d87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+G4kl/zY7p+v
 2EFxSE0dxTv4Is8WjYKaKGgRQkmEUQlMh2FAb/7E0+XG1ZL9l8Wvt5hX0FWieLP8XHz++n56Uxj
 rgWURfop/RnHNX742ch/hwqTB9iFhKmi4Gjp1Wt5grwg/fes2A2RoE+ao0rAzy+1abc0VEJKjpM
 UczrpYftZYnE0oatcqLuJRkWj9CIw4uNKFyo2Se0YrWZPCMAa7Cj3OieyByXOr3dYdpyLVM34sM
 ah0Xwy3VV2ltMvyW3HyofpX5wUO1VwQh4RMrLiZvJZHwF9FxxbFpbrYRdO4fSSwlP7oIfw1a6PR
 6FOkA/XytFBPn2mG1W/HtDvtDkWIpuEU3DJqcr2MmocrZZHSM5Cz6iwgIP58CSyX2hMGtuHMiFM
 Wx4vcYgI
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b68531 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ry2OTbbN1JAwg5-T194A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fNNkkwGz6ROTCoSQeVqcZldVKvnFiKMj
X-Proofpoint-GUID: fNNkkwGz6ROTCoSQeVqcZldVKvnFiKMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031



On 8/31/2025 2:07 PM, Srinivas Kandagatla wrote:
> 
> 
> On 8/22/25 6:14 PM, Mohammad Rafi Shaik wrote:
>> Resolve an issue where the I2S Word Select (WS) source could remain unset,
>> leading to misconfiguration of the I2S interface. A default WS source is
>> assigned when not explicitly configured by the AudioReach module.
>>
>> For HS MI2S interface, the DSP need proper WS settings to set
>> appropriate endpoint configuration.
>>
> Sorry this is not the right way to do this, machine driver should select
> the correct configuration via snd_soc_dai_set_fmt.
> 
> who supplies the frame clock is decided by that configuration, we should
> not be assuming any default as this is totally board depended.
> 

Ack,

will use the snd_soc_dai_set_fmt api to set correct configuration.

Thanks & Regards,
Rafi.


> --srini
> 
>> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index 6d7b1a4b0b2a..d4397f75e310 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -999,6 +999,12 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>>   	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>>   	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>>   
>> +	/* Set default WS source if not already configured */
>> +	if (!module->ws_src)
>> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
>> +	else
>> +		intf_cfg->cfg.ws_src = module->ws_src;
>> +
>>   	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
>>   	case SND_SOC_DAIFMT_BP_FP:
>>   		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
> 

