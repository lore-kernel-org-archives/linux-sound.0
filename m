Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC902877ED;
	Thu,  8 Jan 2026 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767908696; cv=none; b=TmANL1W8AAyWZwy7Rjl/k4pxiWna8KrkxN1kHnsjl2LS554MJdlqSpo7wDytFsI2lra8rWVz+uf9SaYFpA8b+TC/FxJqCrlV9xZOy4kwvpQEsA2HbcAfEwAnwkg0ryU4GQovETAKY3Z/JMMECVHN1qp+2JVb15cy7Cv8yGQCppc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767908696; c=relaxed/simple;
	bh=jPgaoKZmf9AHRO1v8o/u/y0GBmowQtKzLFIWM9FbQQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RalOJaYPlUlfvsSLNLkKMRCmrxjBwJ+eVGgV3T7NAGz9zkCa4GQn7QCPnz265LOT1uyDGUM44syO9/h/EMswtvfG9jVyQpIybQtMlKhf61ZB5V47i6IjmLbGT1wo+5QIxs6JcFnsdn7iMjfxqaEZO7RUHdgoZxoNtUykTILAI68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pAJAts5X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pAJAts5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AA9C116C6;
	Thu,  8 Jan 2026 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767908695;
	bh=jPgaoKZmf9AHRO1v8o/u/y0GBmowQtKzLFIWM9FbQQw=;
	h=From:To:Cc:Subject:Date:From;
	b=pAJAts5XVOZpRcTGGX91TE901Cmuy7296Ixjxq2+2pn7QJ9B5cxkF2UccIv0Fp2DL
	 LPAOA6b3WFaxhOhtUBiX+p/NfuiOgkgcNzGq20HAeHb9dFwNgPjXjkQVeKQAL+KgT+
	 Uy+nBKS+64xobFVKs9JDk8uSa4AdtAx2TzJyZMEkb7P1/b6sLWqVsrK5PYAinqrbQ2
	 E3v53aEi5wLzyVte0b7zJMWC+lfe3uOHDRB47b1lGQrhVocVqo9F/8+akXZLipM1TS
	 CJHn5YII4xxCq8VzLTW2j2TvBc8N7nBBWl7is/FIhfg4/AFmJyDcVTvIX21jRDB1Yy
	 ZiObGcE7x7GjA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <bardliao@realtek.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
Date: Thu,  8 Jan 2026 15:44:40 -0600
Message-ID: <20260108214443.1127685-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Realtek RT5661 codec binding to DT schema format. Add
missing clocks/clock-names for MCLK which is in use already. Also add
the standard "#sound-dai-cells" property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/realtek,rt5651.yaml        | 100 ++++++++++++++++++
 .../devicetree/bindings/sound/rt5651.txt      |  63 -----------
 2 files changed, 100 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5651.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5651.txt

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5651.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5651.yaml
new file mode 100644
index 000000000000..dc4f2eef7cf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5651.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt5651.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RT5651 audio CODEC
+
+maintainers:
+  - Bard Liao <bardliao@realtek.com>
+
+description: >
+  This device supports I2C only.
+
+  Pins on the device (for linking into audio routes) for RT5651:
+
+    * DMIC L1
+    * DMIC R1
+    * IN1P
+    * IN2P
+    * IN2N
+    * IN3P
+    * HPOL
+    * HPOR
+    * LOUTL
+    * LOUTR
+    * PDML
+    * PDMR
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,rt5651
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  '#sound-dai-cells':
+    const: 0
+
+  realtek,in2-differential:
+    type: boolean
+    description: Indicate MIC2 input are differential, rather than single-ended.
+
+  realtek,dmic-en:
+    type: boolean
+    description: Indicates DMIC is used.
+
+  realtek,jack-detect-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Select jack-detect input pin.
+    enum: [1, 2, 3]
+
+  realtek,jack-detect-not-inverted:
+    type: boolean
+    description:
+      Normal jack-detect switches give an inverted (active-low) signal. Set this
+      bool in the rare case you've a jack-detect switch which is not inverted.
+
+  realtek,over-current-threshold-microamp:
+    description: Micbias over-current detection threshold in µA.
+    enum: [600, 1500, 2000]
+
+  realtek,over-current-scale-factor:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Micbias over-current detection scale factor:
+
+        0: scale current by 0.5
+        1: scale current by 0.75
+        2: scale current by 1.0
+        3: scale current by 1.5
+    enum: [0, 1, 2, 3]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@1a {
+            compatible = "realtek,rt5651";
+            reg = <0x1a>;
+            realtek,dmic-en;
+            realtek,in2-differential;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/rt5651.txt b/Documentation/devicetree/bindings/sound/rt5651.txt
deleted file mode 100644
index 56e736a1cba9..000000000000
--- a/Documentation/devicetree/bindings/sound/rt5651.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-RT5651 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-- compatible : "realtek,rt5651".
-
-- reg : The I2C address of the device.
-
-Optional properties:
-
-- realtek,in2-differential
-  Boolean. Indicate MIC2 input are differential, rather than single-ended.
-
-- realtek,dmic-en
-  Boolean. true if dmic is used.
-
-- realtek,jack-detect-source
-  u32. Valid values:
-  1: Use JD1_1 pin for jack-detect
-  2: Use JD1_2 pin for jack-detect
-  3: Use JD2 pin for jack-detect
-
-- realtek,jack-detect-not-inverted
-  bool. Normal jack-detect switches give an inverted (active-low) signal,
-  set this bool in the rare case you've a jack-detect switch which is not
-  inverted.
-
-- realtek,over-current-threshold-microamp
-  u32, micbias over-current detection threshold in µA, valid values are
-  600, 1500 and 2000µA.
-
-- realtek,over-current-scale-factor
-  u32, micbias over-current detection scale-factor, valid values are:
-  0: Scale current by 0.5
-  1: Scale current by 0.75
-  2: Scale current by 1.0
-  3: Scale current by 1.5
-
-Pins on the device (for linking into audio routes) for RT5651:
-
-  * DMIC L1
-  * DMIC R1
-  * IN1P
-  * IN2P
-  * IN2N
-  * IN3P
-  * HPOL
-  * HPOR
-  * LOUTL
-  * LOUTR
-  * PDML
-  * PDMR
-
-Example:
-
-rt5651: codec@1a {
-	compatible = "realtek,rt5651";
-	reg = <0x1a>;
-	realtek,dmic-en = "true";
-	realtek,in2-diff = "false";
-};
-- 
2.51.0

