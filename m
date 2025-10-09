Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBD2E5429
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013473; cv=none; b=lhZ4X4EF+Sor+I3ALCNsCp25F1Dzv38TM3+i5TAIS3s4I7t/y8BR3ErmTCEVSJdjYTARlmqhZlEz2QkuVSqaAMp4Qmsk8aRT6EOlr6OBXaqI7a1aupAqvmMZRJaLHaaECrGTPnwEbe4lz6K5/ia3AloUzCvLWkD7JTtr5ORtokE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013473; c=relaxed/simple;
	bh=extWvGEBxrY3ETxBN/CqvhubWG0rD3e1PdiYCRNJwW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN8m6eYuEwEHPzpP5d6t9nVKp/LrlIQ2pCgakcGuKFDFZwE+dPGtEb+DajxLf64kt1DblPCfPTgMyJ2SVwY/Px16+abO6vq1gbVOdklzWunbsgz7PoliLKpko6h4qPsYzh1Q+UXxA7ybX8U/IPtfHQj6XYMljnu2rx9BYCBQ67g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abuXGtr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abuXGtr4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ELoh029472
	for <linux-sound@vger.kernel.org>; Thu, 9 Oct 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt3cDHWikNa21LQEjco3qqYXJZL0zCP7HIhZv/yAhcQ=; b=abuXGtr40tJ/LEyX
	T4LQemW84W7rh/tqT9TeZk2JdMoV3GsTkel/FnLrMiRwXob/OBkZ7/k6VNt45/ow
	K6UnepOFS11V/N24CDj6Yzgeej/4imHqk8bGlkV2Q8iWzyftSp8WvIaBk3pxxu87
	E6WbuLSUSNqSfKDqnYm9CIdJnTXEFLsuEBFJD0UVNGcK/dbrNrCZ8M+Qk9i1926e
	xzdzAOTITSGgLr/DRoKLSi76R2y2nvU3ric1w70N4R5ipvmcrsh8OO59xuAHagm1
	0PYgSWbH9BMufm1eK9MTBc5/ZX/nnVyd7eoIaJRFjp+U/Mnv9JMXfvmM4TpsEJLo
	i+vF+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4njrm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 12:37:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85696c12803so47389985a.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 05:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013470; x=1760618270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt3cDHWikNa21LQEjco3qqYXJZL0zCP7HIhZv/yAhcQ=;
        b=cA/Itn2J0vxEEYY+at6UFkitlgE6+cNeyzfWlV46Hi/ZKgShLebQfN4OvS+7fWbtaW
         7bKgO/rmnJXN0182BWFOgJyNkCCgVTMsFxLA5XyAkTXzNQgd1yARakTDopP204Wl37pc
         YxTpl14pyMAb/njGgAxCahTb5qih4LejWloZc75Q6ZC/WHjkbs4k1kr5FZclv6GY5Up+
         mkiA6WgWKOk8v72gAle0VDSkAVNIqhtijkFwKUPgB5Jyu32Zwk38qDOkDfugfWSLoHYS
         XhBwuDs6f7j5H3VubHMbtcBWptB5sovSY8crQ4f1xWdY6nrRn4PjH5Z8ELiuIQ8e2iMU
         /Ntw==
X-Gm-Message-State: AOJu0YyHfguPGN0Jl3BQX1yNK8F8MU+3YQ+IVwyBzVIe5tA421v2xkaV
	On8BsKJA7/WAP8D3kRViiPok5BXVzUzgU7735V7lZq2blBVBxYs+IdM+nsC6HKsUVCfrUoWJFC5
	Tfdi33FIOWYDbhEU3wFTfuZoeH8YIyYjpa95T3qFNoBsEhsi1xWp/IjVPV03m5/QOBg==
X-Gm-Gg: ASbGncsaCtgLMI9kyJ7gtyRTNcX6nGy0wK4QoJpWmH8DxZZZzdxlq93Yz6ASw4PoKQc
	Nk+g/DNIN4iRN+88BNeLNN/P3xcQ+DxMW9+hBnCQZKani9/VWpvg3z+mocxPN6q31yGj7V4hdb7
	TA6CAkPA2bMkkHhlQSFTmWD7V2TDMDSzDpINgK7ZQRn/e3d4ZwMoLPgSUl2UBMy/pv8CkLdiMED
	geYnb65gED1Z91nREkYyz6AkynCsvccOHJo8rlMgEE6Bc+DqbhOcPrlLtc1Acnk69jUNp5Dfblv
	O3Tw8zZQPMGa/7GhIm5AbsOCLAKVhnyRlq2pWoAE1OaH0QvWOV0D38tMeGNp9No6umiuR+nmqUp
	HRMoQgq85v7VN9vj2UpiG8ePK+pE=
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr638940685a.9.1760013469896;
        Thu, 09 Oct 2025 05:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCPlbTf9kz9wyqlteOqkK6kI8LCXLa/DHZ3rb8BsF1nhSSwC936OYw2CJ8McbVnr+gjPtCUQ==
X-Received: by 2002:a05:620a:17a7:b0:812:81c6:266c with SMTP id af79cd13be357-8835420965cmr638933485a.9.1760013468748;
        Thu, 09 Oct 2025 05:37:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e49esm1888759866b.72.2025.10.09.05.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:37:48 -0700 (PDT)
Message-ID: <488d9182-175e-47a9-9dc1-f43753d6fdbc@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:37:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] arm64: dts: qcom: sm8450-hdk: Enable I2S for
 HDMI
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX19Gs4K8bn4XK
 xuQXZavJ6ukgbZftiICBbZQND2bLmEHRE0EXkQpyvM2wW5m/rpWPuELnwtAnHpkWcnnV9VDVrji
 i64ty10oTZg56JOsX9Bpzcumej2fvTlC/544fnscmuYNVlfUSulxfAhrbL3VzpzUyEWlk3/OWwD
 yhmt7g9sR5A2vC5QMs1Ag82U1iRrgiIDf3N5qSGZaGdIMritJ4X6PYVnH4R3DhOFAsh99RuWegL
 lngd4qQu/2K6+5+Z27hfWgG64MXB1oGkxRYuB39QlyxsdHKHI58fcrtjPx/MVbur4JToEwFlKAw
 DO3WVN6W8q+VDGW6JgXrS67bW7Gc9WC5PSvEF+fDsNpeopIbYt9YFsw5a9y4TpIF/xbRIkqI+xN
 4H6KoRnxV3/p6u2HcuB3qdHYVJK1iA==
X-Proofpoint-ORIG-GUID: i9h8NftYQM-of0lwX-AecTFoee7RL59s
X-Proofpoint-GUID: i9h8NftYQM-of0lwX-AecTFoee7RL59s
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e7ac9e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=m35xbnh7LrWQ_H9zj4oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 8:56 PM, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 26 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 0c6aa7ddf43263f30595b3f0733ec3e126e38608..7b822086a57c600ae9b5668d6d7a375d0ec55fa7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -667,6 +667,8 @@ lt9611_codec: hdmi-bridge@2b {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
>  
> +		#sound-dai-cells = <1>;
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -1016,6 +1018,14 @@ &sound {
>  			"TX SWR_INPUT0", "ADC3_OUTPUT",
>  			"TX SWR_INPUT1", "ADC4_OUTPUT";
>  
> +	pinctrl-0 = <&i2s0_default_state>, <&audio_mclk0_default_state>;
> +	pinctrl-names = "default";
> +
> +	clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names = "primart-mi2s",

"primary-mi2s"

[...]

> +			audio_mclk0_default_state: audio-mclk0-default-state {
> +				pins = "gpio125";
> +				function = "pri_mi2s";
> +				drive-strength = <8>;
> +				bias-disable;
> +				output-high;
> +			};
> +
> +			i2s0_default_state: i2s0-default-state {
> +				sck-pins {
> +					pins = "gpio126";
> +					function = "mi2s0_sck";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

I doubt output-high for a clock pin is what you want..

> +				};
> +
> +				data0-pins {
> +					pins = "gpio127";
> +					function = "mi2s0_data0";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				data1-pins {
> +					pins = "gpio128";
> +					function = "mi2s0_data1";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +
> +				ws-pins {
> +					pins = "gpio129";
> +					function = "mi2s0_ws";
> +					drive-strength = <8>;
> +					bias-disable;
> +					output-high;

here too

Konrad
