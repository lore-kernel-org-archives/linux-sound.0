Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289834D4C4
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835854; cv=none; b=vBROB5iyA6enAtyEU8TYHxRYlpyHgFimf6lYpmGJq8a+izWdeVqzuEmN6Yd2m1bgs0n+TFzHUKfq9fVW1iHBswVZtkm8nzqIgsCZxQevG8obSd1h4m0LTHpMcepM6xWhPSuIrWFm6UBdgrxLOIcfyRI9Kb6QM4QOVBnD3syzezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835854; c=relaxed/simple;
	bh=QeLyuN/2seU7NDyjmTtE2l7+boc7LAWG8fBCNm5LX8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uu589nrRSpDMlSacme+xfYyR1fdF66mmGthsZkuxTuek7QZC8YlGJfSeFxo7WIcFsKSJ9NnIxea/utzOi9RrsHkPFc4cv1Wqqbt9W99U/RrhG8E5X7uaQAuE8tn8XvCNSd5J9bfee02ZzHgodwsOx1waW+qru1KWRCwEFKBjG0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwzTyLUx; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwzTyLUx"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-65c20dc9577so7619808a12.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771835852; x=1772440652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwfoQIZP8rgjlqT6i1sqvtnJ8vCvBM4mV5XScfELGpI=;
        b=TwzTyLUxSUud0Et9oFoRC7sQ3Hb/VmT8QOt6LqAn/TeGK1VZmzUsFUzGILqxyZH/Q5
         A8w1Tkd2fuIoLuYns6TeSKKVmfdUm0VxxW9KhdeVesDmThQ+Pko6BCFVvLyhn3q2/Zqz
         XnT3Zf8RBmaiynk4ufLl/yt+wqJA4ICl9cnezs8w3pGVRxEZPZpxYYm/KpPjh8glLQi+
         UsBCoQSeOzpAHDK6+BHde3pyGgzpjArSecQeMFNsvw6OFLkae31plvYYcCgL4easvDSl
         LxOJrs39xma0gg1ZBhVS0DGIL4CsUB4hpnp+76l84dv2DtWMPxDzGLOvYJan74j6abi9
         hnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771835852; x=1772440652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwfoQIZP8rgjlqT6i1sqvtnJ8vCvBM4mV5XScfELGpI=;
        b=W9Y0IWFbZ+88L1fMEsA2jcCfOZ4KG6WzSqs5ylElLuM+OZk2rwUv1AkqbeTcJQwEMx
         XX2hFBY/bBiimCdfVUgtKzxpE0+bQ8KwnA7hOThV3diyY1aATMmfhv+yMEKcHpqkXb8O
         p6RzfkBptCnDnyqwExH9hfaHmYFnSFwwGf8BDzLHsI0y8/DdLyW5Cu9eq/dQuwe+UVxQ
         hi4GHtC30Z+GAIkAhtEVcBpPTivzcb1yvpvIGIScJnOycRWQezzw5dlhiZlockXwp6lV
         kH5j1UiQOFg8SsYjyKQz9ang/HCu2rN4lgy29Tw8USCLspeempmqQwY5qGufLCeE/ug3
         R+/g==
X-Gm-Message-State: AOJu0YwceHAgORqPBZvpP0o+vR55BdFsXlY+0SlH7bwWJdh5/MqHX1WM
	1KDDm89WJovV9Q0s5KbkAi7fy1NkrAljBW4mByLJgBYbFQkcpY36FFEe3k/ti4M1
X-Gm-Gg: AZuq6aKgiGvZHT6USTOZFKRHd4HGzUyGRUcPm2ApZewyrHOwmCWKy3GtkDKJcQzxXPD
	vPGCBzWlm04Q08qWfahcaZAEd8h0tWDRu1UpGWqnKW/XeyCMfpttrWz/HmT5+GlbeYpqYK7bX1s
	hH9uos0YsLgUkyDWHGqXt7HSfOpKLpCng6S6gv7ixHmeqaCiSt5Ey+pgyrfkNEt3KTjkuYjJF7f
	7O2HuYKjY91DGlPk7pqUUvfPpGJTpmr/XxxMPcelZDD5yGtWAZI7U+rKuW7gL8P81nEN5ewo9wx
	50RCm6jr4eOOmfEZp2DWFOlA+ZumzQN9iytAAdBeIjIOrZXZ1Jeek8tU8Dl7sReMmaWQfmMNN9a
	gm/93gvuJwiuB7k41fLluL1vvGJL9SePzeDp89Q/Iem/cZ1P8qqYy4UJMNSmQRkP9ojwS5jmXgT
	IJk3pxmgzI+T3M
X-Received: by 2002:a05:6512:1081:b0:5a0:f5e6:7f91 with SMTP id 2adb3069b0e04-5a0f5e67ffbmr142293e87.43.1771829461585;
        Sun, 22 Feb 2026 22:51:01 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
Date: Mon, 23 Feb 2026 08:50:47 +0200
Message-ID: <20260223065051.13070-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065051.13070-1-clamor95@gmail.com>
References: <20260223065051.13070-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for CPCAP CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-cpcap.yaml       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
new file mode 100644
index 000000000000..69af2022d0fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-cpcap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with CPCAP CODEC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: nvidia,tegra-audio-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: '^motorola,tegra-audio-cpcap(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-cpcap
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names for sources and sinks are
+      the pins (documented in the binding document), and the jacks on the
+      board.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - Speakers
+        - Int Spk
+        - Earpiece
+        - Int Mic
+        - Headset Mic
+        - Internal Mic 1
+        - Internal Mic 2
+        - Headphone
+        - Headphones
+        - Headphone Jack
+        - Mic Jack
+
+        # CODEC Pins
+        - MICR
+        - HSMIC
+        - EMUMIC
+        - MICL
+        - EXTR
+        - EXTL
+        - EP
+        - SPKR
+        - SPKL
+        - LINER
+        - LINEL
+        - HSR
+        - HSL
+        - EMUR
+        - EMUL
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "motorola,tegra-audio-cpcap-olympus",
+                     "nvidia,tegra-audio-cpcap";
+        nvidia,model = "Motorola Atrix 4G (MB860) CPCAP";
+
+        nvidia,audio-routing =
+                "Headphones", "HSR",
+                "Headphones", "HSL",
+                "Int Spk", "SPKR",
+                "Int Spk", "SPKL",
+                "Earpiece", "EP",
+                "HSMIC", "Mic Jack",
+                "MICR", "Internal Mic 1",
+                "MICL", "Internal Mic 2";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&cpcap_audio>;
+
+        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+                 <&tegra_car TEGRA20_CLK_CDEV1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.51.0

