Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42982C11D0
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780101; cv=none; b=i0WVX39QCOyiHqTYW48h59nb10SNub1Ds5nxoiAD3mfRYx8rsZhhnxGhGgm7qOM8yHfuyw3J1x0SrOgkHVM6pbaR5/tf2B/EVPHTiNAemjFDqGhb6reM5b4ZcfTSKMR7pwnGzhw46QknaPuHsdceGrYgmrzL8Z9XvZi7hjtTSv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780101; c=relaxed/simple;
	bh=E50Z0kZ8QEC/+gID4A4p9F54kc2DuevigG1LcHQ1FUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o53H8JYLManpk1m1BtHQVyhGV/HtoqnbiYCc4sVm2bMcKUFYvYC3io18eEwFqAitMJAXc83Ji1IQbFP5/ubPpp3DvVE74Eg7jyX+UXmlg2OFm47B59Y5GEWvq3E0x/tvKky7iZ3/od5ZIqdw+P53rUzU1unEdRjfR6yRPYp8D24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0WJDHqW; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0WJDHqW"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so23019945e9.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780095; x=1770384895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=P0WJDHqWGnYnB3jZNkeY8R2g9r0jVnSA7XXv9FUVti86QLM1uWm3H0E+eK05IUfeuo
         bqXVxEIrvP57n+iDki1shcVVbe4xe37pAqMT5YwZP3sQcXZtT3JZLASyI9+8IdDn8IKW
         i00eDnwjl8dnl6Iy6zG6hzEvkYxfhwZA4eDOQZ09NqHgRTq4OB8F0p0ISgsTftsQsouJ
         13VlFmn2DEmg5dwc27LIH+SugKoUu2UpH69xCTj3ovByw8IYEZuuwU6+knSabjuoYckd
         TQQcslb9vUxdfxWzlWqZp2fI5NXGvHOzACPAKYKTk8XelxtftIhtZi8H9qeLyxesSHOG
         2uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780095; x=1770384895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=i3xLNh3OPT/30rX1dPLGEeKwsdgUn+tkLi3NZKpsmF3zhu80atd0O1gwFDJAneSysz
         Sa/zPr2pVW4nWpTQnQ65KdetzRzpjaMWowhnWvgddMvzt9QyZsetAuto7E1Q/mS9vzbe
         1wsdDvmEvyrOWbR8EJqvw2KCLT0M3MyAOaz9V89EVR0Lx7fwGgtRNThD9RlI/ziy8GN6
         B4uABnmWbIabQvLqpWVKX6QizqDJOdfppvFcK8LCfabid9dy+hAQiC7Qtyqr0QIYIbop
         fppkS+ThaIT9o6rWBlBO3qwcO6lkn+Iph5py8VIUZnx+94xz/IAquVxp6eyMiyUjLBFb
         9ylA==
X-Gm-Message-State: AOJu0YxYbWslcs6ny/VLPyH+euMf7uFebLyX76Y2RgQJkJy/7Wa4FHlU
	vlw960VXgVKb/TvaRP3qMwoPpfBYJ3nKTexy0BlrLFn0YY1KMmnXFBl/JnxWg+P6
X-Gm-Gg: AZuq6aJ3UegRhE3C8UhI6EsXOqu7t66RKc4m1Ysr4npRvY023bczU7qkhG8SEtPZv0n
	Cy+hbTt7So5mT/BzvDwxZGKBbAYtbgYt+eqihZ5cgH4sSbhKap9DEn1V4Qgxz5nyNINGUzarwxK
	venmsRSyKne+wQ+Bw/0ypr6cts/0Tj18ddfgaLN+JukWlObmbMBiH9hMGWX3kScW7IEy+bxF3ml
	B3FSJ2zD99sCygmyOl8S4YQcKZdOX4NN8pGJRuA+vLedXTqx1VLRDnEAGshsB67PmYn+4RXCUAY
	dS7JE8xBOCVckcrV1GUUiUoKAvsn4e4HqfmRVuTM1Z2lPoTghLqe2pbVup9OS5ahbP+yvFfRor6
	IFwj7qZVx0ZPuJIJRQflfXgT6xWKPPf4IUbuGsVocXNSBjU/7jdw30WpnZPJT9+CD/N0zY3uBL3
	p9
X-Received: by 2002:a05:6000:3105:b0:435:932e:f932 with SMTP id ffacd0b85a97d-435f429d77emr3966731f8f.7.1769780095157;
        Fri, 30 Jan 2026 05:34:55 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:47 -0800 (PST)
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
Subject: [PATCH v1 3/4] ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
Date: Fri, 30 Jan 2026 15:34:33 +0200
Message-ID: <20260130133434.353353-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130133434.353353-1-clamor95@gmail.com>
References: <20260130133434.353353-1-clamor95@gmail.com>
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

