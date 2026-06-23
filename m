Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CB34E75A
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211171; cv=none; b=YzfQ2zWhiebcPaPq2KCeJkq5+YMC186hMp2hvLOMu9E422nUoO7TjN3d8LzEixu8UN2pGu5tDosPrPc4B6qAaoLMVxgvsINrXawHvue3JAqxnKv1NFHq4NjvHOUJz0F9aJEXqQs4k/safNHESQyYIfbKCW5P/Y3JESxKpHcBk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211171; c=relaxed/simple;
	bh=/NUOjGpR06LiuYNhocWRui2/SejORkKPZY7b0Bmr/4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWHv0I2HQ/H6nU8lciSnJnolr3bxcy2HKBv/ZH1fuB0kJMBCt1FLshJmp3DhVXvLK6ejO86fzRTmGirh7kylgkkJNhQULeooesnNZcjNS/Zohz+5G6Nv1Quw4fUvQ87zfg0S0zl2asQ91b/axYwC7qS0KzGwPvqczk0j93FKqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB00+i4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFAIIawF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dB00+i4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFAIIawF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA3Iwg952949
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AnmVE/w9h5hL5i/LojsNUjrWiTJ2fNVG/BGWsEwtbE=; b=dB00+i4GDiRjbw/a
	7UAckYbnj/lhAE5lfGRGiDglwdb8dBk6QfRyNfOKfS47YhzR+xny9mk5GhEy2ROa
	0v3Swl1PPeBA5Q5wpi9Kbi+HkZ/EQWI219fPo8f5EwU+XuN6EXld+xbQjOtYcyQu
	zZ0Cjj5HK1wH7lANlPSHS7pLQk7jjOumesCr1HMeCUbT15KsGdljCTA2E4mUMGG6
	mtpV5nDBPnX4wnrDBkrHWez8/Z36awBL3gTCI4BavjrsQczZGeE+pSKl6bEtSvwZ
	z1AMlD9UggvJWd4/5Jr8VkTKw5oILrBEV//OH6b4tzuOt4hWRvQRL1yvnbk4lQwc
	x7nzeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r4vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:39:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-920f826bcb4so58668785a.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782211168; x=1782815968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AnmVE/w9h5hL5i/LojsNUjrWiTJ2fNVG/BGWsEwtbE=;
        b=UFAIIawFAhI9wJvsZPDSEPyms+Ctvl8xMlwPjH0fosyVMhZVfLOe6wPdWvldTCb3iS
         gyVZqWCUlsbu5R0GKz+CmmJYXAAJt5Rr9jkJjk/C7DWtpN0MkIlaj2c/tUyYuHj0MfQB
         +SbEUvF7NBYtIpkrxo2Inj5IxlXeqtK8WxQ/ZRlN3z3ot5DlsSvx2hiKh4h9G4EBhOcw
         10D+BQvK5DBo0PycPz9Woztz29T2Iz3OVmdhoxe95G+p/UzahCHeNhbTqUxNoCTpNbfv
         qKlg1HZDGbTA9JhkIH9dubR2baxNHk4CKBqKfLDXXT4g0kktS5CFB9doA9BhMs0bGWBA
         XPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211168; x=1782815968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AnmVE/w9h5hL5i/LojsNUjrWiTJ2fNVG/BGWsEwtbE=;
        b=WUIv953DVzIRO0coS5UTzcAQfugsAIJuKoPDK+EwPi6zNH568ehIhQMGU7jxqawz0T
         ZQ/fhLzufk/A7stOseduPP+A8uUK+e600uhr5K5Q9nr9vU74p8XPitqLpN8BG5MyKv8R
         ri8yEklEab28AIoxlTeQwWLhKEOrJfY/SOub9TmF5GS9/NbAv7hyZgU/CgNaNr+GK126
         t3kaEx7osqJWcOqKZF58YroGuKpumYMsOMDb+1+gCbZlVjTtuGa6HNu/euWOOjWvVIip
         rZRSrpMNPGiXcEi+O1DTxn3A5XliqGW/MrVwaHi9TEw+dm956pVEcWja/yPHwCNtXsRn
         sYJg==
X-Gm-Message-State: AOJu0YwYfj/cjFrvI1e+2E8EeLZ/ZmAQ8YffKH1K/ISmzAhmOdKPcEyU
	x2Gq/Mu1LfhVyucegd3Gdi5SDBcK2ytGAKmeXjCPEyZarhgY6Y0gE283JLNisuRS2Ma5LX3m9Tg
	Gq1ihW7LfIJNfG979J5O+RiDTOSuVG/KXx433ThWH1BWThoH2x6KhVi0hzWajJo2dkpOddk+DZw
	==
X-Gm-Gg: AfdE7ck9ZsgnlmmWsAJql5D/WDZQB6bmi5dzYKxZSe/zVDCPLpG3kSwuDuzfkSS66Dz
	IgfccAaWom+ZtBdEaPZEKB3XYrn+/RsVGHlgmiw5prBe95iCml8Tbx0iVJ9Q35PULLXxIrUJwfg
	1lZ1gj0bBTtm+qhP0wX9895gkbmNiRL3ULVRQH0NxITpBOSXNk8YC+jr4DjuJkX4SfquaDqRD23
	YISik+ydVvDKf35mUtiNMQ9AV81tNT/J5pDRd8hTZA1+2EHtlrZ1zyRI5A1E2d/zIN4D+LCawFN
	oDxXYNzPTA234iOn93wQTEy4L5bM04mTxE9ZsIzf2zVGYgGKm/RcKpEO/dI1AKuY3Q6G/HCb8Mr
	8eZg30Y7yD3IHoYfeDcmMiQfSD1ADtn6QcNU=
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr505047985a.0.1782211168553;
        Tue, 23 Jun 2026 03:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr505045885a.0.1782211168118;
        Tue, 23 Jun 2026 03:39:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm4759720a12.3.2026.06.23.03.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:39:26 -0700 (PDT)
Message-ID: <89c4fb14-9884-44a0-8921-fc361a9303f9@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:39:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX5nSBRqKeKeD5
 1l4lqb44hR/eegIP3DfRuaducMamS6wQliyebyI0i7kcIVqafp42J3/sa16yMXaoejwdXxyL8mB
 nWMFJHWijFi3svlhq/OoPWhU6ppix9A=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a6261 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vZmOQDSLvvN2LDkdrM8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5Pf8p_baSAOVyCyZ_eyc0cWm524m3jDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfXzZAkaz3Xxb84
 7TxPvP8yYCEwA+8Wo6fEe2fo50yx/nGp09hFPxuC6c4lLGOMCvRp7DzE+JammMVmvVd8jH6bNOd
 rEZ96atSnAANr6Ddx1RfFStGmbMu0MGqbE8rGEthvHOiErdc8GUgaYRZxG9+B0eLR5sRtIQRYNR
 M7mQDW187RpN6LCJNDAkX4Ts/pftCTg04Vd1ewmLi8rs12+Y/qUD53RcfItH9K+wXuXqMxEtOy5
 i5BoR9yJBJA4wOypb7xH42IbitOYf3gfOlb2O+Csc03s4Aa3PUCy22PC/iKvsesu7pAAhl7tBtJ
 TR4mHXsl+egLO7JI3JiWv0IPdt4YmYRj7a/I/CHAWspVeCLEgwsH8w+BMi4bVEbhbWrjRJfylDv
 MD5s1bjAEXutLydivRVAh1PnD7krslyAQQhY5wRB/wH7pdaKTABKen7m0uQIUwA2b8OrBo/U8of
 6cVJoLCnAK0tO1QyC4Q==
X-Proofpoint-ORIG-GUID: 5Pf8p_baSAOVyCyZ_eyc0cWm524m3jDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230086

On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
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
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_clock.h>

includes should be sorted

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

Can't these 2 calls simply be part of .probe()?

Konrad
