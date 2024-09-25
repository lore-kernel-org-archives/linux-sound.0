Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F57E574
	for <linux-sound@vger.kernel.org>; Wed, 25 Sep 2024 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252881; cv=none; b=Brhlo1C7cHDLO/u6OgJN15OrU3O4gx4Qq6DJHSrGRcT0wnyXOg+Lycwlb6oUBTCjsiSAKSQVVziVsCQ8k0mkflRxArnN1HhuLP2K81TK0dmHtmtizNq40wk2NDp8bLAmOKOfrgy0B3LshJinNKjr3KmTXn3F+yuCc69QMi1kieU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252881; c=relaxed/simple;
	bh=nF0sfFBbFYVla7AI5yaRpMtwDZALqbKLpYtZvnb2IXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyoBSkM5E10L6a7SavlJ++RCKITMVDkx+2LwnsSzK85F+Ud+TjbDfjuOtf+zTT1KgnQmoojRRVfSVzia+t536E3Ff7hFzcmU49nAiVB+7K+TnInnt2V5CuXOvI2I6bWwS9el6KevDy+cueC7Z/SjQ7pVjXsxPaelTWjRIUktIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kS/n5gES; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kS/n5gES"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-535be093a43so8033265e87.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Sep 2024 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252878; x=1727857678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOKdJS1KLSJlTg0CCP5JjFGsRZQRYkLqZ4DmWczY9nM=;
        b=kS/n5gES1qMOJeY8LBmyrY6JoeYILJF0ow1QlaiteeeBvntsOYQgwiA6iVdxZNMpPl
         3wYFLEEpaUGvjyRTJ3ObI36nWkLmOPJJ7ACod9K5yA3xX0BNudgbD2saZj9QNet+dox6
         JlsvBcOQns9FFwg2MArtPCre1WqqXiCJogwpXjY2PuRkXY7GcpdNF6SM+yhmgU64I62C
         J7C8jFXwN6fqRp2tLp8oAr4Gtcqvar/IAJt4hBkHMLgNIWCyP/ThJbYfC2ZfGsfc2q3C
         /VcqmAgdMPpYdmwd8Km1wwV4qroXqyYZq5Z6mP870OL8lyrGU4qHBMxPZNniaaa7uhgt
         WZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252878; x=1727857678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOKdJS1KLSJlTg0CCP5JjFGsRZQRYkLqZ4DmWczY9nM=;
        b=vCfUZymOAFHXfaOVckMH4uqhbRF7OtKNpVRWR6cuOOPMmYh2JQR5X+OCCm5ez5fvNy
         gy+AL0RMG7HA20bGfQoMve7aZ8PRTPJCHK4YpAYiPn6KfoGM8kFuMQN3m8o2Z2yaAl3N
         4LmprxtA+he6tqn27vphmmd3dhA+OBooz9u3BahdNGH91jRh9NUuV68+2k7tKPzqmwJf
         9CkhBbdqgExKHq1K+Aj/pzEgt/JyRO/jlQtxoyPNmUF8n6vusbQ1Pcuh6Hd8LJz7ndC9
         6In8B1QW72WFOOd9F54vRohzdYhOSM/CjdhJjtLI3sFthgzfs3g/5yJyAZC8q3wMr8O1
         hAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVixwfUouRbkSFkzssL71ZT507ZBr6SC6xXswb2SZSNJlNzpTyuqdY6fIKtvftvpDbXjnaQOuEpyMgSLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEINLxIN7tO6H60oA+oBIF+36ZlN3KU3x1yZO5fFa5O1z7UUV
	UH5IFO6TV/9ZvgHwIUkOoTZupycJ5xVDVXshA4wWVvPUR/PJJyJHe22EIuv+6ag=
X-Google-Smtp-Source: AGHT+IEyNLlNKNPuzVS6L2iBVgd1PBFlzz4yy5yLc0ujoQhajP1DHMelGTZ6NiiUvdGv3ibmtbdefA==
X-Received: by 2002:a05:6512:1101:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-538801ac047mr976428e87.61.1727252877875;
        Wed, 25 Sep 2024 01:27:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e5c0bsm452613e87.82.2024.09.25.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:27:56 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:27:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, a39.skl@gmail.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org, vkoul@kernel.org, 
	klimov.linux@gmail.com
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
Message-ID: <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>

On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory.
> So far the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
> and above this offset will be equal to 0.
> With such change the corresponding RXn() macros will generate the same
> values for 2.5 codec version for all RX paths and the same old values
> for pre-2.5 version for RX0 and RX1. However for the latter case with RX2 path
> it will also add 2 * rxn_reg_stride2 on top.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 71e0d3bffd3f..9288ddb705fe 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -202,12 +202,14 @@
>  #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
>  #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
>  #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
> -#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
> +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)

This is a nice hack to rule out n=0 and n=1, but maybe we can be more
obvious here:

(0x0434 + stride * n + (n > 2) ? stride2 : 0)

>  #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
>  #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
> -#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
> +#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
> +	(0x0440 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)
>  #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
>  #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)

-- 
With best wishes
Dmitry
