Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769350;
	b=I532MkGFvWfDUFrQEuUFJqSV1NcSaDHgzPliEbgqjCoYzATao7VeghHONIH/7q+SKJFz
	 9653Cd9XcDkBLQb95ruqliZ1By6BP7et8cSyCZAxOvNXavOK7kuJazMjLQcERKn5RsPAb
	 rVWleHKoxHpNrssS2GUx8qPPXr0DZQRJxUfCDo+Ryx5i8GjY/9/7rwpMegJd4X88QPM/W
	 UI9vjUnVCF9ygM7sFhUNRUQ6kP8szRoQpXqtZ3IarHFeQVmdseyYVJwldNc09AZVhb0II
	 +3tE2rgOTeeeAMr9VGs5IMNWbrLS8Yl1adfSDZE0KTuEAtbvp7D4xKVV/j3ItcyCRzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
	b=tuhrUik97pPBR6ofaZK8AqMCgSS5LTLWDG7A6GyFTpEj3mSfga6mtkC7MhEli0vCl2nZ
	 XYjDXoh0PzJmrZ1Xdf4OjTjJiXOTZ27B1sXCwCkM87Oitf00M7Amgnb2HeBEAsPYoF2sd
	 yMlVoYa1VnoA3y8QrNXBjMpJvaedA8YNW/UR2+BjoUdvvKf+GH7yUKYsdKNVP/YfI65iy
	 FgovuGlaWG17z+kYLd2cY5eypPZtbH6YfavNnNSoanKyarVJXPowrEjsNx4iG+6+pSLQc
	 eBHTjalUJKERtuoX0NfDYW0RTNUOHlQKxhmuu324TJY0MTJtbEXSb1LNf/o0yuiPE/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GOe0/uRS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DNAqBK0/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F14606A6A6
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F14606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GOe0/uRS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNAqBK0/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GOhO1779899
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=; b=GOe0/uRSkU8GHkm4
	jfY1ctRutj19A+SOZUVmlj7w6bpKHHBs5Ul+CQoIEquKlzW3A5X3C4qF/g+mxVmt
	y+6XU3zuXX1Gw9LME4mZ+dP+eM50S70LnO5vRK9hdXAkcoibfxyi7oiHuZm9s+IA
	+dS2iIak2VcDw5LrJf64jnTzVz9FxAvEVzNOga/MeVrp6OqJwCniLmAoRYhTwk/Y
	KYaZZiV5b160jBOWucV5PMB6hdUAvQ36DDDZK3NV/lhammz91I07v2w4kM4OiEUl
	ax5F19uhiTHB8QtKE2dTt4G1DbnDpMQFXkxLWASYOHpuTJJXHcssKCLhmZRvX+Bk
	CG40BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhgqy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:49:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131b4eso514817585a.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769348; x=1796374148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=DNAqBK0/GcuXqifOwDdZ/KBtz0/Qz4riY9sf/+/S7dW5wbl0ZkvoWtLQP/B9x5lTjV
         tts7ngvMAaIjFlkBfYXO347w6g0qYKa+Io9DiJJhCxrtZobeYYDf1sxrrCYGSbDWW2s3
         TGgotnm+00oLXgjI4/onJZrEl/lmhrRgYs0OUOoef2qebs5N0gMghjlUy8d6EByKpExr
         Aoru4PruQQZKoi9Ypae/EMJmb4JeyyULQO0hAFjGybI5pBpO/wAgpGMizhhApG2YOP9I
         is1KzwdThxa/cNIdX2Vd2lgysygu/7gf5WL68o/u+ncOwy6MKz1lYNgWnSMgms5/M9aA
         Wkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769348; x=1796374148;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHvTs+HH7bruiV6BQeGrEYCg6+e6jxPYYWTFTxOaZz8=;
        b=p8ZKU+JOhJn2bTHgq8NOori7QuzFN1HNRFigZVqrp1jYj1bAVcWkuN1YrO5BWEcu3q
         XfnpkG0IaOB2uXsHFkdhtO7D7N6RlYD8SiST5CwvgVJFyLuH11vpHA4QlUMYZ4oN6g4y
         h/poPkcN7lmZ4ZYkFun5q4tfapbuqvCPqiOD7MjyJNv6KvyIffTF3lvSI3evyLCfEDoa
         j65sajywuvGtBSgOnOSC8RMesXqMhUSKC0YAFsVuOlRbNsxRKA8cXr+j/LQzPVUd1q67
         B1706J+KFZWf2jTjnMG3SzakrFAy5cvoD4vumu8Rf+C0z3m7G+KNOFpJI0M1iy+CwAW7
         +5lg==
X-Forwarded-Encrypted: i=1; AL+hErGwqY/uhQEHvI2Falkkf70hJF9OeQIk4k7nhCse/LV4HPsYL4kQFQmvuwpSN9vLF+hwRoTdi9dyzwRXZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9I0WiAyWDwUCV2MCI05kfmt62AHuzvVUM2fT/CVRgTB/wUcqN9
	AjbjHbTsVhXbUCMuOSnQ27mT+Y/MYy7fE+oS3Sm4N6rP7Sp2q52ZOmh+wFC1urdFOVGMifhy02R
	ZFfAHO2EOddUh57+IhuRNjGJhg8fKxRHDeICQStgFhd5ExiD+WD/2POok014oYAxlQA==
X-Gm-Gg: AZFdTZePVXqX66/tP1kbAMBc4dZz1mcGfI5q5315u0eGmX12n7GqkjHWrNnjSEffxqe
	svOf3Bp287PndpyaIifvUbp6o0pSWfQtnOg1bhOKKpM9MQg9RpSv2nVt8iqTocm1q1T1RQnOkXx
	XSm4MXirS9ffMxfBEDhfG80ZhotUK0UipkJaUtyQLrEKhnN8fsEcgQITErhVc3yC+afbGhZh7w7
	32GuPiR2HZpbEX1Gs7OvKnmSQJfMiDOzmcMBbzs2YC/RTPplLlLrJQP4pHbayX0Gzjk15PFGYIT
	NYM+xgBOk7tRiJ3JYoTfG8Z98VnAd82Fc4ho9gBJK8A4swL1bTPxQtJuKufWRlisoNpO7mHIz1X
	/Ueno7XIIZeYNq1WWAbWjxMyOM4jTA6RaSDT9EtVIg+KYjOMkP+6vAa3VP7wgvOwHnZPSioX5Ha
	+Dbg==
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923739085a.50.1795769348572;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
X-Received: by 2002:a05:620a:6c17:b0:93f:167e:d990 with SMTP id af79cd13be357-949bab3264emr3923736785a.50.1795769348204;
        Fri, 27 Nov 2026 00:49:08 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm821554315e9.6.2026.11.27.00.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:49:07 -0800 (PST)
Message-ID: <d24318db-c2a7-4bd2-9216-1ed5eb90a226@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:49:06 +0000
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
Subject: Re: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and
 WCD9378 codec
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
 <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <68d1f55c-ddcf-4081-8111-9773c484ca07@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX3cYH7CZtEzaI
 KlxEXImdyOEMir3LQ/OFgamU8DJ6+7Uh+hyKMi5wvaIoUycbwzk8wqGUOOu6yMlfVbN9OcvYxYN
 1pNr3mYzgmqc9jjfCRRGWhQWI5/tAfo=
X-Proofpoint-ORIG-GUID: Jyq4oftor-181DEJUuVA_Lcw2UjJptO9
X-Proofpoint-GUID: Jyq4oftor-181DEJUuVA_Lcw2UjJptO9
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b094405 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=R3xOvuxQfeku2NNc9hcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX01G8z4V/LXJ4
 KNGbAcvBWaXDpT5MHREFIx+mZ4zW3w1kUqtfskKX4S0SWMh1NQgGxUSzx/nb+kbApmIq0SSWI9b
 PUN03xxaQKBwBYwVs/D2yakO6aq3V0DZp3C2ff5ggMszzZ5qGFlfUCLIGxT1tSA7yo88A2r2B0X
 ZMIA+8wutBEte9OMRKNOMjyjtcxF4HQrPv3WOQ/ggvigQvwq5N9f5BdBFrlCsKcnkqMfeS6JVRs
 yBzEyU77RsHKFLH9MmTTcD5+1pNbdc5D+BccNvXC+j3giO+EhDKljlNymkImv+1CzP0ZvJMavbJ
 zjuf4zw+Xv7BcIdy+0/y0ng67zV96FbwysUPvU4lEvErGNw6fAqRw/ZqrbBFCyrGSvae7N2lj/Z
 tALdCq4nuhHaWkphs7sUYrvv06GWlATW34MhTmbFbTepHEbt+iJOoyBylH5OZ8zZl8FAmqN1I1r
 tEAwbrx9cxZgqwx4WLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/27/26 1:42 AM, Krzysztof Kozlowski wrote:
> On 26/11/2026 19:38, Srinivas Kandagatla wrote:
>> Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
>> CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
>> working headset audio out of the box.
> 
> All of them? This is board specific, not SoC, thus please name at least
Yes, this codec using generic sdca class drivers, all the glymur
laptops, like T14s, A16, CRD and other models use this codec for analog
audio.
> few upstream examples.
Sure, WIll add that in next spin.

--srini
> 
> 
> Best regards,
> Krzysztof

