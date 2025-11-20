Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063A2F363C
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763681404; cv=none; b=FHrjD1A5LsAdmS9RVTqI6W6flimQ9KKWk9dJfD300yu0OokheXVnjV7PFfL5JK9u53tRhbWjevbARC6e8Y97XB8ViGL0VAcpFnZKZain7+uIvm1alMj5jzmpkXEHRWC0fl3OHGchGxSt0qj1kN9N8UZWAjFTmF6k9Inv4koV5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763681404; c=relaxed/simple;
	bh=hunFSs3zO/FdwbPTBz6ZDIaiUyPsRF5W3LVgIps/huI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUQ97CFTpzyVd0CZrSyLUTe3WOVxA1bO0K2skVbzLCbCvVZtTS2FDqKPY/rLbOtWQRSsiJEUOKH6KbqEHw8PFARRNNdDrDlO7X1vRaVbCYTRWvFYsoxb4mIEywumi99+h9a11LRw+djOigRr3B8x3P9HLVvEIQtVkHVTbEuUW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eznK7iXE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eznK7iXE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so843467f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681400; x=1764286200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=eznK7iXEpYbWXfjnyW3Np3NsZ6/tpEkqGHwavrZA+/J4g7Zu5FIk3Hy7Bcl5PnQI3m
         EmgdwIv6LKA7F0o/WyAOoOCtF9/AZEfCIq2E6OKQtTSazFk53UKJXAHNSEMxEo/y0X5s
         09wLjQnh70OSDn70DO0YyqjtmwNeVecc0LM1USk8D3qLp9/Gwx2mJZglOdKGAjBnT+sb
         0ugjIE6VxBeD6hbIiJYiMVeL1Jt4UPTO1sSZDvazUeBKskTVX7IxOs6BioiQXqr/lKpB
         qttNg6Q8f7dEt/8ZhNlGLFB3zA8w2Y/x7I8wi77F1/galB3D6kfstoaU6tVXlP3Nh4uu
         upRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681400; x=1764286200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=Q0cWafMoNlJUcC6F/l+TcsY+U1AA4kwtYVZV6pq7R1p4UFR8lht4GBkCkw9acDwjVi
         oB7r0TuVlDZQ+n8qLFeP26ThzqO9/PqtwbuxSPttVjGOvUMiK1ILqV94myM/X4Ng5tUa
         QJNqOwjy7lprve9PHgJPYrAzqmDgG1MtL7FCH76OTcFv+ctnqLjPHQtujVyuk7ORCcp0
         kmIdEMRarzUXEfEbAL+hG7CMQQwbdlBuuCqQ6SMWWcHiSEu92GOqK1WBCD23tAGrSN5/
         G5sC4yBKFNrapLBfOVm79/QAxEFKTlyHon93pNCXps8SUpnoirphn2nk7fIZbLboEnNU
         bQaA==
X-Forwarded-Encrypted: i=1; AJvYcCXYOHSj8wn2Wy+vI9lLcZ39o9VuJo5dWvVKdmw4HpKvtkiTo7xJ/jwQpGW0dVEpFe3zXqUPNErRJ3kMVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSkiXTLkqnTikFD5aty0hAp5q8Xh/6YTp4avwIpbCADJ+nyxM
	vbffskb8oE800hsYbO8d6MiZe4MT4vwQKUwR1AaZ80j2MSIQ/FphtsTU
X-Gm-Gg: ASbGncsiXJlNDGBWEZ+B/LiKp3FzZ6pdBsPNKMmTcbkBtO+AsdzywZSJsW7KIOQ9b4M
	FRcgoZx2pA8uS6PBTCTvoT0EpLpDfT3N3sDjbdk5UZSZZJ0pxqZctQ6H9b9ypD9u+lxNKtDGjrH
	CJaD2oz7lgFIc4YOdpCHDjhCMyphc9r1usqoeCMaRkefkU/i9yfc6X/27MzjwO4qdJbc512gkZw
	o/2yYWa9T/kaUtgW6GfadH1bZQ/w84yGlxN4ARbQtCLK806A+gaqtzl40ALfAKQ5XfFKfBcWQwn
	6C5eRWtqJJ70Q93+eKlIbbW8A/QvO18OSAHugnotbUTHk65iCCC6O2gkllJx+jneNhZ2/7ZPMUb
	OJi6rEWF1Oa1Ws4/7LPZ3Tivf8e2pUbFmGyZSv6mjO6E44I+dEZOM8lf/Z21C6wp8j+/M8M/0Zk
	+AfSp4qjSJmNioo0qGvoy+dpQom32mnoXWLx2sL+CP
X-Google-Smtp-Source: AGHT+IFkcSWktgO2c9cw3ZmsJgiZ5al3O9HH0pDkGB4u/dkR0XIinpd++pYOt4jbYtH4OgfnVILTXw==
X-Received: by 2002:a05:6000:2284:b0:42b:41d3:daf9 with SMTP id ffacd0b85a97d-42cc1cd5d3emr109924f8f.2.1763681400373;
        Thu, 20 Nov 2025 15:30:00 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:30:00 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
Date: Fri, 21 Nov 2025 00:29:10 +0100
Message-ID: <20251120232913.32532-2-ansuelsmth@gmail.com>
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

Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.

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
2.51.0

