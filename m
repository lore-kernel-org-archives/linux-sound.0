Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8AE3FFAD0
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852795; cv=none; b=VnGXR9R/GbdIdCh21jqgvVMbmVbRyH4iwPMFAi/Omvm/gW00OkKeXBO3G+VZue03kx6r9bQJkU06KRpgl6WX89Z50PHgPzSf9qyPuJnU8ccpF60/zDr6dRD1sVte87heKjxq8UQX3Ggj8QQT64i+YUWD9lB8a644JcUQ1VMLlkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852795; c=relaxed/simple;
	bh=OudGoG1Xw1V4jzeG/S5z47MQq+WzDcNfiByweynrSHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XP1BNvH/UJuQA2ILz7H0DtFCKAg3hDM911oT+bOv4Lg7XQy6283X4vMcbUj3Wpe550A7RN6a7S2Qf6GGNNT/ETKtatMgRthkXPRBqm4TUq9bn5hVOyRfVlZBOD7F95nvdZ8IPqyP3zb88PlWKD6Rxr0YfkyB5QDW871by0bN7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcEYBc6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSkzbXRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcEYBc6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSkzbXRH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xf011511890
	for <linux-sound@vger.kernel.org>; Thu, 1 Oct 2026 11:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=; b=VcEYBc6+b4C+WVDb
	iLdfvqBvSw5hT01rhtU6/L26aw81sYFLL3XXvE2BklbjHA55Vf0/0eA90/e+lqtn
	kvbrAvmpqAnU308cfX8H3IHIDxeO7aOpi3nsm7ELV538arP44+bJ0z7CBDYE/7Go
	hX7RW4iXzt2hTVuu1UkWr1CR7aDQehJkelwt4fK5fNsHfcNhea8mRpuWsBZWJKVe
	hwrdYktc9vK4+B1xC0IV6oHS/Jxojr0itEjWq0TpL7ofIGop39mT7rqkxJZYy4sq
	Ycat3YypEdZvv2hqRp41bCFP2Duf88xS0m8X/AFWxfqLoE21hNKzEth2vvNyOCia
	Wi6CfA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sud62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 11:06:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98a819e426aso533562241.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852791; x=1791457591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=;
        b=QSkzbXRHYhFrSrpOerNCAEKs5BKuM7xXRRAfcOlyhYgf9zkkCmHSeo6x3fFng2Htkp
         QeeISg8YtAGBRKzvSGTLiNi3oG8QEdrtnzUxEV3EpHfzuY30yPNN68TG2WZUT+wQEbnU
         rv9lyJcTFa9NqzZmw+oLmpjROEot3tRHc+kSCbNhHfXitg8i+aP+WgiA/yXq3qy0RHbC
         sma1lRdSmOZpXO3vozSktckSOMdGKwl7JUrMUZmiEuAcmwmtWaOHcTaxV73mWfVMOcbN
         YQ+5/H3sRyCzqAvOsrFa/yXaX7BbBT1wh6G1TEwSlvWAdUf2RdZ6ARiWrntFA1Sqj1jh
         NRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852792; x=1791457592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j07mDs8hKEZ6BOzq0/CtthubvO4QWRGm91M2icxKLIg=;
        b=lGUJSFmLo6Gz+ztE0VZcpN3Fo+f4elNUladeby2Wbw3Fwv+psIXdMfwHbvPUOdfy+r
         uRswc5mGmTr+Km0xzFi6kwA4d0eaZjCsVnmigFsvA92x1pmvEeIbA3NMF52sDb/jB3oW
         tg7IkAM3HMV0yYTefN5GRVbMpjZgFNeDRTIxEuJc30PUlWKP/BlUckH+dsAX3Pswlzp+
         rPk8u//q8HV43/dA+t0SNlEi6fJPpxIOQYJY4ZR5TjMmOLTmCbmVLqILiiLZPLzCrtWv
         SksF8xKi4fVD28aSJk4T7mxZUDh+PthPlD4ZvXavZWHOuxA2F7J66iDT8F2fF3FzuKqz
         AtBA==
X-Forwarded-Encrypted: i=1; AKwUvBxy0fwIrXb7wyVp7nOAxzsWubfJhjFTWx0iptZtjERKTeOk3I/gokndy7iwD8l9DSZdGUtyMhdc0Njogw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrLpWwK/vVQ4jrZ9SIN3CUMmVrNbvNFvUBQTtFa2Vq2FbyxJkc
	m6sb6hrfkTKvkQ2TDhjv/6ReMh7EiVQdwWijnkOkX7FeOBOVi8xW99UVE1n5AhO/FEN1SC5z5S4
	0nK/iynQMPU1Br46yoNyMpBo2jBkULQU7kLJshDm221/UMHYAYXc3vu/CBcp4QBIBGQ==
X-Gm-Gg: AYBFou1WtrUAXkIIkn15W7Wy1PcBeRXl/kJGMWrDYhXqmhzQRUmlwyCqXw7VXo/vSB2
	mKGJaGP57BDt7WeOwTKsfLOn7k3Vzn2WTneuQmYD2xYgUaZRxBL16T/drr+xUFaWQ6NYymTGOhF
	8eC8pELLD8Z3qcW3EntpIwLEp3pZ4I3d6f5AYHUVRgOf5W4MsUw5SdMIUEYCX6agkQ3EhMbWTYu
	B++OpoWauvbAsUryI0uOXtZF0QgeFn/gL8OAkGZi0W4o9wVDjm8qWV1tab5Cgm3wq9XHDOAoWdB
	/QhGNWyBScpBTvo183EwnsYyb1eAhk8eskwaDXiCVwM4aVUjfYG2Ow8cYwWOT6Xaqp0pxIMEs++
	bzCQ8GJKFWTZhK4pblIYFXLai0Q==
X-Received: by 2002:a05:6102:2244:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7bf83a64f28mr498351137.20.1790852791612;
        Thu, 01 Oct 2026 04:06:31 -0700 (PDT)
X-Received: by 2002:a05:6102:2244:b0:7bf:8ec:4996 with SMTP id ada2fe7eead31-7bf83a64f28mr498342137.20.1790852791121;
        Thu, 01 Oct 2026 04:06:31 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2e31de168csm132870766b.72.2026.10.01.04.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 04:06:30 -0700 (PDT)
Message-ID: <586046f1-8439-4353-b60d-dab6356de3ba@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 12:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soundwire: qcom: add multi-master support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261001093806.634862-3-srinivas.kandagatla@oss.qualcomm.com>
 <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <0ca6ee6a-020a-4705-8323-d524a813d3b5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfX510k7PGjMo+t
 FxH6ah5sdF2ruldYQZfuXerLZFGTVoEbgM6Yo6eZLXf8fNEudw9UiOUXtCgkW5ODjUd+zR/rSOM
 ziWm3BuBAiw8pn4eEBA9cr8C6BZTNaM=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe3eb8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=76a_tzKS8ymlcKiXT4YA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: wdxRBWnkTs75yN0WmzQz8Q4Fdw7BITKT
X-Proofpoint-GUID: wdxRBWnkTs75yN0WmzQz8Q4Fdw7BITKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NCBTYWx0ZWRfX89y9Y7N2zrfV
 k/vXKS1AHwPFTB1ez3yBSM8jk4KWuhoArdFtz9NWlKgE7ykqWIxidJ0RXjHJC/ONnjug6zvGR8c
 3FCZDE0BjCCfiInNfDZs3eKScHiIt2WoMbOpz3kb31sUGlXwZGMOCzhb5zsrDk/SmPUuMWPN3Yf
 VJ5ZAZkUasfL52g415E8bmZWqO2hZr2yUYWTy9uHkB3RJj71ArmB5r32hBP7TmiaFaXzZ7b0Fxs
 ioI/S6JKYZMZD3PUYz60uwEtuZWf85w9gzvXO92d93sNq1ZyGtnhZjXU+VSwO1E5iBk6zQ2HzXo
 9QdoJvSrUYEWtgBKorbgsdsQepCwRi4fT8kzwG2DdBqULto556zItIX2Cbt4eEdkvAneTIgC8CY
 KxtJkWCUBvSMC/C+OSPhh8y2nI5JoJT1WO3tDqXVkRCKhlnyPjf1JcqyqsFMSiUzoMvsLPR4eep
 k+veuBs0jdQVGHo4X0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010044



On 10/1/26 11:53 AM, Pierre-Louis Bossart wrote:
> 
>> @@ -192,6 +194,13 @@ struct qcom_swrm_ctrl {
>>  	const unsigned int *reg_layout;
>>  	void __iomem *mmio;
>>  	struct reset_control *audio_cgcr;
>> +	u8 num_lanes;
>> +	bool is_dependent;
>> +	struct qcom_swrm_ctrl *peer_ctrl;
>> +	u8 peer_first_lane;
>> +	u8 num_peer_lanes;
>> +	bool is_primary;
>> +	u32 peer_dpn_offset;
> 
> nit-pick: do you need both is_dependent and is_primary? One would think
> that a single variable would be enough, no?
I did try to do that which made the code bit confusing to read.


> 
> also without context it's hard to understand if lanes are independent in
> terms of transport or not, not sure what 'peer' means in a multi-master
> setup with a primary controller and N dependent ones? Code like this
For now its one, but Yes, technically we could have more dependent ones,
I wanted to keep the patchset simple and right now the only have one
peer and i dont know if we have other setups with more dependent
controrllers.
--srini

> function below is a bit cryptic...
> 
>> +static struct qcom_swrm_ctrl *
>> +qcom_swrm_port_target(struct qcom_swrm_ctrl *ctrl, u8 port_num, u32 *reg)
>> +{
>> +	u8 lane = ctrl->pconfig[port_num].lane_control;
>> +
>> +	if (ctrl->peer_ctrl && lane >= ctrl->peer_first_lane &&
>> +	    lane < ctrl->peer_first_lane + ctrl->num_peer_lanes) {
>> +		*reg -= ctrl->peer_dpn_offset;
>> +		return ctrl->peer_ctrl;
>> +	}
>> +	return ctrl;
>> +}
> 
> 

