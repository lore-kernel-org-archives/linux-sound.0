Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3889532B988
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740068; cv=none; b=oQ0ZHVYlIQjTU8JwD51rqUIAnUDnKMQew6z5p77twqJ/Ok37xEBB+qUEnNfoabzvxEBHoEh5TigRmpHFldE1nBFRi98mVvCDl/BQNlpb8B3JZhpmgNNOurmqgRyc6mlX4ERW/BovJ7pqnr5GVtWESmyb6CzJc8Kh+wlTeEJZl+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740068; c=relaxed/simple;
	bh=0XrcyyqWegCnbhh8oOlleDPt2lNgaxbQNhQ9rMr79I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tK+H8bu8QzKFFqs588E925oKpKeA9TbAe3yIgGraJZeEQJ56FDdS16eY2up1h9x5g+FcXuJxhSkkNH/Scj+450ZXolzyYMjCjWv04TIoBS5AWi1KNYzgaM9qxg6+DTpXW+oZQizDEx9pqi2t+pUMgwz41T9EOnVSJWMWvpILQvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXjzg8xZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXjzg8xZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432dc56951eso2291926f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768740065; x=1769344865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8WYraWdl/meIzynkx/iFk+ZbBcfbnztLQ6j8m4tIWQ=;
        b=NXjzg8xZBQ8IEY/QPIAWQWJgiDi9dx9QhqHRbkP7Orhb27MAj/wERmO9zWDnV47g+y
         kt9CTJ+MXJJxHCYMXZsD2X1dZ0xUFtYBZJrq68cE3louWHzzYfJtfOmA9LX0ft0HYL7M
         1OnSQETF50AxxRAycdIWABRs9jP4L3X6mWXzNFgYPzWi/1JRRvpCeeyvZbR6Tr7lp8XL
         oiQAMThVaOXQt6C6q/6WYuTVb5rfkIzMVo8/tMxaWidFJ428I+C6gwu8BBo8Ct9gGMIE
         wp7LToxPNSW/aQj/fPPMH4xEPwk5hHRxjtRmtMpGJgKkztDLn2x7a7Y7s/Lt/djrYfKm
         JBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768740065; x=1769344865;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8WYraWdl/meIzynkx/iFk+ZbBcfbnztLQ6j8m4tIWQ=;
        b=RESfd/f8AfRj/wWSsq9vTnvSSVI3bb9zhcGp5UCo5ccXB0DPmuhCj1e5p+iT5e+qzv
         txDA5MjcZr8UBE3cTs2S+Q3EDd4OH2satDj0KCTYit5zkUXg3c3H70U4opDCv9Jk+lRQ
         HJm68tZds+hbxoyBV1U7UKRe4pfzpHpUJMuu0R2h5zNGb8PMB9rpKqc3QpZ9nQaTPPbx
         dk+qOds+1BHS8l77DcfTGwFh7oXI9BA4Ofqe9+i36+x/bl367NI2RVTCMLlhP/DOSI+V
         hoalj6jWFjXYwxuqUDQ3saBGU8zIezZgc2u1Hj4DtC5eETl/BVdYW+/0JvbJkpkzJo7W
         AAQA==
X-Forwarded-Encrypted: i=1; AJvYcCUgRh9yH+HECRih4101vmG77WoEGXw/7IVyh1/9iCOprkxL0VW6NGfp2Hv97ltIFsLdCmubpxlXn+sdnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJq0F4n9pML2ifs57qeiBR+TECvK+GDkqgk5UeVagcA7Y9bu33
	qb9TrxutxSF4K+SV2IjNsEzpGs4ljGR146TBcCarqTPVDJSSJ04ZcbCE
X-Gm-Gg: AY/fxX583IEHMKGjptt2t7T4z9qxFCcWsdL8J9Vr2PgvToCNLqrnbibnlbNUJTVamuP
	jo9AXmw1waMIUmUymjEzKZhneSlw9TiOfxjnQHH0jPuB2dFePbr1WcdC1geteLV8CWgTyvSvSBa
	IHbRemmt3BvK0u7pypF27e5ryKFG5FlUOxJzrH5KrAza/kkRhIjaY7UQ+2THMpvfPJBox8Dk9P8
	/FbQSKeJ9fz8CYvWvaDfbHoWCuaOB4qc9W+ENsfh4ktaEh3C7utvayeYfxovC2Bmwx+/46oMz+d
	EndrmjuZjYz7zYrtXOXHbcn1RyEogY8LZ7H5chcqUd7yvPgb5hpWaMAtceOtWzrNzVUnVWgZ2vL
	BFlLuzF+9rlkoCmWxBNzanO11ah3X6k5Q46UkKELr86TJzcOq1UjvpM5e9epZpYBAA3YhOEaaz4
	0DSptjP2zf+d06YEqDBj+95M9YtPkuS+vG4dTxAFUKteFTiaM6rtk5Z+eHqVw=
X-Received: by 2002:a05:6000:2003:b0:430:fcf5:495c with SMTP id ffacd0b85a97d-4356996f588mr9620388f8f.4.1768740065405;
        Sun, 18 Jan 2026 04:41:05 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm16712957f8f.9.2026.01.18.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:41:03 -0800 (PST)
Date: Sun, 18 Jan 2026 16:40:59 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 7/7] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aWzUaf7t96FhtbNq@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-7-d10055f68368@gmail.com>
 <20260118-deer-of-therapeutic-science-0958d4@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-deer-of-therapeutic-science-0958d4@quoll>

On Sun, Jan 18, 2026 at 11:16:48AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:59AM +0400, Anton D. Stavinskii wrote:
> > Introduced I2S nodes and internal dac and adc nodes as well
> > The new header file provided in order to make DMA channel names
> > more readable.
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 +++++++++++++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 63 ++++++++++++++++++++++++++++++
> >  2 files changed, 120 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> > new file mode 100644
> > index 000000000000..6314bf6e9dc8
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> > @@ -0,0 +1,57 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#ifndef _SOPHGO_CV18XX_DMAMUX
> > +#define _SOPHGO_CV18XX_DMAMUX
> > +
> > +#define DMA_I2S0_RX		0
> > +#define DMA_I2S0_TX		1
> > +#define DMA_I2S1_RX		2
> > +#define DMA_I2S1_TX		3
> > +#define DMA_I2S2_RX		4
> > +#define DMA_I2S2_TX		5
> > +#define DMA_I2S3_RX		6
> > +#define DMA_I2S3_TX		7
> > +#define DMA_UART0_RX	8
> > +#define DMA_UART0_TX	9
> > +#define DMA_UART1_RX	10
> > +#define DMA_UART1_TX	11
> > +#define DMA_UART2_RX	12
> > +#define DMA_UART2_TX	13
> > +#define DMA_UART3_RX	14
> > +#define DMA_UART3_TX	15
> > +#define DMA_SPI0_RX		16
> > +#define DMA_SPI0_TX		17
> > +#define DMA_SPI1_RX		18
> > +#define DMA_SPI1_TX		19
> > +#define DMA_SPI2_RX		20
> > +#define DMA_SPI2_TX		21
> > +#define DMA_SPI3_RX		22
> > +#define DMA_SPI3_TX		23
> > +#define DMA_I2C0_RX		24
> > +#define DMA_I2C0_TX		25
> > +#define DMA_I2C1_RX		26
> > +#define DMA_I2C1_TX		27
> > +#define DMA_I2C2_RX		28
> > +#define DMA_I2C2_TX		29
> > +#define DMA_I2C3_RX		30
> > +#define DMA_I2C3_TX		31
> > +#define DMA_I2C4_RX		32
> > +#define DMA_I2C4_TX		33
> > +#define DMA_TDM0_RX		34
> > +#define DMA_TDM0_TX		35
> > +#define DMA_TDM1_RX		36
> > +#define DMA_AUDSRC		37
> > +#define DMA_SPI_NAND	38
> > +#define DMA_SPI_NOR		39
> > +#define DMA_UART4_RX	40
> > +#define DMA_UART4_TX	41
> > +#define DMA_SPI_NOR1	42
> > +
> > +#define DMA_CPU_A53		0
> > +#define DMA_CPU_C906_0	1
> > +#define DMA_CPU_C906_1	2
> > +
> > +#endif // _SOPHGO_CV18XX_DMAMUX
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..5a56951f7e4c 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include "cv18xx-reset.h"
> > +#include "cv180x-dmamux.h"
> >  
> >  / {
> >  	#address-cells = <1>;
> > @@ -448,6 +449,68 @@ usb: usb@4340000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		i2s0: i2s@4100000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04100000 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> 
> Really, why are you putting cells everywhere?
My bad. It was misunderstanding from my side. Will drop everywhere it needs to be dropped. Thanks for you
patience. 
> 
> > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > +			clock-names = "i2s", "mclk";
> > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > +			dma-names = "rx", "tx";
> > +			status = "disabled";
> > +		};
> > +
> > +		i2s1: i2s@4110000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04110000 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> 
> 
> Best regards,
> Krzysztof
> 
