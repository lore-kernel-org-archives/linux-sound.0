Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97D187324
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054406; cv=none; b=jPpEmAgfRttAmceHxz63VuwnPFkW3CWe9l0UGJi23OGm1iJoU3cceJn5IipgY6pRp4qjY/TU0PX5gtA72mi/UsQp7eMHIQtvsGLjENUc+RraHADfJZTqf7sM6B0zHtY+E3I68pOtsRw/sY1FtFfU5I+NHrwSzkf9ld2e74ZOnIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054406; c=relaxed/simple;
	bh=cM9An+lJrKf5fchTezFQIl5Mxbf04kjvGjWZErkcecY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNzXnaqHCsblSf9b7gicSYQgIQJUWvRNEvrgWFhSX8ks+s5tRJW7d86HkVM9cICMvRnVnUdtTVy9LXS1Y0R4RP9iS2dy8H+OIvxjQpbzC7v10Nx6SxzxDW2xVnX4nEobZYmhvwUQkA797Tk9kKdWGe4710v5gXSBDjXo8KA/qEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WFkpp55J; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WFkpp55J"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-535694d67eeso838819e87.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726054402; x=1726659202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0GzAnTjhxYZKHt72GpqMtlHwxT7ETsaEqcjwqFxbdI=;
        b=WFkpp55JtRzZOjAB/GYZzI/AAXoxYIdt5n7QKwndZHxWfIeb1swPv2Kx2JZzXojZSz
         kuCDx+aZXjS5MdCh7FOKdRJGjoPH2CS6RoEk0UHhiKXhkhdAdIp6jGTv484CasUdkxsu
         zC7jq+BNtr1pzEU9N71x1bdyICea94x//A92vVP4TI/hOxeA+3gDTziTPeWkNcKdSlBj
         UuTF+7X9zO7fw55Fj7n157U35txDj2tP+4MfbapIbTqe1R+Qdo+Ol6bzwg4vK7zDMTLA
         n96pt15m4K1eV0UDIs3GICG3TO/TKsW2BTCyDNsQpd+eCe7wciEAewHtTCoVEGstfwlP
         QWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726054402; x=1726659202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0GzAnTjhxYZKHt72GpqMtlHwxT7ETsaEqcjwqFxbdI=;
        b=AHSYhCqQpmz/R76r2+ngxjGjmvR85Oq9T0xgwEFqk80e+gWFodMNigcakiUxnh6gmY
         fD3xxMHaUZxC1gEvbfbk9ReDYPw7e+un6JhpOIg4jnOwIsK2Xy85fGvy6ZMSv55UorGo
         xaU4x04kkxo/CNZwOT5dZZ51F0jCDybHT26yl1UVYMwVLkWBPZyqilH9DzxxeFrLIdr9
         gFs76tISVxvcy/1NJNE46I9vfmxX1pOvSossaAd0itHVNI1TmSzqiCvEDBdq5F1BoXR/
         2ZeBLhzc9K3ryLwmScKY4LRPYWpufiC9Km0VUdmDXcwvfqOz8XzZh0fKbS6+V7tEPeLR
         z8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/oCK53/UNVQFPMldm5myLq2/YrqWfu7fvFkb2usiBXfMC8NXvrl+h3Sl5z6u1yYeBKklTpVieKJZmxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlnb1yy6u3jBN3pAbMFhdzG9gt0QlFg08xZfD5HmHUGyAliExS
	J3ousHuvionkOyinsAPAD95tLy6pVT5nrPlYfq7tibRoEFjB2SAszFRwXg01eiY=
X-Google-Smtp-Source: AGHT+IGJTJ4gfvXWiLZYGJnjq1U6O/nKro6eMFZ5KwjhG3ZDqLoxi5tKw42KVzSzIJdS3EXUUs0o+g==
X-Received: by 2002:a05:6512:2250:b0:52f:cf2d:a1a0 with SMTP id 2adb3069b0e04-5366bb48a71mr2373288e87.26.1726054402046;
        Wed, 11 Sep 2024 04:33:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cad44sm1548242e87.150.2024.09.11.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 04:33:21 -0700 (PDT)
Date: Wed, 11 Sep 2024 14:33:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>, 
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, 
	kernel@quicinc.com, quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: wcd938x-sdw: Add static
 channel mapping support
Message-ID: <iv2ajlr4qe7lcfwd7vwqsghxprpqz6r2nrvgmqmg6ryscgslqs@zb5nsyavuzej>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <20240909105547.2691015-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-2-quic_mohs@quicinc.com>

On Mon, Sep 09, 2024 at 04:25:44PM GMT, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave rx/tx ports.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> index d3cf8f59cb23..1db3c001ce98 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> @@ -58,6 +58,30 @@ properties:
>      items:
>        enum: [1, 2, 3, 4, 5]
>  
> +  qcom,tx-channel-mapping:
> +    description: |
> +      Specifies static channel mapping between slave and master tx port
> +      channels.
> +      In the order of slave port channels which is adc1, adc2, adc3, adc4,
> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 8
> +    maxItems: 13
> +    items:
> +      enum: [1, 2, 4, 8]
> +
> +  qcom,rx-channel-mapping:
> +    description: |
> +      Specifies static channels mapping between slave and master rx port
> +      channels.
> +      In the order of slave port channels, which is
> +      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 8
> +    maxItems: 8
> +    items:
> +      enum: [1, 2, 4, 8]

Can we please use sensible strings instead of a randomly-looking numbers?

> +
>  required:
>    - compatible
>    - reg
> @@ -74,6 +98,8 @@ examples:
>              compatible = "sdw20217010a00";
>              reg = <0 4>;
>              qcom,rx-port-mapping = <1 2 3 4 5>;
> +            qcom,rx-channel-mapping =  /bits/ 8 <0x01 0x02 0x01 0x01 0x02
> +                                                 0x01 0x01 0x02>;
>          };
>      };
>  
> @@ -85,6 +111,8 @@ examples:
>              compatible = "sdw20217010a00";
>              reg = <0 3>;
>              qcom,tx-port-mapping = <2 2 3 4>;
> +            qcom,tx-channel-mapping = /bits/ 8 <0x01 0x02 0x01 0x01 0x02 0x04
> +                                                0x04 0x08 0x01 0x02 0x04 0x8>;
>          };
>      };
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
