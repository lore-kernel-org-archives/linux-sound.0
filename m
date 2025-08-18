Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB232039A
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520057; cv=none; b=unW8+OZ5yGo4G9qIUCx+HYKzu15unbFnov0AdK1vXAGgrObZgGRW82KKrTLXCY3vIOE+Z7teCi286Oio+SbfiTHyEQSNiDlhULSU/IJkC0Ds3pCFP0P/OLDkAkW629dLW37wTmYlm77t3wRraO4c2nYMzJ+ArAdjVECUhTLRVbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520057; c=relaxed/simple;
	bh=nvR7xcOajIqcXGDD5teNd3zXhGzUeZ4squpuA/i5ois=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4VO5BOBo5R8e939pJ1W63HI5ll9l9sRmPlbEKhDQiyVvJpLi4B/bIHEB9SguA4P8jYirjTkUpzwStIA1kIcNJfWjVo1tvaY/NNhCIcuX33asJqNeCwVfM0gCVtiH6mb8DGPaMUoXDUoPo9BXbRtNStEfLfN5zXti+uFapnEsaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIMQIsKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIMQIsKp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8tIjF023680
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMPy8yrkDmCb5asvMqXUa+Y8wrsQZ53xq8R+umEMsHo=; b=WIMQIsKpv9GfAm5I
	ev3oeWosKVrnDa/6A03vLd/3mYs37tOJjR5sXHXUhq2MR/IvotYdBIzmOGHIWV1P
	RG2HOLA4QJCxKrCZEeVY0IlYl1Ii+wAIVevPA+u9b8AKHKaraIBDY03+Kn4eCjYg
	dqwh34Qdjb+U0rBywOm6aAnQmzT5v3S2OF81VSIiHthtXgK6xhEZjsGwv4O65sPS
	KUucP+XimOiXo+cYkbGStcdQiSub2Ug4sb0oy8C2Toug9wu3OBhV4Jcag8UXnTJq
	qYA45M/YQak4Dv+c5ga56fRQec/DQ9dAGLG9bMMY5RUIddqxfjjlPrqwKvjaQS6c
	85PxfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99mhyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:27:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a927f570eso94248816d6.1
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520053; x=1756124853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMPy8yrkDmCb5asvMqXUa+Y8wrsQZ53xq8R+umEMsHo=;
        b=KdBGvnxbiIey5+iAVpUyCPwglmmPl8e1YN7N4fwgyIfOb+EYAwogVKOE8lLE12mKEn
         ck4OuvcoiX3QOrfDV8vLdJFCR+TyJryl6GVZYNa+lZh7cub2z6WC54F234Kw1pMp49ZU
         ioGPGNMeRdbTvOSlAspafcGfeE9z//uWhjpsTAN8Qu71PkYLdYiOZVy5hwaK05vfnPi4
         Qzfj53TEGS56VTgvjHX2zbsbJawDjIhtSQqL0PsUO/T30HBfv7Ps9zvUkIi+EhDuscHE
         rPeHQ1McoRnqL0FUuEwCyNG4vDbM6OL+JbzMmvLBlsuDf7pVeEL6iRaeQQaag193quye
         8QtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLQ4KOvMqhq4bsQyBzTEFauyjwU+JxJqniJcuGx+WhqaBi19Qb5doCKKsjHtfV4ffcOJ2vynSpY3paIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1QbKp1QsUHnbnrgzd4+Rqj8wV/YdnSBQklQV05DPIIH/rNOpj
	9YUiP4Bqhu/MqcVWU8x6uLdjjZWnusozZDBWLZr38kY1Rip6CBQSZUEgw8e6UJSEby5kEOR1wXd
	IwnRmDMWyVo2RmBX7vN+c/2GvXiPnmNKEPAAgUR3IADKxqEyeKdjDxZNvPgEfb1lDSA==
X-Gm-Gg: ASbGncuXIUeRF/Y7EjTrGQyQ8dSdCDqVZHRbtV5lxdAWwwvwTMn/0szdLTbbN3nh7Ze
	4K7tfP4kVMY67KIcfiOhGNd9bhh8s7r8jbe8mlNQNVXU8PqUphlFSW1lW8YSA69N+JGlNS+MdA+
	Vu9feVOo6w2HXV0nszFFeNh4CvueI/ttPzge460zPxww0ye+NEEbzTELkYc+uihjrTq/XVCf/hI
	wV6GRXdsRI/vlFz/GyrlNtmP7theNc4sBeTW0DgWdE9dI/SNa3aOLHg54Ay1U7flzvibNMGWCcV
	4An0Ly571AT6osYSJGM8sAUOxTY3c3Dr5fTlvybKeEiA7h4GoeqJwqB8MdnkoLZVoA4=
X-Received: by 2002:a05:6214:226d:b0:709:e54b:2633 with SMTP id 6a1803df08f44-70ba7cc55d1mr157153296d6.50.1755520053557;
        Mon, 18 Aug 2025 05:27:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyU7b2CpB2bLhXFIhOwMNDjmxVMc3MEJKn8wBDlF5tVrAmW41yFTSrE4nmNJj6aGmyyhUfOg==
X-Received: by 2002:a05:6214:226d:b0:709:e54b:2633 with SMTP id 6a1803df08f44-70ba7cc55d1mr157153026d6.50.1755520053055;
        Mon, 18 Aug 2025 05:27:33 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6be103sm180437045e9.2.2025.08.18.05.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:27:32 -0700 (PDT)
Message-ID: <7e26efeb-d499-4f58-b42c-dd37c2f680a8@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:27:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818122240.1223535-5-srinivas.kandagatla@oss.qualcomm.com>
 <6e0d3bbc-bc30-4ae0-8258-8dd19f7f29d4@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6e0d3bbc-bc30-4ae0-8258-8dd19f7f29d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BnoZ6z7TdiTX6_mM0xZh_W05hVX8INlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX+3PsCw5WOOeR
 rhLqDapBDAw+S0H6K2tiY3yLVqGx3g0S39zvxUDQu10102NGOho2YE5G0pfq/bvpQb+KPChjEYy
 yQ+xazcf+kJpJ+jvX82CDOz1SVAA9F7LvcLKTn7DjnTrsHNNUOFb6td0Lx4DHmI57oOV0+dVFY3
 IgJ9muk3QF63WlqXkjaZCFtgESJQkOvVKPQXQPlXlGSD2TVQ5tCIcdPpzhqpOsYbudPMMy0MWBJ
 DNs4Wmq8G3VV2rXiZhaVuv4T47seqCRTvp2k/SnbJuNsIiXMIMaIYM1wA1CQPmM1NAyrF1oejVF
 sAJlj3/AY/4rZfGCAS3c4l8peF7MWa0YxetwW4xX48kVVzSgSFxiTxXN+oO6x5VmiXExb11xRQu
 upNqsXUx
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a31c36 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=GFBRK3qK-iERJEzU3l4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BnoZ6z7TdiTX6_mM0xZh_W05hVX8INlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

On 8/18/25 1:25 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 14:22, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Fix spelling mistakes in I2S_INTF_TYPE defines.
>>
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/audioreach.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 617bda051cf8..512886042224 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -27,6 +27,7 @@ struct q6apm_graph;
>>  #define MODULE_ID_DATA_LOGGING		0x0700101A
>>  #define MODULE_ID_AAC_DEC		0x0700101F
>>  #define MODULE_ID_FLAC_DEC		0x0700102F
>> +#define MODULE_ID_SMECNS_V2		0x07001031
> 
> 
> I think two patches got inter-mixed.
Ouch... that is true

--srini

> 
> Best regards,
> Krzysztof

