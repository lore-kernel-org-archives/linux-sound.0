Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE32E8E05
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039677; cv=none; b=qeTN6s5HTEXsPKSrnj5Z8sLpCjRLCgZSZq7gQsaYtNPrPCSaUjS9lq3DNCtynFB3u39fUedI4xSshNr/2Y9GfdB+gipBxdgi5wghHPBLIEkY6CPIz/aSykJr8dEsNtbw+lofjw21ewSN1wdZ94n4zR+/VHPybhe61MP+/IzKFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039677; c=relaxed/simple;
	bh=S8bnZFwqOefSjfjbTJZ426XN8OOe081rliiCwRtOwVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYe7JM5ZepdeQbNi637oit7gu3NLvP47eFZWEeq4Z6g03JLGqjMeFKCfAGsQZYZwcADLKcpSyySKbw1W+2rpb0g1wXc/RanT0V7PccovzbNVIcZbOcBSIEcpHuqawl9vCCW8zuQiZ2nKFsblbjlwNKnCSSpawyVPsYnE2ivZCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmao1MSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmao1MSX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC1bhC006930
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZr7iAj8/Dq9pOneeMlm+pgyY2ynqbotMAGjlAeCcLw=; b=nmao1MSXUtZjQUoq
	SDTHRsY0Hg3VjpLw/0Ii6jsLVDVb+o6Yohs8y3iHUebXf0FRWOQk/sjhIqZJBEBY
	BSo32OJ3lGaKxUevBvFPf56KEC7/lfJ8pBNAv2D1F7XYnaQcpdiQDhvfhyTtTLUa
	ACryQoaz9l4DhHiiNizuY9qmTnWFmSIdOOZm+Bhwi7pEu78jtRObXxWSPQkzbkr7
	6hLAhByJHsqGgfYv6o4x9hV1eGwsL1pu1qSch+fMTKpYF2mpUw7cbCeVr9XfhuLV
	SdoaqoIPwjllHbjr22wrAx2Oe6drE/2Vv2f0sFHDlO2CaXmEVdGj0lSD6dHuDHmj
	Z8Dviw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60hmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:54:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979e6263so3349685a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 08:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039674; x=1751644474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZr7iAj8/Dq9pOneeMlm+pgyY2ynqbotMAGjlAeCcLw=;
        b=sAk40qFsMaM99bzKwuUiOaXSCSCJAEKklavGE+qAQl08eG/lAIsIJBSEIm+q41hlkT
         bT9q30FYVWdJTEqv/mF1BdLKdro2KDDzxfnKb3cDzi00tVIT/2q33G7vOZlfScqjfNxq
         mS6nseNnuO62hrVDhousEENUI5VHTNPl7p62xJhxaxhjw9fAjX7T9VA7w4ptXV8O+Ezm
         l5TaZrw6+Q0GYVgFbEAkEw0vmVuvd+0Cej9wf7gwzo9Pi82BZcFtWnstQII2rsRKst8l
         /zGvcx5tWazBv3FfSB1p5rk0tim/2IoAAuOmNEIeeIpSCMtEbPyLX8xnarjXOI6xRQOP
         j5BA==
X-Forwarded-Encrypted: i=1; AJvYcCXkuYx0y5S+8+iSebH2m26S+cgfHsHSEKVBxsF6BqYLtfy/w1Diiy1F4DMk0nNw4TuiTe3ElzK84nOnDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7vBHqFSPQzzd++LqmpyFhIMrZh2Pa+5kn62X1xVYAWF7CqLQ
	FUA6GIw+fvibNmNgDQJcToAshXCOpliu0hepFrDlOZ6qN2x3iHh44KfYgqqXD253Cao9M/L5WcN
	6WRXIYn2aa1DKHcOsUJ9hhoDE+aBWXoJ3RPOlXFdbP5kGMgr/DAJiDD0eG3xLneEfLg==
X-Gm-Gg: ASbGnctuaAKz6+9md+BzoOzTg3LMR9rzAosxUOLwPjyIKTeehpoEGijvxOzSi/daPLB
	RgDE/+D2mjwfTcZ0w1BilbqcLLXgmnvN3rETwAZwcbp+UQtPr8CZeW7cdJM6sgcWkmXtl0q1d3R
	U68QGiTWITzss5oYQ9X5Bawrg0QNAw4mge24rrcQtIa9YJ3T4ceyJ45MhJpal99Ppn/vhVGfwMJ
	71hhwo3ADlguiXuuM/jpQ+BI7GGHnLlNTBIpVkSRmGTbDrEbNzJr2b/VMa747FA6MvevTXTwzxj
	8Ywes2XUy+aYio4sE8Hg3CSxZOUc1vc31RIiU60YFMCHsc/n+qReL93sk1WrnwykLfOo8nAsvoL
	9kvw=
X-Received: by 2002:a05:620a:404c:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d4438e31e4mr210380385a.3.1751039673906;
        Fri, 27 Jun 2025 08:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnVBSJATURZomyb5icuOPlYo1v/x1ajNUslEnC5Ai/XTvP7ZKMpfHMiKxOU0P7qaWYMS3lXg==
X-Received: by 2002:a05:620a:404c:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d4438e31e4mr210378085a.3.1751039673452;
        Fri, 27 Jun 2025 08:54:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353639bfcsm147793566b.11.2025.06.27.08.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:54:32 -0700 (PDT)
Message-ID: <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
To: srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UcEr2g_UA_ANu-QjZLNmaMUNwlDYodbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX6YtfPULnACOy
 RePm3kaBzwWqHQ1hU9MmpqklbvUGf8B0uVHoAhTv+Vy1sER0l9Gba8opRZi1PxFNy8f3+hkhrsX
 4fWTEo7vzG86Exbbty6c/SOfSDVabx8nd+qWT/bvVw8V++LtzXYDW7vurRYKRJv2F55WAqcM+SN
 1ckSKhyHCjoI/rX/6+k/FRLOZl8mGc2oUSmnnaTy/2cGKcCFsCoBW6Kd9AKnvHMqDkRTlleNLOr
 V6Ul2ltvKycEdkbx+bC6LRwtJddhw8JaybpQOj/otanbcv/IlBHSxaIRweBxOcIG408ZB/832xd
 YtHkFWwU1XROxECKENHgxAheSERlU8ac3H06ebGD0s6pjMOMCwJNQgqganHngh/KyTlX71qEgxA
 mFPiwm++3BPvzS9M2POAsh+PcpbyejX2LjhSV2tIER/L8MF28eB95EiY4urfjVRHhNSRz83u
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685ebebb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7h2XZbHhf3WDBbgsTHsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UcEr2g_UA_ANu-QjZLNmaMUNwlDYodbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=990 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/bus.c       | 7 +++++++
>  include/linux/soundwire/sdw.h | 8 ++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 39aecd34c641..58306c515ccc 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
>  }
>  EXPORT_SYMBOL(sdw_slave_get_scale_index);
>  
> +int sdw_slave_get_current_bank(struct sdw_slave *sdev)
> +{
> +	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
> +			 sdw_read(sdev, SDW_SCP_CTRL));

sdw_read can fail (miserably)

Konrad
