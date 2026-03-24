Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AC34CFC7
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338455; cv=none; b=WnOZy9zPQWXXb+7txL9X6lWsCfYcFUtsZtPpMXRgvGv8Qnf9YT7psWn/PAK/8whI0dMH5SLGlYab8qEZIXucl4+4BycKWn2lfla2wk0AnGn35fxKK5y0tSDhnvlGqNTP7laDFLQcLuvgVfPM5NN2vORaIuIKJA8ewMZn5G5WG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338455; c=relaxed/simple;
	bh=H9tqi3P1cr2WMjyr97A3Cn6gVLGN4ykcjXu78+8FXMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWLXalzBsKliXZatLXw7KW9VxLeqhXpE0zfTXkZ0KNXwVfvNlzugEcqn6jaRg6BE8ALyZDI5MS5692XvMSYr+Tut+AeA7iiASvkphBPOi8b1UMAJ+Mxi8UKOujOzzOrCqL7FL7LdUUAJxU7feTzlvRP4SUlcJOFfgXeZD4bd1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WExyUnhe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WExyUnhe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2392835a91.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774338445; x=1774943245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=;
        b=WExyUnhe9JiLU9Y8vqQTzj5hxnvwFSVH+fumoqRBY6sqVmu827dp9s+my2vXE3HHJl
         D+4lpPrmxxK0lbwaN0XV5PR1jeUJ5Dmx1lIqIJIgvALxoSCQC1OL9gomSuydmBHLaOro
         dEg/dofJUC99vhZqASwQ57Jbi4UaVuxJXODmUEq2gvHOa0e+avdG5EJoSYAB5YhoMc3s
         ADMgEKjGv3hBq1+R0d69ZOh8zRkpN/ujAhl7jIIUGML5Po8b1iwHPhqf7vGqZlVLwDNl
         ue/d/RJT5jLwTZRX7c2f7Zeq4qK55eeNxWZFu2BEAebAGmSO5omZwu5Kiv4b3s92ILp7
         2vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338445; x=1774943245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=;
        b=ntsMXK7/KK8ExpxbCuTAzJ37Ms3BPF65RXd1D7wYeGs4AabIT3RZDbPYi/hPCqHWzA
         zzJNWajih7vr1O7g01aLEEo2PlTOVIcGfI0srE2xbAgO/0jyMXH88N0UENrLqzwwpvlm
         xEaWFjIvXQXMhNofHV+Xe+eJ57uI6GccU6waxJU0JeYcZjHIntS/41KK+5nX2N9DEexU
         drPX93YfNGZjVIThNx8GRNqRKkyeX2iXMccyV8XxAgwXPw/FzbzD61bM0zX6XSaF5TK6
         UdFCYPhIb5BcwxEvwWlCXw8tO+Fnm4J8ZtrHuRJ3jX67hJN9wHZ1pFdJZO1ELrcnfGza
         vjVg==
X-Forwarded-Encrypted: i=1; AJvYcCXjfwRtx94iDh3uwEOfEKZK/GJ3FSk77zHAyb5IrAhfPoc3BaLcTtYxZ2Pj/4mt0MQFxgmhxY2rvYOQ4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5o0/QnvGA0iZMJEu4d94Jf6Ltup1hFC7HELZWcKbkMgOz/HNv
	HAgZaT4x0eonevqz3XF+9WswVg4WDitU84AjVi/TltfQE/OkuTL8cg7b
X-Gm-Gg: ATEYQzw5DqoUVaK/FX99JuuqiDf4DwjcZtHXU3ExaQnMx0A6VSNl58vyu7hoF6w1VMm
	2To071T7A7iejIJWI1RI9lipuraui1Z4dps8o7GqM42hYR2aqVsBgzJCDm/CAaMdkidKuLl682x
	xBUZrqGIBBSDcjCAI/j9aj96+D94U3uItNVeZgCUnfOwpEzRg0jrrPu6zbVbRgq0G6p/KCumRjq
	jMJ7lwD6pfEqWBWhEirHqagEUhgKHUX4ZdPeRngeJXuv7PPcaxBSZdfeBYUHLhiJF3NGzVlqgGJ
	peJuhr9vJR7qBbBkTbyrqykjw9/jxGyGI8KpJG9/d500ceD5QB4vPQ8RWXktJ81TQgkaQWG3S3x
	0U7MgArxAuRJdsrASvwpHA0a8WR0DBopou40q5Ak+MsmLKV8XkD2lhWgMiCGH7ziDYLew7JZD6L
	Bos5AM9TnRj51xzlKBF7CpCQ78x6WC
X-Received: by 2002:a17:90a:e70f:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35bd2c6efb8mr12454014a91.16.1774338445076;
        Tue, 24 Mar 2026 00:47:25 -0700 (PDT)
Received: from snowman ([2401:4900:613d:9aee:633d:3c5a:a63:3067])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0316327esm1364059a91.12.2026.03.24.00.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:47:24 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	koro.chen@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH] dt-bindings: sound: mediatek,mt8173-rt5650-rt5514: convert to DT schema
Date: Tue, 24 Mar 2026 13:16:18 +0530
Message-ID: <20260324074618.145567-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
bindings to YAML schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
new file mode 100644
index 000000000000..05bb18006e08
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
+
+maintainers:
+  - Koro Chen <koro.chen@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650-rt5514
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandles of rt5650 and rt5514 codecs
+    items:
+      - description: phandle of rt5650 codec
+      - description: phandle of rt5514 codec
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8173 ASoC platform.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650-rt5514";
+        mediatek,audio-codec = <&rt5650 &rt5514>;
+        mediatek,platform = <&afe>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
deleted file mode 100644
index e8b3c80c6fff..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MT8173 with RT5650 RT5514 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650-rt5514"
-- mediatek,audio-codec: the phandles of rt5650 and rt5514 codecs
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650-rt5514";
-		mediatek,audio-codec = <&rt5650 &rt5514>;
-		mediatek,platform = <&afe>;
-	};
-
-- 
2.53.0

