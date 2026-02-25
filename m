Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3A329C56
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058029; cv=none; b=rHK+MbZfmbEQ7phzs9T9/ttmKy3Hcu9juuJfv79PR+sboZN+oqbbfT1Md1uB067nsQsN9+teN+hwlS0bHL3oiDTVrSoo5uB+J90BgblPblrp0wCvbAUB8vcqUlFXn4JN2mnoXjJkcTVj/LE6loh02mI5nijhZ8A4KrHdKgzyUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058029; c=relaxed/simple;
	bh=N2g4ZoqMWVGUlpBgsv7+PSNbpQ7Er9/ae4GSUKSze4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD52kzihKRTpiIzKjqD7S1pAk24zEnFuCNjH2d92lfO3MdDQomOZlZZgN9HP+kO213DdWyLM71lnSqZeGO3aEDQloc/liOpeoJg/nMlhsyH0PdkjncnkbgNNP9Ag7AVfbmxdZn6J6rVsAd+KKSCariK8Ei7i4Ne0G7qzpAH5BmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAeVcQVj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAeVcQVj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso118447b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058027; x=1772662827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F50crxFeK9XeDJJq/qBM5+VtsXIjYPfgaWG7L+GSg6s=;
        b=GAeVcQVjGHPdBAD0nWtASc7o5lgVxHwISWsLziyk9hkY2CiELT5lxbvKiPari1pF9b
         wsevrFTaKim/QI8J6ftsoVju1kWrnaBNZizUcsVT972cwR3nj6TmHWr3KPPN6eNVLT57
         +DvZJWJ1pu8ZHiqa97qcJu0+irlsLLirvxhUm4hp4R2ls10CShXT3E+MieMm+BYEWOrk
         8KVxdN9ZuE9jsydaG79DUjo4+8xseE8yao4XQV5HgJZNP0PpbNUew1OY8AX7ldeGnYB/
         kAWG8SfNEgC3pIzFlw36fMDML57wB8Oih0hFtq/3cHxUTwPmqzXNs0QSdcJr4EjYGC/Q
         uLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058027; x=1772662827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F50crxFeK9XeDJJq/qBM5+VtsXIjYPfgaWG7L+GSg6s=;
        b=D3QBzLpubvzOa96iJbnwtlQEgocqhuCEHNCPXJxuCFqdLQOWoNkE29hNmk7MTERVie
         Y0GpxRrlgrH527TwXMkxeAzoC3+m2PicVrMDJ8SAiz1c524yK9asOhq/75RfVX+bB/Me
         KqRS/xgn8DL0gRwXsKIcmEnmlo9uUal9RbJRroghe0Y/FrdfDrQcTnbaW6qAaj92Z4GY
         GTRs4ZlfFsj3NEq688o60DsSvoAZABOq29ObSG7u5jYzOmdgmNh/CCDUrCmcoRDWRoqr
         1KB1MIHOOcQTbosuZSF0OaLysUZMePqG+oFAaLyK2d1zE19P00CuTpqTE0VkQ4NJL4Pz
         di0Q==
X-Gm-Message-State: AOJu0Yzbbp4dQhtmu3r5ewFivhDIe8fhUNo+H5znReC9DWXciGKi9QTZ
	xAZJ2zI/UtvuqwvfVY3ud/kyeFKnZ0LFp6O5VggJXB8muoR3S1InyoUI
X-Gm-Gg: ATEYQzx88YCn6E0Vapx3FeElJkbCwaEy/rmU2qzCtAy9BVHoNES+TlGmXNGugZcIgHf
	i/ibvFU6T7P6zVlX8j/Wx1J+wUbscV6YbP+6PkIK7qFIyhaQ9+Lfk8unD7YkK5//XAw5/gLd1XP
	gn3vmrgcostBUfH7w7XoCC+23H0NOBQF/3q52FrccIVjUe6641v/Q3OjgLOgwwu3J7If3Z9KvkF
	a772nWVZVz1MpK5PiQzI4JbG3T7XhoDqFsQWlrBRY0ar3SnvId9gxjHpng2yQvRjy9opD9buRPE
	yktt6tuMhEMfosJG7vaVKCZqrlKK/yz78nJWymHjaqDGkFTP1CL/ACGhZmZmE1r/tdIN9lS9Eub
	eFNfOQUeP2fN+jk1XJowyxxGr86Wuj9FH35hqeJL11HaT63icO/rwaqg7asz0mHr+pzeLJwx8Ws
	dzbn00EY63ffwuMwkr7e4Y5A==
X-Received: by 2002:a05:6a20:6a05:b0:394:8455:d1aa with SMTP id adf61e73a8af0-39545ed55eamr16074081637.25.1772058026470;
        Wed, 25 Feb 2026 14:20:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037afe31sm3693376a91.16.2026.02.25.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:20:26 -0800 (PST)
Date: Thu, 26 Feb 2026 06:20:03 +0800
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
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aZ91NjoJLr--BEmZ@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>

On Tue, Jan 20, 2026 at 11:06:08PM +0400, Anton D. Stavinskii wrote:
> Introduced I2S nodes and internal dac and adc nodes as well
> The new header file provided in order to make DMA channel names
> more readable.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 55 ++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> new file mode 100644
> index 000000000000..6314bf6e9dc8
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#ifndef _SOPHGO_CV18XX_DMAMUX
> +#define _SOPHGO_CV18XX_DMAMUX
> +
> +#define DMA_I2S0_RX		0
> +#define DMA_I2S0_TX		1
> +#define DMA_I2S1_RX		2
> +#define DMA_I2S1_TX		3
> +#define DMA_I2S2_RX		4
> +#define DMA_I2S2_TX		5
> +#define DMA_I2S3_RX		6
> +#define DMA_I2S3_TX		7
> +#define DMA_UART0_RX	8
> +#define DMA_UART0_TX	9
> +#define DMA_UART1_RX	10
> +#define DMA_UART1_TX	11
> +#define DMA_UART2_RX	12
> +#define DMA_UART2_TX	13
> +#define DMA_UART3_RX	14
> +#define DMA_UART3_TX	15
> +#define DMA_SPI0_RX		16
> +#define DMA_SPI0_TX		17
> +#define DMA_SPI1_RX		18
> +#define DMA_SPI1_TX		19
> +#define DMA_SPI2_RX		20
> +#define DMA_SPI2_TX		21
> +#define DMA_SPI3_RX		22
> +#define DMA_SPI3_TX		23
> +#define DMA_I2C0_RX		24
> +#define DMA_I2C0_TX		25
> +#define DMA_I2C1_RX		26
> +#define DMA_I2C1_TX		27
> +#define DMA_I2C2_RX		28
> +#define DMA_I2C2_TX		29
> +#define DMA_I2C3_RX		30
> +#define DMA_I2C3_TX		31
> +#define DMA_I2C4_RX		32
> +#define DMA_I2C4_TX		33
> +#define DMA_TDM0_RX		34
> +#define DMA_TDM0_TX		35
> +#define DMA_TDM1_RX		36
> +#define DMA_AUDSRC		37
> +#define DMA_SPI_NAND	38
> +#define DMA_SPI_NOR		39
> +#define DMA_UART4_RX	40
> +#define DMA_UART4_TX	41
> +#define DMA_SPI_NOR1	42
> +
> +#define DMA_CPU_A53		0
> +#define DMA_CPU_C906_0	1
> +#define DMA_CPU_C906_1	2
> +
> +#endif // _SOPHGO_CV18XX_DMAMUX
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 06b0ce5a2db7..ebe5e8113939 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include "cv18xx-reset.h"
> +#include "cv180x-dmamux.h"
>  
>  / {
>  	#address-cells = <1>;
> @@ -448,6 +449,60 @@ usb: usb@4340000 {
>  			status = "disabled";
>  		};
>  
> +		i2s0: i2s@4100000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04100000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s1: i2s@4110000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04110000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S1>, <&clk CLK_SDMA_AUD1>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S1_RX 1>, <&dmamux DMA_I2S1_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s2: i2s@4120000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04120000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S2>, <&clk CLK_SDMA_AUD2>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S2_RX 1>, <&dmamux DMA_I2S2_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s3: i2s@4130000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04130000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +

> +		int_adc: codec@300a100 {
> +			compatible = "sophgo,cv1800b-sound-adc";
> +			#sound-dai-cells = <0>;
> +			reg = <0x300a100 0x100>;
> +			status = "disabled";
> +		};
> +
> +		int_dac: codec@300a000 {
> +			compatible = "sophgo,cv1800b-sound-dac";
> +			#sound-dai-cells = <0>;
> +			reg = <0x300a000 0x100>;
> +			status = "disabled";
> +		};
> +

Hi, Anton,

Can you send a new version with the all device nodes sorted by address?
So I can take them, Thanks.

Regards,
Inochi

>  		rtc@5025000 {
>  			compatible = "sophgo,cv1800b-rtc", "syscon";
>  			reg = <0x5025000 0x2000>;
> 
> -- 
> 2.43.0
> 
