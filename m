Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684759;
	b=nQZ4O9ErpaYp0KEixalbVO7OdLKp2YG1i4cwV7SHVB3WN2LSoVQYbwZdnT1ux16/YxW9
	 mjzR5WwwAKqGwntKGfsz2VVKIpNyIhAgNs1Mz8uVv2b9wUfnN9YrC3XhQ5LEcKUSMdUgc
	 q03BepXS8iuLc8hYpW0OsEZy2mkPXNFW9zlripSa0/AX+NKl1eN3Hko/VgbmZQeQe8eIt
	 AMTusQvyM9uJIKdAmYXMi7njO9d0z1xG9uuosnCigbdtOKobUy8livkuSBmEuSGUmD6lx
	 6UNlyN7XoMByUtjCFb4R9KB4xK2rSP64bFEK6xa+/3lmX0i0EEx476/dWoxMtKTCEdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:Cc:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y9ww+q46SmGijNngeNYuprjet31vLWNk03NBcgCh3TU=;
	b=AXhm+6eEgAWFz7q/tyOmlNiBhoInyTmYhoRKtaFPMSK7161E69Nq8w3MQcSaHsP4gR1V
	 JhogTWI4uip0rlOeYPwAL5HUdUyhC6yu1tnQMkf1sPtcI4N18RXmz/7Ve+r75yf+kZygV
	 wrwWqVE7DfTP6KbI+Aoaz0DeYPNzfL+D23kItds6ksIRkPb3c2XYT6AqwKV5YLKCBj6Z4
	 dRTPOaC/8VZtscZ1u2b5LKV7AA59GUuBITtjZnA6OsHDO04yMEFN6HM7brfhaoo3tEYKf
	 e/Duh/bvZa20syXZZAxhmYncPrzLsEaw8NMPR7IMycN4alv7FMiXHxSlu9So8UXNnEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kag2rjcs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nb0VbD3y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17988606A31E
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 15:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17988606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kag2rjcs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nb0VbD3y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFUDG4098319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 15:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9ww+q46SmGijNngeNYuprjet31vLWNk03NBcgCh3TU=; b=kag2rjcs5raDsDAG
	iZaywZ7qoHLHdBt03guqldZjqoMmqXriR8zNIL7ZvyFHThv/nCa6B8tPUicdi0b6
	fUdVUFpoHLiOp4c+zYRisfeEhIJPpYhu7BX4n/hLRRij5kx6T9nj1dq8tZse+yi+
	hlGSRa5mCtX4xOF7Pr+TeFXrGWCPKDCVvaP/sbq4L0FzCbdc/6pQYOl+pwHOF2UA
	A39wXxG7D3Jhq7ENxOeQYZL7x+eOR9xrp5oxvxqpcwdQgAZUAQAw3L8ZdyKdf8B1
	BTIKSvkTyX429FS2+9dFBwNGla8Bc2kvFuYow42kW4QTz+mA5pvjz/lcGCVHGkdw
	RgneIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq3ddt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 15:59:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso5599939eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792684757; x=1793289557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9ww+q46SmGijNngeNYuprjet31vLWNk03NBcgCh3TU=;
        b=Nb0VbD3ywI4mRaWJvFW9hSi5V5plavx7LmbF6M/uUNTqMTsyBOYomcuLrD3C21PDeK
         KBFTa1LzbFGu94uIRt1QW3y5OZDwq9L9aNWqaXndxkpE9f//Kek//JDitVuNsznGEKcw
         2ZvRt6L4qvZOOuz2gL/3Eg0Z35UIGaed/zgZJ4a5H/U4g5548JBGGi9o3e4L6CbNx/w3
         cPoJhpls/D4Y7fSqFefDmdJRKcZpxvGFcwyIv2QoQEK5yTxPFgZCFPU2fgMEiPVyXox0
         WOnUaNq1L4NpptXsEP9sD6stPiB35NTNFuv1zQJtrKyDhsfbvLah42dWu9xAfbFEy523
         YgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684757; x=1793289557;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9ww+q46SmGijNngeNYuprjet31vLWNk03NBcgCh3TU=;
        b=lHfqhTW2RURANugXIeilOgz4YNmFTGHh91SIOugCNPRFUmaLKFRqzDbGNdAbzizQig
         wgPfCD95vb0YfRGE5U3ihAsX2GQFrWS6okqi66N5T2N0iIlKEASip3gbLSp3B4Of9jED
         GLRK/gcri589iSDhVmdT1u1JmKNMFV8hpkujGf7xVdciZbE3YSt2sJo2VZng94wE1h/F
         RVhYPn6TVRW6IrzL6kAMz1+6GhlC2wNsK4dSHghpYEFQTF4LCIliTFRjC5wdn7MztRmw
         i5g93mRCc14clmKOph1qpFlcoH2wEhbmACvPwTdsSetOwh08I+JzSuxIGiu8+e+azP+3
         ISIQ==
X-Gm-Message-State: AFq9FYLRW22WIA5xP4RhUq1A1vabSG2OREvJrRgAzXq3nuv0zbBWpWht
	Ustmaq1EKjum9cKMncLfW/riuJUzJlw7mOn8sQjIGVD4/HlKrFPKjY1NWzhZLYYwjSUEttqcOSe
	TDvT40ifnZfYvs5TvQhLakZrqmVw/RMXne7va/ucoxDj7dNqXlvCQP6k/RdqsSXHGf7YbKpCQ8w
	==
X-Gm-Gg: AYBFou1/PEcoPf7B+7AnI5g+Q0Wad7bz/Bug9upssxvO3GhnWVDAMarFmKzWrnH2pLI
	zv6kNOr6fNyJhWP9+No/ahYlfFTcjnSHoPaGHzUp10wxnDoacy8CKS9xumUpguQ2LUfhC55TVl3
	g3fT2cMKExDwujNC8CdW6YYidKdwtLmYnKasny/ZVh6ze9845bYqLbbqMCNtVXjmKSq++Qth1YE
	cuKdgDhelvcQxy/vZNbKDw71T/wrlRXfYx9q8rxhD0ehSEcSbhDznP3UB8XD/XKKOqWxUuaFWbC
	6hkA9qrMQyku9Xi38xAMiTHHaTnMrDlI5jxBcVjnZ7RjI2kMWsiy2M3jOrxdECKVccMUO0RQy02
	Igt21e4Eyn6kVppx8qn8kjoGF7w==
X-Received: by 2002:a05:693c:80cb:b0:366:ae22:a565 with SMTP id 5a478bee46e88-3674e450e83mr6642605eec.9.1792684756872;
        Thu, 22 Oct 2026 08:59:16 -0700 (PDT)
X-Received: by 2002:a05:693c:80cb:b0:366:ae22:a565 with SMTP id 5a478bee46e88-3674e450e83mr6642546eec.9.1792684755551;
        Thu, 22 Oct 2026 08:59:15 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca323effsm8076073eec.7.2026.10.22.08.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:59:15 -0700 (PDT)
Message-ID: <211e5b96-9019-400f-aa36-23a11a22c755@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:29:11 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: linux-sound@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Language: en-US
Cc: ajay.nandam@oss.qualcomm.com
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XynIyqlpW2R7sslN7oMQMa9S9aymfes-
X-Proofpoint-ORIG-GUID: XynIyqlpW2R7sslN7oMQMa9S9aymfes-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2MyBTYWx0ZWRfXxTrRGv46pO2v
 rSDE5PtyGKc4gqKXj2Tj4ycHp/DPxwrAMu+5qMkGOFIBs71vAAOA5cC+N/mP/r7B+A58u1cXhZ7
 h3XlLsC8Zzgssb6wHFuuX3XAYHHRAQc=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada32d5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MJkQKHiE2xuUxaYsjeUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2MyBTYWx0ZWRfX4q+g8OufmIYa
 73ZzYu83MckaJBSMV24zwXGk6gl9T33fS0Osdbq0vPHVQqd6c5NR6KCkERCCHRrBZ+qJn5ACE63
 CZMcgNsJmr3GD4V6L0PBCmgzGLSd3Ry5reCK4ICTKo1jST2tIlZtdlZUhOVvLdwkw6YuixwZzgJ
 YeE/tI4V9jNF/qKftAyZXNaUFDib2zhL7goKT1cZsVE0nNHA6DPa6SDPEYjqzd16X0vA9rf0SA0
 +NC/pBaYqRMjbi94xIZ8ztpKUqcGeOy6EPYmsCe5FW7fbPKnOsKFWdva0H7WE8fs4syPMAQuWAN
 cH++fmfrB1++VVMcSsh0U1YftjnVvjKrbsUaR6gUHP5Gfl1Rx4TCE9RkkrSm2zEjfhUM9AstE6m
 /BwsjLYI7otiWppF0EVJvSiO6JaL8mqUYS+YNhjo2jHhp1Jm4UsWoh3SKXzFxJFHjo5oCrDGItn
 k93pk6ZUhB/HoXHKfbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220063



On 10/22/2026 3:13 PM, Karthik S wrote:
> The be_hw_params_fixup callback unconditionally forced S16_LE format for
> all backend DAIs. MI2S and DisplayPort DAIs need to negotiate format
> freely to support higher bit depths, so skip the format mask for those
> DAI IDs and only apply the S16_LE default for the remaining backends.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 6910b992d81c..9860a68e2add 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -240,7 +240,16 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>   
>   	rate->min = rate->max = 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> +	case DISPLAY_PORT_RX_0:
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		break;
> +	default:
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> +		break;
> +	}

This exempts PRIMARY..QUINARY MI2S and DP from the S16_LE fixup, but
sc8280xp_snd_hw_params() also handles SENARY_MI2S, LPI_MI2S and 
AIF_MI2S in the same MI2S path.

Is the format negotiation intentionally limited to this subset? If the
issue is that MI2S BEs should inherit S32_LE from the FE, should the
other MI2S ranges be kept in sync here as well?

Thanks
Ajay Kumar Nandam


>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {

