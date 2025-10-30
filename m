Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9B34403C
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817351; cv=none; b=cJKQsVC/7fx03vBWZaRAy1POUB9JWYc5hOYF4apnWSuCAsjqX+kMh4ZfIFV6jI2vCpvWaW4AKgHHoUEPQkRmeNfxNjY0Rsr9vex8mdN8hM4B/qM5L0e/Ti3v8KZjNKsExwo0UvrTYm2x26AEvXOiAw+60I80KEnpjAT3marQsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817351; c=relaxed/simple;
	bh=slKW9L5x+Vd9nonv1JxQPKYUvCioEofsk+O6FXGrWEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUC18dGbLVde5yP2xDyWTe5Vp92LmoifxTkNVRq0ROc5zIufWRn/H+OseU78230O2upKGNbs+gY3ZbQV706xDfTolLr+m1ntj+WgdQ2u/rUjn3gdx4VeosThIZAOutcafgL4QGA2/1eDcWIFrjRk/5wTW967cmoXYFD5Tg3S4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llXfMHF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4bDPy1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llXfMHF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4bDPy1m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9WJHe3117016
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 09:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5/Jxy6FXaPiBQjK1w8+WRc0ckZ+y5lc27V0KfPeyZo=; b=llXfMHF53jrUKs9Y
	rpYYL+GoyBt5fZp1tqfiR2y0mJiZ0y9KbVxny3EgyYPMSsfEh/G6cUFq2VmbIFnN
	kKQfTo4c/sR7ux2eRLdU8S91RNcGDOwTjfDPSnix/8jW9dLqgPt2KJSb+YpL2QTe
	xOY6B0yJg++b8H1vNWCgQm/bQfkHRDyEHdSDulGgy+TXSOKdTaSlEyRcXac46Ojj
	f4FN7FVn1flWnCOCoq0SGX9KcG4wBFOO8SMqr+N53bgL6mPogjg0FWqfgsxGNq6E
	A0svXhoXOPSyJYs/Nfxo9oNKZJSZu3aFA6YFc8BffY4uDCS7//OJY34OgeQmioDu
	y4pf6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45frg1a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 09:42:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so22180561cf.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817348; x=1762422148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5/Jxy6FXaPiBQjK1w8+WRc0ckZ+y5lc27V0KfPeyZo=;
        b=N4bDPy1mnzwPsGFEPRV9CptsERvUXswEAG6qdxYI4koeR68mKw2gehxhL1kPyunIOh
         76Gy7PgdewPL7gD1cMJtG/lGrWCnleM3xGe1M7Hl8PAFn0Ip8yLfzXTAMm7e3TToyPkp
         JZCAkhgx/P1DJtAuE6XsMIdiPNouZqGKcMPa1L7rbq5nyTpLM5Owqi98G0KpaWzS7o+l
         loUEMt0CV2MbguQmcEw3A3inssPSuC3Cdf2ICutWiRAjRCUqW5Y8EbyLG9ZRmMll9k/3
         E2KJ5Xk5rwJDIuSnT1n47KyHClraEqnVcPMYC9h97DeipCJdaey/9uaoVup5OkFE0UWC
         vRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817348; x=1762422148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5/Jxy6FXaPiBQjK1w8+WRc0ckZ+y5lc27V0KfPeyZo=;
        b=o3cf2o94Lj4gg40o1rUtQIqVPe+F+aIed6j+f8tTUUDJRYxI28p1lG1rC1mVE3dFUl
         UuxVe+7AO/TfHZlw3K7yrx1+QLN58bxDVg/6jsPgVpTCoC8rR5JRR60Ftuf9XGk0SVp4
         cIBJH8bB3k1Z6OJ9mHykV9VxjBKMSM7h/ByrC8ksGxvb068bMVCXKMCnoQpF7ysXk6TH
         Vh6edX5iGs2O9Zt/2YIYihhA0Ld0kgD6G9+VhTBstv5SJE9fOf952HgAHuiiWbGg5mXM
         zkdDEQ2yPDJz1Fa1oK/Z1YYrGl7IhNgvEuI8dWUpzzd1/mpx6H1rjhyPms3U6k62yxJT
         I+HA==
X-Forwarded-Encrypted: i=1; AJvYcCVkkJO/Te4l5pLCj6ZyexUBk13TLKxesoSrNcQgSylrjlXYE9ExUm6L1qhICxy6FC9dV2cBoz7bXOgMsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8NmuN3OR/Jkpql25pFCohoaLpNsWJA30kfNnBG0MEPXS/5ZS8
	mzoOesc7gvkV52ldF1pCOGDrv1n9QFECzuWvKsO1Kzyf8Mcoh4RZdRN9AFhpGSjxb5E1Y+a7eGe
	qZRG8n7keI8ynf4tCnFSCuQACz8DHp3wwdSfk+4FLixLIrASG0edks6a0KXyqjgtcZQ==
X-Gm-Gg: ASbGncvpoWcUw/a68VovnkRDDAn/rwraPaQMMbJ0WvzboGJxnLGPc4CjqVL9AEoKjqN
	F2+Hs99VTsWEjYU44G86oUA24maoYiBWYl/vrO+td+ssTfhL+v+RFuGnbNVTZ/6lOr2IHtI6+TQ
	yVhNlT4iBz3JpRcAI2kUlIHa+Yq710FFyftY2YCajnCT+rfdRbOCrzlMPxx3n5RprVe3lD9Gfzz
	dWIAaSiBRnvMANPsdJ0rQ20rDXQwiq2yodgxmSnrvllEinnwBrXiHSkXigANBmXlmzoWvAm1TdT
	NL5ow0NR5/uyBQ2OTNR86dzr/cp9xIrHCQbOnsRuLJDHVGUi5Jwoe4ef7xA1NTRl1xCtLVEU/Sm
	unuNHg0zn8nLrDJQNhcY5mhFADw==
X-Received: by 2002:ac8:59c3:0:b0:4ec:f654:8522 with SMTP id d75a77b69052e-4ed22216b99mr34207331cf.38.1761817347620;
        Thu, 30 Oct 2025 02:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/8qp23qWFyHDBD7eZ1LN+vTcJ3LO+5eIrwfuCD9HQ3Q5hCF4435OigRG3baPksTJWu7zEGg==
X-Received: by 2002:ac8:59c3:0:b0:4ec:f654:8522 with SMTP id d75a77b69052e-4ed22216b99mr34207121cf.38.1761817347050;
        Thu, 30 Oct 2025 02:42:27 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm30920542f8f.2.2025.10.30.02.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:42:26 -0700 (PDT)
Message-ID: <82beffa9-d956-4820-812c-b2cd53d4a262@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:42:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: codecs: lpass-tx-macro: fix SM6115 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Stable@vger.kernel.org
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-2-srinivas.kandagatla@oss.qualcomm.com>
 <312b62d9-c95e-4364-b7e8-55ebb82fd104@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <312b62d9-c95e-4364-b7e8-55ebb82fd104@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KupAGGWN c=1 sm=1 tr=0 ts=69033304 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2Ovg_PPPbudXyttJYDwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qi07PEiQex44midRziHtO874D4d_XlW_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3OSBTYWx0ZWRfXwwyXTj1YcLYg
 fIaBHaAAZyZAaGiR+LLvdwh+LDKKJDr7PRPgWUi+MfS7wjM4wyaRq2SSUABIAEpU0ldgFNzslCw
 Sv6BEFrjUiCbti901Rar0l3YwEmtuSB/aI8nG1mHXv0xdZ0jSEVcJR1AvVzlEmUkdXuu0sdfgfb
 CZnCVWsCqWJMdQNcBknEGrg/1pmcc4QbZz1d7WQqkbC+ix9ekMs96d4YQXK3AFlwYe2yHHrwVyZ
 C3HKoW0eRV6HqBH5I9SAa3LpgzRoNKnpH4bO8A5qg9pvvZbcWBZTipfgbgY60bmlwLm1DULJbvM
 vPhJL+Dl1cWv5CFuCH3vx3zBF/OLzmuu/snMRD8spuSl7ujgZ+5wIMnpHJIapFvXUZJAByUhMnG
 LjMN/rVDccLI3V8d6jtI0nqL7Hhk+A==
X-Proofpoint-GUID: qi07PEiQex44midRziHtO874D4d_XlW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300079



On 10/30/25 9:06 AM, Konrad Dybcio wrote:
> On 10/29/25 5:00 PM, Srinivas Kandagatla wrote:
>> SM6115 is compatible with SM8450 and SM6115 does have soundwire
>> controller in tx. For some reason we ended up with this incorrect patch.
>>
>> Fix this by removing it from the codec compatible list and let dt use
>> sm8450 as compatible codec for sm6115 SoC.
>>
>> Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
>> Cc: <Stable@vger.kernel.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/codecs/lpass-tx-macro.c | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
>> index 1aefd3bde818..1f8fe87b310a 100644
>> --- a/sound/soc/codecs/lpass-tx-macro.c
>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>> @@ -2472,15 +2472,6 @@ static const struct tx_macro_data lpass_ver_9_2 = {
>>  	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
>>  };
>>  
>> -static const struct tx_macro_data lpass_ver_10_sm6115 = {
>> -	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> 
> 8450 has | LPASS_MACRO_FLAG_RESET_SWR here

sm6115 has soundwire controller on tx macro like 8450, so they are
compatible.

>> -	.ver			= LPASS_VER_10_0_0,
> 
> and the version differs (the driver behavior doesn't)
Its 9.5 on 8450 vs 10.0.1 on sm6115 both the CSR maps are identical, so
9.5 is compatible with 10.0,1


--srini

> 
> Konrad

