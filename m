Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CED3B42F0;
	Mon, 22 Jun 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135685; cv=none; b=FLdDeeHUNI/Itr0oz5v3Tx49Y6JpsuvBwW5XcQkXyH+gzv6wKAaf8mH8ONU/2dgCdBMY/JOYD35digwKHLICVZJXbvuYSQqzH7K7pQv6O8YfIiNw1DuwT3GExS/6Jt9N1Cu7vACOTOGEXt5Q2ogG3R//QydzhsCY/0tFkYvcfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135685; c=relaxed/simple;
	bh=YG5ABu+hJR8A+OkKYptCDTUAKYxuoGKOow7nydZevJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVQN4pSm7b0i+JEPA4pszhs+CQ6gsZnra9+bspkjSXNKqRQn7MHEBQb/riyerpPQTgt8ZlwTvZIIJYELWXBMKfa9uj9IcCkwuzSg1igBjaY9Ri+rB0VKPN0HhaOVSMEfoenlzq3igqkQXJdRmAwXLrteFCBlWGFkrouk/BF4Hsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1faiF5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1faiF5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453A41F00A3A;
	Mon, 22 Jun 2026 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782135684;
	bh=uxVR3BJyXKKdRyGAhHe9hFF/UEagCkWh5uvn/XeAJRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1faiF5oxhboJlE2wEdAIqc6asczf7X2u+G0X0oBPBvGL8v/bKyclHUyHmpdx7v7q
	 lbDad2fEP7mj2cUCXOB3tI5kIRilnPh7ejYpGICFYpJxoQEOFp6zKcepc25P+WY8BJ
	 sU+1Kq/zF7leYtEU43WY/qimYKNIFsLOAA5Ymk5VR/leJZVt1z4NR2s09/rPYS94Hw
	 fm7zlIv/Mp3iHKZ8n/OjTJpRKhz2uMcD5Z4kS2erwhL19OZYthccLYZjZVLeaJYeym
	 OPKeJcV9DPROwnHoRlxHkmXnh++G7vFgjFeAFjVkC5OQvOMFE8bZ4PuNQa79nIPIAP
	 n+2TJ9TLpQxTA==
Date: Mon, 22 Jun 2026 15:41:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region property
Message-ID: <20260622-whimsical-charming-seriema-dcec81@quoll>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
 <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 05:05:08PM +0530, Ajay Kumar Nandam wrote:
> Document the new memory-region property that allows one or more
> reserved-memory carveout regions to be SCM-assigned to the VMIDs
> listed in qcom,vmid.
> 
> - Add memory-region as an optional phandle-array (1-8 entries).
>   Each entry must point to a shared-dma-pool, no-map reserved-memory
>   node. Index 0 is the control-path buffer; subsequent entries are
>   data-path buffers.
> - Enforce via dependentRequired that memory-region is only valid
>   when qcom,vmid is also present.
> - Expand qcom,vmid description to mention carveout regions and the
>   qcom_scm_is_available() probe-defer requirement.
> - Add a second example showing both properties in use with two
>   carveout regions and two destination VMIDs.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-dai.yaml        | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> index b767625985a7..601055182da6 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> @@ -10,7 +10,11 @@ maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  
>  description: |
> -  This binding describes the Qualcomm APM DAIs in DSP
> +  This binding describes the Qualcomm APM DAIs in DSP.
> +  When qcom,vmid is present, the driver performs SCM memory
> +  assignment for PCM DMA buffers and any reserved-memory regions
> +  listed in memory-region, granting the specified VMIDs RW access
> +  while retaining HLOS as a co-owner.
>  
>  properties:
>    compatible:
> @@ -20,9 +24,24 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  memory-region:
> +    description:
> +      List of phandles to reserved-memory regions (shared-dma-pool,
> +      no-map) that must be SCM-assigned to the VMIDs in qcom,vmid.
> +      The first entry is the control-path buffer; subsequent entries
> +      are data-path buffers. Only meaningful when qcom,vmid is present.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Drop ref, not needed.

> +    items:
> +      maxItems: 1
> +    minItems: 1
> +    maxItems: 8
> +
>    qcom,vmid:
> -    description: Optional list of destination VMIDs to share PCM DMA buffers with.
> -      HLOS retains RW access as source owner and must not be listed.

This is confusing context. There is no qcom,vmid in this file.

Anyway, I think adding SCM interface and handling of VMIDs is quite
different design of this firmware/hardware, thus this should be a
different compatible.

Best regards,
Krzysztof

