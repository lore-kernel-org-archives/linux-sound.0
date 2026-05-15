Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875C439016;
	Fri, 15 May 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836263; cv=none; b=m6MKU/4TjPEFWLC5Fy/vscOAzt7g4NQivIltTDnioXSQ973VcH7DUbhTr7Jz+Um1w6n04+7FA1udSSc7NTAtMIt2qxN9vf//dw7C0GBtZdgx0u1BsD2oOsb2xyOTRvQFLiIlKypOtCQDcLyrtmhgWTcexXylE6BwvFK43Mnj7Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836263; c=relaxed/simple;
	bh=7iFVIDC3LA58FiY1vow+Eeq6t+BEpel5v+b8bD350Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wb9gJ/ET+cEcqs8cpvugZVt3T53vVX9CeFfw9MSKY32nGcYS46cN8MenfDypcNwfEA/3E7M8j1aAFZn9qHdXCoH/j4jwV6FKuN9mcAN+ZRtz8tKL5b1261nOZn0fymStjK66ARPO1Ysp/XXEVTl4MT2PxHHt4LnI4vSu05PX/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7DrPub6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7DrPub6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA71FC2BCB0;
	Fri, 15 May 2026 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836263;
	bh=7iFVIDC3LA58FiY1vow+Eeq6t+BEpel5v+b8bD350Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7DrPub6X4yA9zC6fjrW0NabHSIj2+HucRKlrIbY0LbwwwtD39YgS8pc/KxKbh5No
	 kllNURyl1Q3lJZW/MsFsCB0Zwp24SSiGFcdMCpavcnavRDQO1geQ6HhOpM7aJ2ZWWR
	 ZHvRNxtu+1fUCgw6w0Yi48hLPYYm8z6Q7EFh1xkW5QV3jSmrALyBrk/vuGKdPQW+gk
	 wH7UBRP0sjRQh097ZLsIQ98iA7FcJa7ELVm/aUI/DJmJ2dC0pU9gLuh3p2hUDO0hDc
	 PdXvKQVImZdMquKSCvGA9LEJOYOEUeWehMH+9TAN6LiI1zNCSY6EfLvmZmwPumzDxs
	 1ZYTdQ7hQqLlg==
Date: Fri, 15 May 2026 11:11:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8822: Add supply regulators
Message-ID: <20260515-provocative-bouncy-meerkat-f1693a@quoll>
References: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
 <20260513-nau8822-reg-v1-1-c532e18e92ad@flipper.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-nau8822-reg-v1-1-c532e18e92ad@flipper.net>

On Wed, May 13, 2026 at 05:39:10PM +0400, Alexey Charkov wrote:
> NAU8822 has 4 power supply pins: VDDA, VDDB, VDDC and VDDSPK, which need
> to be online and stable before communication with the device is attempted.
> 
> List them (as optional) so that device tree users can ensure correct power
> sequencing.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8822.yaml         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> index cb8182bbc491..0a8e40a140c3 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> @@ -30,6 +30,20 @@ properties:
>    clock-names:
>      const: mclk
>  
> +  vdda-supply:
> +    description: Analog power supply
> +
> +  vddb-supply:
> +    description: Digital buffer (input/output) supply
> +
> +  vddc-supply:
> +    description: Digital core supply
> +
> +  vddspk-supply:
> +    description:
> +      Speaker supply (power supply pin for RSPKOUT, LSPKOUT, AUXOUT2 and
> +      AUXTOUT1 output drivers)

Please grow the example.

Best regards,
Krzysztof

