Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA2360EC9
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480224; cv=none; b=MAA1L7mAB1tkVQ8OV8xeG5xAdp7UIiEHfuMzG1TxzlRAm3QlfLqRz7xFRTM+2AM9trwwqRdGtKn+hXsZ2I5NKchA3NWmj00jpmo2a+4I+j07w6FOBGIY3iyz8Cv5WaHMtcK/X+XLLGE3r/hZvsDIBJVRyWst8g4LRLpDoN3eI9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480224; c=relaxed/simple;
	bh=q/CCJHy0j9gREWjFYXbVm9WkoVqYfj1Sc7sI9n8KQ4A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxEVJfk5zQC6H9Etg1e0cAvj9OUM8D+5WPipikg7nunva2VCrjtFmoFfwWNHl1MJvX3J2SYZ/kYjWB1H5lYeNDZMghG5OoJKOs3TGjNRqV/LDWSoQobWDAKipzuWiSSYXR8Tg4fATSYemceedEzikVSc8Pk2fZvMV/U1gqHysCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgKAKC1T; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgKAKC1T"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7872abb6so375952f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480221; x=1786085021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=;
        b=PgKAKC1TMR5IzjjtP3R8jzMqehVZhKkY/dStdRvqRa+kBVFsCimgioV2hOk3SxUzA4
         9ghyXfk+naHEY8kGpHtBBNz3zf18FibztxuGB6i8pAQNjucSHmoK6GjCspuBw+i10f1Z
         PAB+fuVU8RlJeZlshz3IycxQ1HKOYhAyYgNbbxjSi3z5NtbuwILPl391E10isV3YnYcP
         swjMuo9Tw1yYZqMlsOkcYEexY/hsM64nerzDAmrvfCngKGjQqkU69x/Ubb0U4j/zeZca
         r0J9+/oAP7x12WZ1QjD+Zk/OYW6RLL8Oo5xNCVk+MNnJj0SU6KbIrJHFU7gduHEL80pR
         pjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480221; x=1786085021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gnCPTgzK0K1N6KmRazTWagiYgQDYqM7+kmHEqM+ZJpY=;
        b=NL7epWhguKJz4KF7GLKeGExxWrR6CrOBbSM4dS/IUdpyiDofXgI68ZxoguJHIOCwfs
         Vt9cFjRfoK6Lz1qL+3MRA8rBxypyqQuZElUaFzYwDKeg1fxPRj3nO+UoMUVn88EJJSsm
         oZC+PnM7+KvFb7iDVF6wwD+DXOqjc0p8jeI3Qt8eh8sjZ2dbLMKedtjJfiwXR/8dOkE9
         QQpAlScRGquE8DjGedujISBbNKI6b+BY25Z0YtTPRHw/G0p7YDOOx1eteV69d22Boox/
         hTz+uqjeFov73Bo7itVrSL4T833rAf4NXq/PG9NrppFmNBHkM+HjfjvOhvK1U9HVQlIx
         6DBg==
X-Forwarded-Encrypted: i=1; AHgh+RrXuRxamfaDB4hSRadM0RMheLMIuRRR2CRgkK/ZIXZyOlPu0qEYGFi6TajuQVqOVjRBZodglUFDF364UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHsrR4RKL5dr2YGhG70mlvk3AGCkUhlzboWKc6m8omIJsxNrSX
	GM36fhky0fNrzjcwnWLwwTXXJR+/LlSR6zkVqnS1mz4rhSFqvbS84NV4
X-Gm-Gg: AR+sD12ndprixotkBvUPBsVzLrFmC+hQ7LnVH9pGqp6SCpqdUt3aG0/jhmrwiRPWDmC
	o8xJULmWM9I0y0qaMsFmFBP4rp9Gog3q8YOesuE4qrGz6vAKxi40Bx3pngcNPuFN8ofJqzUFXFD
	1bcGC75yRsgL6+lnrDsE+e8+PJMhptv9HQeg/DU1v8Oj+3MMQhNbS+YKl5cdinqiUYS5xYZhnrp
	NyYGsg11ZigN0cvMqtj/dP4vm1+dYlUoZtD35ewc3e71x+cz5TaxLoQW1s3uhspDJ49fKRMPr+z
	L1nbbI9RiEwCykvm3U7pQJnXaTluVmxtUqKv8+431MgV1/w7WVRlNO6LrMj9eouMBGD/YWMjQUH
	9jRJPM0eTTi2E4eS8r6uqMbXE4RbOHfyVI9NuI/ChNKRHo5UFALXLZPIeQ7KI7uyIVGh1uMBv5b
	LlbFKClAVvKszsADGcZxPX7bNnt0cDdhmeg407KwNFp6WXea3NSmZl4myDNyLjNqdLd/wKqXi98
	hORS7Y0+5SgXr4nmpWMEkOB+ZHPGXClGFKQCzXRENo0XA/uggKjqA==
X-Received: by 2002:a05:6000:2889:b0:47f:9442:f753 with SMTP id ffacd0b85a97d-47fd2b5dbb3mr1767774f8f.52.1785480221395;
        Thu, 30 Jul 2026 23:43:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:40 -0700 (PDT)
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
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Fri, 31 Jul 2026 08:43:21 +0200
Message-ID: <20260731064326.2284228-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731064326.2284228-1-ansuelsmth@gmail.com>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0

