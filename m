Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035B2638AF
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107410; cv=none; b=QI6VVb+V3xXBzf+l0qy8DWP2dAMLhPj1I2e/Mn/gdFFSNV5FOy9EfZf+3WIZRZ/zb8ST8bw6xpg8rjuvlufccqb8KXg7fryVSL2aw1gnscClfdb+1CEUYwgvloC6ASJltWwYpigDOSGJTZ35d0TLXdxU379nphaxjj3gFGh/rF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107410; c=relaxed/simple;
	bh=faMsthIU2rKzizBdyenPntp3DnH3cLvnQOLcOERjhWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNJVdtp2ZmH8IYWH6oEapc/c66Uv19JI1vipEuvO7SD587c3VYd6Pd7CTcgDoFgJUvP0UgokfQtX8uy6GZ6qy608DsiGyuxd2tuMR3kQ8LTgPmaTdnKrOLrZ1kzotkAcwRdLiJG9XCocDPmJo7e/EGWjHFkNDqfJVe8XopCUgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWOkJjNt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWOkJjNt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AUm6Q015598
	for <linux-sound@vger.kernel.org>; Tue, 4 Mar 2025 16:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeCtW4lbMa2wB+pGkNjK1YgYQBzXYFl+3yQ06H7E5zI=; b=EWOkJjNtxIFjQ2eg
	2r+6rmRZk9ersAfadkfjYaLhNPKslDpcv+l0wAkSriCyflsNJUbq3UlYnzINh9wA
	E6l2EDcNgAolWD9fohEzRFfSMo8ow17+x3Lz2T73zrs26kezraiGmdNImQlMowom
	v250Tj4ijwBdMfGcyOo60Pb5vbi6v3DdgQkBUIsF5PvjuAS1HLqh+1AVo3/bBRnj
	CnRe88k1bMaUtzJ70xRyDZvwh8cMIt3PjcGc3GHH/5WG3i+lYb2rvE21Z3DjQoM8
	SWGaLL4d21YqKFkyNglRNjhODj6H6s12LyO+gf3XcGXFeuo/EKRvoEdpCRcw9mfu
	w1HYkw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v2gum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 16:56:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e89b5746d0so11080326d6.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 08:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107405; x=1741712205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jeCtW4lbMa2wB+pGkNjK1YgYQBzXYFl+3yQ06H7E5zI=;
        b=EOzwtjN2tpRY0A1TyB+azYVfekSCVxlXVZ+AI/DT1kRJCJ23B/muWAxzIphv+OAjGS
         fnIumeIEG4ZZHxZcTpC8yNuk8jwjcV+iZCEqty0MvsFpSSoF+Z0x4fRXLUPWzo5Laj+a
         Z5E1fvqpXH77Te3nbvEDRP8TrtpjTr6Wb1ivtRT88uSV5owxzB7rrHUbq5tcIveZkvYS
         5p1YxuueuwPBsKb9AkxhTmC48U15raSLQBjlNiH9rntxnLtMvqU0iVVvebMYvCvKn+1O
         2OZ7xWo1SHTCBLfaX6y7hhBh9/PTmwYZPnZT3dvdATGKQzpPTBO89bUj+TcczOt0+3se
         3Jnw==
X-Forwarded-Encrypted: i=1; AJvYcCUcWKbYmNHiWA8rlDIxA5CKgAVekVSbxzs72qS5hA0Axsjr66HJlF1YVle745/JZFhpG6zlATNwYJQJuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTBNZlgUhkEF6ObSUGTjIM4E7B3O1C0V3I6/ssndFs0DwXieA
	RG13tzLiaLwBLivDEAQwaaQf7lKTnAsu9lY43q0bavlSOsYt66VNcRFpBnv114+jK5aD3oqm5Vr
	cB8xI0hmwL/wS8Udp8XbrHixiyVXJYu6qJZWFHLWTgEAcZIHTETqI3c4eqXssFA==
X-Gm-Gg: ASbGncsc+1k0D7OxQcy9B80XQbfa6XLdJnAZfJejpdSvyd0d+KngGofLrw7Nqu6WQzU
	y5ucawdcLxAS8tWT2UGPHlPTIjLrbxMT8LQvYlEoKkR3VFh4xzrPFfPQXT7xQonym9MoN++TGIr
	nd7JaBAdV2/ijp3BdF16RghlmFzrfQfLOQ047SDxhlzBfvy4bVTB/DBlSuZlL0wMSXA+8M5Cfr9
	oUmU57Bzx+YPqLjpXL/LB6rgNuanHjLbdDA5QCImW65Jcgb7dSHHO2RIVJr3H6XPjeu9o6AhowJ
	QaiOk5DbYpkwdx+861QUV54DQmlRO5OJBIOoamvWdN2YAOX5fYFk0ZLM1XsPL9p+14QQag==
X-Received: by 2002:a05:6214:518c:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6e8dc2904ffmr15699326d6.11.1741107405192;
        Tue, 04 Mar 2025 08:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDvPwCooBjtFZFTrypVsEc1Pzi5aDYHsuSLfjAg+hqO1PNWsuhlUJTPfRjPAcb4z7sb1bj8A==
X-Received: by 2002:a05:6214:518c:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6e8dc2904ffmr15699166d6.11.1741107404824;
        Tue, 04 Mar 2025 08:56:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb6067sm8319687a12.50.2025.03.04.08.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:56:44 -0800 (PST)
Message-ID: <58d32bd4-d854-4233-89c9-22c37bddfaa1@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:56:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-5-81a87ae1503c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-5-81a87ae1503c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GUPmGOivWE1Bam4YP50NKrfyext75n0m
X-Proofpoint-ORIG-GUID: GUPmGOivWE1Bam4YP50NKrfyext75n0m
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c730ce cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1NR_YFCaA4PxXnam7p8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040135

On 2.03.2025 3:49 AM, Alexey Klimov wrote:
> Add sound node and dsp-related pieces to enable HDMI+I2S audio playback
> support on Qualcomm QR2210 RB1 board. That is the only sound output
> supported for now.
> 
> The audio playback is verified using the following commands:
> amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 49 ++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index 7a789b41c2f1887f0c41ae24da2e2fe8915ab13c..e547537cffdbc13cfd21b8b8b7210b62996ff431 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -186,6 +186,47 @@ vph_pwr: regulator-vph-pwr {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	sound {
> +		compatible = "qcom,qrb2210-rb1-sndcard", "qcom,qrb4210-rb2-sndcard";
> +		pinctrl-0 = <&lpi_i2s2_active>;
> +		pinctrl-names = "default";
> +		model = "Qualcomm-RB1-WSA8815-Speakers-DMIC0";
> +		audio-routing = "MM_DL1", "MultiMedia1 Playback",
> +				"MM_DL2", "MultiMedia2 Playback";
> +
> +		mm1-dai-link {
> +			link-name = "MultiMedia1";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +			};
> +		};
> +
> +		mm2-dai-link {
> +			link-name = "MultiMedia2";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +			};
> +		};
> +
> +		hdmi-i2s-dai-link {
> +			link-name = "HDMI/I2S Playback";
> +
> +			cpu {
> +				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6routing>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lt9611_codec 0>;
> +			};

"codec" < "cpu" < "platform"

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
