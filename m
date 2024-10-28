Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F71DE4C0;
	Mon, 28 Oct 2024 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130221; cv=none; b=L+vCa7+hBgIsoy5PtGSTh3Vo2Wk4ZCJdTZbu49H541a+OG4HlnYd5FDQiuHDnZG7uzSQ2+OiDc1eoGpVAleKGqS7eBQtMimlXoEqBDjN76FrtAPLxI4m+TkWr8pfD7wQ/MSbHT0v7Dz47Q+5QCj2dzpBBimIn/eW9VIUPzeTJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130221; c=relaxed/simple;
	bh=JZ8SDOTGMdpYsYOVNzjby/fRRlB1xolUofi/4r08bQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwCpzlPkxe47/Ji8MQa229mLcHEBwEwgfd1CUDs1pAqSPPaS7WmY5Bw/xDOSOgG/eaLM2ly+kvRHDOy7RnelsIgpGXYlRh4luvOTlkpGbmHKP/HSZVABD+xXIPdu9GjOq02jnPl279h5CZUwaV5FLs8BIKhkQMh4UtVt05JOtAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR1W1PvY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR1W1PvY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F00F5C4CEC7;
	Mon, 28 Oct 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130221;
	bh=JZ8SDOTGMdpYsYOVNzjby/fRRlB1xolUofi/4r08bQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GR1W1PvYDMORXjQ1YUaYpSmTjtz+Y366qQUj23P8S/sWMEfNpEknwwuqgbcDhQaQz
	 4yBe9+ipx6aBhruMAHi7nksyBw4yu7rWwd0xas5RqQBWau7ilGfZg78MOn1T5CMBUu
	 gzdZBrwcgpF8IM2riCi0k2gOEvx4ckFOhd/dwRRJohT34LOT3AnDJsHYigk+rm/WOf
	 XOtkbd58RERuhIEoif3kn3wFaeiNpM5IbvLO9E1v5e/M70tT97ldVa0uZtQJALHJ/g
	 5GzDI7S0N/NqAzEH8KKUIOUkTHS5+Jo07KiqcoHb6g/Fa6Acc6o3BHTtKZEm6+7/pV
	 bVOhi42Ixm47Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBCDD33990;
	Mon, 28 Oct 2024 15:43:40 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Mon, 28 Oct 2024 16:43:39 +0100
Subject: [PATCH v2 2/4] ASoC: dt-bindings: document the adau1373 Codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241028-adau1373-shutdown-v2-2-647f56bbd182@analog.com>
References: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
In-Reply-To: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
To: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730130219; l=4205;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=e6/jgIZWmuR3Nbe5npqQP5ffqfzdhUaw8odBN01/3Ho=;
 b=lvBiVXRZY3VExRrlBxINZ1pqhMupcpXaQk5ZpwwgexekX6liDiyNNn0djQ23mLseD9DjN1l7p
 XP3tv6GnLZxBeAkxMQQkOpib53Ep/fneXSjm7shVDQG2oJxAu4BLnKm
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

Describe the adau1373 Low Power Codec with Speaker and
Headphone Amplifier.

While at it, properly add a MAINTAINERS entry for ADI sound bindings.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/sound/adi,adau1373.yaml    | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1373.yaml b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
new file mode 100644
index 000000000000..97552bf5d951
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,adau1373.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADAU1373 CODEC
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  Analog Devices ADAU1373 Low power codec with speaker and headphone amplifiers.
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1373.pdf
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,adau1373
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  powerdown-gpios:
+    description: GPIO used for hardware power-down.
+    maxItems: 1
+
+  adi,micbias1-microvolt:
+    description:
+      This property sets the microphone bias voltage for the first microphone.
+    enum: [1800000, 2200000, 2600000, 2900000]
+    default: 2900000
+
+  adi,micbias2-microvolt:
+    description:
+      This property sets the microphone bias voltage for the second microphone.
+    enum: [1800000, 2200000, 2600000, 2900000]
+    default: 2900000
+
+  adi,input1-differential:
+    description: This property sets the first analog input as differential.
+    type: boolean
+
+  adi,input2-differential:
+    description: This property sets the second analog input as differential.
+    type: boolean
+
+  adi,input3-differential:
+    description: This property sets the third analog input as differential.
+    type: boolean
+
+  adi,input4-differential:
+    description: This property sets the fourth analog input as differential.
+    type: boolean
+
+  adi,lineout-differential:
+    description: This property sets the line output as differential.
+    type: boolean
+
+  adi,lineout-gnd-sense:
+    description: This property enables the line output ground sense control.
+    type: boolean
+
+  adi,drc-settings:
+    description:
+      This setting is used to control the dynamic range of the signal. The
+      device provides a maximum of three full band DRCs with 13 entries each.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    oneOf:
+      - minItems: 13
+        maxItems: 13
+      - minItems: 26
+        maxItems: 26
+      - minItems: 39
+        maxItems: 39
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@1a {
+            compatible = "adi,adau1373";
+            reg = <0x1a>;
+            #sound-dai-cells = <0>;
+            powerdown-gpios = <&gpio 100 GPIO_ACTIVE_LOW>;
+            adi,input2-differential;
+            adi,input1-differential;
+            adi,lineout-differential;
+            adi,micbias2-microvolt = <1800000>;
+            adi,drc-settings = /bits/ 8 <
+                0xff 0xff 0x1 0x2 0xa 0xa 0xd 0x1 0xff 0xff 0x5 0xd 0xff
+            >;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d6272c00fbd..24bc5fcac74a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1521,6 +1521,7 @@ L:	linux-sound@vger.kernel.org
 S:	Supported
 W:	http://wiki.analog.com/
 W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/sound/adi,*
 F:	sound/soc/codecs/ad1*
 F:	sound/soc/codecs/ad7*
 F:	sound/soc/codecs/adau*

-- 
2.47.0


