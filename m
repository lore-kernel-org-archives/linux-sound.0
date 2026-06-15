Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3473E450B
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527482; cv=none; b=nf4UDnmH8pVhKA7Gi/aMs6nVLeXug6kSxbBM3i2huHMm6wwT0M+kq1o7OgmWm/T1F3I2iwamDd9OMl2lPzVQWFyU8zqIYDUfrEA/Rtibgn4ikMjWnirZJuAWRyxft1cw82x5EUfPSGdnTGa/gebAVhQqnSIwhPauY4bQNRdgFFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527482; c=relaxed/simple;
	bh=yDGdisoGHqhD2uNAQsftXw6XhtevjF9h7iWT1/+N3UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROGV/mdTLiZjHGWMjYdfwrFSblH3CwjeYrxHK2/EabwbcrUX7/cKEnRs6gMAzEBJdwGUL1Kc/rBaE+cp13nzd1R5fqwR5PlZrxY6E2pJru0lbx+Ty8OPrT8QjjqwoVXsBrKAen1AcRpWpcmmTHV8DjJw6H29KIB3aOU5WB15+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1Ak06fV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5M5yOwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1Ak06fV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5M5yOwg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZHi0022301
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=; b=m1Ak06fViKIwFILv
	Co/xwH7fiS9HD9OYETBUVU2iXiUojNj6MpfAkTLzWAGahzdWglPtnjrKb78TUyXv
	ig29UFBH9D+tZTMDIamJ3BNG+I0sxxoPZRvFpWN5XRaCPxUADByKmszVXNkAbXga
	jZaqW/1tVlfjcCIQkfV/YhyJptLmgfIWZYQ1pnlbgNULaugrcQ/+pCUimJGz/6vJ
	Li/XTuVW/rJPQEH1+qKclKGgCWrbFjqjeyCZYJf32sYXk7msuPS//0egV8UxxjOO
	ZljI26+U8EtDJi0LqmCKL4oty/6ms3tAllk4J5aFlsaCmdHUrXqfVkZY4yp5vIRi
	xmbTNA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa70jx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 12:44:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso5533626a91.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781527480; x=1782132280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=;
        b=Z5M5yOwg3OK/+adcqmCm3S0FRH6gXMRNsmJsyGUlC3dWCJHCu0VdRWIWTWY0em0IUO
         sMei2NNtpYo07LYXFSESIyZ7+wAYG81IGno7tqSxwNWt/FweDNna80pGE3cfxMKH+r9W
         kxQawJ33X4B5nkUYHLrVIJ2JjZ7ZhcbcEkJ3ON29fZ7fN5fGCdrx2FNUdL9j0Z1eo1zn
         LNC+C1QjLmqrDa4aHJSJ5VD5oRmuXGcYlbJ70CvPcbsWMxFIQbcaGECif6ynykcbZNkW
         qBrbgtrREJg9jZDUWg2uH/m1pRPxIJBqpe7vR+B1xbW+bdgaipZR9lggeM5UcpwvOaR1
         Yz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527480; x=1782132280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdal3zCT50UErLgg+z/Beeqo0R+ObSZJUDe+QF4nQsQ=;
        b=f96NWtt7p7fu1SCcCO4YHjhbjMoF7cANLNBkv3JOL5JL90zZ/N02wvCht/Ui+WeL67
         86cJITAfBAB8wk1kfwKSDCTJoX2J3mlrkdS89uD3O14gKSi/nnw/u5oFY6tKn96aV11k
         MccODU+4P3QQWVQu/9RutktJbROssgC+zJrvpmwDZXL1iwUiHG5ZGTtFq4oTfOFhozAS
         db01cR+vXvGfBsMk4ynBeg0LGAgMpouoPY/qtgO3tKRJhkSvsxR5jgeWqjtY09RQp/C1
         7zIzbvAseMRVeRan4XemmAr2twBbzCnAfTxE4BPiNKptdOy3pnRFy4pcbE0dechVtLvf
         XfzQ==
X-Forwarded-Encrypted: i=1; AFNElJ90pgJN7NePBO73HLf5iyOT8OgSj+7n1Aab1Ysdf94V0S/pgfH/SauwHBHTjvZjXj0qjUZfCOEwnly/qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvz4WqGRM3yJQtjgEftRwsmkrkTdXpUhDPKLzEIqeeBCAni+IY
	VLnLy/aN1qmORd++4dV+CRfQhaNCn7+fM/R+M5suyjpSWH2ToLmsu275SK52RjR+cs8ofJA0SJJ
	l+fHgrSSrefUmi869xL5Z8zvfPl/EsYkWLmqOglYKH/OSRcNl6BmT5HHOauijVBmbqw==
X-Gm-Gg: Acq92OGshYaAr9JedvhiD2ykVAGThbKOrOxhbNpQxkHsTv7O4ezUTva1vr55jvpmaFv
	Z9+6Yo3RQoEGogaNHRgfWave5caoZCmipWBjfibktJVcUh+ozJ1zWkb9TyQjExOMt3vgRCs3daW
	wWmD0h0URiYjgfp+hqOzGxa5mLWf5qHDLF/+jROYe/c+J4dj6Gu9pJETad4bD/oGvcxl4b4Lp08
	QpT2R6Zfk1BLvfZmWEHAWPS246aZsOvdgBoPC44LO1RzQdZwXUqLx0SfrsHu4zwGrCTV2mfkSrF
	FIJLNPjvNg4yi+XbGnbiQz6pB0hVJqw5LfpW4QOgwtshYZ5oP0Wpo9wIJa3ycjbwBXnzppQ6Tsk
	d8D7PqIi8/6xb85IyAT7v0xLc6P4t0o3G2DDvRAVqcccU5yPPHn/PFWmWf0i8
X-Received: by 2002:a17:90b:4ac6:b0:36b:293:68d1 with SMTP id 98e67ed59e1d1-37a036ea487mr15256784a91.16.1781527479562;
        Mon, 15 Jun 2026 05:44:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac6:b0:36b:293:68d1 with SMTP id 98e67ed59e1d1-37a036ea487mr15256759a91.16.1781527479070;
        Mon, 15 Jun 2026 05:44:39 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm10350807a91.0.2026.06.15.05.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:44:38 -0700 (PDT)
Message-ID: <40d9d0d9-978d-426c-b463-c05faae1fad5@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:14:33 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add
 qcom,swr-master-ee-val property
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <7bcddc82-f46f-4366-a4cb-453a213f8bd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eEi-ew1lIJptf2K6LD7DKtGvEakTQGda
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzNCBTYWx0ZWRfX2eygnbLEdfq+
 CuYhyXPNWG7AeoMbMaFAZdQXRp0KM+6FzuOl5mZTo5u/d2SIx26yEg3b7uz4RjOONgryiqfOG+n
 FpkTKBCe9kSx59vrws0JqbEal0qDy0k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzNCBTYWx0ZWRfX2h/VX7ggl2+x
 3jtyIkScxxXKhIYdfDmEyCJobr3Hpx/wMR++hLyFTzP0zVOZ0vGDSCsJtkUiQnYO2Zu4nFkSGPC
 2/6k7bPt87pxs2+kGy6L2I6u8daS6J3xiZ7w9sjEV51atpZNCr97nwFgl5GSJkRv94n6G2p46Cb
 bHMpe25MxuNz3LQ1/guSj2ZZ9S0YA/It8vK6Hp4pjbJsiSXbH0n0IdOrVGkx5UcZnEAnlf1asXz
 gcTXnBx1ux7aLmlpBDjYQHy4hJfcvZB27QwT+IABPTe5VdQuQFFFnuQcSEyNiDX/Unwv1dYE4Ed
 ZKRLAx11d9vZ8xTGm4JJ4H/zhcE8ErgDHLEHS0tkTSnQdmgt7vEuWeYy+XlMR+rdGGl2r7+h+o7
 VfqvY2lhFKK5z7HGfIPT5MYewMFLHDZmBoUnQRHrDekXzWjTPaChQAc3Ho9qO8TfCKxYoEa0FCu
 nL3bD4wi6zyCb8REt3w==
X-Proofpoint-GUID: eEi-ew1lIJptf2K6LD7DKtGvEakTQGda
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a2ff3b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sVLjvJnARbnZsx0J9w4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150134



On 6/9/2026 1:47 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
>> Add documentation for the qcom,swr-master-ee-val Device Tree property
>> used by Qualcomm SoundWire masters to describe the execution-environment
>> value for interrupt routing.
>>
>> This property allows platform DTs to specify the EE value used to direct
> 
> this sounds wrong, this should never be platform specific, this is SoC
> specific.
> 

Agreed, this is SoC-specific and should not be described as 
platform-specific. I will update the description accordingly.

>> SoundWire master interrupts to the appropriate CPU target.
> 
> Why should this come from DT, driver should be able to make a choice
> based on SoC compatible string.
> 

Currently, the driver uses a version-specific compatible string rather 
than a SoC-specific one, so it cannot reliably infer this information. 
That is why the configuration is being provided through DT.

This is a hardware requirement specific to the Shikra SoC. The DT entry 
was added to retrieve the EE value required for this configuration.

Thanks & Regards,
Rafi.

> 
> 
> --srini
> 
> 
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index 9447a2f37..5b06cc1a5 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -215,6 +215,12 @@ properties:
>>             maximum: 4
>>           - const: 0xff
>>   
>> +  qcom,swr-master-ee-val:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      Execution-environment value used to route SoundWire master
>> +      interrupts to CPU0 or CPU1.
>> +
>>     label:
>>       maxItems: 1
>>   
> 

