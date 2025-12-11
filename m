Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5127F759;
	Thu, 11 Dec 2025 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450855; cv=none; b=Dwy98KT+5879Og/7UjxNj0jFnN9vk8KhE1mfb2wBk4ntmQvDA+FaK0++THbpLKt4g0F39//tSjqN0xLqX+88aPZrCFGumoiETHhdsIBvt6DhysxtfacB3aQhsdvnfUsDCWCiNHev5Tho5tKHw8j4mS+BNQpQwy8LYkJq42EMVlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450855; c=relaxed/simple;
	bh=WPltThoVM1vsjonP7advdE+wOBG+U7B9xOPa0ljWHKE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDovkf9tfn3iSAs7OUZCEpCwufd+M+YTRWPxcUT/uFvxxBZBW5du7XK+j5+qBRIR/6+TBpyTSaYOBc4Na9r9+Uace7w5gyrQO0k4bxMdO5kniycDJcYeX/MnCuFA8tg9MlKWPHIZDYjBt5jQ30OkVeru2lnHmaoKombN/OERzt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=T+9qkD4t; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="T+9qkD4t"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BBB09R102044082, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765450809; bh=RqmevumCYdabgMrj1tV475tdAjkcd1P2ndfUMvVo4u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=T+9qkD4t5xxqfCoOLTQwsBDEf5Jxvd7jXdQwgZoWHttBLi20aD7Z4DsqqZ8lCQcp+
	 WGnodD4plpU0v3h+tFV28YmuW8sDFSeKXkOgge8Co6rx/+/clFwMY7OsGNl9d/APFa
	 NCJz9+FbTbLdUw7UUTibXR0ci7Y3A4+DBBrUS7PKF0ajUSPXGQQdcZ641l31Ov9OtQ
	 arWRZIwvbv+IpH3gY8FS9xiDm6n3bbiVegGXmCgWN5MblDOwRK/bmTsraiKaaF+YPv
	 4GSkZdYAdnhSakLL7wUUU2x0dEKOE3Udg8ZsaZ0eoI51zMjYSwpfSkW1qnkWMcman0
	 OXNJsnt4mH7zA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BBB09R102044082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Dec 2025 19:00:09 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 11 Dec 2025 19:00:08 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 11 Dec 2025 19:00:08 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
Date: Thu, 11 Dec 2025 19:01:29 +0800
Message-ID: <20251211110130.2925541-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211110130.2925541-1-oder_chiou@realtek.com>
References: <20251211110130.2925541-1-oder_chiou@realtek.com>
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
---
 .../bindings/sound/realtek,rt5575.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
new file mode 100644
index 000000000000..60f9af399dd2
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
+      - realtek,rt5575-use-spi
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

