Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3663B2BA
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668951; cv=none; b=MO94IU3thzYAlDCy38Ea7HSPbr8nE9Uwebt0gcmNWbct/q3Oo0a2W94c5Nz1L1nNzeSL3MgcyML7+mNFvmYyaHWKaSDazNzmb3Gfu0fcLSwJxxGom14LAELvKA49LPvKllW6OeYa4hk/kVP8WO01KL1AeFMUuxpXeZ0DNNTcL7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668951; c=relaxed/simple;
	bh=qrNHVwQacnhh0gn86fmgbUh3DdQ6BkJxXbWGWASTxTo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzNT4KzbBxLuyFNa3W9Iajwrzr/2h3TCoU2o8n9Z6xaT6ds6cIN9y1Cqh4VrrL0pWiSKFHpakjY4lrVeeJ+T4A713bR2M1Fe20xhyo/fW9DA0uB7Dsfr9tLAFCm9Eokdzo1Y7nnMVRyD39qNZJGc4t636aE4anNDZXTMnvTHF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgVls6dy; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgVls6dy"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3315759a91.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772668949; x=1773273749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fndfnkiJRWkhuW+xvek/3orGGPPXnFwo/ptLxjPpUVM=;
        b=QgVls6dylvhYzOWqj7jh61nLVyrK3+nzd3XS8Mi7IMyN7vKLYxcY2MnizYWp17A0tt
         7EWDYBXapIzKIocVFrsKfkCi3C1ouPQUvUtHXX6R5bVtgbIhZcnQIW+vvuXyInJ4V8SO
         yo6F09Bbjs1rC/oSKdylyPXhBxu4pefE+y7PEMjP+pxmaXTRwcr7owHYGirracLOYrvt
         57OSZwbwKhy96+loqZF6mEJ6AaN2Ic4tpyxVuIGXS2fO0t1lxb1VDwfrUFCDeQEdjHT4
         HYWKcUrOlR3Sq4gjiYhoH1Zd9PaaI/VqwEsz/StpYZ3nU+OOGFjxk8DH+jl+aam9zjna
         2nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668949; x=1773273749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fndfnkiJRWkhuW+xvek/3orGGPPXnFwo/ptLxjPpUVM=;
        b=if6TU4vAAHdyWTQ1d3V1yqvPvZghgT2LtuU8WzCr0eidAy9uR1cx/Nex40rGaTP6qM
         RLYcj8r3H2dBs48VQ0CfoSsZsQZRKwRsaIpBCL+2y/pbs0LroZGWPXmOzKURapHS3ZD5
         D+E1nliM1fYSSvncivpXZyK7Y9Q7vgnBAnEV2lpsUqzQdI4E2LYEuAzAZnleFOx5zXK3
         ve+pn4/+9SyFjNq0UgYzcC+KaYwv01n3fGgBt6u5+J+r0ETWAauWy0KVGP1lJ6bvwsvS
         kWKT4QUHpgOs642LSBY870QNE7+M8n+0WUNbY+rIYXs/O1tx50+fU+c6M4EytE2KoGcv
         4AcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi8Ei/B0WQgGwi3oKuKHkyj7L4l54hZjelTRVebspOnkLBV5XgVdVtOUgpBmkfPc2ObJRMSeu3RUqCPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoimMH13qcSdrrb2hFOuN5ma/ZZsKCmEyiRCDKuWA0Lz+jZylO
	DjvrAys/jIebTdKwCukT3cjPNXF8WCPbBnPDJWQOsC3Hc+Gk7O1BeZ9x
X-Gm-Gg: ATEYQzw2CKkyWAQVobkY/vylKXxfE2y6FO/FXlGNOMeTieZlVjqmg1xic6s3F1YZnUu
	3u1gYDYdYwCR/GbTvFZoB02fdb0BHwu8EHTtOnoWG44PBy/yghu7RsDvF6Jt4qHuj3Thh11R5mY
	yFyLHwiHDpuM0z5giubbz4cN3mYtDB954KptLuXH8Zg1pZXgEnFvU9eHrcCzN8HpCuVq+C3ZZlX
	Zmc+BnmlQxBhYeJK9PN7C6G2Dqic6Z7kXe76NmwEI9nQ9eKKf+na2C+/005MEBiUK8wv46OQcr6
	6bSAThix2rLBgncI1kDwt7kx+sRACuYriCgTj9ZJ8n/lVab7/JpSFBB8HAwjwJ2QGYg87sGRF/1
	QBQHps3WOfNtXhAPFtu2FAm7d5rA+l4jDD+sPdiZnGl73EZ1W5yXYqB7959yakM1VQqu64zKaTj
	ZdP1w51yEAwAYgqv8Su1rGXFs=
X-Received: by 2002:a17:90b:1a91:b0:359:7c55:c160 with SMTP id 98e67ed59e1d1-359a69da7d6mr3299580a91.13.1772668949367;
        Wed, 04 Mar 2026 16:02:29 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa1ff041sm1177382a91.3.2026.03.04.16.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:02:28 -0800 (PST)
Date: Thu, 5 Mar 2026 08:01:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aajGmn3KsZGsZlhz@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
 <aZ939evsOs6nCd5I@inochi.infowork>
 <aahuz5KJLL_rAZTH@anton.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aahuz5KJLL_rAZTH@anton.local>

On Wed, Mar 04, 2026 at 09:57:56PM +0400, Anton D. Stavinskii wrote:
> On Thu, Feb 26, 2026 at 06:32:27AM +0400, Inochi Amaoto wrote:
> 
> > > +#define DMA_CPU_A53		0
> > > +#define DMA_CPU_C906_0	1
> > > +#define DMA_CPU_C906_1	2
> > > +
> > > +#endif // _SOPHGO_CV18XX_DMAMUX
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > index 06b0ce5a2db7..ebe5e8113939 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > @@ -8,6 +8,7 @@
> > >  #include <dt-bindings/gpio/gpio.h>
> > >  #include <dt-bindings/interrupt-controller/irq.h>
> > >  #include "cv18xx-reset.h"
> > > +#include "cv180x-dmamux.h"
> > >  
> > >  / {
> > >  	#address-cells = <1>;
> > > @@ -448,6 +449,60 @@ usb: usb@4340000 {
> > >  			status = "disabled";
> > >  		};
> > >  
> > > +		i2s0: i2s@4100000 {
> > > +			compatible = "sophgo,cv1800b-i2s";
> > > +			reg = <0x04100000 0x1000>;
> > > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > > +			clock-names = "i2s", "mclk";
> > > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > > +			dma-names = "rx", "tx";
> > > +			status = "disabled";
> > > +		};
> > 
> > This magic number 1 is bind to the RISC-V cores, I think we should add a
> > macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
> > Or, just let the borad dts configure which dma is enabled.
> 
> Hi, Inochi. Sorry for delay, I've missed the messages somehow. 
> I'm not sure what is the best option TBH. 
> If the problem is with the magic number, there are constants for this in your
> file:
> #define DMA_CPU_A53        0
> #define DMA_CPU_C906_0     1
> #define DMA_CPU_C906_1     2
> 
> So I could use them. 
> 
> If the problem with hardcoding the CPU - it is little bit more tricky. 
> Ths commit is in the riscv branch so we could not use ID 0 at all.
> Unless you want it to be more generic.
> From my understanding we could not boot from CPUID 2. (may be i'm wrong
> here) If it is correct, it means the whole setup will only work on CPU
> 1. 
> 

Yes, that's true, the only boot cores are 0 (A53) or 1 (C906_0).
And You only need to take care of these two cores. And the ARM
DTS you can just find it in the arch/arm64/boot/dts/sophgo.

Or, just let the board determine the DMA required, as the DMA
channel is shared across many devices. So it may be better to
not allocate them without enabling the device.

> In any case I will follow your suggestion. I agree, leaving this with 
> the magic number is not good. 
> 
> 
> Second question: 
> Do you want me to resubmit this change as A separate patch as the rest
> of this patch was applied? 
> 
> 

A separate patch or a new version with this single patch are both
fine to me. But you are always required to add the changelog and
link to the old versions. Otherwise, others are lost the information
about this.

Regards,
INochi
