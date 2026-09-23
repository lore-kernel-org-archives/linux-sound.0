Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBB52123D
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180574; cv=none; b=KJFksu75vi6UGfcXnhI3ZrPlU0uPzjieFmAhs7LW636hWGu0Ksv5q/7/9DAsYZzGC3nVxlpagoHr4x+fahDmv4KPdTLMOJnjxO8h/5fkLLIXb+mwhAPKgHP07CT+wdd4RZiT8AP1bFzh+x/dUcdbMd+jW1hKz+tNWXg7ec4v2GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180574; c=relaxed/simple;
	bh=+Fr2pb3MlceLafCJN3oInlXw5sC9AmlPwt+XBu/LWmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uP51qrk9G0k8upNByqMDYgf+WTLyNejORRsgYTiBakI212+URrHLmwWCF3AZbmGuWsWJ6PssVwD2fYvkArTE8mrkWICIaAWtP+BZvG4VW55l/WVnUrqm9uKrCLas8bdfPUr7gn0JYUBT+nAyP6UHG+fRV3MHuaIf4bJEmA2fl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOUvwRZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ns1+rBnQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOUvwRZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ns1+rBnQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NG9Zex019956
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 16:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgBNUPHEEKVkm4oZQk6Lvcojji4szSfv3iV2gwgCPzc=; b=JOUvwRZJMomDM9DA
	OznHK4Jr+4VZkFTDf0IMAZQWSmopNpAP3JSePnQEb55SzUuw78etHe7MMXpzDuPl
	5iQmLeYva14qYS6EW3ZpiDrQEfBHYj3Amq7YT5BqicIn+iT/HRdymXNCq3HZZG1h
	TPybkF+a3zzAoa43XefFi2B9jDXKHMAqdi1Fpv3cqC29OBEejT1KzcnTXNhPVTZR
	jDplJZO6vULBdxAd08WctjkA2jvtwqvknzSAPLZQRLe24cBQ0oHQd3MElLu8dMBm
	mVWfjKfrtPzUVqu1hUNmbKKmNyCEwTh7M2p61y8WivJmc7HR7p/FvbSBHbUd4rGY
	SaWkhg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbgthu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 16:22:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1163124a91.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790180570; x=1790785370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgBNUPHEEKVkm4oZQk6Lvcojji4szSfv3iV2gwgCPzc=;
        b=Ns1+rBnQorCE0NFEIR53EjNuQh5hPWFEMY7pX9EfdAioMHRU/cqrTH5hote1mo8QUU
         44Y+0atw8+m4seSaw3efVZCf2bYeUWz6jJdQPjqC/Fy7Yz5IuxxXVtm1hhFM49yopKXG
         QpiiXb3xurO3v9CgmcU5QU6TuXsYO+ZUvU13ZNROe+Gb7Gljl3cfSUdkv8vGeK+e5s/u
         //oRp2T3dAcTq7OW8xIXojx4a0ySYSWXABk1PbMU4PjFxwiDdUFFGraNCcC9xuZIAPCn
         Z9gThQU2JY1Ue9XEGEwQIKJ6P/u9k0Ybodj66d+wbmOXcB7XiySEZBPkmrxRQ8miwCvL
         G7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180570; x=1790785370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgBNUPHEEKVkm4oZQk6Lvcojji4szSfv3iV2gwgCPzc=;
        b=bdrEpdo58zgTsVJIwm+ld8tQ/yUwuu5pOB8iI4adTvXtofWWNbJqlJdHpOx5rTtEwS
         4K9BzEqkHCWUDiHNufL7Wz5YPRIW/wfrKxvzy/DSxTKwPrQ5b7LfT2QYAKszJTtadMBI
         lHLwPpWdHs5DXCHhLoXdSEyxhRyL/yCHW72XX1b65E9Bj4LzR8UF7/v05WWZ2SmFF/18
         NK55fVgFR5w+pVBfvn4dIBBqDXh/mXukL8P9MUkioods7ZJybNJnMvi5IlX75pr07NxX
         R1XwGzibW2cdKoP1yFtpaci9+mHltPEV0MLIos8xEmI/Qx53Y4DM+eHGJercbiJshajD
         Pogw==
X-Gm-Message-State: AFuF++mmdGeJ/7I09XU24so9P6tI8Fgeg1wqAcLRd9TJgntkVXhHN/vo
	H4YvfznHRxQ45Sz1eL9hqwtQ+24yvFtivzfAdfYSzVqwifRtbVS4y6evnZg5eo8ggHafWsk8MXk
	I2WGGYd87lIQ8Jwj0dTDO8eK7awnyFuoVw27HSdA18ZCmAw6jT9deA4nXPCFpWJvcnI5kH4tYuQ
	==
X-Gm-Gg: AYBFou1BNFeKVBmGjzBSzeLcKfFuTQ3dLm3ty3AK7HvIfql5V3yhlooZgdpmz4mt9uI
	dH9LvSyl/XVqxkrRl8to/dGzaK+ayP1nRRcUcBHaQr6KNen1LvdPSR9pAN4azOCEbHT9CilPJRm
	erJd1Sc0eQyiNW9sBq4pfjRiUKXweHwj8bQj3mDtbhP84Fd4l1PpQIAeisM1N6ulddn4BUM09Xa
	p9dX0IyM1cg98X6MYyW63fSNSpGcridS/Il89JusmfVMpuiLx7Lj000k0l0grntRo1NAuPHdNpx
	twGe9dCjoskEDdIsgytQOzxSEfsF1L/oaejfgXvwJaryED+9lox/PS06sB1KLMy1BXlPvP53eIt
	CWq9nBNOJkFNFbUVQQzlLSqtnlLjl
X-Received: by 2002:a05:6a21:151b:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3ddf830c18amr3182996637.64.1790180570106;
        Wed, 23 Sep 2026 09:22:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:151b:b0:3dd:a196:3090 with SMTP id adf61e73a8af0-3ddf830c18amr3182957637.64.1790180569474;
        Wed, 23 Sep 2026 09:22:49 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbcc08sm1623120b3a.15.2026.09.23.09.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:22:49 -0700 (PDT)
Message-ID: <50b1dabd-4e5f-49a6-b682-1059681b00a0@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 21:52:33 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
 <0d2a8e7b-6a7c-4cb8-a6e4-98a7a5615764@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <0d2a8e7b-6a7c-4cb8-a6e4-98a7a5615764@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX+D4ajeMoMLW+
 ozRF+Db+4FIWFqabO8opAvbPp22EYs6woelKB4Rh4dPoK1fBuqTvcjU+ihO+BvKeT3X+FUoRTHk
 B+yfZKXlWnET3LuJRCKmhimnp/GytCE=
X-Proofpoint-GUID: YBsVDDAZYAzvG22HnxLQoIRL8HauaXAF
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3fcdb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=t8jTToblx4jCBEoCdggA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX5q54UMNrW9tm
 SCnCfJygMI37Cz5di0Rsg8WumrAAZ3W3bUXtvMEJ0TNASx/OcFKZD9mo3GcfSe9XahhIlYGGIKk
 +91J8HE9AWlMrz+Va46q8RqXRacYbAVfIvvq/V4GA7wAdYTehVNoqnIAe7XkU5GT3IZ3TBzUn9N
 UkbJjaoSB4duNC0IPlEK9T4w9D9stle+XHH2LtVeOlf9U9trflJhHRWPEOtoON1lty63PKVc4y+
 gAllgyuRDDE29AI/lM3slJ6HzOiqJ7cmM0tRCxlnMkKe7jGb4EmZeyJfcMo2hyvmoZjzTbyUeE4
 wfcZ0Qh//AoWSQLInPLxs6re962UX9/Z0G/l11PWsznwfvfIVWPa1lesJTl7/A151ZcyilGj1nE
 KcBhD66YN5WwTCtFTcNGXUVdGtmjwfQt2nLrZhE4tUynGCl2lqQrTAfkfbjMXr4XauHcRCHLZHN
 tfFoY0b4bprAWDqOLBg==
X-Proofpoint-ORIG-GUID: YBsVDDAZYAzvG22HnxLQoIRL8HauaXAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230065



On 9/23/2026 5:27 PM, Krzysztof Kozlowski wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>> index 9e5b30d9c6e6..7d0415f2463a 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>> @@ -20,9 +20,19 @@ properties:
>>       minItems: 1
>>       maxItems: 2
>>   
>> +  memory-region:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      - description:
>> +          Control-path buffer (audio_heap_mem) for platforms where the DSP
>> +          runs in a stage-2 protected context (e.g. modem-DSP).
>> +      - description:
>> +          Data-path buffer pool from which per-stream DMA buffers are
>> +          allocated.
>> +
>>   required:
>>     - compatible
>> -  - iommus
> I imagine you either have iommus or memory-region, no? IOW,
> oneOf:
>    - required:
>        - iommus
>    - required:
>        - memory-region
> ?

Yes, that matches the intended split.

For existing ADSP/SMMU platforms, q6apm-dais uses iommus. For the 
mDSP/VMID path, the DSP cannot access normal SMMU-backed system 
memory,so the buffers have to come from reserved-memory carveouts which 
the driver SCM-assigns to the fixed VMIDs.

I will add the oneOf constraint in v6 to require either iommus or 
memory-region. VMIDs remain internal to the driver and are not described
in DT.

Thanks
Ajay Kumar Nandam


> 
> Best regards,
> Krzysztof

