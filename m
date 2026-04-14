Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83363B531D
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156415; cv=none; b=Slab70wD/ljHvIoTYejx5VGkem1derA4ZowUVuXhHwW5Q7GncHnSHT8DW/TyV6cHTQH0ZfTnv93JI+PESGw1+LdZXEeasLRFrXSF+9ZcRMTGMVJ09lhDdzFtyUWsBg1qhvl9j1OsZ7saMW/6qHEfGuE3N1OGtuGTd/grCKOTGKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156415; c=relaxed/simple;
	bh=SYartanFMsIv2g6KjhxWu2Uxv7zuc881jae3LKtkqM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shzDl1OzXi/6D8bGS0EC8FcOk6ORU2PkakARVsnac++gIO868Qe3Ufif4xaOsuYEQHlgdtlvVVm7yjG5QXObx9/v8gThWtiq/ie0NPLiOzkADO+ghyaRxxKbSfpXq519arytuCApIXfpSQUQupUJRcc3m/FUTivpmBQyDJ7TagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBcIM9qG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cu4H3Cju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBcIM9qG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cu4H3Cju"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6bPdT2386512
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HwoJ6Qkx24lge+pKZcUJTrizcXF0yAUZNbBWQ0V6Pw=; b=WBcIM9qGm8abf0gY
	wMOp1RpexZQQsSNkdTdA82jRVyfKGJSqjHr0TxsTzEe0vnHnIHg9aq2pAZccjpMK
	MGcYCsvRWnPGfD0WYebNRtByZ7qHsMYQdujy1sFI6bKsGHXrLHcm7beZrBJ94Wkx
	lgO7LkRj0cwK24rKZKNIOSqLcMOohc2KJlRkx5pAEU9/fFBJUqg4iaRG1eAYvOkB
	jJlnk5q8GJzRFmiDyB5ZX0zNqh4S15BD/Z4c3CXxwGc/2Bdd18HI8qvaWbiOZf4d
	LjnipRinigDQxNRx8L3qJcFuBiYXDN0cspq/8gYJI2c4xfwU7A7oi43p9ZbQLTvk
	wtYLqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w1uvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 08:46:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d7128e038so13150571cf.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776156412; x=1776761212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HwoJ6Qkx24lge+pKZcUJTrizcXF0yAUZNbBWQ0V6Pw=;
        b=Cu4H3CjupsiK5PhTU/MysiM+xH1iHYLqpZqdTyXIFYpyQrZIAk7Hg9pjNjNTv5M8b/
         MNUFkB4euJExVYqSk6tsgQsQW4lBncVfJg5lYRxtU4k2aF6nQ8ali7qWbWMGoaof/0Ed
         FZK2diP9JZ+jrfgzf9NIFJ5vRpD2Z2TCh90WVv2dQBTQJQvdgrFuMloyvO2ihVCqgM6A
         FVuxJD1EebMs5OqmzxbHLli07mIhaTLpNWdxxrdhHYwUMTUyn+xCi31NCWMWgeUSSgwV
         MfPw6yT0UOZhugJuGwlg6+d7NOMSJZV7yi65nHSEJ+bdNrVxybkqlhjDAuIea6RXLOWV
         R2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156412; x=1776761212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HwoJ6Qkx24lge+pKZcUJTrizcXF0yAUZNbBWQ0V6Pw=;
        b=heTjQJKomL2HhoOBWwnfRA6HYF1F3p4NnDiJrQgW4M1cEsJ+ubRTZwsFhxYy7Hn5AA
         KcEqLV4iD52uC4ZiPNa/oBtl6dvjhvSYRnzJbv1wzkFevNpYDpM6tBwpC/im5IFdzbUA
         HDkSlfV8WWBy9ZviI+AbU9ExhtyXq3YapWf2r7hjok066PshKlzS/K1oVJPsmsmfpfWh
         4ERddftt+Us0irwwaY6w9Sod6vtR/2gg/2az6uPEYMmqfM2R3IdHWn5jOnJr2JomFDO9
         3mQ13AI9FUD692v6hk/h58DnAe7OE6J6kAzCD+v+AcF/QVeRkDDGwzwZSXF0Q+kC28hp
         EWfg==
X-Gm-Message-State: AOJu0YwxWgka0PxRs8/hJAxOwb3+QNVV8xn/HaQ0XnaGE0JAHyIIY8kh
	q1jTHbpTB0DOzWBxuHufC6tUCNZqa66NIBI/glYKpOQk9U1/AuGQsva20D8ZL9lkOkIx88tfPte
	1RwaFWEnNq/XYm71DiyVK2FqQSQMvC6UJE1kXD5FXyAMEv2iUKYyYLH5UtUAheCprHXaYtDfatA
	==
X-Gm-Gg: AeBDieuAW77b3YKX6N3QZzBALiH8DL1eqYjlx4i1V8wAANS6aJ6Faox/HOJ/UNyfn92
	f4dt5ZN3rbAChRxZk4K2a68SRtsyK9EKmvSrdcHJl5ZV04jDtnpyOFJm9EKib6Hrj41sUdFHun+
	GA1ZZxae5/V13rjxzMzMaDBXAeABmfeXzN53zGQX+Z/hUcshricLnd1FbLh1YbRG/1K6q/KZEA6
	WAG5pn6Rl7sWbr/j06S9ka/QLIG+FcfvmQuH/jGMBQqOqZy5dQJg/RffmvQzZCTbI7xpa6w/7nf
	hkAAtbDr4PQkhP6bbjj4eT6RdT9QkTSezUGjC3zrimVuxp9FLk3rsz8v/9oL+vb7cjqflXnTl39
	EnKhi22Q/GgqEW6Z1G1RaTcqTaikdFZXeoNpyqUoTe+ny52daUbEWmJuABm3cczHM4MouRsbl8w
	7S7hyzju8Dpl6/oQ==
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr167151581cf.0.1776156411817;
        Tue, 14 Apr 2026 01:46:51 -0700 (PDT)
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr167151341cf.0.1776156411332;
        Tue, 14 Apr 2026 01:46:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a4fsm369699366b.54.2026.04.14.01.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:46:50 -0700 (PDT)
Message-ID: <dd09f4b8-b0f2-40d7-80f0-bdd2cb382c65@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HG32M66ygIlO-tQAxKUqznlN3i1alt8b
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddfefd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=weikHDwYOGaAN1ZrU1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4MSBTYWx0ZWRfX+MaJOGOmOkn3
 bm6UthuXFBIp+1P24l+gLNczs+mFaTXQqobFaThTUsk7UQmvXaPTZ7+QBC4srDUX0D538fEBaYx
 Nm7+I5rye3RuEPPu2XpWM0rvE5tv6fL/RkmVYWJndzM9c2CkQZlUC/cDc3FM5ulxiL7tpw9/bvL
 pTQ0M3b0Jkb8FycfcR4spjg/itTgtokaWpdbjfKeDB73nvVjkD5b0SRguGWmfUUucGFeSAmA4m8
 bQ4vlvZayvCNw5s55r299iy3ChvolCHMrS5c4Jbal4j72M3nyuKC+Jdtz4N42xkbvwAlMAroHRk
 r5VepJ1e254eFc/4SwOPneOApHw8taYUEyZsUO4WG0cw3aUWUJqp/6woTWIG1XGBhEPrRhR+EI3
 C0n9Lk4AVrFPj9RSjsMSaQ+/vIjF9vLkDz3LzapVMyCrCrlEFMi6bRk7V9eTi57ak0wWlCR5XN8
 mcnFkgk38jXw/7i1n8A==
X-Proofpoint-GUID: HG32M66ygIlO-tQAxKUqznlN3i1alt8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140081

On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.
> 
> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.
> 
> This ensures clocks are enabled only when the WSA macro is active,
> improves power efficiency on LPASS platforms supporting LPI/island
> modes, and aligns the driver with common ASoC runtime PM patterns used
> across Qualcomm LPASS codec drivers.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +	pm_runtime_set_autosuspend_delay(dev, 3000);

FWIW I have mostly the same comments as on your other series

Notably, msm-5.10 uses 50 ms of autosuspend delay for the macros
(100 for VA for $reasons)

Konrad
