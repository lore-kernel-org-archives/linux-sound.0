Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB31D5154;
	Fri, 27 Jun 2025 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010238; cv=none; b=WXeZk8QJKgQS3P4dk4M3QTwj5DyIL8i5UDUCyy7f1YlIfIufIoatB9oq+Zl+t4CqBmOMtdrYXj+AASbYz2zGiZnG3oShvOsnma8z5EiCGAFelLYULTYEi8ThK9UR+ezdO+o2mz14448MvTNq578/w+uhntMpRVmmlMeAmuR2yiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010238; c=relaxed/simple;
	bh=kz3halVjDAvMYM/eCk68+xflrEIhAJlSuhTmJPcBC9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfXSKbKvPQPR4zzkw+iXdhH5zKbGZH2xFDq3SesPNLxSZaz6XtFsi0EHuW4hVUPgg8XNHk9YnXs+WBZCCy+CxmpcDL+4iHRRhYMChe/izSCYxH70Kk4E3AQLyZDG7f46aq3rd5Vba/fbrLKLi0lv+GCFQYt5Wi1xFmImYELTNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcj0jPFs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcj0jPFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B049C4CEE3;
	Fri, 27 Jun 2025 07:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010238;
	bh=kz3halVjDAvMYM/eCk68+xflrEIhAJlSuhTmJPcBC9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcj0jPFsExEIls5LXU5mrujeZYLqg+p8Qguxv+vEY46U78oCQ4ihMvaMIgaFDYSpU
	 EpKcsi+MIu9pvfCZ94D5sdAxpp/VObqzLTRfLz3SBqg5NblmhCbzAECYB/z/JvUeQJ
	 Dtrst2Kpe4Ts9ZvKLlyXOjkxWkFBky/N2OAIZTnSdhF1NsttFheZk+GM1x9pxo9IQQ
	 d+ult1iDHosOcCghCyHURmO5IxVBUnV6Fu+DrB1zdOb/kttPciCByAU46aE7VuSkgH
	 rDNLjZ7OFrbceJJ0N+5y3kXk29iqysGR5ISpk9ACwGhyoEXnvYKdRVL9EpUEHqTMp2
	 MpHB2H6FVsk/g==
Date: Fri, 27 Jun 2025 09:43:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andriy.shevchenko@linux.intel.com, tiwai@suse.de, alsa-devel@alsa-project.org, baojun.xu@ti.com, 
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, lgirdwood@gmail.com, robh@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 4/4] dt-bindings: sound: device support list for
 pcm6240
Message-ID: <20250627-lean-pumpkin-giraffe-6fad55@krzk-bin>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-5-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-5-niranjan.hy@ti.com>

On Thu, Jun 26, 2025 at 11:43:33PM +0530, Niranjan H Y wrote:
> Removed taa* and tad* device from the support list
> as these devices are supported by tac5x1x codec driver

No, why? Hardware does not change.

> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---
> v3:
> - update the subject of the patch file
> ---
>  .../devicetree/bindings/sound/ti,pcm6240.yaml          | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
> index d89b4255b51c..b0d5f57dc0f5 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
> @@ -29,8 +29,6 @@ description: |
>      https://www.ti.com/lit/gpn/pcm9211
>      https://www.ti.com/lit/gpn/pcmd3140
>      https://www.ti.com/lit/gpn/pcmd3180
> -    https://www.ti.com/lit/gpn/taa5212
> -    https://www.ti.com/lit/gpn/tad5212
>  
>  properties:
>    compatible:
> @@ -81,10 +79,6 @@ properties:
>        ti,pcmd3180: Eight-channel pulse-density-modulation input to TDM or
>        I2S output converter.
>  
> -      ti,taa5212: Low-power high-performance stereo audio ADC with 118-dB
> -      dynamic range.
> -
> -      ti,tad5212: Low-power stereo audio DAC with 120-dB dynamic range.
>      oneOf:
>        - items:
>            - enum:
> @@ -98,8 +92,6 @@ properties:
>            - enum:
>                - ti,pcmd512x
>                - ti,pcm9211
> -              - ti,taa5212
> -              - ti,tad5212
>            - const: ti,adc6120

All this is ABI break without explanation.


Best regards,
Krzysztof

