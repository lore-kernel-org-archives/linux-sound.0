Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646B9346795
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016731; cv=none; b=VPexwtshTLBFEJ2x0MH2fH3oUoF9wBQ4gxWIHg2UdmYCuPLAJKyYqzBQ5lQGYhR/Lmy2yPbloUWEU9xsDIXX8vv21gxsOZWD/lJQYOJuxNBAyGZ93sQWNwPxBlURBm1CND4TPfLxxkJboacgM6MNCXfCDEib5/eLlHQCjEhgvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016731; c=relaxed/simple;
	bh=plO5hMcCF/4ygt4ohaz4T1j5So9o1YDIgKVuqScozic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO7Hlhxi0VMfpCXeTFRrn0nnTxugCWeVZgUvdh9pT41zV0cABORVL/lCfCf/mYSiEtwkRjVJvlRS4jvd78GDuLz9/0dWS28H/j6Y7adu8Ey8hsyHk8OwQCFL/HOe5PHvFGQoKLF0pCUy8f+FEuk4qAQCPkfzBBxMTDFkKnrWATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPOP6Xjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPojoQUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPOP6Xjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPojoQUr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnJiI2668399
	for <linux-sound@vger.kernel.org>; Tue, 9 Jun 2026 14:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=; b=PPOP6XjlbYdd83mP
	WtHj13CR9w7O2VJxwz2yv93wSYeH+S4hazLd7PZc3H6kolIRkgp3H5NDCltlk3rq
	BmtpYwuKIFR1HjtdXjzWNHywnX/vZpt89H6ULFRYVWOlOUyVVHfiTvgwR3htaLC4
	jeV62TyGek80DdZDdX4nzML1/UPypULiZhbDzezCONgTBeFNkokHZDAPN7kXOyA9
	OEKB3tcL9xK4WJwgJm3kNOg8WWkFxwgurab3HDcYuUYGF3OOIvae27JykyO7EdPS
	4DcgPDPoKVTmtk5H/84zXH8u0aVpW86GsM5ajnHO0vybAN4yN/IiHGVd7DlE14Mz
	NCY8TA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25t3w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 14:52:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b8fd12aeso150178785a.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016729; x=1781621529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=;
        b=dPojoQUrLgAsG0PaRyS0Uzaoxcem4N0OGayBLfgrOhGT/D8+GZ5WVwzDw7pAT/+3He
         U8/IOgbwvK4Z8bdVK4lwXmm9V5FCadj/J+uFJelG2z0d/FOqYKQG4TJFItiyd/4aO+pw
         GgGBpfbRynLCG0nGSHdADJ+FvCEganIYWpAqDwNe2BJk+6dY6UJI8baEr+vbnlFBazcI
         LSU0Axv4ivENpn9cPqEeUXXxq/FCXeH0lBBsUYk7+4LbHE327PqxRYtKki8WCvP5OZlZ
         cM+fWj1TJyCQoQJSY8N7kTu5gW3xS0v8nB4xyoSsFiECuqawH8B6REsd5eMpJkhLMlNc
         Q6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016729; x=1781621529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlN7P1x6h4VlhBKargHVoeOlr6txo4uIZrHjud/cCzU=;
        b=E7w20eC4N8HJfWPFivo8aZP1JqXvLOyNeFRa6Lo6oZNK9TALZOR88jQgeqd1Y9rlBu
         nwZ+p0D/9ASbSokyLjCEMr82853lW/vYkOQdwnpVUSNG4kVv2pFAnjshV78fouLcaigY
         ARlxwGF2AohamI2fP0PCVSsGHEOVXwwmvejw2fuLdLhcYkomBWy2UtpdhvxM3jo+Vu//
         i0WOy5UoPXImddqI7Ku738eS7gzCI5WlPF47fyswvPJi6/UtPSXvUbft9yKn+CY6PRgQ
         v6GhGgJQXG175ubuE3E84w/MLuJ5DVBmgcLYhss7nBjwKu3KjTo7YR9q451cQIbu7Fq5
         d6zg==
X-Forwarded-Encrypted: i=1; AFNElJ+FxD2VaGr0GAy2fmEhqZ17+u53xrvo/0L9OoNTp2RauOg1tOVmWnqoo9a/3t0dO6q657X6QJQDeuBuUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqBODH924dHeeTIrJbXpRKka4n854WsO4LQ31qqgvgvnil+wJ
	5II4jcLa8Oa2eF6DzCXeTOdtAhP8HitnQ4HPItFK6g44scThY0/v0KW2rgPz+b3jBCmmji5nDAT
	PdwK/BS8CsWVRoKvWUO/LLUKzcUwjhkQZBWeoyp2DUDshP8u/pN100A4eEJlw3KCTyQ==
X-Gm-Gg: Acq92OGKZ0Po3AOpYu6R2voI/2iDpHV/5EOqhbylC1hy6AUy58ebQ4NDm4sr86BABzc
	TuuTriy5qL45mhGiu5uoU1UlMPpK4TEv8q1KLIDqj9ZUTy63sGFCxAoXYbkyuJN/OoXEA2H09zI
	5os6HhfJB08vMgiXEkTvDNpYqNIFyRJIy/UV9vYyW1HSRONxWgiSmyIPZrK/G8jdPHpzeGaLdPA
	HQuN0cuKRlbLcZkCE9frpCUCZoTj2HYukeIxgALqlVKQwBHYCFJdRV/DxwIQK23+wXb5wVY+nMl
	uTf2HSu5KBOtMJLT5V646O1r0FbaaCOijA1FRWo5c4paHQRq0w1HlpyKDismUpHWpUJyuBrOOfo
	x8e0luGmqoT2ELhpQGCCMpQHHy7iOn6ipVcZXznq68SK7pSUbIHLaq+JG
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr2044041885a.8.1781016728786;
        Tue, 09 Jun 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr2044038185a.8.1781016728225;
        Tue, 09 Jun 2026 07:52:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2d2bcsm8765718a12.10.2026.06.09.07.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:52:07 -0700 (PDT)
Message-ID: <52a26036-6ac0-496b-8990-8bef0ea029b3@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:52:04 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ENHSLT6J-a5udChKDoi97dKXr2Ngd-kw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MSBTYWx0ZWRfX0saWx0juAIGB
 GWrztUlEeqfrJ6ht19ri/g2j78mj6I10hnGpS5yBjZaLTin/aDri+VclH//cLoK+cCJbWeOnSoH
 8JucLrSULBgr6nxo6MRKP5otk2IB0hj6MIBFnYocmaIWHImCHkLZp5fkz3IZCvzKJNsSYhK0/ce
 80M9QzBcvzIXuIoaIMTdwQVrQ/s8cboevLuysxT9zurAe7BqcqW3tKjlGIwGCvPWDIAuX/fHq3O
 W8C9iaqt+eWa/ZhmcSb+AYh+ynLdhuGNdYW9dKgFj/LRnOcCahzy3WHdXjKvr2Ob2JZBEs3IcSc
 xxHUy11esh54OTxQBBa4T2GCztIEwTsWdC1UughI+FBfrrtSKrUWuv8MYb13k3jv+BJ7MDk/uKn
 s2emhI2FuoQzoqJEJs2gEs+gT41W6zt/ftAfMKWs+HEeBqEuKM237IqqLrHTwoFiX4kfmKD7AW9
 ViJ03vYl9BxgfG/Mghg==
X-Proofpoint-GUID: ENHSLT6J-a5udChKDoi97dKXr2Ngd-kw
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a282899 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0fbrQ5wkLIivLQXGzjYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090141

On 5/26/26 5:03 PM, Luca Weiss wrote:
> According to both the static definition in downstream...
> 
>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>   #define BOLERO_VERSION_2_0 0x0004)
> 
> and the runtime detection:
> 
>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>   CDC_VA_TOP_CSR_CORE_ID_1=0xf

Some page tells me this corresponds to Bolero v1.0.0 (as found on sm8350)

But maybe +Srini or +Mohammad will know more

Konrad
