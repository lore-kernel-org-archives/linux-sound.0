Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4038228A;
	Thu, 10 Sep 2026 23:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081455; cv=none; b=NVWhbZNRK4MmNCxFCVNdq6a8n0G1SORQJeTVGtipugorLhIX8tL3oc37NWhihPlONc+PfKC+8WH5AghDGKQRDjw2QiodHssTyE1VWUJDc+Q2tU1N2z0oX1vhZFvTNSptqP4i/zczBIhCsCQD0O3LYP+JNjKhAVtfI77KMBJT4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081455; c=relaxed/simple;
	bh=OjnnpOU8R64yJkfowWtX+PjHgxXWU9ii2nGQmROSk8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6yUARd8UF9/+8O4SFh1RKp8ufMsLs/Kh13PxZBUKJgaAXG4NiaHPtOOIOs0eUof1gDnkUCedE1MZ8qGk3ISTDtkH7WVpXnRd92Hexqk0hLHGLrM9XNdNtcydKFrTfIAFP6qCedfTYjm5uNRB36fEsRK/BuomvUUh7Cg7JgSLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcDbtue4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcDbtue4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91DA1F000FF;
	Thu, 10 Sep 2026 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081450;
	bh=dwnDHVVXJpYwpYwvI4xKpk1lh9oG3UTqCfJh8KcgNU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DcDbtue4X9kfcnu71mEgbn8JlMbxRNhG7X1OVOb8bdil2EuKU035vuBFtQxV+gR6M
	 PAT29VRTGtsFF4KIs0ZqavsruYnucbJPLD1NjiCgfmmWFuYGnu4QN/sU9MonBeRC/i
	 UdzZbptPlhUz0rTjcHVzwG9n9mypfl887Y+rWfeFYJhdDf6o5GnU5D1+LKdLm260kn
	 g8gmjUGjRnpDWl9nenRhgSrJqLck1v5PC0t4ss8aRbAJm20EQ9sMsoWse5KAjKV6lr
	 bJLE3O6Ukp0fYy9WWjxiq+BJzGWOe0QCJ0s3YYQdUs7ljHIiqRxOTxlPSJWDomtzb8
	 FrSBtWeh7eNzQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:50 +0200
Subject: [PATCH 7/9] ARM: dts: ux500: Add Samsung phone sound cards
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-7-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The released Samsung product kernels all connect codec DAI 0 to MSP1
for playback and codec DAI 1 to MSP3 for capture. The codec provides
the bit and frame clocks, while ULPCLK is the machine driver's default
audio clock parent.

Add a common Samsung simple audio card and include it from Codina,
Codina-TMO, Gavini, Skomer, Kyle, Golden and Janice. Use the generic
card name "Samsung". The later product kernels use DSP_A with an
8-by-16-bit TDM frame, playback slots 0 and 1 and capture slot 0.

Codina and HD Codina retain their older DSP_B configuration with a
16-by-16-bit frame and playback slots 1 and 3. Preserve Gavini's
AMIC1A-to-VAMIC2 bias routing. Golden and Janice use the configuration
from the newest Codina-TMO product source; their board files are
byte-for-byte identical across the available later product releases.

Kyle's audio I2C bus contains only a disabled placeholder, so AB8505
remains its sole active codec.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  | 27 +++++++++
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  5 ++
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        | 67 ++++++++++++++++++++++
 8 files changed, 104 insertions(+)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 8f1780d560ff..3350fc775cc9 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -21,6 +21,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8505.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 9f58a3c2d06d..069c621abede 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -22,6 +22,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8500.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
@@ -667,6 +668,32 @@ display_out: endpoint {
 	};
 };
 
+&samsung_playback_link {
+	format = "dsp_b";
+};
+
+&samsung_capture_link {
+	format = "dsp_b";
+};
+
+&samsung_playback_cpu {
+	dai-tdm-slot-num = <16>;
+	dai-tdm-slot-tx-mask = <0 1 0 1>;
+};
+
+&samsung_codec_playback {
+	dai-tdm-slot-num = <16>;
+	dai-tdm-slot-tx-mask = <0 1 0 1>;
+};
+
+&samsung_capture_cpu {
+	dai-tdm-slot-num = <16>;
+};
+
+&samsung_codec_capture {
+	dai-tdm-slot-num = <16>;
+};
+
 &pinctrl {
 	/*
 	 * This extends the MC0_A_2 default config to include
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 0c3eef7a294a..d99ee1581eb7 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -7,6 +7,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8500.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
@@ -604,6 +605,10 @@ display_out: endpoint {
 	};
 };
 
+&codec {
+	stericsson,amic1a-bias-vamic2;
+};
+
 &pinctrl {
 	/*
 	 * This extends the MC0_A_2 default config to include
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..730818fe073f 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -4,6 +4,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8505.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 18fb7263058e..5f69b931d173 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -7,6 +7,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8500.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index c34d43a2b750..dc1c3d134199 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -11,6 +11,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8505.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 7bf4287f6e13..9ed01cc4fa9a 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -7,6 +7,7 @@
 #include "ste-db8500.dtsi"
 #include "ste-ab8505.dtsi"
 #include "ste-dbx5x0-pinctrl.dtsi"
+#include "ste-ux500-samsung.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung.dtsi b/arch/arm/boot/dts/st/ste-ux500-samsung.dtsi
new file mode 100644
index 000000000000..cc46f8ee1c64
--- /dev/null
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/ {
+	samsung_sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "Samsung";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		samsung_playback_link: simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "dsp_a";
+			bitclock-master = <&samsung_codec_playback>;
+			frame-master = <&samsung_codec_playback>;
+
+			samsung_playback_cpu: cpu {
+				sound-dai = <&msp1>;
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <1 1>;
+			};
+
+			samsung_codec_playback: codec {
+				sound-dai = <&codec 0>;
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <1 1>;
+			};
+		};
+
+		samsung_capture_link: simple-audio-card,dai-link@1 {
+			reg = <1>;
+			format = "dsp_a";
+			bitclock-master = <&samsung_codec_capture>;
+			frame-master = <&samsung_codec_capture>;
+
+			samsung_capture_cpu: cpu {
+				sound-dai = <&msp3>;
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+
+			samsung_codec_capture: codec {
+				sound-dai = <&codec 1>;
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+		};
+	};
+};
+
+&codec {
+	assigned-clocks = <&ab8500_clock AB8500_SYSCLK_INT>;
+	assigned-clock-parents = <&ab8500_clock AB8500_SYSCLK_ULP>;
+};
+
+&msp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&msp1txrx_a_1_default>;
+	status = "okay";
+};
+
+&msp3 {
+	status = "okay";
+};

-- 
2.55.0

