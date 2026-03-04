Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158CC3A4507
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622883; cv=none; b=qJgP3PPbCeaVj6LZx0lsg/iJV/tp/pPghIfgp6pm3pMoGI2krZ/s4knv/P41nKu9U2saMCZqNmDVXxLpqb3Ld9ODAZ3mAhKiuo0l7M1TsA5B6AmGy44JvIj1EWz+s0wNBOn1lMetsZLa1xjpCOrf9Vd3N60TB6v1HSJ0tRF43xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622883; c=relaxed/simple;
	bh=6TGX5eb8szacsm3F2lalvCDnlz7m3TVT+pByVabyND8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISEmUZ9TLkFWXtW3kWbqHY7hsJLCr9KvOiD4TlhkCIqGS20USK2lL7Nd+SA5bD/5kytvCLKg/WIEnKws41aC5T8BlvmLY3kxp1v4LUvSdUOfF4+1idv04hCoV8Uodm3Sj4ouOUMfHP9hDhzGBWfxtHcJI9S7+zhX16wUSg/zo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfszIOMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epR9SHyq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfszIOMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epR9SHyq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T6gf1678611
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 11:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rGH/jrADNsbgLFFgLkWWPcPeim09mgivrA/vZM8rJI=; b=ZfszIOMHKp6J40jg
	oBrF4ZuPUGXDoxCpYm06ffM12zLkZVk1krzE32N1D8vdreRK8ZYpYRtXkLLH93Df
	J3UnpJLRwdoO8u8ax7RwJ2rMT+pC5DeMq0aIJbqPEJUbt8rH4saAllREexOk+RZo
	n2xfNBA0jP8Em5OS0195UXKEHHGX4OfAmvHQj1FluVG7FuToacmn+2e4QtEICzZv
	wJsx2eJW6Mycgrq5Fy9dCHHfafq/dlwhP+Tar2gEnim2rwWob6OSLo4bhCVYJau5
	sN0gGELSwnmwj5P6Tg/LAkJn3DwDRAaavp21sNihCLJtpCMSJYqETKq7mIxd3cKm
	4G4fXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hakdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:14:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso2037185a.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 03:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622880; x=1773227680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rGH/jrADNsbgLFFgLkWWPcPeim09mgivrA/vZM8rJI=;
        b=epR9SHyqiPEUankjwQGRYP8oYpj/CihYu8iU6TP5oDX+mwsD609B7bbZcDul8PObUh
         yLYzCRUmJBH5yeu5EIZUJrgWZAQAJNshUb/Z6rL0RPWOvBBcAaW5MWvOyKSgFAgqs9vJ
         qePXD8ztjsTgibGDe3LHnaj1ajyvb6ousHVWpiaA7JtpTil9D8P5gQqOqgob4NREjzR1
         RZMG8qmbXxo34vJhHMaWZStv/E04SAE5sngbe+KIMQViFmqGSjclvtSi3sPc9lQvMbZt
         AbLXo5EcmN5G7TyBQsEFmFgxtNjaEPPC6yVk/Mu0bys6uIL/wuL/j3vHaGUv1ZqdaGvD
         J43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622880; x=1773227680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rGH/jrADNsbgLFFgLkWWPcPeim09mgivrA/vZM8rJI=;
        b=Ibk6JgYKiKBCyIpl0A4CMiyyW2xn1yScslrO051dQEgCiyFHW41YN3HmG0TOl5Tzif
         53zZXlztqE5x4dzaVxFMETPL4jwF5wmwR23RVXpikfNLCk7pTjRz3Mty6CLzv2GEZAKa
         c1ms8tR5ZOpkZvXANUiWLzvD3OxCAIOxzZhMyKXqc4DlMZw782tI+qKOyty4vlsSB1C/
         3IrRv/InE+Ck/Y9vywEebHWzuRojxsLriN9VIYsqu/IrfzZMYy0XRy3/HU/a6vh2dTo4
         SxaxCdwsRLmSWEA2MewtyfHAhEjFwsoaHBU5Vpdje7q6W3+14Q9V0cWerZegvFosfwE8
         3GVw==
X-Forwarded-Encrypted: i=1; AJvYcCVmeitnJStOaocOElGeAjaT2HKl9ZudbO8xf3JnRYaf/2Kh3DnngbWdrhZCUurHMRPZVkApFAUZrZHXjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycHF76/ZPXb7NC/W47VmK4nA+/rx6dK95VR+hKoZggHwwpO+Cu
	S3DvLhrAAzkr9zpy98ifnHvz2JL8bW7mXvjKlwTq3jSv8Hz9vZ9uXDTFB1t7gXrj+0scY5/KtBC
	G19ZsIEUCdRcmCQc1Ife2/JgBzbuXI5U5fdKZ/47iTSg5a4dwgmty8cra2TZG1KSACA==
X-Gm-Gg: ATEYQzxFL3ooc0l3fPZOiHqrDVJpomSJLf3mYMYb2bPOSuKvawiTxIQ1DGCD4c0hQOr
	n9axeT4Q2zdeYI8DmhExsRUmVTQa0iKXLzcJJhr3fRo6s9gqyfOGqSY8y7ff4SNTq6WErbFh5BU
	r24+CIMG+weoODWM8wTTGrDxWFX8dojj9SVvyFR4aWbCTjXOa0UF2FdhA1mxL/UgCzCntJbdE5S
	m+11scxPwWqerhlDd5GYHDgAUm4SQ0T1NlioCWdXkWwkpbRZqIq9SBqhft0XEVxcjht68wcoGmY
	ICF+7HahxbPNjTvsZJ6bf5oyShdDGDa4/9S76NjkyYDCPhR5hCHvm3S3MDsAya/EU4Z8iN4ed+O
	EdH74O93dGSsvkmzWqZHfXlb0p1JT7qrQlq3+huhRyqnortzB
X-Received: by 2002:a05:620a:46ab:b0:8ca:1107:1215 with SMTP id af79cd13be357-8cd5aed6d97mr172218585a.9.1772622880276;
        Wed, 04 Mar 2026 03:14:40 -0800 (PST)
X-Received: by 2002:a05:620a:46ab:b0:8ca:1107:1215 with SMTP id af79cd13be357-8cd5aed6d97mr172215385a.9.1772622879860;
        Wed, 04 Mar 2026 03:14:39 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm6002048f8f.32.2026.03.04.03.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:14:39 -0800 (PST)
Message-ID: <14abc647-25c0-449f-a4f0-978372ae5544@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:14:38 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-10-srinivas.kandagatla@oss.qualcomm.com>
 <20260224-ethereal-koala-of-health-eab910@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260224-ethereal-koala-of-health-eab910@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RGf8xWebIh5EMgnnhzVKaVitJmu-QgV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4OCBTYWx0ZWRfXx8AEmGO8IbYF
 +GBvUJx60aDigp+k7kJfH+cdzU4bzYlIRW0ebzdU4TzhDj0p1jzBo0k4RQHm05EbKUZsJOp3heu
 RXYXlrrJd577fJ1rwBJRHmgnp7i9DIj6LIlohyctuaiWD8vrCFx5A2EK0mbpjW6HxcmsouwahPX
 YSsUjkiIW0kmJDFwq3aeW/F0bpgKZKBduT86KCCEcxXKDUB0KVi0AdG4lB8M40nzcYHOuf7yVkU
 g5Pn96Qs1gNumBVwt83LuQaNL9IKIqOT9/SPeGvbz+CfuM8R90GRO0ITZWjHYkOz6A1hV33FN6k
 Wjr3b4CPp6Nq3uv9iNIoyzkiV0gdsv4P3EeR0q4/VEuaWkOhiNdqb4CjEFt9fGH9rYDWabILL5p
 6Dz9mjrzCrw4VNqMhNAj/MYn0vHT5Mdvpw1tmWHnyYlBLWGjbtc06VWsYr0M379LoN0dGiJYwqu
 Pd6GqER5WsKFl8jzy7A==
X-Proofpoint-ORIG-GUID: RGf8xWebIh5EMgnnhzVKaVitJmu-QgV9
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a81421 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OoQJ-9uZOr_G_Hsk2v0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040088

On 2/24/26 7:14 AM, Krzysztof Kozlowski wrote:
> On Mon, Feb 23, 2026 at 06:07:35PM +0000, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Qualcomm platforms support the Senary MI2S interface for audio playback
>> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
>> which are required for boards that utilize the Senary MI2S interface
>> for audio routing.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 ++
>>  sound/soc/qcom/common.h                            | 2 +-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index e27a31ece1f2..45850f2d4342 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -150,6 +150,8 @@
>>  #define LPI_MI2S_TX_3		144
>>  #define LPI_MI2S_RX_4		145
>>  #define LPI_MI2S_TX_4		146
>> +#define SENARY_MI2S_RX		147
>> +#define SENARY_MI2S_TX		148
>>  
>>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>>  #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
>> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
>> index 85ca73408151..ee6662885593 100644
>> --- a/sound/soc/qcom/common.h
>> +++ b/sound/soc/qcom/common.h
>> @@ -7,7 +7,7 @@
>>  #include <dt-bindings/sound/qcom,q6afe.h>
>>  #include <sound/soc.h>
>>  
>> -#define LPASS_MAX_PORT			(LPI_MI2S_TX_4 + 1)
>> +#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
> 
> Same problem as v1. You already changed this. Don't change the same line
> multiple times.
> 
> Anyway, this belongs to the code patch which uses the new LPASS_MAX_PORT
> (e.g. ues new SENARY bindings).

I understand your concern the reason this was changed in same series is
because the patches are from different team members and I did want to
keep them separate. I was also hoping that this patch would provide a
reference to anyone who is adding new ports, so that they do not forget
to update MAX_PORT.

I will move the defination of max to last patch, also remove this change
as part of dt-bindings patch.


--srini
> 
> Best regards,
> Krzysztof
> 

