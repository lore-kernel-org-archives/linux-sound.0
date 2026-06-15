Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912A3EB0F2
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528725; cv=none; b=BeyjXXLdpybOj8CV4nwZRr4ZksEv4ys5rE+G/DjSUnzdk+3MhTujC04GUwN7cD5GGeEpJFP3vVJxp2cZ4gvuFzHZS/lAN7ZdtJN9JHS8kit2Jh5g7BkJIdq5AmmR3Y9VHJ5nOOPAzDdsCW6lt9o6icmvE4NNWDdG13HJG+lSMOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528725; c=relaxed/simple;
	bh=XgesQe3JXa8zucmBrwvVS95U6qk/57Y4QGV8/8eiicY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omp2ouNu/1AR0TTxjB8zAFoWnkHHybI2DFiGqvIghD9aVpT82KjMHW7PQiuyYD1Xt+DZI/8Ovk6STu5HRCmcev/z7apHZZL7ODQhrG6De1/sumYfBH7aLykuExztwBVT9dqTeVK0h+iFsqzuqrzp98O1KE+Du+3JalawriC+RoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKdSA7Q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH9KuUtu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKdSA7Q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH9KuUtu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZNYl022353
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gj2eBCwiJFOuabZ6OES/P0JXow+PfXd+VcRW89Z/+NU=; b=JKdSA7Q3tVUfzqtk
	KRiLAy/d5zD8oTrOFuQQh8xMCkOccAK7vCjxpsRSqIkMgI4QSnB8wSwiksH3e4KH
	dTlNvI8dAcfwWpTkG3ug1d6za2XbrTRW9R8nNCQSqBjWXaQ2LEAx073FY6PODdNu
	mhFHnmznVBAN21z5BJHRV8azbvuFBcGuyTiYtbwKeHSo68f6pvorb46ODnB+Wkl/
	vu/5dlxHXtLGu1410zKyUd9u4HNiUlyll21GnnR2PfbfVNB/6w+azPmaVSfXqCbW
	scwMn5QvgCzj4Vw/hxLeuWiwC7gWv+i3EnnriPoHEeHqpzg1j5KZPGI6soPGX456
	Snf0KA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa70ngs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:05:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so52796095ad.2
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528722; x=1782133522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gj2eBCwiJFOuabZ6OES/P0JXow+PfXd+VcRW89Z/+NU=;
        b=XH9KuUtu8gT3endCBcZa0FrNUTpzhjukh7xEli0UZ4/TpohOs8cWS79VbRceDtrLwi
         kQQXqvwgwrceZW/oUpRKThfPU0XSKlIAJwAALj6UiFUIMv6tctblKOyiGM3X9/he5GIi
         wIPIu5/tFL5Gi9QsVv970+ZbLRXa1roYfnFIvDS7ZjGwtgl7gIzusACR6VErWrI56Hhz
         4gY1a1HHeXq0KRml+fRRPu0IH12sA6qw9antaAqBJjMM++RqKYHKlSkvQ8SqYRh2T0uO
         ZqgknTbE5pyXEPbIcQy5789pxekQx6SuXxLHvxav03R55FijzwIHZ0JFwlKGu96ptdN+
         bUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528722; x=1782133522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gj2eBCwiJFOuabZ6OES/P0JXow+PfXd+VcRW89Z/+NU=;
        b=K40vgnIaYttcOM99TdDFgfaTmhQj0mBAmaYv+yjgqdNj8ys3YPSr4VY8rj7UfeXuSY
         GYbfTJVU7FhC4mheRAI99JNRoDNUqidFg6rwnTQSaBK3d/TvcvwPsbEhHvLhwC5lgr1K
         IutCeZEoVkff/xk471lprGvkH3mOsP2fY0vWqKho1OX9QiD56hcm2l88tGQm/gQIg6WY
         rAHGbgID91yVZ8TZuJLelwJZ3t4W+biqj6v1CerxWd+x3cLpZTz6HFwaSbLWSZRImj6p
         ndOqK8JckP9eGeFroXdiNTKkpcVnkfKOo8zq6oO6Yde1dji2+O4fRdAvb0+QC3qGwCmR
         /wnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y9bYPSKplrHTKCr9Fc/WTlkhT/GAo9jk2c6BAHlnd4y9w2/SoLOSsbJumhngll2FbyQ9p5F50JIjTIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsA+K8Rsc6/MYq90B8r8dajKsVUPga1DmHoMqQVFGDbrst8n0
	yt+b5UKaQDTQrp2qDwFJiSJ3MKHSpulWOs3eBx3zQ61FDR0Cb0eembDT+GfbA13IhyZN6l4YrDJ
	JPDuxfmXTB4EhoQSp4N/cTIx8Eka4/caepdQ8fXsrHNfjNTvgBVcA4xTcxmEDefuQVA==
X-Gm-Gg: Acq92OGr33hi/lEfPdSxZKQxuT/ByeXYwc6bbYn9qpUBHL9UvC059CPLK6kl3D0SsPg
	+PPCX5gxnoHecEP/0XerzgGUTdDL+xeDLvYfO00COWy3gMKVRuwsHYnFNDOAVjdrWb0bT7NB2FB
	oEb46KxvNzNCb8jZjT7MpI5rkvYFxx7cGZALuW2LZTd1Ain29NsI/6bMxkeHWPhU4EFUQNWouVJ
	Hkg0Lv087Q1mJcV32vrXny4fkTrhxdTZUjkBbmRzW417G0Xwx6Ff7Ja4s3/eit9H3yksAR3M1WL
	xDBZcp9k9Hrq0D2FnmVS5mwSoCrjqT0zBQ+c7pywuyimhUyyEhF6CcflMrENdVbefS0KQeznBN7
	qfxTnkpYzlQ5mbuv+rKaATORHSjW2lmZZLwBKie8nf+/4zs6E70k8EGJ3gJSL
X-Received: by 2002:a17:903:2acb:b0:2c6:8eeb:a7c5 with SMTP id d9443c01a7336-2c68eeba895mr38750095ad.34.1781528722565;
        Mon, 15 Jun 2026 06:05:22 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2c6:8eeb:a7c5 with SMTP id d9443c01a7336-2c68eeba895mr38749605ad.34.1781528722078;
        Mon, 15 Jun 2026 06:05:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4332694fdsm91735835ad.69.2026.06.15.06.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:05:21 -0700 (PDT)
Message-ID: <a94a6676-8ae9-43ea-a4c2-7e3de92b20e7@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <0030e12e-96b7-4a22-a3b4-1b42bd32f39e@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <0030e12e-96b7-4a22-a3b4-1b42bd32f39e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yn9x_wTP8ugSG2M6z9Fjt3rKqH3DhlEF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfX+G3LT2xDM3F0
 lt1NROHfqhqToi64avs78MFVYR60ICXd3oMvfb/PPKaRajBUbPkMnrOK2Hj9Myuu0i0qPq/Ona6
 7rMvwqab0zNvQe/5Qc7X0vpKvTl9Kec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfX0lNGIFdS104T
 a7BEEZMmfoD+PSW4gWKVkpIbWZBWEmHOiN+N2kH6KlSaMZ9KIhYhpf29GnYFVnyBr76hKR8Hsx0
 uYR/4Fv0l529CqVl04RfY6expUKwXOcG5hvCSJeJviNLU2I4VvBa9bQiUhYKOR6ThkSust5ysPJ
 1N9eP2XW2k6C/MXM2ik2V9SYHrsx+CBbNGo+pyMLRTB1HF31ik+352aMiA3iHc2mD6DePrjFGIZ
 6d6FOsNVi0XpXNyZirthEkrfSxVoIEToP9GC/U+0slu3qwLO/BhcdNXzeilUXzsFgrjPwziIdif
 VV4w0mvz7Nd7CTL3BopuLsP2sRq2ZgEfvEkDVAEctuMipDgCHh9zku418o9zNxbvLFKDXfXhLQB
 neFmFiftWKY2dJiQSoftGkMed1NzYwM/rmj8sEWFSpExmblLU+DJH79olGzY3lu3w4YKtgovGUf
 WoMTuMtLHO+Yy0M7ppw==
X-Proofpoint-GUID: Yn9x_wTP8ugSG2M6z9Fjt3rKqH3DhlEF
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a2ff893 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p_cByEH9xlcipoJQ59cA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150138



On 6/9/2026 1:18 AM, Krzysztof Kozlowski wrote:
> On 08/06/2026 19:53, Mohammad Rafi Shaik wrote:
>> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
>> registers in EE-specific register windows on v2.0 and newer hardware.
>>
>> Add support for selecting the SoundWire execution environment from DT
>> and use it to program the correct register window for the active EE.
>> The driver now reads the EE value from the new
> 
> No, it does not. "now" means before the commit, you are making the
> changes - see submitting patches.
>

Sorry for the confusion. I will update the commit description properly 
in the next revision.

>> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
>> backward compatibility.
> 
> And where did you document qcom,ee and why do you need fallback in the
> first place? For downstream DTS? We do not support anything from
> downstream here.

Regarding the qcom,swr-master-ee-val property and the mention of qcom,ee 
as a fallback: that was a mistake in the description. There is no 
fallback being added, so it is not appropriate to mention it here. I 
will correct this in the next version.

Thanks & regards
Rafi.

> 


> Best regards,
> Krzysztof

