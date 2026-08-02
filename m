Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD734A78E
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677423; cv=none; b=Hb/AtZBEDbRf/kbKid0PaP9XCvSYgYJxOPzsDHqlXeBHUpW6lwTnmdrndHOTJd0fkvXmEpQU8Ctvxg3mL0gaH6OWtyMxnQqFuW7AxhTeK/D7GyIM3R5MMPXB4kNFZ2NY2mcMC1Cl5FjL93GSUSw97voxdyW/0G+UmlbzCx5CLvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677423; c=relaxed/simple;
	bh=6+MsTxqLn3+j1CNnnq7//8dYOGO2DnYXhvIoC/Ul9lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b38zuvgv41KAj01gX5YXFkR3BAZDNWnbXhd/StdxtIZE5tJsOz9ndaignNJx8yB27VDpm1BSJakcdduCJQ3WA/m7BIp1qwX2kNE2vjBI10p7B3a2nq9spq90QEk5Z6RzjMTBsHEWpGrJo+kT0u+FY/30EXNI6Yi7T+qA+5wVwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJek9/6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkN9pVOU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJek9/6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkN9pVOU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6qA51791424
	for <linux-sound@vger.kernel.org>; Sun, 2 Aug 2026 13:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BH01Edhq/ypeap0BG3p414W44OzHwtPMsqAEhHXxmkw=; b=AJek9/6iqVZvx/Bm
	cPQhMoV78fr4rY2+r0+SjBgKb7ErfWC/EgzBVYUNEnwd+W2aP7pMBBbinn19o5pR
	AF3LjtMxXawtKeqyK/BGOMj2CyUmmfW07zSgOEF0c7a83Tlci244B5EPZiqbieFs
	Fr2/MhDRVHcmFiKi7H0otfsJHV/dGzTr89OY7Hnv4+BNGRNJI7YuN2V4VUOJjb86
	8SNeenjNEwwt/Rfrmh1scLMrtrem3HdjfwqAN9oXACEhqq/O/mDnnkbRKVXNbTWM
	uFlRiVwdSVvQWL2yOJeJun7NaBHbLHF0x6I9QzJ8SPafumPXbu9MEjhTPIYDxjSJ
	PN9zdA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx2xkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 13:30:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef8249f73fso47055276d6.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785677420; x=1786282220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH01Edhq/ypeap0BG3p414W44OzHwtPMsqAEhHXxmkw=;
        b=LkN9pVOUvstzQuP2MEQ06GcLP3WBx3kKXeEIlbg+kXyQyoYAtiaORBhyRp02H5cCJN
         8EE8rYH8l4s2uTYMdccwB9IM+CCm1Cya1JNnoV/e0G/94Cplyv9K0IgZ5F+uA4e+8vHq
         f66c7tVgZQFAR6SpEVSg1AW7j8rX4qL+iwIsaotuUvpUPLBk+QTBaQ6vLkeTHYs8GO8D
         4QsDGTrP/vvbwrqPZ6ia6ovpkqjoJcngVXw86p7kG3r/HKghV/Mc5tXIMIf/lP5QqWt+
         WUQF7rnlejKM9XHmFLaOccrD/K1xDkos6PbXpOXREOmmW0EULJ3rBaL5SyZKAoLmOdaz
         /QcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677420; x=1786282220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BH01Edhq/ypeap0BG3p414W44OzHwtPMsqAEhHXxmkw=;
        b=X5EOzjuwvM8S5omEM0yPvZ9pynG6S/fK22Tn5rn9WuAd9D5MXbz40SySgoSxYmj8zA
         GLktOMNLkJwdB23sYAMKVpEVbZXf2UtfSTgiqPP7Hcj0l7KQJD3FtRagen1LBSfPJA0I
         bwNbyBbNNf7x46AeEakooc/wV/DdYpMT00WsRMj85Dks8ylI9yT+cTEJU5BuelSMG+kw
         eQb0EFyvwDLywvTLCLzIfNE8SJA/0yVmLJW9msOUqjHFYNu89aDhA+uDoLBMWGcx+f+y
         tbHMNF46MH6Dk32jfnVXgXfncPxLjbZgkUlP9Tg/7L51mgDl/7aMNSfujbfnZ4YyNjys
         1bFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpojcMshlxpbqXluTgqFxJtJeuS9J5hFCQ3RKHohLYGNPtc/yimpVYsBCzp3YcfoEJiogdgnFvyzB5DBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwXLiaPE1rD+KfAFyzsS0QspvuC5ZRmsMrFcHheL/cTfcwUfvL
	7fomJ3HefTPOPnDjM+TnZD+OO/C//0JjYetdKZ0+8OPS8b115injPXRx12DuBZMe3llaS/u5y2X
	k0N1Msb0dC3J3GOIhZ+Hz0ppW3X5DrKIaOYU6fAo4zxXNx5jdSG2ZXa67zDqFeW14Fw==
X-Gm-Gg: AR+sD10cByuOeBoz9nkPlfDekDIuPrgojz19ocz6MSynb2qQ5vJzz9+RAt25XLYMqZz
	2UyLfHMLsPXG3DnpfjvkyYQLRcYlMhcdFOUmUtdNMpCZdJef73v+idmnDii/jQasE6xb7yjdmtq
	K2rO8N5uwMYsMeEC4Av3qyLk3WvFya+syCxk5rWOJU3lmDLMe8zjbQl4Fdd4Kf3it0J8xzKzUqn
	Hn/kgA28kiAzMIbIRcWou5K/qz374e5E/Fvt2FO/RoGtORrx4ymkiV6+C/3a5vzZLHE4PD6ZsCX
	hN+Kl0OB6jflvbDQyDIdWwV7eqchwvRTLnqHRKmKiFuCVZHd9+edrXVQqI/1bYdqewKNUGIq7XE
	9lBQ0ijKno9yfKOCNjnfQIxlXuyk=
X-Received: by 2002:a05:622a:230a:b0:51c:8571:1ccc with SMTP id d75a77b69052e-52b567f2645mr142671831cf.41.1785677420040;
        Sun, 02 Aug 2026 06:30:20 -0700 (PDT)
X-Received: by 2002:a05:622a:230a:b0:51c:8571:1ccc with SMTP id d75a77b69052e-52b567f2645mr142670611cf.41.1785677419490;
        Sun, 02 Aug 2026 06:30:19 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49808690ffbsm157118855e9.10.2026.08.02.06.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 06:30:18 -0700 (PDT)
Message-ID: <f24e2ad7-520a-4a19-9ebc-5771703de22d@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX0vofdsltRFy0
 weEAXjbMd00LbpepfzshZCNHuS4y6fbo3UDJk6j1ZTQW9pXUgU5lYUfH9bNHXMBrABdnuWwDyf4
 lBSRKomYkb4b0Tl/kRZh49Vgx1wD8PMCMr4sroRq2Ko5uxxkRaGBAPej9Q73luUonUg/epj0Ztu
 z3bfBrAg5Bgas0mAVz4RoGsgDozx34F1Ru5I7fkrJfVg67hQTeixntYu6RWQ1Kq1dHsPB93wMYw
 s7r1HsZ+yjFF94+4fQydAEvs3d1LrYGgojTBlUa+WGkW6Y0IVwgRPUIDj+IGgDRl1lspWcve4i+
 W/70TK1vR98fQaL57QN50+MTVAInvBGKjQYIVtger+HGibd9CEWKjPFIgfez6N0U4RSUg8DnDmg
 LqDLkpzRF1aoJjjZbAlLlg0RvfLzzgG9xPi1J12GLVj4Q2ymjeINCYY4z5WPfF1mUmMLAGq47zj
 CzCRx4KMq9w5caesUaA==
X-Proofpoint-GUID: afhNPMKCGCKZATWAzrL9MNHUVKxMccU4
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6f466c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S0i2IUftuXgoZizot94A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExOCBTYWx0ZWRfX9LE+qnriQKAa
 ngtUiQDrhXGd6Mrx6tO9wpeR1d03Rgg1IglwAd7TMijmLeTp2wtuWX9DU51RKUX9ufjkP4ksIBP
 6hL/Uf8zPkK8sTtlLJrWezhk1fQQoOU=
X-Proofpoint-ORIG-GUID: afhNPMKCGCKZATWAzrL9MNHUVKxMccU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020118

On 8/1/26 6:46 AM, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---


>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 7b553a73bc92..fbcf1ef9ce22 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -233,6 +233,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>  
> +#define LPASS_CLK_ID_INTF0_IBIT		71
Patch itself looks fine for me,
But the naming seems to be bit odd and misleading,  what does INTF mean
is it QAIF or some other Interface.

Please prefix the interface name something like
LPASS_CLK_ID_QAIF_IF0_EBIT or LPASS_CLK_ID_TDM_IF0_EBIT.. etc.

--srini

> +#define LPASS_CLK_ID_INTF0_EBIT		72
> +#define LPASS_CLK_ID_INTF1_IBIT		73
> +#define LPASS_CLK_ID_INTF1_EBIT		74
> +#define LPASS_CLK_ID_INTF2_IBIT		75
> +#define LPASS_CLK_ID_INTF2_EBIT		76
> +#define LPASS_CLK_ID_INTF3_IBIT		77
> +#define LPASS_CLK_ID_INTF3_EBIT		78
> +#define LPASS_CLK_ID_INTF4_IBIT		79
> +#define LPASS_CLK_ID_INTF4_EBIT		80
> +#define LPASS_CLK_ID_INTF5_IBIT		81
> +#define LPASS_CLK_ID_INTF5_EBIT		82
> +#define LPASS_CLK_ID_INTF6_IBIT		83
> +#define LPASS_CLK_ID_INTF6_EBIT		84
> +#define LPASS_CLK_ID_INTF7_IBIT		85
> +#define LPASS_CLK_ID_INTF7_EBIT		86
> +#define LPASS_CLK_ID_INTF8_IBIT		87
> +#define LPASS_CLK_ID_INTF8_EBIT		88
> +#define LPASS_CLK_ID_INTF9_IBIT		89
> +#define LPASS_CLK_ID_INTF9_EBIT		90
> +#define LPASS_CLK_ID_INTF10_IBIT	91
> +#define LPASS_CLK_ID_INTF10_EBIT	92
> +#define LPASS_CLK_ID_INTF11_IBIT	93
> +#define LPASS_CLK_ID_INTF11_EBIT	94
> +#define LPASS_CLK_ID_INTF12_IBIT	95
> +#define LPASS_CLK_ID_INTF12_EBIT	96
> +#define LPASS_CLK_ID_VA_INTF0_IBIT	97
> +#define LPASS_CLK_ID_VA_INTF0_EBIT	98
> +
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103

