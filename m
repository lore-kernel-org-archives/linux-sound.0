Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703B243F081
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146077; cv=none; b=oZtKqCd0gxCcsG+uktoi/Wq1Qta+Y85VVTdECTWfvUhJrvUnr0nuPQFdMfMjJ/tFxWjHJe13uqTr406gAr1FI2VCfvfC1sObHsKm6x1n0/Fo5ZJeoxoqLcZs5FA7t9bKyMHoN93FYxur9KQwzeIKuWYjUbn5AD0oz48wnZLN5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146077; c=relaxed/simple;
	bh=/yOLqhnrBxL+q2VE978a9XQLFBicrFACElLsHEaWrwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qOPHLaMXquReAjSsCfv+WV5Nrxx4Qbdly/LlxLiJuIpw3aEBUrRC4AVPYHYGGmeY/PxC/jevp6GCPnE6uW9ovoG/wN66JOyoEZLBEFhAQlUYsyLT0DtzYfZejHzRYyY5LXY0sw/CK2mV/gW5jZnfZ+2lFk2bIHlcHkpxxgCGDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUopq4+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NE/JxNK+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUopq4+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NE/JxNK+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAMIq488643
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=; b=bUopq4+RC8X6BfF9
	x8rfMyP/OOlUubaRa5EPc9niCSuT082/INTj8TW2+sjt4wBzj8l5vC0X4tom5EVC
	33Hmv1hMZ0rWctcqzoMddcCtSRctRmT8cvpM887rNserT3WS3yvhXO0p2ZmCTwvA
	GcAg72PhWOGDobUVdNMKvq4aS0xYzL1XRTwlM79MyIDPYvj/qp6adsSPKG8mobMZ
	CUr9B9kqk/BXxyXqHihFjDzU7ZmAfnL8DkSDvBW/7uUZml5PS8s57rvKc+Z8kt9c
	+eLIj0rGC9MggCaKCHd/aUlZvLHT5Nz4WgDqvy1Bow4ZxJEPjWClqODy6sRTo6/3
	b7g/8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9chy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso17508811cf.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146075; x=1792750875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=NE/JxNK+Zav5ddFgi80l/I0oAQSy0kOmCV6oY6QdHYTPEP4L2JY/+NJ1q8cpFIDM6h
         WKL6dANtn7BFNpeMR/PKhCdjVtSAz2Rdj2YN25RMWZtCAjx865SIWGyEaRx8c/9imCBS
         3s/5Nyc+zkx/ycvlPZ3YRZD7yJk45Zmr1Lt4CFyaIOfSAFVmwKt6ekCzvplXiBvVqiaC
         Zt/pnjy0/rnnIOQuq2Zl58IXVZtitJvcLNx86td9M+Nt1VtYM28s/lNcUWSLe3ZFny40
         vq4eM0XJJ7GH1RsbgVsm7Ru4VAQ1xoCDSk/5T1SOvkHJLTW3P4NoQf+HxTINOU6JjinQ
         sRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146075; x=1792750875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=cfRKYRZ7aVZEmCbI9nkwWdck5gh6lZ/K9dSGy1Cr6h1dRAFi//wE7mj8GVCswTH++F
         30zi08CmTXqO0BMIyLadfCPE36Y0K0BdXmVzUeu9pIPUF64ZF1ciJPtgqz7Mwd0kr5AB
         o32XxZ4SZ6UpsXdR17bPp+ZRNI8xWw2VOram3xI923Dz5BhIK9JpzYK16j/uu6lesZM6
         ug/pxzZ0oJZVHQprioSIOZ/1Mze5H9IzeF9KU39iWJaR7pKO/P1JFzwq+a6QXwarHUWm
         iJGcAtC4rXkH+Jv73fgkKUpMwYAoCsYi7lJgx2vz6AEdNDllz1P/lxiCIjFCW7gu9rFg
         6KUg==
X-Forwarded-Encrypted: i=1; AKwUvBxk7/o1qGpph7YHD0k/PEWNI7y0v7CPZsqPLJbLrvCWzPNH3MBAyAwKV67wVUY7gw5P5earxFvHbzjPhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuqgv+KPfem6wnLkORMaq1Zh22mVLdtmM/P3mrsr7O8fdeOl6W
	hM3QEICaZsv4HO/RJeTke/heqJi5HWdING70upz+YvGi7uj/qwGlLCwm4f5dUqrrINdEcvS39bY
	5gfAqoG3lAxeXkQQiO11zrDIgLlQZKDijjNPzQiKbwLXtrWyqUv/T3HyeearvtJLAPQ==
X-Gm-Gg: AYBFou1MViefGbPdiUjG1AA2tsZGVugAlCclCS/W1ojiutjr/O7SEri9zlxX7CyW8F+
	FCHXN2wSeDnKTziDP48i8tK4tl95ObWSnsGsto4rcWL7SbtRrFADuW+2RrTRs3Qc5J1z3QeiB/y
	cWNX61cB2k48dgIpmTw9c17ufb/dIj5nGWi3nT7V/2iFJ/E56+9iCPynNMbZUaE4BsBWGrgn6y6
	8YoAkGhcZlMerMLE3eNbYgWbpMF2R//zQPbYevihMDxtqHqMNRlvaRbypWEsXEly7vNSQgySdhy
	GgYOvwWadTX8c3/A7SBkT0E8PlsI+q5VDfk95Bn4C2t1YT1HSiCgykW/TDEYLI8ia6FbYulxuzn
	/i/Rg9/bTCozqb9eCzuT34w==
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433981cf.0.1792146074784;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433381cf.0.1792146074105;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm57787066b.54.2026.10.16.03.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:21:13 -0700 (PDT)
Message-ID: <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
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
 <20261003175659.23536-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX7W2KuLzlu7CE
 9FCc0RickzcNhANzsPL2SS9Ck5zXwE6pcGUx9kmSQx5DmaKy/o1ABUVahbvj9Cwje8tMxSzTI/N
 uwfL7HaYgZY97VCi1eEvobzRAugqLNOOp6fPpZ52ZJHJ5itxqwMiDlrlFctvQiP/c4Wsu/7xlW5
 Xq8wCaRMd2qw30B7SO9l3FIFL4hidcPWx+ebnGkOya1TOZ6Y8gWdd/piwGNmU9YlURAr5BpO545
 MV8Onux73ffnhB9myI6YKllbMJjPSs6g1+ECUgJY7LrCrp7b99l3OyoXJe747jSaJhFjMbkMRhf
 bUq+eqa16vg1GFqVg4GxvWrJke9dqiI0fGiuBivbWVOQm88361IcDiMmmpZGYZQVKCXEPnBSPhn
 016wpC47xDCk/xZnKsECDM4XmAoeu9qAS7dLq4rEBCqKQkusjzp3OUFZ2oDp2YWgR18m208DocK
 UNohwRY9MtX0R87cImA==
X-Proofpoint-ORIG-GUID: opJ7bfgKkbOs8NVL4ZiNR_WAcMYXZBZo
X-Proofpoint-GUID: opJ7bfgKkbOs8NVL4ZiNR_WAcMYXZBZo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXysfFv3D8Gr+s
 TPJqEOHIxk2H2pHD+ouoI3SmTFq4B+zi5qcSiBng683zeEuggXb8nvuvMENxtRL+5CeGuhfblbj
 6vkoPHMBifKzLeUcKvP96JOIH3P3cd4=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1fa9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=kdm4YS7hd6rvY0lC6QsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160041

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Add the digital WCD audio codec to the SDM670 device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 038ef0f73ea9..91188acd16b1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -21,6 +21,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -2541,5 +2542,19 @@ data2-pins {
>  				};
>  			};
>  		};
> +
> +		lpass_codec: audio-codec@62ec0000 {
> +			compatible = "qcom,sdm670-wcd-digital-codec",
> +				     "qcom,msm8916-wcd-digital-codec";
> +			reg = <0 0x62ec0000 0 0x400>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "mclk";

This clock configuration is forbidden according to bindings

I'm not expert in audio, but an LLM points me towards
LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE

Konrad
