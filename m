Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2D47CA7A
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145249; cv=none; b=PhsZoQHdRNEnXxx2tErc7UkVcQta8RlQVUMdD8AHaxgOF9px4CF0v/sUcvyEMU4jlAdtDyw3bhCyeTZOKlAR17yNYdeDvW+DDDSff+bmklD3ZvEn/o+SnEUdXITkFWgwzm/uuygSKTGxu7WpNXIFZemcmioFrKNyENUfofKre+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145249; c=relaxed/simple;
	bh=svnknxrvxPFY2XhHHB/7UYk5zvriBKO1HYflPEGoWls=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mVv8Bco7wcGmxvCqkmeD9rcd87GVUPWTKM14zu/kCqmHSr4Ej0WhJMUpH0QRYOm2QbGocKnY05uJhKRnWcSpSjr5TCYSt0UIhU7V2IjY7+e6xMkUTzGx6/FQjo02v+H7f/CRauAn3DyNKR1hOeBgfK4gtFYEqZqdSjdpmlDLRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kg4flyau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZUficEH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg4flyau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZUficEH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lJnA1797691
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=; b=kg4flyauA7YvAGA1
	jUkKTAMXw/CPF+ibJ5mBtCM0lCB3T/mgWwK5NzgGMUod8oXD4S/8hR0yKpDAJTP8
	xpgKweJVxIggcCVA4eybqjPQJcOb9rGW9ZITVAFSCvCiRnqzNrVRdR9Cg36x0fII
	AsQI42QBOfQl20qTA852okbLuZxS8Yxa9FqinMVjDi07j9tWzvRd7YGjF1evbqGy
	Bi/O6ZOoz7atiREFHClHWuPdEpi9V4hhFMFikj5VFCfMv7/Y0y1W4CBZh3DQDtpg
	epDN4tO0BcHte9qWpflDYaKTepK2pEe29Jeid8l4xAPZoEgyaU1xO8ozeZSuzFnZ
	MGfWoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8a3nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso95335685a.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145241; x=1792750041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=cZUficEHSTOEaqBtnWYbpplQBEw5S1faBKZ1FRccMXLUrykTtaSReci7+2cUVRcjQ1
         ECmcmcpWZe9kLlGyq+TZvEoDWo2lYARPZ0ATxSkAfZRWC+zKKsL4KX5Xr/nl1I5RXYeb
         mh/joqrvgJWcUYbYPI7MTUACxvG8jdQEAqeMWUotX9cLhMDZKRVHV9DJgvTP6zcjut4B
         OVP33O7HtWMMgw/d5quEaGvy9rj7480DpkyWNAfzu8TwxDAAmep4BY9SB5tGeQusEQVP
         d3Tsu5mYtZ9yQW2iREFXLPsNszO21schIQhsgO/+XwYtO3eWFPUpBbMQLXeU8Yg6hlnH
         4SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145241; x=1792750041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=T0SaFn45FBMU3nDUlBljM3VwHovwjijaW6nL0i5tlCnAWzZ19C6A+3xwKb0WnWz2SZ
         oxb4osAIgbksorQNOzBCd0+u22MTzrJ72WGJue9iBCVjfUmE/2BWf1Q9vmdneRCeFeaz
         cJtcAbfB+AUhoGiVdX9Qa7JcM7hvaOficeWa0AFGMAxLQsgkc5cASaRc2fve2mQrV/vh
         N3PsOrxLyBfSfyE6NL99gYDssfz3E13xcpY1iXKf7lniIMeDQHGdVrbnqTHg/05Nn7a+
         GpnC7naKtb9wet4d3yUtOxtymcSKCEMFUuMTHnL3gg4rRsUWaPXl+RrFectnVCGYPSg8
         0vrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoQUWlBRFcL8iRHaiwZ1SIneQI1dCCxSfJfqCZ9AEmH4G0kg/PdxS0kTkFVHWWFMFGCneUitoT6L/HLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJSQ3wYMQXksE1plr1kHXqD1Q1acDyiYtVw8xgJZHPnVF0FACN
	O6RoqR0Axky3jISsnSyuXQ2xAUvfsAJ22aNjQx+eHlajzr99MzFnbDwvFKae869xKlToDy/x8vh
	3iiSWjp6qUWOUpiFkKbeKhWhjevFGDIIvxwHkCDxHN6Uh3uLsQpQLUJ2/KZOyLTCXGQ==
X-Gm-Gg: AYBFou0pOrsRSmQ5IxNX9IneibDU0GvKY4mNIXTJTI99ZxuM4f0CSbo+17eohu9yBbM
	hMo58bZFcaIZVyz2f1xGDAh5fr79RZ7Ate0iE2KAMkSswWSdLZg+2+Y4LO+jWkZAqq1h94548Io
	XwxXN2BvPlRs6PDqK68ukqHM7h0CMTP049/X9/0d9XaN2Ayd7CfYz2eSEvFMftdgd1me7Y9qKhB
	QOJ4epajAzWhSO2YSm6RvgVsypUC+2JOOWojMIvkQ+qS1ZQsMT9rIk0uurYTETd5lfOVWM80MtV
	qv/wxtaLT60NG2aKN25oJapVQAPPZVjF5pWuh4UUdZzU5Qojd4RgWvxbC7XhRzLO02274kUnJgR
	PBJ4MYwLTwS3VZ50GJuhvXg==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865358485a.6.1792145241440;
        Fri, 16 Oct 2026 03:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865347685a.6.1792145240560;
        Fri, 16 Oct 2026 03:07:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408b4a85b8sm58824166b.0.2026.10.16.03.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:07:19 -0700 (PDT)
Message-ID: <bf35b332-1d7d-4c1f-9347-dcdc3ae5c7f5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX11t5KfLMQhKn
 fQbzzO5bwHDFh1D4upatk6A5MSv1CPEY9O2ddQ/ruAgJX+De6wR0m9Jyzr+AARKw1yfeolW3Eea
 bOw0Lqytj/t7+DEql0CW/Ng6n/zYTTc=
X-Proofpoint-ORIG-GUID: -VAejSKsV54rxw1wnkcK1ucWqN4CEvIb
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1f75a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=UiK73t45R7nl48eyPcwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX8WOSRrU9bxRB
 zcnOiahksn13+TtDjlh+TMQFLBjTvGAc1J8dC3eRxt8C0cw24j6/ii4lJvE7mG5bmVV+VdUJf+B
 w96Eqp5wH129JBPr74eeioCw5mGiwgGXLeGV3FcuWNg1Gtl+xnLrZ3S3HOjYRDGB3FHs4JDpz+8
 JRV6T5pdzmevSe1mksubZTSDYZmAq01YnN3dZ92vxgJhi+vW6+/11u2+uwbaEyG2WN1yCW8s/+p
 xteSsvGgQQe7vfHhnh70UU2yodxHcODDRtLLvFrBQ6N9j4tpYjpStWFONqLY9YXoQVrdTG0ia1F
 M3yeLX+vr3uhiOxO9VJYeDW6rc6FVg6ZPM+pWkvBo0Vqf5Rde2eMo4YZWdO7GWGi6fKWdAKokxY
 UV7Fhq/e2UtAb74vgXKuNzJb1VuttlZk/YsWEKeedB8rTpIXMKvZPaEpmPJ9cknc/ppN4TtuEPJ
 K3AuGXZm6vTL75B7fIw==
X-Proofpoint-GUID: -VAejSKsV54rxw1wnkcK1ucWqN4CEvIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +					q6asm: service@7 {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";

1 a line would be neat

> +						q6asmdai: dais {

Please keep a \n between the last property and the following subnode,
file-wide

otherwise looks good

Konrad
