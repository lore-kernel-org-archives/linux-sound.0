Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02630F550
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 23:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763681407; cv=none; b=ZuW/0qCJDyXhECQFiNI6/AfwxwytWxwgHJeJ6S4I3jdeMCNHoRhH6FGOQv4uqRv2ZZpHSrAYBpUurmgcJmWeIhDIbZsFNDI0zyqSM4Lkrrl1IRAxexM+m1XviFNp4x6ob1bPUsuSrFZkKn5T6mWrjmwHTwQYl0EIyIewlFaXtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763681407; c=relaxed/simple;
	bh=xZAMMTzqv3xW7C+UMRhWcflE3oJn9Xg5Wy7C+qUtd+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNlX2nLgnxGWm3CmTfbktXFURIXbVPerqvlylT22q2/bIRXhV1kJe1tKw+Y13P7HH3dobeOFMkEbPYI+wtCxY/nI4tJs+EXKaooDaGC8ZFs8te5TZPa5tgJVPZflbJl05cXDiGoBvHCgB73BSDLA6TesgugVzGC7HJxlsgcafuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgTVZTDi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgTVZTDi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429c8632fcbso846651f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681403; x=1764286203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=OgTVZTDimZJQWNx2ltx++zQPNO7lsRXZ/bwJ1BR5caIRibnHuqR5uAqoeagjfZMxGx
         F3IAgQ2xrgcrRLTykHgo9y0UoOLjcPUB9t7FFagFzi5NpnP6vnWCiEK7AZZwuZXTdFPZ
         BK/Mbo5SVMOs7Guw2svtGePTm7tmFu77ICPhqQr4X+WaRlHnjUJHl15AMzEXKVw+SDnK
         TA2PvuQU5a7YvPACSzL5JbuQFfaJadhApzjYrc8E/svrU5HXgjEIykfXuV2SXSjO0tVg
         cDjdaMV4QM5GyNrVQrDdhNM7potLi1ZC+dVGF8SEYPT4v83kt9VLgwYIR8XkXOBCfJ6P
         vqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681403; x=1764286203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=H/LBzdLUzN8071wCm/h5UCtgPeq2ogbVRSvToTP+UzwprPuxya/3s3E3/TD1wQaJNq
         JoyanWdgDI6jMVOvpdhynoVCzQkL0+1kDgp3Q5QOM7NgYovCzrkF5ks4qkIXxQ/pKcHn
         qy8LkfiOQO3jjohkNTTRtbvc1RKMKSPYTtxGYQhuH6VeSBIYdIwB8l1eZPCAvUDZPDUh
         d1Y4c5+lncuMW3jpqUJflmfD2e4G9TGBw+jYUMLNQoi85gpUfjSeJOKLM7j1TmXCGfh+
         JJngsTx+nuC/Z3wRIsJW7SzaWUbahb2B8kzzx4yiXGh9t2ZuevU+dthWwpi7+3qq1D6Y
         zjMg==
X-Forwarded-Encrypted: i=1; AJvYcCWWMUZ9urxPAkWJEy8jJTQUA3ODauVoIR0KwDznDL/xfPo3WoDzwNhrtkZFMHoIfpzlOJWekP1FbjShlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5jWpCwVIDNqTWypwUqLh9MCdsmxHbXWatYgvq/zzGO3YBc0O
	AL++UVLRPNoyOp6ghnMHjpuQYtj9V9zFFqDvZqAV5pev19dj3ZcKn02K
X-Gm-Gg: ASbGncvH27SQ7/sVsqxym0gvyiGhLDXd5f16bhV2d0kW7Hnix7S10oqu9g0uJluUx9Z
	fnU4HrSLLKHOXr08bs3MJ1bSc5Oa5tvLXmGJ5eOPNpKj7k0UvHkKWdkHMr22nPy3/YkoSGW3L9Y
	oUvAHTYl7lHPP6pkpr2TLgut2HavBvPLrwo4mXwAKZB4t5UqATFl7eaW+qG2/ys23kbZTwURaWf
	dY1FuiFGvRFwz+EB+fOnnZl1YW3zkClSF0rx43DDqEQlvUOXkRBr2D4y7O5Roe2B0fIP3gGGOaI
	8nFQt3pMGVc6Fr54c1XBJBxcSKu3NiGdmEDt5wzYefvusy5rhI8clYkfsqGdbkPxoUO+bY/f8sM
	IgY7ip6+88br5HxmzMyGhZ2qoH7hwoP0wxjvzFmfAey0N3MXIR8sGv3WxkxWqV4wRxo+NNjj3gV
	2ZGK/w5DYBXjXGeeyeaEV4kCe61DgU6rRfQDOmBwjwqJvGsWIEm/U=
X-Google-Smtp-Source: AGHT+IHqEb8VCudY5XeW4oLvZSGAjMxNC8ruQ7rhvDVg5aKGaQnnkgzkoE9uKt2k4/hXUDSeMYg4Nw==
X-Received: by 2002:a05:6000:420e:b0:426:d5a0:bac8 with SMTP id ffacd0b85a97d-42cc1d19624mr85145f8f.56.1763681403285;
        Thu, 20 Nov 2025 15:30:03 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:30:02 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
Date: Fri, 21 Nov 2025 00:29:11 +0100
Message-ID: <20251120232913.32532-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120232913.32532-1-ansuelsmth@gmail.com>
References: <20251120232913.32532-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 AFE YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..ebeda0876280
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of AN7581 platform.
+        maxItems: 1
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of wm8960 codec.
+        maxItems: 1
+    required:
+      - sound-dai
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
+
+...
-- 
2.51.0

