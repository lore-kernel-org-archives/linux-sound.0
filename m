Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8178417BE5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412847; cv=none; b=XBkddm86kdxCIthVOzp9hEb4YKKrsnJPueVB228kQo4NR62rkNNaMFvRcOeR15TxDm8U6SawA5qHhHet+W2h+FzHxyZUoGSVziiWiXpVsIRI4WycjppulF0EiiS2L1XFj6DWeMf1NER4/Hb/gzG7VW565xQ1z+bZWuSnRxcg8eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412847; c=relaxed/simple;
	bh=/iSzGV52+3U2s77RWrfVZYZelWGYnoZNGDDuhVf8W5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0XWALX03X7wAFP6tlA6YfePEC6HTKrLBRb1g+drowsSvZlkBAH3n4I4mdd8CSImOUVjqjpJiRhXkt2UmA5/TAM0+fFEElwVutE7IRTZvC3OpcZ/bRRKEohkJCv8eBdEBl0P20CGRvFlYwEGhDTmvfNp9vtrm/zdppme+q6az78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaDMJ+HO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaHyHSPu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaDMJ+HO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaHyHSPu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2YZw735282
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=; b=aaDMJ+HO1KRcD2CI
	FR5IUteiUFZPJ68QAqKsp970DL03HKkjvsC3WVx2Ukz23MqpsRZ4Y9JNKxfb34uL
	exE6HLAxVIjWCGB/ZIypBmrrKG62CuLDZN67IYN8DUEQW7eNzLXHhWOLIVXym/l1
	xaM05V3FA2cPi637CVxiA3AoVZWQXAQ22mjyhJXD3gxYB1jGIJdRXSQjUdZdMbFy
	+Z0WoFbjc4RgFKQsRiNKXJkupvDINkSP/wmaR9+Xz5Jv0ZTL0kTtyQBdq6vefZHO
	D/e4ptbOGDGKSf49aAM2s3zYwBoVeG4esKGmh5s0zUdRuD76O4fsvzxJfHHvLHAf
	b3TMHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr4a2gh70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:00:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so17456271cf.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412844; x=1786017644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=;
        b=iaHyHSPucIr4UO6nO9QKM0o6ikGymrEdmMIqH1yGu46Wivc9bm13/EyBmnPphpO+RQ
         6JIIzcCz8MVU6euq7bXcQzI8uk0i8G6Kf9ZTzhrudDmGDs/3+KUJ8YecRscg2pUdIdpt
         0dOURtldNPrrlXhPQq0niYjiuZbm2hsgyHphigSzzG6vMDiy9dzigeR1JKvDMwuNzs0N
         xcHvem8s34FfbNGMb2eU61pvVAQH3Crs8KeJz8mlGIqNzx0EiZbf5wa2Pst3WWsoGU3k
         T1v0VlFG2Qpz+NoZqj2BRsi5/AeS1qjwyXTo6NYnQ78q8vXsQVZAZmlrmlPFyq26aAOJ
         1CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412844; x=1786017644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NtWAH7jHzFcunMlxmfj1lEq54XTtktQ2j6SycD2aU4=;
        b=nvPMRe/24gpdUVBRLBDk49MhNtDI2xOdWB4vQg3aPcD2QeVleuUYEl1o7tDr7Ek++f
         wP+UmJrxaQOE+6qAbWcf4jzUza54a1q3mtf0bCoozy5BJLu+te9ukKhm6CseHOJhyT89
         QXlc8mxHAgGWQpKM0wsgKDczobfh4wf7AK5VVTrUDwBIW4sPLQ/bkJWH9U/o03LrzVQm
         WhFAtks0P1SH9Uz1pzZMonlTxCD1XneIkc4E6GQbQ8cKYawAWJYjY9uTJsdC10R0jn8s
         nyxB+W8RbAAwd27JM3XNvT44aLCkYwJHSRXc+WAnmaC888yo6VP1bFQ4i5Ddg3BloHnv
         W4Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrafCqXrxIav9/CkqF4tKOr29ItVR5VLvi6PodApeSfFVSscYlQnEkjdYq6ci44zddqguZ0O270yM23fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVt/YDniMDZ1SC0twQRSkHqqbRnwJKCjZX/cl63loLdtu5q9YO
	3qOX8K/UF1ScR2evvgd6Htyk3MPYee2B62ALODVY77oJWRIAyRoupYaXeCK8CKVUqEWOtXonljy
	qqcqz60/ejUv5a68JFC3DbuAntcr+pgzw4RDOMJtR38lorVydVb9wduycTzeE3mSIxw==
X-Gm-Gg: AR+sD13vwXQ3xgfycSK96zLEbvTmxQCobmGJ/Ebu4MUj9+gUkL+duBk28YwscMmDCzB
	l+fvFayovVV9eFuGnMBeJaIxi8bysFIiXtTnyrqq1KexLhnQL7M7DC/3m4EPyxe4+KzfT+i0epr
	tktlIbe+pQB5sSyLEkDvhwS0TQfBd7pmzQx+F58oruEI9ZeFAFgb1rDVGw5ldVCRICFBQWKvsAi
	wJ+8akvr8538V7V/Kt7/bw12Ga2DHVAGcdMZCq0DynY0eIseYGP7cR7n/h/AZw+dtQaKsRqyigP
	fDhXcsDoflj/ce9IOCp792X3bpYq3KANGPbDJz9KfcfRu/WACf5Au4II9n6Vn9O1rxI8y1c1yDl
	f5dMFuOabawREymSLMdaI+Jp5IRo=
X-Received: by 2002:a05:622a:22aa:b0:51c:7b13:62fb with SMTP id d75a77b69052e-52b3874b665mr22517371cf.81.1785412843661;
        Thu, 30 Jul 2026 05:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:51c:7b13:62fb with SMTP id d75a77b69052e-52b3874b665mr22516521cf.81.1785412843064;
        Thu, 30 Jul 2026 05:00:43 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fa857c8e1sm61431466b.19.2026.07.30.05.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:00:42 -0700 (PDT)
Message-ID: <8f41fc3b-04e9-4e8b-a07a-d2837f569b57@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for
 LPASS LPR vote clock
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bxNV4h_c5k7prr0yMh6OBQomxdeYYYFH
X-Proofpoint-ORIG-GUID: bxNV4h_c5k7prr0yMh6OBQomxdeYYYFH
X-Authority-Analysis: v=2.4 cv=IoIutr/g c=1 sm=1 tr=0 ts=6a6b3cec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_tC8s0EdK-zx2rgeGFIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX5ArpyZMchtJD
 RhCOc3lGs05dxxnYgGdng436srK/cXXo+9DTX6VVtz8DETqxD9Nmg2jV7A2z+rSOTmPfoYTMy3F
 G7zYtmrRiM1rh8Rk7J71XPy1gLlnSZlMkAmAANrNOY2SGL0H9SP12C1AVNTusl8V1vollkB22Ja
 7HUZ7vp9aVdCDNdtmSp/N1TZ8levC1RGn+vQOLG6mi3osUtEkb9W59nGdEBAsaXlVEM8L2OMctE
 SmoROR3jg5gAAA4UWts30HTBjvyTLBUo8BPW8xVSLkdAhC4VDgLVe7q209XBSYAnxVuC2B3x5GY
 o6tDBxo9Xj9qGGeNdLcJwZwV4CrGr7lBSuOLTPGH2XwI3iJXkk0XTe32b+v0ws/QXu8WLMKA+q/
 5KwUSZJ8N8YIUgAy7wpepIqh0+ACDS4V/h6+ynH+7QNpXiepT1z7ixFKe18ZpBAWgO92k24/1Y6
 6EkflqtTFN2chlTNN4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX4bK6x92DB0pg
 M9Sl79ox38WwVJiDTsyTKSfv6FuoClAXuHZGCTpvWle2aRD9CK7GooQDtcJEfEWNygM69gdK/6M
 N0CTXS1megWQfXDpztChu9bQnOaujHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300090

On 7/24/26 3:17 PM, Prasad Kumpatla wrote:
> Q6DSP_MAX_CLK_ID defines the upper bound of supported clock
> identifiers in the qdsp6 LPASS clock driver.
> 
> Increase the maximum clock ID value to accommodate the LPASS
> LPR vote clock identifier.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> index 03838582aead..ab7d20580638 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
>  
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			105
>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>  
>  

