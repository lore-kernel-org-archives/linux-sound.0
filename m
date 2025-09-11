Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B324BD04
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757570206; cv=none; b=oRvki660Ti4DZsHv96iJQhW0ttoPFjk7WL0Vcp+W+cJDH6jinPpZabdyg53zPmE95D8F4b1sagl1J1LKk7XmTKgc63KWs9DEzciDDCbE3XKK3cl1oifgZak9PUEdc/2Zn9s025zTSy3iWUwpkLf2QX4fUztGvIXQwQoNzNwelkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757570206; c=relaxed/simple;
	bh=DmshXf/5scl3Pm/UJbDqoYcBADlVEZ5RAfxYLM+kk4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlmqVtHwzom7U6fEMCj/5gEEOwlI2jCz4y5yRbWHvGGPkaRB/kFi29koIO1cL6zZ+wUSz4z2LFQebp0gUfRJnKBpUR3Ztgn2w3C5f8d7y8Cs7SRkewBlhiorQds5bb4sGGis15GZeahOJADKOu/AKfiTU6ubnNsCuckEN6UcJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwHnlDp/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwHnlDp/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J1h7016853
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 05:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qrl5C0hT9w9e5dT2xeERuIRlc0KOrzACJwYdylUap00=; b=PwHnlDp/ETMk3YYU
	poO8JWPb67K5IavZXTuLwG9jh2l2IjAmMTrG5cBBCrhfbE761CfkGE3EV+Uyt+nC
	SdUk9JR34iezNr3YpVyOxIueASf5R86tfD4tP80oCgsUIND6KsfrhbY0QabWEX+L
	g/XNkVK03pIAODkXX024d/TOZgGEENfCrahBIT031EEfHKqVv2BP2CEZ+tnPVGfD
	L363AJllhbvILVG8kC36T4rkECu8zweElQPJJYA1x6xlDtzZDZ17wDcdQE3+moyn
	KkxrbviquK5hCJpP0szRw2xeNd2hWHHSYblshcVyaSfWQjn1rO1Zr9ZIjK4UCakv
	XBtUmA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t382w3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 05:56:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-728a71d8fd9so10665666d6.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 22:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757570203; x=1758175003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qrl5C0hT9w9e5dT2xeERuIRlc0KOrzACJwYdylUap00=;
        b=aL0mIoGfG8VdqaoNq5R/BHAh5KQFLJLbsWeOin5i74j9zwhIW9ttHRYDuAhVQfb5Pt
         HknxaLQVdi9fEmnsFv0Jpkrv/FAr1wEE5wlfdfsGM6/MVP0DGftAznz+tEGr2zIC675v
         zBVvDfCUHWjNytWvhiB5bojgD7z8Zn4+LtBERiLksJkWPFjPvMhgYixKSIStRKDY5yhx
         9D1iFwZgHPKUFH1h3FQ+tn4xkT71iR/TjtdiXT2xujDNF3Oa3gsjGlg9dAhygoOi3m7F
         2VPG/+ehkjzfr+pEPAy8yYt3z+PCtVs8ii/cJ7K8FLcER7ICeK1A5NMtBUE9Mz0MBtA9
         YYyg==
X-Forwarded-Encrypted: i=1; AJvYcCXkqNuRvKUjTMDI6bqxutf8WWSwxORZk5t0+pzmHO+2D0pGUjm3LskZ7sjfsM9Oy593B/hIeXJGu3zUpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNdQDx2QxbM0b9c1Pq34p2jI4HAV73ojwPJSWrWeaTcs+bnDc
	yzSyO3DqJJx9DEu3dMCTA4gCV/b66GqqJEEfc45qQKBRLR2T5ot51R5/onIMv5N3lhU4wxjG5A5
	l/7sLWjwwwyF/9R8LfIMKx1nhXCqudCFSvSorad24MPeP4HJUyynEzs0gwa6rAgwjSw==
X-Gm-Gg: ASbGnctKa781tMkjpy06OiJ0wZRgzJOLcTkvQNcv9CJ82CdbAetm3ZYWTyVqbH43qv3
	3VlijQJpOj7e1FPBNajlDxMwWL8f8Lqmij+Min11s0NMqJcGB1CdJL4FbfwckgNG/kuz17UY1DA
	l0fSlgLZ1VIfvwsAnIJNV/99jCCIdiwJxx/FVagzU/ULoPQGmrr7Lk8XDv/jzj54HzwvtXXBxdj
	GcToxPdBKawVtf8jheB9VbnKxPFQJOW9pWS91liFavmsLdsJoq7KEopNe3gxl7qQUHN28Ii2eNd
	LBCVT9lQSCEL56KOKtKoWO3qIb+YZPvdCZiFJwOAFBwhQhBkeLKQL97IdLu/ofrVauM=
X-Received: by 2002:a05:6214:224c:b0:728:a449:2187 with SMTP id 6a1803df08f44-7394587e1d2mr211055336d6.62.1757570203172;
        Wed, 10 Sep 2025 22:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEctnZbvL6Nob+WnC7gYxO6xEq3FJkrxhfSF7sRsmUMyUoMSDUtaNN2Zbm0L9GTtQcYr+zoig==
X-Received: by 2002:a05:6214:224c:b0:728:a449:2187 with SMTP id 6a1803df08f44-7394587e1d2mr211055146d6.62.1757570202741;
        Wed, 10 Sep 2025 22:56:42 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e03718c64sm10121535e9.3.2025.09.10.22.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 22:56:42 -0700 (PDT)
Message-ID: <947514af-5039-4ed7-9d24-893e8e6a436f@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 06:56:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
 <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
 <7b7db1d2-5f53-4b08-920d-67a57d975313@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7b7db1d2-5f53-4b08-920d-67a57d975313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mSDHAn4HIcKXCBB9XLUvwtPSd0-a_2a-
X-Proofpoint-GUID: mSDHAn4HIcKXCBB9XLUvwtPSd0-a_2a-
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c2649c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1gS6Q4nU2R3-upBo_fUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX32TwoV7GjK1d
 XaQoiC3B7UJZzl7LmCa5VZiMdrTvgiv43UyW8pbvzcim2SxiOaeAlNQHFL//bVgGsBTd9brLbfn
 d4xPNKqjfkdwtROWnceK+wZTbfaCD75w9l86ErHoF1IEUzMwzRqyHyUTO/YgvuUpzNeap7qMJzM
 9PA+6xgQOycHI77kr2xPkHbqPuyxxBwF3+OTd3Nasr2UfRE67LReZlIz1OTPx2hNzp4Disgaynz
 VA7bCXEXHdbzgnZL04IBPgiZcu+jTAMybhWzcpgrF//7kQ8npUtRSLCcTPBk7OTrAqKY4bfUTfc
 N4x7pobqpB76AXUkczJuHJm6uKC4gxIUl87zTkHiH0yfd+fPKrxlP520csExXQD9mMdaKnp3C2b
 EYPbXUKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066



On 9/11/25 6:49 AM, Srinivas Kandagatla wrote:
> 
> 
> On 9/11/25 1:52 AM, Alexey Klimov wrote:
>> On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
>>> This patch series adds support for Qualcomm Soundwire Controller
>>> version v3.1.0.
>>> As part for adding this support, a new macro of_property_read_u8_index()
>>> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
>>> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
>>> the register offsets, new entries are added to the variant data.
>>>
>>> Tested this patchset on X14s and Glymur reference platform.
>>
>> Well, I don't have any Glymur devices and no idea what is
>> x14s (I guess some laptop), but I picked the series locally to test
>> on sm8550, it seems there are some generic changes, and
>> qcom-soundwire probe failed:
>>
>>  remoteproc remoteproc1: powering up adsp
>>  remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
>>  remoteproc remoteproc1: remote processor adsp is now up
>>  qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FASTRPC
>>  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 12
>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 13
>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
>>  PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 14
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 15
>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 16
>>  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>  platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 17
>>  va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
>>  qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed with error -75
>>  sched: DL replenish lagged too much
>>  platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec dai not found
>>
>> Are there any dependencies I am missing?
> 
> Looks like there is a bug in sm8550 dts, its adding incorrect number of
> ports, which is why we are seeing this error.
> 
> Its good that alteast this series is detecting some of the bugs.
> 
Am suspecting there might be other platforms which could hit this issue.
Eventhough allowing old way is prone to errors, we could check the
existence of those properties and allow old behavior, may be with some
message or warning that incorrect ports are being setup.

--srini

> 
> --srini
>>
>> When I reverted the series the audio started to work again.
>>
>> Best regards,
>> Alexey
> 

