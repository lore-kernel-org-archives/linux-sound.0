Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E92ECEB8
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756984104; cv=none; b=s6H8W7G5oVjjXB/Co268k6/zSkzEcqmq9IMk4PHP1oXQKFPSuLpu0/6YMEasnGOO8Meqfp3sm8pkC7eJZcoA/jBL1DTh4kWIUWpsHPMqviqW0fYdAFbnwkx3Xxkjv9Q4SXuN50fwrvg0BA9mwM1Nyd0+XSMa+ARnwHF8uKf4IVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756984104; c=relaxed/simple;
	bh=jIOs/37F5oTBJC+BujtHr3EhnRH+iZeX6ttFp1btZNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTq/COsdqQC46TdY1BNS5RwJy1iQfeIAfIAMLvSpNKxcg1tlLjp5OQ3NYQg/cUP6yKPUYWiEggazmInOPjK11cOWsOBIkXEIX2mg3h51JMfSa64Kfzv9D0LzkbKKtPyUZmt2NuCBD90TGhm8GSK1KuB76saUTvtpqOCd61z+h6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bxgrods4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bxgrods4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7BV032155
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 11:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwWH2saoa/5YgLT/x5Tw7tdz6CHPmMwve8pSGBGAHFI=; b=Bxgrods4qNDtjRI/
	cCFNtm8YQ50hk9EBHdmn4W6at3wcBCij2Bn5pmo0CFeCSfIpx1CjmvOBRho++5Rr
	3986zNCjf4URjDqH7yKEHo8lvnEUpcj71vxymkycvGKI1+ZFhdDXZgeeCAHeh8UN
	UNhSMMnFZkshvBDxXNX9xBf21hl0aDBtjKP6SAv0irD1Az3MAjxhI48k8VF+TFmp
	uQ+N7wquCcY0hzHZlZytqjt1bTt75UKJXpjnNwwjesyNqim88fgMpP9xoGwrHGJw
	KMHg4Rbq4yIKklks5WRsdb4xi9Ii27bPe/mSkdkNSdqLnqFQYZUxPyCwvZkpdGz7
	M2jmJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfctp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 11:08:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b29cdc7417so17035401cf.0
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 04:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984099; x=1757588899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwWH2saoa/5YgLT/x5Tw7tdz6CHPmMwve8pSGBGAHFI=;
        b=XMvAyWzENO9f92wxxzDwdEg2jsbjiBMnhItR8iR+zGpAg8UeKXRLh+2t36NIJSROxk
         Jjsckua9C1gIyFqfIEzcD9ZuaYN5MNskdgq5hfv8zZ1mAAmkslR2ovyqBUsXNXCOBTaW
         pttakkJz/1rqy2x30fmW5uWc/hIYnxFJTIFLkKHaVa6yhVQD7HRMaklxkQ+ODsgyzVGj
         yy0J9zJCBpy2bo9rkmOCwA8xe6c2Loy+n7UsspM48cdOM1MAlR+MrmdwFAFl/FdmxSQZ
         QKZHxO+roZJStUpkO3526vLzat2VbAFdD0Qayw+/m4gZi9IsBDUwGlBKHvPNgsqp90uN
         alGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU23H5tyWjy65okx2yPFnLFUwKNeukCPkzQCMQ+r8KqqM2Px/l7lipGIIOmJvDarn0fhuRmPkFV2l/kog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+lHdYXE3gkjRoUk3evuzbSXjF0HL48zbTYgTrKnXawR0y0VZ
	NLMkYh54ZBZHVLB6Rfu0L/Hy22KwgTTKJM1N2sg3Ocvw67CXuP2uBxffD6JrRxdpEBQluy3uKLo
	IJ7DXv/QdfVQTDVL+WB42kTAIU1jIiy9tVHJx2hS+swHQIlkvnXpiUQY/AJFWIaCNyw==
X-Gm-Gg: ASbGnctFp/kYygXXzWoeTdTRTpKw5+PWtJiCrLsJb6ybS6WIGe61mINR6aGxxbgYSFr
	jiFfnB18Uo+iIlzmpLQcDAmkorQss1/y+HAnZZqPCzvkL6PttmsrqQaSp4rWmkXPunr8EHBKHNd
	fYU1LsYOMb3EAgmS2Y81MjR/wj0Uh7MvfieNAKKri2cGuBs5BWdpvtCHUgB+JDUcfayQzhmAQeG
	VFpJfx8tQA9rYgpqgMd8OH8sokPVsTUK0+3WnD8uHank4WKJhqt3prR54uPnT4H0WqiiyJ6Rev3
	i+jVtd0ThTNCszwgXtmCHmfm0FFUTUCXzXL251anzBiLGav1thOglO+59KT1LSsbCZs=
X-Received: by 2002:a05:622a:4cc:b0:4b1:72a2:5f0f with SMTP id d75a77b69052e-4b31d80cafcmr209909621cf.10.1756984098930;
        Thu, 04 Sep 2025 04:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZFX/6Xa1qjkR68mOBCh2BYBiFO5Yz3J3ngHHygu/wcw314DJPCwNXqh2ciD+XBwYRi3N6eA==
X-Received: by 2002:a05:622a:4cc:b0:4b1:72a2:5f0f with SMTP id d75a77b69052e-4b31d80cafcmr209909211cf.10.1756984098371;
        Thu, 04 Sep 2025 04:08:18 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b72c55c1bsm384312605e9.10.2025.09.04.04.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:08:17 -0700 (PDT)
Message-ID: <e9572405-85eb-4ff6-b854-2fd8a4ebfe43@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 12:08:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer
 dereference if source graph failed
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uoF8VmhYp94QS8cCZYexNrSfW7qJnvpK
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b97323 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tW9EEy9pNj_nyu-JT-IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uoF8VmhYp94QS8cCZYexNrSfW7qJnvpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXxEhQArr+6JpN
 uqcVkUioZ7tdhgv93hqlfRwAqma0m969IM/HgSdmaGlHygm7e1EkEQustxO3O9FYiZVjPTLC0X9
 Id8I9rIfHdM0jtfYZin/hMVL/X0n4JRkw5l2c+md3G8AxQ4STtuJIGC4f0dfwkTkOczvJDt1S+9
 gS6yHOhPLuUYvRSTwS4l5ZyIw5wxVTkmd7mFcx5Pua+NxgP79CTKkVy8urViepZVlA0V+NukV9s
 bvrEoUUSMRIOpiL1Y+faJWkYhio2q8jduo6iQLRRAQJK+e1bllAXhL+Fp+gdKhSGfALtQZ38d6N
 5LuDyMoKqmzlsMeHhiK3AIaFHHSNhQi+EQavLlY9CtLnnUhczjOipis3wCR5gjHwzk0Gw9FbnWY
 vFl/LnPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 9/4/25 11:18 AM, Krzysztof Kozlowski wrote:
> If earlier opening of source graph fails (e.g. ADSP rejects due to
> incorrect audioreach topology), the graph is closed and
> "dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
> graph continues though and next call to q6apm_lpass_dai_prepare()
> receives dai_data->graph[dai->id]=NULL leading to NULL pointer
> exception:
> 
>   qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>   qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
>   Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
>   ...
>   Call trace:
>    q6apm_graph_media_format_pcm+0x48/0x120 (P)
>    q6apm_lpass_dai_prepare+0x110/0x1b4
>    snd_soc_pcm_dai_prepare+0x74/0x108
>    __soc_pcm_prepare+0x44/0x160
>    dpcm_be_dai_prepare+0x124/0x1c0
> 
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Use approach suggested by Srini (you gave me some code, so shall I
>    add Co-developed-by?)
don't worry about it.


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index a0d90462fd6a..20974f10406b 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -213,8 +213,10 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  
>  	return 0;
>  err:
> -	q6apm_graph_close(dai_data->graph[dai->id]);
> -	dai_data->graph[dai->id] = NULL;
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		q6apm_graph_close(dai_data->graph[dai->id]);
> +		dai_data->graph[dai->id] = NULL;
> +	}
>  	return rc;
>  }
>  

