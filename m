Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB95C32B9AC
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602490; cv=none; b=UWLwwqo1SlMn/WD7XDEdplHxTJktQXGPs4Nk3DEKE3Xml0HNer2Au8QwEHukmd7Z6mW1tV4Ba1+E0NHpgKEa7grHfRJAtQXimi/40hsYqLbIgNqrUF1i7aW9cxDccCbQmmtw176c5eoRdTEvorHHuGqfw4SNNo5vbwDPb2P2TPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602490; c=relaxed/simple;
	bh=/un1GWYR38J5m0YfqLariIcvtUommWVqhXO6TN7FxxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbVp6kGOWpcPl1GiHPFplKBYl7NMTuXHF4js7eqdUSPK5XsE+mHL+urNopbbWm3QJE+uuYtOMDA3ZCNOHDc35Df9HtWh3JPJAD0qtCzJSdZenYiplaWO6lRr0EmhhJY/IJ5WaNpqpZDDFtlAop7l1IcqD72lPyXNu/H8mFKZF8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RL1Nm0xv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBpdsagy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RL1Nm0xv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBpdsagy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18hSnX2428681
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 15:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHIpMxlFxXdyeDYYOIxfgtCVaZNiVVJpcJEl+d0NQNg=; b=RL1Nm0xvpkIyF6U9
	RvmrMzxtDa3cqwUCbmEggA2aoldSygHaoz5kFCjUEb56ZXBqhU7q+l+hWuDbidJI
	batK6bAs0dbxq8xT5l4q5mXDdQLAluRiu+i5cvocqtEY6tq60V44SXPcUWnWNAQw
	fjmyYmcXf7tm82ZQJSGmTDGemEmuiT7HbV8zxEfTbCoMDkRp5aO73KnyYzhYeZZg
	wCR/RGf54gs0JC0LYsCRm2vcCYCa3lgG5OiwlwnExtpA5gyvP2blm3qP8vIy8GRL
	NXfGcEyjxFuAGAVfrVqZq4olgsqBo0WuUwWzcX1uYK7KLQikCMO893e2qSJRhwQx
	O+yHPw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvte5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 15:21:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5e408360d6fso104728137.3
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764602486; x=1765207286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHIpMxlFxXdyeDYYOIxfgtCVaZNiVVJpcJEl+d0NQNg=;
        b=EBpdsagyqrCZWoDVJyo/2A3b/D8T1ErljZYEwFjcCqUjeSjjQCXmIM1tqBtTlhJ3Oe
         TskOxHQTlZ28fTojNLNJpuCiCnA3CULe48AP8fXEG57POTNAY8k9VzPEx74Ng5w1jaim
         YrFHZ4a/CX5wiE/o1KK1Fo7c1qifJK97Jx8NBgcgxs+C0TeMljdEZEWNZt7rYho80UVG
         VBz6ml7DF1fkI4QU039faHlyyom0VU4x/yzLWqqdXLpvqwYm7CsdWofxut6/+ut8v6pt
         Zh5XTzgoYTIq0ZJVybdO2d5N8T9oI8LokB6BK8695xBhgTWcYl+ISXuUcMXNzpPyfY4F
         FSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764602486; x=1765207286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHIpMxlFxXdyeDYYOIxfgtCVaZNiVVJpcJEl+d0NQNg=;
        b=CWEshxmoiNQV3KVMYz3ZNHVpFVnTDlFAdpqf/5KTH2msR5FQ0uUdZWGL7KujrhYvga
         GYZ7g7eWI+D44TS3pqWdJowHl/3LkCMSef+tG2AjFmotwkoaRTp3BJ8Iq5mFjtfqkbVZ
         ZfSv4Y/6eW4MAhWVl+pE5RLfgX9NuhLaTFWbTYxfJsZt1/1B+bgeYAos6ftdGUfp5N18
         EmRDB/I/wk4Ct8rFwcNERuF80wyWinVmLr+rC9Goit2/bdUB3xJnDVoQI7NRaXeJYHm2
         HAvHW/hQmxJtzDaSVl4tQIIR87GOdZxpRg6cwLf39KoApYyKXfu8qlZSCGJDvb70yeKJ
         cqNg==
X-Gm-Message-State: AOJu0YwrUoRd1hzTSL1sNc4Zn7GUiDmiBUBDNqkP5g7iR8qpEnLSp9Wi
	FV1Horw2sQ+rwxXQ8JD2X/PJMMmVmNrzhQUFlWqPLUSMwKex2FhA8Rapv2HPKQGFsLsumLegg0q
	1PsJKMbbO4yqWmSyKRMmKdL3SCFNF0vRfLakNhuu8kHmobxdQINmSsc74g8DRgz52sQ==
X-Gm-Gg: ASbGncuv/6HyYZQYodF+ONnJjQQDTebWthNn5xuMRKV132NObkVCiEKm25DJ46UBR+U
	aIB/lbhbYl+IrYEFzEipsP6nnP0IhBaSlzX6uy1gibdp8VmABAHcCpgF6zxY64F5ozWa0x4Ug6d
	gDroRKFjMwqJc2h9hoNauXcy9ZwsQFJfOU0rETgZzOFGutMbs8jh7X00E+QGUOfYLsAe3bHUnaU
	lB3TUw9/at8lhNVsBl9QPDpoLo4RUc/uebrfUSUSBywxFok/PpYVp2Sf/u/tG8jPp4rwHRMwi6G
	9JVBxOBSdt0asyIgCwYrpR/IfN3U4rgXv4cn3WoTkxCvLAZ2Ip6xB5M0AJ4U48T685d4dws/GvN
	v+jl8NDljwcGVN2UYhppcVzQIMGYiLuCpcPVb
X-Received: by 2002:a05:6102:4a8d:b0:5df:a069:4f79 with SMTP id ada2fe7eead31-5e1de3c5fc4mr15406319137.20.1764602485638;
        Mon, 01 Dec 2025 07:21:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYdKoqR39jhIcjzpbqGOtrD0SRtzK6WkaetfXTHTg0Y97zTm/tj8qKW/Yrqqdenk3ur/hdWQ==
X-Received: by 2002:a05:6102:4a8d:b0:5df:a069:4f79 with SMTP id ada2fe7eead31-5e1de3c5fc4mr15406224137.20.1764602485031;
        Mon, 01 Dec 2025 07:21:25 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-479052ec685sm161530645e9.6.2025.12.01.07.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:21:23 -0800 (PST)
Message-ID: <f029c82f-444e-40c7-a50b-493ce8ae159f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:21:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
 <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o2QXh6JFyfOLpbN4SCS7cIbU9bbsb-1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNSBTYWx0ZWRfX1gIy6p43S9yK
 2v7huaVEVCWFBpUT4Suf5oJ45zxttX1Dt/SdeYS8rLqg0iUxPDffn+uULRAnL5TcdPKiYohCHeW
 GGnfUfuz/cCcdB/ME/wGRsJolKgteuTDFehIowIAQfUvh+/pVVcOC4jKCd9v5a6Q7OJQMycW8PX
 umhchiAYMrQMy+77sZko7NY0rwjslO6xPMYRxG63WUtKQm/nZGQIDhZj4zgBOy+kggchwSVNTuF
 bC3CdUB3Kd82pjtystN10K87XB69XJKyvxKQqePJdix74hZxOHvtFomPUipqUbCTyDpocplvzKP
 j+1vK3cBIje1WdfgFQxlqom1Im2qLmJB8CaBO79mFYzcNDOzUafHaM6GIu4Hao2IeKq4xCbqSOB
 YXPDia5LUDY8Bxek2dxWgEcpSz3nzA==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692db276 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nQmhjgKOiIehJZoTTiUA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: o2QXh6JFyfOLpbN4SCS7cIbU9bbsb-1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010125



On 11/29/25 2:02 PM, Krzysztof Kozlowski wrote:
> Simplify the audioreach_control_load_mix() function by removing its
> unused arguments.

TBH, this is an unnecessary cleanup.

There are 1000+ of such instances in all over the kernel, if we audit this.

Functions will have more arguments than that gets used in the
implementations for various reasons, consistency, future use etc..

I dont see any point in this type of cleanups.


--srini>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/topology.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 5ce6edf3305e..5d138a956ca8 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1203,9 +1203,7 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>  	return 1;
>  }
>  
> -static int audioreach_control_load_mix(struct snd_soc_component *scomp,
> -				       struct snd_ar_control *scontrol,
> -				       struct snd_kcontrol_new *kc,
> +static int audioreach_control_load_mix(struct snd_ar_control *scontrol,
>  				       struct snd_soc_tplg_ctl_hdr *hdr)
>  {
>  	struct snd_soc_tplg_vendor_value_elem *c_elem;
> @@ -1256,7 +1254,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
>  	case SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX:
>  		sm = (struct soc_mixer_control *)kc->private_value;
>  		dobj = &sm->dobj;
> -		ret = audioreach_control_load_mix(scomp, scontrol, kc, hdr);
> +		ret = audioreach_control_load_mix(scontrol, hdr);
>  		break;
>  	case SND_SOC_AR_TPLG_VOL_CTL:
>  		sm = (struct soc_mixer_control *)kc->private_value;
> 

