Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673523C8A4
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515021; cv=none; b=EdMWRLq09oyhmi8Z5U99FIQDL9RNrdCnzwtUrMx0WBSYg3iLIVLM0MFMpjDVW0KEpKA2zGU1bODpYETeueN+fJPK1tUhRZi7FNrnAObrq9fItYH3MUHQvAo3Lx9N5bsT3ENqyPIzcFPutcMVGCdKiLxmR7+g3eE15TDibDoFWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515021; c=relaxed/simple;
	bh=0PH3RleiQVZirHA9rNg1jSP0dpI/yPUZ6g0dS5Dblzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DitsWGNhhZbzllO7GDIoliWE6djROJXJOE2OgWpH99p1PifhPRm0R1s6v0Bq+0Z9maTV+vhn/+Sr2WJgDIQ7xVX6JMtn/e9baALb7UBwOcXEjuCnvk/613wyZkmRR9aSK815lAmu3vJZ45vqzvz2YMZfsFRuVZJBzNqJPVYFQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz3t1751515009t6ec01799
X-QQ-Originating-IP: IrMCZzZH/SSvv+5Zs0eaiJTfTMdC+E+N7fClkF2UMXY=
Received: from localhost.localdomain ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Jul 2025 11:56:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14627184243716884690
EX-QQ-RecipientCnt: 14
From: Nick <nick.li@foursemi.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nick.li@foursemi.com
Cc: like.sin@gmail.com,
	xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S audio amplifiers
Date: Thu,  3 Jul 2025 11:56:38 +0800
Message-Id: <20250703035639.7252-4-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703035639.7252-1-nick.li@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Odky5wNUcHo/aXHToee/os/O0d7qC8XQ00+5uBtFo3e1/jwLBly97kdk
	oS2ALeKyUk0G8knWFap/dM3H28lUFEA6snVRGkhY32TMe3zjkXdSSA0yNZJ3t3WsT0j8jkE
	POs2WRClq6epSpjFfPfYhk3U/TOxyZod0Mun2gHLc00zxGoNiHqp69W1nMwiY5GXdPYkbk8
	ZNjSz6bBSYPGj36t/gVtzhZTRRFcHe7ujVvh+pHRGK+tJN4KjbAePRmKhw79dveZKhz/Tks
	9TkhHQS1MWkNb48DRt5zzFU6bycrolTVyFLxGMRpHVwWbeeF2F53qrLlx/BsQwT2rQ0/3sZ
	ejSoDjBk1bfooqDNbhyx0NCTeWg8elR9kd5kegkE7Ic1J8fAYAheCYN6/OZskbnHflE5Gub
	H4qjaEu+z1pRO9OsIVKimVp1Tx70FOezzpPE0AG0dLDgkvhfC1abVOO6br231kFiu7hilmd
	GAfWDgnxwX3WvpDHbRVkz4Xxi6ac8xBd6lRhvV+gqnBO3OD8dOamrG92S0gyrMMbFMY2FCn
	JZM7FzPn/9TIE+0sUF57UqFgQoWHy36BtqPPXZizejZpH5L0A/esCiW1gXADbu5VqQi+g2/
	l8rQpul+Hc9z5w/PnP+y9C+uobFJNL4D2MriAqEOteRug+08A2u4lWaV3Yq85hUYoruC+5n
	vJKyGU6xjFuxWsAL9JaLJqfIwE2HJM1v8wzMbesp5RbqJZo/GKKzHMNoNMkee8TOvHUf6o1
	Hs8fJ3ZJtzp1WzLAVbM1w2AFZZ3o8T+6Y4e6QjQkQlvNrt1tyO5zAt5XFhrATNLd/DBABvw
	FVg0g2PoYiaAIoKeTDBBzNUIHV4yU9xkXBn40r7vySBew+kSSgsSsscI4PNyeJc0rJ/da4o
	KAqWPnVCTUbc7o6pFBV+Jw6y46wm+KH4LiC+zGIEBZfLX7AAjOH7mm/ZvId1bMIGHjiE05F
	4VmjizdQr4god4YDRBEab2sew7oCLDbdQ9gaDYHNMdzqHK1zNTlHLK3BApRtf2vFuaKLY+b
	UHlvaPUEFoLuCC7l4bSKhGgAZmWNzdIhz1tQqsvbM/1hfk3MdjGyrzBL4G6lo6lBhxZDC+5
	cBQRoaodCjP
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

From: Nick Li <nick.li@foursemi.com>

This patch adds bindings for FourSemi FS2104/5S audio amplifiers
which can support both I2S and I2C interface.

Signed-off-by: Nick Li <nick.li@foursemi.com>
---
 .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml

diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
new file mode 100644
index 000000000..3a1aba9b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/foursemi,fs210x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FourSemi FS2104/5S Digital Audio Amplifier
+
+maintainers:
+  - Nick <nick.li@foursemi.com>
+
+description: |
+    The FS2104 is a 15W Inductor-Less, Stereo, Closed-Loop,
+    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
+    The FS2105S is a 30W Inductor-Less, Stereo, Closed-Loop,
+    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
+
+properties:
+  compatible:
+    enum:
+      - foursemi,fs2104
+      - foursemi,fs2105s
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the amplifier. Refer to datasheet for possible values:
+      0x68/0x69/0x6A/0x6B
+
+  clocks:
+    items:
+      - description: The clock of I2S BCLK
+
+  clock-names:
+    items:
+      - const: bclk
+
+  '#sound-dai-cells':
+    const: 0
+
+  pvdd-supply:
+    description: |
+      Regulator for power supply(PVDD in datasheet).
+
+  dvdd-supply:
+    description: |
+      Regulator for digital supply(DVDD in datasheet).
+
+  sdz-gpios:
+    maxItems: 1
+    description: |
+      SDZ(Shut Down) pin is active low, it will power down the chip,
+      and then reset the chip to shut down state.
+
+  fs,fwm-name:
+    description: |
+      The name of firmware that should be loaded for this
+      instance. The firmware is gernerated by FourSemi's tuning tool.
+    $ref: /schemas/types.yaml#/definitions/string
+
+  fs,dai-name:
+    description: |
+      The name of FS210x DAI, it can be set different name when
+      there are multiple FS210x devices in the system.
+    $ref: /schemas/types.yaml#/definitions/string
+
+required:
+  - compatible
+  - reg
+  - sdz-gpios
+  - fs,fwm-name
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@68 {
+            compatible = "foursemi,fs2105s";
+            reg = <0x68>;
+            pvdd-supply = <&pvdd_supply>;
+            dvdd-supply = <&dvdd_supply>;
+            sdz-gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&fs210x_pins_default>;
+            fs,fwm-name = "fs2105s-btl-2p0-0s.bin";
+            clocks = <&clocks 18>;
+            clock-names = "bclk";
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.39.5

