Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20D248F68;
	Wed, 31 Dec 2025 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148565; cv=none; b=nSgnBHIj1lfD1yXA8b6zUuARdDxomP6EaZnJRnKPcknGuvz4I9Euxm3Z7dH0wrJjfjCwBmybaqtTekjwg5J+yd8zNYaWYZBvBPRO/QvPPciq2aHE56FvS9oGASowo/8HliufjySaG8hDAwVjhVNHB3JqVN8/1KLMJesycp2hr60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148565; c=relaxed/simple;
	bh=LqxyURtloegT4m/zAMO9KjepBqGZM6jzaRvo+Psy7E0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEYKcB+zEZnn+rzqj/T4qn/eAm7ayG2S4JwsPCeI8DgnEv2+X/NfvIQlkq4E9GTKjyGAogL+MFSFMBK5gPyQo7maCrLIAiWD7rJroG0q2WvZXvAwpvlHnWWM3+h/5WdHfMzqVN7PRp7CLlUVqehVlEul0xr9Y92hKrx8rD1CXpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Bl9/EFli; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Bl9/EFli"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BV2ZegkE264407, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1767148540; bh=z7Wwgy0d8I6voARKvl0a7KvTVnYk//mpi1lBYRvjR84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Bl9/EFli+7enao9Py7jKFI0Nr8NE50u+tMTXk2Gn1o+ECtzeeZavwBaxtR36L9a+V
	 X8Im9/o2MkN/PGxd4FhTGV5g/mwmOI32gZ4K3+j60nyOCJIf0z7gaTiBcnmDdiILcy
	 s9uE0gRULWNOhbIb/D5raopJ+Efl3NM7a/5klrFN8aS5EA9K7CJydvqcaIo0VS4awx
	 7emMaURPPM364g8W/VTB+6XWX9xIl9VYPzZnjP+7vaA8TJKzr33zXr+9XK0Nu4gVrI
	 vQmyUDcB1hM3gykd9f4EgVssMpm2+E0TKjipewG9RqhsfW2UeyrOSJygDekd2lLnSv
	 JSQ31JEuZXLkg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BV2ZegkE264407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Dec 2025 10:35:40 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 31 Dec 2025 10:35:40 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 31 Dec 2025 10:35:39 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
Date: Wed, 31 Dec 2025 10:37:01 +0800
Message-ID: <cad38383a8f4c7235158779c270fee7f61bf6cfe.1767148150.git.oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767148150.git.oder_chiou@realtek.com>
References: <cover.1767148150.git.oder_chiou@realtek.com>
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

