Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB1E3DA7C8
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164922; cv=none; b=l9+5P0eSRArZqK0lt+1htC2JQAqi0npXwS3B0DEeSJzF4ur0B95F8dpsXxDJV01vIf1KD0IJkPdaGBu7olXYcm0iY0IGXdl8iV+uA9X/oDDCSLEYn/VTiPn04CK4DJp4iEQkaOC/JAuP59jVsT+yzgwlHnbPTuVOr5ag0CoicWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164922; c=relaxed/simple;
	bh=EUGGUwRpDjNyAsnmTwsH+7qy3pCx+bRE90pl3e8XqMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXmDxd4cwosDsm/uV7zvSy0g0Ap+op6HeE3Z107h+CIqw+TgtCMXMGBRxyw7qriBGLdlhPKpumxqBYqIFSiSUH33ye897TsV4Z8/xgUdjwWc8aZ4OQcRLbccMvMj0+smPoLn67zGPZAIwyCgdu751W/fb2oD6axNENCV+4TWACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pGBkWm9r; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pGBkWm9r"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so251815e9.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164917; x=1789769717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=;
        b=pGBkWm9r7J37Mjmxlq4iN4GSs4XMc/iuMhZdeoTBrU/6KaCreOCMsc+giXkyq9nx+z
         gf2O/3qk+nJTV0ynzy3SuZge/Zjz77mJEFR/ZoRkY1wgRN2K7gfnLVwpFl8/GZhCNwYe
         nMomsDfkUgeiHoGl2vZiNO5rvtVxEP/WimMZLwRqM3hPzCI+K9PZxx+w5HsT9pCHcz0+
         TwU6D6RfqJvReO8nl1Eof6R3hrOt57GyFSkEy0eMnfMtYKhz+G1vejl4PcqAiZdox48K
         cLEGoFi+HHiV/TgbA3PgobkmJAgvVd9W8i42zlNEdRYDGajO99ZDjixUf8MZtCiRhBmw
         N1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164917; x=1789769717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeSlDRgaiFiP620nk2cfLEt5zYVqqWMK+mQKVyliaDE=;
        b=Bz8QFqHIcb/ggJFeJPuY6eYG72Ji8lm1uXqnqOJzI5eFMACztkX/GOOKrp0pyHI3Yf
         BUFpFjCv/qfsnGH4v8HuXQlGQLUm8iVsR+D3UV8xUeErq4jhAkk8CIUpU4HG6DD1OduP
         bOR9wEjAp3BoisMiiw5/iUJBknVj5qnYAwMbak7n1uE6u4boh8uLWHx6SJgo4amPq8h+
         t/nhpSnYABYOg4jzrXhYOQGrB8VZLo/DkvvKT13pnXTEOQLCyklYo3qfan705erSSKWq
         BHSf/EBLEQrOQC5uyfFvZeBmc92fJd4m+k1oyrj7tVOUI2oJokNUICJtKqlRdBVwK/ZG
         Jtgw==
X-Gm-Message-State: AFuF++lCsRls6EPMOy0sLLH3Z8bUD5inXqcQ44yqFY6VU02ItZ4wqRRY
	IGG81ECcUrsAsWNNin4s21AlJrMIAT+FCsAoD7hcDtFdjOhYf6za2BjOCQS2H6N9y1s=
X-Gm-Gg: AYBFou3lvKrFfoPzdBhlJU1cOJIa/HP/r7TAe7k0krIb/LvWBlMBPWyBcz6oljaGPEN
	wAj6049TLgsoKlDvno6rXiKk+WMbpuiZ+c9UGjELA/aRkfHE2miqpMCMHvDYl/q6BU/qwHkIrzS
	YCBxg+G23dXgoxFrIRG74KCSwWEPz62XaDk6Hgbd4Qg1J3r1QoquSUYo7Suslv0ozHSq0PpPx6d
	M8uh+/LMI9SLRkm4z7aPX84QohVE/myybUVDFnYqPMDJOY4LP+x1p8YibBi7RecykXls7iVOj3I
	JBk4u5+vX94EcTqAK135UibFgK4D6IcVUkfwwCMtHULsz9Vkb+aUDNqxj2nJvUBwCFyRC2UQcLH
	Z+QkkPTwPqIqTehnJgyDFOGud/Nrpoq+Bib9HGNwpjUdxV9An2hLO/Uj+5sQsvR4d/wEyeoSJ0F
	wXjBwTKIYmFVhbY13xnaaMOPpIwYHVukVt52qVDilOHMoUFE8J2X56t7qSFcDnvvAySA==
X-Received: by 2002:a05:600c:1547:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49e6cc0ac84mr1059775e9.23.1789164917318;
        Fri, 11 Sep 2026 15:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:36 +0200
Subject: [PATCH 6/6] arm64: dts: amlogic: gx: add nodes for audin and its
 FIFOs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-6-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=EUGGUwRpDjNyAsnmTwsH+7qy3pCx+bRE90pl3e8XqMc=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanMn9J9aIburev1R2ddz4/cemHtN0X3PRU0urU1+S
 zwfLZywsqOUhUGMi0FWTJGFZfq93wWlag+NE04WwMxhZQIZwsDFKQATqZ3F8N9rQ+sXZ+ZHhp/k
 Dh+ZUv1toVF8w/YZodcnWK37/HJjYK4RI8O/5S9Kz3ZJbef5zJFp/PBv1d7/885bTRAS1vwe4/K
 u6xAjAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add nodes to provide audio input support to Amlogic Meson GXBB/GXL
platforms:
- audin is the parent node that spans the entire register range and
  implements the data formatters.
- audin_fifo are the child nodes that implement the FIFO: they receive
  formatted data from the interfaces and then bulk transfer it to RAM
  when the FIFO is full.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to and OdroidC2 (Meson GXBB) board
using a custom hat board.

The following additions are required on 'amlogic/meson-gxbb-odroidc2.dts'
to make that hat board to work:

    &sound {
            audio-aux-devs = <&audin>;
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture",
                            "AUDIN FIFO0 I2S IN", "AUDIN I2S Formatter";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-2 {
                    sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
                    dai-format = "i2s";
                    mclk-fs = <256>;

                    codec-0 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin_fifo0>;
            };
    };

    &audin {
            status = "okay";
    };

    &audin_fifo0 {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 35 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 22 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 22 ++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..68632ed86e8c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,41 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,meson-gx-audin";
+				reg = <0x0 0xa000 0x0 0x308>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x0 0xa000 0x308>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				status = "disabled";
+
+				audin_fifo0: audio-controller@80 {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0x80 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO0";
+					status = "disabled";
+				};
+
+				audin_fifo1: audio-controller@cc {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0xcc 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO1";
+					status = "disabled";
+				};
+
+				audin_fifo2: audio-controller@114 {
+					compatible = "amlogic,meson-gx-audin-fifo";
+					reg = <0x114 0x1c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "AUDIN FIFO2";
+					status = "disabled";
+				};
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..53cc92ebbc9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,28 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,meson-gxbb-audin",
+		     "amlogic,meson-gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..be8fac36fb59 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,28 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,meson-gxl-audin",
+		     "amlogic,meson-gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxl-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

