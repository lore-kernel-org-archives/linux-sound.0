Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667CB3F660F
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093918; cv=none; b=qqsXGdelxTGZ11pvPqPSTb7SyRqIyQTz5qmSY0S/2aZu9BXCFc/xyLT3LNB/QWOZ7JjHtatI1cFV9BjiZE+AsRTziuRb8x+hodWDtMkX4mofJkmDzDFXWCNNobUKb2gUk/OF1vtkM3IYiJ+FlIdSV4MMO0BG1NaX/m3owRfv+A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093918; c=relaxed/simple;
	bh=QMy6dp1YVq8Hg9ZfB1NudcV/OzV5CrFIMt7zVM6hKMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6dwNSerAAYaRyhRMj6a29s9LgQRHcDLOhhjdoD+CTGme7aTwiAQZ31+AG5ZzEucTN4hKYSOHEnNOOq6VVAZNlTFAS188O6zMp4X1hgszsogxO/9c3v/GLNZaXw7TXcotiYXmxJtzyOevbJ59noMo94lfek7oX4bdiHJxjsBVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKyUR4He; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKyUR4He"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so369554a91.1
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093916; x=1791698716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=aKyUR4Hec80ZE9/PhDjeFbMZt7BAnuFuHuUTvOTCCEiMXEtskuA1EkGChimADKh4TE
         XPOI0/It9KI9g3K1JsQs2IJUVZgZH7B1BUXhNFfha7WqbcNQMV/yppb7cvk9Jj7c8pZt
         P7xXzS1LjDnpemJrxJTNvNNGwzm93hzWCh+tNaC9nGemgJQ9YYPrIKdUmEJY782XLsHS
         tJHlufRRboSBQhvCVG8G/EYN9yVxaS+0Lg0SYeQ9bwDwgjFyivLjoT5yEtQHTZnXCUsu
         9Flqlwfgqj32lU4+ynYGQykjZPtbXT/aUtRhzKTnQRkfHLuimdGfwAqTw67oglJMmbGC
         twxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093916; x=1791698716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=uUk4E0nKpzwX2iHqlByu3+aQLBgdHiNVYpd1EO4RZW886GFqoxpj0Kbdgk1RDrsp9+
         orgRVvvHVDL14U41+LJZRZzR1Jv1HPGr52JRYknZuk9dV/1HHCox5DN5AOxNxxB0M0dR
         dbQoSW7G4uPssM9y8gn4ni9VGPIl7irRtaBgZ7Mfaxswn85oYxFg9WyzMze/ci0b2IO+
         1f0XlrYxF4Tq1+2S1OI2zP0k9l8Xo9nZeqj/imuuAA0VBA3SN0WQ2y8o8bqtwYe5UAdk
         wPT2hOwaF+KX3e76cHihJpBgftHUf/deRntAxIVjG5KSck2t/5Q+LxNtVc2YHX5ueb2S
         VNcA==
X-Forwarded-Encrypted: i=1; AKwUvBw3qyUX+oBF3pPRzCrKPzgcjdUMh7GNkGNLmBEgji7Bac19oTXFNFPdD25S3tS1+JPubok0Q3c5octlPg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK8EGFvrBqdX7p8EJtI4V30gTbLfGATtTqvGfCeUDxTlL2bRg9Y
	F9R267EC3ouhEIz52D0l+u/MJrr9F+JE1ARKXoseyUTOdBiDMfaEbt1/
X-Gm-Gg: AYBFou2o5bMJAAZqVjrprHPOHlPJ1Eyh7vW/UC9XJuYGpBeNrufBl8h36G3Ah77gldP
	miiA9C8YHGGflXEIvXkmbBnK8SugBnZjImFA13po4kVLSxWZ2mtkHuZa6jrOb/gc3F4eXeLGHRv
	UF/iYr1MRzPGeJcrYCWK4WTYIiWrzS9SehYevVNgaKiUlIkiZ9Pk6g1JL9P1R63d6fX94HxSe7E
	x8Z7l2ZqPeLJE5Xk2PruGjwyBA56ScE0/HHf1WzYQI7Qu5VEy2m7Wi0XuDHsssO9ni2e3JSrlO6
	fRp6ztk3WHX6DHdQtSfqwZJm76KDiu77uEv/DW1W1hyjnzOnE6Jx7FSIcLLc86q4hEr/O7PZBkT
	NFdQMdXbOak/N46hhADzKhBnawLfKQKTPCsCReZAKYkXjXV6xp/55HEsz8qhiVmEU/OnOkx9+A9
	u29hv7qmdMOPnUOs/uSOlpM6BZFUABEpltJlknKXSZpc6SKlYAqOrrc31jWj5fmvgY8Staa5h7x
	p90iWnBGElq4iNT9GiDXD31zJGE0A5HY9rw/2Zae3iMWqjhLCyaZ7fDPuf+t04SJNsJFmkYCFH9
	b/Z6Bw+S7DxFtjBTaJLL7BoeKE/ubw8ASfZ4imlR8QJ6QJk=
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr2736881a91.33.1791093915710;
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:32 +1000
Subject: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7056;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=edwYXBTQUN1BJwuH/myONPpbVVDVKxKBlGn6cvmdYcM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+T8n6S05ssjt3VXeH/5abN0rD7X8l3TwfnwMveNC
 nZTjyX/6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1wlNGhib72Y9aU6bFiwarVGz6cGLlmgUJu3PeybAcaEmz/zF56yFGhvPLv85
 urNso86dFdsvVpArpA09jsy7Lmf68f8T2CUMzJwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add a binding for the primary audio subsystem found on Apple Silicon
Macs. This binding integrates the codecs and SoC I2S peripheral
used for driving the headset jack and speaker arrays on all Apple
Silicon Macs. The internal microphones on this platform are
connected to a distinct coprocessor and are not part of this
"main" audio subsystem.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/apple,macaudio.yaml   | 210 +++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..c0a04fab82d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are
+  part of an integrated audio subsystem comprising of Apple's
+  I2S peripheral (MCA) and a series of codecs. The machines
+  have a wide variety of topologies ranging from a simple
+  mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own
+  mono amplifiers. This arrangement can be expressed as a
+  set of DAI links, where the MCA ports each codec is connected
+  to are represented by the CPU side of the link.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j473-macaudio
+              - apple,j456-macaudio
+              - apple,j457-macaudio
+      - items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+      - items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+      - items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+      - items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+      - items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+      - items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+      - items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
+
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+      cpu:
+        type: object
+
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+
+        required:
+          - sound-dai
+
+    patternProperties:
+      "^dai-tdm-idle-mode-[0-9]$":
+        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
+
+      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Idle slot mask. A bit being set to 1 indicates
+          that the corresponding TDM slot is inactive/idle.
+
+    required:
+      - reg
+      - codec
+      - cpu
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphone Jack";
+
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+      };
+    };

-- 
2.55.0

