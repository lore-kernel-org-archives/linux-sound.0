Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C33955F5
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166086; cv=none; b=KX9wm0TEuhmhDbu/0yaPtKYOOAvq1L7eOltF8XlkCZYIHnsGOBHXCylg6wTNMZVV0rAfRpYnGqTgsV4ec9IG3jdBBxEPSwZuZ0wBa2J6U1mT0li9MAieD9g8IKarknZGfY8OddANpOWuFqEzGooA0jbvoL9BXWDKf7t2+5ElkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166086; c=relaxed/simple;
	bh=ngaxqFOtln2nHsPTDS+hFwh07MaPzdPzfMxJ6KosXBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7h4hMQaFvERLe9ggWmXphpZUugyEwXpd31k6hC0LlsEYyrkvJAE2guliXdIIMWpkRxbBTqregkwW/fRnufHR02hTBplvOSnk/D7M6KGvvqPBAwGG68v7/YM8WObVXjBgfH+lmST6v9g3CNWTcgO+8jNHptg1zz5BBQxK3gZ7TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBUHu++m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shjv13v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBUHu++m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shjv13v+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldIu4115129
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=; b=aBUHu++mZJBWylru
	65PtEuN/p9e98wNE8PWt3MmbcO2T0GXJcoWxacD5oacEc7+QAUpMuI3CY6ZI+VhI
	JPCgpNfiURepy/eFjKwgUB9FW3uUUPE39bqXZhL1R50cI1210MAJg8OPnjh8ig1w
	P7poJ0goChEyo5mUMeplgvGelLYGNXX3FHFHNxCseGa0RBNeIK92FEAd84jpNAn7
	pCmQwZ9TiJjEKD6p8jCCluwUGNYMoP8qFow2DLtKKdUKw5cOYT8P/LPzfmkUXlNA
	zjjp8HaZcF2alSIqOgff7ZLCXyIs8mgjI838cp9jY/MOES6dBYVhHtI0oDhJIX1B
	srxQUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsfqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:28:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3536147a12.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785166081; x=1785770881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=;
        b=Shjv13v+iqAXCxAPp+WrN7J2XWY/kF4SCn1HeoP8mkOM6y2ZjfFNlpazHUDuxpfiXc
         ZHwVJe1SvHAy34GC9BItsBqeAWrXEEfLlVKADQ5qV56OFwaeheyk1kqBDE452FvpLvrB
         ZlY2SDdBWtKjvDYDCARFtggUjsqj9fRbcD8vTNzdu8SOgtsF8Vj+v+kTlcdHLrH/9ZQp
         Q6ybt6WAz6hV3klsOAzHLJ6XiyFJ+MQw0dsj6KEUROjg/klONzwfZULlx6645vQ0x2wZ
         EtmAeG0mY1tsLmV2Ah9FB6VyLT+eud/aTOHIRpFvxicrJ9hebTKFkYNSq2YfmJ58S0aX
         hQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166081; x=1785770881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=;
        b=hEVoK29U8Pav33z7nP6JaGRFS55YoWD6HPUTxhmdT+XiBEUpQs+RbSCUw9AERfmV1/
         MPfzyLlXk0PLYumYcD5h+3Ea/MfNzhLCm/xp1jfrUPsRJzrSbU89xMD+sS4N7mViAYpY
         45OjSXr2BCXPwau3Yn269C/WHAj3pqhdQxgCgdnBI8w8ff3CFgxneG4G+W26jxeicfQR
         lWyvTa/i02UIVHurCpWIT3gK/hAwJ2sxyZGGzFsm4aFobKl4ePgHZwdbNmXz7imG5UMv
         FTpNDx76E4Znaok6iyZdBwBFDiFzG6buKIt66YgxGc4SXOEugw4VUoCjpIkzUi3O5Rsi
         GaiA==
X-Forwarded-Encrypted: i=1; AHgh+RpU58FaSr3QPC6eIqRddkHZRYFBf0g3HWfvcaurrPF3IZft5j+0fLrHFpzGfoDdIyIXMdYMP8dVRWo//Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qubGQ+1XDwcqcpBd0Wr4CTQwI1VMdpoBd8V+xPrFmSFMwB+I
	iJyD5j6YOoElJwjBjFj3f1Qo7ou0IspoYoTt2vqgzrEY5Od4ZiFxOp3rXz5hqZx4g9oWyvtHhBn
	oH17pneLq2IJUxOgv79K9rHGfO5SSJkwSDumRCbX3cxTXTVBLq8qfPgcSve+FagjSRg==
X-Gm-Gg: AR+sD103LImpZ2SPI+9oG/nMhVJki6fsTIEHaPD5Vj0SHUUJrpohlV4NAUeVv0FkKsC
	QkeQuGUVMgPD9gQ9YQo6GR7vd6vVekg+JUi7EFBprtYNl2mXzJ8QkfE2bMKb7ehxIH61wjiK8zp
	X1oeCzPgnefXCJ78pjm6tvik+L3C67pFMnW3rR6wfXjRrqeRyz9yzM3SHtpobdPoTcq4eONKLOI
	9lohDzuPISeb83/rhbhBnwvCwulO+7Oo8izVTyzXwjw2dFhZ81yT6PB+T3BXH+Uw4nil8Ik1Zgl
	AYB+ZU2AbK2VUVrKjVxxWm5FDB+xDyyno+Q4j5P+PaohbAkmNag/pJtS4pqhoWUT+yQwG+0i79w
	FhBmdPvROiKvdEbM6IRd2pf/b+qRJSg==
X-Received: by 2002:a05:6a20:9397:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c67e163784mr8639454637.68.1785166080970;
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c67e163784mr8639426637.68.1785166080541;
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
Received: from [192.168.1.3] ([106.212.244.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dc15asm3383903a12.30.2026.07.27.08.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
Message-ID: <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 20:57:52 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX2+E+ouv5jjPG
 VtSv5rBZ2dVE1F8/zYOUz0S4un4XgLCWEbR2TRmbuWxmFwzKwSI8c6BgURMr0zkFBtYM7Zn7ADq
 Lr/+DfqrZJiKdIu4I+m5+BORR31Pido=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a677902 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yelsqLKVWbcqNe5dfEYUXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KLQR4twFUm2b5WDXR-sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Vcv94JVLf7r8LZ4KhjhLenexsAFVJBMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX9wr8+12g7qWg
 xTLQv7gSIOf1EppLmYHyBgZgrFZabJaC4ilS2BaZRxibiGkCEmRcJz3TD5LbXF7S03S2c/PfCFx
 CjlBOjeASKOhDMnzj4VWrqOev4eLcC8jQjIZpPGLaXQ588xzLE/RtKCX/7knehvSEVnir70m+Bh
 Dv6CMWQFUF0sDrqDppXtt3tTgFPoLkr5ZvWtGbFJkQBsaO1wdcZy3uKfjZmXwJHavsmQdDLh/eP
 PpHVnucp4i2iZv8cV1ui/p2OfT5S/Vo2EHgQq9dGrfMSt+8ATSZrf5HTI+10nEYpHf7U9GmqPyH
 sFvq8pmUglvsnt5aEo4RK8LXc/rmuUK7YqvuL0QnE/uwXNhTzpm1nFZ01qygdStfvL31Uv2M4EL
 4CIGgv+pqNXfjT7+FuUDJzpSRkWEyvuu+B1nOSREnUJK65NC+i6IhpbJsJ+8+hoEwIkkHgQBKVy
 bX4y9LADLxki1jB/Uvw==
X-Proofpoint-ORIG-GUID: Vcv94JVLf7r8LZ4KhjhLenexsAFVJBMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270145



On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.
> 
> On platforms such as Monaco and Lemans, third-party codecs are hardware
> wired to the SoC and do not always have an in-tree codec driver to manage
> their clocks. For these designs, clock line enablement must be driven
> from the platform side, and this series provides the necessary support
> for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
> introduces the required device tree binding support to represent and
> vote for these clocks from the kernel.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 

Thanks for the patch.

Tested on Shikra-IQS. No issues observed.

Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544d..78587139f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,43 @@ properties:
>     '#sound-dai-cells':
>       const: 1
>   
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9a-f]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - enum: [bclk, mclk]
> +          - const: mclk
> +
> +    dependencies:
> +      clocks: [clock-names]
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>   required:
>     - compatible
>     - '#sound-dai-cells'
> @@ -29,7 +66,20 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
>       dais {
>           compatible = "qcom,q6apm-lpass-dais";
>           #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@10 {
> +            reg = <PRIMARY_MI2S_RX>;
> +            clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
> +                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                     <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +            clock-names = "bclk", "mclk";
> +        };
>       };

