Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796FB248F68
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780089; cv=none; b=mtUwCN03Ah095lhCR5Zbbo+6A9hQ3MLG3kA90V28xwmokX1uQT9oHRryu1EKK++kRhsRKc+QIvQ7OkQBkX+5Fmaq87qYH0YTeFl216hNrD+jxW7BGdgVXx5dn5loztcMU72De92fETRmvspjoy6PEoV1Opr8vmvMVQdOGbhsW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780089; c=relaxed/simple;
	bh=c0WSaIWh0GbMsdsZOfpY4fsWR+IwyVApzYh2Vgu5YlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jq6yGtcbyisPdLFdKa0k5EE2m8oI6u5inPYWIyQFfcWjMBoRPHWqo8J0MxbGGtdwbQXJ0g2A+uSkGeyypjGPLNBvBZrymtbtgSyJAn8PMoskht7EiP5ntiVTotknNydJzU2frolyVmNTj0YuXMPB8V8lS6AbdNuACUV3Hb1Bvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr81r7pw; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr81r7pw"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43591b55727so1866027f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780086; x=1770384886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoCRYLFgaaOwIEgPrhUSNB9d+/cz6LVHg1Zx25jjT1E=;
        b=mr81r7pwnJKNFpLJcYKHJnwpihsXpmONgyOcHB248+4JfXCwJUcoziEv5N7o3KSral
         p3QwuJvPCTyRA+VYWb+DCW1gy+pLj/XrksfA8MMydtYJHoFkgruLMwOWT58Ff6qMwx6e
         ga7svtLnobwRoB9m6TJXLjQ9jo1b1L5R0Uf9auck+6pil2HvXofNbBoWan7hfJOUAAhM
         syUzqucaO8fEZPXVHIgcYUP8rgNYXsrLESjHODHQxUu1HPPN3gfI8Id0Pec2TeVtJq7H
         aLD+WLLO93aansf/O0kXs2EOpHfVJeKgfcWijKEGQFj3jQ8xcCIqb6+z6S/cdAMG4+Oc
         891Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780086; x=1770384886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AoCRYLFgaaOwIEgPrhUSNB9d+/cz6LVHg1Zx25jjT1E=;
        b=P6EJ2j86MhnVg9ZkoqQdKp8WZ0pOQyVUnPGqmMm5NQkel3VFh51aFqJJc8WChpIt8e
         W+sg+AbeVCcgvqPMhyaU5xxkGjMoJsyiJAHS16K/3m725v0et/8nFtP6gHQBUSV3f+y+
         07z5sQAQ50U5pg9Z2xFObtIhOFF3gff04zrt//FrJ6Pcr/0+kX7t8LNeRSog2AKq+6NS
         4D/xcm2gpSye/2Q8qAEmr6hNMuXoMPgQ2YmfjXg++37BJsrkVkQbxcQummHzPVjoE/1w
         k8qJHgbC3nvwZpL9WeL0Hx48a7+HdWuKtQGyREktRZbsALuwAbjv466TGVS5M0Y14wSP
         9PVw==
X-Gm-Message-State: AOJu0Yz5hF7wbf1yy/JexkaBVCy4/z4QKDLnopkgQgs275d7IiFNUZIC
	JCFYd++tknISvErI4MNDy08Rym7NaoGFQZxVl8YLchsQpm/LRhdqZg/x
X-Gm-Gg: AZuq6aKUiGaYovVwEzSQx1cxxgLKzLAOVF8oLk5nYOgaHOz389D8pLz5VcUT91Opgb7
	EzMRx5z76uu8HkYoe5PdLNvqVo6ZSotu7JUYiWgMZGT3lfUNGowrow9TZZbyDt7k2MY6zEFwNYY
	V3QCnwDXjadOUavXnEZw2esEYvlQIECb9DV1nP3pKa7K3v8im5V9OmS57eLV1QHDN3R2X0aecG+
	sNZkJbC6GgKFxFrP7NyyL9WZFJQs24fuSCD+DHSoDB1ZkytiSf0WYFFNDsehGvbgh9ZQZgvM8eo
	ZDMSHSM+Aa/pYkha+99SVdcz8hcSjKXv1CkdhLXuHpcOpuj/deWzw/j74RbD06/onAH0cOeA5MV
	KTL+3lOcvA2BrfoC2lk1A3h9CxAc5Vv62b631GYaMiBCHxKud1ekGCliSkUyd+qBAxDrGWhMXhy
	tOZ69uOnglu2Y=
X-Received: by 2002:a05:6000:4023:b0:430:f68f:ee7d with SMTP id ffacd0b85a97d-435f3aafe9cmr4441580f8f.47.1769780085489;
        Fri, 30 Jan 2026 05:34:45 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:45 -0800 (PST)
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
Subject: [PATCH v1 1/4] ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
Date: Fri, 30 Jan 2026 15:34:31 +0200
Message-ID: <20260130133434.353353-2-clamor95@gmail.com>
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

Add dt-binding for CPCAP CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-cpcap.yaml       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
new file mode 100644
index 000000000000..0af6bd3bf639
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
@@ -0,0 +1,85 @@
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
+      - pattern: '^[a-z0-9]+,tegra-audio-cpcap(-[a-z0-9]+)+$'
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
+        - Int Spk
+        - Headphones
+        - Earpiece
+        - Headset Mic
+        - Internal Mic 1
+        - Internal Mic 2
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
+        compatible = "motorola,tegra-audio-cpcap-mot",
+                     "nvidia,tegra-audio-cpcap";
+        nvidia,model = "Motorola Atrix 4G (MB860) CPCAP";
+
+        nvidia,audio-routing =
+                "Headphones", "HSR",
+                "Headphones", "HSL",
+                "Int Spk", "SPKR",
+                "Int Spk", "SPKL",
+                "Earpiece", "EP",
+                "HSMIC", "Headset Mic",
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

