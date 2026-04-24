Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5F3CAE85
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033743; cv=none; b=PTgb5Tr57T1TzlPH5z68mnGBERV+wiGvZk3bf2dcL4AKCFbI5KALzYGM8V7INzmvB69DO7uRtRAF6T/szsUZw1DV6ZflaUqMurXJKSULoeEEATCD3TEyHjttKkG+U7OZJ0goIeKM/WcYRDfA6yd21HTGdXl8JtQ764HN/Y/z3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033743; c=relaxed/simple;
	bh=uKuZ10FzN1B6RsuxZLoalMZv5ofuEdcyCvW+MB5LzYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuIZPAN9KbtUJ8FVKBn1kt+xaTn1pkFJ7PgnbG9cXJQWGXK4hvMNSVH46a9Npv+49d1xxYQp7W9LMUz7QvaIPer44Vo+LZmxWgfo8ogYSqGYyj9z/znptzmG2sPAWv+787OUPkoDtQkzAu74wXcGb7iSu+PBR8rMRXdU6PK91Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epN87TOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPGnIU26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epN87TOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPGnIU26"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9NiZT1533461
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 12:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=; b=epN87TOTCcOeY5MP
	eEI/q95jI5CenddvdPQeuD9h3drChkEqUP+7bXNAKsVu54NvFuUuxbx7aotXJyW0
	20Pe/S/9GHlFNxjjOyoq848MUz9bNqQsnNmQZjS+nMjL6TtkLRo1J5SPyNJ47TwA
	KdCYU4EJYvy25ODcUGZfQqooqBwY1o72PCA+YbcYjoviTeAiSTAyr9tRAdsMr/EN
	sz62+QxH1mtLkxLiWlRZb/uIVtLh3QYvW6R+N8BiR4exXcKg/UkH1m/bfARTNofT
	6PP85PdUskYXRySWvyg74vobYNE/xMc5p+UL0+fIVMeB3Ywcsm5p7a1PLm4G+7z6
	rtZtvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26m53t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 12:28:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83174564922so63800b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033738; x=1777638538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=;
        b=BPGnIU26B77CZNKJ0JoecieNVdVr/PDkGU+XE51CTwfpOEms0pVhSCfCll47TUP++P
         0ueziKM83ECsPH2Fb3Hcu20/myhhl34JKF2He/XD9J3RfSYqPCbU1D3xX6y5x2sOsEQk
         Eb2AQxq+9sMWRNJNZZ5N9TiIK4c5GwPIUd8cruMf0b1/jKrO9xFld+MpgOlM9JLLp1et
         14EhTSQl+yQWKQWvm4m6HNQuK5Jr9siJHJ9b1N+c1u1f1o2za3Xj0wsQWZRf6ziDyliF
         hVjFH3+AZY7a0f86HPQWtAwG4Qq1NrmOLI3eJ9FWwZvFE7wA/4QuTRnVXDJBgttmxN7I
         2OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033738; x=1777638538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llEIp5fqwyaBtRtveOzWn174fewDCK2wqKtqzpu7duQ=;
        b=B/gxCDSQdJxjtuUzKqhf/8xGzn49wnuhaFh3S1QVSRStDaVnxTNbF2QNcddw4Gn0r9
         yoR3yU+Qa4kj/Dzusja2yKbJttmB8Xx/WPmuPpzd4tzjBjkh2/Zs8vDSH6iPXULgUYAm
         Ne7gFgoRi/5jKhUPWXGZkUHxpUNVEtqtXYZoXIYmBKwvrVhRljvvFvZqJpjGvFyp3Yld
         UH/pHTac2Xx7oCetHBTi8nQ3v2QFeSBpSJ8PoHVi9u2DjzhRc+i0IElHTIKAQSO5htwh
         7IW+WSDfNIjC6qMi3GfhnCBzAwfmi8wKGNDJpYYV3UpuV8cY1XeQLiil3IKgut10Wk/B
         fE+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gXgIjmL4DwB09BnGWnvlizkEuMapPysqOtDLpjImByaxKqMrgPc/FJS9Azb2MDuUrVpUiVR1Qp49M5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4Ld8CpivATr9198FlL523u5XRCbwIzqFSFvtsCI2ZWM77eCO
	UILFrn2+vtezQUfRDTgSVWzKV3vT8zVyLVQzv0lQDQL/6ip/Q5uQcR8E5jpRKC8NKqwDP2sB2Op
	qg6fVYh9Uh9rhnvXS/asa473a7z2ENE2qPrfJpIGwMso0BGm0l8z8uTPNMVgjFcmSCQ==
X-Gm-Gg: AeBDievS6tQxJaWhEQt1QcDJYVqiTsQ4vB0Kux5T4in70wMbjxpR9YnBjqz69JoGyW6
	xKZqtaHslHKLk9jNE7Cg752zYH4YN5jXiG3WWR86dkhacBgl1FKRTSYBpk2/N2MBjheax/8Hysj
	oLoFdPyOLbfAjEjReGoql6ZSg3nFncxgGZ7JygvwPJZ1rmpTCS/DoQeJuBOOBiaJ1F5O4r1AWgU
	SlNatZI0k9PP5kcUBx6rK/XCaIW1ZUpmcJmiBdXTd6dYPWyAJFvb/kC7mpp9dkpc9yMT53J+OQT
	p8KUuwyJZDjmqX9arXjQfXUQ0PPMPkdFwRCKHqzotP2De+8ayc92XrEyZhKTRmDorvORPaTuvju
	dbtuopZit8/QugR1JXL47sZocFffKQOH2hYdhVkp9PavptP/92/rIhYzVfimfLLJLd1Mg88Tx7V
	G8WQbwAEWxHuD1/g==
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr17014176b3a.0.1777033738298;
        Fri, 24 Apr 2026 05:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd86:b0:82f:1da:9781 with SMTP id d2e1a72fcca58-82f8c2c243emr17014141b3a.0.1777033737587;
        Fri, 24 Apr 2026 05:28:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb33fcsm22424008b3a.33.2026.04.24.05.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:28:57 -0700 (PDT)
Message-ID: <2f830f17-4bc5-4ebd-a66b-8068a14a871a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
 <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1cLEISk_A-U1FOGXEpKO4ov_L7qG8-be
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb620b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KYwSRLHedoOKSWcoqLUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 1cLEISk_A-U1FOGXEpKO4ov_L7qG8-be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX+pnNgd0xqNgb
 RxNA+10tk5ouWnXXd0AoHs/88iPNv0p2P85xyIyQDGp4qBhUzGsYJecqv8hvaDvSjbPap8oLMrx
 HPJSfT3UYLmmfIAYwWhZHJErWYHX3TlO1DXRhO7s+LDnn742xn2aDgJY3j6dJOxkui2EYRtKhd0
 xl1Iv/lm7bDlizoSXHCy/dQBGKQO1+ItUqTFZRRSTx+MjPNwX2TbCMgMDTHQh1jy7PgT8PNWmV4
 4XVZ7Am/uYrE9L9T4fkvDsWco1qctm6nopGSwNq7lgHnPWi5B7M57McDEr7R+3ascNZpjO25n7v
 AxDcykYTuQVKx3u5muDkltxKnV2M4TivsRMk5PJgOysemo3E+ZeyV+cv3E72kuG/UV2wGbUWocx
 OnFlmspBpRkZv1sjJH0zpjlbSIoI7TBSZ+mW3Eq4LtTcm+yGpEDOBAI5knmheUuEvJqWmaY+AZf
 mVXEJHDu9vF6EavdaXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117

On 4/8/26 11:47 AM, Xilin Wu wrote:
> On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
>> On 4/7/26 5:20 PM, Xilin Wu wrote:
>>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>>> Q6A.
>>>
>>> This variant enables the LPASS blocks and codec macros needed by the
>>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>>> that the audio hardware is owned directly by Linux.
>>>
>>> This DTB is an optional configuration for systems booted with the kernel
>>> running at EL2, where direct CPU access to the LPASS hardware is
>>> available. It is useful for users who need low-latency and fully
>>> controllable audio.
>>
>> I believe on Chrome platforms it was done this way because at some point
>> it was determined that they would specifically like not to use the DSP.
>>
>> I think this is more of a hack than anything else.. but at the end of the
>> commit message you mention low latency - is the impact actually measurable?
>>
> 
> Some of our users also specifically prefer not to use the DSP [1] :)
> 
> Based on their testing, the AudioReach/ADSP path imposes a minimum scheduling interval of 10 ms, which is much higher than the 0.67 ms they can get on a Raspberry Pi 5 with direct I2S/DMA.

We passed on this feedback.

> Since the lpass-cpu setup works properly, I would not consider this a hack.

Well yeah it works, but I was really hoping it would be made
unnecessary and available for removal sooner or later..

But since there's a genuine usecase, perhaps not.

Konrad
