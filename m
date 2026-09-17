Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FD4AAC5F;
	Thu, 17 Sep 2026 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685494; cv=none; b=q/5eYol8Pf4pXyqYG9PFznvKXYoyqEqOvde4puuzsUyMex0mLDaNEp7MghEC6J+L/o+tS625j+eYGFdCdX8gVdu/1bRWYc6Nee9hZYjovFDDbs6sV+WcJF/Btug2YL3TY7ad+9NR85btZv0OGSkJYd77oB8caQg8/JZLtLL9V08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685494; c=relaxed/simple;
	bh=v0fXLc0uCridS0eknqfBpG/MdBlnR+n39YKoS54fero=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8pF0UYWf1HmE+DFOwvPgkq48h6tdOMHZU0/yHTUgM9mDhlnX4WjcVWwhaknzZS+T+bL4rGKNSG27TqVlJMUhnyVQ3h2l+B8siqeKset/mMvtEuwwGoKpWqPgh/6Pg+RcyvjbWV0MIdXLXTeoeeFfQQfJbR/gMi/XNkxbGITIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEScZg8F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEScZg8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F381B1F00898;
	Thu, 17 Sep 2026 22:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685492;
	bh=ntQr5Kwp+JxpYseYXVfMOulEzwfc6JZnaje7W/ng9wc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nEScZg8FT2/zYD52xtp/IBi1f1gjtQU55AOPQdhfQYMI3h7Jh8hX8DqOVO7E2qB9K
	 F3o6P0wV1coW1wMMTlzHbVUR75ojjlF4xSuJl/7DaKah8PE7qEEMuXMtTtECqqtsLo
	 nA+LWvLTj5U5amcVpEmbypVb2dYkymfZX58sVNiWA4r3iClmiL+vgSRtUxILTyQizZ
	 5xxcqkGhHIXwGJ+eo23/Gfx38HKVjsP2Mi0Q7hfBElaby4d7EjMO78kCuuO8liFZqh
	 rPwMchvO0Kv5Zmv2WDrjo7aL/i68R+RgZecdICPvXdaUyUCPhUEyye+hHC/R21FYQ3
	 L4MaXvN3nU7MQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:06 +0200
Subject: [PATCH v2 8/9] ARM: dts: ux500: Add Samsung phone audio graphs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-8-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
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
audio clock parent. Keep the codec-provided clocks continuous as in the
product kernels.

Add a common two-link audio graph card and include it from Codina,
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
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  | 21 ++++++
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  5 ++
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |  1 +
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        | 77 ++++++++++++++++++++++
 8 files changed, 108 insertions(+)

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
index 9f58a3c2d06d..857396201147 100644
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
@@ -667,6 +668,26 @@ display_out: endpoint {
 	};
 };
 
+&samsung_playback_cpu {
+	dai-format = "dsp_b";
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
+	dai-format = "dsp_b";
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
index 000000000000..2b46145f68c9
--- /dev/null
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung.dtsi
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/ {
+	samsung_sound: sound {
+		compatible = "audio-graph-card2";
+		label = "Samsung";
+		links = <&samsung_msp1_port &samsung_msp3_port>;
+	};
+};
+
+&codec {
+	assigned-clocks = <&ab8500_clock AB8500_SYSCLK_INT>;
+	assigned-clock-parents = <&ab8500_clock AB8500_SYSCLK_ULP>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			samsung_codec_playback: endpoint {
+				remote-endpoint = <&samsung_playback_cpu>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-tx-mask = <1 1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			samsung_codec_capture: endpoint {
+				remote-endpoint = <&samsung_capture_cpu>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <16>;
+				dai-tdm-slot-rx-mask = <1>;
+			};
+		};
+	};
+};
+
+&msp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&msp1txrx_a_1_default>;
+	status = "okay";
+
+	samsung_msp1_port: port {
+		samsung_playback_cpu: endpoint {
+			continuous-clock;
+			remote-endpoint = <&samsung_codec_playback>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-num = <8>;
+			dai-tdm-slot-width = <16>;
+			dai-tdm-slot-tx-mask = <1 1>;
+		};
+	};
+};
+
+&msp3 {
+	status = "okay";
+
+	samsung_msp3_port: port {
+		samsung_capture_cpu: endpoint {
+			continuous-clock;
+			remote-endpoint = <&samsung_codec_capture>;
+			dai-format = "dsp_a";
+			dai-tdm-slot-num = <8>;
+			dai-tdm-slot-width = <16>;
+			dai-tdm-slot-rx-mask = <1>;
+		};
+	};
+};

-- 
2.55.0

