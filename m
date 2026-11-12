Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478858;
	b=WgOpa3gwK/TH8NOgQWXdcI+TNvuV22j3SZo4sL4UDsENg4x3cRFOwUzmVXzIAgvSDQfP
	 DH6bpmSdnE98F4a4UrQkbr5D4Lk2Sj9oDxrFDtXHyqem/Rcd8Z84PNjGWKb7wy9II74bg
	 x+P/92eHbVagWgIuVpUKporLG4LGxYCGv/cWnsEm8UUSAQGIFWBcrZko9DUgy6MkPB06K
	 iEd1ZWJZImp88u3s6iPSsbQ/ZCJjh3DDYZJ6MvYczYMWDq2fSwL30UzddjjNwG/eR/LP1
	 F5u+8+bvEvhjeoz23phn6gUBEG1eBhWR7VC/QS0lOMD8xv4d+Ztaw9TViXdHn+bVtSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
	b=wKVNAMF0zHh+fTduDW866qYvFS19JQLbIw1upJ3RYR5niAVgpkpJr9vgOLKf3qI58/lD
	 OtE2LN0iLJ8rKYTB1Vzn8d2tZU6V0/LjIGubneUWOgXxmZODmANQYOwXdrFp7jHApu4X8
	 tTSTDbmF4bxd9sJQl5fvCMOv1gBHvqcqGV63gEEIv58T4oHvXx8SbJGtGcH0MYpJHA0xZ
	 g00/wh4rTD4m2hHntKEgbJ1zSQj0qSAoWXfipSgY7AK+hFX/WlVouuW78EjrPlDw52VUs
	 ehKemACwAcif6UfdXSFKJPsjUlBjHNAWiumf3+ARdHtgu0UK2yWPDA56h3DYwFKqrnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DY6c4zsy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJuiZnWf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD61A606A32A
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD61A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DY6c4zsy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJuiZnWf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Qeu54092542
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=; b=DY6c4zsyIIwudJ1m
	GOmaVOyhORdZCQ9jgXWygIpWrNEYD3F8l0sontN2nfn8SQfB1L8Fq2AbVkUb+pnY
	pVorlf+IPVY6jwl4DNnPhU7KZeZgerFbuUnaNBDXuvK/TeCvzhuJ4kLEZQoXZ3l/
	Q0nMePy8ykK2JiHc903UXiB1L6XV+/kE0+6V06s/+cBQxkjH0weq+LAwmnbaee68
	zaVwXwKWMti3Scg4InGG2DW94VOQ0KojE3t+1SSiwgtPH9dzEHJElIt6LZ8qB56D
	WEFXWvxenAmnJ221Hq8rQjPikHecWi1CEtSWy+nFds+dZvuSSOLvz6dLh9fi/lBL
	pvrQ2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jc3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:20:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so3718922a91.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478856; x=1795083656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
        b=OJuiZnWfvsNGQoGPCxDdggYBIUHIfAJT45kdjoCrUgO+DC8+TszyEm8UJh4oK7t9fq
         1P2w2XPJSIJxFnYCRb2c7W0aCwTT3vtEEFSEoDI55dF/E1dsbeskfMWHrl30eFNVPbLv
         AXflwhEQHParZdWTszPyMcYxs73jQzz2ESaQJceafGdG7yx1X54puoiHwEt+ah7e9oko
         9pwu4E9PV82fniFYxiFH0ETYGoSP6roQQewasvl+5nPZbvag/uL1H2zV7nf/TYen3rsf
         DihNyY1U2/xcsvOaSfUS3wkefZ9hn5cGlZS2TDtkr4l8tb+jMrYjoN1t+M6wKEk1Yhzj
         lqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478856; x=1795083656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE10P+uk4zNthoMOfJL5g1Osej2zE7Y695Cl7w1M/C4=;
        b=JTTzkjJMU6Tz6dxbAHE3z5IukZKf7NUryebaE+tiavQwSy5WQAbfSqX+RFHwJUafPd
         F5YzOROjUzyiAf3yOm+Nwn/1zw9mlABzmFJT7cnRpRD3CZZ0wWMX9UVavv+5ponW08tC
         V5Q1+zV+GnEaqM8YODP9LYD2ZqiBEAnvsiEV9omZ0Bt49R+M6+kOEmPhxS18Srrlh7A2
         UYyqm0hAN+5m0U3L00/Bw1fYG/OdtEmO4INxvu0slhARmvG0RMeVGWy7ux17GESJUgNc
         SX2xkHlIF7/WRZOzFOs/ucOevrxqfGiqqX8YsvOoZh3wMaktomaC+QrHm8grLH3U77L7
         BOqw==
X-Forwarded-Encrypted: i=1; AL+hErHp6pdgrlIaZqTjwJedra5tcjSLRqOcQyF9VcrWosovk61+9Y9xwABD6qs2YuDVdDvO9NBCWD5TelHOjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xhn4r+WXpALBadbNco7JEACV4soEdL6VUZQ8p+OZY2cIQ0qwZ
	rveg6HHOkQNl0LdBa1q9x5EuEuACuZZpv3RtHYGiy9op71aAfADPZwCxclABqsTuHNas+SpoKTC
	j9Nk/GVoEskgAE6ggoewz1AwRXvl23oKELnc11M8Q1KRsOWYkB74RciSSgoYtRFPb8Q==
X-Gm-Gg: AYBFou33DfAN2HHmdnqVVvtKTf5tHu71QS/6Q0+wBK2peJ5Iz4uJ6VBY57YlfMx3tVr
	KQ7SXx7idUwwq9Rwjg+BHOOH4kWy/vyTCn2wwIjDgMdgKOj4CpvMkvb2kc5jjHeCsPfyVOxfrut
	md5lc6dciZw1A36ot6MSBA0RXdqsu1/obKSWFLdkN5Q0tHQJew/tkVc/LebpBfQlXhUEYw9KwtZ
	I4WeJnqJYr9TANhMiRjh1pZ4vA/tN4CplHg0n8Iet7hNQlQI/CYbKOgaqj7VW5Cgy/xbhu/7MVu
	4px9oQuFetEVW04JTDCb2lQ3WXgWvZeXT066PBqUuC3sJD/e77lLTnkAj4YJ1SrAz2LfZgaE14P
	NtZXF45hPHQoFClRdOODWnfJn+SlhuwwhA0lxL51QqhShH3CJfmMGw1XJjyzb5B0jSX3ksF0MVB
	R062rc3Hc88Qg=
X-Received: by 2002:a17:90b:35c2:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b182efb666mr4818030a91.23.1794478856324;
        Thu, 12 Nov 2026 02:20:56 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3b0:a3eb:75a0 with SMTP id 98e67ed59e1d1-3b182efb666mr4818004a91.23.1794478855724;
        Thu, 12 Nov 2026 02:20:55 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm4011387a91.3.2026.11.12.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:20:55 -0800 (PST)
Message-ID: <50254309-4714-45c6-8989-7963637df690@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:50:49 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
 <179436005594.790675.8837636459182556844.b4-review@b4>
 <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <25ecc2ac-434f-4eea-b144-51fbc683201f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MSBTYWx0ZWRfXx3nVBvnw0C82
 YrjF9JByWZ0+JNeyigcSjwccn8jNTB4gVfyA1hBlG2ybwxr1GN27nVVeQuZbRvM6LVlsrDWePrR
 yjJnwKNGvzhQfE9Z0MIL+rHvjKNJki8=
X-Proofpoint-GUID: 2OaxManglt0I8kvyWcUd6ogBGk9qJg8p
X-Proofpoint-ORIG-GUID: 2OaxManglt0I8kvyWcUd6ogBGk9qJg8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MSBTYWx0ZWRfX5HwR48JKB+8X
 hVT10mjgYu1gEZUFLD5ioX754xwq+nFMGfck2sVvCKSuYbbK+SJldnnPWSzVhaj+VJbUOLjCgVp
 nUIsypeWw1CsCPd4K3Lm0GUy7hhrzIPAf5KYpLX6m1LPHDoxp3Gf4A7abjOzft1WAik8jZgZOjI
 jW2MRO+++rqIqsxMs8B/0x+iAmKLxQfR9qFj+4OBMnyfuq5y0ahGjUAmRlx+7rCrN31ZA7L0s1n
 KUdzpn9913YbM056M743FpwoLCxrO4fm1k+jK1Uq2OmgofLV+deCC2Y6GSDSFYPrzmezMOnFYtk
 +65FSQWuhhNJCRWagzs7YUEBxqW2HZOAy6tQQNqTyS2fhFRQqAV2QBUhUMXUi0PZ1ZitJjvXAsA
 LSrPuJOd8mnBeKtmKYDzUPSvN5DobVcMCeijKhkZ5FpSSm62mab4AFcRAO5OXQDFXknwJD5U4Rb
 q3yjLhX3t82jNKb6mJw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af59309 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hEKXFTEi-1vmzGoa-5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120041



On 11/12/2026 3:47 PM, Mohammad Rafi Shaik wrote:
> 
> 
> On 11/11/2026 6:50 AM, Mark Brown wrote:
>>> Add shikra specific VA macro data and register programming needed by
>>> the LPASS codec v4.1 implementation.
>>
>>> +/* LPASS codec v4.1 adaptive filter (ADPT) blocks */
>>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL        0x0800
>>> +#define CDC_VA_ADPT_CTRL_EN_MASK        GENMASK(7, 0)
>>
>> Is the enable mask really 8 bits wide?
>>
> 
> Good catch, Mark. It's actually 6 bits. I'll correct this in the next revision.
> 

Fixed the typo in my previous reply.

Thanks,
Rafi.


> 
>>> +static const struct reg_default va_4_1_defaults[] = {
>>> +    /* VA macro */
>>> +    { CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>>> +    { CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>>> +    { CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>> +    { CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
>>> +    { CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
>>> +    { CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
>>> +    { CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
>>> +    { CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
>>> +    { CDC_VA_TOP_CSR_I2S_CLK, 0x00},
>>> +    { CDC_VA_TOP_CSR_I2S_RESET, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
>>> +    { CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
>>> +    { CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
>>> +    /* VA core */
>>> +    { CDC_VA_TX0_TX_PATH_CTL, 0x04},
>>
>> Are we missing defaults for the mux registers?
> 
> I missed in this version. will fix in next revision
> 
> Best Regards,
> Rafi.
> 
>>
> 

