Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A35347CC94
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984949; cv=none; b=LIlszxwZbyzLMcwvyIsAooTY8wsY673C7gWVuWRyZEXnj23o9w/ZWOq7UQJcE54/t8CPdoPNBtmktqig4dMo7wqrq85B8FoW50gfdtgODYWa39EfNrdHf9IX62lAJQWFdOLOVfsAtTRrjOpORTVtQ0mChNoBikHRK/d8q2U21sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984949; c=relaxed/simple;
	bh=/v4JVXn/IGpTDr/E+vAvp0q3qjBU/OGcsAmTaUF6dCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3FwsWYN7MCIQRAxru8vS2ayHSN28kkbDBNClY7gGWxoqA9ctUUbPG4q1A6xXeWteF6+uxqI2ktcmPcmFSMz6oI9idh848qQu9a1zL1erg9t9niz5dbUn8vD6aYwS5naDtcKSalDhQkiaWLNaOiecTjcl9gLZ0fqUv4MWoD+83Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHubG9ux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUaXxreg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHubG9ux";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUaXxreg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629Kn904116734
	for <linux-sound@vger.kernel.org>; Thu, 2 Jul 2026 09:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	idJQTFK2fsEmc4tj5NC6v5WdJKyxotJtoQ/VbxlsE5g=; b=BHubG9ux026L/t7N
	eMTXYU8reyfXtGDgtnRlmK3LsWLjP3Lw/LkKK+bsjKIt/H/gFrDio24JAACKDrDK
	VxIL2R86c6/msMrKP5iaBoowj9GTqFGsT7CFqG9gFudHV8R/xV5+leSflgNOObo4
	Y9jGrHoHu8OABJm3SUjNGg4J5Yw0wUj3fjgAFCQ7QD8P+f3JMLB3fwY2N15kmVkf
	xoEndgZmRq1dJiEsVTk8Qk5A6rEnd4ucMbsXKqG1+5R1Nhj0q3Vgb1y36RiqUECY
	l19l8z0cYUbSHaJwia+8x5RN1TZc8XEl66Wk5c2Q0tpIYgpa0fzlNMd3TmIPgvL3
	M2q3tQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bg25c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 09:35:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efc8d8e897so5384916d6.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984946; x=1783589746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idJQTFK2fsEmc4tj5NC6v5WdJKyxotJtoQ/VbxlsE5g=;
        b=NUaXxregqPts1cMo55B5tgi+5Z5snvZR7MjUETGBllqORXE85klEg8eTDzzGlMT8F5
         FNHdOrNPzPj/5X8oRnu3SPo/VRIjVrAUzNUfKnSkrsCBi4gab4ZXBZneU8uUlMIgCJYm
         IsanYrfeuw0Sod+MDGwSOxffSQuIBzh4MYHH3ogiUSbj9p93RkAdpFMo2qUh76LpVtFT
         5SHciu30RpkEYpBW48C5cbB4pBdiEvTJlmnnRKJJKqLyMZbI1xCWNl0JweRM7hDdi5Qx
         6LOaun88ObJdiMRVCEmAmDI5hGJy7J/guuEUlbUHBgPjMx3GK0G1Pxr+Owq8eLxZB7Qj
         sWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984946; x=1783589746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idJQTFK2fsEmc4tj5NC6v5WdJKyxotJtoQ/VbxlsE5g=;
        b=SLfXIJpP05Zdaz0p3eYaSq8Ck19iagbamL72SUZ2EPnuaX1QYnKgZ67qJ0SlLNSaFU
         ymlyHOF07p3TPIh5tIr4DKSdsiIK6/loKxXh7SYO7K7kZ9/ZGGc5p0X34jTOCfSylA1B
         fS/1NipWklLimcG+jlMv9pB1/fbPljCTXxAQ0xSRwxsf+oZSBIHChLc75EXPt3ZcYjLv
         He0wR66or5oHI5/DoDRIf8yfe+06r0mFFabb6ckTuSsJE535/IadG+mssZA5DTGpDZV0
         a7kaNpl8vUjuMuJqnufr3FvIQ7TtbGLwTeEUZ69bZJL5HJzuOf1dpByX6z8Z+MNLaglZ
         cB3Q==
X-Gm-Message-State: AOJu0YyeBjhj/z3GayZSzTG8V7OmBRpi9gOGqeUFevIKVPnVKHX3EuU/
	N0m+x5ZuzrNrsmLIhqmDBveUV253Nl+nEH9WKenpcfvVSt96xJ42igenNwXZaBAhdAn/DD9bg3p
	+OZkLAFljgmxxte96EGto+xTHB9RVY1mpKx2RBAcF0Pw5RDyvc9Qr+zgDjwbsGv5uhA==
X-Gm-Gg: AfdE7cnhXpw2B7WHacLakwhZiY7wVYkKVnKbv2V6Ws5YCur2fLM6F9iIgdbTKPn9Ova
	zDGn4M6wZSbKtYxJw1DjSF5Ifn55Y1JHcQ6Ne+84ZRAuX5yCK23pcqGo1aXtR0DzcNZ4dxpt2Bf
	4QSE3Rg1th+f7tb1ZU8yUYpUHIA4KZ1R4/xIP0oaAxnewruZXPyyhqIrM5quz7IHWwAgACBTKHE
	PAd1kZfvO/SESKp7Sq6pP5Zy9D4J+7PklEe7Cju1TWAuwOjho8Z1mDrBF7ZPYLeDzTxaQOOqVqM
	QYVWawRLQpqA/7MA+dd2uAuZOVCvvfFaOcC4G1cVGTspPMFFU1rSXIgrewaHQXxSMMmnYyEZQbF
	iv+Goq6MT7B6875tQMEl+XCAtnI2umTViUvg=
X-Received: by 2002:a05:6214:3911:b0:8f2:28b9:bdc1 with SMTP id 6a1803df08f44-8f3c9da9d4amr45695406d6.11.1782984946262;
        Thu, 02 Jul 2026 02:35:46 -0700 (PDT)
X-Received: by 2002:a05:6214:3911:b0:8f2:28b9:bdc1 with SMTP id 6a1803df08f44-8f3c9da9d4amr45694936d6.11.1782984945548;
        Thu, 02 Jul 2026 02:35:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad11981csm696520a12.22.2026.07.02.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:35:44 -0700 (PDT)
Message-ID: <55ee63da-21fd-4e41-a36b-26ba2fc90979@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:35:43 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
 <20260702-xo-sd-codec-v7-b4-v8-2-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-2-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UxTgzLKBgl8sSxTtp5X5nIpnsAegCvAy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX+QfSXJ2et+3Y
 tCqfWP1wo3cbQdyDjJcFXDCovraNDbu93iq3ejpa9bOqR7dCLOFPu/8G6uDgXgPBJyfFh3AxK2Y
 +TFHwWaHSA+z8POSHrOB4jUbaUs0yiI=
X-Proofpoint-GUID: UxTgzLKBgl8sSxTtp5X5nIpnsAegCvAy
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a4630f3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wa2ivycgFbbobwuY4j0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX3rLJu6uNODzU
 hgtlGAWYE2w5aNBaGIhw25puXJVqirp58tROJt5e4jI7Q/ycYxUvWJ22YqFysYTywenOSzRkOBv
 RzGhg+dHaq7EJkldlw4rNJMzIeuguqMtuwqpkd1hnz4HYf9HvmZDA+CVJb19rFx2wuEq5zfuVtN
 WOZ5jmMCHEgxr0BQWxEgHBMVHHBP7ectMOUg0G8BRa+8pXKid0TNW84CvtoN8owjbPqY5wv9gIs
 2LIv3KYQ+hLdpCv3ldFTwUz3gHroixTd75roVUSAY+BVYMJ6C6DRAMF0V4OPigYkGtHWZwYjFBT
 q50GY4KOYIMk/0fOCzichcyWijVYhg6t7uonZA/Myj0KYZV2xENIW/zOOgWT4o7VjADIjNQxVBa
 t9k3gWR79xtZYRMjalfbdBSxzQot33zdQskaGixpvGjFCNVSP1YzRjBsc5s2NklR5OqWNG2ZGac
 Ox9t9jUbjuZs8MoPw8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020097

On 7/1/26 8:44 PM, Ajay Kumar Nandam wrote:
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
