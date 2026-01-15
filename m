Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4413A3ED
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525369; cv=none; b=nn1xo86FBKVKU/gHeKG1DJ0f7+tF9q7rw8hWu/x4g4QHQ0FUBXFsdNfcv0GTBCtGEvNl8iIDinoFgPKi0DMSiVW+n5OJ/0WCooXvXOcAom/9o1OB+2swXzz/CeMROk1IEA78aTkrHC2G9ygnDYrML28CHl+eSEnWmh5/HN92c5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525369; c=relaxed/simple;
	bh=WVAFk/G9Jae2iegxU72AI5Nf1GESFNgXZ0s6CTi6AQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3SbKa/snJh/0BHP2HCg3YYdWTZlduvvse2RoTRqEsP5DSahtQMBhR5Im0YBlobRK3f8B9IPan69PRfHPL+w1Tul3weSKUcPJRe67r8Cx1amI19qP8mIM3Rr/nJ06sJzgLQZrOYNt6qdeznQURH/2xzDsonVjKSqcR3ATbmiQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHyjA18O; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHyjA18O"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7cfdf0c8908so285016a34.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 17:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525366; x=1769130166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wFG3gVNxJD7Ap7fJ1CZDygWmut6qTFwFZjaDYw553m8=;
        b=nHyjA18OZEU/w/UUUZDM9yL6MwMfjms6ULetB6BufrL/j66xs1mVqWTY8NJLKPwms1
         xaDaPUg82k65BUU/R2FLMeeQTnxCv4HdiQUQf7ZwIp04efsOcuayK46I7ZbcvIUyjTCe
         Lnv4O0BsbuN+O8JyKik532T7FiJYQ89EvJlPQZLPx+ZpVzxK+F4rARNGd6IBVccnvk/S
         jFN5EcEgTmGBCYTLW6d41cJCSXqesMBnrrnv2ehDNLNHeOCAKgOrVyy1djYQITlM+MCz
         FAORluPWeR5+7hTL6va5cPXjShhHb1xd4ydsOi/+MHrG5EBn6Idbxw5ajDn2EjX+Efur
         V4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525366; x=1769130166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFG3gVNxJD7Ap7fJ1CZDygWmut6qTFwFZjaDYw553m8=;
        b=BQs7dkQHs/74tZ1RbpWcjN3OJXBUPET/HIKrlaegNQF6IoDUC5LCWByloOfYxpIKHq
         xCLtRMKEIVmjs5GQTIBYwzV89JWQ/EQGoiZug6BDPm1Cs3xtwzz1PSK08dBwUay6OYYY
         bdbCRJap3y0POYG5H/lG9hRY6ugcT1vrJgJCuFHqbr6DqsKWCBFKNLv78IL0p8b08+g1
         ONGj8v1p4fovsw3//mCbHZ7qWBcUYN8OYIS2UPk9H4YT5UXvMhXahPgxkBtcSpHElB8C
         s7ChabJl5Ir38XSVYaMB/xIeoWYaD8oaMVvkUEdMMtY+z/28yt1YCRF1gpBiKxDrA8y0
         qMAA==
X-Gm-Message-State: AOJu0YwZsIgPKLV6zQ38nDdQKvu7EcYBP+hT6GVArQ0NqRUfE+qcZezS
	8y2AqcfzQbkIzp36udPTa1cJJ1rmOrei208BQz1hMbQWm6dc9pN3rgukiGLmzU4WZmc=
X-Gm-Gg: AY/fxX5WgWQyYgK9MO571NAU3QzMhGN5kzE+xsJYkP8uKSnXW5oFY6IvdZj/aEpxTS4
	4ZttwCYwe9BqcbFJB/MilgIx3DcdAsD1yEZpXava1SIz8SeCjLhWKqgG70jwGajIW6njZ27wgnQ
	R0uOVGMKpTFUyn9uqZGet4Rinwa33G2sVeKcxPUXZiB9ljvDOSb+a06cEVVL4e5GaJwtoMX6xDB
	Jijg0Ned291SffTNDqU54loUTi8BqvQqhP3aJ7SwM1WG+taVvOCqVfjIe1nhChJjFwN3fsObFc1
	TjwIOyMkzXKdCO3kYDa1fD6Y4Fxa3545Md/nPYo5p7f0j53LXjRnA/NjFuycEZEhSFfsGss4G+v
	hRg95MgxA13JdtVicu+XSO+3f6jpNTFwG8s+rycJ9tk5B75zibu1T9fMakf/zu5SosehID4p98G
	Jgd7hWyqjCx3VgoB6ZLKeL
X-Received: by 2002:a05:7300:6ca1:b0:2b0:5079:d3c8 with SMTP id 5a478bee46e88-2b6b3f139f5mr1020729eec.4.1768520046558;
        Thu, 15 Jan 2026 15:34:06 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3696f40sm696762eec.35.2026.01.15.15.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:34:06 -0800 (PST)
Date: Fri, 16 Jan 2026 07:34:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWl4fvKsUZDg9dwj@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>

On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> This patch series adds basic audio support for Sophgo CV1800B, 
> as used on boards such as the Milk-V Duo. 
> The series introduces an AIAO audio mux driver, 
> an I2S controller driver, corresponding DT bindings, 
> and DTS updates to wire the components together.
> 

I haven't see your mux driver, is it missed?

> The implementation is based on vendor documentation 
> and testing on real hardware.  This series relies on 
> recent fixes in the DesignWare AXI DMA support; 
> in particular, correct operation depends on 
> the DMA changes discussed at:
> https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/ 
> The current driver implementation supports a fixed audio configuration 
> of 48 kHz sample rate.  The series has been tested on the 
> Milk-V Duo 256M board using the Sophgo SG2002 SoC. 
> The implementation is expected to also work on Milk-V Duo and Milk-V Module 
> boards based on the SG2000 SoC, as the audio 
> and DMA blocks are closely related.
> 
> Known hardware limitation:
> On CV1800B / SG2002, the I2S2 output pins cannot be enabled via pinctrl alone.
> Due to SoC design constraints, the output path becomes functional only after 
> additional vendor-specific register programming. 
> This series makes the limitation explicit and does not attempt to work around 
> it implicitly via pinctrl or undocumented behavior.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
> Anton D. Stavinskii (8):
>       dt-bindings: sound: sophgo: add CV1800B I2S/TDM controller binding
>       ASoC: sophgo: add CV1800B I2S/TDM controller driver
>       dt-bindings: sound: sophgo: add CV1800B internal ADC codec
>       ASoC: sophgo: add CV1800B internal ADC codec driver
>       dt-bindings: sound: sophgo: add CV1800B internal DAC codec
>       ASoC: sophgo: add CV1800B internal DAC codec driver
>       riscv: dts: sophgo: dts nodes for i2s tdm modules
>       riscv: dts: sophgo: add Milk-V Duo 256M board dts
> 
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  75 +++
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
>  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
>  arch/riscv/boot/dts/sophgo/Makefile                |   1 +
>  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  49 ++
>  .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++
>  sound/soc/Kconfig                                  |   1 +
>  sound/soc/Makefile                                 |   1 +
>  sound/soc/sophgo/Kconfig                           |  41 ++
>  sound/soc/sophgo/Makefile                          |   5 +
>  sound/soc/sophgo/cv1800b-sound-adc.c               | 322 ++++++++++
>  sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
>  sound/soc/sophgo/cv1800b-tdm.c                     | 714 +++++++++++++++++++++
>  14 files changed, 1787 insertions(+)
> ---
> base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
> change-id: 20260115-cv1800b-i2s-driver-4f17836dec56
> 
> Best regards,
> -- 
> Anton D. Stavinskii <stavinsky@gmail.com>
> 

Thanks for your patch, for all the patchs, I hope you write a
meaningful comment for the patch, at least for now I found it
is nothing in your comment.

Also, the patch 8 should not in this patch and should be a
separate patch.

Regards,
Inochi
