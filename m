Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564A38B15E
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919499; cv=none; b=ZachSFgoj132SKcsQLeWycVAGlR+X/tnNHA0EDD25aoG3OGw2IM1yoQZdKRoZxvlRGvEm7ZCImK3odPq5nJSW81FdoApcHm/cZusuY7fxNx56NUP6wqT4H0hzdxy3R+LMOQxFwPpTHN4eKOpqwv1AmgDSFtg0Zjju/Rjy0m6LrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919499; c=relaxed/simple;
	bh=aDwPIUOhLISPNgSObRWxfYDDxExbNsQWmTRb2VnYogA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ys0zQ/IfkoP5Qjb4ZZ6C/M20ZabiHArSnuPx8mYF1kEHkxBbHWaXKegyYxDpyio5Ge1Ae85FpACAt0Lk0VteLoljb5ctSqVbbFf4xM6PBr3AGmUVud597zOQqrmERNMF8okvQVoY8wh13Cz5CpDYjclWR8INWkf+n9WSWvwkLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Z/7lIvS/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Z/7lIvS/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ba840146so28593255e9.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919491; x=1776524291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=;
        b=Z/7lIvS/axBhXBQyTFdCqEJMsL7+PkhSehLZntTu6No8JT6Vvsz/uIpNYmURLJDIAg
         1RJhJ4jhmwzqwukG+cwsyrt+4G0DW3megYkd/zlQKF83os0VLoNK8OCRXVG0cvadtKj2
         x+0gsU3+xasIri2Hc67KObbllq6m6RWC/8X7YMFmSQQHjEnfM0EUiIFC8iEmJLX72wvO
         NEQ3FyNCGiravDlcs8+fzmGYt92B0M6AMnM6fz686Z0qHLkH5PSXxRozG2Med+jCmr6O
         qI9JP4z9rpoUIi+CPrvyZ7kXdG6ZYFL9muH3Nyv5S3zXMmJomLV6pQhy0QMK5pI1Vqo6
         RHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919491; x=1776524291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=;
        b=UL25pwjp+JHyO0+xwUcU4HcSaXr8Tdk5b6dp4yfhMwsW4qXPey2WmcfIFGF3RqM+RO
         uw/WHUOvpGkGJbblXuNmXQP/604K56LmjOoh0dTZwVCjVc/AFdP2gLvymW6i6juLPkC/
         NQIeBZr9LW9hFFMELCWq2M3pcwPPPGpcMm8N8z19sxAVoQ4xy33lnPHASCBZHNvbuyTZ
         y9Ksf/Gr7Tfm1iaf022F2rpAr6hsoMZCIypfnQqinpylnnilToXb1i1Iq6MKf2vD2vs3
         rpW7X42Qddn3rfY38kxuGyo482DwCSyH1nZCT1jz8P75GDQDz1VZhGIn8j+6Mjyr0Lfe
         NOKA==
X-Forwarded-Encrypted: i=1; AJvYcCXH4ajmwtf3beRRBWzCf1qoEYrirQJS1Y+UwKYk7XiPuSxX4S27Emcd7W/Lmy074u2ucRi49M7q+hRPXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Xh/M2M6eaXKZiYhQQZrB8UsRNrk6y1Mp37kb+JrtZVcSTHSO
	D7RPpPmivVDg/q+CDtlwj2wPsiqAjq9zn+uDz47C8cClwR1SESL1SWjAR5cMJaNFbiU=
X-Gm-Gg: AeBDiev56asgWZ/I4V9h8xPyYdby+BYHqOrYIsPBZjPFYisBfGMOwOJbtByGWvW7nhX
	MnwfTSFiwgCsx77Sr3LWSdkopgCUsyhBdYrc3EpD+HngoUFelBt/sQBOP9Y4H/nDFCyajC3AhFp
	OcIYlPdw6+6CxEb2cJjY6kQ3kQDs8lGKfERJ3xaxHnqRBF5TwQVNAWl/56qcEAC69F9+Vr7iOs5
	ukdi7QdGJdSG8E9hZEETdid7q9DMpQOI5HKHfQ4RZTrx0fhSudoKowLRPLPassM3HnAu0rACC/t
	O5XAMbslJDh71JTE0wStpceaNOClPHnq8Cqzp9CgENf2KHdi+8afyh93UybDmkCVR8Dj7g0lPvz
	ciqRFCy0b2BVqEhgwGMUj11SSfBCVyFwdOzQ54aOhZO/ziGFg/lR5rBoajCxmS6K/i8Z7dcY1Um
	FpA9NI6Xzk/01I+zJYiQtL
X-Received: by 2002:a05:600c:4504:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488d6868606mr90101705e9.25.1775919491498;
        Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:35 +0200
Subject: [PATCH RFC v2 10/11] arm64: dts: amlogic: gx: add nodes for AUDIN
 decoder and FIFO
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-10-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=aDwPIUOhLISPNgSObRWxfYDDxExbNsQWmTRb2VnYogA=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EkuEXh4QS9zvce7AJ4Hcul29fcbzhSO4T5RvKzsrM
 UfodUBCRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZiE83wT2fmrGSHy90/Kt8x
 uhU85PdLLk3fcb9K2IovhlG3WtlDjOG/u+fOMjMLrZVHfSOcDrluiVfOM6hi1fghOs9+w0Hhw2Y
 MAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Adding nodes for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo". These provide support for I2S capture on
the GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 32 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 26 +++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb9b7758d8d12c230be13d4311e5e4..411b3e82f3ce1e535a23d9966ba82099d5be2282 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -331,6 +331,38 @@ aiu: audio-controller@5400 {
 				status = "disabled";
 			};
 
+			audin_decoder_i2s: audio-controller@a040 {
+				compatible = "amlogic,meson-gx-audin-decoder-i2s";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN I2S Decoder";
+				reg = <0x0 0xa040 0x0 0x4>;
+				status = "disabled";
+			};
+
+			audin_fifo0: audio-controller@a080 {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO0";
+				reg = <0x0 0xa080 0x0 0x1c>;
+				status = "disabled";
+			};
+
+			audin_fifo1: audio-controller@a0cc {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO1";
+				reg = <0x0 0xa0cc 0x0 0x1c>;
+				status = "disabled";
+			};
+
+			audin_fifo2: audio-controller@a114 {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO2";
+				reg = <0x0 0xa114 0x0 0x1c>;
+				status = "disabled";
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x84c0 0x0 0x18>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc6cd2875553fa9b0e3ef72a2f6478..71a47aa4c2fc72195386a11c905723b3c6f6943c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,32 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin_decoder_i2s {
+	compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+		     "amlogic,meson-gx-audin-decoder-i2s";
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";

-- 
2.39.5

