Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC17448B98
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789920356; cv=none; b=F9j+2KCxyDto8wYU88DwWdNWfr3++oIzIJjloPF0UhuBbX0oSCPl2ET0j/AyLpfr8sQFMat+SiZkeSrbse2e4J3vFqnj+KR2kRmvJXKt1DXikkBqMOLAEcjibS8JQnGNd+Dke3DhCsR4jgs/SLU23zJzyFbWnHOeU1AIPSdAsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789920356; c=relaxed/simple;
	bh=Wh8aznI4Dsx8AG0YXGKVP+EvgBxQIagdEPQpu07m+Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miTe2/Z4uYwPtMYSt4hnsWg4NYHnCi+LgLga+FGHzoZ3kvIhxv8TrvvE7JSTjeFmnUV0+GFCyoLtRFfyqyjjBs9pF0w5cB3Fm4BWYJb6/+/MtMaPyL4RwgQuZEshj+bcmkNrJoOtp2Rptk0FHh2yOlT128d3CNevT6+QZIdnXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKDXYOhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvMmHrpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKDXYOhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvMmHrpD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KFAuCF2974271
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 16:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcnopI3chkUGfHerpPXXgF7ag3G5/WkTywshltXvcmk=; b=RKDXYOhNnzQJcFml
	trdYN5zY7W5EdxJODIg2AQyftug2qyMbabEvwVeiFl/rDhKQC0Mh8fAQVPTrzxdU
	Vf/A8tfPMNHPaQZmXcE8FtviLTcAtb+n/ehIBcsa3fH7CVwyzw8yPulyBwAqYu/9
	QC5M5ctxDGILYNF1ULmOS4lspEC7UknrWn5zdA8rcabXvgGyEXnqONpeT/9M3XKl
	4o582KxhwwwMZu5k5cz2wFTTatJTvBFfAUduaY13yeTcAfHs2YGE1TwiyetqF+eH
	CBV+SjkC2fG/PWuwFBO+OK80Yw+GwDzHcZL4rcDa/N54+6PL31JhjjsbmGUpivdv
	EUIwZg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfukaew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 16:05:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7915a83539fso2118467137.1
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789920351; x=1790525151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcnopI3chkUGfHerpPXXgF7ag3G5/WkTywshltXvcmk=;
        b=AvMmHrpD2E2HXcSBaoL25pZHq8eK6yTRrg5Btflfx5ytNzy8XuEBNPIN9HF2wP2107
         0Ep0MKp0LvrqY2s2JJ80yLCKiXeNJTLLs8t6qtaldcI5kts/mXKjBGGFvm7rLgMlJNdJ
         IbTibo5dimHx6UcygxP+s9u83WJPEuAPNwkCQ/JHxqDyyEk8r+RLZ/ihQAd3jr1ouaJC
         bzVhnBLKykNL6hYXqfGsdClFog0UND4sea7BeTRVNBgOCGovsxOVvk749C6HLZripv0H
         3VQkgybXJbac6Qanp/f6Fn782GnDItrLoEu1U/+0qpOC7D/x/bTcSTcO68nmXTmgloh4
         D1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789920351; x=1790525151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcnopI3chkUGfHerpPXXgF7ag3G5/WkTywshltXvcmk=;
        b=swdmqplr/uc0kmhqz+oAJ/M+ofWCVla5KQybLY13FmG8iZpOtoxwhY/K86+VUJlaas
         v7S2tUmyOQtVnEwRzZnmU0IP+SMosOZ9F1emGkLsYMMbAioQAgOC5F2to/tpsWQdJeEX
         QEs7Dgp/5lgQrzZXCM7uFokpxM1mpzALroC8/pBP52vnY08XMh52YU64KYYMkk+TDcqI
         1mXVAE15H1JZFwLIgp9sHg3Nga/NtwCQchHREr4LLPWJy8adedAqd9byuunwmKPEd0E+
         0+MtZ3HbuucQa4CHOVs9oKmNZL272nDKEoQDY7SK4EQKew57l/ua0w6fzeQ6n43hVup6
         1VMA==
X-Forwarded-Encrypted: i=1; AKwUvBy5iJOmdnZ7F22gaHsJvItpFyVpXPZVIKo1NvIqj3LXmVPirB1WEkl+VDFM9rG0UOiTbrbn4PG8HlGYBA==@vger.kernel.org
X-Gm-Message-State: AFuF++kgZwMhYhmDgBhMwi5IEb621RHnzeKovXVi5Y+GxBxPLmqQHflu
	fddBRP34q4DG62YSiZ5QAzmhjFm6K19f6BoRdUedQNxXuYzEpGSV+DWV9HWWueceKCXRDHIXzbp
	5DL1SHWHA5ENAe8NnRktpJ3zhns+vlx42OhkdQiqbP6y8g8/A3fbGLeXMZLzpMaK4Dg==
X-Gm-Gg: AYBFou3iBMg7xb5BAaFwfg+cxpipTBxXhdiW7q0XepvU/Uxn4krmd6PDYQXE1zXl9qz
	Nh1TnKSX6bmaRXl95av1+rjN6t2fZQMCtDxSQNcrMpSLB8JEWNa5OQruntqbk5bPxn0d1rpoFbA
	nxb9gILhzxsAs1VeSyU09EXdtadbV4b49RKygWQ+99qt8Wk16drpy5l1ezhFv2mQ1qgaGmczCoS
	yqnSlqY5Q5NTbW27kU9myfB3NzyzHjYQFYTGHihZZ9HeAtnAfEFxpNVbD5+uWrXzJg4rPKvmffL
	skLhebARz3MW8V9fmk+S3XMREuZqxRZGb9Sz83HUum8gAgwl5YPkkUQ/YamVoY7MOQZkt7lAp7B
	ESAdS+LT+2wQX0E7EntInnDM+F3pxgQ/ddJSUkWd1VMVf
X-Received: by 2002:a05:6102:3f06:b0:7a2:1f78:c6fc with SMTP id ada2fe7eead31-7a55c88b9f5mr3955589137.14.1789920351337;
        Sun, 20 Sep 2026 09:05:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:7a2:1f78:c6fc with SMTP id ada2fe7eead31-7a55c88b9f5mr3955558137.14.1789920350939;
        Sun, 20 Sep 2026 09:05:50 -0700 (PDT)
Received: from [172.20.10.5] (82-132-212-44.dab.02.net. [82.132.212.44])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7e05sm168445545e9.4.2026.09.20.09.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 09:05:50 -0700 (PDT)
Message-ID: <393a1343-cef7-4fe2-8236-8946185bb394@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:05:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: use DAI table index for playback
 constraints
To: Zimeng Li <me@lizi.moe>, srini@kernel.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260920145848.44521-1-me@lizi.moe>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260920145848.44521-1-me@lizi.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIzNSBTYWx0ZWRfX060H/5kIQDNz
 VBct81g4m+4eSvYt6UtuoliWNILGTGLy+jniTNFC5YQwyHw5LuJRaKdWYMrAGoekZIPzKBWNlfl
 E3YF3XV1ycbHsAgJWX/wdqi0kQRvwlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIzNSBTYWx0ZWRfXy/qXtiCW3zYa
 U6/+53vQWmvbaWK5D9EEkBQre+qXxFCh9Qv85T8qDsMj6TVI27nlT59Ph4n7+hy3JGt0f8ragnh
 zGjmSc7GFoAwIL/SOIQgWPjaBkujPMFfXijWvVvuRU4FK9gde15CxJszk46poo15Ciat7FQBAAl
 UXUF1f7ILWiRflfouGD5qaRN8whWiMJ7ToOyWlW4dHWa60BR86frhv8bHwYwIWFSpZc1HOM7C9s
 Jw0vq9LiN85gHems3q84XxLSrUmW3GLCPdQT2dR3AfNu6RVhc7XbpWLE1qG3F8KiFkGCQO01wYd
 fnkWyuy5XkB82sAfnwIriWubCqKR8u+XUt0uLFjFPVMuYW36Eqf+M/aihVXHVyjN/MLaS5RUufd
 TmHY1ZzXQ2VLgavMLGN41tgF+IaaFak3B+EVFOWtso9pKb27HibUu7aWy12EW6/3tTl1k+JxMeh
 vhs+23AmVnqE2oUTX+Q==
X-Proofpoint-ORIG-GUID: UKNLasgyfSM0tPP8_vKsOi7_Ry-r-7ek
X-Proofpoint-GUID: UKNLasgyfSM0tPP8_vKsOi7_Ry-r-7ek
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6ab00460 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=HvmqtmfFEEonl7hC97T9LA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iDUYOmZZWeky2fLdnAoA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200235



On 9/20/26 3:58 PM, Zimeng Li wrote:
> The DAI ID is a hardware port ID and is not necessarily the index of
> the corresponding entry in variant->dai_driver.
> 
> When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
> currently uses dai_id to index variant->dai_driver. This is incorrect
> for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
> DAI has ID 4 while it is the only entry in the DAI driver table, so
> the current code accesses dai_driver[4] instead of the DAI being
> processed.

This looks like a bug, however the code has been written in assumption
that the dai_drive.

That also raises the question that was this patch actually tested on any
hardware?

> 
> Use the loop index i when updating the current DAI's playback channel
> constraints, while retaining dai_id for indexing the hardware-port
> specific playback SD-line mode array.
> 
> This fixes the incorrect DAI table access for platforms where the DAI
> ID does not match its position in the driver table.
> 
> Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")

Cc Stable ?

> Signed-off-by: Zimeng Li <me@lizi.moe>
> Assisted-by: LLM
Can you please add the actual model name as others do.

> ---
> Compile-tested with LLVM for ARM using multi_v7_defconfig with
> CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
> lpass-platform.o targets built successfully. Not hardware-tested;
> the IPQ806x example is based on static analysis, not a reproduced crash.
> 
>  sound/soc/qcom/lpass-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da..079177a6d 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  		}
>  		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
>  			LPAIF_I2SCTL_MODE_QUAD01) {
> -			variant->dai_driver[dai_id].playback.channels_min = 4;
> -			variant->dai_driver[dai_id].playback.channels_max = 4;
> +			variant->dai_driver[i].playback.channels_min = 4;
> +			variant->dai_driver[i].playback.channels_max = 4;
>  		}
>  	}
>  
> 
> base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4

