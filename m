Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF127A91F
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581519; cv=none; b=N+qHiJUnNeJcMeNMbYqDLEX+2Ms2lp8H431fQDPfILW0N/oBw/hFygpju+dz1eeW61gNa5ZxWebSTXdOCOy/6+YJgSB85l9f0vzgAQXOPFV708rAzLhhahUuPlqIAojV6GCfQbAWHpSeqz840jFgJN+DYHSEiSPSvsCJEm+0GXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581519; c=relaxed/simple;
	bh=PZ8cckgNLhYYSqzwCtFOQJIyga//MtRxNtnEtkwBpCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLA8Xsnqaj2gWsZfyWBak8JjZ0faWRAiIhCS7nXw+tB6LnOva3gXD+FIh04wUZIcuP6H6Es08V38ItjzmM+WUM/uaiOwkFqOw8GCXzvOAZXETBYYK7IZxCzXI+to7VtYcl74o6FrdAuCzz/sGCbwh0MZqSu17yz37Z1r7+olLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dnh/VZZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dnh/VZZT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ik4l031070
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 09:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u2naj8CCXUbRQi7woSxwORKajIczkY9v1F3cpnGx/U=; b=Dnh/VZZTQKh1Rdqu
	0X5UxNGHllPcqNRjwml6dRoIhoqJUx4V7ToAh58BeaP4YS5OtQgPI8jenX+2mrnM
	RNYfk8k7MtX+gVYy8jF01jdzyrcyKhnp7RKQnjJ+hEeqyum8ZPPrYfTCtKHQqDuo
	+Ptncou5HZngXTrUHWzDjDpfBYoHUB1kiH/Nv0vmDRmUFj0f4cexYO0RrLLb7/yZ
	/CmgX8c1OUwk2rPjaXXiSubUCTXUzaQbgt/gGdRtQ+K85lyIY+4CUwgrie5t2jxp
	OlYwc+nH50huLhsHJGEEgAf4WV5z2cVFqUKFsN0cq/JLyusTC2RQwOOSJdTGpUWe
	Vrg6wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg6smg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 09:05:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5fb61d80dso14579771cf.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581505; x=1758186305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0u2naj8CCXUbRQi7woSxwORKajIczkY9v1F3cpnGx/U=;
        b=GjiOKlfDCqbZq27/XDQotFXby/OxqswBqLca2mL6Q9c73Pse5n1NIngXSVn89aUgYp
         kzRZFk/3IleV4fAs8LrdcgSmvl+Ck6j8fByWgRE352KuCby6XPNp8EcTj6ciBRzYM4O2
         AGLvbx/x+KF/ZunLQxw8GgN9WDrLQ0NiITQyY/IvxsGLOQcd8nxj+C3ZLTBvJAQEW9nU
         l8mKebkjwDQWpXCywRLlOe9371boeJEnaOifDHZu6t2gOttLS6mFWL/6O4zKy8OQAeWu
         IE5ylpUO6kd3Nr22FpqHwFuOLlf6/cpjCLyc6V4KF8PyDCgc0VklgRPL7uOHT6eGsbTY
         KpuA==
X-Forwarded-Encrypted: i=1; AJvYcCUsg8OtYcVGV8gKmD4rTjwela/Yyk3JEGHSap4kAGbcSKbu/QucSKwy8LLgGT/mhgBT86DyFrhlZJzGOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzccBhOJpJ/P+KO6+d1I84E6CaQSgvHdnma1zpqpVcy8pqwgbm1
	rxBZXyyKuy18bhREPh9RMk0/uwxHTdQvqTVfWvGr4sYfkUsrnU+rmCM6fkIKcGiYVC3NfaC3jl8
	rkNH7pxtlLCCmu/kVpFhe7LIjW/3ke6QVRz/0SQeobLERgVXGdl1jdlxbNeuu76AORg==
X-Gm-Gg: ASbGncutkn2/hXzPkjjDmMmOvdts+/tgtzYBxnuyqBck7wPibvXpIirdMBP1KPGhWyw
	rWb3KiUcf26Hc2UmtjMEfW4ZVas6waJgphECuR6h151G8+yjEr2+Vf2EEbBKI6H1XQqDxU+8Lr0
	9DIhQG14exgNhrzuT5yxD+u7TtvaZyUQ40Dn1oZ7fJ7m66l0NVcIQFU54vWtZtc1bZ8haS47D7k
	+j3cjmmAvOJL4pirBc2QoZQNCXVIXyX5rSjHR2rtFUXDKQRXTRppylb+QdgTj+x3Htcu/+c5pZI
	QNlDp3zjprzxDiJY8yPy7iuIiUI+nfg0ELBeVxAXvd75g/59sDKuzoCTuTvlo2JNggQ=
X-Received: by 2002:a05:622a:4a8d:b0:4b4:92b7:d4ad with SMTP id d75a77b69052e-4b5f843bfb0mr226558331cf.45.1757581505193;
        Thu, 11 Sep 2025 02:05:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTnS3BYav3uc5wJMafVF0tQOozNnyOpz5mhr6CAmgA4gxSAct3x4qONCiVS/C4iKC/Cu/vQA==
X-Received: by 2002:a05:622a:4a8d:b0:4b4:92b7:d4ad with SMTP id d75a77b69052e-4b5f843bfb0mr226557401cf.45.1757581504418;
        Thu, 11 Sep 2025 02:05:04 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm1640115f8f.31.2025.09.11.02.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:05:03 -0700 (PDT)
Message-ID: <3e0de4f3-2815-4912-a528-16147803a7c8@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 10:05:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, vkoul@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
 <DCPK67SQ5DEI.2AFDVRKZSEWTS@linaro.org>
 <7b7db1d2-5f53-4b08-920d-67a57d975313@oss.qualcomm.com>
 <cbb57a2d-c64e-448b-87dd-688458f87900@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <cbb57a2d-c64e-448b-87dd-688458f87900@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wrPU5dEaRlm884vlyNpNoCXNkVVy9f6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX7PG9ADwqwzQU
 flbG4Z859sthsz3wQbyu2mOgZb0n2sK3TkuJE0bLM0qgx3T7qJRHY9ZcXs7aFdbanrIa47O+CkM
 IZk51rTrfN21JTjQr+8JrIhW5c8gFroIVZV5Ps+zH6eDCJGfGwvAqZtCa1sEOTZAcFXCnPH3JHZ
 ECty3CL9NedpCALB5YAUFnvP6B3gFItUFu7gBg1twHoE3BtWUQoseFGUFAPqPLGX62xvGB7NBgN
 J9Kobx5QJjLpcBCaYm1DeEb/kd7RUE56xeK/AMRq6lMhagt8RDoQ7lxx+zDVPAvLt9KzX4pH4fK
 1j/AusVRdoYPD48tsjejO1+fklOrK113NGkqbkGABG+sTpDGhvh9YKNNLr1jKh43ApwenGVu2qL
 KgJ0dYnA
X-Proofpoint-GUID: wrPU5dEaRlm884vlyNpNoCXNkVVy9f6i
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c290cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vF7HM7XGAAAA:8 a=EUspDBNiAAAA:8
 a=vORUVIV6M-B3JFilGG8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bNn2QJc11pDkoTYzAKk6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035



On 9/11/25 7:31 AM, Krzysztof Kozlowski wrote:
> On 11/09/2025 07:49, Srinivas Kandagatla wrote:
>>
>>
>> On 9/11/25 1:52 AM, Alexey Klimov wrote:
>>> On Thu Sep 4, 2025 at 11:56 AM BST, Srinivas Kandagatla wrote:
>>>> This patch series adds support for Qualcomm Soundwire Controller
>>>> version v3.1.0.
>>>> As part for adding this support, a new macro of_property_read_u8_index()
>>>> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
>>>> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
>>>> the register offsets, new entries are added to the variant data.
>>>>
>>>> Tested this patchset on X14s and Glymur reference platform.
>>>
>>> Well, I don't have any Glymur devices and no idea what is
>>> x14s (I guess some laptop), but I picked the series locally to test
>>> on sm8550, it seems there are some generic changes, and
>>> qcom-soundwire probe failed:
>>>
>>>  remoteproc remoteproc1: powering up adsp
>>>  remoteproc remoteproc1: Booting fw image qcom/sm8550/adsp.mbn, size 8364
>>>  remoteproc remoteproc1: remote processor adsp is now up
>>>  qcom,fastrpc 6800000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FASTRPC
>>>  PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 12
>>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 13
>>>  qcom,apr 6800000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
>>>  PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 14
>>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 15
>>>  platform 6800000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 16
>>>  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>>  platform 6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 17
>>>  va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry missing
>>>  qcom-soundwire 6d30000.soundwire: probe with driver qcom-soundwire failed with error -75
>>>  sched: DL replenish lagged too much
>>>  platform sound: deferred probe pending: snd-sc8280xp: WCD Playback: codec dai not found
>>>
>>> Are there any dependencies I am missing?
>>
>> Looks like there is a bug in sm8550 dts, its adding incorrect number of
>> ports, which is why we are seeing this error.
> 
> 
> Yes, the DTS has incorrect value for number of ports. Few others have as
> well. It's known (for me :) ), but I never bothered to fix it because it
> is not that trivial - need also port config for missing node.

Thanks for confirming, This will need fixing at some point in time,
however for now Am happy to add some flexibility to the driver so that
it does not break things that were working. This will however result in
a new kernel message about miss match in dt, which should bring some
attention for fixing.

I have shared small patch in this thread for try.

https://lore-kernel.gnuweeb.org/linux-devicetree/b7a637d1-8868-40f3-8f82-8f5ab0684d52@oss.qualcomm.com/


--srini

> 
> Best regards,
> Krzysztof

