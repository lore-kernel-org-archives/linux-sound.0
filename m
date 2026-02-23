Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C343446BE
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835204; cv=none; b=AuHD7mhQJxbC+dcvJbMLyL755md+AuKjYmAEqvaBE7Wn7m/5MSaKLiw+ZSF4x5GTYStO1+JQWeEAE6hHwpKyX2sh2IkXRkJ0IxG1qIylbK8IGSEc9mPBCy6buXq6dNmxWLaRaECrHl/qfNYfYFqFDF2IguJvzxhkeE/5dsrnp4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835204; c=relaxed/simple;
	bh=E50Z0kZ8QEC/+gID4A4p9F54kc2DuevigG1LcHQ1FUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u59r2OXShkbcAEbf8woHzmhx64SslvLc225f30ZRxec3OWM3AuznJ9+xfBOKARVZH59ksxBAgMA+qLNNegBB5FTvhVw2pR4saJIXhZbqmcSIKC5pv6nPR7hVivIkmYuoaopIagiyd+yfU5fwiR1qawItcLL6GQHb6b7btql0Iz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPjVX3Wl; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPjVX3Wl"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso7233547a12.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 00:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771835202; x=1772440002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=PPjVX3WlEi4F0FQD/5TmVoyizwU0SLu0DlevDCp84oMuCzoAe8XF0XEDBYjIZOA7VN
         Pl6sZxx+26rw8kbolW3CAiP44CiBSTH/7QQ1cYuCHcDQ4mPGuojJmlMigANP5nOrI2rw
         jrb/r5y9Wd1nOzkp78XqPdlI0+IPW7O1ds9t4G+t1DqniGcGeDJzgFdu+wAAU+2BrJUF
         m6qfY7K8pvPX2K3I7kKbQh9GZm0sbP+B8cUbt5P4//8I1LXpWxwN4EBqPj+JNjSbkxYA
         WoYzSoz3TCEgcFEfnqpbY14hsEGPrFAPBU/XQ2HlW6tx3tMAZNeKPbiQOjAEdOoZXvkv
         8FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771835202; x=1772440002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDk6pvEbCDbKFm0MEs5hS5v1vRZPcd+sQDBn0D1BQXQ=;
        b=EU2xSJmuDQLCDJQTBCJ72vybtrBaYxSsgzKbzCN3vsJtJVVetxHE3nSS1DgI0CJ8/S
         HbOaF/0UtE1EzM5MuDKNg3BKqqZw12ib1fqagQRNCtFWx17ukPC4JDoWzXJt9Sn7bEno
         eNLS/WFXpP8PMpFf9AH1x669F3f979a7g7SX3V/dyDa49oAV+yQ6W7szknWlOO75HOPh
         QfCuu8YDSZEebHQOWQPUdzvyufraW2mXYUvnFJFTvvlvvJRNWXDVu/TPwBS/0YZEM3oT
         /6mn0IiF6hAFmJER7eQnYGjyG7D/sn8I8Ic65pKY7tuWXSnuCpMHqafs9nCSUNWDX6hj
         AKXg==
X-Gm-Message-State: AOJu0Yw/vfz5LZ/1tWOmMwKR4253dmLPRRrIzwu911pcKZHNiH0VeqXN
	GXL+DiHLfuuYKYHnK+B6FTAQFfbVqC3+yk4KUOm90r9qGsg2YAktJwWFwsFhgL+Z
X-Gm-Gg: AZuq6aIlKKorXkumiXD9WzjVwhFTU64QTELUK7hibQxUH6zk8Zre6Y/IikkY28sNvac
	4PCnbkn9IqQE+tKItMfyMYCropa26+Y7cPsVSFyBTBsQen748yvhCEiFlzYf5/0jTQOoZg3v3q2
	lWVbc4tnqGUQxpEKKgLd/ihOwpI2DQxJWoa3JaGnfb/yvEY4ThWDoETbVitjJLH0/O2TGu81C2G
	rZ3WmsEuj4Czk3JyaCCJ1yicAGo2iHW0tlM+UOUmyuqR7cdEvMLBk+ROPLlNoYFQR89FubCsKi0
	BsNvIKDmkBydtMrfRF0/6ITeiIKxHe0FXCA8EUh13EENH+Nlk3O/ZlxmeSLvd3Ep6yWG0h/eKgF
	89UyHKOaJ9Sp/lvR2neQe9DuwHa9VvKyTfMqXaD+YwxbD9F1DwxjzUwE/xKJ+DL4BvqkutSkV8J
	fmjlsQEFI6EoFT
X-Received: by 2002:a05:651c:41c7:b0:386:34b5:aed2 with SMTP id 38308e7fff4ca-389a6072e4amr24552671fa.5.1771829463626;
        Sun, 22 Feb 2026 22:51:03 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:03 -0800 (PST)
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
Subject: [PATCH v3 3/5] ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
Date: Mon, 23 Feb 2026 08:50:49 +0200
Message-ID: <20260223065051.13070-4-clamor95@gmail.com>
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

