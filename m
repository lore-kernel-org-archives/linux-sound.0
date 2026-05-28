Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0419401485
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990539; cv=none; b=O6E3twknm/aC51DqAvVrkuMwys277Nw4tSRVNpHTr/Sb2uDAXk7yPAK3JFTNaV7I0cCGvcQH7sSPqSDowlA4GIjjDCvjDAmYUQ/fGPrp5KedNXFIS6Hjvn/z84LaDjwpZPU79u6rg1J5a3UDm0lqtbZhydikWPg69JnQy7W+0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990539; c=relaxed/simple;
	bh=LAEiKGBFn6SOrB641iglxx49Xyy2dHZnkZlRr42e7gY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbwNGBJYsFUa36UXY9YnLPVtafFwuf8tfQny6gnPfYg0zsT4kQTm/TqjPSZAIC1QpxoK6cg3gsti+JBew/sIKzGWDe0W/zXzo3pZne/3yKgqQCzSyVvcEhm7Y6+FjejxHUXsIfLkRSs0zZ4CzK7+w9RIh2Qz3PMJPkfDIdmu7bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tsr6V3C3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tsr6V3C3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso113963985e9.2
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 10:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990534; x=1780595334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=;
        b=Tsr6V3C3Rpn2GWJtsYDyKzKLxeUZmBhRsMHi4yhA2UoAao4/xAO8knYYh8eQyo6pS/
         7OD2ONLI2KVyrZV9aNZc1jOUOjxaq1eNy2mMLSTKtmXml8XbTdibGWL76VC6UTU7vuop
         ZCOniod7so1h1NvWbIrkwrxQCMuFjCevVzoLO8Xl3j5tz6XdmtCDpE7CoiyYiaWHsZOB
         hhF2OBT57yeLl5n29ERZOFaxwH1gn9zThB6mDU7tmPDkOVid4xYj6KZ+1nheQliknslN
         JZBvidqYSn6McEqrIgK0toYerc9V1aoXcOBKBdMAAoznBSkSxhOvWSroJ+NMEiJSuQ4A
         CqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990534; x=1780595334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qXnXLkY1CCgVaXoTscYWjlLp5qZd4EXN61dC6lHCH8=;
        b=pgy0rBg3nigw0S20PvnUMgl5xlaiwC+SCda47fUal7UB8ifgOMZvX327l2hqlqH9Ft
         NFgxs5BcDQsxG9A6wtpFz4SX5kge33IWUmniUKRXvvVe7piMLuKyHKwNITybt9Gpz2wD
         XWaVMLU+iKV9eAKf+ZJYhlqSRSQw6XcRhXtiXOfefBD3dJ7/s+1WgzBp/CST/yu35YUJ
         D8QGAl80/bnked0qTiSTGuKmTspd3LxmZpwHNT99fsijQbB/aFHlfMHS6smxOX0SxxFT
         sXrTwrgQsse7FvFTtFDWDf/Ya6e12VwXKW/N2DjyWFCIrvyX+DJejedA1HIfP4aq3FZr
         lbVw==
X-Forwarded-Encrypted: i=1; AFNElJ/HFw5JbhydPL4z8FeM3683lCjUThTH7BfXCzckBl/y2aw6b+KyMKeD4BiGjnBnfyVhyUWyfZnikhXn4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1o48n5lLW4umpQAxCofiCAOPzNZlOX9JhKTyvrjxmOCpyWNPO
	YU3W4QZeBWF+JyoXEAuLoFxQeM5nSf7NsZVhRfxHas3I7FdknKBUD7hu
X-Gm-Gg: Acq92OFk1M2RMz1K4Bwgh2ce2sr67IS1f1PISTmdqU9H4KxSmL8nddebxgDtKEDDtcb
	vphZgYHPSASVRKzUQQ7JpefbmLEdDF456PlUamwxxgKA4h1+T9Q3I4JYVXwsuundSwTyALkQNU8
	2dLwUENDI0apGOzVYX6/p/c7VBDCY2WG+UP8xtZsdNkSgsjpiPrU+oAxYXlJ93DN2k6qhZzap4O
	p/9aja+Ayw+KGSonr4+DLuHnqrZFV+87MEG17dFwc6qAtfvtNVYBLi/CqZdz7wCjYyFYnWCHGYd
	u8a0iGMUkIUAADsjQgUBT0likxVvHuhEUkYDBBkLNM+2/TVd3bUtmLnD5uxLW6QQkSTCZxw8CPB
	cDxEm8ILpThd8qrgzyXezwgjW9jXBl0h7T9HW/JTMkO28qWor0r+GpQZ579mW69gZV1c+K6hzuQ
	Kg7YWNsp7EavzMQ8QGBp34ZA/oqpdCFtowgsa4p4LxJNXI2Igz7R2sbl7q3e3m+iqvi59fZ5CA0
	166q88=
X-Received: by 2002:a05:600c:b99:b0:490:4ebc:b80a with SMTP id 5b1f17b1804b1-4904ebcbac7mr432758575e9.11.1779990533962;
        Thu, 28 May 2026 10:48:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Thu, 28 May 2026 19:48:30 +0200
Message-ID: <20260528174840.28644-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528174840.28644-1-ansuelsmth@gmail.com>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML schema for Airoha AN7581 AFE with the specific WM8960 i2c Codec.

This gives example on how to define and connect the AFE driver with the
WM9860 for full functionality.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..b637c294657f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
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
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+    additionalProperties: false
+
+  codec:
+    type: object
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+    additionalProperties: false
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
-- 
2.53.0

