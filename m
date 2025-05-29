Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335AA21CC40
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511200; cv=none; b=uF7uD99c3B4rCIBYnSDzB1VLBHwk0ih0X+5BhiTrk3k2o81VyX7/HbNP0iUnzUkw+uA4wxziwEvLC4Yrmq8cdycdCZXJ5m7Jz1vAqBZHEuFTzj1HqrIaxXyl7D7IVBNUvSkDLWKH/leZcmFlHAwmu8G6ZbfcjfFEEiGBixpn/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511200; c=relaxed/simple;
	bh=upaHpcoQNaYRpzfjT5IJF09oP9mPC/4FHbCQA5gbkaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HY7N+Qe6WJjj3U0RBU1r8DTBW2B/CmuJijAU7/hr4OqePazbzPl7QZzSMX6Jr4C+Hr3DQ0PLAIOeQ7XQJtTRtP3D7JLoX5M4boCqWAq/37uuaub3cAQhmsfCxpxXoNrhOQcq/oJq0R7yJSmdajXoqVkcx6ZfD3DIer+PJwxtouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G78IVkSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G78IVkSj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T5gEtS002142
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=; b=G78IVkSjKa2cFUdG
	TQimbwKv8Sbzgk/GS0OyD9/a1LlaBbCdVjBWFXr8yM3OX5WigqO0oMsV+etu5rNX
	ens3zoETm/wB7RwxyKTIxhvivztq8I01kS3KqZT+snFp7srDPWorfR0va2ZokDKg
	mJMT8zgo9xx2YMmCTlkhUmrclZW1LA2x0Gfbrg6xTokzvgIRjMBW9ODBwhrPxNQy
	9pszzhrFoi4zyS6eIaWLsl7HMr9ZnVaDkJ5GEyKPgKRqX4b0O1tYxGQpV+1JBhCO
	IG02JIHj1Bkavgu3tpzrz+jA1y7XF8WpvpifHS3dKvZxXRCH8X4T6Mozc4w9wuQx
	pnqbDg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavky28h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:33:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faa33468f2so13864396d6.3
        for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511196; x=1749115996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=;
        b=vr1l/intupCxTAcf94MT0ColXtkNurLP2Uoj5GECEWCjDKy6lQQnOT/s1fPGUEXjQo
         9MKptAFQOqzk1HYX8Yu4lDaNSzCWiqjfgyjrBJvafugMeIqK/pO/y/V+zqLLKwLeT0eJ
         VqzWw0GPe4gV4KmsxQWZ5JcIinMldc/K5gFTwkP4bJpzE04E9c/rogKth+CVGJ//4iiD
         SfL5466x0vHK6hgryoLTVrPWDOXryT+MHiyLK6g6IQn/9sgyd75jQpG81+G7puSQ8psp
         BTjZTMov6wNAPVryHheRshttuWUUQ7CfC3f0ktRRkl6nQNLhxFBqFlYWk5blGesKEQYC
         TsnQ==
X-Gm-Message-State: AOJu0Yzywi9eG05lsRW6OAZzC2QvUmVZtBjTHOvRN54WOReuB1FLeXHe
	Ny9ZvZyUhBEa45Pm1tUvhcJl/f8k4lEtkj4VceNAfCPPs6iOp7YNjexxV+5OUIiXO69DKv6dbLD
	O87xhlEOC3vtcgVBt0o/jHEGk2DBndupgqoaMO6CDB0j/6z7SnFXZYkeeyftK4AUJaA==
X-Gm-Gg: ASbGnct3AzhxbUIHbiqbPv/lwaLivWKU/V4KmNPGvvnRPGMvsTFWdnz3BYWLPOWvsQB
	N0ywrS+CEvKotBh3XY9btsl1F5Jrve3lyZqCk01cKMVmnb1NCUywNn9H8Xc7iiIzY5r94DYnSXn
	w7x2lcTpZoPfsh+lgI8EdgLNAW/fkRT5sVYYmkfXV7ZbKVxwR+S59pvNXqjboyUM0YMPy5p87DE
	BbL1udplC5Ot9k5yYzJ67VdymsZJj16+HNCMpJvhp46vBqjA/asH7K4nVh/5HoOxa+ZEg2wNTba
	V7oEDh2js5pLM4oYZ38WzXqydYm9kx2v4TvLwA==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528776d6.15.1748511195806;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA79GLpD3HZiK/IRAurUe6TU66mlX4HbtpUZm3DMIN5fjfS4J9m+gB7K+ZJszdXMACo2cUIQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528356d6.15.1748511195376;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450cfbf498bsm15179805e9.1.2025.05.29.02.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:33:14 -0700 (PDT)
Message-ID: <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:33:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A-FIKSPRpK-_9u_T_mRY9X94tDXHmXQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX9JTQUGxAkjbN
 ShrcXDfONmh/eEc2b18kidh9g2vpXyjaeBlcBRbwLYqbmFk6KOJbPIGWTU996RPopjzy7qp9KM7
 zG9K+ArM6eNKOg2mpRp4hkiwAG7JB2qJdfq/53TJLFbUPBLcW/GyEsZxFDo7PGSG6z2Wv/kOWsZ
 9D2MH86qwdT3HfbjQSF5qGlXrZ8VZkE40v/NO2p+pPZHkAtvBS+gPN3q4xIYm/JlgGXwO9dmXQ4
 y4yhXMqFJ+sP/jy8CEmoG/BGSt+SA8gPk05eqvMz2l/JKJFae+dfSaleaBfEgQkByM2pruARuSe
 oUFetXk0nziyi5ihctPFnRv2SN+fxzY3ZJM30C9W6GyBfrdJqHEkM4M45Y9WrtMxqz0C3ElisUe
 gCXY7fGANMotlLCRs4g3xQIBjYuKasHEdtpQN1ZOS224v7uy0zPpjNK1O8dtBcOzhE8GXufm
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683829dd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=b5hiRvTwp8EW11ydFUEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: A-FIKSPRpK-_9u_T_mRY9X94tDXHmXQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=946 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Make static data const for code safety and drop some unused fields in
> structs.
> 
> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
> driver.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):
>       ASoC: codecs: Constify regmap configuration static variables
>       ASoC: fsl: Constify reg_default array
>       ASoC: codecs: wcd9335: Drop unused sido_input_src field
>       ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
>       ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused variant field
>       ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields


Thanks Krzysztof for the cleanups, its surprising to see so many unused
stuct members in qcom codecs. Did you use any static analysis tool to do
this or was this manually done?


--Srini
> 
>  sound/soc/codecs/cs35l36.c        |  2 +-
>  sound/soc/codecs/da7218.c         |  2 +-
>  sound/soc/codecs/da7219.c         |  4 ++--
>  sound/soc/codecs/es8375.c         |  2 +-
>  sound/soc/codecs/max98363.c       |  2 +-
>  sound/soc/codecs/max98373-i2c.c   |  2 +-
>  sound/soc/codecs/max98373-sdw.c   |  2 +-
>  sound/soc/codecs/max98388.c       |  2 +-
>  sound/soc/codecs/max98390.c       |  2 +-
>  sound/soc/codecs/max98396.c       |  4 ++--
>  sound/soc/codecs/max98504.c       |  2 +-
>  sound/soc/codecs/max98520.c       |  2 +-
>  sound/soc/codecs/max98927.c       |  2 +-
>  sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
>  sound/soc/codecs/wcd9335.c        |  5 -----
>  sound/soc/codecs/wcd934x.c        |  4 ----
>  sound/soc/codecs/wcd937x.c        |  2 --
>  sound/soc/codecs/wcd938x.c        | 18 ++++++++----------
>  sound/soc/codecs/wcd939x.c        |  2 --
>  sound/soc/codecs/wsa881x.c        |  4 ++--
>  sound/soc/codecs/wsa883x.c        |  2 +-
>  sound/soc/codecs/wsa884x.c        |  2 +-
>  sound/soc/fsl/fsl_asrc.c          |  2 +-
>  sound/soc/fsl/fsl_sai.c           |  4 ++--
>  24 files changed, 31 insertions(+), 46 deletions(-)
> ---
> base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
> change-id: 20250528-asoc-const-unused-1e39b434e427
> prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
> prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
> prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
> prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5
> 
> Best regards,

