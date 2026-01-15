Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D7378D80
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483740; cv=none; b=BygY1tgINh6TD+05OLUbxHbRze4jMCr1QfahY6My2uFYYkV7zy78Zy9G5LFsc/KesdO2O9Woy3y76yRZZwCNxi2gd9898TdD4NdJ0qPj8jm7Wwl75OTh4/XM9n6oqwDXq16tlCiPvqDu1RvGMYhrisGUt+7P/MY+R3uS5ZbJMSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483740; c=relaxed/simple;
	bh=tKvhlUCBk+8pnj9t8JkQ5oMWdti7nzWkF20pThaGD0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWRrAQr3Lpfvw+3PzCoDdD4oqv+Cbp2k10AFA+GYXFn8+q1mCrLRgN67JNXAuptlWdzVyWISYzmHCXY5xh+jyKgYSLqYjJ1x6I8p+eFu/9JJ3ecn5NCSkTR1c8k2z/fyNaNhgbq2RcGqdfXdhPw/4i7ELIR3RS3jj3oSDdzG8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CZH4/vJe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZH4/vJe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso8576345e9.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768483735; x=1769088535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iK603Yrl6cAoskvtZuzt5inDzVXwdlPWfjvT+cpZDag=;
        b=CZH4/vJeR2nVrMdgUKyFX/oeSxjyrF23jlAb8bKnGsjgl66E4fCieyULMa9ursWt92
         r5LruU1Sui6CFsh42Euy5mpjIjCubASSBygozdqaHIeUIDjyoUHgk5HoC84p5AATq3bO
         Ur/YY2zBwIEtz/G1YnL33YEiwflAJ/4lNpqSzcfAsWl+MhLQCI5D0TqvWevSrmqlWgh3
         +1zol86/sBRKCD6IJffDkJbewBKFggsZQvtwsvz8YV4xS/AK9hfqQtJ4EL00LdylQJxP
         /R1Nh5bDUvfLhjKW5rkw/oHtSCVqT8ZvRGxA0RNIzHXukbUCEvA8ZDdMwh93sMBy8jik
         1IRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483735; x=1769088535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iK603Yrl6cAoskvtZuzt5inDzVXwdlPWfjvT+cpZDag=;
        b=YN/86uvVVlYhGuqmtEqEnloxJyFWmMa2Uq1RtyvsDlWQaN9I+LGNaz3+mlxf1RmGU6
         0vnf0RU2cboUJn5JsTJx/xpoMQCbCcbEbCyOE7p0zhxVg/JdAXFhNsX32NuHgga9ignn
         q64QFUJ8eFcyXVligD7mGC/jgJ4yJdwoATKvqer0tvjnkrugljrkB2tUD1gJQaw1r8CO
         0Y6UnMz2QGlvFPyGYk4EkSWXAqRyKSsOaXc+UmIVU3jkHOae1/Eyd2thttvT7GdCVaAl
         8vd0+Q5vMTjDra3C/L+3uU+qxbUx3rY/B30I11wnrpU1g8n2lOZdY+Z3X5s0JQ3+17GF
         8laQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmEqTvfIMqtNHOLZgjTg4mrBQOeZVHCrLqKcnpQ48k6h0+47yfw5fvZVF6a68KjuH92owbbYaYM7ZlVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/bJBDKg9QF0H2Rek46Un73GfjkOuR4Xk0jK9zCedCzjby5i3
	R9tanQIghDNsWiRFSxvM4DODUz6a4UJ30GHV9po25SDRD31awJkKFL7AVrxwZ8+MYvGKTWcjBxi
	oOQrY/Alb54IQ
X-Gm-Gg: AY/fxX75/ERcispGsZJyDktQqwoCiqO08GrAylvDD3+fY8Fo15HDUA1QOa4wFRKSlL+
	MF0m6U2uAhlp+sVR42NONQi6PuPOB2S7OT9aCgNJQpw1dmXH3TU7i7nJ+Sm4I6De6LjLzZy+OZD
	C0XXxuV4yxNrVMy5+oOk9wZWsrvI9d0WsZBhHupkv6JSP/8xKtaQj01zQquMhKEJvORnJ0Co+X/
	/tfJNBGqR8z0dS9z9aa8uFVaO/GVhepM68040aEmbQRzlMEBX0iaq6cdQugjpJZeOh+UjGZxAoR
	okW/oFVeLk+WIrB8aZW6djFunuIVXH5Ast5xXfQ7i6Cf5nH1rPtw29wsRPLkHNKgVEZmZwAIpX/
	quVA/tcwtSKJrqOd53XGOv6QLDej5sn+Y5hT5sozvan8PnNCmUdigAMSH9H2sF3f+6cWUdsV6EW
	fnlKYSMNtbRr/3NKICBqytOx8m/811zrBzcoSOzXbsXZbaXnjG/m2FMgVN7mepqmj4
X-Received: by 2002:a05:600c:8217:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-47ee3311593mr71935275e9.10.1768483735319;
        Thu, 15 Jan 2026 05:28:55 -0800 (PST)
Received: from ?IPV6:2a00:f2a:e0df:cca0:40b7:95ab:607c:4e79? ([2a00:f2a:e0df:cca0:40b7:95ab:607c:4e79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b488d4sm50415825e9.0.2026.01.15.05.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:28:54 -0800 (PST)
Message-ID: <e1ed2a68-683c-4235-890b-9b2c5ad93e38@linaro.org>
Date: Thu, 15 Jan 2026 15:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, robh@kernel.org
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/26 14:56, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.

Hi Angelo,

This does not really look like a fix, if it was a fix I would expect a
Fixes tag, otherwise, it looks like you are adding a lot of clocks which
were not defined before

Eugen
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
>  1 file changed, 162 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 8ddf49b0040d..16ae3328f70d 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -47,16 +47,118 @@ properties:
>        - description: AFE clock
>        - description: ADDA DAC clock
>        - description: ADDA DAC pre-distortion clock
> -      - description: audio infra sys clock
> -      - description: audio infra 26M clock
> +      - description: ADDA ADC clock
> +      - description: ADDA6 ADC clock
> +      - description: Audio low-jitter 22.5792m clock
> +      - description: Audio low-jitter 24.576m clock
> +      - description: Audio PLL1 tuner clock
> +      - description: Audio PLL2 tuner clock
> +      - description: Audio Time-Division Multiplexing interface clock
> +      - description: ADDA ADC Sine Generator clock
> +      - description: audio Non-LE clock
> +      - description: Audio DAC High-Resolution clock
> +      - description: Audio High-Resolution ADC clock
> +      - description: Audio High-Resolution ADC SineGen clock
> +      - description: Audio ADDA6 High-Resolution ADC clock
> +      - description: Tertiary ADDA DAC clock
> +      - description: Tertiary ADDA DAC pre-distortion clock
> +      - description: Tertiary ADDA DAC Sine Generator clock
> +      - description: Tertiary ADDA DAC High-Resolution clock
> +      - description: Audio infra sys clock
> +      - description: Audio infra 26M clock
> +      - description: Mux for audio clock
> +      - description: Mux for audio internal bus clock
> +      - description: Mux main divider by 4
> +      - description: Primary audio mux
> +      - description: Primary audio PLL
> +      - description: Secondary audio mux
> +      - description: Secondary audio PLL
> +      - description: Primary audio en-generator clock
> +      - description: Primary PLL divider by 4 for IEC
> +      - description: Secondary audio en-generator clock
> +      - description: Secondary PLL divider by 4 for IEC
> +      - description: Mux selector for I2S port 0
> +      - description: Mux selector for I2S port 1
> +      - description: Mux selector for I2S port 2
> +      - description: Mux selector for I2S port 3
> +      - description: Mux selector for I2S port 4
> +      - description: Mux selector for I2S port 5
> +      - description: Mux selector for I2S port 6
> +      - description: Mux selector for I2S port 7
> +      - description: Mux selector for I2S port 8
> +      - description: Mux selector for I2S port 9
> +      - description: APLL1 and APLL2 divider for I2S port 0
> +      - description: APLL1 and APLL2 divider for I2S port 1
> +      - description: APLL1 and APLL2 divider for I2S port 2
> +      - description: APLL1 and APLL2 divider for I2S port 3
> +      - description: APLL1 and APLL2 divider for I2S port 4
> +      - description: APLL1 and APLL2 divider for IEC
> +      - description: APLL1 and APLL2 divider for I2S port 5
> +      - description: APLL1 and APLL2 divider for I2S port 6
> +      - description: APLL1 and APLL2 divider for I2S port 7
> +      - description: APLL1 and APLL2 divider for I2S port 8
> +      - description: APLL1 and APLL2 divider for I2S port 9
> +      - description: Top mux for audio subsystem
> +      - description: 26MHz clock for audio subsystem
>  
>    clock-names:
>      items:
>        - const: aud_afe_clk
>        - const: aud_dac_clk
>        - const: aud_dac_predis_clk
> +      - const: aud_adc_clk
> +      - const: aud_adda6_adc_clk
> +      - const: aud_apll22m_clk
> +      - const: aud_apll24m_clk
> +      - const: aud_apll1_tuner_clk
> +      - const: aud_apll2_tuner_clk
> +      - const: aud_tdm_clk
> +      - const: aud_tml_clk
> +      - const: aud_nle
> +      - const: aud_dac_hires_clk
> +      - const: aud_adc_hires_clk
> +      - const: aud_adc_hires_tml
> +      - const: aud_adda6_adc_hires_clk
> +      - const: aud_3rd_dac_clk
> +      - const: aud_3rd_dac_predis_clk
> +      - const: aud_3rd_dac_tml
> +      - const: aud_3rd_dac_hires_clk
>        - const: aud_infra_clk
>        - const: aud_infra_26m_clk
> +      - const: top_mux_audio
> +      - const: top_mux_audio_int
> +      - const: top_mainpll_d4_d4
> +      - const: top_mux_aud_1
> +      - const: top_apll1_ck
> +      - const: top_mux_aud_2
> +      - const: top_apll2_ck
> +      - const: top_mux_aud_eng1
> +      - const: top_apll1_d4
> +      - const: top_mux_aud_eng2
> +      - const: top_apll2_d4
> +      - const: top_i2s0_m_sel
> +      - const: top_i2s1_m_sel
> +      - const: top_i2s2_m_sel
> +      - const: top_i2s3_m_sel
> +      - const: top_i2s4_m_sel
> +      - const: top_i2s5_m_sel
> +      - const: top_i2s6_m_sel
> +      - const: top_i2s7_m_sel
> +      - const: top_i2s8_m_sel
> +      - const: top_i2s9_m_sel
> +      - const: top_apll12_div0
> +      - const: top_apll12_div1
> +      - const: top_apll12_div2
> +      - const: top_apll12_div3
> +      - const: top_apll12_div4
> +      - const: top_apll12_divb
> +      - const: top_apll12_div5
> +      - const: top_apll12_div6
> +      - const: top_apll12_div7
> +      - const: top_apll12_div8
> +      - const: top_apll12_div9
> +      - const: top_mux_audio_h
> +      - const: top_clk26m_clk
>  
>  required:
>    - compatible
> @@ -83,23 +185,69 @@ examples:
>      afe: mt8192-afe-pcm {
>          compatible = "mediatek,mt8192-audio";
>          interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&audsys CLK_AUD_AFE>, <&audsys CLK_AUD_DAC>,
> +                 <&audsys CLK_AUD_DAC_PREDIS>, <&audsys CLK_AUD_ADC>,
> +                 <&audsys CLK_AUD_ADDA6_ADC>, <&audsys CLK_AUD_22M>,
> +                 <&audsys CLK_AUD_24M>, <&audsys CLK_AUD_APLL_TUNER>,
> +                 <&audsys CLK_AUD_APLL2_TUNER>, <&audsys CLK_AUD_TDM>,
> +                 <&audsys CLK_AUD_TML>, <&audsys CLK_AUD_NLE>,
> +                 <&audsys CLK_AUD_DAC_HIRES>, <&audsys CLK_AUD_ADC_HIRES>,
> +                 <&audsys CLK_AUD_ADC_HIRES_TML>, <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
> +                 <&audsys CLK_AUD_3RD_DAC>, <&audsys CLK_AUD_3RD_DAC_PREDIS>,
> +                 <&audsys CLK_AUD_3RD_DAC_TML>, <&audsys CLK_AUD_3RD_DAC_HIRES>,
> +                 <&infracfg CLK_INFRA_AUDIO>, <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +                 <&topckgen CLK_TOP_AUDIO_SEL>, <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +                 <&topckgen CLK_TOP_MAINPLL_D4_D4>, <&topckgen CLK_TOP_AUD_1_SEL>,
> +                 <&topckgen CLK_TOP_APLL1>, <&topckgen CLK_TOP_AUD_2_SEL>,
> +                 <&topckgen CLK_TOP_APLL2>, <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
> +                 <&topckgen CLK_TOP_APLL1_D4>, <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
> +                 <&topckgen CLK_TOP_APLL2_D4>, <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>, <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>, <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>, <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>, <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>, <&topckgen CLK_TOP_APLL12_DIV0>,
> +                 <&topckgen CLK_TOP_APLL12_DIV1>, <&topckgen CLK_TOP_APLL12_DIV2>,
> +                 <&topckgen CLK_TOP_APLL12_DIV3>, <&topckgen CLK_TOP_APLL12_DIV4>,
> +                 <&topckgen CLK_TOP_APLL12_DIVB>, <&topckgen CLK_TOP_APLL12_DIV5>,
> +                 <&topckgen CLK_TOP_APLL12_DIV6>, <&topckgen CLK_TOP_APLL12_DIV7>,
> +                 <&topckgen CLK_TOP_APLL12_DIV8>, <&topckgen CLK_TOP_APLL12_DIV9>,
> +                 <&topckgen CLK_TOP_AUDIO_H_SEL>, <&clk26m>;
> +        clock-names = "aud_afe_clk", "aud_dac_clk",
> +                      "aud_dac_predis_clk", "aud_adc_clk",
> +                      "aud_adda6_adc_clk", "aud_apll22m_clk",
> +                      "aud_apll24m_clk", "aud_apll1_tuner_clk",
> +                      "aud_apll2_tuner_clk", "aud_tdm_clk",
> +                      "aud_tml_clk", "aud_nle",
> +                      "aud_dac_hires_clk", "aud_adc_hires_clk",
> +                      "aud_adc_hires_tml", "aud_adda6_adc_hires_clk",
> +                      "aud_3rd_dac_clk", "aud_3rd_dac_predis_clk",
> +                      "aud_3rd_dac_tml", "aud_3rd_dac_hires_clk",
> +                      "aud_infra_clk", "aud_infra_26m_clk",
> +                      "top_mux_audio", "top_mux_audio_int",
> +                      "top_mainpll_d4_d4", "top_mux_aud_1",
> +                      "top_apll1_ck", "top_mux_aud_2",
> +                      "top_apll2_ck", "top_mux_aud_eng1",
> +                      "top_apll1_d4", "top_mux_aud_eng2",
> +                      "top_apll2_d4", "top_i2s0_m_sel",
> +                      "top_i2s1_m_sel", "top_i2s2_m_sel",
> +                      "top_i2s3_m_sel", "top_i2s4_m_sel",
> +                      "top_i2s5_m_sel", "top_i2s6_m_sel",
> +                      "top_i2s7_m_sel", "top_i2s8_m_sel",
> +                      "top_i2s9_m_sel", "top_apll12_div0",
> +                      "top_apll12_div1", "top_apll12_div2",
> +                      "top_apll12_div3", "top_apll12_div4",
> +                      "top_apll12_divb", "top_apll12_div5",
> +                      "top_apll12_div6", "top_apll12_div7",
> +                      "top_apll12_div8", "top_apll12_div9",
> +                      "top_mux_audio_h", "top_clk26m_clk";
> +        memory-region = <&afe_dma_mem>;
> +        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
>          resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
>          reset-names = "audiosys";
>          mediatek,apmixedsys = <&apmixedsys>;
>          mediatek,infracfg = <&infracfg>;
>          mediatek,topckgen = <&topckgen>;
> -        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
> -        clocks = <&audsys CLK_AUD_AFE>,
> -                 <&audsys CLK_AUD_DAC>,
> -                 <&audsys CLK_AUD_DAC_PREDIS>,
> -                 <&infracfg CLK_INFRA_AUDIO>,
> -                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
> -        clock-names = "aud_afe_clk",
> -                      "aud_dac_clk",
> -                      "aud_dac_predis_clk",
> -                      "aud_infra_clk",
> -                      "aud_infra_26m_clk";
> -        memory-region = <&afe_dma_mem>;
>      };
>  
>  ...

