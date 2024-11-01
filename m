Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2014AD20
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447425; cv=none; b=Ggs8X1P2577miknIkiCNPWY3hS5Ij5G8rdvDETj+g5uIjL5gOKQYmfcuCF2ravLk/QOmO7M6OrbWyKFA6GAl5GlrDkgKwx7SFMo6rUcJU09/N7rj5+P+111UQjxRRuerFYvHXcbtqpjUHk26O67WaE1iuJxFSNZldeKJQE6+pSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447425; c=relaxed/simple;
	bh=Et3UQSwjm15JkMkxfkqvo7DbgHvZlB1zd7cEnw+DZA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULO2IU62WBwhKnIrnJWCKL8QN6fNbn4K8Gtcvj3IgQAvPsvWrGT78NXW4w81aM3kkngZu31jLkhbXVG+5e5jLvuNnmeqlY4Jv8CJ6qLVvvlu9IBpg1AC4e0lKbbS88av6WTpN++BbdnaaoW0hE5yMF4lLAtjuGFXdpvNUnA5Fxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uHC8wrDd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHC8wrDd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e690479cso1881326e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 00:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730447420; x=1731052220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tVXepvdOvLzeC/oDHGXXtVkvQ6jpNs4sYwaG7ZKM2A=;
        b=uHC8wrDdRUqnJ6y0gUIE2gP7ewgR//t4R6JvZklRnQ23iwvMpJbNs/6HkK/qbELOLN
         /+PpVMRQnWXp/G7ZK39THrBav19TEt0GacY0rqe8PzYT72YNH1qzsEFo5gpstYeZAJW8
         70kSVKyFT5EXHcix6igzAzQqlKsyKfUUr5Ff2cuKuR5KPEmvtmeI0jZCK4dc4m49GmnK
         UWHpWiCDe8Im+Udm7NoDgCRWrA80tnGhAp7/l4wT1Ti1ywEyPN/hO+0nzasqxnXnJSpL
         Vrlo0tQVE0s3dEwNM5cxKEOmfyHsQBiHpIcDL7yRM4427B9sGADDNoAoBAjBkj60UD5t
         UiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447420; x=1731052220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tVXepvdOvLzeC/oDHGXXtVkvQ6jpNs4sYwaG7ZKM2A=;
        b=VFQtkc/i4IKdAb0IXcFCeA00HSaOrnleD+JrGhyMwEibitAkhbTF60DhATxBT4KKhD
         hidCIsREL1RLhEnmVJmi8J8aIpvayW+YLurzE5k2rDoQV26r3/j6AoSDcvyr6eQD1du2
         z0ZC0QJXqSBHgG+bVYR80nAY4WtVwvoDGmLgJI6ydFlL7BMqKHqqDD+5xoUtsJRRNbh6
         EfKGYLxOeyEdIVeWtnpQ1KFSgiOJsORrdfsWJ9KGlJ3jUzoQFQTAgZ9ZDCE4qYdRwWT8
         VxdpEhmxq8Zf7ZQ5+xwsVkjaIcopR8qktUOHisaZEPhioMECHxOW5s4kKZJCE6b3wMXX
         8j9g==
X-Gm-Message-State: AOJu0YzOlu8LFc8XZ9eRI4oPwrsqykaH1v0pJ76vtS0HBixVcGe/WQ8L
	1iCjlxL8AW/3amw84DwEvZhUq4Hpe8pni0G1Mxjkwgas/iRHVia8OlPUx4/yzDA=
X-Google-Smtp-Source: AGHT+IEC8B2G7OwTL99btj/dBWLDxymOPQzVXOW8pru+0ddCPpyhs8CrPVe/HhLGizV922A9O83B5A==
X-Received: by 2002:a05:6512:3f02:b0:539:905c:15ab with SMTP id 2adb3069b0e04-53d65df3a4amr1497128e87.32.1730447419955;
        Fri, 01 Nov 2024 00:50:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce54dsm464050e87.181.2024.11.01.00.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:50:18 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:50:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm4250: add LPASS LPI pin
 controller
Message-ID: <eaz4aordxjgnl7c2xhz6ek23eaapaszytcrea7a7y53b5p6aev@mtk7jsvywgcv>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-5-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101005925.186696-5-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 12:59:24AM +0000, Alexey Klimov wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node required for audio subsystem on Qualcomm
> QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
> lpass pin controller comparing to sm6115.
> 
> While at this, also add description of lpi_i2s2 pins (active state)
> required for audio playback via HDMI.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> index a0ed61925e12..1b9983ab122e 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> @@ -36,3 +36,42 @@ &cpu6 {
>  &cpu7 {
>  	compatible = "qcom,kryo240";
>  };
> +
> +&lpass_tlmm {
> +	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
> +	gpio-ranges = <&lpass_tlmm 0 0 26>;

I think this should be <&lpass_tlmm 0 0 27>. The driver defines pins
0-26.

> +
> +	lpi_i2s2_active: lpi-i2s2-active-state {
> +		sck-pins {
> +			pins = "gpio10";
> +			function = "i2s2_clk";
> +			bias-disable;
> +			drive-strength = <8>;
> +			output-high;
> +		};
> +
> +		ws-pins {
> +			pins = "gpio11";
> +			function = "i2s2_ws";
> +			bias-disable;
> +			drive-strength = <8>;
> +			output-high;
> +		};
> +
> +		data-pins {
> +			pins = "gpio12";
> +			function = "i2s2_data";
> +			bias-disable;
> +			drive-strength = <8>;
> +			output-high;
> +		};
> +
> +		ext-mclk1-pins {
> +			pins = "gpio18";
> +			function = "ext_mclk1_a";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;
> +		};
> +	};
> +};
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
