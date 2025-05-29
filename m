Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2921C182
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511092; cv=none; b=ZPnCdyhJbJW55gqQ+seOEKCaJjNoBOnBWxNnK0c74UiH+7+f2tlEJFAXDcdv2H3d62TPAD2THpzputEFQVekocsHdNymGnwn7K1t1j2jBqlrLPdwy4iuHr8xtcc7uKPNaPfk4nTnOOYdh+Xsk8g94kZjog+MvkeRWJ5J3VJ1RpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511092; c=relaxed/simple;
	bh=x1VRGfZYgMo8RCX4BaSZc1zb6VYt1ma+2qcQbg9CNZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffmxbq15bJCTso+nbT0BluCiZnpxD+yQoO1DFT++tHDOzF4fLW0B7j8BC7qXwKBRtx63aUwH+fsXDZLNqv0as1RBpDgwV2NVtYCn1prQrVx+6WYfVFA6xJq1WLt8jx9dByy0kR2zUtD07Cu41L3h/IdVWtlC4Rae4PTNFRTO8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9H4KH6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9H4KH6w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7uxtj003143
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=; b=n9H4KH6wZFVqFKwC
	s7dv66wlnKp0VNBOw14X0mPYF74fu9KtGmg4Uv0OcejZc3yeAOMYTfEOwP8kTydW
	nFpx2A7/8MULdwqEZs8UDrrK18raxPg1BlEOKkGryJoIlfsYuL8bRcjnTHlP/bjL
	bqOCuMuGt32nsSjCQN2ar/xe59ABK8b866NYCftHyRKX+8x+X1d7sY9X9oq1oMiH
	YjDr8o2fUgnqNnqINFhdkAXhqOP64RVWPR8jvJbb1+pwtE9o51zkN/1J7wjiNsU4
	BV/+Jbsc2Nz1Flrhj51rZaUiAoxqlcBtS2vhdKdYoR9v4OYbF46W/eMjmBIGYCWV
	m241Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d79vva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 09:31:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so127793385a.3
        for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511089; x=1749115889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=;
        b=HkaherU4BJ+oimFhXnPsDj+9MJKSjIfRnkPEp3O+PEcnR9IZlN+igCQMdK8vnxGET3
         O4cCZEmX2hLikxa6g+tj4rX3KwUcIJJgjJ7rYLDM6Kw+5oCuPx3d4Ni1E54Lfcguwg4B
         qGYwvQts55FdE0i0UzNmHHlQdbAkRlbmVgTjAKQmkrP9dyyyzdONv0p8MDJHmFDowWUQ
         NeKtGdJpz94xcSip6V9b2DSIurQ+n/+L7o5qPWApNj+aoelueHyIGI65qBhfHaJw1tgL
         bGdhsJ/8N6uA0IenWz3EsqyoipI6LM/9cJvLg8qfs6YYS/uoKqy4AuBag3V8R/Ctflq8
         M7zQ==
X-Gm-Message-State: AOJu0YzY9TQWWQhHnnGn0KKou5Ae63b/P+2SpBabB7oEs9pQtlIBvGiH
	8OtvzsxqOAFYLGzs4WLciKY1RP9DFZzcxvLXmLl5K5FBJZfpVTJH8JqO1grfHiQbGB9Y+cEoeKT
	M0cPL0DaIQw02GuHHBfvNqL6KW+2t2+21o96Jf4y/BT6Lu0j1j8OcWisT8TneuHMrVw==
X-Gm-Gg: ASbGncuPpjlM2PdH8K/vP89RP/R3itw5Cf7QwabqHQgxSL4supfAzHGC7jVhk9dr4/g
	zU8s7XuBWhxPHLxxGEGUNW3xkINvF+B/gfxO0wY8+XsH0ruoAEOjeAdEFziyN+DSmD2OQhTgPG8
	Kkz6Y4FAPQGSLUDyhaHIoOz7qtYLMQohCVB/wm2ZY38b0ea4dgrbCU7jLAh9yj3vO5k97sE7eCO
	lJZciO9zwrtOsUUAc6Pn4JqFfYdo1Mlc4/rEakOlaefOcMAkzmyIxo+g+XOg4ywHL1TVgtKBDRV
	sYztb+oYj/lz6OK/5oX8pcQbvx0o+d3oHSuWww==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847327785a.7.1748511088819;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBbOrTOd5S0R4NHuiIM3rmHA/A2xeyEaZjKpqahVp5pD1+DlUILFY2WUrOeiPk48+sME58JA==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847324685a.7.1748511088454;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm1414133f8f.26.2025.05.29.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Message-ID: <3cdda3df-a2ab-45e9-8e40-988310c759d7@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:31:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ASoC: codecs: wcd939x: Drop unused 'struct
 wcd939x_priv' fields
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
 <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OAuoQv5uWyiLK1nfQTWIuOfr9WMNe_n3
X-Proofpoint-ORIG-GUID: OAuoQv5uWyiLK1nfQTWIuOfr9WMNe_n3
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=68382971 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RFI1buZ0A4s98qjrA-8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfXwdzccynNIi1K
 dpa70gIrYfHPHIYlqNseKvRU9RyXOLn0p2ctiSR2LRgZPoC4xlMO4H4ELU/wRga0x38oQiTiDlB
 BCPj5m8ZU1GS+r2oCpBmLLyZ5YViQkSm+QQyYlBoTrhUm4sgL9xFM9hLXscy7pF5jVFMbeQownS
 by8ScloiLJOVZ83bep3ndoQpORSwZ7q3mVszAiIsGPA/R2ULDlZRtMvVonxDWQx/ed5AXaqvdp5
 Gcs12IUpJRFbMHnB46PI3QvocYV7o3Xh6gcBRFOQRS0K1odeohgh/3jdfvUVYkyBJFp5R4O8vZV
 VT6K3tljqf1DCIhjPhfMex9vPxrVofWp97Up+h4cXqFY2H45l5p50JulVyOFaAiK/hk4awXy7yZ
 k7VGH7+g0BGT1lTGcL3uxusmYRwexjewlIgNR+eMCKOPKxaA/ZZt0dagkEoiJ9JSUMc2HB9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=827 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd939x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd939x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..bfd4d2c8bdc9bcfcdbf673d20458f779922eb464 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -190,10 +190,8 @@ struct wcd939x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD939X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD939X_MAX_MICBIAS];
> 

