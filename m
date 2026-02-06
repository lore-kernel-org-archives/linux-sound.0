Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC193A1E64
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399282; cv=none; b=WLxgu70Cdfh46F1K8+yi4gLTDYT7/6WBVJiiyjPx00fJ5YlPbDm5ijo3lOcKKJMXPvRtg/4RiG9oHikKqRs7K+fa9CCHw+Uu0FX1bixg3yMoUFyhD5QNM+9SOa0MXYuloIEAO4CvH3ubx2zW6AzoY6Q7U/5TiiTZ/+f3nALrKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399282; c=relaxed/simple;
	bh=E50Z0kZ8QEC/+gID4A4p9F54kc2DuevigG1LcHQ1FUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEiYYK6v2o36sMdDpKS17RfELttrEyIENJ7b1ukx5N9X5pva7tc/4psDcH8F634Wxh+NonHHD2L7aB6XnHdnUo3rYmnalCcRRWh8d2yJvZx/BlTYcKbQGWUK823cwmRLoiFzc5LUN/EXyC/lr7WM89GiklB+8Lycw0LD0cOUvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3kZA4RD; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3kZA4RD"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so21650305e9.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 09:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399280; x=1771004080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=L3kZA4RDeGJ0TEanrpd2NjUfonzD8ktbuKDOeJd5Pyk0kMqRbfHehb8/a6TUJcVP1+
         ESzEFwDwXi6iVRmQWsLzKgt1O2SVi78zp/WEpQVbMB6+oVFdw0gz+AGjKF08u9yhiMIa
         BuWJYjopuPXTGPMT2O8wuWiFNyXbJPk+fchTjtQhqY0Omr9b2j/JcMOIRaXCS3EOFclC
         2tybReXUEWSZ2ZZ/nVcJ88/iE412kEkNfC5fWppu8mc85V8r6XseiZ5TaOc27lI0FYEt
         QYO9o+2B1tB+YNiQV2KsRYoU0YHp4w/7dXTWNWbdDBOkgs8Qwr7wpuUjyiY4YlPbCKHk
         kbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399280; x=1771004080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=V5TfieU5qpBlNI4jpjywhsfnvReDabAfvKCzm48lFJVezbG0j4e8eWQum0Dd9w9AL1
         vyPyAttdt0K1frtuyf09IitGNq3FhPNSW5wKQyjh1BvKzozbB4nl3n78ic/mcRbY/p54
         aNFuGyXpFKbKQS/luxiJAtaKp7yJDOHVIyni4DkT9ywzBgH8NJPHyBZxKiK2T59fNtrA
         bnBJvXA0WuN9dX23bgkJFjgVUNN9kTmTdIVkZErAm5qFE9XlobhbmhcEqvp64NjXxCh/
         ZkJRz1tWJLjw1nviNru3X5Vbs1M6WCXpW0zl0Jtlnl5JsWsmv5WnOHCT96nZOHlBZPO3
         5B5A==
X-Gm-Message-State: AOJu0YyyPOJrFqjJl+0zUBBSr6eKqwO9lDkyw62pTILU2eNeM8BtMC0e
	LtU/iz2k9qzmY4PXHPYOw3i/Y/mA07sr5kOUsec2RT8LZZjVfTyo3cdZ
X-Gm-Gg: AZuq6aJlHVAskw8qVjyLXwXxDtt6wB43ftthj5kt90XYsCxHZ1TGqXuajRd855F9pqs
	CY2MxcLeNXPYb4VvlefxPE5ggyWWH8wReOUo1CfSzYSnsY9xr6TilonYZjMKSIjvigT5+rGRrc9
	GjiNDrz1THXU/wFD1GtFgdBoC5rMjrCMI4X2pNc0Mtr10Va5TY+t9FEVjnSHeWzEjxd0LWoN/q4
	GEOPCCtg34XMJEAFNyDtxdLfOv/OdT9o7A31HxpqJRW4BgBf0Cpo78fzuXizLT6uCZim+a2JhWK
	Aw5Sk5CwBrg+sGWRcAXqMx3Ug3ieavqZp4vjIohB42dFynz3/lW+jx2TPOujJgfT/YcneGCYUE4
	NDcBdQ40K8GI0TqzveOcby5/4Ycj3aFIMmu5L7ZnVw0AZzGdb/iwrUbFv075Yl777G8NMgnTvOV
	JJ
X-Received: by 2002:a05:600c:3b20:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4832020df6amr48124095e9.13.1770399280411;
        Fri, 06 Feb 2026 09:34:40 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:40 -0800 (PST)
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
Subject: [PATCH v2 3/5] ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
Date: Fri,  6 Feb 2026 19:34:20 +0200
Message-ID: <20260206173423.145954-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206173423.145954-1-clamor95@gmail.com>
References: <20260206173423.145954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-binding for WM8962 CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-wm8962.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
new file mode 100644
index 000000000000..2c3bf5a02a34
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-wm8962.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with WM8962 CODEC
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
+      - pattern: '^[a-z0-9]+,tegra-audio-wm8962(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-wm8962
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
+        - IN1L
+        - IN1R
+        - IN2L
+        - IN2R
+        - IN3L
+        - IN3R
+        - IN4L
+        - IN4R
+        - DMICDAT
+        - HPOUTL
+        - HPOUTR
+        - SPKOUT
+        - SPKOUTL
+        - SPKOUTR
+
+required:
+  - nvidia,i2s-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "microsoft,tegra-audio-wm8962-surface-rt",
+                     "nvidia,tegra-audio-wm8962";
+        nvidia,model = "Microsoft Surface RT WM8962";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOUTR",
+                "Headphone Jack", "HPOUTL",
+                "Int Spk", "SPKOUTR",
+                "Int Spk", "SPKOUTL";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&wm8962>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.51.0

