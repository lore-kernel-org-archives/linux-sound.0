Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA034D4EB
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647085; cv=none; b=XC6tca7Ejqp/ThPli8oYU4zUJ6+q8/fSvi/yIHNsSZ60HrNjU3QLiLgNHV3i1Epxz53pOoPekNhyLbX6HuM6J5d/rL328SPzaoPtf6L8ec6uUc636IiSudSWLvbpog7Ew6zVvaT3jZcpO31wF/dKpPGO6VfgED6VdoYJcMxxnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647085; c=relaxed/simple;
	bh=kD2QH8t4ii2+KFV/KGuDMZq9ZU8V8+zutfjGr5AYUE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GExaSvqxwcH+TTOgZqNBdRZhDo8yxB9Gu4AVSAHLfieKDmXF5+PPPPTnqyQ8jd/f/oLmk323re6vVoGDCRRyLv91fTQF9Ftw+5ZDv0+667m5B4XSKY1+3ScpB5krTTs6MnYzz3P2sYGqdY+hdEqifGCbDE3hyv51ItDZ0znlLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJvhtmrl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJvhtmrl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so59294325e9.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647082; x=1773251882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rq5hYgf0faXia9cxwlRkLJL71Mpw7xbT+1o0WoNrPw=;
        b=WJvhtmrl5SkRmPvSF8lnvcT6UdZQQozqzpcMb5ABlNEtpyFEMxtGKq6DBrKyfL65ue
         Hcir2qfaeRimVuET92ab2r+1vPYm32/NaZRUtyBBnLpMpcf2n1iWZFhvXyzQYy5CB8X8
         KDnqJXnQcgmfVB1eJMcFhv+kGMSV5PydYBBcuPDrO87rFJkTy9vcxK+125E+5buGSr5S
         Lp88uZIzp18+o8lHZdnrsXbGReDZica7zskF2FDjRuRCeBzUpCBsVIb1I0hIT2c7XCHc
         YdNe/bZxUV3NvNtRSy7WsmvplKO7vGFXD/kaUFzWMWXuRYbQegAnsDndi5YnN5eW0ZxU
         J7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647082; x=1773251882;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rq5hYgf0faXia9cxwlRkLJL71Mpw7xbT+1o0WoNrPw=;
        b=DM7tjtTddK0TeogQMo36n5B8CnNQ/FggWwQqVa6H63Yu/tYmGTyKKB25Rjelx88LXH
         pZchYMovSXZQoqKNCOdHM5tW3XUc03aFC27Wol3ECkLnpXjbeoTsoZ5aNupgSKATMTvX
         3Sb1aOd+HNFpVkDvTepprvaY0cOAqQ8VXN4BdrSzgjEZF+JaMobfVBqShthm3v2IzV6V
         nAOA132nxjv5EoyBzThEhWHPW8vH0vN6gmrHQlQUpxxPsphOwCVYIokVMbnsv8isvTiQ
         o9xqrJ88daVurA+R5sGx4frwcEqk6wItZ0gdErIVYH/TWKDE3pooFJgHsx52DhFvblRI
         RQhg==
X-Forwarded-Encrypted: i=1; AJvYcCWMvbfhVbBKxcIiWk662MJEcCZRHwwqWCqJdRt1R+6BIsTSQRnHlwcqu9WkxmyezydSyYacxfLGA+jmpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6h3SQYSX5Ff0HwK08fUm9k1tc5gxl/2PRcWwoPvCFPyF2V2Xe
	xejot0pLWS410OzV6PcbHuDN9NIn0fGe1e3BwWPAXiJjcruBoJde64XD
X-Gm-Gg: ATEYQzyXBy/J07hjI/qrQ0FJNsHK1fWjEqkHFzHzITpf0atUTRvDQsJILWz25XJFBV3
	j1WgNkabZADUaESCCQNa+hNx3STC2HO5pF/ggiKccUf9mRQMrwK/t+mSKhK/lkCBYVsYhCZ1TH6
	/GWyqjgByX98UvmAIJRmfq5NYM2XGXe6xdok4hCtiDUtmwE6eAx/iSPfMBKgT7IinzdJqqPUg8Q
	I/RQVMTo8ARZHTmmWGvUbnCx+2sSqUDSVMNvEStScTWLsxsp0o1Hhox19TstOfG3bgQkrXLF156
	80F+YH+p2T6aZsFKjNmpcZW0atcWd5VeG4LiadUCbbK0lWaYpoOaqObIwY7EDuZ5HUvX/7LsKZH
	jDHusQb34IQTJ0cvLsGjLyk9BWK1bHOaJeKIhGD+04iCQVyC3TJP8EXLUuyLHB3tB5G3iW/pN/j
	jRKCJJLyrVlWSKTBBqO147VbSPtMp7jv3hI48WMyOs46qijvKEOS5BKKa7unsDUCq14A9C5Q==
X-Received: by 2002:a05:600c:c163:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-485198749b6mr51102325e9.21.1772647082156;
        Wed, 04 Mar 2026 09:58:02 -0800 (PST)
Received: from anton.local (bba-217-164-166-37.alshamil.net.ae. [217.164.166.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acf9c31sm13254295e9.12.2026.03.04.09.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:58:01 -0800 (PST)
Date: Wed, 4 Mar 2026 21:57:56 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aahuz5KJLL_rAZTH@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
 <aZ939evsOs6nCd5I@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ939evsOs6nCd5I@inochi.infowork>

On Thu, Feb 26, 2026 at 06:32:27AM +0400, Inochi Amaoto wrote:

> > +#define DMA_CPU_A53		0
> > +#define DMA_CPU_C906_0	1
> > +#define DMA_CPU_C906_1	2
> > +
> > +#endif // _SOPHGO_CV18XX_DMAMUX
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..ebe5e8113939 100644
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
> > @@ -448,6 +449,60 @@ usb: usb@4340000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		i2s0: i2s@4100000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04100000 0x1000>;
> > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > +			clock-names = "i2s", "mclk";
> > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > +			dma-names = "rx", "tx";
> > +			status = "disabled";
> > +		};
> 
> This magic number 1 is bind to the RISC-V cores, I think we should add a
> macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
> Or, just let the borad dts configure which dma is enabled.

Hi, Inochi. Sorry for delay, I've missed the messages somehow. 
I'm not sure what is the best option TBH. 
If the problem is with the magic number, there are constants for this in your
file:
#define DMA_CPU_A53        0
#define DMA_CPU_C906_0     1
#define DMA_CPU_C906_1     2

So I could use them. 

If the problem with hardcoding the CPU - it is little bit more tricky. 
Ths commit is in the riscv branch so we could not use ID 0 at all.
Unless you want it to be more generic.
From my understanding we could not boot from CPUID 2. (may be i'm wrong
here) If it is correct, it means the whole setup will only work on CPU
1. 

In any case I will follow your suggestion. I agree, leaving this with 
the magic number is not good. 


Second question: 
Do you want me to resubmit this change as A separate patch as the rest
of this patch was applied? 


> 
> Regards,
> Inochi
> 

