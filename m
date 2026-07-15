Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4218A42FCB1
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139477; cv=none; b=boZ12eszsTh4O8kCzLrewzhvlXe8CL8hqxPphRb/fyqQEs7e0iQJ9JbywOTmtzmULG5wh3ssZKfC94zjuo6Y+roHLvQzloEvt9apNIqrTJLbqrn27B55lMsWCMQyNrs+fPzOFKO9AuXaliBZz7ttxj6DQ7rxuUS4lfGeNHMkC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139477; c=relaxed/simple;
	bh=hEc5PN66rn79NzpBQU3rsBRq7NY/VY/unhGC5vPHt+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BenHxQ5QhwZ7JME6klhdG1GaBVDtd+smvoEIOCnGHXXL5qg7Ik1ZKYRwUnag/NIzt2+LakNv5a8410OY2zUjs39WaxQgdx32A6zFNyJTsnQHX1bChTpncmtQWsfQyvgDiXMWDlOduEBt3kq4DPxLX24yEDQfWMVa1oM6etV+Yd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNqUGHPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DaG2YYc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNqUGHPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DaG2YYc9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FHBAff014333
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 18:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXiHdssRC7lJ3rFr84TqM3Lg5rx2BEdEQ8SGPePL4RU=; b=KNqUGHPRZ8l3/71Q
	fsTtTdl18Ka17s6x6kwIuA0aJnij+/snEsrSXrijNmiwX8NzhtxK/SoA0MVrhAYJ
	G9QHJs4v85zP6i+zmKPzoFjYU9CWa1A5fiudc4X8gcjDv8asxhsn3N5YeCvUYa1x
	fczCS5ypAHg/ndY+FkmJ6YvxHZXeEAtyxYMMLlyjQtgNPPTzJMk8Tw/YnWVDAXkl
	cLAK6FMUkqNZM/BNjmN+W+7hqJKwMKnyWk20peDiuv/beN6NeZfJdbF2dAgukCuH
	8cieD2oaYkyjAc9ofbT0/Ueozg1mf/eXxgc3G0YXDQbmhBKomVWTXh52lOsEeqtB
	mu3d/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kaaa62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 18:17:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso8402512a12.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784139472; x=1784744272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXiHdssRC7lJ3rFr84TqM3Lg5rx2BEdEQ8SGPePL4RU=;
        b=DaG2YYc95p5gZ9pc181NmD/+wBHwSLeG6Ce03LfP6j8lxIsn2M7TYXSoQpnNms7St7
         ElduMvgmdN936rzsPxCJcoTqARLe2tHk2M6jjK+vR6ONoHrAZY1evaQPTq/z48s0rogy
         eWndtBQNzxanlc6mpDo2zVPrl0suflVwqbC+qOxE4kMshTkyLt15UhlrLaICng5KAoTa
         j8CeCDJ5Ve2TTSlh6xmk5ESUffCkDt7p08OZfDlaTzV7mxLsJZQF4X+2a/wlyI1gX351
         2yTBx26b3F8/nLpYgGCeYxIdixc9afkLjKbpRdYBxE8y5bK6tfOyEaIFcOzA5uUP+ktd
         RRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139472; x=1784744272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXiHdssRC7lJ3rFr84TqM3Lg5rx2BEdEQ8SGPePL4RU=;
        b=D2xtwBT8/jSgxsw/krjagsJxIU+WetHJo/7XNGczcO6WwHbwy5QrtnFBUR/uW97GQn
         +7ZKkETqoTPxTSGbMFVqsj9U2dhGopmd0ptu4PmF6R3mHiRNETtgv4ihhpCynZk/TTDi
         sQiR8daLaUbjKfOv/X7f95Z2oK3M1YIy6IjqGIpPdBS6ZkXP3U5hSqevbMvhGK1egGv/
         9YAaf4da5xUgKGRgXZRb6giaBmEFDnDozcujeb3zFMbZMUUAIugIUxP/pc7kh9yXlTM1
         2OvrzBGaECKaOFngqhqLuIW7JO7OZK7CuA+qgAOPpJcSnVTIjZZ+Dg4/GM9BevnwqO+D
         UOXA==
X-Forwarded-Encrypted: i=1; AHgh+RoAYgishJEuW4rHZU3g2Kx3WKHuNfYRD4exgyKg2epDHm5m+cw/LQtwkx5RZKtxbNNU8VRT/w8cmsC5sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJK116uPHGJrTYIxUDIhxNfENYvynoUko2q4ZFHmM+afeBXGAC
	6b69u8+chauhggl+nRP1mWqIQWFBsFOP67MjEmA/eu/rJfwFOHxEiQAmatTi00fftX/Xm4vQeig
	HnFg1AFzJy9wFE+V+5af928hlE+VZDcWorllbUcabmm0xt32Ra8JRlBF14KFde7RiAQ==
X-Gm-Gg: AfdE7cmvGIrMBbWROHKLR7sSn+ahOiy0l5Zv7X+fEbysoKYOw2VB+hQ0I9DRXmUiAwT
	pPH1au0g+sY3Srxu2im8rGr3euIBLD05C2BqhS9eQQxqNtV7l8Ls3SHm4qwU8tZUBPAnLd1Uy5u
	5TSwIkLJ+X7a1nYylrEqXCi1FmW0qo6qeWx+kYyB7IjV9hVgA9EYk0I8zWpQ1KCOIUxlSZG0QzL
	2PjicXJ0oJQPUhGQTUmG9kiHlgnHFl17mMu1UAgxlS6YqOiEsoeLXsN3jfAnkb9hQrDFuJgLFHq
	YI3aSMoXxoQZvAPLiqcdP87VSjPfobgGeWdwmyHU7wQeKGYB7I0f46utnREe+tO1gnqf0Ly8Ubd
	TrVlYhsQAn8Gk0Nv9NmaAI2ps035Luu73kcZbST2Ixh6H2E/CuQ==
X-Received: by 2002:a05:6a21:2291:b0:3b4:6f7e:d0f9 with SMTP id adf61e73a8af0-3c36c0f6eb4mr4393101637.3.1784139472053;
        Wed, 15 Jul 2026 11:17:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:2291:b0:3b4:6f7e:d0f9 with SMTP id adf61e73a8af0-3c36c0f6eb4mr4393064637.3.1784139471373;
        Wed, 15 Jul 2026 11:17:51 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.226.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fcd31sm3878330eec.4.2026.07.15.11.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:17:50 -0700 (PDT)
Message-ID: <7c905a1c-f65e-4ef5-a65c-2be83ff820ba@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 23:47:42 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
 <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260715-rubikpi-next-20260605-v2-6-67601d7a8581@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a57ced0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=n9TYrBAzqQq97mF55NlG6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Wdb1h0LgAAAA:8 a=0R1nZIO2IiU70gt1Wv8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: iUFbg96Pdyi7dAQ_JWMuwB3sI0QKJubZ
X-Proofpoint-ORIG-GUID: iUFbg96Pdyi7dAQ_JWMuwB3sI0QKJubZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE4MSBTYWx0ZWRfX6hH8q2RXz1Ps
 +2q42xMEDmWPJrY98/six3dc0MzQ7z415cFYQUp873u812glX0z+KBh7PL15K67GE5mpvt4tLA/
 nB5IwZBXgTzTX5z7zmsior8PREG8kkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE4MSBTYWx0ZWRfX+SjtVQ99F3OB
 MZwUH9T5xiAvX4Dn2vqh1pJmvCxlrIuxVKuNSQt9VmZCB1ZIjFHVI0Yf1a4T1sYLDlvSekuwVsL
 ZcN7+oB4mzw969TT7jRd1OuvMTqwV28vJw2GPg0eCTIUQT7wTcXrq7ikH1UixCe9DtAeKknY+ZZ
 nHj7ZQ+s5bquLx7l1C1HxQwP0hbrJKXcIRMvglQ8KiW9Itl8cJYu6XQEzx1trDghAjuX+gGDKz7
 83KZWPB0SMkTdve4005c0uFHXU1PXBdP69XWo/YDhutDNfmHsxtSTeLx1w5QfeQBQ3oThhKOYtH
 Vms572wNofbUm2Yfi+UQQOk6n00VuEueh1Oe2BJSTZDldhlAMNUQwiR23y7Frc4KTWOn09IX9Vx
 wHnnBSuV7ad5vUDGDDPmU/Z5pzoG+eeJ1upLkO9EkbAqaLW97No4o/Pcgxhjcwu0yBd5b9dNCmM
 MKBK4b0Wj97V9It8sqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150181



On 7/15/2026 7:32 PM, Hongyang Zhao wrote:
> RubikPi 3 uses the AudioReach firmware path for its external audio
> interfaces. The primary MI2S interface connects to an ES8316 codec for
> headset playback and capture, while the quaternary MI2S interface feeds
> the LT9611 HDMI bridge.
> 
> Enable the AudioReach description and add the three DAI links. Describe
> the primary MI2S MCLK and bit clock inputs under the backend DAI so the
> machine driver can control them. Add the primary and quaternary pin
> configurations to the sound card and make the LT9611 codec DAI
> addressable.
> 
> Describe the ES8316, its 3.3 V enable supply, 19.2 MHz MCLK and inverted
> GPIO jack-detect signal. Route the codec headphone outputs and microphone
> input to the board headset connector.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 159 +++++++++++++++++++++
>   1 file changed, 159 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index d8a9a7e47bdc..7b010823d692 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -19,6 +19,7 @@
>   #include "pm7325.dtsi"
>   #include "pm8350c.dtsi" /* PM7350C */
>   #include "pmk8350.dtsi" /* PMK7325 */
> +#include "qcs6490-audioreach.dtsi"
>   
>   /delete-node/ &adsp_mem;
>   /delete-node/ &cdsp_mem;
> @@ -128,6 +129,23 @@ fan0: pwm-fan {
>   		pinctrl-names = "default";
>   	};
>   
> +	vreg_es8316_3v3: regulator-es8316-3v3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_es8316_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&es8316_power_on>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>   	vreg_eth_1v8: regulator-eth-1v8 {
>   		compatible = "regulator-fixed";
>   
> @@ -727,6 +745,26 @@ &gpu_zap_shader {
>   	firmware-name = "qcom/qcs6490/a660_zap.mbn";
>   };
>   
> +&i2c0 {
> +	status = "okay";
> +
> +	es8316: audio-codec@11 {
> +		compatible = "everest,es8316";
> +		reg = <0x11>;
> +		#sound-dai-cells = <0>;
> +
> +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "mclk";
> +
> +		interrupts-extended = <&tlmm 63 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		pinctrl-0 = <&es8316_jack_detect>;
> +		pinctrl-names = "default";
> +
> +		everest,jack-detect-inverted;
> +	};
> +};
> +
>   /* Pin 3, 5 in 40-pin connector */
>   &i2c1 {
>   	status = "okay";
> @@ -740,6 +778,7 @@ &i2c9 {
>   	lt9611_codec: hdmi-bridge@39 {
>   		compatible = "lontium,lt9611";
>   		reg = <0x39>;
> +		#sound-dai-cells = <1>;
>   
>   		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
>   		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> @@ -978,6 +1017,27 @@ &pon_resin {
>   	status = "okay";
>   };
>   
> +&q6apmbedai {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	dai@10 {
> +		reg = <PRIMARY_MI2S_RX>;
> +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

Drop this; it is already enabled from the codec node.

Why is the same clock being enabled in two places?

> +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "mclk",
> +			      "bclk";
> +	};
> +
> +	dai@11 {
> +		reg = <PRIMARY_MI2S_TX>;
> +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "mclk",
> +			      "bclk";
> +	};
> +};
> +
>   &qupv3_id_0 {
>   	firmware-name = "qcom/qcm6490/qupv3fw.elf";
>   
> @@ -1014,6 +1074,69 @@ &sdhc_2 {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
> +	model = "QCS6490-Thundercomm-RubikPi3";
> +
> +	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
> +		    <&mi2s0_sclk>, <&mi2s0_ws>,
> +		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>,
> +		    <&lpass_qua_mi2s_data>;
> +	pinctrl-names = "default";
> +
> +	audio-routing = "Headphone Jack", "HPOL",
> +			"Headphone Jack", "HPOR",
> +			"MIC2", "Mic Jack";
> +
> +	mi2s-playback-dai-link {
> +		link-name = "MI2S-LPAIF-RX-PRIMARY";
> +

What does "MI2S-LPAIF-RX-PRIMARY" represents?

> +		codec {
> +			sound-dai = <&es8316>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	mi2s-capture-dai-link {
> +		link-name = "MI2S-LPAIF-TX-PRIMARY";
> +
> +		codec {
> +			sound-dai = <&es8316>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	quaternary-mi2s-playback-dai-link {
> +		link-name = "MI2S-LPAIF_RXTX-RX-PRIMARY";
> +
> +		codec {
> +			sound-dai = <&lt9611_codec 0>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai QUATERNARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +};
> +
>   /* Pin 19, 21, 23, 24 in 40-pin connector */
>   &spi12 {
>   	status = "okay";
> @@ -1228,6 +1351,29 @@ &sdc2_data {
>   	drive-strength = <10>;
>   };
>   
> +&lpass_tlmm {
> +	lpass_qua_mi2s_sclk: qua-mi2s-sclk-state {
> +		pins = "gpio0";
> +		function = "qua_mi2s_sclk";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	lpass_qua_mi2s_ws: qua-mi2s-ws-state {
> +		pins = "gpio1";
> +		function = "qua_mi2s_ws";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	lpass_qua_mi2s_data: qua-mi2s-data-state {
> +		pins = "gpio2", "gpio3", "gpio4";
> +		function = "qua_mi2s_data";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +};
> +
>   &tlmm {
>   	pcie1_reset_n: pcie1-reset-n-state {
>   		pins = "gpio2";
> @@ -1366,6 +1512,12 @@ m2_vcc_pin: m2-vcc-state {
>   		input-disable;
>   	};
>   
> +	es8316_jack_detect: es8316-jack-detect-state {
> +		pins = "gpio63";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	lt9611_vcc_pin: lt9611-vcc-pin-state {
>   		pins = "gpio83";
>   		function = "gpio";
> @@ -1395,6 +1547,13 @@ pcie0_wake_n: pcie0-wake-n-state {
>   		bias-pull-up;
>   	};
>   
> +	es8316_power_on: es8316-power-on-state {
> +		pins = "gpio117";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>   	wifi_power_on: wifi-power-on-state {
>   		pins = "gpio125";
>   		function = "gpio";
> 

