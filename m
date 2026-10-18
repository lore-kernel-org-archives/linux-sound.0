Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0BD3955D7
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318738; cv=none; b=C/ZuP/zvYc66dTgd6DtlA4wJevYfwYWyjZy7/qRHmS+zVRXgK46ypKXXBMq5/FTkwTVq6XVWStI/mbhgzRIgaMvEILas/qHPacH3l172alBXH0tfl4byVgWlKuV8lx6tIqxgCrm+uoKEqAap3OWepEr6h1D+0Kfpfn0mXUdxkIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318738; c=relaxed/simple;
	bh=BTkEujrtoKKaX+uvUffHfwFOsZT0LAV0Uau20Y5fzNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VctXUYPRcS9DTMgK0mKtyo5HAEdHcw27CFRL0ncEepTn3yeHLMZxuO48HrqfLYd6fFf1qVwb/k5r5170ccPtjqYK8Aoq45/c60YDclBcljoVwWze48PGo6MyN78MwiDtv6Evs5QtoouV+IiwnOZ+t4dhH/93jRZ7GzFHTLRVpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IF6CDCTK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IF6CDCTK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso596545f8f.2
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318728; x=1792923528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=;
        b=IF6CDCTKGhRjj/CrNmpDZRnz85siKZu2xtXrqfyGakoONEmbaaWzwfFBIuiYt0IAn3
         B6hiZULnBOBlGRT/fJO1DNFd3Cneu2OX81qENldPYZRFAlTfw/8BdEV2IZEzDbeYbxAB
         0oLUQC+TDRz/2e2jFpBXuO1xPcGAP+mIT8egVb2sTPaJJ/cxWy3+y9IDOKwWZYEZm632
         FJ2gTtQZNKEGih/8WaP3E2jQc2eqL2PU2X+n1V2tFQW9DL5x1OK6BmNh5M8AnB1Z1+TO
         vwWN+YGuoIeckwVBc7hPVGwTqK82KzC1YDZpvUZNb2jXLGSP7E0kwG8KV+5oS08EBDtc
         ZJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318728; x=1792923528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsXHC8OVQ58Ws2YIlszVdC880xyahIkcilQ/PKtCso0=;
        b=lyBaL0v4D6EUOmrUdH85hJ0IiR4c6tj6qg7Y4j7qVfPhW0e60dqoP7+8ZVk8IlFXX8
         +2zxDFEvuHuFJ6fsfFDDz7YolywwnoRQQTcz0VtZ9pQ6G+XU1B09W6Rsfm3yrIAWcvuU
         8F+uVGBeP6gX/Ld7zOgRtd++RX/CEcYN4/vfkLaO1X+Ow8Ze80DQ1K9vm0xO6qcsXMCI
         HHG7ILXq2ZUztFhfzqT+Z+20QzPWy//39pIeIeew/QU5J9YINEaIvkgX9KNRzBGaFcpV
         GL/jSYUAWLyj9ErhHtz/sn+ysLbpDwk7Ipa1kSPuVLbLqfGQeD7AhQ4v20/meBAFFykE
         rcig==
X-Gm-Message-State: AFq9FYJm/pCOj4OuT6xCFy4mrmgDNkBLzSvFvSWKHuTl5KX1oO0oWPJM
	bs3+bdUU7Z5VtyhiUgUaRuZDFIFE9dKqWKDAvNGgO7/8VFs/o1dqEzOVtdKUT1Db9ss=
X-Gm-Gg: AYBFou2Xa8Muk3LKEcu9Xmf7Hq9Wq0KlYllvbILR02mAF1ZD/+qPwH6hjI2njVTWusg
	OL2WhZcw73+AvxjBOItUrx/GoDl6e+LDL/cUVqrOWpcMEX3gau/s19WfdUls6nc2X0N3CDe5h7G
	qo568k6hnoTu/5hRpzMvhCSuTgrblXpXiuGzdP0bMRlK9sP2ozGDs6rzV0aVZva//0Cz11EJdk8
	p4zhp8IjujwyiFM+O5dtsJOTVVdMmvu79B9bjAiv6QvXTckcwVqtB88LGYH6+5SoeQmMRKtZfBv
	49LRXqP7Ts9uzqo6loF3fBA5HLcCNS1bHCwOcXtK+Bbh7w55VVEYbe5Y3lHlmpV+ydEusJtsM7c
	6IcoOcbevGyAKEYQSjbG09cDuqOZU5Y9KzNIzRRrU/OXshtPCCfpPKcO7SkVVvMefwqw2GNrHaF
	+1m2HUlu2lQo/to7kMoM2X3dugfZOQmXJvM3Vjn4/wE59G+aUWHDMGWErzOUrHQJBSWzjy
X-Received: by 2002:a05:6000:1ac9:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48e07f98f93mr8926555f8f.21.1792318727874;
        Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:47 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:04 +0200
Subject: [PATCH v5 7/7] arm64: dts: amlogic: gx: add AUDIN node
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-7-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3059; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=BTkEujrtoKKaX+uvUffHfwFOsZT0LAV0Uau20Y5fzNw=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxZs/znn10vTz1aVGtx7rD7yobH01tLBeL+LxKb0
 6M7vXTe6o5SFgYxLgZZMUUWlun3fheUqj00TjhZADOHlQlkCAMXpwBMRPU1w/+ord/1ttfu4qzv
 r311//sN2QCOWYkLT8wy6a1qU/m1zn0yI8O36bNiixwvHVhRL5ybXfGIl2HrQicZw0uCrMsfnNG
 4eIwbAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
custom hat board.

The following additions/overlay are required on top of
'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:

    &sound {
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin 0>;
            };
    };

    &audin {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..2b92a99ab2cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gxbb-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..8f3c7ca06a3c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,11 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..de213c0b63a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

