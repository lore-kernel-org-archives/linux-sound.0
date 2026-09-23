Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430683B47E2
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161953; cv=none; b=e38NhvhisFvhqBuBLq7Jv2Q72c0PZdDbnRUH4dgZ3RUwssnmI74Q3xnBXCiYOOegxdllyUooL8W9vSRLhFftO9Cr1Csr0hQWywIb4Nkc+drEXEnBh5aKzxa/daEV74u7dNgfiVSaxoL3ooWww5YLANTU0/YgZ4LkqWZjES4JxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161953; c=relaxed/simple;
	bh=V2VJvOW840mB6HC3q2nKv+QwYl/C0sO76yt83up2DVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs18LeNSb9WL3mevxbR6QmeDGu7EXgNj0nZFbwiVhOeiZhR/0yu5mAtA9tV6bMtL99hM586167GNvhgZXLAQEP+pCugZM2a4yEx2KLWim4G2ER56IJHb4ehHpEtn6VUHnX6mS6EcDQY4MFuh7fWjliFyTX58mRUdSA5M4RbyjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK04NABw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjG9LBRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK04NABw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjG9LBRj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30o73936230
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BX0F61GdgR5H9GDUkQWTHDJL7SZk5K442ZqVFCkL7y8=; b=aK04NABw09L7up4y
	kUDONRmcp4isTM/bdQW/iOXgiEdRhRSRWb3R3Pfj4u77wLuWugnXYthQ2xkdTLsI
	su4+gY3LniN5es6i+Rl1c5ep/o5AbhUMreuqEDJcTWTWVcNpJgiWcSbPJFv8Ibqv
	Xt3QYV2Bme88jF/nb2edjciinQWM5ELlt6CDdJNLUC1QckeyVWvtSkaosktX68hl
	fRTQrAq9eUZKX2dpQifU4JtinNoZg/KHbcWvrbabpXN484kt06+vGA72Enu7yELz
	dBFZG8GK8M/aiOS538totajpa0CKm6OvFxbsMfk6mewPDJ7sC1vmaH685Rrwt4E2
	xrC/jw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428tec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:12:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso1370685eec.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 04:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161951; x=1790766751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BX0F61GdgR5H9GDUkQWTHDJL7SZk5K442ZqVFCkL7y8=;
        b=LjG9LBRjZ48g0bYkfxY0Hc7MMj12a5CNYZQ58MJw8qPtp7ADhESOx9j71uVYJHfzSd
         KWvsEfAhJ+18FWrFzqnn2xq88xdjR40bYYrxUPmsiu4n54A2Hm25pdb2jAo7rf2sW+iE
         0fYgAX+ymTe840KG9UGp/RP7/Dy8qJ/ZS+34UC/0cGgCKI26VgZiHCtNaC+Mtt9xQXUy
         wnmY3muihv7nnl+yCPVgUPvr1XmS1jdXsac0Yp3sNfg0SM67nPN4B5z17xo+mxIXNnVK
         DAgfDSZyOJEN7L/daUeM+bYOL9otvDmirMmZAOUrmmIL1pdYOrFVuyvx3coMbYKJxh2/
         uthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161951; x=1790766751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX0F61GdgR5H9GDUkQWTHDJL7SZk5K442ZqVFCkL7y8=;
        b=wNJIi17/Rw1E6lFxVPuE2bcqFQlD7fg8fbsJqDgRc75/pC9VGClu1UTSP5EcEk/tsh
         CxczZI1HCYNA4MRgwYVZwdfqVli0pTD/aE8lTrF+/4yT8B1Me7+4UEUIEdEkkjCvbk0X
         VZTdLDsRSTs282ggV8vN1X1C+S8/ZMyT9+x82xvDXXSZDwsoZI7r8r5g4hAgZGx5kdPB
         RmLP1dH6mSseXmi6Uks6QzzFp75ZY0fzakccq6gARoQ2P7pU5/76vwVpMDnbbONPx5NW
         9u14CDJ0ALq0j/UvUOJm+5RixDdth7D2ocRUNwHaGVx2Jut31PmoflUAemaOp0yQ8EAn
         DBbQ==
X-Gm-Message-State: AFuF++nz154cQ9Hwuc7ltMl/D1O77unZRXu+Ass3xUCtBMY1eHEmll1P
	AG0AARfmTXEyPuOveB3yXe1TRCifu2aOuW5feZhIU3RbkaVhvhiMQb0HYopSK9kbTWJLflcRP9c
	qkmWJxJ7a/n4WHh2VmoyO11YuGK/cvLDCD+3cpTEDDNuEa30iAeC3q0AC/1oMdbeiFw==
X-Gm-Gg: AYBFou1JmjsEK2CqkNCdfyV3K5jHS1C4iORAs1KmZi45uz1+znXAOdNioDOAZcjwf1l
	00hKQQLhRshbbJ05llpLCXcfTuvV9z25AefMTUU+T+Cu1OzgLiLi4LNON0PA4XOGk/mR4SAcJGr
	/Xfxk5Hw0yQ9LkBkaa32kzIPt4/vkDc37coVQkE6rf1v8WfHVOeF2iIXQloJPNIRWu5+BglQily
	qy9L5s/UALhZbZFNVvzifLMTtdY1oKXRgKJbyIKsRPKdLj1uQFBdIPe0ZhiZzq/vdJJrL+/RWA2
	9RjFD9kpU4P3+2kfd8T/OirAGE3FUCgn2WPNx0DmsiPspTvcY7r+3bH/z4MgcvH/aBq9HXhD5m/
	KFE0gAGEdLEAAan6jueknVz/xdQU=
X-Received: by 2002:a05:7300:b10:b0:33c:342b:3742 with SMTP id 5a478bee46e88-33e8c0601a0mr2180561eec.12.1790161950597;
        Wed, 23 Sep 2026 04:12:30 -0700 (PDT)
X-Received: by 2002:a05:7300:b10:b0:33c:342b:3742 with SMTP id 5a478bee46e88-33e8c0601a0mr2180539eec.12.1790161949923;
        Wed, 23 Sep 2026 04:12:29 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm5442832eec.9.2026.09.23.04.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:12:29 -0700 (PDT)
Message-ID: <760eafc4-8ead-4573-9f51-1c7886fbde43@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:42:24 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jaroslav Kysela <perex@perex.cz>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
 <179008111464.3145305.16495726545311526155.robh@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <179008111464.3145305.16495726545311526155.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3b41f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0awkmHLjsCMGZ7zvgVIA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: fZEA6Vo1xWId2JMLUIf2F4ZneBtOD0ya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXwOI+LlOfu/Vs
 373vBHfLOwPQac05MsaltYe+49gtH/X6L8scWkPvY/UiHWXR9TtXx78LS94d/V0U2oAss9RfRKQ
 H3emJXROJ+0g+S/ZjC/YUQjSCC0n4dALLTfi7DDlKOnArK5/D4K0R67RUmh+YxRE45FrqOJ8Xqp
 hNRYAsp0GC2EZOwDoqM7CxRz1rm/SN+5AFsRr2p9J8iOqM6ImY5miwzkXhMmzXgVa44j9rM2w6S
 hkHBPszaqYB2vJJTaeZ+LCMiKcUJaBZVYFlzOQEbRpobEICoKkMFeDFxGOjyNkMudcz2h/58vv+
 tRiblX0lCx1FBu82YWYK03DzIWWrp0pmFpi9wIvMMFIw7g4G4oEMfbvVSchw8SJI9z2lCzeBd90
 GkuKvbuwJQmi0DLN4ywPmaOR1Fjogeo/3UJ075vCTwLcRCzeqgFGWPDBT1hjizzQolxNTErJ5fM
 plNB1ZVqI6+0CyZxciw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXzP12+Q4D5WJA
 qhE/wMOt9slXeL5qfLGYOMtx2KkBwQPSGmHi2w/psKocnDHWLBupNQEMQF90Oi6KaB14+cU8kqI
 aHyTmDTlw8t6CSM4PaCfYB67OAlJlFo=
X-Proofpoint-GUID: fZEA6Vo1xWId2JMLUIf2F4ZneBtOD0ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230044



On 9/22/2026 6:16 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 22 Sep 2026 00:38:11 +0530, Ajay Kumar Nandam wrote:
>> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
>> context and cannot use the SMMU. PCM buffers must live in reserved-memory
>> carveouts that are SCM-assigned to the appropriate VMIDs.
>>
>> Add an optional memory-region property (1-2 entries) for the
>> control-path and data-path carveouts, and remove iommus from the
>> required list since mDSP platforms have neither IOMMU nor VMID DT
>> properties.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml: properties:memory-region: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Control-path buffer (audio_heap_mem) for platforms where the DSP runs in a stage-2 protected context (e.g. modem-DSP).'}, {'description': 'Data-path buffer pool from which per-stream DMA buffers are allocated.'}]} should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Thanks Rob, fixed in v6 by dropping the redundant maxItems from 
memory-region. The focused binding validation passes locally, and I will 
  include the base-commit trailer in v6.

Thanks
Ajay Kumar Nandam

