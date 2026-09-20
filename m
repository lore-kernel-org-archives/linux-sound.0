Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5F345EC3
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880121; cv=none; b=a/pOf9xCBdb28yyQjwJp9tT1zfMNuohe1+f0UcuhpZ68REF3C3CUze4/pSY7ZXvNdO7lqOSnRF9ijVEkC+jCXl+jp/ATnLRvv4eEsQtWEbBZobdn4BAY8KtsPVdGvTzyIxrRt39I9+pODyuujreFJsQHpxUau+y+oKH7d5lKsY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880121; c=relaxed/simple;
	bh=uepsaU3slwYEfLHfsvhyLbAvmuRviSvpWKO9IAQavXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTDzXz9V/Nj3d14/SmkqcHVJtxBurEFY8fcvJxwyDqnUYBJtWyo3xlzIFwxR95fL2mZvLB7QHDObmiUn7HZrhxF5xh0E8+1rohSOd3fMjZ/R1k1msTwNnCIlepJr4FChlNCMs34Zykug38wNXbfzQtwJyjL0qj42zQqSQ452fVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeIwS8nD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeIwS8nD"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso16260375ad.2
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880119; x=1790484919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KogKCVIDydzzLBHYMHz25ygPrnoGlSNxk56qzP4OHdo=;
        b=GeIwS8nD5H5wy3+4GbbAdxxF/tb3jpO38tvqcfH39z2jTHFCspovb0bMvuhyMyqUro
         33pv7GBulFBL5Ca/ii0fJs/LFaAn+0+eAY+kZ92qUBYQrnLL/wgA9er7ifM3FgJswl1C
         m5UJYoRaxc5sskaqwgIb1/kGHPsDfO4EfoifaaQetD+iSL+aKxK/RZvRUnuNJdfRl9Tf
         JxMARGH7UsFmvMQaQPmgC6XwdaLH/nwkBRFjubFEp1AERLIm3AkWc2g5KKPmMXM6YLHh
         gr5Ye7ljBeLBwCldI5PmTDTIpUiYjhms+pgBk0sh+GDhpuM6oIbwzjdiWGZW9VeRmQWh
         BWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880119; x=1790484919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KogKCVIDydzzLBHYMHz25ygPrnoGlSNxk56qzP4OHdo=;
        b=1x/jW1Mqd2+gSjX54UoE45Mn/Beu9ON4yGS+xYAyblu1UwJj7ZdqN0O1ibXAbtDlsU
         pgkiktVTglqcLvXqr2RzbHfTXxjPdxt+XMqJkZWYYk1OUZUQjg1xIBihdaXk3IIelanq
         3ok67AEcNplmUZsJDmyXJOHKd23tu9BuLwJnYXTFI3KjwUlmaEeGtGku6VFfOOsc4NoH
         8O9RC56G34I1ovCS9jLqfUw1S+MVfm3qxb1WPzfM87123UmlrWp+9ifw05AHZiMHeole
         cDOAoI9me8r56Dd4IZYgBhEmKgg34Td0k12IKzvHJhF1QcNtuICVT7BZNlfBUT46ZAUb
         MopQ==
X-Forwarded-Encrypted: i=1; AKwUvBznHjIYvPQafUE25kmDy1hDlB7LQ+45WOJkrNYbjDkGo6RdxPh+FWw5zxeBFhLMAFG7AQC2XmE0ljUKzg==@vger.kernel.org
X-Gm-Message-State: AFuF++lG/TWTKDbBW8lQXy2uMtRcs5QzPbn/O6VE5L/+KonFarCdthq8
	A/Y+mkBgG4ETTL115pmKYVAwLXuTYsOsuPd3B1m4lhPSKi5k6Ga42X9i
X-Gm-Gg: AYBFou2WmG17n2WNxyMZola0HuV+UGRJ7Xd+/ec6G3tIPtHzL1MK46X7b1ZxNkxww1E
	iCgy/VwMO3dKdA0fukNrQlf0JD8/woRHIsW5PN4q6n6JkkeXEzPzuBE7F5bm+RdTIY0JGx0OmiU
	2GdLdkZm+nWWkH3fQ2RH8w8OR7uJ8e5i8bA+Eheg7qHsqwd4IVD7LTbJNlxZ0OaonacEv0zWJhY
	dk5rVqp0yjItjH7NmJA8ytB6H3Z0t803w1+AKKyGL/9GItMZ5IxOykVZQB1miyE6ioSYpveryjf
	oF9/HqJR9aI2bwdoDVrSceYOvJ+sj6L63I7An+jlREJPFAJA77jfD/NyOdl+kmRwCYulHK+/XBo
	HXe+GPWbdm5/TWVJpBVsZTMgG3QoETm5Zi0o8jSyHmr7VEbdutSMuMD247orA65uCj/Itxzq49/
	ukS2eT6kVtFeQPHvaI4lFPb7Vz+dpstvWoHYH4bs39si2Y6F/eqNjeeG1zacPxW8HKDANHZ+YNe
	Dv71GdUlg9ZjRb0NZxTTU6vAI5Y8L2wR1LVWlOHohdVk4FiM8RueSw9axufctNhlE7xLptDfI7G
	xaL0nijtYN1/zrLhlAe+ZwE+vltadzJae1T7q1s6KOqOoa0=
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr51621965ad.55.1789880118819;
        Sat, 19 Sep 2026 21:55:18 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:40 +1000
Subject: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound peripherals
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7900;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RNoeFTf5GkP7c5biu82Rkx8kHDbaSest5BhJxhVEVws=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U3Vq8T/1Q9z8vgxF5Dn9eLdjy47Hzf1L30cT5Hx
 r6Dp1T2d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6MifDf8+NNp/2Ffd5+ByRn7I7r9qXl/1c7LNftzf3rmDi+JLWfI6R4e/qJI6
 5rgt2Lei4/lPwf9xCnaqcer1lqVkiuu4m71y3MQAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add binding for Apple Silicon Macs machine-level integration of sound
peripherals.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/apple,macaudio.yaml   | 235 +++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..bd844c9928c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  This binding represents the overall machine-level integration of sound
+  peripherals on Apple Silicon Macs, starting with the M1 series.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - description: First-of-their-kind machines
+        items:
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
+          - const: apple,macaudio
+      - description: Machines compatible with J293
+        items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J314
+        items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J316
+        items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J375
+        items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J413
+        items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J415
+        items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+          - const: apple,macaudio
+      - description: Machines compatible with J473
+        items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+          - const: apple,macaudio
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
+        description: |
+          Name for the peripheral, expecting 'Speaker' or 'Speakers' if this is
+          the speaker array.
+        $ref: /schemas/types.yaml#/definitions/string
+
+      cpu:
+        type: object
+
+        properties:
+          sound-dai:
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+            minItems: 1
+            maxItems: 2
+
+        required:
+          - sound-dai
+
+      codec:
+        type: object
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
+      - cpu
+      - codec
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    mca: mca@9b600000 {
+      compatible = "apple,t6000-mca", "apple,mca";
+      reg = <0x9b600000 0x10000>,
+            <0x9b500000 0x20000>;
+
+      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
+      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+                      <&ps_mca2>, <&ps_mca3>;
+      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
+      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+                  "tx1a", "rx1a", "tx1b", "rx1b",
+                  "tx2a", "rx2a", "tx2b", "rx2b",
+                  "tx3a", "rx3a", "tx3b", "rx3b";
+
+      #sound-dai-cells = <1>;
+    };
+
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
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
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphones Jack";
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+      };
+    };

-- 
2.55.0

