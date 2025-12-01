Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A63054F2;
	Mon,  1 Dec 2025 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586726; cv=none; b=GhA9uRbT2vm4zT7epTjaeYWXh8u4mDnG6En4eEJ+mOirtT5tFM2dVXoZnaxBSiBjWkAkX2qUMc0sCEMVTBeNNkC/ABL40Ji4L/r5OELicqUoYzdNYuocvuQEGKzBfqKaLI5wyG5do+tO7ajh8byWCGZySwjEqfk7rPxEX9KZ2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586726; c=relaxed/simple;
	bh=n8k7C4RfqOz+ciFMceVE+gLE2kpxuju6CA/fvocwVyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JB1pSMr00OhqNXchZY0hRXzd8MPgoJGWkpfk5jYB99WsZQY7o/XWciaUSuuAIOucB4e4GqpNk1l49K7uf/T7l4LXh5fFvUqIEBDiWgkbTtKIXqED4UjqjfHa1yojFsutb3H1gPLFZghizJTBKlCXwiZNqE7uGjclOECUlLN6iNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=bpivhKuy; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="bpivhKuy"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B1AvwcuF2042571, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1764586678; bh=kfJQ9K6g0TlBICRCzVbzXOGXp5P2/DWLCnO7a6pufaA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=bpivhKuyE3hCHFFxBTfVkpR1JqDEL8LiIB4N6JM9wup7ye0rteuIOJZBipQM7I+vp
	 NTIq+K8wCOdIqjcZ1MXgkgLn2DXtbnZ8Yb/Gwg++Ac1ika8VN30K8yWhugnil2INUH
	 w5yIroEqTWJueCmI3ctIjtokwHrtglVplab+0ICRwFgjPGfjFo2gFwNn69iS8W2rKm
	 30FdpAr8iJZCg9jDoilNpL0pfCBKxwOlS2UX1vQo/1qpQz68qicM/pbMDZcFjLX2aF
	 tRjnh0Nr4koURAi9yGGe5Hlj0jPcJAGu7ue3Y6ldBNFQ4aPam1w3JsjbBBoxY7Hpvy
	 DXTQBew5M8JWw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B1AvwcuF2042571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Dec 2025 18:57:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 1 Dec 2025 18:57:58 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 1 Dec 2025 18:57:57 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Mon, 1 Dec 2025 18:57:57 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for ALC5575
Date: Mon, 1 Dec 2025 18:59:26 +0800
Message-ID: <20251201105926.1714341-3-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201105926.1714341-1-oder_chiou@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Realtek ALC5575 is a highly advanced DSP and microphone CODEC that has
been designed for AI audio technology. Its impressive features include
an advanced HiFi-5 DSP core, a Neural Network Processing Unit (NPU)
owned by Realtek, and embedded 4MB memory, which enables it to operate
highly advanced AI audio algorithms. The ALC5575 supports 4xA-mic input
and 8xD-mic input, as well as a rich set of interfaces such as I2S, I2C,
SPI, and UART.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 .../bindings/sound/realtek,rt5575.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..83ccc79e6769
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
@@ -0,0 +1,44 @@
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
+  optional depending on the hardware configuration.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - realtek,rt5575
+      - realtek,rt5575-with-spi
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@57 {
+            compatible = "realtek,rt5575";
+            reg = <0x57>;
+        };
+    };
-- 
2.52.0

