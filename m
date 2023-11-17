Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C98C072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 13:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjKQN0u (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 08:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjKQN0t (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 08:26:49 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D05D52
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 05:26:46 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9f924e0481aso48890766b.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 05:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700227604; x=1700832404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jawcm/PJRbzpwmFul+vZ4SNYw4Uqbd6UDmJz6wRAI2I=;
        b=W0gVfD82iCFWGvb8g88Y9/jri8SAaNSgl8C/flFm5/fnFaO0x13ccEXVTpu/k4a0V1
         MBK2PVNqcqV3Rmw45UoHRbzYwHcZpLQgE+X2D4t3vThNBaU92w63rScPVrEUETU0EXH4
         Yso9V8e5IlFCCUV80tv+sr7xl5Z8AJiB/JfBhwFRdh5VkIzZGutNQwbkPzPKTTW2dd6Q
         YmR43xaiSfM8t+8pymij8nyeWfBOg0osn493AYJhC6VsmZ1ksLebyVAxmY89XRVE1SXI
         4rwvWYvMIyfFH5SErvDbS99+BqI7Uw/N/bNdf6cA4YYu1Waii2JTpN6wM3ZpTB+kwlHD
         h0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700227604; x=1700832404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jawcm/PJRbzpwmFul+vZ4SNYw4Uqbd6UDmJz6wRAI2I=;
        b=kxA5kZfhFxjzq2/YpQ8nprTt/JCvn4ylcWzSyQzOzRWNhVM1ht28snODZ+ar4yKxkV
         /UtojYsEeLxLBhVl9xcuzIe2NNvrIzqA504rMn12ENzdBa6BkY5W4gH3qdthz2CTDJmv
         bCU700oBOeeyUUAGZlwrsXGOVknHG6LBr2zVvucYIO5pBNppNPlDwzM3TXNh+JL+TOkb
         254bZL8e6Rf6o8zQ9Jg0M1H+VtnFrE0PcvVyIkmgHw6ZiXFM3DLdZS13XUafNoqChZos
         C+JLrEczH8HrGZtnxaerp4ijicf80X0jrQpNrmGSQMV/UGq6n9m1pIjWN0QgR3/lzheh
         xcGw==
X-Gm-Message-State: AOJu0Yyg9wZobJfqMWqHYn+RMyZ2DmjmZ8j+eohZ2bUdysgT1HABaC+l
        GpVjMFvZEMge6RFM9Fk8DJbs+aLmEkNLqr1R4ns=
X-Google-Smtp-Source: AGHT+IFO27JBmBEWDHEzDSjUSUPSh+vclMluw29xcColu3m2JGs/Oe48OV46cEMi+ZSo5MzjtWWQWA==
X-Received: by 2002:a17:906:aece:b0:9e6:2c5a:450a with SMTP id me14-20020a170906aece00b009e62c5a450amr4580554ejb.26.1700227604645;
        Fri, 17 Nov 2023 05:26:44 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p20-20020a170906a01400b009adc77fe164sm789874ejy.66.2023.11.17.05.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 05:26:44 -0800 (PST)
Message-ID: <d8ef8fe6-2856-40fc-a95e-5bf68c0f1a8b@linaro.org>
Date:   Fri, 17 Nov 2023 13:26:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: qcom: q6afe: provide fallback for digital
 codec clock
To:     =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org
Cc:     Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
 <20231029165716.69878-3-otto.pflueger@abscue.de>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231029165716.69878-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Thanks Otto for the patch,

On 29/10/2023 16:57, Otto Pflüger wrote:
> When q6afe is used as a clock provider through q6afe-clocks.c, it uses
> an interface for setting clocks that is not present in older firmware
> versions. However, using Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> as the codec MCLK in the device tree can be useful on older platforms
> too. Provide a fallback that sets this clock using the old method when
> an old firmware version is detected.
> 
> MSM8916 did not need this because of a workaround that controls this
> clock directly through the GCC driver, but newer SoCs do not have this
> clock in their GCC drivers because it is meant to be controlled by the
> DSP.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 91d39f6ad0bd..f14d3b366aa4 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
>   	struct q6afe *afe = dev_get_drvdata(dev->parent);
>   	struct afe_clk_set cset = {0,};
>   
> +	/*
> +	 * v2 clocks specified in the device tree may not be supported by the
> +	 * firmware. If this is the digital codec core clock, fall back to the
> +	 * old method for setting it.
> +	 */
> +	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
> +		struct q6afe_port *port;
> +		struct afe_digital_clk_cfg dcfg = {0,};
> +		int ret;
> +
> +		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
> +			return -EINVAL;
> +
> +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
> +		if (IS_ERR(port))
> +			return PTR_ERR(port);
> +
> +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
> +		dcfg.clk_val = freq;
> +		dcfg.clk_root = 5;
> +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
> +
> +		q6afe_port_put(port);

This redirection of clks looks totally confusing and hacky.
Why can not we do this from machine driver based something like this:

if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7)
	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_DIG_CLK, freq, 0);



--srini
> +		return ret;
> +	}
> +
>   	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
>   	cset.clk_id = clk_id;
>   	cset.clk_freq_in_hz = freq;
