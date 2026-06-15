Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51E92F7F0F
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516784; cv=none; b=fCT+0itSbefnZ0Gx2EiZnmHImr4ZdB+gOgXJFBbSca4eoTcmVtt1fedzc6wrl7AU0z1SUd5zfn57XPMcB/7n0BegEB0hALDYQ+c3zH2Qn0RwtGcTVXAYE5r74zl/gdG4CsX1wLLll7/+KEWY6l13cu/Ee3Yme3NQ3lnbnIaRXus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516784; c=relaxed/simple;
	bh=RfHlJyVY3qOQ1gvEl60Xwl3FcvFNo2dgj1KhjcIFKxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO09oohN7DhiFA23l5BAJ0fy8wQZMiw0HGOjyXkl5iHdIOFI78Sbu2uyTOaeakTL0xiOG7CMBWmmipgitEIB0bF6bdkBNIPcexOEgrQ0zMWxNQnUVsslUlTTVPqWge6KJb9XVzix0CmbTn5G3VEcfFuBMApk9Sn1GCX+G216Wf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UymCYjNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPYqjjW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UymCYjNc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPYqjjW1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9Z2vf3818852
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7cxzz2bMuaIGQXwrnW+Ls6KtkN6+BZuFlXPJCuStfM=; b=UymCYjNcWzxqFDi9
	tF0Dk421TzOUACQRVE/wKL7m0+ifqJ//5FDRjG4cHfwIF14ZbFEVJJSuYweeLNbG
	aIeq0qaFAnRUTJwxE6eGggfC8QKBIsSNBc0jkVdXzIkyqttrShDP9bK3A0/rOenI
	a0fWei7+NviBNAKwlD3F13oyxEfKxmu6J1g0OrTsQg1t4yKA+qaSV/Siup0zSzYb
	52uhAUpkY7HFKXkOFXBZlVmIOHkcPnWmsURr+wLbuPlCLkB/sCMQrtHw9b7yCq01
	6/oA5pBYYb9qBAHnyimGMwefPT10coRmA4B+xSGMDHzK4ifCrXwSonnmUqErhccb
	zxddeg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0g16t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:46:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2337410b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781516782; x=1782121582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7cxzz2bMuaIGQXwrnW+Ls6KtkN6+BZuFlXPJCuStfM=;
        b=YPYqjjW1VxI3e4KSSqegI86duuwceFORdG9dm14cfVO0gjV20kZ7ByhFL57EPLY3h0
         RbQb66vmTlbpX+jB9TgEbc8VZ9yWp9UU1tXYA60/TQ9bamEI0foMALr/wmy1GwZwDCBl
         xbTYoccOJrYYSfYRJ/rW54xWG/G+etCmaAkbdRglaoyEadLpFNQq7HBNUPYFqwRtnlEO
         odnfEoStzxlS1V27NVJDcGS/tbXrMlKXBYw+ElRDPNFnaPz0kyeledmr2Dk+QkJ8Q/q1
         p7Qv0H39NLHKoezoMCP/AjjporkMwN5GNFBpLMf41k0bcCZ7POWJxnqrq8bT7Wb3DONO
         vbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516782; x=1782121582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7cxzz2bMuaIGQXwrnW+Ls6KtkN6+BZuFlXPJCuStfM=;
        b=op5fRwK15fzyV5tCXInFMVejPmEnA+zkTWOHB8XxMh8XzjkjhKJxy18IQvVQDl1IIl
         xmueLMyNidxFkMqDNkH5xvkoVOTA6EB9XVRhzdcgRG3oszJMa1G0ucWvtJls2foYIH3L
         TnoSq0/Ums2Oj9Lf3YjovwkIWEKTEyF15b1OdDAS9hYIMNZ2HTMzvKNIKXtn4xBqKMck
         OImfwxJToHqI3YXb6RxXoR4syX/ieADjs51179AfgjC9pk7BIbXy+UI3ntqt1MSzLJUh
         ghz6OyTwoeqKvA38FIqVHVqML768K+1FBuOSOsZvruTG9OtMbGtQTQ/llobiXHxEijxj
         i1Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+48dHRTW9T4HuupyKDfQb2B3fYh+mstZqmyySXl1DaxIOowbmMXgyla2i7KgLCyrWOtT+UXhh8l2bjKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPE2KSX/3YtIU7uRO/UAX86qPfuEsm4bNbfwiYsW7l6YohRQIO
	v/PVt4mDogBKvIzKWUXhvN9AVNxRuU8c9ZM9CEWwwluQT733Vv2cicByxZGyz+jEfUhgxzkUr+m
	fc/MNt5nikuqsgQjxEi8qrKYrTV4i7Pxd40e9vTs6UDtVPnRjV8iYV/YkGX0jWyITnA==
X-Gm-Gg: Acq92OFhDfRsk0pJIiIS47shQf5DhZCEW6rF0qvEbLTjKVKYgB2jZ1IRbFgoJe+meEw
	lZHp/LCQzoqgLDWeX2LOlAKP8NDtkn/zCPc3vtuITbyaF5xpDppJesJXeCIyi+PNrtfUTrwp4wb
	Cx/DZVg36FLtCKjpNVY06pr1vf2xPthmIe2OHSb/JqsRdgyT1I0VNUg0DIlHyeGRJL+8d4mzMxB
	N+b3f53f/l3XguAt+PFxBMuQCU9yENOXCJoCg8JTmZoINRCvTA8qEw1CADy8zoylfAfmNg85Ev6
	klzL/xAiInjkt03It3xi1FSr3Nv8glHHZelgSykUvbr/uroT1L1qKcNaUWwEYOuhyoZ7WxvPz+U
	8ysKEldrjJJC6rTipJGk0qSgOewb4h+KCh5KHayGQFTB9LMlawFPXFf2mgPkt
X-Received: by 2002:a05:6a00:1f04:b0:843:497e:b392 with SMTP id d2e1a72fcca58-844e1939fdbmr9893048b3a.9.1781516781500;
        Mon, 15 Jun 2026 02:46:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f04:b0:843:497e:b392 with SMTP id d2e1a72fcca58-844e1939fdbmr9893005b3a.9.1781516780914;
        Mon, 15 Jun 2026 02:46:20 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm9597116b3a.59.2026.06.15.02.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:46:20 -0700 (PDT)
Message-ID: <970e9449-ef38-47d2-8e77-9f406722afa9@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:16:14 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <8b2318ff-d07c-4c2d-9c2d-ef7c5c763096@packett.cool>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <8b2318ff-d07c-4c2d-9c2d-ef7c5c763096@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwMiBTYWx0ZWRfXx0/+8RASCuls
 Cit04NiCDzbvFOFJ8246LvukTbIlNz907hlZzQlIWm8zBcTgHAMTS+7Wrkj8BByXPnROFHQk9qd
 JU9k1LuMx61UDvSZbxXqIcvADlxNesQ=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a2fc9ee cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wLQ3rIZANEYmN962rggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwMiBTYWx0ZWRfX6Ob275Co+wG+
 Qz95GXL0crjYmDGNOwYn8MuOu6Gf1eWH1Sec1cVgQgbN899Km11T24f3HYybOvcmBNzgT6OvEcM
 inztPUvEA2+yhhl95QEHUMuKGMMTMkiVKV3joQHbCZZUF0dh6tOl/XsHfeBbchRPUF52dU/R444
 YnmPnNkJFQ9HxAULPcVgBkoaXKCDVB8OQX5BQpMelmxIQksyCHEFJ+qYiBcZHJQ+y/n0WnKa131
 ToDs4VhnDRGmFOPsR6FSrVBoRLokz1T5MxOM7PW6PM2YZ73hnmQSWQh/yk3YqqD5DUUyzkqzG9w
 1EvAy1N+At8p5iUra8AO5vdvbHVxAFlsExAWEX4FVBbzy2huSnPhKgbl9KgjtmBy8dirCsK/vPx
 Ea67flIAa3flhWZlmrC6J2cHW4lVyzUOmv118O9VfGhrCvG1BSlhixBGIxAwxSGTbT53L/EBQdH
 JARRSo3TZs1OAvnU+wg==
X-Proofpoint-GUID: Nph7Cuc1VaZaAQliAtZH5CwozG4ePjdb
X-Proofpoint-ORIG-GUID: Nph7Cuc1VaZaAQliAtZH5CwozG4ePjdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150102



On 6/8/2026 8:19 AM, Val Packett wrote:
> 
> On 6/7/26 11:30 PM, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
>> Each MI2S port now retrieves its clock handles from the device tree,
>> allowing per-port clock configuration and proper enable/disable during
>> startup and shutdown.
>> [..]
>> @@ -297,6 +373,59 @@ static const struct snd_soc_component_driver 
>> q6apm_lpass_dai_component = {
>>       .remove_order   = SND_SOC_COMP_ORDER_FIRST,
>>   };
>> +static int of_q6apm_parse_dai_data(struct device *dev,
>> +                   struct q6apm_lpass_dai_data *data)
>> +{
>> +    struct device_node *node;
>> +    int ret;
>> +
>> +    for_each_child_of_node(dev->of_node, node) {
>> +        struct q6apm_dai_priv_data *priv;
>> +        int id;
>> +
>> +        ret = of_property_read_u32(node, "reg", &id);
>> +        if (ret || id < 0 || id >= APM_PORT_MAX) {
>> +            dev_err(dev, "valid dai id not found:%d\n", ret);
>> +            continue;
>> +        }
>> +
>> +        switch (id) {
>> +        /* MI2S specific properties */
>> +        case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>> +        case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> 
> SENARY is also a thing these days btw..
> 

Ack, will include SENARY dai also.

Thanks & Regards,
Rafi.

> 
> ~val
> 

