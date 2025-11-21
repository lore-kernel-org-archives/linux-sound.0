Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D814A91;
	Fri, 21 Nov 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714422; cv=none; b=Ek+YdSTVy9sNe/VyIscFZseURSekmFnuFIunZF8wQPO/hMaHEsmR1XXYyaRKBDwAuYn0oIQZcdgV7ovx6Rl5oRWzbzvpoRDUih4jmakOqxoVaku/hHwqN8yiwtsfmN1Bo4mckInaFqYTjKeTYl6DM+CY5tzL12XAhZDUQ8MlAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714422; c=relaxed/simple;
	bh=wcZEPB0Dr2i32CrYKLqpUNGZcjVWFjtlJvFCLUtn7aE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIDLTG742m6oFYtBerIaeNSd8jBGZVCGRf6Ylet+KUWNjS4B9CLeklvNhtvTFau+xF9+NRndSDUa8XHf1DRlzoqsQ5Q63damOF3P+MGxOJiYNJv+aEg8WvGu7cpgS2VX9E3QFWsvU00saqB10pYretLZx91hvOyqR7F6FHa9RII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=wmm3WeTE; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="wmm3WeTE"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AL8dfM933251007, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763714381; bh=uGZMEkBw1aiAog/nwTU+ymyoDjS4E7c+8kpU7DtaM/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=wmm3WeTEk/sbnjbi37565Cv90rXogAyUo0d3F4GLujQraXH66k1ZhcKaN6q4yI11p
	 dVVmLJeyHhzBKRXKSGi1FcH3ZpnP2upS0QF9CRIolvhhpAVvfYtgd3VMTUoJTjjF7O
	 kmnZ1VLrqorle1h+iyYXXnSE/n7mXAkqAev3wSXPOhJFT8IXhW6nNLZpyMFD/QPQV9
	 8nDWf/44ttx5RWeH1YZYLjz2ntZJpKycZr9lU7Bbmcr7/oHxNEgopXa22mDjpYQdRn
	 afq+HWcUvVkEsI8ulUS44BDqyhfyt8jjk2ZmA02O2a6vcYPhm8T1noN2xUzL6pyiqP
	 IiLI7c2mRSBzw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AL8dfM933251007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 16:39:41 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:39:41 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Fri, 21 Nov 2025 16:39:41 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v7 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings for ALC5575
Date: Fri, 21 Nov 2025 16:41:12 +0800
Message-ID: <20251121084112.743518-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121084112.743518-1-oder_chiou@realtek.com>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
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
 .../bindings/sound/realtek,rt5575.yaml        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..cc7540278ad9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
@@ -0,0 +1,42 @@
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
+    const: realtek,rt5575
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
2.51.2

