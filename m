Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC93BA22E
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865787; cv=none; b=PABPfV3icdbLQcReimc+gJLQdc3JsqA5QVHoz966+P97mtWMgstHOwOzidS73BebYl3f37/c3RUFnNUE+MnIIgPzldjjMkKBjBoYfrGUum2xdtBUn9tjjGG3KvpQg5Dn0QZipI9zBixpeHqNiAF/lU4axLCNx74/1Zk3mftylGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865787; c=relaxed/simple;
	bh=TCwNmfCeTrlUtEXUeP7bfZ+xD1LwsS5HE+OE+Ze37Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xczkz4FsGeTjeeWr9M21GnuT9HH/NT/9UhiEyIGYwPx30UffkjS8EOCPYDCRxlmzRygeCTkidr2erJpTvKp36kI+c3W91xZzAp6QnMGgZkVaVZwgGeIl5HoMVAef8ws3Ye3UecY/gjxfZ3AWY54PfjlN063J74JEhC6thUJcK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QOxdP1sg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QOxdP1sg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 776A8C4042D;
	Mon, 30 Mar 2026 10:16:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F84E5FFA8;
	Mon, 30 Mar 2026 10:16:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01F4310450EE3;
	Mon, 30 Mar 2026 12:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774865782; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rpc/cRF17z80LJZfxbko/BL1lznxbHYgAYR6pqtDvvU=;
	b=QOxdP1sgmdKs9m2HxApDP8fUtni3pDUHYqx/qjjkKNcagdnyDq3llCsDeZlKQh6ixppMeb
	hUin5j9EuurdyXKnuiOnRC7grXb43N5SvkLGfXto4zOQOT4ml21orSPmd9/nMSRGEgPKFk
	zcKgIqmqEBD0jx+9gn7ZL59LJ7w/ZWPPIGlKzRI9u8AZ+oi60yvtNNSG8r+JJMA0jtEBXI
	BXrpbrnNtUqa6GBwqdBgbZW+TNpSig1t4Au+OjtKjXgdz4t61VXe1pycaw8ZujPjAyKwtG
	tpjl0qpGU0hW0JhybKb4QfIcgesMGRNmfLQB7vzOaioBNGPo5/d8Pn7CmTwfFA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/4] ASoC: dt-bindings: Add support for the GPIOs driven amplifier
Date: Mon, 30 Mar 2026 12:16:06 +0200
Message-ID: <20260330101610.57942-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330101610.57942-1-herve.codina@bootlin.com>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Some amplifiers based on analog switches and op-amps can be present in
the audio path and can be driven by GPIOs in order to control their gain
value, their mute and/or bypass functions.

Those components needs to be viewed as audio components in order to be
fully integrated in the audio path.

audio-gpio-amplifier allows to consider these GPIO driven amplifiers as
auxiliary audio devices.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/audio-gpio-amp.yaml        | 309 ++++++++++++++++++
 1 file changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml

diff --git a/Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml b/Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
new file mode 100644
index 000000000000..15dc898f8574
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
@@ -0,0 +1,309 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/audio-gpio-amp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio amplifier driven by GPIOs
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  Audio GPIO amplifiers are driven by GPIO in order to control the gain value
+  of the amplifier, its mute function and/or its bypass function.
+
+  Those amplifiers are based on discrete components (analog switches, op-amps
+  and more) where some of them, mostly analog switches, are controlled by GPIOs
+  to adjust the gain value of the whole amplifier and/or to control
+  the mute and/or bypass function.
+
+  For instance, the following piece of hardware is a GPIO amplifier
+
+                                         +5VA
+                                           ^
+                                        |\ |
+                                        | \
+        Vin >---------------------------|+ \
+                                        |   +-------+-----> Vout
+                .--\/\/\/--+------------|- /        |
+                |          |            | /         |
+                v          |            |/ |        |
+               GND         o               v        |
+                            \             GND       |
+       gpio >----------->    \                      |
+                         o    o                     |
+                         |    |                     |
+                         |    '--\/\/\/--.          |
+                         |               +--\/\/\/--'
+                         '---------------'
+
+  A GPIO driven amplifier can work in several mode depending on the electronic
+  design.
+    - points defined:
+        The values of GPIOs used to control gain set a specific gain value
+        without any specific relationship between each value. For instance,
+        using 2 GPIOS:
+          0b00 <-> -10.0 dB
+          0b01 <-> +3.0 dB
+          0b10 <-> 0 dB
+          0b11 <-> +6.0 dB
+
+        This can be described using the gain-points property.
+
+    - range defined:
+        The values of GPIOs used to control gain set a specific gain value
+        following a linear dB range from a minimum dB value to a maximum dB
+        value. For instance, using 2 GPIOS:
+          0b00 <-> -3.0 dB
+          0b01 <-> 0 db
+          0b10 <-> +3.0 dB
+          0b11 <-> +6.0 dB
+
+        This can be described using the gain-range property.
+
+    - labels defined:
+        Some electronic design are not meant to a specific dB gain value. In
+        that case it is relevant to use labels to describe them. For instance,
+        using 2 GPIOS:
+          0b00 <-> Low boost
+          0b01 <-> Middle boost
+          0b10 <-> High boost
+          0b11 <-> Max boost
+
+        This can be described using the gain-labels property
+
+properties:
+  compatible:
+    const: audio-gpio-amp
+
+  vdd-supply:
+    description: Main power supply of the amplifier
+
+  vddio-supply:
+    description: Power supply related to the control path
+
+  vdda1-supply:
+    description: Analog power supply
+
+  vdda2-supply:
+    description: Additional analog power supply
+
+  mute-gpios:
+    description: GPIO to control the mute function
+    maxItems: 1
+
+  bypass-gpios:
+    description: GPIO to control the bypass function
+    maxItems: 1
+
+  gain-gpios:
+    description: |
+      GPIOs to control the amplifier gain
+
+      The gain value is computed from GPIOs value from 0 to 2^N-1 with N the
+      number of GPIO described. The first GPIO described is the lsb of the gain
+      value.
+
+      For instance assuming 2 gpios
+         gain-gpios = <&gpio1 GPIO_ACTIVE_HIGH> <&gpio2 GPIO_ACTIVE_HIGH>;
+      The gain value will be the following:
+
+          gpio1 | gpio2 | gain
+          ------+-------+-----
+            0   |    0  | 0b00 -> 0
+            1   |    0  | 0b01 -> 1
+            0   |    1  | 0b10 -> 2
+            1   |    1  | 0b11 -> 3
+          ------+-------+-----
+
+      Note: The gain value, bits set to 1 or 0, indicate the state active (bit
+            set) or the state inactive (bit unset) of the related GPIO. The
+            physical voltage corresponding to this active/inactive state is
+            given by the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags.
+
+    minItems: 1
+    maxItems: 32
+
+  gain-points:
+    $ref: /schemas/types.yaml#/definitions/int32-matrix
+    items:
+      items:
+        - description: The GPIOs value
+        - description: The related amplifier gain in 0.01 dB unit
+    minItems: 2
+    description: |
+      List of the GPIOs value / Gain value in dB pair defining the gain
+      set on each GPIOs value.
+
+      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
+      Assuming that GPIOs values set the hardware gains according to the
+      following table:
+
+         GPIOs | Hardware
+         value | amplification
+         ------+--------------
+           0   | -10.0 dB
+           1   | +3.0 dB
+           2   | 0 dB
+           3   | +6.0 dB
+         ------+--------------
+
+      The description using gain points can be:
+        gain-points = <0 (-1000)>, <1 300>, <2 0>, <3 600>;
+
+  gain-range:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    items:
+      - description: Gain in 0.01 dB unit when all GPIOs are inactive
+      - description: Gain in 0.01 dB unit when all GPIOs are active
+    description: |
+      Gains (in 0.01 dB unit) set by the extremum (minimal and maximum) value
+      of GPIOs. The following formula must be satisfied.
+
+               gain-range[1] - gain-range[0]
+      Gain  = ------------------------------- x GPIO_value + gain-range[0]
+                        2^N - 1
+
+      With N, the number of GPIOs used to control the gain and Gain computed in
+      0.01 dB unit.
+
+      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
+      Assuming that gain value set the hardware according to the following
+      table:
+
+         GPIOs | Hardware 1    | Hardware 2
+         value | amplification | amplification
+         ------+---------------+---------------
+           0   | -3.0 dB       |  +10.0 dB
+           1   | 0 dB          |  +5.0 dB
+           2   | +3.0 dB       |  0 dB
+           3   | +6.0 dB       |  -5.0 dB
+         ------+---------------+---------------
+
+      The description for hardware 1 using a gain range can be:
+        gain-range = <(-300) 600>;
+
+      The description for hardware 2 using a gain range can be:
+        gain-range = <1000 (-500)>;
+
+  gain-labels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      List of the gain labels attached to the combination of GPIOs controlling
+      the gain. The first label is related to the gain value 0, the second label
+      is related to the gain value 1 and so on.
+
+      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
+      Assuming that gain value set the hardware according to the following
+      table:
+
+         GPIOs | Hardware
+         value | amplification
+         ------+--------------
+           0   | Low
+           1   | Middle
+           2   | High
+           3   | Max
+         ------+--------------
+
+      The description using gain labels can be:
+        gain-labels = "Low", "Middle", "High", "Max";
+
+dependencies:
+  gain-points: [ gain-gpios ]
+  gain-range: [ gain-gpios ]
+  gain-labels: [ gain-gpios ]
+
+required:
+  - compatible
+  - vdd-supply
+
+anyOf:
+  - required:
+      - gain-gpios
+  - required:
+      - mute-gpios
+  - required:
+      - bypass-gpios
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      required:
+        - gain-points
+    then:
+      properties:
+        gain-range: false
+        gain-labels: false
+  - if:
+      required:
+        - gain-range
+    then:
+      properties:
+        gain-points: false
+        gain-labels: false
+  - if:
+      required:
+        - gain-labels
+    then:
+      properties:
+        gain-points: false
+        gain-range: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    /* Gain controlled by gpios */
+    amplifier0 {
+        compatible = "audio-gpio-amp";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    /* Gain controlled by gpio using range */
+    amplifier1 {
+        compatible = "audio-gpio-amp";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
+        gain-range = <(-300) 600>;
+    };
+
+    /* Gain controlled by gpio using points */
+    amplifier2 {
+        compatible = "audio-gpio-amp";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
+        gain-points = <0 (-1000)>, <1 300>, <2 0>, <3 600>;
+    };
+
+    /* Gain controlled by gpio with labels */
+    amplifier3 {
+        compatible = "audio-gpio-amp";
+        vdd-supply = <&regulator>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+        gain-labels = "Low", "High";
+    };
+
+    /* A mutable amplifier without any gain control */
+    amplifier4 {
+        compatible = "audio-gpio-amp";
+        vdd-supply = <&regulator>;
+        mute-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+    };
+
+    /*  Several supplies, gain controlled using range, mute and bypass */
+    amplifier5 {
+        compatible = "audio-gpio-amp";
+        vdd-supply = <&regulator>;
+        vddio-supply = <&regulator1>;
+        vdda1-supply = <&regulator2>;
+        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
+        gain-range = <(-300) 600>;
+        mute-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+        bypass-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+    };
+...
-- 
2.53.0

