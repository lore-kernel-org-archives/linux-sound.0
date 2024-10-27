Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A031E535;
	Sun, 27 Oct 2024 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730065175; cv=none; b=DaBV+Z7KwFeI5AlC7UQhhMCsS1Bo2OJ45X/WBEeh5sHO8mre12UQwJ6KdLFrVu6dHk4V65otawMFG/fhyPmI1BM1ZW8CflqPZiSeX6fT5ckrffi/5rAcq9q7AzQPF9nTQC3T9EEIYVgy+JdXbLZqEyNHfPR5KnuhAbPDQ8y2qiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730065175; c=relaxed/simple;
	bh=CHxc3493MS3XNzEuR+gsev3hyBAPY8PbZdHpfqYvC4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDk9DMw0zEpDsjpFbE5jZrAXFI39TLnUnxOjZUisbIx/kRM3gumJFL9aKFoouD80wlXdmkhE7eu+0iSlEWJGWD0XsyubPU9Mt1dCXbZBwZXM7OHaAdV97dehW0Mqhd8kHaCa8yUXOaJOBjflIMCPSu6aA0SKs8ZhFEKZDYYsjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMRgLFE6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMRgLFE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F3DC4CEC3;
	Sun, 27 Oct 2024 21:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730065175;
	bh=CHxc3493MS3XNzEuR+gsev3hyBAPY8PbZdHpfqYvC4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMRgLFE60ibD4srccAP09WV4ZlkxhxNidCan0LOErzFbTjrVPC98ETDQi1UgB3aa8
	 87I867Or1+PUgoUDt+tqAJuc1kZJKZY4ETA3hOYKCwOffVnTMUWMjjt2ucv08r4J/o
	 OgJfN3zeqCrl5tUuHuJeZcMrKSjN1dFQG6lQCYKyDlnw8qXL5Bar9l9SobkjgI5aQ3
	 3dPo0lAeWeUmWwhS0Ttp1WnJzMEX2hcOt7scAdiND7amkgM51ifWx7lxzzJaufcQhp
	 M18xfM/5GmQ6qWY8KpqUheGKaknykB5pqdM9TDlSAlK6HW15t94muwkTF1g/9/qh7k
	 xVxSQT+XWMs8A==
Date: Sun, 27 Oct 2024 16:39:33 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shengjiu.wang@nxp.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx
 compatible fallback
Message-ID: <20241027213933.GA104723-robh@kernel.org>
References: <20241024180441.1456490-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024180441.1456490-1-festevam@gmail.com>

On Thu, Oct 24, 2024 at 03:04:41PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX6SL and i.MX6SX SPDIF blocks are compatible with i.MX35.
> 
> Document 'fsl,imx35-spdif' as a fallback compatible for these two
> chip variants.
> 
> This fixes the following dt-schema warnings:
> 
> compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
> compatible: ['fsl,imx6sx-spdif', 'fsl,imx35-spdif'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/sound/fsl,spdif.yaml  | 25 +++++++++++--------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
> index 204f361cea27..3bc18c3b084f 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
> @@ -16,16 +16,21 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx35-spdif
> -      - fsl,vf610-spdif
> -      - fsl,imx6sx-spdif
> -      - fsl,imx8qm-spdif
> -      - fsl,imx8qxp-spdif
> -      - fsl,imx8mq-spdif
> -      - fsl,imx8mm-spdif
> -      - fsl,imx8mn-spdif
> -      - fsl,imx8ulp-spdif
> +    oneOf:
> +      - const: fsl,imx35-spdif
> +      - const: fsl,imx6sx-spdif
> +      - const: fsl,imx8mm-spdif
> +      - const: fsl,imx8mn-spdif
> +      - const: fsl,imx8mq-spdif
> +      - const: fsl,imx8qm-spdif
> +      - const: fsl,imx8qxp-spdif
> +      - const: fsl,imx8ulp-spdif
> +      - const: fsl,vf610-spdif

Keep all the above as 1 enum.

> +      - items:
> +          - enum:
> +              - fsl,imx6sl-spdif
> +              - fsl,imx6sx-spdif
> +          - const: fsl,imx35-spdif
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 
