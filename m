Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309637FF51
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726537; cv=none; b=kBhJnF9N78c8Ng/T/8lL/RmYEqYZAQ5PzphnkJq3LfXkCYfvFwVm0/YeASfkkT49vTGMdJ7tITTFU0mn0WtU1gAMqIZnTgITPPIZEts+uGwajdv4dyjsmVrxtLjYTwvblbJC6Kt73yCDW8us6ToiaHE6zfuSikf3FnRhcYHUURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726537; c=relaxed/simple;
	bh=9oxM+JZ/KBv4QujL4OMZsUAPDuBGpoQQ3qE/pY00dZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKy3I62ReXdPHVlE1QRCWaD5L+/tFk1cz2P9O/TG4WIsn44XROCd8TwLeeAqB+pFCsavkJr+4smGja2FLCPXAwZsQo0TC1Hn2sxj7FgU3njv3ot0s+FqYH/MvZaFNjnHxHXEtnQ1WZBY8vUlSmMg2U/TQD1JD8xaUj2S4qlwObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGV+JamD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKURNdoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGV+JamD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKURNdoH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H49g1e1420052
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjiXcMH53VijEqYrcILYBJyCu3+MmQSqQapVI2Raxa0=; b=SGV+JamDfbuUWdyn
	RizeVtFlypxX/RZWlyX2mQNwE6i9oMKMnTgtcEWhVGYIDoxntEDG9TCC3aDbI3IQ
	h0ZCvz2UCl9TUc20kUGivN2/cPE8o/OJgEZEx6yNhgrHYEBpPWZaDeTk5/owq43x
	DOOZ5VuNao1CadPvIa0yZ6HrR6JsidaHB+Oplag08gEGj7B8j68Py2PNKTHDrjjM
	P7goFM82B/AEmvUp9nezamWIDxBJDrNPBqEWLBH6kWjrKJz24zWdViHBWuP3/w3Q
	gSvZpT/u8nV5aX1e+Lj/Ttcpiqm+BHOO+5pbHixTnc5wxSVLOJ5/RGNRT5N/vSsT
	IL+lDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt846au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:48:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b05a3c2421so21788895ad.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 22:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773726533; x=1774331333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjiXcMH53VijEqYrcILYBJyCu3+MmQSqQapVI2Raxa0=;
        b=OKURNdoHAT/ajjaVE7nLKTmnnRop2kSMeHntD40XumHqqNG8Jygb29kfQ5LhkKaboa
         r7hR0SGHSljlmYj0+cKJPx8RCp9wnjyKniHA9xOOF7IZqsjCjbAgj9Z5eJzPtsSs4JCk
         YbcINEJY9EDRJeUCWEaf081eTQ91itShR8xSpuTICWtiJwpBJmWchSeSlltWjX6VTOaT
         uaEVExdpzK5BeYoAkirukQJwcV6OkbLgV3qbgQ/eqghddSDqOLXsFKxQ6vT66DzLNJhY
         bvSTA/7gTF2YO6FXjwtGXmHv4IXcAMxbW2p/oCRcDHiACSpg+venn8DxEkeY0PnCFD2E
         8Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726533; x=1774331333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjiXcMH53VijEqYrcILYBJyCu3+MmQSqQapVI2Raxa0=;
        b=sk6gwxw//6N4CBn2i6xea6erbrl1ov11o7FsFNU+dQP5GeuuUv6d6NOuCy1t5Hv6QE
         R5GUsqDTk0DC8BNeQ/8DTSz0fb0EmbRSvPH3vD4XJnU1mToTONabAWTwEhVe8j2xydK6
         hwZsbkE+qX3NuTw/nV5AIf+YEdpr4psGpXe+mMufEBSVuSq0WjKxQd/s9EF20K/pm751
         zHlzhOj5UNpJIzlsv1dBiU0K+yRX1RZzt2v+r4QiR6ASPxU98a+SgrZGGkWQvZqO6PsG
         rO4Fb0+fJ0GBIZ1wVysG+Qd0Mj6OFZ+6GUs7+chx7tOlcIQQnXl2Do9H27EUy/ZveqkI
         TCog==
X-Forwarded-Encrypted: i=1; AJvYcCWgxl4YPZEkzlMR3U6swomjF1W/pOuMTQm6m0IDeYDpFhOqK9EdH1DB4mhY/nfnbnjLYkDgEuyG95NWWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhG7g2K3YCHxtPF/qp+xGOtKpxq9xy1MTzlNFl7+YL4suQy493
	BEe9BZ7ib6xwxZ4KvqBYbngUG6CKXk3wP1QT0LMJGUs9Di+SmSf5yoeRAvPn7i2jbZlXBJbjEaa
	pWyIH447p0zI40TyYPBgr+8Yo3jhcg4fBBXPS+zbLXx69E3YCj9iF6NeidQvV15Sdcg==
X-Gm-Gg: ATEYQzz5uHLACEIa3sdDEzzlCzvVbrSDB/BWwkX0uOwLG7BB95X8R/K2eGHKua2vann
	pKinUc2qPSPeeR7/bd1fE+SLg/t51JkxSANnyikMfIg0Is0Y1u/nE2CQCt+I0w1yerU65OzQnqB
	5SwIMiSqKVsrFTtUabDG6trWDYqqm23zF9tJDGM0NHz/QcxDpJd0eXU/Z/RzHICaRdD9Ta61BLL
	3u7a8+nuE4w7YSiZzpIeqREsoRBA0OWEwkMEYh3jWCsGgQ7JOVLIui0uFuYDld7IwuZgCNTOdec
	28/PDFNkz6CqSmnWMuMduM8KI70OsVqvBdjdZUuydwhtQYesoXPIrCjvRHrIngq4FCdQnOQMEE7
	r3NOi4vKhrjctKZU9nwClEuEoTcA7WcmRKKhhH4WVRms/LUcx/1G5kEHaMolt
X-Received: by 2002:a17:902:ef08:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2aecab22c14mr171136345ad.39.1773726533422;
        Mon, 16 Mar 2026 22:48:53 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2aecab22c14mr171135935ad.39.1773726532893;
        Mon, 16 Mar 2026 22:48:52 -0700 (PDT)
Received: from [10.83.99.36] ([106.192.46.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05f0ab17asm50122205ad.37.2026.03.16.22.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:48:52 -0700 (PDT)
Message-ID: <a34b057a-10a4-4e96-9f0f-44237e9ac858@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:18:44 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] ASoC: qcom: qdsp6: Add MI2S clock control
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <4645ecaa-1e32-4ce3-a0f6-4e29eddebefa@linaro.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <4645ecaa-1e32-4ce3-a0f6-4e29eddebefa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RXWNSMgpmElYB3kF5vvL3TMOUpsF0pzH
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b8eb46 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=dEIGAuP7kbcW1LL0Y9bFPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xxQ2whiNWfE1U6xHldcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: RXWNSMgpmElYB3kF5vvL3TMOUpsF0pzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA0OCBTYWx0ZWRfX602JZtiFc/FV
 K6F1N77SRoYp/vW8oJd37FABM9ohTj5IfRBa+rtAmEh39dWxLjCrvTHDW3HPQeeVmQkkioA29/F
 4KJK64BpR4q3ZfNSK7aRRh245qkU7l+4W0tSofvHuv7tSkYU/64Hmz18GmGhqOLOWAPd7RKiAI7
 juI0yn3CXEGwkF2mmd9ykqEcGA/fmzq69D79yqaQ5LknsfjHhggjHOrLUJtCRgpZbzDX33HIDtu
 z2ihnvVKZEUcGWdDzemGJj1ekwGJGZ1TZdqBfQt424vvwmKaJzIm3tk/dYLoBL/5MFm+rWBmKgp
 O0uYzfHV4MLx+7ACpmyaBMhaEDi+JuIx9GU0qTuycSCdHoynxJg9IiskYJLVjklQ1w6OweVkV7i
 /8yhVFdOp/HGVhf1RaAe8ss8pEyBk71mGc1ReD3c71T0RuC+TgX91yR8BIeNuMG5U5RZhXBFZrx
 oBIHNd7G3M1XOeVYSmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170048



On 3/10/2026 7:32 PM, Neil Armstrong wrote:
> On 3/9/26 12:12, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
>> Each MI2S port now retrieves its clock handles from the device tree,
>> allowing per-port clock configuration and proper enable/disable during
>> startup and shutdown.
>>
>> Enhances the sc8280xp machine driver to set the boards spacific
>> configurations, some of the boards like talos using third party
>> codec's which need's additional MCLK settings for audio to work.
>>
>> Mohammad Rafi Shaik (4):
>>    ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
>>    ASoC: qcom: qdsp6: q6prm: add the missing LPASS MCLK clock IDs
>>    ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
>>    ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
>>      board-specific config
>>
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  41 +++-
>>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 137 ++++++++++++-
>>   sound/soc/qcom/qdsp6/q6prm-clocks.c           |   5 +
>>   sound/soc/qcom/qdsp6/q6prm.h                  |  15 ++
>>   sound/soc/qcom/sc8280xp.c                     | 180 ++++++++++++++++--
>>   5 files changed, 357 insertions(+), 21 deletions(-)
>>
>>
>> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> 
> 
> I'm not sure about the overall architecture, but I managed to make the 
> I2S HDMI audio
> work on the SM8650 HDK with:
> 
> 

Thanks Neil for validating.

> ==============================><=======================================
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/ 
> dts/qcom/sm8650-hdk.dts
> index 5bf1af3308ce..8316e17dc76b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -218,6 +218,22 @@ platform {
>                   sound-dai = <&q6apm>;
>               };
>           };
> +
> +        pri-mi2s-dai-link {
> +            link-name = "HDMI Playback";
> +
> +            cpu {
> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +            };
> +
> +            codec {
> +                sound-dai = <&lt9611_codec 0>;
> +            };
> +
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +        };
>       };
> 
>       vph_pwr: regulator-vph-pwr {
> @@ -853,6 +869,7 @@ &i2c6 {
>       lt9611_codec: hdmi-bridge@2b {
>           compatible = "lontium,lt9611uxc";
>           reg = <0x2b>;
> +        #sound-dai-cells = <1>;
> 
>           interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
> 
> @@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
>           vdd-supply = <&lt9611_1v2>;
>           vcc-supply = <&lt9611_3v3>;
> 
> -        pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
> +        pinctrl-0 = <&lt9611_irq_pin>,
> +                <&lt9611_rst_pin>,
> +                <&i2s0_default_state>,
> +                <&audio_mclk0_default_state>;
>           pinctrl-names = "default";
> 
>           ports {
> @@ -1056,6 +1076,17 @@ &pon_resin {
>       status = "okay";
>   };
> 
> +&q6apmbedai {
> +    #address-cells = <1>;
> +    #size-cells = <0>;
> +
> +    reg = <PRIMARY_MI2S_RX>;
> +    clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +         <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT 
> LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +    clock-names = "mclk",
> +              "bclk";
> +};
> +
>   &qup_i2c3_data_clk {
>       /* Use internal I2C pull-up */
>       bias-pull-up = <2200>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/ 
> qcom/sm8650.dtsi
> index f8e1950a74ac..9818fbd8094e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -6237,6 +6237,46 @@ wake-pins {
>                   };
>               };
> 
> +            audio_mclk0_default_state: audio-mclk0-default-state {
> +                pins = "gpio125";
> +                function = "audio_ext_mclk0";
> +                drive-strength = <8>;
> +                bias-disable;
> +                output-high;
> +            };
> +
> +            i2s0_default_state: i2s0-default-state {
> +                sck-pins {
> +                    pins = "gpio126";
> +                    function = "i2s0_sck";
> +                    drive-strength = <8>;
> +                    bias-disable;
> +                    output-high;
> +                };
> +
> +                data0-pins {
> +                    pins = "gpio127";
> +                    function = "i2s0_data0";
> +                    drive-strength = <8>;
> +                    bias-disable;
> +                };
> +
> +                data1-pins {
> +                    pins = "gpio128";
> +                    function = "i2s0_data1";
> +                    drive-strength = <8>;
> +                    bias-disable;
> +                };
> +
> +                ws-pins {
> +                    pins = "gpio129";
> +                    function = "i2s0_ws";
> +                    drive-strength = <8>;
> +                    bias-disable;
> +                    output-high;
> +                };
> +            };
> +
>               qup_i2c0_data_clk: qup-i2c0-data-clk-state {
>                   /* SDA, SCL */
>                   pins = "gpio32", "gpio33";
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7aa87e8a6cc5..c2bd5f2a696d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -17,8 +17,12 @@
>   #include "common.h"
>   #include "sdw.h"
> 
> -#define MCLK_FREQ        12288000
> -#define MCLK_NATIVE_FREQ    11289600
> +#define I2S_MCLKFS    256
> +#define I2S_SLOTSIZE    16
> +#define I2S_MCLK_RATE(rate, channels) \
> +        ((rate) * (channels) * I2S_MCLKFS)
> +#define I2S_BIT_RATE(rate, channels) \
> +        ((rate) * (channels) * I2S_SLOTSIZE)
> 
>   static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>       SND_SOC_DAPM_HP("Headphone Jack", NULL),
> @@ -40,6 +44,7 @@ struct snd_soc_common {
>       const struct snd_soc_dapm_route *dapm_routes;
>       int num_dapm_routes;
>       bool mi2s_mclk_enable;
> +    bool mi2s_bclk_enable;
>   };
> 
>   struct sc8280xp_snd_data {
> @@ -51,21 +56,22 @@ struct sc8280xp_snd_data {
>       bool jack_setup;
>   };
> 
> -static inline int sc8280xp_get_mclk_feq(unsigned int rate)
> +static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
>   {
> -    int freq = MCLK_FREQ;
> -
>       switch (rate) {
>       case SNDRV_PCM_RATE_11025:
>       case SNDRV_PCM_RATE_44100:
>       case SNDRV_PCM_RATE_88200:
> -        freq = MCLK_NATIVE_FREQ;
> +        return I2S_MCLK_RATE(44100, params_channels(params));
>           break;
>       default:
> -        break;
> +        return I2S_MCLK_RATE(params_rate(params), 
> params_channels(params));
>       }
> +}
> 
> -    return freq;
> +static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
> +{
> +    return I2S_BIT_RATE(params_rate(params), params_channels(params));
>   }
> 
>   static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
> @@ -142,8 +148,13 @@ static int sc8280xp_snd_hw_params(struct 
> snd_pcm_substream *substream,
>   {
>       struct snd_soc_pcm_runtime *rtd = 
> snd_soc_substream_to_rtd(substream);
>       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>       struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> -    int mclk_freq = sc8280xp_get_mclk_feq(params_rate(params));
> +    int mclk_freq = sc8280xp_get_mclk_freq(params);
> +    int bclk_freq = sc8280xp_get_bclk_freq(params);
> +    unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
> +                     SND_SOC_DAIFMT_NB_NF |
> +                     SND_SOC_DAIFMT_I2S;
> 
>       switch (cpu_dai->id) {
>       case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> @@ -154,6 +165,15 @@ static int sc8280xp_snd_hw_params(struct 
> snd_pcm_substream *substream,
>               snd_soc_dai_set_sysclk(cpu_dai,
>                              LPAIF_MI2S_MCLK, mclk_freq,
>                              SND_SOC_CLOCK_IN);
> +
> +        if (data->snd_soc_common_priv->mi2s_bclk_enable) {
> +            snd_soc_dai_set_sysclk(cpu_dai,
> +                           LPAIF_MI2S_BCLK, bclk_freq,
> +                           SND_SOC_CLOCK_IN);
> +            snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_BC_FC |
> +                        SND_SOC_DAIFMT_NB_NF |
> +                        SND_SOC_DAIFMT_I2S);

Rather than hardcoding codec_dai_fmt, it would be better to supply it 
through board-specific data. This is codec-dependent configuration and 
not directly related to MCLK handling.

I will add the codec DAI format configuration in the next version in a 
more generic way, incorporating all your suggestions.

Best Regards,
Rafi

> +        }
>           break;
>       default:
>           break;
> @@ -288,6 +308,7 @@ static struct snd_soc_common sm8450_priv_data = {
>       .dapm_widgets = sc8280xp_dapm_widgets,
>       .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>       .mi2s_mclk_enable = true,
> +    .mi2s_bclk_enable = true,
>   };
> 
>   static struct snd_soc_common sm8550_priv_data = {
> @@ -295,6 +316,7 @@ static struct snd_soc_common sm8550_priv_data = {
>       .dapm_widgets = sc8280xp_dapm_widgets,
>       .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>       .mi2s_mclk_enable = true,
> +    .mi2s_bclk_enable = true,
>   };
> 
>   static struct snd_soc_common sm8650_priv_data = {
> @@ -302,6 +324,7 @@ static struct snd_soc_common sm8650_priv_data = {
>       .dapm_widgets = sc8280xp_dapm_widgets,
>       .num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>       .mi2s_mclk_enable = true,
> +    .mi2s_bclk_enable = true,
>   };
> 
>   static struct snd_soc_common sm8750_priv_data = {
> ==============================><========================================
> 
> Thanks,
> Neil

