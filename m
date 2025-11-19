Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7423817E
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566490; cv=none; b=JrM60z/fFq2H7NFU/RE+hUe5BEWiqhYm0clpqAjAQYCBsts1rQejP4AxW+nG/JYJc+PfIiJXXkd/uCRpW+FMKNabRUZ7JBIb/pUekXGqJb+JVhuVNYNanMrHEYzGYGBfq3QQ1XSXOWpPOHdO+vtPMABpCCvhnfnSHDPjtFRtuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566490; c=relaxed/simple;
	bh=ZA/ZeTUIM2+kAUAsRy95dyvkOh0nZ/8CvNhL7DbSK0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGngeV7ctSLvw3PbNDkN3rw1cK64U2qt7Br9ZcA16Xazm0oJvLHc8SxpAUTOlJPkAf7TOwIXCGQzx96DCo2+UCT7BzOCxRnQ9LMeRYNOnKnuTfIVOE+JaS/fc2/z5VKIINbc9eSOjmkIoVZRPXRtOPcDK+8zJNOv7SyQpf5FUWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuz0QIhX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMWLf3TV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuz0QIhX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMWLf3TV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJCCIto1727427
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmZCVZe1ohtN5C12tjTIDovGY+NjnCr4xwpFj3oMxXw=; b=nuz0QIhXqGxvpNfE
	Fd8JgP591GaSpO0D7SsmYv33Sdb5iLUzDaRsD53sWjGdlNW8Oz8u7mjzC8TD5vZH
	9mvTqjTrZ9P1h9JsaoPbpkFwGBcKc04z9P+VceYKLFKBRrHv43S08dK3+1H8JZCy
	Xh9yc+fLQbMLazodOQiV2ARqZu9lukHTa4oWkBcvE/iYPJJZCpdU87gIC0N5kme5
	b4scEWBBkn0180loljSyQWcGBVSkH/yb2p75m2lWlE7A0138F+zDlul/nlTu3V+V
	E4hUDe4m3ZCxHIzJiS8gLmYZ/a9GoLm2FQSUXE446CJAiMzc0lRhcPqImB8OoCSG
	iCt3Ew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr0jxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:34:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b29da49583so280856885a.0
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566487; x=1764171287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmZCVZe1ohtN5C12tjTIDovGY+NjnCr4xwpFj3oMxXw=;
        b=XMWLf3TVr4cSQ+9fS1EASLBAF/urOF5WL7ZA0cScVneFS1VjBT7TW/nw37Jy+O+PPY
         HAH8O+jXbvFGhjesPMFB3Zc1uoDxrd6a+3LHb198Of+jGgDm/SaGWsKMWurbqW3qRKZu
         ihTXhbilt2p5Zy+DN6bKtckjgR/Juitf8lEmEwu9ZiYFWrU6AL6IRuX0NIj6e0ML6oCK
         KzkQxvZckqJLV/VWnkTYQvPsAbkCCQ7XNAtQTD/TTqrFHJqzlgW86CwZfCIJ1WvHNpWf
         Vho+qUBZx2kETP2V3GJxh/AFOAGGCcnDEKTJgDOD4ztD3JQVOGlsp90FlTBY6We1WKKN
         WDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566487; x=1764171287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmZCVZe1ohtN5C12tjTIDovGY+NjnCr4xwpFj3oMxXw=;
        b=jFCvr6+D2F1PWbNHCP+vHi1KoNkuijKzeSu+OJvbc0UwEaEojw8ktxVX2emFOVXlij
         cptLqkeIzp5pjY0Es737BdIQwDqq3jNGYPzLor6IJP1qml2GaNpXpZmoxvTRyZeq3+rX
         Yu01zB74rWBfAc2FlgPGnRbGEIcFFxUMBCfcdLV+a4VMlqcPwlt2uvU4daKOV42e6oVF
         yWP/XpOhkwwd2EAr23XbfywNER7wo7W4iiY5/ulAHBbqFv/9WlxUCgIe4Mi0RO55NY7d
         NpttzOQVcDYFrE2lrzE1jzA+54+See/RYRchfRIXzTr0SK2ic61g/TWEyb3gbuTQPrDt
         D9zA==
X-Forwarded-Encrypted: i=1; AJvYcCXJqZxCcBsxC/Sok9qUTnWChtcxFj43knhDDWJ2lfrkFyshX7RfYR64R+PEfnwrREZsZ+ZeCYUthG3XWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjzSCcHXSTZsacfxMvscFBbqwBPaK4Kgt/mBvTHmEFnC9bKQ2
	Ke1mVlR1QRTC2vR4QkzHspNfUhn8vRdfLL2IIi52rWKsnk7jJeI0HwK/0Cleplj1Lyw926HsrfJ
	zoExmDS1GSfycpzTMy8n5h69xbQ/29vIP4vn5zBfgYi7coD4CzMd8fGirOBo7+1bX/w==
X-Gm-Gg: ASbGncueqFbzPAs84NOWGurTMkkTovqRXCwEB+h1fXW43wuOUxPecYuH8nt1nXbzg7F
	wXsJc/YCrJqRMi9GgHxNKi0IFpQ37d3eI8dTUJB+AT9WXwGL9/GjKCdJeD7tHyanfzVvo1RdOH0
	hIYggyKeIEj0+xxfwVpcGVGhQijNP7EU9H/kOg1vIYGZNPTTmRbjgvdahFsh4r947rZJZZyTCaV
	sZ1gmXIfJpX1eOCWzMcOL9GgRPwcl+KtKwHzUhUjJ6ozoJ1J3+B4b7FlIaK+UfvnHj8qTryE9jx
	6Uqu7L/MVh0vnsYX9SHVTRAl0RKEDuKE6LFLDT4Jya5y64DDgOm7ZuBckSZuUnq8kmY2kxBK7aC
	7/7w8StyanGY85JaLhy5cGC03p1svGxPGvQlP
X-Received: by 2002:a05:620a:4508:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8b317e0aefbmr383464585a.29.1763566486647;
        Wed, 19 Nov 2025 07:34:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI1lUP3Zmhjt4LC4sFPxuMz8I85bzUQMGmK0ZZMBwd/ErPz0ZnJTepoyS1GFbaVxWgmXcKIg==
X-Received: by 2002:a05:620a:4508:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8b317e0aefbmr383459785a.29.1763566486220;
        Wed, 19 Nov 2025 07:34:46 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8b2aeeaf9d9sm1432487485a.16.2025.11.19.07.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:34:45 -0800 (PST)
Message-ID: <e20fc1f3-e5dc-4c06-863d-ca306758cbd8@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:34:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] ASoC: codecs: lpass-wsa-macro: fix path clock
 dependencies
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-4-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-4-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691de397 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=i5KLFzg-Fi_bfIgN7IkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfXw4lf9WkASgGC
 z+j3XFup6+M+7dZky2D9FI97CpWAH+SXBaeMgEVr2HsWRWmrlkxMzmcD+Di0/Oiv6V3RHA0s7w+
 JE0MM7rd8tF+hUNaOOWRvw9dH5EX0698QoCxtW2STNSI027zVC+mad51XKFm5xclZg3T2lVCSE4
 80yLEuE0Fi038RtAibSRXc4ReOUofOwsZ1IM70IFTmf2LmwKFqFVzBBsA2UvZ8Ayn8YfJk8qwGE
 /hHGpRvxZ5GHdoWKUJ7dcgIstNF5pfKB7W5304NliKnXOdPrj135IkwWkYZIaSK0z6IqmscwRKY
 lv54xM615Dm9idzc7pj5NBDIZT4ZXf+irdY3/sJB22Ne9/4R3nt1x1uWZjMDamseFBblZpgzxgM
 9jhKEPS2Jrzc8VX1E0qkuFFW4Q0uuw==
X-Proofpoint-ORIG-GUID: n6VuDXOI9VbNFjSI-1Xen0iQN1scH3Fc
X-Proofpoint-GUID: n6VuDXOI9VbNFjSI-1Xen0iQN1scH3Fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> "WSA_RX0_CLK",etc. are path clocks, but "WSA RX0",etc. are ports, and there
> isn't a correspondence between the ports and paths.
> For example "WSA RX0" port could be used by the "RX1 MIX" path.
> The problem becomes obvious when RX4,etc. ports are added.
> 
> Enabling the path clocks should depend on the path being enabled.
> 
> With this fix, the main path clock will be enabled whenever the path is
> active: previously using the mix ports only would only activate the mix
> path clock and no audio would play.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 06570e474c850..27c8c060cab19 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2496,10 +2496,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
>  	{"WSA RX_MIX0", NULL, "WSA RX_MIX0 MUX"},
>  	{"WSA RX_MIX1", NULL, "WSA RX_MIX1 MUX"},
>  
> -	{"WSA RX0", NULL, "WSA_RX0_CLK"},
> -	{"WSA RX1", NULL, "WSA_RX1_CLK"},
> -	{"WSA RX_MIX0", NULL, "WSA_RX_MIX0_CLK"},
> -	{"WSA RX_MIX1", NULL, "WSA_RX_MIX1_CLK"},
> +	{"WSA_RX INT0 MIX", NULL, "WSA_RX0_CLK"},
> +	{"WSA_RX INT1 MIX", NULL, "WSA_RX1_CLK"},
>  
>  	{"WSA_RX0 INP0", "RX0", "WSA RX0"},
>  	{"WSA_RX0 INP0", "RX1", "WSA RX1"},
> @@ -2529,6 +2527,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
>  	{"WSA_RX0 MIX INP", "RX1", "WSA RX1"},
>  	{"WSA_RX0 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
>  	{"WSA_RX0 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
> +	{"WSA_RX0 MIX INP", NULL, "WSA_RX0_CLK"},
> +	{"WSA_RX0 MIX INP", NULL, "WSA_RX_MIX0_CLK"},
>  	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX0 MIX INP"},
>  
>  	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX INT0 MIX"},
> @@ -2568,6 +2568,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
>  	{"WSA_RX1 MIX INP", "RX1", "WSA RX1"},
>  	{"WSA_RX1 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
>  	{"WSA_RX1 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
> +	{"WSA_RX1 MIX INP", NULL, "WSA_RX1_CLK"},
> +	{"WSA_RX1 MIX INP", NULL, "WSA_RX_MIX1_CLK"},
>  	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX1 MIX INP"},
>  
>  	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX INT1 MIX"},

