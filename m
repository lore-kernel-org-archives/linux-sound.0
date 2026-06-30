Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA13672B3
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819580; cv=none; b=acydupO9PGyuu5rLlrLYI0jOphqZupBJ5ZbAtnyKH2lMjw35UZCdWnXXh6Xnhjwl6HFt0MdsQyvgDyGn5GrHqkHyb2j3i3qe/liUI1T2DOO+S7YEUZU/tzJ6SE5GLBSxHAJgq9STDP+apzzMj/R1ttY/J7sJtKqLVfSR71uJGfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819580; c=relaxed/simple;
	bh=dTV3MPnIioxdSrn8J02he+ujmPpSp+0/L58Xubw7F3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2HnSeYNhpfzfrn3qi/FvlrLsD1X0ODQHUuJpws7qs8glY+pl8g/yqlCXP0NT2TZat+iBt2upBWr1uMJUJ0/Vp2Oc1qx9vZvQIXxlv0+Y9rdtkURZGRz4X2UPn6HzAgWUzZQg/zVK0MrvxuhiP66lAWFAaOP0ntZdKS2HbKK5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHFj5iG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2EqDQLV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHFj5iG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2EqDQLV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n0lM1573338
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdbY7oOtbUjem5ySMQM5N8rPfYTeW7okkUfToKfplx0=; b=RHFj5iG0e4+cC7rJ
	qDaSe6mYVEEvAudWxepD9Woe0NkROI3wLfQ5wZI2KCVVS+apPaeQsBNu84FoCfoA
	Ab/FZvygn1hfEgculA3RtOuvugirEv8liX8UrGMO7G9t49oRQmBB7N1VPkE553Dp
	xu7xG00v+YPyhKg18+ZGpPl/F9t53dK1ars0kUkrm9E/QRwHgH/BmcsoFNPOItEb
	Aln3D81u7ElRWghx9nEQN7/Mk/aoa3JRERwqo4AFRqKT/yA5Ugo/RKPHRp7l6sUs
	SV7qqt4IPkXG6wgoCBYBheNrq/Ru2Jgs1TA7Kp7yS8u8VEaAbZegDpOni8jKyGTO
	a6lwJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861ytj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:39:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so5649585a.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 04:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819577; x=1783424377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdbY7oOtbUjem5ySMQM5N8rPfYTeW7okkUfToKfplx0=;
        b=Z2EqDQLVeUCK3xQJSXg3lxYTUQ1s0Wi+lZypmK87d2j1vfUF4phV1rG+a2qS/d/HNz
         2C+VvmOvXOJ6brVaGctkqr7Hi4vC4HqISDaLFHfRlLW5uHy8OUF9KN0YOBTx2BWwhx22
         TQ0rCkG3xbmsoggc+rV1kIoIEK60vzr8Yvbhrek7LbnW0CPd2LPB8hkkSgtqqh39i1fz
         nal7noub1QguEWbmtvdEGJ+luJQcmgjDUsq0b3s11jyE9g9KIu2VOcOGrw5ljjZJbVui
         B1ZdZskYGs5z/tmJ7yXt1JOKYBHjU2OxODf1zX+TeHiqswo6mXCeuR5JH14BnocdDTpf
         36Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819577; x=1783424377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdbY7oOtbUjem5ySMQM5N8rPfYTeW7okkUfToKfplx0=;
        b=SpKSYIJSvwkl8PfEtsLBIWkhIhEH6t5q3FzxjjU7mYrvcsOZC/0k5+JmPCpkCVQASf
         KjDxC/6el8rzga+9Q/66SZgyd3+sJZrnMM7jxxDJ4z2x/77X4llSP1Ep+94xenAEqU/F
         7FLFAo/0a4+2zvLdGW4D+Yk3+PArcVuSEdz8E/MyTeupa0ff+YuhsvA1QfSMbqSMGWUE
         f8kzPhxGbmG2F2wiP2gTHsjh9N5xIw7TQF2OMhTnJ6gUxCGn/+FoNDNbqp0VX7drbM6N
         R0dHcTwwqrRLuEtLqSwdd8UasklFV1Jyu2wxc6VYvNIq4ovVjc3hdD84PS1t10fCJhuj
         NsRg==
X-Gm-Message-State: AOJu0YwsueMOo/YIar/lQAOA6B0HCjTI3I3lvZ6jytpi3ZFKxk4WebzM
	3858Kkn0H+YnNjHkjGNopsgg5VnxFaXbc8DMrxH+Rkg91dYmmtxTmSegBR4/afOiJLaQGWQwVGm
	9a3hvS1cv+Ig6NVFesTmSWPYy5GJahEDNE+4CN89Gow8+VLxarOchpvaTydAkyymadw==
X-Gm-Gg: AfdE7cmYltjV1OgwFqSXewfkorAxOdveRjLFJ9Ciome0ul5JKSPBh5The26FfT4FZ+S
	Fch16YZqc08g7elJEcZkbbobWQZKK85UyyW0REv99H4lz7QcCHW0yffDlKoU806jX+ZcdQd1FFd
	+DmoUBn2FoaQxDw7xMMwPYwBR4r6j0378VkYRpauEQtb7QACSDLDO0VhLWwKvLxRXhsufwnCBO8
	lC6f3Y7QzuUbUY4aSN3bb/H8vB6iV37QwzSWGCy1FdB7A1UevPpxc3BjEsAPqCHgU9FvqfCr1LJ
	Ccuw9L+U4JIS297CdeMEry60e9MZ+fl0sta+N9mnYDZj2zaAX7V/QFghQhajZvdm/RWEM+9gYSY
	dU/Zg8ljWoqbn7CSKV98DAe4+8GKY7YjvYUU=
X-Received: by 2002:ac8:7d84:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c1074ddbfmr27483711cf.4.1782819577373;
        Tue, 30 Jun 2026 04:39:37 -0700 (PDT)
X-Received: by 2002:ac8:7d84:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c1074ddbfmr27483481cf.4.1782819576932;
        Tue, 30 Jun 2026 04:39:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb71sm109324966b.39.2026.06.30.04.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:39:36 -0700 (PDT)
Message-ID: <ba7d8d85-0c9e-48cc-b238-597653115c7e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
 <20260629-xo-sd-codec-v7-b4-v7-2-fb37ce457c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-2-fb37ce457c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wkTpAbYnl2Yn8er4oyyUX-VzCZh4xIMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfXxrLHnxiuNd4o
 CA72I93Zyf5YfnfzG2e2oNQuuyztBIOzuOsWauNLz9P8ChnFpz51FJVvZSeh+My/5UeXWauv+Xo
 tEFJcVzIFDm5l2X9AVFgbRJguhmHhCUg+QWMCPd0OWC+7C9RHngaBrNT2kFXAjuBN4HU4hhVPvr
 LpRpawO+WCt1GQP4FN+JO9U/ROZzmLYnmHum2NW76L54+uOrEl8tT6PGsFMylCGNhvrvMtc+XrQ
 dazwqVqPOVqbrA5tQ6ZHvDSh8tFv1OYPJk9dEIL9iEnWFQLmSs+9lmVO4mMUqwg3tYZe4zwIWJI
 Mag/h70ZDgbA+yEvPlYRHhT6LY4XjGXeQLq2UVPyTkGu5zawXzZsUwtxhCLOZCsgYHIl8aorUIA
 /g8faWtwVd32xHgSA6ZeFatmvBMPz2RkZeRGEu0QYhXhYNFiulkigTx1BdWJzkwy2PSsmttJBSv
 UACrX9aFUp/XHDgFn8A==
X-Proofpoint-GUID: wkTpAbYnl2Yn8er4oyyUX-VzCZh4xIMK
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43aafa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vZmOQDSLvvN2LDkdrM8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfXxJY5A8mzuHDd
 VWR9NxMlljNR4t7VENZU+L8x86nLubDHJa/0tj2/JOuoS1lBP4zJHvM5KLhV7UUbxskJb4KIy22
 nyuKBo43Lci17GvJrnIdoDNxGbbYJ/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300107

On 6/29/26 12:05 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS VA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
> and runtime PM callbacks, and keep runtime PM references around fsgen clock
> gating so PM-clock-managed clocks remain active while fsgen is enabled.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
> introduces PM clock APIs.
> 
> Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
> paths and restore regcache state correctly on resume failure.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +static int va_macro_setup_pm_clocks(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }

https://lore.kernel.org/linux-arm-msm/84167531-b252-425c-bea5-49992a9c4500@oss.qualcomm.com/

Konrad
