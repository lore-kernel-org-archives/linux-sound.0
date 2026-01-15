Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD34326D69
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 01:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526420; cv=none; b=S3nwjEwYvujq0Erv6Hd4FuW8xvf3P43BPgQP3bkJ4wOY2+n8ARDfx4z5dq3+7b+eRMDBhVmdXdD2h1eZSUNXUeSiCu0GgUxh5pO55dJQh+QQadC1qrWcaVYJ6moHTi7UKN1vmXZ5t9sgYOccQ/SKc9NEnF6MQrCJZbUiLbFts7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526420; c=relaxed/simple;
	bh=kH8r3tneBhWddDkW5vJnfMdoCvpPIOUYi/m0/Q0lvgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbnL/YYaMwJFhuANZPED07zbQZuWLncmQSndt+ylGHM5LErqnQn+yuHHIvb+Q7cgXwN5lAZV0tD66Eh62zzl6SG5+OXnppCuDZhgo/aErlRHyWzBXtvSOLU8jytVosG08sVXaRUPg31chsoHmG4FCg+UJz8caw7f8RY38rzbVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEg6bHmO; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEg6bHmO"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c537a42b53so233699385a.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 17:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768526411; x=1769131211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1PuIc2lRMstuB52aa6xr0OJ5o8vdZJx7Gp6DDwvECc=;
        b=mEg6bHmOr7oOCZp+VqzbKMgPywZyaXzGiY9BeSNEdj8gQWw4GHQGhxX8h3rXMoFbvG
         szgrvCgZ+yHVXoOnjzCW3FeatkIXBqn+i7qaYcD8TSIAHnZoDsok/dd5kGLBXvoDxYzc
         XmQdHNtLAhexrfv/q37/gEq1a77YVLK8D8cHqsBQRSDDKHEHyi1KT1o98EVjNX8hW8CS
         TYYPhG1vsA1upiYL2yLECe05KzqLlIh0Hfp8zfvHjqCTrh33kWdwAWsd24yIpW3yt4gE
         uu2o2BW3+v1AWJsZgpBuu9R89MFdZxVwpP2KvVYbwAcw1L8WEjIro/+piBreHTpS9dew
         WnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526411; x=1769131211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1PuIc2lRMstuB52aa6xr0OJ5o8vdZJx7Gp6DDwvECc=;
        b=F4A/jTrAMlpKXbDKBhE9zUv2QSpEFxC+8vCFRC4PqBYXh3bI0aMlL6bM+jorkvzi0j
         Mj5cqQwAKhIb91YgV1tzfoeGGmyx76kSDungT/uC3kWeQiiRpPQJ4A30ZtdcL9x8ys1T
         g4Ccy/oR34p3yHcPB+5zx7FqFp0QelYXck5y7f7SLre8wk/B9X6E3y8cZrEmw7nYwBmI
         4UgkjKwLWzv4aiLctieP623shmOIKbtPRaO7+Cs/emyw09IWQSPWTqUPfxQ1Q43/QSmh
         GVOvKuPHSTqaVZNuCEqqJdIgUhvWnGwu3o4rMYRKS2VXM+i8G0YZqkrp0hk05XNcdmpN
         4NAg==
X-Gm-Message-State: AOJu0Yxgd+wwLdVlBgo8XDYHKGIkozI1RL38kbEWCG58loAkfqZ7bMpj
	uNQZ5CqCKplvpVe8S2k6aOSNZswPwSg2OGFRw5Wm9A8bRLf9eR2yjXMkdmnLQ9GjU2A=
X-Gm-Gg: AY/fxX5iGIj2XxDONVYN3mUuutkN4PsEizPZwJIghs11SRkYMdnNOYQaYXJV+zERffq
	2MHBZoZKVWCx9KT1396JabNTv/u3ZuREhWnPAH+ww1OVUir6WUUF9pKLksjjwtr8Z9J7SnsiJjr
	fXvixUt7vWlNoHyoSCxGVpIwDBYXlQUQEoGWDReoGtbmf0H4sjip+r+vGcUH62IYV4oDvj/Nnov
	OGFlGMghVjKN+Z5/cATPb+qugOOeI4DrjCEwaQm9aYDdZAHt3Lb9EE1u6+Z0UZuuhOEklyvb0bV
	jFvnR2NySbq7moJrj75vS2Vy2FUwfvI0Vr7w+uUequLOOeSBi968NiV5/OsTz0GmLNa5GBg4TIj
	bFg1+J9iD1d0cqT4v/mqXgTfv1KBh1iivcLKaafgDVtgHy5PBV9MXoKLR1cPOFbQXGGeJXyF/H6
	1CVjGBPJi6sQ==
X-Received: by 2002:a05:7301:fa0d:b0:2ae:5076:b6a with SMTP id 5a478bee46e88-2b6b48115f4mr1246860eec.19.1768520118610;
        Thu, 15 Jan 2026 15:35:18 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3651f39sm728550eec.24.2026.01.15.15.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:35:18 -0800 (PST)
Date: Fri, 16 Jan 2026 07:35:13 +0800
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
Subject: Re: [PATCH 8/8] riscv: dts: sophgo: add Milk-V Duo 256M board dts
Message-ID: <aWl5fZKayAHmoES4@inochi.infowork>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <20260115-cv1800b-i2s-driver-v1-8-e8b22b8578ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-8-e8b22b8578ab@gmail.com>

On Thu, Jan 15, 2026 at 11:17:45PM +0400, Anton D. Stavinskii wrote:
> Example of usage internal dac/adc and external I2S mic
> The example shows how to use the card and
> will actually work other boards.
> Fixed clocks needed to make simple card make
> initial .set_sysclk with proper clock rates.
> Same for DAC. I2S3 has to be started not only
> for DAC but for the ADC also because it
> provides mclk for both.
> 
> dai-link@2 will only work if registers
> are set according to this issue
> https://github.com/sophgo/sophgo-doc/issues/174#event-21395297524
> in other case i2s2 will not output clocks and data.
> Those changes are not connected to the driver itself,
> but for another subsystem which is not yet ipmlemented.
> The following config properly works for MilkV Duo/256Mm, Module.
> Basically everything with sg2000/sg2002 but on some boards
> i2s2 output pins are soldered to Ethernet module.
> In Milk 256M they are free to use as external DAC/ADC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile                |   1 +
>  .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++++++++++++++++
>  2 files changed, 232 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..c8901ff680cb 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -6,3 +6,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo-256m.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts
> new file mode 100644
> index 000000000000..cc33c4355969
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +
> +/ {
> +	model = "Milk-V duo 256M";
> +	compatible = "milkv,duo-256m",
> +	"sipeed,licheerv-nano",
> +	"sophgo,sg2002";
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +			<PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +			<PINMUX(PIN_SD0_D1, 0)>,
> +			<PINMUX(PIN_SD0_D2, 0)>,
> +			<PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +};
> +
> +&usb {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +	g-rx-fifo-size = <1536>;
> +	g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&dmamux {
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	i2s2_cfg: i2s2-cfg {
> +		i2s2-out-pins {
> +			pinmux = <PINMUX(PIN_ETH_TXM, 7)>,
> +			<PINMUX(PIN_ETH_RXP,  7)>,
> +			<PINMUX(PIN_ETH_RXM,  7)>;
> +
> +			drive-strength-microamp = <15700>;
> +			power-source = <1800>;
> +		};
> +
> +		i2s2-in-pins {
> +			pinmux = <PINMUX(PIN_ETH_TXP, 7)>;
> +			power-source = <1800>;
> +		};
> +	};
> +};
> +
> +&i2s0 {
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +&i2s2 {
> +	pinctrl-0 = <&i2s2_cfg>;
> +	pinctrl-names = "default";
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +&i2s3 {
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};
> +
> +/ {

> +	int_adc: codec@300a100 {
> +		compatible = "sophgo,cv1800b-sound-adc";
> +		#sound-dai-cells = <0>;
> +		reg = <0x300a100 0x100>;
> +	};
> +
> +	int_dac: codec@300a000 {
> +		compatible = "sophgo,cv1800b-sound-dac";
> +		#sound-dai-cells = <0>;
> +		reg = <0x300a000 0x100>;
> +	};
> +

Move these two nodes into cv180x.dtsi, others are not allowed
in this patch series, use a separate patch instead.

Regards,
Inochi


> +	ext_adc: my-ext-adc {
> +		compatible = "invensense,ics43432";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "cv1800b card";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "i2s";
> +			bitclock-master = <&clock_master0>;
> +			frame-master = <&clock_master0>;
> +
> +			codec {
> +				sound-dai = <&int_dac>;
> +			};
> +
> +			clock_master0: cpu {
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				system-clock-direction-out;
> +				mclk-fs = <256>;
> +				sound-dai = <&i2s3>;
> +			};
> +		};
> +
> +		simple-audio-card,dai-link@1 {
> +			reg = <1>;
> +			format = "i2s";
> +			bitclock-master = <&clock_master1>;
> +			frame-master = <&clock_master1>;
> +
> +			clock_master1: codec {
> +				mclk-fs = <256>;
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				sound-dai = <&int_adc>;
> +			};
> +
> +			cpu {
> +				mclk-fs = <256>;
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				sound-dai = <&i2s0>;
> +			};
> +		};
> +
> +		simple-audio-card,dai-link@2 {
> +			reg = <2>;
> +			format = "i2s";
> +			bitclock-master = <&clock_master2>;
> +			frame-master = <&clock_master2>;
> +
> +			codec {
> +				sound-dai = <&ext_adc>;
> +			};
> +
> +			clock_master2: cpu {
> +				mclk-fs = <256>;
> +				system-clock-frequency = <12288000>;
> +				system-clock-fixed;
> +				sound-dai = <&i2s2>;
> +			};
> +		};
> +	};
> +};
> 
> -- 
> 2.43.0
> 
