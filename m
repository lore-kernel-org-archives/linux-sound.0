Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A6230D32;
	Mon, 13 Jan 2025 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736750146; cv=none; b=Nqg4aIap4BEgJTMMaTOw6jGjIOfc/NagqhNKeQ8C7DNDnEuadZez9MYcN92KmY1A+J6UWNJoJH6nXsoCXWBNOOLjAeCgE5eSX9wWX6C5Y5s8q4eeMiScSL9Vks5NWIJcvt8sHApNYw/H1Z5oatFLnxQTJAVd8TmF4AZQSl03xpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736750146; c=relaxed/simple;
	bh=TVWgIhv7jNPBn03yzeSSA6nU+Yg1gSNtcBJ4IGCNeJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9a2jXF5h5Bcq/lgfwreRWG+gOETx150WeafLmoIQ6Za8nU0bl5pJi6/003Cv73QzhxC0eMTkHuyNvUpnaK62Muid+BJ/JNcLF0vzXKawx9/zBD3w/AQcXYQDzQtyNx16KWlKewo/xcoSVKvI5499z06HK6KqlT6bMpkOdqwsQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1f3cbF5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1f3cbF5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2794CC4CEE3;
	Mon, 13 Jan 2025 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736750146;
	bh=TVWgIhv7jNPBn03yzeSSA6nU+Yg1gSNtcBJ4IGCNeJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d1f3cbF5Jlts0cA079nixdITOu2A6yJOvh1HemRh4Qk3aHbyn+Bli3MTQT5YclCZM
	 6FOTMrYRk5KMUUGIYh7begdpW8Z6qEP5praTmx45aT5XQUOzoi81bYzlzRZLAIe07R
	 zvAbCnOj6LhIWGLSAq4F8e3op8zFilpUAXstcJKON0kRopovUb9UtIHPbw+X+M61IY
	 RGy84gcPDr//LNRi3b2vmyOIn4A60rdG/ol+U1JCYtckrFISiri9KIYbfxk/naoJxB
	 dkmRuKaKvvx/ps14MfyueHFNh9jgMrZF4ZVnirlfjCMWdac9d8nbZYfIY/aZLqsNfz
	 1su8mPzOaJVTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11338C02181;
	Mon, 13 Jan 2025 06:35:46 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Mon, 13 Jan 2025 14:35:13 +0800
Subject: [PATCH 1/3] ASoC: dt-bindings: Add Amlogic S4 audio
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-audio_drvier-v1-1-8c14770f38a0@amlogic.com>
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
In-Reply-To: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736750144; l=2813;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=WCHwNizSKV+MVm8cr+tvi7sYlTiE07e5O4lnJdR4l0s=;
 b=EAQ/sWZRwRHDES9kXCR4bRpzb5k5JJQvE7U+C4aMeBUpmUb95W8OSeWgevMGcsLYQkNFO64Yf
 zYgk09Bs42sDcegEYaRYDt0ObX2B+i8IhDGiH0cY7qebfgvrr4m5mpA
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com

From: jiebing chen <jiebing.chen@amlogic.com>

Add documentation describing the Amlogic S4 TDM output pad and toacodec.

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
 .../bindings/sound/amlogic,s4-tdmout-pad.yaml      | 36 ++++++++++++++++++
 .../bindings/sound/amlogic,s4-tocodec.yaml         | 44 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,s4-tdmout-pad.yaml b/Documentation/devicetree/bindings/sound/amlogic,s4-tdmout-pad.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..52c945e63fb277c92149fad7abd69355f5c9fc9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,s4-tdmout-pad.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,s4-tdmout-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic TDM Internal PAD
+
+maintainers:
+  - Jiebing Chen <jiebing.chen@amlogic.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,s4-tdmout-pad
+  reg:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-controller@e58 {
+        compatible = "amlogic,s4-tdmout-pad";
+        reg = <0xe58 0x28>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a4d7388c0e48095b4aea0530c7feafcaf066b063
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,s4-tocodec.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,s4-tocodec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S4 Audio Tocodec Control
+
+maintainers:
+  - Jiebing Chen <jiebing.chen@amlogic.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,s4-tocodec
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
+    audio-controller@740 {
+        compatible = "amlogic,s4-tocodec";
+        reg = <0x0 0x740 0x0 0x4>;
+        sound-name-prefix = "TOACODEC";
+        resets = <&clkc_audio AUD_RESET_TOACODEC>;
+    };

-- 
2.43.0


