Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0C47D935
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984865; cv=none; b=Z50fP33tAEjDC1stjDBMa89u1B7Fp4c02iqoADm9ldQHydSVNuF7gdPKNV7hrqZWLtRBpS1wkEiyl352F1pY352iwSm8HyU7OPN12nim1j8tLwsDQKP0AvBEimdh+kOaqKjoz0fdc75SVYTKZ+92NcaH//VtxsFPpB6n8gn51Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984865; c=relaxed/simple;
	bh=kraOZFk3YHZlO6Splr614QYZL7yC+MizHPp7gvrHipE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnemZZZZlMUdjn9Q6ccRwHvpzi+Yl0rblU/Ob2c1f/aFS3YFuR96CRxJVFgHitfJ0ZunWroOrOh+zle8H5oe2gl2BZSFKQX8xNEpqUF0aC+Jw+b5QQ1UCw7xUAfUNNxR+/TjyOxUSenqigu+CVTXcaFxXfpKoXA4tYTTAOK7tKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvvrtzPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DviE7OQ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvvrtzPw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DviE7OQ5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629Kocu4116930
	for <linux-sound@vger.kernel.org>; Thu, 2 Jul 2026 09:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl9G1jeSjXcgJJCCIYloi7taZPF3m2xjegg3sFRk3iM=; b=OvvrtzPwBiioFcq8
	kz8GUqP0iZytKz+MNHA2bXOTKCDHpRHZGMZ21NQKXOeOFQamPoLO+Z+RcK0NfViw
	+vcAJOi7vabrMyRZ3JVvtQsM7HQ0xiF6roadm2nNEeebjGXILq480HoB3i4GZtaq
	a8Rn16SLqKpsZE7s0ueILBvNtd/dUka+bo6k8ocppY8Qz2n3/cbO4fuobhz+uJyJ
	DxC43mrikqxCMFpeudCV1HWjk7nxDlABUsbLM4KlQoeDKeFFTtCcXLtuH0yf5SG1
	+7219rurtN7lajg1sZTOjwlbU8k/mmqODv4lVDAandk3Wy95I2eKUTx/NCMuLCBX
	JscFsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bg1yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 09:34:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c298a1b20so2975091cf.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984863; x=1783589663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rl9G1jeSjXcgJJCCIYloi7taZPF3m2xjegg3sFRk3iM=;
        b=DviE7OQ5Cc1hIFLCYX7DZJ5xrsMPGxjzclmraDsZhNjiXRldVRoFimYTEJOxa0cJjS
         HYx3HtGcvixi+zBLSkMlMRkg29xxQadwbGdTl/+R1AH6VCbDmIdkvdXmZmy3BJRsCwjg
         w9P0qmXE3+jiM9MZEZfQVRVOC4EfjrEfEP9egthVOeSyMKLGwKACU0KRS4+45LQIxxej
         YsDdA3wIkz455/Lb5e5Bo0stjJtBM09B03wq1ZSrRXNeXZ6Hce0qfGY8vNHAqdXgYsAN
         YNJzTtOqtzDgwnMHuV1fI9ejrpSfdfk2gikKFKUiDjmHgsWVqhb+4rktuTV2AwFYj1hO
         dzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984863; x=1783589663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rl9G1jeSjXcgJJCCIYloi7taZPF3m2xjegg3sFRk3iM=;
        b=FCQp72yiDKhNxhsSonkLFKvtiAgtRo5xb+Xzz5AruDTvYgunES8YXWLaKPWmd5fWJd
         bNJR8mRw8/wTYQdSxBIlfh7giR+/rGVNLPX4EzpUII+gITC/3M/wlJZNKpHjLXqJfvP1
         W6+yHdA5SC9X8MBa9+paj45txBr/ve/upgMfBp4rxM9k7Cl9QtJHDnJ2VECS8GZZ9nkX
         Qi2g+FJsjQMl1OnaQ7ULKPGhs4dbXBsgur+U5FeZ5NVLbrh+fHAva0RlsowUcyy4G8lB
         ryEYjfJ4svKZlY8bVIlmW1LJh4JCOtk6FFoO5Zc9brHQlDcikoO/WecPqWnMsSOTkbJv
         5UUA==
X-Gm-Message-State: AOJu0Yx5CrrW4kh/LPJmu0tZTbBtNeHavlrkwxzbki0lqLtUQEAceDfY
	KgmGaMPjtAaIg7zH5N3/eXDY1w09jlDh4eb4kT57JqyV3YC/eiXfYrT0XLRqu47RsQ7ZmGtlK/s
	b/BAIht5l//kHshsD9mYyCUw2CapVCVcPthlop/M+VCCM8qMoIeIy/twSGbZLumSMBQ==
X-Gm-Gg: AfdE7cnjouDuHufz6hBmtWkZZR/xUbYggSGA5+tfusP8pcEDNiIM3zKEsxNqGNTwRvE
	1+RosEZukyVPhplybki359omMw52h1C1FAVuCtw5NRMnsGn1EowpU0sUej9Vcu2+5B53wUlPStx
	Db+EOTaGL/LTM9gX++eFhVD7Xxo2M2nZK0614G0Z0nNMaC92GQLATZDA8qMWWIi6h4eSwdnXJsd
	EnnS/Le2TeMXnObBjpjOGXp3+rasHtE7xU5vJCTQgQQdpb+m5mZI1qETN7m1t04ckwEvXyDXxrL
	3UfmhcmNGpKoniPqMjZ47Du3EYxGzc91ohBEhuIUMTbufDDBprqLP2zZk2wCVdoUvzKq2YUgxGP
	X4gIv99GNY0AyVGftveKo7X490SJ1urQ2Xng=
X-Received: by 2002:a05:622a:1812:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c26b119a1mr54070751cf.6.1782984862729;
        Thu, 02 Jul 2026 02:34:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1812:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c26b119a1mr54070621cf.6.1782984862217;
        Thu, 02 Jul 2026 02:34:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c552esm97219366b.49.2026.07.02.02.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:34:21 -0700 (PDT)
Message-ID: <472aa507-b6dc-4917-ae66-ee723e655484@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Pm0LnXJNwxorX4sB-OeN-YD8uDJOWAH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX8CReeOJhhVbC
 FoTcTr6+h0Nxi+z4gU9KMgH0ujwsLJpFgRArzELaYCulfaW4F18HrVrKPmYghJhRiWp7ImdFtYK
 DzERkwtW0dvDfc13akTt4iB8T+W00HM=
X-Proofpoint-GUID: 6Pm0LnXJNwxorX4sB-OeN-YD8uDJOWAH
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46309f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qMpE583nMN1t2QvFoBQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX8p6sq/cYxE04
 3fIF71/ynhs6cqaj4o7tfn4cA61IJAc5s3KXSPRf0nXjtVJkAKSPLQqBTpBfX6ucNb5UcgennTP
 X/gks6fbI+iJT7yV2FhHi4CbUSbtWppEvo8MhEPn27wPyKdOKdzNjAOFG6EkoF/2eWLv7X32y2U
 aE6odE/RHmxbKRyknKakYaaSXVj3MvOgOGAtPH4M9Ho5Xf/CYgm57WxKEyZqjEJLW9iLgP9mifL
 15aOPgIMHvF9ClaiciHCySMWmQ0qZc6eUvlopJyiTJdq/KfjiUwzv1ebJx+oin8OyeUop4Ydxnk
 Gi/Eqd71RIhZan8aZDopry7Vo+rDp0IMB9YDS3eTgYoNzT0zwNyfVUyXQxbjxlyJT/ungP7Y/jW
 /INGg59MjH18NuWO2VTxOR1PYloIqoVSbIYqaOXGaTe0Gy7SqDNcNOhAWNRjrjV++IRjqfc+KPf
 SLn0B7hYp/MVdKLU51Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020097

On 7/1/26 8:44 PM, Ajay Kumar Nandam wrote:
> Hi,
> 
> This series converts the LPASS WSA and VA macro codec drivers to the
> PM clock framework for runtime PM clock handling.
> 
> The runtime clock enable/disable sequencing is moved to PM clock helpers
> for clocks described in device tree, while regcache state handling remains
> in the codec runtime PM callbacks. This keeps register cache synchronization
> explicit in the driver and lets runtime PM drop codec clock votes when the
> macros are idle.
> 
> The series also keeps WSA MCLK-output clock registration resource-managed
> by switching it to devm_clk_hw_register(), which allows the empty WSA remove
> callback to be dropped.
> 
> Changes since v7:
>   - Dropped va_macro_setup_pm_clocks() helper in the VA patch and inlined
>     devm_pm_clk_create() + of_pm_clk_add_clks() directly in probe, matching
>     the WSA pattern for consistency.

b4 adds this section automatically for you (see the 'EDITME' below)

Please also run `b4 trailers -u` before `b4 send` - you didn't pull
the tag I gave you on v7 (please don't resend just to fix that, I'll
simply reply once again)

Konrad
