Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64119DFB4;
	Mon, 20 Jan 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363724; cv=none; b=fBgsoRraYT3x9Y4wvO4eSi+l57z+JRCGX+ICmDSTc4i4nVe1dsXbvQW0aNGJtLZpAKHZO66zs4GHd0Q7Ohx7xp5g5nUQYxHhpfUgOo3MHr8oKcVtcJCXq0FighoD6DYYXqnQfQM+bYYhhApL39Uy3EbBIlbXJfU/g6nY+D4SScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363724; c=relaxed/simple;
	bh=YP/asl0ktuAJ+7lkx9uBG8Zp8T+WKtOvDkKSxE7Zxj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvEziKEoVURGPMt5b6FMhFK7b4zxLThhqijzG2+1Xosjd/N6HMWTesLH+letTQEJd3qe0Fanmc0qk7Zy2yyb4CCs3bTNx/epxVAgLfh6KUsIJCKuRO8TNQ0NhitbpkH6L657UOCGePZLfskw+ZJf8f5YyFfPwiNqR1MFeZfUMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUAIbwEB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUAIbwEB"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so5589983e87.1;
        Mon, 20 Jan 2025 01:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363720; x=1737968520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SkrNC4OKrwBslXKn2lY94InL2WdhCv1RHq6pIDaZsc=;
        b=TUAIbwEBB56Sgl3IMZmZKTJ3iO4NyPbJx5yucKfrIATk2ZM3rwHnS+JWDDoQbMM83j
         wM2jd8mE7eFBwXD84rknytZ/ulVlUtGyZwYhiJty2fQnrIuAV8gtX+rSq67Mi3BrQEap
         l7l5E5hbfvOaZ3/U8kdKGntnURO/C3Pdou9ITBGlFaigmU0bixb99ngkcDks6tIHt84m
         00ZQMdWkIutIpkAYonILMbB/Gk2WZ+1FJCXICykY7C7jGbefY26788eB6R0KMeRelzXm
         JVFESKQhE0+NnR7z51R0EGuE7BJy3VJyZV0WjeSIH2SaNNeueyc/MvXJQk/T73zoxx0l
         P+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363720; x=1737968520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SkrNC4OKrwBslXKn2lY94InL2WdhCv1RHq6pIDaZsc=;
        b=JBvjoVbP8moIYUmVxtWOqabnMbN88/SKCr9PPY2EKr8c+ORkq7Y8mKtoxp7OG4SXly
         XtfGSgCBUwSBwLZFyinASLu85qW3SYLAvFQmsqIrgBo+BoIjU77upoW0Wlg0iFT80U55
         MAv7C6HuCOCwvHI8j0cbOW7PM3ZU+3ncGBW55KuNLleE4bI4obXEQOLC+Osx2EGCzhHr
         ciGSEKU2zGOpPLnnz1QfsV0XUkU+ob7IUjOVyH8MHlk9DGyrZX/au8RqJ6JvJw2Yo+CF
         /Q3ofi6DhQsaOqAo5Ba9vnf7I51JcjCf+ZS0chCZm55Y1HFvcU+aG5MSOqywUyvAswrN
         9xPw==
X-Forwarded-Encrypted: i=1; AJvYcCUL8HVu/d5hQ2MBn/9jdHYrZODX7w+tNXHMsR/C6s2MczXBRkFpEvy/MPgNxDd4FptTHi7HYvtFxfA24Rrd@vger.kernel.org, AJvYcCWjSpaGJo9pkmoFzhEGHlde/Ju53WWlY1gU/Ii4EpUDyCDohzZEzjuCXmR006tuhFZddd6THprI64jz@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOVaOgbp5EziYgabQ9vrQU+KxxlNe/Phhcsh8dWLqXR1YJQT1
	HbHOURsGnL1hrPAVXWbjDKbeYLOCS8A9rQ3A7Bdo7Sk/YmAkcIW4
X-Gm-Gg: ASbGncuOz/KoUGf2XYy1kNDgHpET+0dcy8HCMadB9rojwhu6knU9rIkJCrKFADrF1uN
	zA0llPfbmgKLe6+iUZRQloXaR5YB1gqFF1DMRtnqRVeaIEfqNtkHnV1EKQvXa5nR7AN92p29nsG
	Iwj54jd2OddSx3VcTifc6tTo2kYL1aDDJ7tsaDV/VbuD32dfaO4i/8C+ZlhKZ88XLSsRTbqqBqd
	N+ghf6ht7+7kmCg7bBN5JSaN5frlssSKI1QwoeV6u846oyDa4vZ7ZRAkijFSAqJhsRXZag=
X-Google-Smtp-Source: AGHT+IGC7FCazsrX10UnVTI4JyBQvROZIT3aDBV34LerB5P0S0R4EmhZ2kEAeo8emEvzObroak2BsQ==
X-Received: by 2002:a05:6512:1250:b0:542:215f:e615 with SMTP id 2adb3069b0e04-5439bfad838mr4216453e87.16.1737363719979;
        Mon, 20 Jan 2025 01:01:59 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:01:58 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 13:01:28 +0400
Subject: [PATCH 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s)
 device trees
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rk3588-spdif-v1-2-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=5537;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=YP/asl0ktuAJ+7lkx9uBG8Zp8T+WKtOvDkKSxE7Zxj8=;
 b=tTVe1SaVvi1gG1B2uuR2l3PrPdSsc6F5m8rEBlrbsDtsHLd5lFHOeLy577Pd8XyAZL4oLM/6G
 CMTJV5jt9FFAJsCTf87cT3AnlWpO+PkVU+pxwKRJpYrfGs/iNw6Mh1R
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=

RK3588s has four SPDIF transmitters, and the full RK3588 has six.
They are software compatible to RK3568 ones. Add respective nodes
to .dtsi files.

Adapted from vendor sources at [1] and [2], respectively

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
[2] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3588.dtsi

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 64 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 30 ++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..07e8c5aeb45b22db71ac5bc27f812a2d3347a463 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1318,6 +1318,21 @@ vop_mmu: iommu@fdd97e00 {
 		status = "disabled";
 	};
 
+	spdif_tx2: spdif-tx@fddb0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfddb0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF2_DP0_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF2>, <&cru HCLK_SPDIF2_DP0>;
+		dma-names = "tx";
+		dmas = <&dmac1 6>;
+		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s4_8ch: i2s@fddc0000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddc0000 0x0 0x1000>;
@@ -1335,6 +1350,21 @@ i2s4_8ch: i2s@fddc0000 {
 		status = "disabled";
 	};
 
+	spdif_tx3: spdif-tx@fdde0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfdde0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF3_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF3>, <&cru HCLK_SPDIF3>;
+		dma-names = "tx";
+		dmas = <&dmac1 7>;
+		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO1>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s5_8ch: i2s@fddf0000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddf0000 0x0 0x1000>;
@@ -2016,6 +2046,40 @@ &i2s3_sdi
 		status = "disabled";
 	};
 
+	spdif_tx0: spdif-tx@fe4e0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfe4e0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF0_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF0>, <&cru HCLK_SPDIF0>;
+		dma-names = "tx";
+		dmas = <&dmac0 5>;
+		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
+		pinctrl-0 = <&spdif0m0_tx>;
+		pinctrl-names = "default";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	spdif_tx1: spdif-tx@fe4f0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfe4f0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF1_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF1>, <&cru HCLK_SPDIF1>;
+		dma-names = "tx";
+		dmas = <&dmac1 5>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
+		pinctrl-0 = <&spdif1m0_tx>;
+		pinctrl-names = "default";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@fe600000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0xfe600000 0 0x10000>, /* GICD */
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 4a950907ea6f51c1d4123d52b73b726226db37bc..505cdd7b518ed687865deebcad553fe92b111fd8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -67,6 +67,21 @@ u2phy1_otg: otg-port {
 		};
 	};
 
+	spdif_tx5: spdif-tx@fddb8000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfddb8000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF5_DP1_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF5>, <&cru HCLK_SPDIF5_DP1>;
+		dma-names = "tx";
+		dmas = <&dmac1 22>;
+		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s8_8ch: i2s@fddc8000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddc8000 0x0 0x1000>;
@@ -84,6 +99,21 @@ i2s8_8ch: i2s@fddc8000 {
 		status = "disabled";
 	};
 
+	spdif_tx4: spdif-tx@fdde8000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfdde8000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF4_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF4>, <&cru HCLK_SPDIF4>;
+		dma-names = "tx";
+		dmas = <&dmac1 8>;
+		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO1>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s6_8ch: i2s@fddf4000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddf4000 0x0 0x1000>;

-- 
2.48.1

