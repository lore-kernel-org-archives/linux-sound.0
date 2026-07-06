Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BCC44210C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332103; cv=none; b=DPAzpMEZcBMYFgh9IHC6dGaGiFC2mK+fzP16drNyoPYPdcb1y29Mke7GApGJorM8g3JtY++QcEnkRwW+SzHkfQze2HXClnh8M960iEhf7awPPjLF+iiO5TdDrsB3VpLgrq+7TdYwk9IgvmRQ1x9VrP1zbVXQKQNvXylF81XtpDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332103; c=relaxed/simple;
	bh=5lvqsLreZgpRiMPvdwViP6yei5AxtDeN2pMz8QSuiKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBdLAg6E2AI3OAmlGpCtOGJeHXlcnjMf/r6oxhNKunt2jjy15X+t9LSiYok7qDFL/F19BYwMezXZ2AA3KDX5ARKZFy5NorRYR3LruGsKRHttwK+XJsZwWonBvhQ8+b3tkOHNSbH7q50L5aGIAwZJEjHsiRaBuJlZc8NRSkBnnEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsRTGlzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5J9LqDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsRTGlzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5J9LqDr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693w5x109133
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 10:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Pn4D1mxk78apQDigyQkSHW199npveIVfCxLkbbVxUg=; b=UsRTGlzEgJ8u+eZg
	nK0eSfsPnpzhjNq6Ctq2lntv9oWXgRmC2EP6fHiSHweSFJnJ9fRy61m88+8bDidq
	AdkgYMfU9O452toObFu9bS7oBGg9h+b41csfpBl9mhhiKZEtAs2NE1Qyls6AheSP
	8OTYu9n0CZVwqx7pJIRaLD8KWNcI2qAlVOsSdiFKOFg2s6k5lxeusyKKunH5Z2fi
	WBPliHbmh5AE4uTBpXISJRgShdaV9ZKq2VpFSHd4VLqxRp1qGEMHN0ewap15z2ls
	itqkNUmKU6CCfEDD7nPMbLeG1FoU0lkEoVyeVs3uzIp8jopnXt9n+7XfSfHIiN48
	8SyaIA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98fkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 10:01:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd6a5aa467so75429e0c.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783332100; x=1783936900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Pn4D1mxk78apQDigyQkSHW199npveIVfCxLkbbVxUg=;
        b=e5J9LqDr/01gthY2p14zgRXxM5n5uIVLMQj3J59k8dM6STKC368AxiiciFgoWEzq9v
         IxDC0J4M5717D2/IfGUGsq2jd85DncBe9ObLAjFKb08UmaGtKSspAP3xiu8NrcM9UugQ
         akOw5XLS3pbVjksSVVnWyOPf/eBUndNMns4TSxHY5Aj8hCSushBES/iPjAUn72+SP/Ls
         LESSLfMtfBd1/fxJ+gDMAGl4nv4VYmHwU2oEXdLa/+q1WqTSh/c7W9LDB7fL2JM63jAo
         Wn+Wza1DAT103J8u3fXROXCqUCDAOeojb0ay08a4iFg0D4pQa9SemvlM+/Dzo6jRQADw
         0Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332100; x=1783936900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Pn4D1mxk78apQDigyQkSHW199npveIVfCxLkbbVxUg=;
        b=saFHZlqUPyYCIYyTYow3qfuniAsa3w7gzRgmX9aN8/7Ts2lnKsfGuENuC2GR2gHygK
         +7pmKlwibYYOZIbJjUWU2vVH/Npr9oVSbaJkwGDP/HbfAEqkV5tY4m9RDHxiBx/LPZBF
         fjD4eZp4n1//zn+KKb5kc+GyZh6QpYXphMJwBei+gv3HBVZA62fb+Q/EYqjBrupC3gtl
         piMshgI1X5+SBIwLiNL1/IcMLP4FRwtY8ZkAlr5MEM1nNk7RuIZm5zDOeWtJv2uBUc8k
         DtzRMwutbSaLN2ywRHLu8k+o1WtKiSj4WXsw9wWxg1YqLogTWpl0Ooayx1799rj0mqKI
         rYfw==
X-Gm-Message-State: AOJu0Ywt3Y5BBC+sPEaTnLrsuYJav10D+XmuUxwl+ZX2pgtS8wu26s/K
	ODFJeSpeL7gdJtI0B+tboRYPW4V+6DV+94M8L97ByclEy9pEAK9al7TIUVU+DA57HsEtw+WYypD
	df2NNF+xJH4oNnjWk952DIrv9AfKqBJ0Bfkk8LsI7d0mwU9AnCmqRNu2bzS6Zmb4Vfw==
X-Gm-Gg: AfdE7ckKIJPwybFjY+w+uYq1APhs0GYQrHXTqhMZj2MzxgN4RLxAE1psiiUSqiywXHF
	Nh2gld85olzUbpNoKlBlv21azXJfvvz02+Umor+hAmXYXZ4DLsGhHDRw9m0PuxX9gnKEA1LlExQ
	+EuwliRsBkBKp4q4AKJPBDiIf0dcDE82TikcS6qostViw496Vh1Tg/UMi/prnqdoxP19qqubPyy
	uFmRNJCtHRESIzguhrUTsLzPVsP9zfXjDsgs1INL8+zl1Cslz+yDKBcxRunYCM4tgLTacuYJpVX
	QF867JhHT6BvaZv5xj9+N/CdSQvy8CGzg0G5lORtj/DiosO0gOIgguwIAgzyRT9nCrrCr/hHdp4
	e+b5y8kLLYPB4hmqW7ga06osfciNs+uaaChM=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1153530137.7.1783332099897;
        Mon, 06 Jul 2026 03:01:39 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1153477137.7.1783332099093;
        Mon, 06 Jul 2026 03:01:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091ba1sm703470066b.17.2026.07.06.03.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:01:38 -0700 (PDT)
Message-ID: <e15976de-bbc6-4a26-a16f-a20961f32bc2@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
References: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
 <20260703-xo-sd-codec-tx-rx-v1-1-a3cf683533d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-xo-sd-codec-tx-rx-v1-1-a3cf683533d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Z0aANgEptLgtwtP7AxXv0Bfxz9WSjZn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwMCBTYWx0ZWRfX10e3tJIdi2kh
 lqLXuhPGvo1hPIPR8Hust6Z7gnTTewNl16So592xppb4BECv38UkDc6CmJnqKP0ao3/asrx/ffl
 yYf44mm/r41CAd8oRnle+ySZIxJ2bPc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwMCBTYWx0ZWRfX7xrC0ZAsClmQ
 ZHbMEw4Zjva1EfXVMSKNb8M75RY9avaX5+i0Ga2j0Hr73r9sSKpb1AOlbdZS7i/xs9db7VFm3Cq
 dFl9Ey7hVAikaBBMmaibVnCZNCZhUQUMtg9o7DfrYwadqmDAJJKRjlSCh7qqf56t0uJgU+/4L44
 lnW6ge2Su1CcIx4R3UmA6Yu+umULl6icZpb4L2a6QPy1KWp3OvsZ5iulZKviTrPQ0bHic03nkVl
 6SktIbu3N8ZA1N8H1BDRLOH2Fi7WZrMispXN9xly5TMIED5w89oxK5FLAipFTmPIhZZDJke8qQK
 d1E/7A+xvZCsEwknsb54yd11exCqpP+cu07PA0jLP+ida5NwoUbDJUH/sHGHIpFTvFZJqIrKL0X
 OHbVbqbZ56o7jgV2/DSUqBvnz1OQO7qtPYsRN+gW8HrtwlzSwVHA3/nLXv4rqaLsoMAVFUhD3bm
 /36ax+5uTDjGpmMLx3g==
X-Proofpoint-GUID: -Z0aANgEptLgtwtP7AxXv0Bfxz9WSjZn
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b7d04 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WtABQFq307eh6Gfc3VgA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060100

On 7/3/26 1:08 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS TX macro codec driver to runtime PM clock management
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
> helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
> from SWR clock enable until disable so autosuspend does not gate clocks
> while SWR is still prepared.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_TX_MACRO since this patch
> introduces PM clock APIs.
> 
> Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
> and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.
> 
> Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

>  	/* set MCLK and NPL rates */
>  	clk_set_rate(tx->mclk, MCLK_FREQ);
> -	clk_set_rate(tx->npl, MCLK_FREQ);
> +	if (tx->npl)
> +		clk_set_rate(tx->npl, MCLK_FREQ);

This is an (unnecessary) unrelated change - clk APIs happily eat
null pointers

If you want to follow up this series with a nice change, the retval
of clk_set_rate() should be checked

Konrad
