Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433AD379C37
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574454; cv=none; b=BPAnmvoYLGFx5vy1OQ4jvFshGxmV9tzuESlx3elH7Az7P+Z1qjFItQGVCf/hOaG9yF0M8zgxVip96wNt5El/Y7CoYrOHZHkBq5ESHaw9TkXZiOPKlrYcBvsZxoaYDdbzVPEK/QbU45OtX+ePsPGDmsuea4zI3ODFoqs7FsxfAgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574454; c=relaxed/simple;
	bh=fp+V34hpoB4yOssKdt0U5isqsJCDpUTiW9m4DUr8URs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7flD0TNHgTBaucLgQvrAQl6aq4U/zjlFLZ20kgmE3uJKX4xHy7+vJoN53AbAWbjfAl/WnT8NsiufzGWASrrgO1lwQ/58ulx48ObOaPfd/uGO4E9huItQM5Lvk/MHidhAYgIwCkfldI6q9qN4wjk2bqiKuKObTEp/yvPDocru6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEnV6RHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuzzBdAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEnV6RHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuzzBdAb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4vFfp2187915
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 08:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=; b=HEnV6RHMDE4ksLLg
	IEaGiz2OR8zAqO1LerOH0lU+PAy4b5wNxrY9c9U5uTFxTGWm9QgiSi0Hhmdy4MHB
	pG4F3GeTaHtLd2glTpAetIfgj39iXLPal9qQaAecm3IBpzUwYp6Ba0hpSb2nEv+W
	2pBGfqeZKkw2LnxszX1expqBrAaBTK8Sk4YgMG7U/N2kIFqKfmzaedlze2P1fUmw
	kO4YWxBjGdA+h7AWnQjX/u7iRfu4ZPukZ5G43k9Rg8vzpN3XGY8zv9dSd6NO7BeV
	mAxvxbK68mqak6VB7l+w0HwGdbtqZm10YXRitdMKsKK831LmdCxpWUq8DMXDBNPy
	YW9WBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2a9t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 08:27:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso34912031cf.0
        for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778574452; x=1779179252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=;
        b=BuzzBdAbyFS+2X+QOtdGscQC0S7vWtM5wyeek7M+KvjyMpb30hfSx/+PFekYaaT+i4
         KFxbLdMpMaoBhMRjGpJ0k3fwpSeQ4Jczyh4n3WxZzTOEcG+zb1OZ2XVP7UdXB9sNaoKu
         QJsJFk0CP4bMutkHptxl0T258H99ZOUyDseZd71gBrsQtfxsXDy3DQ/bT6wk2sCaSXCE
         75FNqsVKPgUgXFpVwZYg2D2gTWCcwK6zwDNdmNyJfArQ+r7aY5f3dfFEal5CAX1cRPhe
         oHty/Z+cUOvJY0/c6Dney1xN1i4L3cfJqKFCJ93ND88e+rJRkmNryzqF4gtNgKXjZtb5
         +JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574452; x=1779179252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qOXO0EbEhr59vYIl1KFFAbXwwczXSC3203+FTat12I=;
        b=e0jUiNC0MQxtWH5Jpm6J+/EYZiobUNaAXkEOxHadqv7U+vxC/f7Nf3rwpXeg8RrQ3L
         dHjrheg0bwqbqTdtQLBadrBnYK7qLSrrRjzV9dVq2kQtAlPvgq/RnrnvZK1jNSvyRco4
         NGx2J63/1Sm0diNtV5TcIV7JGY42J85pm1mEUXqbAkbgRMG/+QUVVrXvTnuUvQjIYuNO
         1NY+D1q6hJ1PeYT/5yziJRZhtxH3+2ZXdVYqUcnPyd3fNIHrMcAJzxtTdw7/eKpgF+m7
         ansNA1+/w/e77qyyth7OPGgmQ1KllcOL9+hD7UozyOXXZ6VbCO4pR93TL5mtja2s0L01
         WDnw==
X-Forwarded-Encrypted: i=1; AFNElJ/6UMvPNnwMP0hDqaoxWNCsERL1aNVc223BxTFdzTMXdn/Rf25wvb3US8Ix393Pfy/60aSbJlWQT5yczQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1TNOxI1T3fQNj2B98UQ6rK6sM7UVX6GwV2k55/SlXK9DbzAz7
	a4srZFyv2VoNDTrSU4YExYkOiMw2Y/ldLJhZhoT5Ssh3kmiIJQNSwaW5MbwVfnPWdOblo4PvXTC
	FYckU2VimtrcmUDg9AfcxVjWA8leDLKBYGp6ZygquLM+LSzwHqqea1uMYQ5t770R1xw==
X-Gm-Gg: Acq92OF1jAG9sOQXJfh+w4g+FgLlUCFhTPSI54yAHSSFNice5GbRisoUHThL6LEYdmJ
	XWz2DRnCsNWDmKU6TP1ask/DPCO/aFrmsAWjF6L7g/Fnk7iLmUUKPYZlWh1e++HlCHdz1uKFk5g
	arH0bpAcNSG6KxK6bawcN+ari88xrKIirDEQNm144Q743qUTLORB1EuRYjDZr2C40LSRongXL8G
	d9solMRjmSnk3t9tLqaVo9VjaU9QiAduZAjrDMdtWVHGFqJk2ATvens9p5TxgRarJninKmNHQ0+
	RUzW2YuQT179grDhQFlf0WyyfvtoxHEtNB+yqs0MN69HXJBeSZ1t8CyRh8HHanpI5u/oFs0udP4
	WBDKyJpIy6k1keNFZKQfBUfEGUBsptZu1zEazEECWcNWTBH92
X-Received: by 2002:a05:622a:2613:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-51461f9fc6bmr388503521cf.38.1778574451520;
        Tue, 12 May 2026 01:27:31 -0700 (PDT)
X-Received: by 2002:a05:622a:2613:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-51461f9fc6bmr388503351cf.38.1778574451002;
        Tue, 12 May 2026 01:27:31 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ba2aaec3asm589796f8f.15.2026.05.12.01.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:27:30 -0700 (PDT)
Message-ID: <2acc3606-2e34-4037-94c5-9f6f28e497d2@oss.qualcomm.com>
Date: Tue, 12 May 2026 08:27:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
 <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mHbpQiJ95SjGZY6g-y1mAxK2hufynbr9
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02e474 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LiCzDUw_Kzk_wQzT1yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4NCBTYWx0ZWRfX1GT1hKNreb9c
 4rvxhFSikf/xtRD+S2nYfkN1IyJL+POOiv41bBD3xTNy3giIbWen0q01CZYsoC9ip2dK0Tts4Yv
 rNSdwBYfodv/jNX/cisZmVbepW+T2+XPKBEaEfSwrNc9R3YPbFGIbCsOMG8XchBjWhyX/cPcMDg
 Jukemlb7VKES/uxe/Tkw56slYscLBGlvkgIV4drDz1CgJkkLeXom507knDeY8zX6M3U3QYYlFsK
 gDzSXSmu9+EnApS7LQCp3N7sA0P3wLvUI14teTS17xAbSX9rh0h342rN8K0xqhcsczTYksyQf6W
 ohG+0Z3lMDWVdSPBR6SNeGf4tGsKQYCiBkn36VEyAAasCcXn/uQVC9NNN+QrQscGBXWqUY8wS8S
 oPNPewlALw/3eYN32qwBGJ62MQG38x/6FV9KJ7f1ad24SNFSK1ed3dFUxC9n9WBQc9DO0EjqzTI
 lS0Obsq4xeQsHBBmfnA==
X-Proofpoint-GUID: mHbpQiJ95SjGZY6g-y1mAxK2hufynbr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120084

On 5/12/26 5:09 AM, Jens Glathe wrote:
> On 02.04.26 10:11, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
>>   sound/soc/qcom/qdsp6/audioreach.h |   5 +-
>>   sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
>>   sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
>>   sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
>>   5 files changed, 202 insertions(+), 135 deletions(-)
> 
> Hi there,
> 
> I had to revert this patch from the series to get back working sound on
> sc8280xp (Blackrock) on 7.1. And hitting the right patch was pure luck,
> tbh, since I integrated the series on 6.19 and couldn't apply the last 2
> cleanly. But figured these are cleanup/refactoring and left them out.
> 
> The errors I'm getting on Blackrock are these:
> 
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: Audio Start: Buffer Allocation failed rc = -22
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: ASoC error (-22): at
> snd_soc_pcm_component_new() on 3000000.remoteproc:glink-
> edge:gpr:service@1:dais
> 
> Since I'm way out of my depth here, I won't cite from the Great
> Hallucinator's analysis. Only reporting that this refactoring breaks
> sound on sc8280xp.

Thanks Jens for reporting this, Let me investigate this and get back.

--srini
> 
> with best regards
> 
> Jens
> 

