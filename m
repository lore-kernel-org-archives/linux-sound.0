Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8811367;
	Fri, 26 Dec 2025 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766737861; cv=none; b=Df9jbtgQ/N8UtR4haCxK2WkO7Nm0PAhLwr/KkIAS37SHF/Q1gjqNNoGb8ZYyU1H0aTRK6HgL6IcjzhUJNY/qCfDasmU1PAzhoMu+FIuxNAhWqNnuX/H5yjdW6aeZcZ1XsWS1NVY5kVA7Hwv44/P5KRMEU6chMtafQKKW28TsCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766737861; c=relaxed/simple;
	bh=LqxyURtloegT4m/zAMO9KjepBqGZM6jzaRvo+Psy7E0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M6VHjxxD+qxx2imH45W4Fxckvm3zViuJkvwk6lot9M5JGQlSuMtJLJcOBdg/wMKuHvI7zYNaXLCBg50Zy4uH8BO9k32qVTdrnxiUsAGiUnMGC+PEjlFHuqYOqb5nhRCxjpeV4MEZsUaRK8p4Npc3xkiEf7CvYq2tidjqNXMmWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=b7HHwTQL; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="b7HHwTQL"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BQ8UcapE3288868, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766737838; bh=z7Wwgy0d8I6voARKvl0a7KvTVnYk//mpi1lBYRvjR84=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=b7HHwTQLyOZioocD79enNXFktqtNDlsnOl/BKHT3IhZDKFOR5b5f4GmgQHeBAweCA
	 F5CdIsRSPp+1CB0BRb8eEtXwLqmGAvUvfbDq3J1nevlOpKpPvImE0SaG6dBghvnHws
	 QvnJ0wuV+IBzDecgHosFPH43kPcZYunI8Fr6nYUdcKMxyKfrDhGG9k5sUS1Rd6HxhN
	 LplMPe18qSL7LKluM+aJMDB346Yhh1+ISvWaSKLGikRsN9AsokXVVfigOATVW0hE8g
	 R9IHcRR+aOTqY7VnE3nXyx6IHngKCslfuccCQUQ5awcbyayop4C3OjItMxCo6H4f1l
	 eKSukilUcJKNg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BQ8UcapE3288868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Dec 2025 16:30:38 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 26 Dec 2025 16:30:38 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 26 Dec 2025 16:30:37 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 26 Dec 2025 16:30:37 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 3/4] ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
Date: Fri, 26 Dec 2025 16:31:50 +0800
Message-ID: <20251226083150.1052230-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Audio codec with I2S, I2C and SPI.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/realtek,rt5575.yaml        | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..981ebc39b195
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt5575.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ALC5575 audio CODEC
+
+maintainers:
+  - Oder Chiou <oder_chiou@realtek.com>
+
+description:
+  The device supports both I2C and SPI. I2C is mandatory, while SPI is
+  optional depending on the hardware configuration. SPI is used for
+  firmware loading if present.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,rt5575
+
+  reg:
+    maxItems: 1
+
+  spi-parent:
+    description:
+      Optional phandle reference to the SPI controller used for firmware
+      loading. The argument specifies the chip select.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  # I2C-only node
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@57 {
+            compatible = "realtek,rt5575";
+            reg = <0x57>;
+        };
+    };
+
+  # I2C + optional SPI node
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@57 {
+            compatible = "realtek,rt5575";
+            reg = <0x57>;
+            spi-parent = <&spi0 0>; /* chip-select 0 */
+        };
+    };
-- 
2.52.0

